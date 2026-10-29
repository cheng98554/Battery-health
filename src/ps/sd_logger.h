#ifndef SD_LOGGER_H
#define SD_LOGGER_H

#include "xil_types.h"

double SD_CalibrateCurrent(s16 raw_ma); // 拟合电流，单位A
int SD_Resample(void); // 关闭后重采样4000点，原始数据保留为.raw
int SD_Start(u16 num); // 创建0:/<num>.txt，同名文件存在时返回失败
int SD_Stop(void); // 刷新并关闭当前文件
int SD_Append(u16 vbus, s16 current); // 写入电压V和电流A，传入INA226原始值
int SD_IsRecording(void); // 是否仍在采集
unsigned int SD_PointCount(void); // 已写入的完整点数
int SD_LastError(void); // 最近的FatFs错误码，0表示成功，可在调试器查看

#endif
