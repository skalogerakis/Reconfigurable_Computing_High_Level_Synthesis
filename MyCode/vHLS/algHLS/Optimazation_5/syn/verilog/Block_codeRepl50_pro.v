// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Block_codeRepl50_pro (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        data0_req_din,
        data0_req_full_n,
        data0_req_write,
        data0_rsp_empty_n,
        data0_rsp_read,
        data0_address,
        data0_datain,
        data0_dataout,
        data0_size,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3,
        ap_return_4,
        ap_return_5,
        ap_return_6,
        ap_return_7,
        ap_return_8,
        ap_return_9,
        ap_return_10,
        ap_return_11,
        ap_return_12,
        ap_return_13,
        ap_return_14,
        ap_return_15
);

parameter    ap_ST_fsm_state1 = 18'd1;
parameter    ap_ST_fsm_state2 = 18'd2;
parameter    ap_ST_fsm_state3 = 18'd4;
parameter    ap_ST_fsm_state4 = 18'd8;
parameter    ap_ST_fsm_state5 = 18'd16;
parameter    ap_ST_fsm_state6 = 18'd32;
parameter    ap_ST_fsm_state7 = 18'd64;
parameter    ap_ST_fsm_state8 = 18'd128;
parameter    ap_ST_fsm_state9 = 18'd256;
parameter    ap_ST_fsm_state10 = 18'd512;
parameter    ap_ST_fsm_state11 = 18'd1024;
parameter    ap_ST_fsm_state12 = 18'd2048;
parameter    ap_ST_fsm_state13 = 18'd4096;
parameter    ap_ST_fsm_state14 = 18'd8192;
parameter    ap_ST_fsm_state15 = 18'd16384;
parameter    ap_ST_fsm_state16 = 18'd32768;
parameter    ap_ST_fsm_state17 = 18'd65536;
parameter    ap_ST_fsm_state18 = 18'd131072;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   data0_req_din;
input   data0_req_full_n;
output   data0_req_write;
input   data0_rsp_empty_n;
output   data0_rsp_read;
output  [31:0] data0_address;
input  [31:0] data0_datain;
output  [31:0] data0_dataout;
output  [31:0] data0_size;
output  [31:0] ap_return_0;
output  [31:0] ap_return_1;
output  [31:0] ap_return_2;
output  [31:0] ap_return_3;
output  [31:0] ap_return_4;
output  [31:0] ap_return_5;
output  [31:0] ap_return_6;
output  [31:0] ap_return_7;
output  [31:0] ap_return_8;
output  [31:0] ap_return_9;
output  [31:0] ap_return_10;
output  [31:0] ap_return_11;
output  [31:0] ap_return_12;
output  [31:0] ap_return_13;
output  [31:0] ap_return_14;
output  [31:0] ap_return_15;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg data0_req_write;
reg data0_rsp_read;
reg[31:0] ap_return_0;
reg[31:0] ap_return_1;
reg[31:0] ap_return_2;
reg[31:0] ap_return_3;
reg[31:0] ap_return_4;
reg[31:0] ap_return_5;
reg[31:0] ap_return_6;
reg[31:0] ap_return_7;
reg[31:0] ap_return_8;
reg[31:0] ap_return_9;
reg[31:0] ap_return_10;
reg[31:0] ap_return_11;
reg[31:0] ap_return_12;
reg[31:0] ap_return_13;
reg[31:0] ap_return_14;
reg[31:0] ap_return_15;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [17:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] data0_read_reg_113;
wire    ap_CS_fsm_state3;
reg   [31:0] data0_read_1_reg_118;
wire    ap_CS_fsm_state4;
reg   [31:0] data0_read_2_reg_123;
wire    ap_CS_fsm_state5;
reg   [31:0] data0_read_3_reg_128;
wire    ap_CS_fsm_state6;
reg   [31:0] data0_read_4_reg_133;
wire    ap_CS_fsm_state7;
reg   [31:0] data0_read_5_reg_138;
wire    ap_CS_fsm_state8;
reg   [31:0] data0_read_6_reg_143;
wire    ap_CS_fsm_state9;
reg   [31:0] data0_read_7_reg_148;
wire    ap_CS_fsm_state10;
reg   [31:0] data0_read_8_reg_153;
wire    ap_CS_fsm_state11;
reg   [31:0] data0_read_9_reg_158;
wire    ap_CS_fsm_state12;
reg   [31:0] data0_read_10_reg_163;
wire    ap_CS_fsm_state13;
reg   [31:0] data0_read_11_reg_168;
wire    ap_CS_fsm_state14;
reg   [31:0] data0_read_12_reg_173;
wire    ap_CS_fsm_state15;
reg   [31:0] data0_read_13_reg_178;
wire    ap_CS_fsm_state16;
reg   [31:0] data0_read_14_reg_183;
wire    ap_CS_fsm_state17;
reg    ap_block_state1;
wire    ap_CS_fsm_state18;
reg   [31:0] ap_return_0_preg;
reg   [31:0] ap_return_1_preg;
reg   [31:0] ap_return_2_preg;
reg   [31:0] ap_return_3_preg;
reg   [31:0] ap_return_4_preg;
reg   [31:0] ap_return_5_preg;
reg   [31:0] ap_return_6_preg;
reg   [31:0] ap_return_7_preg;
reg   [31:0] ap_return_8_preg;
reg   [31:0] ap_return_9_preg;
reg   [31:0] ap_return_10_preg;
reg   [31:0] ap_return_11_preg;
reg   [31:0] ap_return_12_preg;
reg   [31:0] ap_return_13_preg;
reg   [31:0] ap_return_14_preg;
reg   [31:0] ap_return_15_preg;
reg   [17:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 18'd1;
#0 ap_return_0_preg = 32'd0;
#0 ap_return_1_preg = 32'd0;
#0 ap_return_2_preg = 32'd0;
#0 ap_return_3_preg = 32'd0;
#0 ap_return_4_preg = 32'd0;
#0 ap_return_5_preg = 32'd0;
#0 ap_return_6_preg = 32'd0;
#0 ap_return_7_preg = 32'd0;
#0 ap_return_8_preg = 32'd0;
#0 ap_return_9_preg = 32'd0;
#0 ap_return_10_preg = 32'd0;
#0 ap_return_11_preg = 32'd0;
#0 ap_return_12_preg = 32'd0;
#0 ap_return_13_preg = 32'd0;
#0 ap_return_14_preg = 32'd0;
#0 ap_return_15_preg = 32'd0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_0_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_0_preg <= data0_read_reg_113;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_10_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_10_preg <= data0_read_10_reg_163;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_11_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_11_preg <= data0_read_11_reg_168;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_12_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_12_preg <= data0_read_12_reg_173;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_13_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_13_preg <= data0_read_13_reg_178;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_14_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_14_preg <= data0_read_14_reg_183;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_15_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_15_preg <= data0_datain;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_1_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_1_preg <= data0_read_1_reg_118;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_2_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_2_preg <= data0_read_2_reg_123;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_3_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_3_preg <= data0_read_3_reg_128;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_4_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_4_preg <= data0_read_4_reg_133;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_5_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_5_preg <= data0_read_5_reg_138;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_6_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_6_preg <= data0_read_6_reg_143;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_7_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_7_preg <= data0_read_7_reg_148;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_8_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_8_preg <= data0_read_8_reg_153;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_9_preg <= 32'd0;
    end else begin
        if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
            ap_return_9_preg <= data0_read_9_reg_158;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state13))) begin
        data0_read_10_reg_163 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state14))) begin
        data0_read_11_reg_168 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state15))) begin
        data0_read_12_reg_173 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state16))) begin
        data0_read_13_reg_178 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state17))) begin
        data0_read_14_reg_183 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        data0_read_1_reg_118 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        data0_read_2_reg_123 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
        data0_read_3_reg_128 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
        data0_read_4_reg_133 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state8))) begin
        data0_read_5_reg_138 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
        data0_read_6_reg_143 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
        data0_read_7_reg_148 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state11))) begin
        data0_read_8_reg_153 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state12))) begin
        data0_read_9_reg_158 <= data0_datain;
    end
end

always @ (posedge ap_clk) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        data0_read_reg_113 <= data0_datain;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_0 = data0_read_reg_113;
    end else begin
        ap_return_0 = ap_return_0_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_1 = data0_read_1_reg_118;
    end else begin
        ap_return_1 = ap_return_1_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_10 = data0_read_10_reg_163;
    end else begin
        ap_return_10 = ap_return_10_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_11 = data0_read_11_reg_168;
    end else begin
        ap_return_11 = ap_return_11_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_12 = data0_read_12_reg_173;
    end else begin
        ap_return_12 = ap_return_12_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_13 = data0_read_13_reg_178;
    end else begin
        ap_return_13 = ap_return_13_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_14 = data0_read_14_reg_183;
    end else begin
        ap_return_14 = ap_return_14_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_15 = data0_datain;
    end else begin
        ap_return_15 = ap_return_15_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_2 = data0_read_2_reg_123;
    end else begin
        ap_return_2 = ap_return_2_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_3 = data0_read_3_reg_128;
    end else begin
        ap_return_3 = ap_return_3_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_4 = data0_read_4_reg_133;
    end else begin
        ap_return_4 = ap_return_4_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_5 = data0_read_5_reg_138;
    end else begin
        ap_return_5 = ap_return_5_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_6 = data0_read_6_reg_143;
    end else begin
        ap_return_6 = ap_return_6_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_7 = data0_read_7_reg_148;
    end else begin
        ap_return_7 = ap_return_7_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_8 = data0_read_8_reg_153;
    end else begin
        ap_return_8 = ap_return_8_preg;
    end
end

always @ (*) begin
    if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
        ap_return_9 = data0_read_9_reg_158;
    end else begin
        ap_return_9 = ap_return_9_preg;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        data0_req_write = 1'b1;
    end else begin
        data0_req_write = 1'b0;
    end
end

always @ (*) begin
    if ((((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state6)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state5)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state4)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state17)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state16)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state15)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state14)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state13)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state12)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state11)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state10)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state9)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state8)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7)) | ((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state3)))) begin
        data0_rsp_read = 1'b1;
    end else begin
        data0_rsp_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state10 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state11))) begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end
        end
        ap_ST_fsm_state12 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state12))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end
        end
        ap_ST_fsm_state13 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state13))) begin
                ap_NS_fsm = ap_ST_fsm_state14;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end
        end
        ap_ST_fsm_state14 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state14))) begin
                ap_NS_fsm = ap_ST_fsm_state15;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state14;
            end
        end
        ap_ST_fsm_state15 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state15))) begin
                ap_NS_fsm = ap_ST_fsm_state16;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state15;
            end
        end
        ap_ST_fsm_state16 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state16))) begin
                ap_NS_fsm = ap_ST_fsm_state17;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state16;
            end
        end
        ap_ST_fsm_state17 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state17))) begin
                ap_NS_fsm = ap_ST_fsm_state18;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state17;
            end
        end
        ap_ST_fsm_state18 : begin
            if (((data0_rsp_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state18))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state18;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];

assign ap_CS_fsm_state18 = ap_CS_fsm[32'd17];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign data0_address = 32'd0;

assign data0_dataout = 32'd0;

assign data0_req_din = 1'b0;

assign data0_size = 32'd16;

endmodule //Block_codeRepl50_pro
