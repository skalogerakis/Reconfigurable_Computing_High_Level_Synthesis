############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project vHls16
set_top myFuncAccel
add_files myAccel16.c
add_files myLib.h
add_files -tb main.c
open_solution "Optimization_1_16"
set_part {xa7a12tcsg325-1q}
create_clock -period 10 -name default
#source "./vHls16/Optimization_1_16/directives.tcl"
csim_design -argv {1000 1000 16 100} -clean
csynth_design
cosim_design -argv {1000 1000 16 100}
export_design -format ip_catalog
