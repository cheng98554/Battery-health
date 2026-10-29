// 编码: UTF-8
#pragma once
#include <stdint.h>
// Interleaved Q12 V0,I0,...,V99,I99. Return Q12 SOH ratio.
int32_t soh_accel(const int16_t input[200]);
