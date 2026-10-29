// 编码: UTF-8
#include "soh_accel.h"
#include "weights.h"

static int32_t activate(int32_t x,const int16_t table[1025]) {
#pragma HLS INLINE
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
#pragma HLS ARRAY_PARTITION variable=h complete dim=1
#pragma HLS ARRAY_PARTITION variable=WH complete dim=2
#pragma HLS ARRAY_PARTITION variable=WI complete dim=2
    copy_input: for(int j=0;j<200;++j) {
#pragma HLS PIPELINE II=1
        x[j]=input[j];
    }
    timesteps: for(int t=0;t<100;++t) {
        // Finish all gates using the previous h before updating any hidden unit.
        // Independent gates share the previous hidden state. Process one gate
        // per cycle using 16 parallel recurrent products and a balanced tree.
        gates: for(int k=0;k<64;++k) {
#pragma HLS PIPELINE II=1
            int64_t products[16],sum8[8],sum4[4],sum2[2];
#pragma HLS ARRAY_PARTITION variable=products complete
#pragma HLS ARRAY_PARTITION variable=sum8 complete
#pragma HLS ARRAY_PARTITION variable=sum4 complete
#pragma HLS ARRAY_PARTITION variable=sum2 complete
            recurrent: for(int j=0;j<16;++j) {
#pragma HLS UNROLL
                products[j]=(int64_t)h[j]*WH[k][j];
            }
            reduce8: for(int j=0;j<8;++j) {
#pragma HLS UNROLL
                sum8[j]=products[2*j]+products[2*j+1];
            }
            reduce4: for(int j=0;j<4;++j) {
#pragma HLS UNROLL
                sum4[j]=sum8[2*j]+sum8[2*j+1];
            }
            reduce2: for(int j=0;j<2;++j) {
#pragma HLS UNROLL
                sum2[j]=sum4[2*j]+sum4[2*j+1];
            }
            int64_t acc=BIAS[k]+sum2[0]+sum2[1]
                +(int64_t)x[t*2]*WI[k][0]
                +(int64_t)x[t*2+1]*WI[k][1];
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