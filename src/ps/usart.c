#include "usart.h"
#include "bspconfig.h"
#include "xil_exception.h"
#include "xuartps_hw.h"
#include "xuartps.h"
#include "xinterrupt_wrap.h"

static XUartPs Uart; // 串口实例由本模块管理
static int UartReady; // 初始化成功后才允许发送
static volatile int RxOverflow;
static uint32_t RxCount;
static uint8_t RxLast[5];

static struct {
    uint16_t head, tail, length;
    uint8_t data[RINGBUFFER_LEN];
} ring;

static void UartHandler(void *Ref) // 接收中断：将FIFO数据写入环形缓冲区
{
    (void)Ref;
    UART_Poll();
}

int UART_Init(void) // 初始化串口，115200、8N1，支持接收中断
{
    XUartPs_Config *cfg = XUartPs_LookupConfig(STDOUT_BASEADDRESS); // 查找UART0配置
    UartReady = 0; // 初始化失败时禁止发送
    if (cfg == NULL || XUartPs_CfgInitialize(&Uart, cfg, cfg->BaseAddress) != XST_SUCCESS)
        return XST_FAILURE; // 配置不存在或初始化失败
    XUartPs_SetInterruptMask(&Uart, 0); // 关闭串口中断
    XUartPs_SetOperMode(&Uart, XUARTPS_OPER_MODE_NORMAL); // 正常收发模式
    if (XUartPs_SetBaudRate(&Uart, 115200) != XST_SUCCESS) // 设置屏幕通信波特率
        return XST_FAILURE;
    /* CfgInitialize already selects 8N1. Match the working i2c init sequence;
       SetDataFormat would call SetBaudRate again and reset both FIFOs. */
    XUartPs_SetFifoThreshold(&Uart, 1); // FIFO收到1字节即触发中断
    XUartPs_WriteReg(cfg->BaseAddress, XUARTPS_ISR_OFFSET, XUARTPS_IXR_MASK); // 清除残留标志
    initRingBuffer(); // 开启接收中断前清空缓冲区
    RxCount = 0;
    for (unsigned j = 0; j < 5; ++j) RxLast[j] = 0;
    if (XSetupInterruptSystem(&Uart, UartHandler, cfg->IntrId, // 注册接收处理函数及实例
                             cfg->IntrParent, XINTERRUPT_DEFAULT_PRIORITY) != XST_SUCCESS)
        return XST_FAILURE; // 中断初始化失败
    UartReady = 1; // 允许发送
    XUartPs_SetInterruptMask(&Uart, XUARTPS_IXR_RXOVR); // 开启接收阈值中断
    return XST_SUCCESS;
}

/* Preserve IRQ state, including when called from the UART ISR. */
static u32 lock(void)
{
    u32 state = mfcpsr();
    Xil_ExceptionDisable();
    __asm__ volatile ("" ::: "memory");
    return state;
}

static void unlock(u32 state)
{
    __asm__ volatile ("" ::: "memory");
    mtcpsr(state);
}

void UART_Poll(void)
{
    if (!UartReady) return;
    /* Avoid ISR/main racing between the FIFO empty check and blocking read. */
    u32 state = lock();
    UINTPTR base = Uart.Config.BaseAddress;
    XUartPs_WriteReg(base, XUARTPS_ISR_OFFSET, XUARTPS_IXR_RXOVR);
    while (XUartPs_IsReceiveData(base))
        write1ByteToRingBuffer(XUartPs_RecvByte(base));
    unlock(state);
}

uint32_t UART_GetRxSnapshot(uint8_t last[5])
{
    u32 state = lock();
    uint32_t count = RxCount;
    for (unsigned j = 0; j < 5; ++j) last[j] = RxLast[j];
    unlock(state);
    return count;
}

void intToStr(int num, char *str)
{
    unsigned int value = num < 0 ? 0U - (unsigned int)num : (unsigned int)num;
    int i = 0, j;
    if (str == 0) return;
    do {
        str[i++] = (char)('0' + value % 10U);
        value /= 10U;
    } while (value);
    if (num < 0) str[i++] = '-';
    str[i] = '\0';
    for (j = 0; j < i / 2; ++j) {
        char ch = str[j];
        str[j] = str[i - 1 - j];
        str[i - 1 - j] = ch;
    }
}

void uart_send_char(char ch)
{
    if (UartReady) // 仅在初始化成功后发送
        XUartPs_SendByte(Uart.Config.BaseAddress, (u8)ch);
}

void uart_send_string(const char *str)
{
    if (str != 0)
        while (*str) uart_send_char(*str++);
}

static void tjc_end(void)
{
    uart_send_char((char)0xff);
    uart_send_char((char)0xff);
    uart_send_char((char)0xff);
}

void tjc_send_string(const char *str)
{
    if (str == 0) return;
    uart_send_string(str);
    tjc_end();
}

void tjc_send_txt(const char *objname, const char *attribute, const char *txt)
{
    if (objname == 0 || attribute == 0 || txt == 0) return;
    uart_send_string(objname);
    uart_send_char('.');
    uart_send_string(attribute);
    uart_send_char('=');
    uart_send_char('"');
    uart_send_string(txt);
    uart_send_char('"');
    tjc_end();
}

void tjc_send_val(const char *objname, const char *attribute, int val)
{
    char txt[12];
    if (objname == 0 || attribute == 0) return;
    intToStr(val, txt);
    uart_send_string(objname);
    uart_send_char('.');
    uart_send_string(attribute);
    uart_send_char('=');
    uart_send_string(txt);
    tjc_end();
}

void tjc_send_wave(const char *str, int val)
{
    char txt[12];
    if (str == 0) return;
    intToStr(val, txt);
    uart_send_string(str);
    uart_send_string(txt);
    tjc_end();
}

void initRingBuffer(void)
{
    u32 state = lock();
    ring.head = ring.tail = ring.length = 0;
    RxOverflow = 0;
    unlock(state);
}

void write1ByteToRingBuffer(uint8_t data)
{
    u32 state = lock();
    ++RxCount;
    for (unsigned j = 0; j < 4; ++j) RxLast[j] = RxLast[j + 1];
    RxLast[4] = data;
    if (ring.length < RINGBUFFER_LEN) {
        ring.data[ring.tail] = data;
        ring.tail = (ring.tail + 1U) % RINGBUFFER_LEN;
        ++ring.length;
    } else RxOverflow = 1;
    unlock(state);
}

void deleteRingBuffer(uint16_t size)
{
    u32 state = lock();
    if (size > ring.length) size = ring.length;
    ring.head = (ring.head + size) % RINGBUFFER_LEN;
    ring.length -= size;
    unlock(state);
}

uint8_t read1ByteFromRingBuffer(uint16_t position)
{
    u32 state = lock();
    uint8_t data = position < ring.length
        ? ring.data[(ring.head + position) % RINGBUFFER_LEN] : 0;
    unlock(state);
    return data;
}

uint16_t getRingBufferLength(void)
{
    u32 state = lock();
    uint16_t length = ring.length;
    unlock(state);
    return length;
}

uint8_t isRingBufferOverflow(void)
{
    return getRingBufferLength() < RINGBUFFER_LEN;
}

int UART_TakeOverflow(void)
{
    u32 state = lock();
    int overflow = RxOverflow;
    if (overflow) {
        ring.head = ring.tail = ring.length = 0;
        RxOverflow = 0;
    }
    unlock(state);
    return overflow;
}
