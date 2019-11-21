set moduleName myFuncAccel
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
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ size sc_in sc_lv 32 signal 0 } 
	{ dim sc_in sc_lv 32 signal 1 } 
	{ threshold sc_in sc_lv 32 signal 2 } 
	{ data0_req_din sc_out sc_logic 1 signal 3 } 
	{ data0_req_full_n sc_in sc_logic 1 signal 3 } 
	{ data0_req_write sc_out sc_logic 1 signal 3 } 
	{ data0_rsp_empty_n sc_in sc_logic 1 signal 3 } 
	{ data0_rsp_read sc_out sc_logic 1 signal 3 } 
	{ data0_address sc_out sc_lv 32 signal 3 } 
	{ data0_datain sc_in sc_lv 32 signal 3 } 
	{ data0_dataout sc_out sc_lv 32 signal 3 } 
	{ data0_size sc_out sc_lv 32 signal 3 } 
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
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "size", "role": "default" }} , 
 	{ "name": "dim", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dim", "role": "default" }} , 
 	{ "name": "threshold", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "threshold", "role": "default" }} , 
 	{ "name": "data0_req_din", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data0", "role": "req_din" }} , 
 	{ "name": "data0_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data0", "role": "req_full_n" }} , 
 	{ "name": "data0_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data0", "role": "req_write" }} , 
 	{ "name": "data0_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data0", "role": "rsp_empty_n" }} , 
 	{ "name": "data0_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data0", "role": "rsp_read" }} , 
 	{ "name": "data0_address", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data0", "role": "address" }} , 
 	{ "name": "data0_datain", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data0", "role": "datain" }} , 
 	{ "name": "data0_dataout", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data0", "role": "dataout" }} , 
 	{ "name": "data0_size", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data0", "role": "size" }} , 
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
 	{ "name": "data2_size", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data2", "role": "size" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
		"CDFG" : "myFuncAccel",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4066", "EstimateLatencyMax" : "4066",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "size", "Type" : "None", "Direction" : "I"},
			{"Name" : "dim", "Type" : "None", "Direction" : "I"},
			{"Name" : "threshold", "Type" : "None", "Direction" : "I"},
			{"Name" : "data0", "Type" : "Bus", "Direction" : "I"},
			{"Name" : "data1", "Type" : "Bus", "Direction" : "I"},
			{"Name" : "data2", "Type" : "Bus", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fadd_32ns_32ns_32_5_full_dsp_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fadd_32ns_32ns_32_5_full_dsp_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fadd_32ns_32ns_32_5_full_dsp_1_U3", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U4", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U5", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U6", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U7", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fmul_32ns_32ns_32_4_max_dsp_1_U8", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.myFuncAccel_fcmp_32ns_32ns_1_1_1_U9", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	myFuncAccel {
		size {Type I LastRead -1 FirstWrite -1}
		dim {Type I LastRead -1 FirstWrite -1}
		threshold {Type I LastRead -1 FirstWrite -1}
		data0 {Type I LastRead 7 FirstWrite -1}
		data1 {Type I LastRead 8 FirstWrite -1}
		data2 {Type O LastRead 34 FirstWrite 34}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4066", "Max" : "4066"}
	, {"Name" : "Interval", "Min" : "4067", "Max" : "4067"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
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
