
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name clkTest -dir "C:/Users/Administrator/Desktop/task/ISE/clkTest/clkTest/planAhead_run_2" -part xc6slx100fgg676-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Administrator/Desktop/task/ISE/clkTest/clkTest/test.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Administrator/Desktop/task/ISE/clkTest/clkTest} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "test.ucf" [current_fileset -constrset]
add_files [list {test.ucf}] -fileset [get_property constrset [current_run]]
link_design
