#include "lstm_protocol.h"
uint32_t lstm_crc32(const void *data,size_t length) {
    const uint8_t *p=(const uint8_t*)data;
    uint32_t crc=0xffffffffU;
    for(size_t i=0;i<length;i++) {
        crc^=p[i];
        for(int b=0;b<8;b++) crc=(crc>>1)^((0U-(crc&1U))&0xedb88320U);
    }
    return crc^0xffffffffU;
}
uint32_t lstm_get_u32(const uint8_t *p) {
    return (uint32_t)p[0]|((uint32_t)p[1]<<8)|((uint32_t)p[2]<<16)|((uint32_t)p[3]<<24);
}
void lstm_put_u32(uint8_t *p,uint32_t v) {
    for(int i=0;i<4;i++) p[i]=(uint8_t)(v>>(8*i));
}

