#include <ap_axi_sdata.h>
#include <hls_stream.h>
#include <fstream>
#include <iostream>
typedef ap_axiu<32,0,0,0> axis_word;
void lstm_axis(hls::stream<axis_word>&,hls::stream<axis_word>&);
int main(){
 std::ifstream f("test_vectors.txt");int value,count=0;
 if(!f)return 2;
 while(f>>value){
  int32_t x[200],expected;x[0]=value;
  for(int j=1;j<200;++j)if(!(f>>x[j]))return 3;
  if(!(f>>expected))return 3;
  for(int repeat=0;repeat<2;++repeat){
   hls::stream<axis_word> in,out;
   for(int j=0;j<200;++j){axis_word w;w.data=(uint32_t)x[j];w.keep=15;w.strb=15;w.last=(j==199);in.write(w);}
   lstm_axis(in,out);if(out.empty())return 4;axis_word w=out.read();
   if((int32_t)(uint32_t)w.data!=expected || w.last!=1 || w.keep!=15 || !in.empty() || !out.empty())return 5;
  }++count;
 }
 std::cout<<"PASS "<<count<<" sequences, bit-exact Q12, stream framing and state reset\n";
 return count?0:6;
}
