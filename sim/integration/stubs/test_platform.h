#ifndef TEST_PLATFORM_H
#define TEST_PLATFORM_H
#include <stdint.h>
#include <stddef.h>
typedef uint8_t u8;
typedef uint16_t u16;
typedef int16_t s16;
typedef uint32_t u32;
typedef uint64_t u64;
typedef uintptr_t UINTPTR;
typedef uint64_t XTime;
#define XST_SUCCESS 0
#define XST_FAILURE 1
#define COUNTS_PER_SECOND 1000000U
#define STDOUT_BASEADDRESS 0xe0000000U
#define XPAR_XAXIDMA_0_BASEADDR 0x40400000U
#define XAXIDMA_DEVICE_TO_DMA 1
#define XAXIDMA_DMA_TO_DEVICE 0
#define XAXIDMA_TX_OFFSET 0U
#define XAXIDMA_RX_OFFSET 0x30U
#define XAXIDMA_SR_OFFSET 4U
#define XAXIDMA_ERR_ALL_MASK 0x70U
#define XAXIDMA_IRQ_ALL_MASK 0x7000U
typedef struct { UINTPTR RegBase; } XAxiDma;
typedef struct { UINTPTR BaseAddress; } XAxiDma_Config;
XAxiDma_Config *XAxiDma_LookupConfig(UINTPTR);
int XAxiDma_CfgInitialize(XAxiDma *, XAxiDma_Config *);
int XAxiDma_HasSg(XAxiDma *);
void XAxiDma_IntrDisable(XAxiDma *, u32, int);
int XAxiDma_SimpleTransfer(XAxiDma *, UINTPTR, u32, int);
u32 XAxiDma_ReadReg(UINTPTR, u32);
int XAxiDma_Busy(XAxiDma *, int);
u32 Xil_In32(UINTPTR);
void Xil_Out32(UINTPTR, u32);
void Xil_DCacheFlushRange(UINTPTR, u32);
void Xil_DCacheInvalidateRange(UINTPTR, u32);
void XTime_GetTime(XTime *);
void usleep(unsigned long);

#define XUARTPS_OPER_MODE_NORMAL 0
#define XUARTPS_FORMAT_8_BITS 8
#define XUARTPS_FORMAT_NO_PARITY 0
#define XUARTPS_FORMAT_1_STOP_BIT 1
#define XUARTPS_ISR_OFFSET 0x14U
#define XUARTPS_IXR_RXOVR 1U
#define XUARTPS_IXR_MASK 0x1fffU
#define XINTERRUPT_DEFAULT_PRIORITY 0xa0U
typedef struct { UINTPTR BaseAddress; u32 IntrId; UINTPTR IntrParent; } XUartPs_Config;
typedef struct { XUartPs_Config Config; } XUartPs;
typedef struct { u32 BaudRate; u32 DataBits; u32 Parity; u32 StopBits; } XUartPsFormat;
XUartPs_Config *XUartPs_LookupConfig(UINTPTR);
int XUartPs_CfgInitialize(XUartPs *, XUartPs_Config *, UINTPTR);
void XUartPs_SetInterruptMask(XUartPs *, u32);
void XUartPs_SetOperMode(XUartPs *, u32);
int XUartPs_SetBaudRate(XUartPs *, u32);
int XUartPs_SetDataFormat(XUartPs *, XUartPsFormat *);
void XUartPs_SetFifoThreshold(XUartPs *, u8);
void XUartPs_WriteReg(UINTPTR, u32, u32);
int XUartPs_IsReceiveData(UINTPTR);
u8 XUartPs_RecvByte(UINTPTR);
void XUartPs_SendByte(UINTPTR, u8);
int XSetupInterruptSystem(void *, void (*)(void *), u32, UINTPTR, u32);
#define mfcpsr() 0U
#define mtcpsr(s) ((void)(s))
#define Xil_ExceptionDisable() ((void)0)

typedef unsigned int UINT;
typedef size_t FSIZE_t;
typedef int FRESULT;
typedef struct { int mounted; } FATFS;
typedef struct { FSIZE_t position; int mode; } FIL;
#define FR_OK 0
#define FR_DISK_ERR 1
#define FR_INT_ERR 2
#define FR_NOT_READY 3
#define FR_NO_FILE 4
#define FR_DENIED 7
#define FR_EXIST 8
#define FA_READ 1
#define FA_WRITE 2
#define FA_CREATE_NEW 4
#define f_tell(f) ((f)->position)
FRESULT f_mount(FATFS *, const char *, int);
FRESULT f_open(FIL *, const char *, int);
FRESULT f_read(FIL *, void *, UINT, UINT *);
FRESULT f_write(FIL *, const void *, UINT, UINT *);
FRESULT f_lseek(FIL *, FSIZE_t);
FRESULT f_truncate(FIL *);
FRESULT f_sync(FIL *);
FRESULT f_close(FIL *);
FRESULT f_rename(const char *, const char *);
FRESULT f_unlink(const char *);
#endif
