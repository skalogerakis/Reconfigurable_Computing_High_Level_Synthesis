############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project algHLS
set_top myFuncAccel
add_files ../myLib.h
add_files ../myAccel.c
add_files -tb ../main.c -cflags "-Wno-unknown-pragmas"
open_solution "Optimazation_5"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
#source "./algHLS/Optimazation_5/directives.tcl"
csim_design -argv {1000 1000 4 100} -clean
csynth_design
cosim_design -argv {1000 1000 4 100}
export_design -format ip_catalog
