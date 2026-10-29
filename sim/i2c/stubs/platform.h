#ifndef IIC_TEST_H
#define IIC_TEST_H
#include <stdint.h>
#include <stddef.h>
typedef uint8_t u8;
typedef uint16_t u16;
typedef int16_t s16;
typedef uint32_t u32;
typedef uintptr_t UINTPTR;
typedef uint64_t XTime;
#define XST_SUCCESS 0
#define XST_FAILURE 1
#define COUNTS_PER_SECOND 1000000U
#define XPAR_XIICPS_0_BASEADDR 0
#define XIICPS_REP_START_OPTION 1
#define RECVING_ROLE 0
#include "iic_registers.h"
typedef struct { UINTPTR BaseAddress; } XIicPs_Config;
typedef struct { XIicPs_Config Config; } XIicPs;
XIicPs_Config *XIicPs_LookupConfig(UINTPTR);
int XIicPs_CfgInitialize(XIicPs *, XIicPs_Config *, UINTPTR);
int XIicPs_BusIsBusy(XIicPs *);
int XIicPs_MasterSendPolled(XIicPs *, u8 *, int, u16);
int XIicPs_SetOptions(XIicPs *, u32);
int XIicPs_ClearOptions(XIicPs *, u32);
int XIicPs_SetSClk(XIicPs *, u32);
int XIicPs_SetupMaster(XIicPs *, int);
void XIicPs_Reset(XIicPs *);
u32 XIicPs_ReadReg(UINTPTR, u32);
void XIicPs_WriteReg(UINTPTR, u32, u32);
void XTime_GetTime(XTime *);
void usleep(unsigned long);
#endif
