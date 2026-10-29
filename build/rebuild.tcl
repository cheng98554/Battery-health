set root [file dirname [file dirname [file normalize [info script]]]]
create_project nasa [file join $root work vivado] -part xc7z020clg400-2 -force
set_property ip_repo_paths [list [file join $root src hls_fast lstm_fast_hls solution1 impl ip]] [current_project]
update_ip_catalog
add_files [file join $root src hardware system.bd]
add_files -fileset constrs_1 [file join $root src hardware n.xdc]
open_bd_design [get_files system.bd]
validate_bd_design
 generate_target all [get_files system.bd]
add_files [make_wrapper -files [get_files system.bd] -top]
set_property top system_wrapper [current_fileset]
launch_runs synth_1 -jobs 4
wait_on_run synth_1
launch_runs impl_1 -to_step route_design -jobs 4
wait_on_run impl_1
open_run impl_1
report_timing_summary -file [file join $root build reports rebuilt_timing.rpt]
report_utilization -file [file join $root build reports rebuilt_utilization.rpt]
