set moduleName myFuncAccel
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {myFuncAccel}
set C_modelType { void 0 }
set C_modelArgList {
	{ size int 32 unused  }
	{ dim int 32 unused  }
	{ threshold float 32 unused  }
	{ data0 float 32 regular {bus 0}  }
	{ data1 float 32 regular {bus 0}  }
	{ data2 float 32 regular {bus 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "size","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "dim", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "dim","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "threshold", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "threshold","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "data0", "interface" : "bus", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "data0","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 15,"step" : 1}]}]}]} , 
 	{ "Name" : "data1", "interface" : "bus", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "data1","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 3999,"step" : 1}]}]}]} , 
 	{ "Name" : "data2", "interface" : "bus", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "data2","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 3999,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 36
set portList { 
	{ size sc_in sc_lv 32 signal 0 } 
	{ dim sc_in sc_lv 32 signal 1 } 
	{ threshold sc_in sc_lv 32 signal 2 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ data0_req_din sc_out sc_logic 1 signal 3 } 
	{ data0_req_full_n sc_in sc_logic 1 signal 3 } 
	{ data0_req_write sc_out sc_logic 1 signal 3 } 
	{ data0_rsp_empty_n sc_in sc_logic 1 signal 3 } 
	{ data0_rsp_read sc_out sc_logic 1 signal 3 } 
	{ data0_address sc_out sc_lv 32 signal 3 } 
	{ data0_datain sc_in sc_lv 32 signal 3 } 
	{ data0_dataout sc_out sc_lv 32 signal 3 } 
	{ data0_size sc_out sc_lv 32 signal 3 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ data1_req_din sc_out sc_logic 1 signal 4 } 
	{ data1_req_full_n sc_in sc_logic 1 signal 4 } 
	{ data1_req_write sc_out sc_logic 1 signal 4 } 
	{ data1_rsp_empty_n sc_in sc_logic 1 signal 4 } 
	{ data1_rsp_read sc_out sc_logic 1 signal 4 } 
	{ data1_address sc_out sc_lv 32 signal 4 } 
	{ data1_datain sc_in sc_lv 32 signal 4 } 
	{ data1_dataout sc_out sc_lv 32 signal 4 } 
	{ data1_size sc_out sc_lv 32 signal 4 } 
	{ data2_req_din sc_out sc_logic 1 signal 5 } 
	{ data2_req_full_n sc_in sc_logic 1 signal 5 } 
	{ data2_req_write sc_out sc_logic 1 signal 5 } 
	{ data2_rsp_empty_n sc_in sc_logic 1 signal 5 } 
	{ data2_rsp_read sc_out sc_logic 1 signal 5 } 
	{ data2_address sc_out sc_lv 32 signal 5 } 
	{ data2_datain sc_in sc_lv 32 signal 5 } 
	{ data2_dataout sc_out sc_lv 32 signal 5 } 
	{ data2_size sc_out sc_lv 32 signal 5 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
}
set NewPortList {[ 
	{ "name": "size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "size", "role": "default" }} , 
 	{ "name": "dim", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dim", "role": "default" }} , 
 	{ "name": "threshold", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "threshold", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "data0_req_din", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data0", "role": "req_din" }} , 
 	{ "name": "data0_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data0", "role": "req_full_n" }} , 
 	{ "name": "data0_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data0", "role": "req_write" }} , 
 	{ "name": "data0_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data0", "role": "rsp_empty_n" }} , 
 	{ "name": "data0_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data0", "role": "rsp_read" }} , 
 	{ "name": "data0_address", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data0", "role": "address" }} , 
 	{ "name": "data0_datain", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data0", "role": "datain" }} , 
 	{ "name": "data0_dataout", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data0", "role": "dataout" }} , 
 	{ "name": "data0_size", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data0", "role": "size" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "data1_req_din", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data1", "role": "req_din" }} , 
 	{ "name": "data1_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data1", "role": "req_full_n" }} , 
 	{ "name": "data1_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data1", "role": "req_write" }} , 
 	{ "name": "data1_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data1", "role": "rsp_empty_n" }} , 
 	{ "name": "data1_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data1", "role": "rsp_read" }} , 
 	{ "name": "data1_address", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data1", "role": "address" }} , 
 	{ "name": "data1_datain", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data1", "role": "datain" }} , 
 	{ "name": "data1_dataout", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data1", "role": "dataout" }} , 
 	{ "name": "data1_size", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data1", "role": "size" }} , 
 	{ "name": "data2_req_din", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data2", "role": "req_din" }} , 
 	{ "name": "data2_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data2", "role": "req_full_n" }} , 
 	{ "name": "data2_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data2", "role": "req_write" }} , 
 	{ "name": "data2_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data2", "role": "rsp_empty_n" }} , 
 	{ "name": "data2_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data2", "role": "rsp_read" }} , 
 	{ "name": "data2_address", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data2", "role": "address" }} , 
 	{ "name": "data2_datain", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data2", "role": "datain" }} , 
 	{ "name": "data2_dataout", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data2", "role": "dataout" }} , 
 	{ "name": "data2_size", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data2", "role": "size" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"],
		"CDFG" : "myFuncAccel",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4055", "EstimateLatencyMax" : "4055",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "Block_codeRepl50_pro_U0", "ReadyCount" : "Block_codeRepl50_pro_U0_ap_ready_count"},
			{"ID" : "2", "Name" : "Loop_sizeLoop_proc_U0", "ReadyCount" : "Loop_sizeLoop_proc_U0_ap_ready_count"}],
		"OutputProcess" : [
			{"ID" : "2", "Name" : "Loop_sizeLoop_proc_U0"}],
		"Port" : [
			{"Name" : "size", "Type" : "None", "Direction" : "I"},
			{"Name" : "dim", "Type" : "None", "Direction" : "I"},
			{"Name" : "threshold", "Type" : "None", "Direction" : "I"},
			{"Name" : "data0", "Type" : "Bus", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Block_codeRepl50_pro_U0", "Port" : "data0"}]},
			{"Name" : "data1", "Type" : "Bus", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "Loop_sizeLoop_proc_U0", "Port" : "data1"}]},
			{"Name" : "data2", "Type" : "Bus", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "Loop_sizeLoop_proc_U0", "Port" : "data2"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Block_codeRepl50_pro_U0", "Parent" : "0",
		"CDFG" : "Block_codeRepl50_pro",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "17",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "data0", "Type" : "Bus", "Direction" : "I"}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_sizeLoop_proc_U0", "Parent" : "0", "Child" : ["3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
		"CDFG" : "Loop_sizeLoop_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4037", "EstimateLatencyMax" : "4037",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "data1", "Type" : "Bus", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "13"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "14"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "15"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "16"},
			{"Name" : "p_read4", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "17"},
			{"Name" : "p_read5", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "18"},
			{"Name" : "p_read6", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "19"},
			{"Name" : "p_read7", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "20"},
			{"Name" : "p_read8", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "21"},
			{"Name" : "p_read9", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "22"},
			{"Name" : "p_read10", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "23"},
			{"Name" : "p_read11", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "24"},
			{"Name" : "p_read12", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "25"},
			{"Name" : "p_read13", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "26"},
			{"Name" : "p_read14", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "27"},
			{"Name" : "p_read15", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "28"},
			{"Name" : "data2", "Type" : "Bus", "Direction" : "O"}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_sizeLoop_proc_U0.myFuncAccel_fadd_32ns_32ns_32_5_full_dsp_1_U2", "Parent" : "2"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_sizeLoop_proc_U0.myFuncAccel_fadd_32ns_32ns_32_5_full_dsp_1_U3", "Parent" : "2"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_sizeLoop_proc_U0.myFuncAccel_fadd_32ns_32ns_32_5_full_dsp_1_U4", "Parent" : "2"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_sizeLoop_proc_U0.myFuncAccel_fadd_32ns_32ns_32_5_full_dsp_1_U5", "Parent" : "2"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_sizeLoop_proc_U0.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U6", "Parent" : "2"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_sizeLoop_proc_U0.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U7", "Parent" : "2"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_sizeLoop_proc_U0.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U8", "Parent" : "2"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_sizeLoop_proc_U0.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U9", "Parent" : "2"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_sizeLoop_proc_U0.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U10", "Parent" : "2"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_sizeLoop_proc_U0.myFuncAccel_fcmp_32ns_32ns_1_1_1_U11", "Parent" : "2"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_loc_chann_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_1_loc_cha_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_2_loc_cha_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_3_loc_cha_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_4_loc_cha_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_5_loc_cha_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_6_loc_cha_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_7_loc_cha_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_8_loc_cha_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_9_loc_cha_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_10_loc_ch_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_11_loc_ch_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_12_loc_ch_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_13_loc_ch_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_14_loc_ch_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data0_load_15_loc_ch_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	myFuncAccel {
		size {Type I LastRead -1 FirstWrite -1}
		dim {Type I LastRead -1 FirstWrite -1}
		threshold {Type I LastRead -1 FirstWrite -1}
		data0 {Type I LastRead 17 FirstWrite -1}
		data1 {Type I LastRead 7 FirstWrite -1}
		data2 {Type O LastRead 37 FirstWrite 37}}
	Block_codeRepl50_pro {
		data0 {Type I LastRead 17 FirstWrite -1}}
	Loop_sizeLoop_proc {
		data1 {Type I LastRead 7 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		p_read3 {Type I LastRead 0 FirstWrite -1}
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
		data2 {Type O LastRead 37 FirstWrite 37}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4055", "Max" : "4055"}
	, {"Name" : "Interval", "Min" : "4038", "Max" : "4038"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	size { ap_none {  { size in_data 0 32 } } }
	dim { ap_none {  { dim in_data 0 32 } } }
	threshold { ap_none {  { threshold in_data 0 32 } } }
	data0 { ap_bus {  { data0_req_din fifo_data 1 1 }  { data0_req_full_n fifo_status 0 1 }  { data0_req_write fifo_update 1 1 }  { data0_rsp_empty_n fifo_status 0 1 }  { data0_rsp_read fifo_update 1 1 }  { data0_address unknown 1 32 }  { data0_datain unknown 0 32 }  { data0_dataout unknown 1 32 }  { data0_size unknown 1 32 } } }
	data1 { ap_bus {  { data1_req_din fifo_data 1 1 }  { data1_req_full_n fifo_status 0 1 }  { data1_req_write fifo_update 1 1 }  { data1_rsp_empty_n fifo_status 0 1 }  { data1_rsp_read fifo_update 1 1 }  { data1_address unknown 1 32 }  { data1_datain unknown 0 32 }  { data1_dataout unknown 1 32 }  { data1_size unknown 1 32 } } }
	data2 { ap_bus {  { data2_req_din fifo_data 1 1 }  { data2_req_full_n fifo_status 0 1 }  { data2_req_write fifo_update 1 1 }  { data2_rsp_empty_n fifo_status 0 1 }  { data2_rsp_read fifo_update 1 1 }  { data2_address unknown 1 32 }  { data2_datain unknown 0 32 }  { data2_dataout unknown 1 32 }  { data2_size unknown 1 32 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ data0 1 }
	{ data1 1 }
	{ data2 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ data0 1 }
	{ data1 1 }
	{ data2 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
