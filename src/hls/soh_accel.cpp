// 编码: UTF-8
#include "soh_accel.h"
#include "weights.h"

static int32_t activate(int32_t x,const int16_t table[1025]) {
    if(x < -32768) x=-32768;
    if(x > 32768) x=32768;
    int32_t u=x+32768,idx=u>>6;
    if(idx>1023) idx=1023;
    int32_t frac=u-(idx<<6);
    return table[idx]+(((int32_t)(table[idx+1]-table[idx])*frac)>>6);
}

int32_t soh_accel(const int16_t input[200]) {
    int16_t x[200];
    int32_t h[16]={0},c[16]={0},total[16]={0};
    int32_t a[64];
    copy_input: for(int j=0;j<200;++j) x[j]=input[j];
    timesteps: for(int t=0;t<100;++t) {
        // Finish all gates using the previous h before updating any hidden unit.
        gates: for(int k=0;k<64;++k) {
            int64_t acc=BIAS[k];
            inputs: for(int j=0;j<2;++j) {
#pragma HLS PIPELINE II=1
                acc+=(int32_t)x[t*2+j]*WI[k][j];
            }
            recurrent: for(int j=0;j<16;++j) {
#pragma HLS PIPELINE II=1
                acc+=(int64_t)h[j]*WH[k][j];
            }
            a[k]=(int32_t)(acc>>12);
        }
        update_state: for(int j=0;j<16;++j) {
            int32_t i=activate(a[j],SIGMOID);
            int32_t f=activate(a[16+j],SIGMOID);
            int32_t g=activate(a[32+j],TANH);
            int32_t o=activate(a[48+j],SIGMOID);
            c[j]=(int32_t)(((int64_t)f*c[j]+(int64_t)i*g)>>12);
            h[j]=(int32_t)(((int64_t)o*activate(c[j],TANH))>>12);
            total[j]+=h[j];
        }
    }
    int64_t acc=BO[0];
    output_head: for(int j=0;j<16;++j) {
        // C division truncates toward zero; reference mean uses floor division.
        int32_t pooled=total[j]>=0 ? total[j]/100 : -((-total[j]+99)/100);
        acc+=(int64_t)pooled*WO[0][j];
    }
    return (int32_t)(acc>>12);
}