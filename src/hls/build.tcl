set here [file dirname [file normalize [info script]]]
cd $here
open_project [file join $::env(NASA_BUILD_DIR) hls]
set_top lstm_axis
open_solution solution1 -flow_target vivado
add_files lstm_axis.cpp
add_files soh_accel.cpp
add_files -tb test_axis.cpp -cflags ""
add_files -tb test_vectors.txt
set_part xc7z020clg400-2
create_clock -period 10 -name default
config_compile -pipeline_loops 0
csim_design
csynth_design
export_design -format ip_catalog -rtl verilog -output [file join $::env(NASA_BUILD_DIR) lstm_ip.zip]
exit
