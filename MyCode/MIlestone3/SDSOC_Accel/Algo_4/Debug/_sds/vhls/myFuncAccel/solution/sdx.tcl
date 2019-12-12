# ==============================================================
# File generated on Thu Dec 12 23:27:49 EET 2019
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
add_files /home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c -cflags {-I/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src -Wall -O0 -g -fmessage-length=0 -D__SDSCC__ -m32 -DHLS_NO_XIL_FPO_LIB -I/toolsViv/Xilinx/SDx/2018.3/target/aarch32-linux/include -I/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src -D__SDSVHLS__ -D__SDSVHLS_SYNTHESIS__ -I/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug -w}
set_part xc7z020clg484-1
create_clock -name default -period 10.000000
set_clock_uncertainty 27% default
config_sdx -target=sds
config_sdx -optimization_level=0
config_export -vivado_phys_opt=none
config_bind -effort=medium
config_schedule -effort=medium
config_schedule -relax_ii_for_timing=0
config_rtl -auto_prefix=1
config_rtl -reset_level=low
config_rtl -prefix=a0_
set_directive_interface myFuncAccel 
set_directive_interface myFuncAccel 
set_directive_interface myFuncAccel 
set_directive_latency myFuncAccel -min 1
