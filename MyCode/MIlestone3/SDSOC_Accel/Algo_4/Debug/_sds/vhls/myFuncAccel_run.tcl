open_project myFuncAccel
set_top myFuncAccel
add_files /home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c -cflags "-I/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src -Wall -O0 -g -fmessage-length=0 -D __SDSCC__ -m32 -D HLS_NO_XIL_FPO_LIB -I /toolsViv/Xilinx/SDx/2018.3/target/aarch32-linux/include -I/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src -D __SDSVHLS__ -D __SDSVHLS_SYNTHESIS__ -I /home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug -w"
open_solution "solution" -reset
set_part { xc7z020clg484-1 }
# synthesis directives
create_clock -period 10.000000
config_sdx -target sds
config_rtl -reset_level low
source /home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls/myFuncAccel.tcl
# end synthesis directives
config_rtl -prefix a0_
csynth_design
export_design -ipname myFuncAccel
exit
