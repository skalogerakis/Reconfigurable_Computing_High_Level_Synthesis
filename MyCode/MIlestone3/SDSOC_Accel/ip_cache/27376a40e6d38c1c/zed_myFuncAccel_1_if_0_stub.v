// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Wed Dec 11 00:07:19 2019
// Host        : skl running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ zed_myFuncAccel_1_if_0_stub.v
// Design      : zed_myFuncAccel_1_if_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "top,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_aclk, s_axi_aresetn, S_AXI_AWADDR, 
  S_AXI_AWPROT, S_AXI_AWVALID, S_AXI_AWREADY, S_AXI_WDATA, S_AXI_WSTRB, S_AXI_WVALID, 
  S_AXI_WREADY, S_AXI_BRESP, S_AXI_BVALID, S_AXI_BREADY, S_AXI_ARADDR, S_AXI_ARPROT, 
  S_AXI_ARVALID, S_AXI_ARREADY, S_AXI_RDATA, S_AXI_RRESP, S_AXI_RVALID, S_AXI_RREADY, acc_aclk, 
  acc_aresetn, ap_resetn, ap_clk, ap_start, ap_idle, ap_done, ap_ready, ap_continue, 
  ap_iscalar_0_dout, ap_iscalar_1_dout, ap_iscalar_2_dout, s_axis_fifo_0_aclk, 
  s_axis_fifo_0_aresetn, s_axis_fifo_0_tlast, s_axis_fifo_0_tvalid, s_axis_fifo_0_tkeep, 
  s_axis_fifo_0_tstrb, s_axis_fifo_0_tdata, s_axis_fifo_0_tready, ap_fifo_iarg_0_empty_n, 
  ap_fifo_iarg_0_dout, ap_fifo_iarg_0_read, s_axis_fifo_1_aclk, s_axis_fifo_1_aresetn, 
  s_axis_fifo_1_tlast, s_axis_fifo_1_tvalid, s_axis_fifo_1_tkeep, s_axis_fifo_1_tstrb, 
  s_axis_fifo_1_tdata, s_axis_fifo_1_tready, ap_fifo_iarg_1_empty_n, ap_fifo_iarg_1_dout, 
  ap_fifo_iarg_1_read, m_axis_fifo_0_aclk, m_axis_fifo_0_aresetn, m_axis_fifo_0_tlast, 
  m_axis_fifo_0_tvalid, m_axis_fifo_0_tkeep, m_axis_fifo_0_tstrb, m_axis_fifo_0_tdata, 
  m_axis_fifo_0_tready, ap_fifo_oarg_0_full_n, ap_fifo_oarg_0_din, ap_fifo_oarg_0_write, 
  ap_done_irq)
/* synthesis syn_black_box black_box_pad_pin="s_axi_aclk,s_axi_aresetn,S_AXI_AWADDR[31:0],S_AXI_AWPROT[2:0],S_AXI_AWVALID,S_AXI_AWREADY,S_AXI_WDATA[31:0],S_AXI_WSTRB[3:0],S_AXI_WVALID,S_AXI_WREADY,S_AXI_BRESP[1:0],S_AXI_BVALID,S_AXI_BREADY,S_AXI_ARADDR[31:0],S_AXI_ARPROT[2:0],S_AXI_ARVALID,S_AXI_ARREADY,S_AXI_RDATA[31:0],S_AXI_RRESP[1:0],S_AXI_RVALID,S_AXI_RREADY,acc_aclk,acc_aresetn,ap_resetn,ap_clk,ap_start,ap_idle,ap_done,ap_ready,ap_continue,ap_iscalar_0_dout[31:0],ap_iscalar_1_dout[31:0],ap_iscalar_2_dout[31:0],s_axis_fifo_0_aclk,s_axis_fifo_0_aresetn,s_axis_fifo_0_tlast,s_axis_fifo_0_tvalid,s_axis_fifo_0_tkeep[3:0],s_axis_fifo_0_tstrb[3:0],s_axis_fifo_0_tdata[31:0],s_axis_fifo_0_tready,ap_fifo_iarg_0_empty_n,ap_fifo_iarg_0_dout[31:0],ap_fifo_iarg_0_read,s_axis_fifo_1_aclk,s_axis_fifo_1_aresetn,s_axis_fifo_1_tlast,s_axis_fifo_1_tvalid,s_axis_fifo_1_tkeep[3:0],s_axis_fifo_1_tstrb[3:0],s_axis_fifo_1_tdata[31:0],s_axis_fifo_1_tready,ap_fifo_iarg_1_empty_n,ap_fifo_iarg_1_dout[31:0],ap_fifo_iarg_1_read,m_axis_fifo_0_aclk,m_axis_fifo_0_aresetn,m_axis_fifo_0_tlast,m_axis_fifo_0_tvalid,m_axis_fifo_0_tkeep[3:0],m_axis_fifo_0_tstrb[3:0],m_axis_fifo_0_tdata[31:0],m_axis_fifo_0_tready,ap_fifo_oarg_0_full_n,ap_fifo_oarg_0_din[31:0],ap_fifo_oarg_0_write,ap_done_irq" */;
  input s_axi_aclk;
  input s_axi_aresetn;
  input [31:0]S_AXI_AWADDR;
  input [2:0]S_AXI_AWPROT;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0]S_AXI_WDATA;
  input [3:0]S_AXI_WSTRB;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [1:0]S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [31:0]S_AXI_ARADDR;
  input [2:0]S_AXI_ARPROT;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [31:0]S_AXI_RDATA;
  output [1:0]S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  input acc_aclk;
  input acc_aresetn;
  output ap_resetn;
  output ap_clk;
  output ap_start;
  input ap_idle;
  input ap_done;
  input ap_ready;
  output ap_continue;
  output [31:0]ap_iscalar_0_dout;
  output [31:0]ap_iscalar_1_dout;
  output [31:0]ap_iscalar_2_dout;
  input s_axis_fifo_0_aclk;
  input s_axis_fifo_0_aresetn;
  input s_axis_fifo_0_tlast;
  input s_axis_fifo_0_tvalid;
  input [3:0]s_axis_fifo_0_tkeep;
  input [3:0]s_axis_fifo_0_tstrb;
  input [31:0]s_axis_fifo_0_tdata;
  output s_axis_fifo_0_tready;
  output ap_fifo_iarg_0_empty_n;
  output [31:0]ap_fifo_iarg_0_dout;
  input ap_fifo_iarg_0_read;
  input s_axis_fifo_1_aclk;
  input s_axis_fifo_1_aresetn;
  input s_axis_fifo_1_tlast;
  input s_axis_fifo_1_tvalid;
  input [3:0]s_axis_fifo_1_tkeep;
  input [3:0]s_axis_fifo_1_tstrb;
  input [31:0]s_axis_fifo_1_tdata;
  output s_axis_fifo_1_tready;
  output ap_fifo_iarg_1_empty_n;
  output [31:0]ap_fifo_iarg_1_dout;
  input ap_fifo_iarg_1_read;
  input m_axis_fifo_0_aclk;
  input m_axis_fifo_0_aresetn;
  output m_axis_fifo_0_tlast;
  output m_axis_fifo_0_tvalid;
  output [3:0]m_axis_fifo_0_tkeep;
  output [3:0]m_axis_fifo_0_tstrb;
  output [31:0]m_axis_fifo_0_tdata;
  input m_axis_fifo_0_tready;
  output ap_fifo_oarg_0_full_n;
  input [31:0]ap_fifo_oarg_0_din;
  input ap_fifo_oarg_0_write;
  output ap_done_irq;
endmodule
