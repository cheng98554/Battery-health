#ifndef I2C_H
#define I2C_H

#include "xil_types.h" // u16类型定义，使头文件可独立包含

unsigned IicLastError(void); // 失败步骤，0表示成功
int IicInit(void); // 初始化IIC模块内部的控制器实例
int Sample(u16 *vbus, u16 *current); // 单次采样，失败时复位控制器并返回失败

#endif
