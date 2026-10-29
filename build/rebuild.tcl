if {$argc != 3} {error "Usage: root output jobs"}
lassign $argv root out jobs
proc check_run {name} {
 set status [get_property STATUS [get_runs $name]]
 if {![string match "*Complete*" $status]} {error "$name failed: $status"}
}
create_project nasa [file join $out vivado] -part xc7z020clg400-2
set_property ip_repo_paths [list [file join $out hls solution1 impl ip]] [current_project]
update_ip_catalog
import_files [file join $root src hardware system.bd]
add_files -fileset constrs_1 [file join $root src hardware n.xdc]
open_bd_design [get_files system.bd]
validate_bd_design
save_bd_design
generate_target all [get_files system.bd]
add_files [make_wrapper -files [get_files system.bd] -top]
set_property top system_wrapper [current_fileset]
launch_runs synth_1 -jobs $jobs
wait_on_run synth_1
check_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs $jobs
wait_on_run impl_1
check_run impl_1
open_run impl_1
report_timing_summary -file [file join $out reports timing.rpt]
report_utilization -file [file join $out reports utilization.rpt]
report_drc -file [file join $out reports drc.rpt]
foreach delay {max min} {
 set paths [get_timing_paths -delay_type $delay -max_paths 1]
 if {[llength $paths] == 0} {error "Missing timing paths"}
 if {[get_property SLACK $paths] < 0} {error "Timing failed: see timing.rpt"}
}
file copy [file join [get_property DIRECTORY [get_runs impl_1]] system_wrapper.bit] [file join $out system_wrapper.bit]
write_hw_platform -fixed -include_bit -file [file join $out system_wrapper.xsa]
close_project
