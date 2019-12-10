#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/toolsViv/Xilinx/SDK/2018.3/bin:/toolsViv/Xilinx/SDK/2018.3/bin:/toolsViv/Xilinx/SDK/2018.3/bin:/toolsViv/Xilinx/SDK/2018.3/bin:/toolsViv/Xilinx/Vivado/2018.3/bin
else
  PATH=/toolsViv/Xilinx/SDK/2018.3/bin:/toolsViv/Xilinx/SDK/2018.3/bin:/toolsViv/Xilinx/SDK/2018.3/bin:/toolsViv/Xilinx/SDK/2018.3/bin:/toolsViv/Xilinx/Vivado/2018.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/p0/vivado/prj/prj.runs/zed_s00_data_fifo_2_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log zed_s00_data_fifo_2.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source zed_s00_data_fifo_2.tcl
