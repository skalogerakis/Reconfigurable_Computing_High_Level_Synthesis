#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("size", 32, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("dim", 32, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("threshold", 32, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("data0_dout", 32, hls_in, 3, "ap_fifo", "fifo_data", 1),
	Port_Property("data0_empty_n", 1, hls_in, 3, "ap_fifo", "fifo_status", 1),
	Port_Property("data0_read", 1, hls_out, 3, "ap_fifo", "fifo_update", 1),
	Port_Property("data1_dout", 32, hls_in, 4, "ap_fifo", "fifo_data", 1),
	Port_Property("data1_empty_n", 1, hls_in, 4, "ap_fifo", "fifo_status", 1),
	Port_Property("data1_read", 1, hls_out, 4, "ap_fifo", "fifo_update", 1),
	Port_Property("data2_din", 32, hls_out, 5, "ap_fifo", "fifo_data", 1),
	Port_Property("data2_full_n", 1, hls_in, 5, "ap_fifo", "fifo_status", 1),
	Port_Property("data2_write", 1, hls_out, 5, "ap_fifo", "fifo_update", 1),
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst_n", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
};
const char* HLS_Design_Meta::dut_name = "myFuncAccel";
