#include <ap_axi_sdata.h>
#include <hls_stream.h>
#include "soh_accel.h"
typedef ap_axiu<32,0,0,0> axis_word;
void lstm_axis(hls::stream<axis_word>& s_axis,hls::stream<axis_word>& m_axis) {
#pragma HLS INTERFACE axis port=s_axis
#pragma HLS INTERFACE axis port=m_axis
#pragma HLS INTERFACE s_axilite port=return bundle=control
 int16_t x[200];
 for(int j=0;j<200;++j) {
#pragma HLS PIPELINE II=1
  axis_word w=s_axis.read(); x[j]=(int16_t)(uint16_t)w.data;
 }
 int32_t result=soh_accel(x);
 axis_word out; out.data=(uint32_t)result;out.keep=15;out.strb=15;out.last=1;
 m_axis.write(out);
}
