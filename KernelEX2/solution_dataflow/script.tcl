############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project KernelEX2
set_top krnl_helm
add_files KernelEX2/Krnl.cpp
open_solution "solution_dataflow" -flow_target vivado
set_part {xc7a35tcpg236-1}
create_clock -period 10 -name default
source "./KernelEX2/solution_dataflow/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
