// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2403119 Mon Dec  3 18:12:39 MST 2018
// Date        : Tue Dec  4 00:31:42 2018
// Host        : xcolbl6781 running 64-bit Red Hat Enterprise Linux Workstation release 7.3 (Maipo)
// Command     : write_verilog -force -mode synth_stub -rename_top zed_axis_dwc_dm_0_tx_0_0 -prefix
//               zed_axis_dwc_dm_0_tx_0_0_ zc702_axis_dwc_dm_1_tx_0_0_stub.v
// Design      : zc702_axis_dwc_dm_1_tx_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_dwidth_converter_v1_1_17_axis_dwidth_converter,Vivado 2018.3" *)
module zed_axis_dwc_dm_0_tx_0_0(aclk, aresetn, s_axis_tvalid, s_axis_tready, 
  s_axis_tdata, s_axis_tkeep, s_axis_tlast, m_axis_tvalid, m_axis_tready, m_axis_tdata, 
  m_axis_tkeep, m_axis_tlast)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[63:0],s_axis_tkeep[7:0],s_axis_tlast,m_axis_tvalid,m_axis_tready,m_axis_tdata[31:0],m_axis_tkeep[3:0],m_axis_tlast" */;
  input aclk;
  input aresetn;
  input s_axis_tvalid;
  output s_axis_tready;
  input [63:0]s_axis_tdata;
  input [7:0]s_axis_tkeep;
  input s_axis_tlast;
  output m_axis_tvalid;
  input m_axis_tready;
  output [31:0]m_axis_tdata;
  output [3:0]m_axis_tkeep;
  output m_axis_tlast;
endmodule
