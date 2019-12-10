
set TopModule "myFuncAccel"
set ClockPeriod 10
set ClockList ap_clk
set HasVivadoClockPeriod 0
set CombLogicFlag 0
set PipelineFlag 1
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 1
set FftOrFirFlag 0
set NbRWValue 0
set intNbAccess 0
set NewDSPMapping 1
set HasDSPModule 0
set ResetLevelFlag 0
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix a0_
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xc7z020:clg484:-1
set SourceFiles {sc {} c /home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src/myAccel.c}
set SourceFlags {sc {} c {{-I/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src -Wall -O0 -g -fmessage-length=0 -D__SDSCC__ -m32 -DHLS_NO_XIL_FPO_LIB -I/toolsViv/Xilinx/SDx/2018.3/target/aarch32-linux/include -I/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/src -D__SDSVHLS__ -D__SDSVHLS_SYNTHESIS__ -I/home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug -w}}}
set DirectiveFile /home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/vhls/myFuncAccel/solution/solution.directive
set TBFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {bc "" c "" sc "" cas "" vhdl "" verilog ""}
set TBInstNames {bc "" c "" sc "" cas "" vhdl "" verilog ""}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile ../vivado_hls.app
set ApsFile solution.aps
set AvePath ../..
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 0
set PlatformFiles {{DefaultPlatform {xilinx/zynq/zynq xilinx/zynq/zynq_fpv6}}}
set HPFPO 0
