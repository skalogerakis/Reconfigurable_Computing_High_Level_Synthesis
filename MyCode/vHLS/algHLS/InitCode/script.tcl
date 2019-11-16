############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project algHLS
set_top myFuncAccel
add_files ../myAccel.c
add_files ../myLib.h
add_files -tb ../main.c -cflags "-Wno-unknown-pragmas"
open_solution "InitCode"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
config_compile -no_signed_zeros=0 -unsafe_math_optimizations=0
#source "./algHLS/InitCode/directives.tcl"
csim_design -argv {1000 1000 4 100} -clean
csynth_design
cosim_design -argv {1000 1000 4 1000}
export_design -format ip_catalog
