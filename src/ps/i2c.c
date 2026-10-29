#include "i2c.h" // 模块对外接口
#include "xparameters.h" // 硬件地址等平台参数
#include "xiicps.h" // Zynq PS IIC 驱动
#include "xiicps_xfer.h"
#include "xiltimer.h"
#include "sleep.h" // 微秒延时函数

#define INA226_ADDR  0x40U // 7位器件地址：A0/A1接地；SCL接Y7，SDA接U5
#define INA226_CAL   1024U // 0.005Ω，1mA/bit：0.00512/(0.005*0.001)=1024

static unsigned sample_error;
unsigned IicLastError(void) { return sample_error; }
static XIicPs Iic; // IIC控制器实例

int IicInit(void) // 初始化采样函数实际使用的实例
{
    XIicPs_Config *cfg = XIicPs_LookupConfig(XPAR_XIICPS_0_BASEADDR); // 查找IIC0配置
    if (cfg == NULL) // 配置不存在时返回失败
        return XST_FAILURE;
    return XIicPs_CfgInitialize(&Iic, cfg, cfg->BaseAddress); // 初始化模块内部实例
}

static int WaitIdle(void) // 等待总线空闲，超时返回失败
{
    for (int n = 0; n < 10000; ++n) { // 最多轮询10000次，间隔10us
        if (!XIicPs_BusIsBusy(&Iic)) // 总线未被占用
            return XST_SUCCESS; // 返回成功
        usleep(10); // 延时后再次检查
    }
    return XST_FAILURE; // 总线等待超时
}

static int WriteReg(u8 reg, u16 value) // 写入16位寄存器并检查结果
{
    u8 data[3] = {reg, (u8)(value >> 8), (u8)value}; // 地址、高字节、低字节
    if (WaitIdle() != XST_SUCCESS || // 等待总线空闲
        XIicPs_MasterSendPolled(&Iic, data, 3, INA226_ADDR) != XST_SUCCESS) // 检查发送状态
        return XST_FAILURE; // 等待或发送失败
    return WaitIdle(); // 确认总线已释放
}

/* INA226 reads are always two bytes. The BSP polled receive has no software
 * deadline, so use a bounded FIFO read here without modifying the BSP. */
static int ReceiveWord(u8 data[2])
{
    UINTPTR base = Iic.Config.BaseAddress;
    const u32 errors = XIICPS_IXR_ARB_LOST_MASK | XIICPS_IXR_RX_OVR_MASK |
        XIICPS_IXR_RX_UNF_MASK | XIICPS_IXR_NACK_MASK | XIICPS_IXR_TO_MASK;
    XTime start, now;
    unsigned count = 0;
    if (XIicPs_SetupMaster(&Iic, RECVING_ROLE) != XST_SUCCESS)
        return XST_FAILURE;
    XIicPs_WriteReg(base, XIICPS_ISR_OFFSET, XIICPS_IXR_ALL_INTR_MASK);
    XIicPs_WriteReg(base, XIICPS_TRANS_SIZE_OFFSET, 2U);
    XTime_GetTime(&start);
    XIicPs_WriteReg(base, XIICPS_ADDR_OFFSET, INA226_ADDR);
    /* Release the HOLD left by the register-address write after starting RX. */
    XIicPs_WriteReg(base, XIICPS_CR_OFFSET,
                   XIicPs_ReadReg(base, XIICPS_CR_OFFSET) & ~XIICPS_CR_HOLD_MASK);
    for (;;) {
        u32 status = XIicPs_ReadReg(base, XIICPS_ISR_OFFSET);
        if (status & errors) return XST_FAILURE;
        if (count < 2U && (XIicPs_ReadReg(base, XIICPS_SR_OFFSET) & XIICPS_SR_RXDV_MASK))
            data[count++] = (u8)XIicPs_ReadReg(base, XIICPS_DATA_OFFSET);
        if (count == 2U && (status & XIICPS_IXR_COMP_MASK)) return XST_SUCCESS;
        XTime_GetTime(&now);
        if (now - start >= (XTime)COUNTS_PER_SECOND / 50U) return XST_FAILURE; /* 20 ms */
    }
}

static int ReadReg(u8 reg, u16 *value) // 成功时才更新输出参数
{
    u8 data[2]; // 保存接收数据
    int status; // 保存地址发送状态
    if (WaitIdle() != XST_SUCCESS) // 读取前等待总线空闲
        return XST_FAILURE; // 总线超时
    status = XIicPs_SetOptions(&Iic, XIICPS_REP_START_OPTION); // 写地址后保持总线
    if (status == XST_SUCCESS) // 设置成功才发送
        status = XIicPs_MasterSendPolled(&Iic, &reg, 1, INA226_ADDR); // 发送寄存器地址
    (void)XIicPs_ClearOptions(&Iic, XIICPS_REP_START_OPTION); // 接收完成后产生STOP
    if (status != XST_SUCCESS || // 地址发送失败不继续读取
        ReceiveWord(data) != XST_SUCCESS || // 带20ms超时的两字节读取
        WaitIdle() != XST_SUCCESS) // 检查总线空闲
        return XST_FAILURE; // 本次数据无效
    *value = ((u16)data[0] << 8) | data[1]; // 仅成功时组合并保存数据
    return XST_SUCCESS; // 读取成功
}

static int SampleOnce(u16 *vbus, u16 *current) // 模块内部的单次采样与校验
{
    u16 flags, cal, shunt, check; // 状态、校准及交叉校验数据
    sample_error = 1;
    if (WriteReg(0x05, INA226_CAL) != XST_SUCCESS) return XST_FAILURE;
    sample_error = 2;
    if (WriteReg(0x00, 0x4123) != XST_SUCCESS) return XST_FAILURE;
    for (int n = 0; n < 100; ++n) {
        usleep(1000);
        sample_error = 3;
        if (ReadReg(0x06, &flags) != XST_SUCCESS) return XST_FAILURE;
        sample_error = 4;
        if (flags & 0x0004U) return XST_FAILURE;
        if (!(flags & 0x0008U)) continue;
        sample_error = 5;
        if (ReadReg(0x05, &cal) != XST_SUCCESS) return XST_FAILURE;
        sample_error = 6;
        if (cal != INA226_CAL) return XST_FAILURE;
        sample_error = 7;
        if (ReadReg(0x02, vbus) != XST_SUCCESS) return XST_FAILURE;
        sample_error = 8;
        if (ReadReg(0x01, &shunt) != XST_SUCCESS) return XST_FAILURE;
        sample_error = 9;
        if (ReadReg(0x04, current) != XST_SUCCESS) return XST_FAILURE;
        sample_error = 10;
        if (ReadReg(0x02, &check) != XST_SUCCESS) return XST_FAILURE;
        sample_error = 11;
        if (check != *vbus) return XST_FAILURE;
        sample_error = 12;
        int diff = (int)(s16)*current * 2 - (int)(s16)shunt;
        if (diff < -1 || diff > 1) return XST_FAILURE;
        sample_error = 0;
        return XST_SUCCESS;
    }
    sample_error = 13;
    return XST_FAILURE;
}

int Sample(u16 *vbus, u16 *current) // 对外采样接口，使用同一个已初始化实例
{
    if (vbus == NULL || current == NULL) // 检查输出指针
        return XST_FAILURE;
    sample_error = 14;
    if (XIicPs_SetSClk(&Iic, 100000) == XST_SUCCESS && // 设置时钟，恢复复位后的配置
        SampleOnce(vbus, current) == XST_SUCCESS)
        return XST_SUCCESS;
    XIicPs_Reset(&Iic); // 失败则复位，下次调用继续尝试
    return XST_FAILURE;
}
