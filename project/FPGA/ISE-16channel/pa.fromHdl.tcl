
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name clkTest -dir "C:/Users/Administrator/Desktop/task/ISE/clkTest/clkTest/planAhead_run_3" -part xc6slx100fgg676-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "test.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {test.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top test $srcset
add_files [list {test.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx100fgg676-3
