#ifndef USART_H
#define USART_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define RINGBUFFER_LEN 500
#define LENGTH 5

int UART_Init(void); // 初始化UART0，115200、8N1，支持接收中断
int UART_TakeOverflow(void); // 溢出时丢弃不完整的接收队列，返回1
void UART_Poll(void); // 中断未触发时，由主循环取出硬件FIFO中的数据
uint32_t UART_GetRxSnapshot(uint8_t last[5]); // 收到的总字节数和最近5字节
void intToStr(int num, char *str);
void uart_send_char(char ch);
void uart_send_string(const char *str);
void tjc_send_string(const char *str);
void tjc_send_txt(const char *objname, const char *attribute, const char *txt);
void tjc_send_val(const char *objname, const char *attribute, int val);
void tjc_send_wave(const char *str, int val);
/* Static storage starts empty. Reset only when discarding pending RX data. */
void initRingBuffer(void);
void write1ByteToRingBuffer(uint8_t data);
void deleteRingBuffer(uint16_t size);
uint16_t getRingBufferLength(void);
/* Peek without removing; returns zero for an out-of-range position. */
uint8_t read1ByteFromRingBuffer(uint16_t position);
/* Original convention: 1 means space available, 0 means full. */
uint8_t isRingBufferOverflow(void);

#define usize getRingBufferLength()
#define code_c() initRingBuffer()
#define udelete(x) deleteRingBuffer(x)
#define u(x) read1ByteFromRingBuffer(x)

#ifdef __cplusplus
}
#endif
#endif
