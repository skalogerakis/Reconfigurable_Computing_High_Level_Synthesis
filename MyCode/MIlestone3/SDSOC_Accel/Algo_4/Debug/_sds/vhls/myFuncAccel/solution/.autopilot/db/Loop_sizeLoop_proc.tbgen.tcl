set moduleName Loop_sizeLoop_proc
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {Loop_sizeLoop_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ size int 32 regular {fifo 0}  }
	{ data1 float 32 regular {fifo 0 volatile }  }
	{ p_read float 32 regular  }
	{ p_read1 float 32 regular  }
	{ p_read2 float 32 regular  }
	{ p_read3 float 32 regular  }
	{ threshold float 32 regular {fifo 0}  }
	{ p_read4 float 32 regular  }
	{ p_read5 float 32 regular  }
	{ p_read6 float 32 regular  }
	{ p_read7 float 32 regular  }
	{ p_read8 float 32 regular  }
	{ p_read9 float 32 regular  }
	{ p_read10 float 32 regular  }
	{ p_read11 float 32 regular  }
	{ p_read12 float 32 regular  }
	{ p_read13 float 32 regular  }
	{ p_read14 float 32 regular  }
	{ p_read15 float 32 regular  }
	{ data2 float 32 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "size", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "data1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "threshold", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read4", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read5", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read7", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read8", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read9", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read10", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read11", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read12", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read13", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read14", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read15", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "data2", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 35
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ size_dout sc_in sc_lv 32 signal 0 } 
	{ size_empty_n sc_in sc_logic 1 signal 0 } 
	{ size_read sc_out sc_logic 1 signal 0 } 
	{ data1_dout sc_in sc_lv 32 signal 1 } 
	{ data1_empty_n sc_in sc_logic 1 signal 1 } 
	{ data1_read sc_out sc_logic 1 signal 1 } 
	{ p_read sc_in sc_lv 32 signal 2 } 
	{ p_read1 sc_in sc_lv 32 signal 3 } 
	{ p_read2 sc_in sc_lv 32 signal 4 } 
	{ p_read3 sc_in sc_lv 32 signal 5 } 
	{ threshold_dout sc_in sc_lv 32 signal 6 } 
	{ threshold_empty_n sc_in sc_logic 1 signal 6 } 
	{ threshold_read sc_out sc_logic 1 signal 6 } 
	{ p_read4 sc_in sc_lv 32 signal 7 } 
	{ p_read5 sc_in sc_lv 32 signal 8 } 
	{ p_read6 sc_in sc_lv 32 signal 9 } 
	{ p_read7 sc_in sc_lv 32 signal 10 } 
	{ p_read8 sc_in sc_lv 32 signal 11 } 
	{ p_read9 sc_in sc_lv 32 signal 12 } 
	{ p_read10 sc_in sc_lv 32 signal 13 } 
	{ p_read11 sc_in sc_lv 32 signal 14 } 
	{ p_read12 sc_in sc_lv 32 signal 15 } 
	{ p_read13 sc_in sc_lv 32 signal 16 } 
	{ p_read14 sc_in sc_lv 32 signal 17 } 
	{ p_read15 sc_in sc_lv 32 signal 18 } 
	{ data2_din sc_out sc_lv 32 signal 19 } 
	{ data2_full_n sc_in sc_logic 1 signal 19 } 
	{ data2_write sc_out sc_logic 1 signal 19 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "size_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "size", "role": "dout" }} , 
 	{ "name": "size_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "size", "role": "empty_n" }} , 
 	{ "name": "size_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "size", "role": "read" }} , 
 	{ "name": "data1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data1", "role": "dout" }} , 
 	{ "name": "data1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data1", "role": "empty_n" }} , 
 	{ "name": "data1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data1", "role": "read" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "p_read2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read2", "role": "default" }} , 
 	{ "name": "p_read3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read3", "role": "default" }} , 
 	{ "name": "threshold_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "threshold", "role": "dout" }} , 
 	{ "name": "threshold_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "threshold", "role": "empty_n" }} , 
 	{ "name": "threshold_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "threshold", "role": "read" }} , 
 	{ "name": "p_read4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read4", "role": "default" }} , 
 	{ "name": "p_read5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read5", "role": "default" }} , 
 	{ "name": "p_read6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read6", "role": "default" }} , 
 	{ "name": "p_read7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read7", "role": "default" }} , 
 	{ "name": "p_read8", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read8", "role": "default" }} , 
 	{ "name": "p_read9", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read9", "role": "default" }} , 
 	{ "name": "p_read10", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read10", "role": "default" }} , 
 	{ "name": "p_read11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read11", "role": "default" }} , 
 	{ "name": "p_read12", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read12", "role": "default" }} , 
 	{ "name": "p_read13", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read13", "role": "default" }} , 
 	{ "name": "p_read14", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read14", "role": "default" }} , 
 	{ "name": "p_read15", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read15", "role": "default" }} , 
 	{ "name": "data2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data2", "role": "din" }} , 
 	{ "name": "data2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data2", "role": "full_n" }} , 
 	{ "name": "data2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data2", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
		"CDFG" : "Loop_sizeLoop_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "size", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "size_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "data1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "threshold", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "threshold_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read4", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read5", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read6", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read7", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read8", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read9", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read10", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read11", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read12", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read13", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read14", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "p_read15", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "data2", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "data2_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fadd_32ns_32ns_32_5_full_dsp_1_U6", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fadd_32ns_32ns_32_5_full_dsp_1_U7", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fadd_32ns_32ns_32_5_full_dsp_1_U8", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fadd_32ns_32ns_32_5_full_dsp_1_U9", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U10", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U11", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U12", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U13", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U14", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fcmp_32ns_32ns_1_1_1_U15", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_sizeLoop_proc {
		size {Type I LastRead 0 FirstWrite -1}
		data1 {Type I LastRead 5 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		p_read3 {Type I LastRead 0 FirstWrite -1}
		threshold {Type I LastRead 0 FirstWrite -1}
		p_read4 {Type I LastRead 0 FirstWrite -1}
		p_read5 {Type I LastRead 0 FirstWrite -1}
		p_read6 {Type I LastRead 0 FirstWrite -1}
		p_read7 {Type I LastRead 0 FirstWrite -1}
		p_read8 {Type I LastRead 0 FirstWrite -1}
		p_read9 {Type I LastRead 0 FirstWrite -1}
		p_read10 {Type I LastRead 0 FirstWrite -1}
		p_read11 {Type I LastRead 0 FirstWrite -1}
		p_read12 {Type I LastRead 0 FirstWrite -1}
		p_read13 {Type I LastRead 0 FirstWrite -1}
		p_read14 {Type I LastRead 0 FirstWrite -1}
		p_read15 {Type I LastRead 0 FirstWrite -1}
		data2 {Type O LastRead -1 FirstWrite 35}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	size { ap_fifo {  { size_dout fifo_data 0 32 }  { size_empty_n fifo_status 0 1 }  { size_read fifo_update 1 1 } } }
	data1 { ap_fifo {  { data1_dout fifo_data 0 32 }  { data1_empty_n fifo_status 0 1 }  { data1_read fifo_update 1 1 } } }
	p_read { ap_none {  { p_read in_data 0 32 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 32 } } }
	p_read2 { ap_none {  { p_read2 in_data 0 32 } } }
	p_read3 { ap_none {  { p_read3 in_data 0 32 } } }
	threshold { ap_fifo {  { threshold_dout fifo_data 0 32 }  { threshold_empty_n fifo_status 0 1 }  { threshold_read fifo_update 1 1 } } }
	p_read4 { ap_none {  { p_read4 in_data 0 32 } } }
	p_read5 { ap_none {  { p_read5 in_data 0 32 } } }
	p_read6 { ap_none {  { p_read6 in_data 0 32 } } }
	p_read7 { ap_none {  { p_read7 in_data 0 32 } } }
	p_read8 { ap_none {  { p_read8 in_data 0 32 } } }
	p_read9 { ap_none {  { p_read9 in_data 0 32 } } }
	p_read10 { ap_none {  { p_read10 in_data 0 32 } } }
	p_read11 { ap_none {  { p_read11 in_data 0 32 } } }
	p_read12 { ap_none {  { p_read12 in_data 0 32 } } }
	p_read13 { ap_none {  { p_read13 in_data 0 32 } } }
	p_read14 { ap_none {  { p_read14 in_data 0 32 } } }
	p_read15 { ap_none {  { p_read15 in_data 0 32 } } }
	data2 { ap_fifo {  { data2_din fifo_data 1 32 }  { data2_full_n fifo_status 0 1 }  { data2_write fifo_update 1 1 } } }
}
