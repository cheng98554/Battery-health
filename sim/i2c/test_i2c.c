#include <assert.h>
#include <stdio.h>
#include "../../src/ps/i2c.c"
static XTime ticks;
static unsigned pos, resets;
static int fault, busy, send_fail, active;
static u32 control;
static u16 sensor[8] = {[1]=200, [2]=3200, [4]=100, [5]=1024, [6]=8};
static u8 selected;
static XIicPs_Config cfg;
XIicPs_Config *XIicPs_LookupConfig(UINTPTR b) { (void)b; return &cfg; }
int XIicPs_CfgInitialize(XIicPs *p, XIicPs_Config *c, UINTPTR b) { (void)b; p->Config=*c; return 0; }
int XIicPs_BusIsBusy(XIicPs *p) { (void)p; return busy; }
int XIicPs_MasterSendPolled(XIicPs *p, u8 *d, int n, u16 a) {
    (void)p; assert(a==0x40); if(send_fail) return 1;
    selected=d[0]; if(n==3) sensor[selected]=(u16)((d[1]<<8)|d[2]); return 0;
}
int XIicPs_SetOptions(XIicPs *p, u32 o) { (void)p;(void)o;control|=XIICPS_CR_HOLD_MASK;return 0; }
int XIicPs_ClearOptions(XIicPs *p, u32 o) { (void)p;(void)o;return 0; }
int XIicPs_SetSClk(XIicPs *p, u32 s) { (void)p;assert(s==100000);return 0; }
int XIicPs_SetupMaster(XIicPs *p, int r) { (void)p;assert(r==RECVING_ROLE);return 0; }
void XIicPs_Reset(XIicPs *p) { (void)p;resets++;control=0;active=0; }
void XTime_GetTime(XTime *t) { ticks+=100;*t=ticks; }
void usleep(unsigned long t) { ticks+=t; }
u32 XIicPs_ReadReg(UINTPTR b,u32 r) {
    (void)b;
    if(r==XIICPS_CR_OFFSET) return control;
    if(r==XIICPS_ISR_OFFSET) {
        if(fault==3) return XIICPS_IXR_NACK_MASK;
        if(fault==4) return XIICPS_IXR_TO_MASK;
        return (!fault && pos==2) ? XIICPS_IXR_COMP_MASK : 0;
    }
    if(r==XIICPS_SR_OFFSET) return active && !(control & XIICPS_CR_HOLD_MASK) &&
        pos<(fault==1 ? 0U : fault==2 ? 1U : 2U) ? XIICPS_SR_RXDV_MASK : 0;
    if(r==XIICPS_DATA_OFFSET) { assert(pos<2);return pos++==0 ? sensor[selected]>>8 : sensor[selected]&255; }
    return 0;
}
void XIicPs_WriteReg(UINTPTR b,u32 r,u32 v) {
    (void)b;
    if(r==XIICPS_CR_OFFSET) control=v;
    if(r==XIICPS_TRANS_SIZE_OFFSET) assert(v==2);
    if(r==XIICPS_ADDR_OFFSET) { assert(v==0x40);pos=0;active=1; }
}
int main(void) {
    u16 v=0,c=0;
    assert(IicInit()==0);
    for(int n=0;n<450;n++) assert(Sample(&v,&c)==0 && v==3200 && c==100);
    for(fault=1;fault<=5;fault++) {
        XTime start=ticks; unsigned before=resets;
        v=0xaaaa;c=0xbbbb;
        assert(Sample(&v,&c)!=0 && resets==before+1 && ticks-start<30000);
        assert(v==0xaaaa && c==0xbbbb && control==0);
    }
    fault=0;
    for(int n=450;n<4000;n++) assert(Sample(&v,&c)==0 && v==3200 && c==100);
    busy=1; XTime start=ticks; assert(Sample(&v,&c)!=0 && ticks-start<=110000);busy=0;
    send_fail=1;assert(Sample(&v,&c)!=0);send_fail=0;
    assert(Sample(&v,&c)==0);
    puts("PASS: 4000 samples; missing/partial RX, NACK, hardware timeout, missing completion, busy bus and retry recovery");
}
