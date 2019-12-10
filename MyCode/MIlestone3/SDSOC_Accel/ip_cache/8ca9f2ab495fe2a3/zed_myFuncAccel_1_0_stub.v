// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Wed Dec 11 00:20:44 2019
// Host        : skl running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ zed_myFuncAccel_1_0_stub.v
// Design      : zed_myFuncAccel_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "a0_myFuncAccel,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ap_clk, ap_rst_n, ap_start, ap_done, ap_idle, 
  ap_ready, size, dim, threshold, data0_dout, data0_empty_n, data0_read, data1_dout, data1_empty_n, 
  data1_read, data2_din, data2_full_n, data2_write)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,size[31:0],dim[31:0],threshold[31:0],data0_dout[31:0],data0_empty_n,data0_read,data1_dout[31:0],data1_empty_n,data1_read,data2_din[31:0],data2_full_n,data2_write" */;
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0]size;
  input [31:0]dim;
  input [31:0]threshold;
  input [31:0]data0_dout;
  input data0_empty_n;
  output data0_read;
  input [31:0]data1_dout;
  input data1_empty_n;
  output data1_read;
  output [31:0]data2_din;
  input data2_full_n;
  output data2_write;
endmodule
