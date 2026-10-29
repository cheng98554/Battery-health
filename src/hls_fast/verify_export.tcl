set here [file dirname [file normalize [info script]]]
cd $here
open_project [file join $here lstm_fast_hls]
set_top lstm_axis
open_solution solution1 -flow_target vivado
add_files -tb test_axis.cpp -cflags "-DRTL_SMOKE_TEST"
add_files -tb test_vectors_rtl.txt
cosim_design -rtl verilog -tool xsim
export_design -format ip_catalog -rtl verilog -output ../lstm_fast_ip.zip
exit
