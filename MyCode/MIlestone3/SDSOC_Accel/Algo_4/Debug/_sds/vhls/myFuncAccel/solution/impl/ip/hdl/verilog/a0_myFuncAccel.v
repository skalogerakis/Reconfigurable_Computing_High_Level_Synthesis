// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="a0_myFuncAccel,hls_ip_2018_3,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=7.256000,HLS_SYN_LAT=-1,HLS_SYN_TPT=-1,HLS_SYN_MEM=0,HLS_SYN_DSP=23,HLS_SYN_FF=5221,HLS_SYN_LUT=6178,HLS_VERSION=2018_3}" *)

module a0_myFuncAccel (
        size,
        dim,
        threshold,
        data0_dout,
        data0_empty_n,
        data0_read,
        data1_dout,
        data1_empty_n,
        data1_read,
        data2_din,
        data2_full_n,
        data2_write,
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_ready,
        ap_idle
);


input  [31:0] size;
input  [31:0] dim;
input  [31:0] threshold;
input  [31:0] data0_dout;
input   data0_empty_n;
output   data0_read;
input  [31:0] data1_dout;
input   data1_empty_n;
output   data1_read;
output  [31:0] data2_din;
input   data2_full_n;
output   data2_write;
input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_ready;
output   ap_idle;

 reg    ap_rst_n_inv;
wire    Block_codeRepl49_pro_U0_ap_start;
wire    Block_codeRepl49_pro_U0_ap_done;
wire    Block_codeRepl49_pro_U0_ap_continue;
wire    Block_codeRepl49_pro_U0_ap_idle;
wire    Block_codeRepl49_pro_U0_ap_ready;
wire    Block_codeRepl49_pro_U0_data0_read;
wire   [31:0] Block_codeRepl49_pro_U0_size_out_din;
wire    Block_codeRepl49_pro_U0_size_out_write;
wire   [31:0] Block_codeRepl49_pro_U0_threshold_out_din;
wire    Block_codeRepl49_pro_U0_threshold_out_write;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_0;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_1;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_2;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_3;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_4;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_5;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_6;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_7;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_8;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_9;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_10;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_11;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_12;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_13;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_14;
wire   [31:0] Block_codeRepl49_pro_U0_ap_return_15;
wire    ap_channel_done_data0_load_15_loc_ch;
wire    data0_load_15_loc_ch_full_n;
reg    ap_sync_reg_channel_write_data0_load_15_loc_ch;
wire    ap_sync_channel_write_data0_load_15_loc_ch;
wire    ap_channel_done_data0_load_14_loc_ch;
wire    data0_load_14_loc_ch_full_n;
reg    ap_sync_reg_channel_write_data0_load_14_loc_ch;
wire    ap_sync_channel_write_data0_load_14_loc_ch;
wire    ap_channel_done_data0_load_13_loc_ch;
wire    data0_load_13_loc_ch_full_n;
reg    ap_sync_reg_channel_write_data0_load_13_loc_ch;
wire    ap_sync_channel_write_data0_load_13_loc_ch;
wire    ap_channel_done_data0_load_12_loc_ch;
wire    data0_load_12_loc_ch_full_n;
reg    ap_sync_reg_channel_write_data0_load_12_loc_ch;
wire    ap_sync_channel_write_data0_load_12_loc_ch;
wire    ap_channel_done_data0_load_11_loc_ch;
wire    data0_load_11_loc_ch_full_n;
reg    ap_sync_reg_channel_write_data0_load_11_loc_ch;
wire    ap_sync_channel_write_data0_load_11_loc_ch;
wire    ap_channel_done_data0_load_10_loc_ch;
wire    data0_load_10_loc_ch_full_n;
reg    ap_sync_reg_channel_write_data0_load_10_loc_ch;
wire    ap_sync_channel_write_data0_load_10_loc_ch;
wire    ap_channel_done_data0_load_9_loc_cha;
wire    data0_load_9_loc_cha_full_n;
reg    ap_sync_reg_channel_write_data0_load_9_loc_cha;
wire    ap_sync_channel_write_data0_load_9_loc_cha;
wire    ap_channel_done_data0_load_8_loc_cha;
wire    data0_load_8_loc_cha_full_n;
reg    ap_sync_reg_channel_write_data0_load_8_loc_cha;
wire    ap_sync_channel_write_data0_load_8_loc_cha;
wire    ap_channel_done_data0_load_7_loc_cha;
wire    data0_load_7_loc_cha_full_n;
reg    ap_sync_reg_channel_write_data0_load_7_loc_cha;
wire    ap_sync_channel_write_data0_load_7_loc_cha;
wire    ap_channel_done_data0_load_6_loc_cha;
wire    data0_load_6_loc_cha_full_n;
reg    ap_sync_reg_channel_write_data0_load_6_loc_cha;
wire    ap_sync_channel_write_data0_load_6_loc_cha;
wire    ap_channel_done_data0_load_5_loc_cha;
wire    data0_load_5_loc_cha_full_n;
reg    ap_sync_reg_channel_write_data0_load_5_loc_cha;
wire    ap_sync_channel_write_data0_load_5_loc_cha;
wire    ap_channel_done_data0_load_4_loc_cha;
wire    data0_load_4_loc_cha_full_n;
reg    ap_sync_reg_channel_write_data0_load_4_loc_cha;
wire    ap_sync_channel_write_data0_load_4_loc_cha;
wire    ap_channel_done_data0_load_3_loc_cha;
wire    data0_load_3_loc_cha_full_n;
reg    ap_sync_reg_channel_write_data0_load_3_loc_cha;
wire    ap_sync_channel_write_data0_load_3_loc_cha;
wire    ap_channel_done_data0_load_2_loc_cha;
wire    data0_load_2_loc_cha_full_n;
reg    ap_sync_reg_channel_write_data0_load_2_loc_cha;
wire    ap_sync_channel_write_data0_load_2_loc_cha;
wire    ap_channel_done_data0_load_1_loc_cha;
wire    data0_load_1_loc_cha_full_n;
reg    ap_sync_reg_channel_write_data0_load_1_loc_cha;
wire    ap_sync_channel_write_data0_load_1_loc_cha;
wire    ap_channel_done_data0_load_loc_chann;
wire    data0_load_loc_chann_full_n;
reg    ap_sync_reg_channel_write_data0_load_loc_chann;
wire    ap_sync_channel_write_data0_load_loc_chann;
wire    Loop_sizeLoop_proc_U0_ap_start;
wire    Loop_sizeLoop_proc_U0_ap_done;
wire    Loop_sizeLoop_proc_U0_ap_continue;
wire    Loop_sizeLoop_proc_U0_ap_idle;
wire    Loop_sizeLoop_proc_U0_ap_ready;
wire    Loop_sizeLoop_proc_U0_size_read;
wire    Loop_sizeLoop_proc_U0_data1_read;
wire    Loop_sizeLoop_proc_U0_threshold_read;
wire   [31:0] Loop_sizeLoop_proc_U0_data2_din;
wire    Loop_sizeLoop_proc_U0_data2_write;
wire    ap_sync_continue;
wire    size_c_full_n;
wire   [31:0] size_c_dout;
wire    size_c_empty_n;
wire    threshold_c_full_n;
wire   [31:0] threshold_c_dout;
wire    threshold_c_empty_n;
wire   [31:0] data0_load_loc_chann_dout;
wire    data0_load_loc_chann_empty_n;
wire   [31:0] data0_load_1_loc_cha_dout;
wire    data0_load_1_loc_cha_empty_n;
wire   [31:0] data0_load_2_loc_cha_dout;
wire    data0_load_2_loc_cha_empty_n;
wire   [31:0] data0_load_3_loc_cha_dout;
wire    data0_load_3_loc_cha_empty_n;
wire   [31:0] data0_load_4_loc_cha_dout;
wire    data0_load_4_loc_cha_empty_n;
wire   [31:0] data0_load_5_loc_cha_dout;
wire    data0_load_5_loc_cha_empty_n;
wire   [31:0] data0_load_6_loc_cha_dout;
wire    data0_load_6_loc_cha_empty_n;
wire   [31:0] data0_load_7_loc_cha_dout;
wire    data0_load_7_loc_cha_empty_n;
wire   [31:0] data0_load_8_loc_cha_dout;
wire    data0_load_8_loc_cha_empty_n;
wire   [31:0] data0_load_9_loc_cha_dout;
wire    data0_load_9_loc_cha_empty_n;
wire   [31:0] data0_load_10_loc_ch_dout;
wire    data0_load_10_loc_ch_empty_n;
wire   [31:0] data0_load_11_loc_ch_dout;
wire    data0_load_11_loc_ch_empty_n;
wire   [31:0] data0_load_12_loc_ch_dout;
wire    data0_load_12_loc_ch_empty_n;
wire   [31:0] data0_load_13_loc_ch_dout;
wire    data0_load_13_loc_ch_empty_n;
wire   [31:0] data0_load_14_loc_ch_dout;
wire    data0_load_14_loc_ch_empty_n;
wire   [31:0] data0_load_15_loc_ch_dout;
wire    data0_load_15_loc_ch_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
reg    ap_sync_reg_Block_codeRepl49_pro_U0_ap_ready;
wire    ap_sync_Block_codeRepl49_pro_U0_ap_ready;
reg   [1:0] Block_codeRepl49_pro_U0_ap_ready_count;
reg    ap_sync_reg_Loop_sizeLoop_proc_U0_ap_ready;
wire    ap_sync_Loop_sizeLoop_proc_U0_ap_ready;
reg   [1:0] Loop_sizeLoop_proc_U0_ap_ready_count;
wire    Block_codeRepl49_pro_U0_start_full_n;
wire    Block_codeRepl49_pro_U0_start_write;
wire    Loop_sizeLoop_proc_U0_start_full_n;
wire    Loop_sizeLoop_proc_U0_start_write;

// power-on initialization
initial begin
#0 ap_sync_reg_channel_write_data0_load_15_loc_ch = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_14_loc_ch = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_13_loc_ch = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_12_loc_ch = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_11_loc_ch = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_10_loc_ch = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_9_loc_cha = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_8_loc_cha = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_7_loc_cha = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_6_loc_cha = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_5_loc_cha = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_4_loc_cha = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_3_loc_cha = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_2_loc_cha = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_1_loc_cha = 1'b0;
#0 ap_sync_reg_channel_write_data0_load_loc_chann = 1'b0;
#0 ap_sync_reg_Block_codeRepl49_pro_U0_ap_ready = 1'b0;
#0 Block_codeRepl49_pro_U0_ap_ready_count = 2'd0;
#0 ap_sync_reg_Loop_sizeLoop_proc_U0_ap_ready = 1'b0;
#0 Loop_sizeLoop_proc_U0_ap_ready_count = 2'd0;
end

a0_Block_codeRepl49_pro Block_codeRepl49_pro_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Block_codeRepl49_pro_U0_ap_start),
    .ap_done(Block_codeRepl49_pro_U0_ap_done),
    .ap_continue(Block_codeRepl49_pro_U0_ap_continue),
    .ap_idle(Block_codeRepl49_pro_U0_ap_idle),
    .ap_ready(Block_codeRepl49_pro_U0_ap_ready),
    .data0_dout(data0_dout),
    .data0_empty_n(data0_empty_n),
    .data0_read(Block_codeRepl49_pro_U0_data0_read),
    .size(size),
    .threshold(threshold),
    .size_out_din(Block_codeRepl49_pro_U0_size_out_din),
    .size_out_full_n(size_c_full_n),
    .size_out_write(Block_codeRepl49_pro_U0_size_out_write),
    .threshold_out_din(Block_codeRepl49_pro_U0_threshold_out_din),
    .threshold_out_full_n(threshold_c_full_n),
    .threshold_out_write(Block_codeRepl49_pro_U0_threshold_out_write),
    .ap_return_0(Block_codeRepl49_pro_U0_ap_return_0),
    .ap_return_1(Block_codeRepl49_pro_U0_ap_return_1),
    .ap_return_2(Block_codeRepl49_pro_U0_ap_return_2),
    .ap_return_3(Block_codeRepl49_pro_U0_ap_return_3),
    .ap_return_4(Block_codeRepl49_pro_U0_ap_return_4),
    .ap_return_5(Block_codeRepl49_pro_U0_ap_return_5),
    .ap_return_6(Block_codeRepl49_pro_U0_ap_return_6),
    .ap_return_7(Block_codeRepl49_pro_U0_ap_return_7),
    .ap_return_8(Block_codeRepl49_pro_U0_ap_return_8),
    .ap_return_9(Block_codeRepl49_pro_U0_ap_return_9),
    .ap_return_10(Block_codeRepl49_pro_U0_ap_return_10),
    .ap_return_11(Block_codeRepl49_pro_U0_ap_return_11),
    .ap_return_12(Block_codeRepl49_pro_U0_ap_return_12),
    .ap_return_13(Block_codeRepl49_pro_U0_ap_return_13),
    .ap_return_14(Block_codeRepl49_pro_U0_ap_return_14),
    .ap_return_15(Block_codeRepl49_pro_U0_ap_return_15)
);

a0_Loop_sizeLoop_proc Loop_sizeLoop_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Loop_sizeLoop_proc_U0_ap_start),
    .ap_done(Loop_sizeLoop_proc_U0_ap_done),
    .ap_continue(Loop_sizeLoop_proc_U0_ap_continue),
    .ap_idle(Loop_sizeLoop_proc_U0_ap_idle),
    .ap_ready(Loop_sizeLoop_proc_U0_ap_ready),
    .size_dout(size_c_dout),
    .size_empty_n(size_c_empty_n),
    .size_read(Loop_sizeLoop_proc_U0_size_read),
    .data1_dout(data1_dout),
    .data1_empty_n(data1_empty_n),
    .data1_read(Loop_sizeLoop_proc_U0_data1_read),
    .p_read(data0_load_loc_chann_dout),
    .p_read1(data0_load_1_loc_cha_dout),
    .p_read2(data0_load_2_loc_cha_dout),
    .p_read3(data0_load_3_loc_cha_dout),
    .threshold_dout(threshold_c_dout),
    .threshold_empty_n(threshold_c_empty_n),
    .threshold_read(Loop_sizeLoop_proc_U0_threshold_read),
    .p_read4(data0_load_4_loc_cha_dout),
    .p_read5(data0_load_5_loc_cha_dout),
    .p_read6(data0_load_6_loc_cha_dout),
    .p_read7(data0_load_7_loc_cha_dout),
    .p_read8(data0_load_8_loc_cha_dout),
    .p_read9(data0_load_9_loc_cha_dout),
    .p_read10(data0_load_10_loc_ch_dout),
    .p_read11(data0_load_11_loc_ch_dout),
    .p_read12(data0_load_12_loc_ch_dout),
    .p_read13(data0_load_13_loc_ch_dout),
    .p_read14(data0_load_14_loc_ch_dout),
    .p_read15(data0_load_15_loc_ch_dout),
    .data2_din(Loop_sizeLoop_proc_U0_data2_din),
    .data2_full_n(data2_full_n),
    .data2_write(Loop_sizeLoop_proc_U0_data2_write)
);

a0_fifo_w32_d2_A size_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_size_out_din),
    .if_full_n(size_c_full_n),
    .if_write(Block_codeRepl49_pro_U0_size_out_write),
    .if_dout(size_c_dout),
    .if_empty_n(size_c_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_size_read)
);

a0_fifo_w32_d2_A threshold_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_threshold_out_din),
    .if_full_n(threshold_c_full_n),
    .if_write(Block_codeRepl49_pro_U0_threshold_out_write),
    .if_dout(threshold_c_dout),
    .if_empty_n(threshold_c_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_threshold_read)
);

a0_fifo_w32_d2_A data0_load_loc_chann_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_0),
    .if_full_n(data0_load_loc_chann_full_n),
    .if_write(ap_channel_done_data0_load_loc_chann),
    .if_dout(data0_load_loc_chann_dout),
    .if_empty_n(data0_load_loc_chann_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_1_loc_cha_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_1),
    .if_full_n(data0_load_1_loc_cha_full_n),
    .if_write(ap_channel_done_data0_load_1_loc_cha),
    .if_dout(data0_load_1_loc_cha_dout),
    .if_empty_n(data0_load_1_loc_cha_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_2_loc_cha_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_2),
    .if_full_n(data0_load_2_loc_cha_full_n),
    .if_write(ap_channel_done_data0_load_2_loc_cha),
    .if_dout(data0_load_2_loc_cha_dout),
    .if_empty_n(data0_load_2_loc_cha_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_3_loc_cha_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_3),
    .if_full_n(data0_load_3_loc_cha_full_n),
    .if_write(ap_channel_done_data0_load_3_loc_cha),
    .if_dout(data0_load_3_loc_cha_dout),
    .if_empty_n(data0_load_3_loc_cha_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_4_loc_cha_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_4),
    .if_full_n(data0_load_4_loc_cha_full_n),
    .if_write(ap_channel_done_data0_load_4_loc_cha),
    .if_dout(data0_load_4_loc_cha_dout),
    .if_empty_n(data0_load_4_loc_cha_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_5_loc_cha_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_5),
    .if_full_n(data0_load_5_loc_cha_full_n),
    .if_write(ap_channel_done_data0_load_5_loc_cha),
    .if_dout(data0_load_5_loc_cha_dout),
    .if_empty_n(data0_load_5_loc_cha_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_6_loc_cha_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_6),
    .if_full_n(data0_load_6_loc_cha_full_n),
    .if_write(ap_channel_done_data0_load_6_loc_cha),
    .if_dout(data0_load_6_loc_cha_dout),
    .if_empty_n(data0_load_6_loc_cha_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_7_loc_cha_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_7),
    .if_full_n(data0_load_7_loc_cha_full_n),
    .if_write(ap_channel_done_data0_load_7_loc_cha),
    .if_dout(data0_load_7_loc_cha_dout),
    .if_empty_n(data0_load_7_loc_cha_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_8_loc_cha_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_8),
    .if_full_n(data0_load_8_loc_cha_full_n),
    .if_write(ap_channel_done_data0_load_8_loc_cha),
    .if_dout(data0_load_8_loc_cha_dout),
    .if_empty_n(data0_load_8_loc_cha_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_9_loc_cha_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_9),
    .if_full_n(data0_load_9_loc_cha_full_n),
    .if_write(ap_channel_done_data0_load_9_loc_cha),
    .if_dout(data0_load_9_loc_cha_dout),
    .if_empty_n(data0_load_9_loc_cha_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_10_loc_ch_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_10),
    .if_full_n(data0_load_10_loc_ch_full_n),
    .if_write(ap_channel_done_data0_load_10_loc_ch),
    .if_dout(data0_load_10_loc_ch_dout),
    .if_empty_n(data0_load_10_loc_ch_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_11_loc_ch_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_11),
    .if_full_n(data0_load_11_loc_ch_full_n),
    .if_write(ap_channel_done_data0_load_11_loc_ch),
    .if_dout(data0_load_11_loc_ch_dout),
    .if_empty_n(data0_load_11_loc_ch_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_12_loc_ch_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_12),
    .if_full_n(data0_load_12_loc_ch_full_n),
    .if_write(ap_channel_done_data0_load_12_loc_ch),
    .if_dout(data0_load_12_loc_ch_dout),
    .if_empty_n(data0_load_12_loc_ch_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_13_loc_ch_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_13),
    .if_full_n(data0_load_13_loc_ch_full_n),
    .if_write(ap_channel_done_data0_load_13_loc_ch),
    .if_dout(data0_load_13_loc_ch_dout),
    .if_empty_n(data0_load_13_loc_ch_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_14_loc_ch_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_14),
    .if_full_n(data0_load_14_loc_ch_full_n),
    .if_write(ap_channel_done_data0_load_14_loc_ch),
    .if_dout(data0_load_14_loc_ch_dout),
    .if_empty_n(data0_load_14_loc_ch_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

a0_fifo_w32_d2_A data0_load_15_loc_ch_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_codeRepl49_pro_U0_ap_return_15),
    .if_full_n(data0_load_15_loc_ch_full_n),
    .if_write(ap_channel_done_data0_load_15_loc_ch),
    .if_dout(data0_load_15_loc_ch_dout),
    .if_empty_n(data0_load_15_loc_ch_empty_n),
    .if_read(Loop_sizeLoop_proc_U0_ap_ready)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_Block_codeRepl49_pro_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Block_codeRepl49_pro_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Block_codeRepl49_pro_U0_ap_ready <= ap_sync_Block_codeRepl49_pro_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_Loop_sizeLoop_proc_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Loop_sizeLoop_proc_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Loop_sizeLoop_proc_U0_ap_ready <= ap_sync_Loop_sizeLoop_proc_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_10_loc_ch <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_10_loc_ch <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_10_loc_ch <= ap_sync_channel_write_data0_load_10_loc_ch;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_11_loc_ch <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_11_loc_ch <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_11_loc_ch <= ap_sync_channel_write_data0_load_11_loc_ch;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_12_loc_ch <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_12_loc_ch <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_12_loc_ch <= ap_sync_channel_write_data0_load_12_loc_ch;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_13_loc_ch <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_13_loc_ch <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_13_loc_ch <= ap_sync_channel_write_data0_load_13_loc_ch;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_14_loc_ch <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_14_loc_ch <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_14_loc_ch <= ap_sync_channel_write_data0_load_14_loc_ch;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_15_loc_ch <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_15_loc_ch <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_15_loc_ch <= ap_sync_channel_write_data0_load_15_loc_ch;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_1_loc_cha <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_1_loc_cha <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_1_loc_cha <= ap_sync_channel_write_data0_load_1_loc_cha;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_2_loc_cha <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_2_loc_cha <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_2_loc_cha <= ap_sync_channel_write_data0_load_2_loc_cha;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_3_loc_cha <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_3_loc_cha <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_3_loc_cha <= ap_sync_channel_write_data0_load_3_loc_cha;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_4_loc_cha <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_4_loc_cha <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_4_loc_cha <= ap_sync_channel_write_data0_load_4_loc_cha;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_5_loc_cha <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_5_loc_cha <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_5_loc_cha <= ap_sync_channel_write_data0_load_5_loc_cha;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_6_loc_cha <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_6_loc_cha <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_6_loc_cha <= ap_sync_channel_write_data0_load_6_loc_cha;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_7_loc_cha <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_7_loc_cha <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_7_loc_cha <= ap_sync_channel_write_data0_load_7_loc_cha;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_8_loc_cha <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_8_loc_cha <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_8_loc_cha <= ap_sync_channel_write_data0_load_8_loc_cha;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_9_loc_cha <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_9_loc_cha <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_9_loc_cha <= ap_sync_channel_write_data0_load_9_loc_cha;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_channel_write_data0_load_loc_chann <= 1'b0;
    end else begin
        if (((Block_codeRepl49_pro_U0_ap_done & Block_codeRepl49_pro_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_data0_load_loc_chann <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_data0_load_loc_chann <= ap_sync_channel_write_data0_load_loc_chann;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == Block_codeRepl49_pro_U0_ap_ready) & (ap_sync_ready == 1'b1))) begin
        Block_codeRepl49_pro_U0_ap_ready_count <= (Block_codeRepl49_pro_U0_ap_ready_count - 2'd1);
    end else if (((ap_sync_ready == 1'b0) & (1'b1 == Block_codeRepl49_pro_U0_ap_ready))) begin
        Block_codeRepl49_pro_U0_ap_ready_count <= (Block_codeRepl49_pro_U0_ap_ready_count + 2'd1);
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == Loop_sizeLoop_proc_U0_ap_ready) & (ap_sync_ready == 1'b1))) begin
        Loop_sizeLoop_proc_U0_ap_ready_count <= (Loop_sizeLoop_proc_U0_ap_ready_count - 2'd1);
    end else if (((ap_sync_ready == 1'b0) & (1'b1 == Loop_sizeLoop_proc_U0_ap_ready))) begin
        Loop_sizeLoop_proc_U0_ap_ready_count <= (Loop_sizeLoop_proc_U0_ap_ready_count + 2'd1);
    end
end

assign Block_codeRepl49_pro_U0_ap_continue = (ap_sync_channel_write_data0_load_loc_chann & ap_sync_channel_write_data0_load_9_loc_cha & ap_sync_channel_write_data0_load_8_loc_cha & ap_sync_channel_write_data0_load_7_loc_cha & ap_sync_channel_write_data0_load_6_loc_cha & ap_sync_channel_write_data0_load_5_loc_cha & ap_sync_channel_write_data0_load_4_loc_cha & ap_sync_channel_write_data0_load_3_loc_cha & ap_sync_channel_write_data0_load_2_loc_cha & ap_sync_channel_write_data0_load_1_loc_cha & ap_sync_channel_write_data0_load_15_loc_ch & ap_sync_channel_write_data0_load_14_loc_ch & ap_sync_channel_write_data0_load_13_loc_ch & ap_sync_channel_write_data0_load_12_loc_ch & ap_sync_channel_write_data0_load_11_loc_ch & ap_sync_channel_write_data0_load_10_loc_ch);

assign Block_codeRepl49_pro_U0_ap_start = ((ap_sync_reg_Block_codeRepl49_pro_U0_ap_ready ^ 1'b1) & ap_start);

assign Block_codeRepl49_pro_U0_start_full_n = 1'b1;

assign Block_codeRepl49_pro_U0_start_write = 1'b0;

assign Loop_sizeLoop_proc_U0_ap_continue = 1'b1;

assign Loop_sizeLoop_proc_U0_ap_start = ((ap_sync_reg_Loop_sizeLoop_proc_U0_ap_ready ^ 1'b1) & data0_load_loc_chann_empty_n & data0_load_9_loc_cha_empty_n & data0_load_8_loc_cha_empty_n & data0_load_7_loc_cha_empty_n & data0_load_6_loc_cha_empty_n & data0_load_5_loc_cha_empty_n & data0_load_4_loc_cha_empty_n & data0_load_3_loc_cha_empty_n & data0_load_2_loc_cha_empty_n & data0_load_1_loc_cha_empty_n & data0_load_15_loc_ch_empty_n & data0_load_14_loc_ch_empty_n & data0_load_13_loc_ch_empty_n & data0_load_12_loc_ch_empty_n & data0_load_11_loc_ch_empty_n & data0_load_10_loc_ch_empty_n & ap_start);

assign Loop_sizeLoop_proc_U0_start_full_n = 1'b1;

assign Loop_sizeLoop_proc_U0_start_write = 1'b0;

assign ap_channel_done_data0_load_10_loc_ch = ((ap_sync_reg_channel_write_data0_load_10_loc_ch ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_11_loc_ch = ((ap_sync_reg_channel_write_data0_load_11_loc_ch ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_12_loc_ch = ((ap_sync_reg_channel_write_data0_load_12_loc_ch ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_13_loc_ch = ((ap_sync_reg_channel_write_data0_load_13_loc_ch ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_14_loc_ch = ((ap_sync_reg_channel_write_data0_load_14_loc_ch ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_15_loc_ch = ((ap_sync_reg_channel_write_data0_load_15_loc_ch ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_1_loc_cha = ((ap_sync_reg_channel_write_data0_load_1_loc_cha ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_2_loc_cha = ((ap_sync_reg_channel_write_data0_load_2_loc_cha ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_3_loc_cha = ((ap_sync_reg_channel_write_data0_load_3_loc_cha ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_4_loc_cha = ((ap_sync_reg_channel_write_data0_load_4_loc_cha ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_5_loc_cha = ((ap_sync_reg_channel_write_data0_load_5_loc_cha ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_6_loc_cha = ((ap_sync_reg_channel_write_data0_load_6_loc_cha ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_7_loc_cha = ((ap_sync_reg_channel_write_data0_load_7_loc_cha ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_8_loc_cha = ((ap_sync_reg_channel_write_data0_load_8_loc_cha ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_9_loc_cha = ((ap_sync_reg_channel_write_data0_load_9_loc_cha ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_channel_done_data0_load_loc_chann = ((ap_sync_reg_channel_write_data0_load_loc_chann ^ 1'b1) & Block_codeRepl49_pro_U0_ap_done);

assign ap_done = Loop_sizeLoop_proc_U0_ap_done;

assign ap_idle = ((data0_load_15_loc_ch_empty_n ^ 1'b1) & (data0_load_14_loc_ch_empty_n ^ 1'b1) & (data0_load_13_loc_ch_empty_n ^ 1'b1) & (data0_load_12_loc_ch_empty_n ^ 1'b1) & (data0_load_11_loc_ch_empty_n ^ 1'b1) & (data0_load_10_loc_ch_empty_n ^ 1'b1) & (data0_load_9_loc_cha_empty_n ^ 1'b1) & (data0_load_8_loc_cha_empty_n ^ 1'b1) & (data0_load_7_loc_cha_empty_n ^ 1'b1) & (data0_load_6_loc_cha_empty_n ^ 1'b1) & (data0_load_5_loc_cha_empty_n ^ 1'b1) & (data0_load_4_loc_cha_empty_n ^ 1'b1) & (data0_load_3_loc_cha_empty_n ^ 1'b1) & (data0_load_2_loc_cha_empty_n ^ 1'b1) & (data0_load_1_loc_cha_empty_n ^ 1'b1) & (data0_load_loc_chann_empty_n ^ 1'b1) & Loop_sizeLoop_proc_U0_ap_idle & Block_codeRepl49_pro_U0_ap_idle);

assign ap_ready = ap_sync_ready;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign ap_sync_Block_codeRepl49_pro_U0_ap_ready = (ap_sync_reg_Block_codeRepl49_pro_U0_ap_ready | Block_codeRepl49_pro_U0_ap_ready);

assign ap_sync_Loop_sizeLoop_proc_U0_ap_ready = (ap_sync_reg_Loop_sizeLoop_proc_U0_ap_ready | Loop_sizeLoop_proc_U0_ap_ready);

assign ap_sync_channel_write_data0_load_10_loc_ch = ((data0_load_10_loc_ch_full_n & ap_channel_done_data0_load_10_loc_ch) | ap_sync_reg_channel_write_data0_load_10_loc_ch);

assign ap_sync_channel_write_data0_load_11_loc_ch = ((data0_load_11_loc_ch_full_n & ap_channel_done_data0_load_11_loc_ch) | ap_sync_reg_channel_write_data0_load_11_loc_ch);

assign ap_sync_channel_write_data0_load_12_loc_ch = ((data0_load_12_loc_ch_full_n & ap_channel_done_data0_load_12_loc_ch) | ap_sync_reg_channel_write_data0_load_12_loc_ch);

assign ap_sync_channel_write_data0_load_13_loc_ch = ((data0_load_13_loc_ch_full_n & ap_channel_done_data0_load_13_loc_ch) | ap_sync_reg_channel_write_data0_load_13_loc_ch);

assign ap_sync_channel_write_data0_load_14_loc_ch = ((data0_load_14_loc_ch_full_n & ap_channel_done_data0_load_14_loc_ch) | ap_sync_reg_channel_write_data0_load_14_loc_ch);

assign ap_sync_channel_write_data0_load_15_loc_ch = ((data0_load_15_loc_ch_full_n & ap_channel_done_data0_load_15_loc_ch) | ap_sync_reg_channel_write_data0_load_15_loc_ch);

assign ap_sync_channel_write_data0_load_1_loc_cha = ((data0_load_1_loc_cha_full_n & ap_channel_done_data0_load_1_loc_cha) | ap_sync_reg_channel_write_data0_load_1_loc_cha);

assign ap_sync_channel_write_data0_load_2_loc_cha = ((data0_load_2_loc_cha_full_n & ap_channel_done_data0_load_2_loc_cha) | ap_sync_reg_channel_write_data0_load_2_loc_cha);

assign ap_sync_channel_write_data0_load_3_loc_cha = ((data0_load_3_loc_cha_full_n & ap_channel_done_data0_load_3_loc_cha) | ap_sync_reg_channel_write_data0_load_3_loc_cha);

assign ap_sync_channel_write_data0_load_4_loc_cha = ((data0_load_4_loc_cha_full_n & ap_channel_done_data0_load_4_loc_cha) | ap_sync_reg_channel_write_data0_load_4_loc_cha);

assign ap_sync_channel_write_data0_load_5_loc_cha = ((data0_load_5_loc_cha_full_n & ap_channel_done_data0_load_5_loc_cha) | ap_sync_reg_channel_write_data0_load_5_loc_cha);

assign ap_sync_channel_write_data0_load_6_loc_cha = ((data0_load_6_loc_cha_full_n & ap_channel_done_data0_load_6_loc_cha) | ap_sync_reg_channel_write_data0_load_6_loc_cha);

assign ap_sync_channel_write_data0_load_7_loc_cha = ((data0_load_7_loc_cha_full_n & ap_channel_done_data0_load_7_loc_cha) | ap_sync_reg_channel_write_data0_load_7_loc_cha);

assign ap_sync_channel_write_data0_load_8_loc_cha = ((data0_load_8_loc_cha_full_n & ap_channel_done_data0_load_8_loc_cha) | ap_sync_reg_channel_write_data0_load_8_loc_cha);

assign ap_sync_channel_write_data0_load_9_loc_cha = ((data0_load_9_loc_cha_full_n & ap_channel_done_data0_load_9_loc_cha) | ap_sync_reg_channel_write_data0_load_9_loc_cha);

assign ap_sync_channel_write_data0_load_loc_chann = ((data0_load_loc_chann_full_n & ap_channel_done_data0_load_loc_chann) | ap_sync_reg_channel_write_data0_load_loc_chann);

assign ap_sync_continue = 1'b1;

assign ap_sync_done = Loop_sizeLoop_proc_U0_ap_done;

assign ap_sync_ready = (ap_sync_Loop_sizeLoop_proc_U0_ap_ready & ap_sync_Block_codeRepl49_pro_U0_ap_ready);

assign data0_read = Block_codeRepl49_pro_U0_data0_read;

assign data1_read = Loop_sizeLoop_proc_U0_data1_read;

assign data2_din = Loop_sizeLoop_proc_U0_data2_din;

assign data2_write = Loop_sizeLoop_proc_U0_data2_write;

endmodule //a0_myFuncAccel
