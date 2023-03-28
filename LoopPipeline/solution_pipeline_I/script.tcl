############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project LoopPipeline
set_top loop_pipeline
add_files LoopPipeline/loop_pipeline.cpp
add_files -tb LoopPipeline/loop_pipeline_test.cpp
add_files -tb LoopPipeline/result.golden.dat
open_solution "solution_pipeline_I" -flow_target vivado
set_part {xc7a35tcpg236-1}
create_clock -period 10 -name default
source "./LoopPipeline/solution_pipeline_I/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
