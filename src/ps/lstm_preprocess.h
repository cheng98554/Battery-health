// 编码: UTF-8
#pragma once
#include <stdint.h>
#include <math.h>
static const double FEATURE_MEAN[2] = {4.1531190872192383,0.67362892627716064};
static const double FEATURE_STD[2] = {0.10589761286973953,0.57676726579666138};
static inline int16_t round_even_q12(double x) {
 double f=floor(x),r=x-f; long n=(long)f; if(r>0.5 || (r==0.5 && n%2!=0)) ++n; return (int16_t)n;
}
static inline int nasa_preprocess(const double curves[2][4000],int16_t x[200]) {
 if(!curves || !x) return -1;
 for(int t=0;t<100;++t) for(int ch=0;ch<2;++ch) {
  double s=0; for(int k=0;k<40;++k) { double v=curves[ch][t*40+k]; if(!isfinite(v)) return -2; s+=v; }
  double z=(s/40-FEATURE_MEAN[ch])/FEATURE_STD[ch];
  if(z < -8) z=-8;
  if(z > 32767.0/4096) z=32767.0/4096;
  x[t*2+ch]=round_even_q12(z*4096);
 }
    return 0;
}

