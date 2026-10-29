#ifndef LSTM_PROTOCOL_H
#define LSTM_PROTOCOL_H
#include <stddef.h>
#include <stdint.h>
uint32_t lstm_crc32(const void *data, size_t length);
uint32_t lstm_get_u32(const uint8_t *p);
void lstm_put_u32(uint8_t *p,uint32_t value);
#endif

