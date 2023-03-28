
set PATH=
call D:/Xilinx/Vivado/2022.2/bin/xelab xil_defaultlib.apatb_loop_pipeline_top glbl -Oenable_linking_all_libraries  -prj loop_pipeline.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims_ver -L xpm  -L floating_point_v7_0_20 -L floating_point_v7_1_15 --lib "ieee_proposed=./ieee_proposed" -s loop_pipeline 
call D:/Xilinx/Vivado/2022.2/bin/xsim --noieeewarnings loop_pipeline -tclbatch loop_pipeline.tcl 

