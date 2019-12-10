// d52cbaca0ef8cf4fd3d6354deb5066970fb6511d02d18d15835e6014ed847fb0
// (c) Copyright 2018 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module bram2axis #(
    parameter C_AXIS_DATA_WIDTH = 64,
    parameter C_BRAM_DATA_DEPTH = 32,
    parameter C_BRAM_DATA_WIDTH = 32,
    parameter C_BRAM_ADDR_WIDTH = 0,
    parameter C_MB_DEPTH = 1,
    parameter C_NUM_PORTS = 1,	
    parameter MB_SEL_BITS = clogb2(C_MB_DEPTH),
    parameter C_MAX_MB_DEPTH = 8,
    parameter NUM_BYTES = C_BRAM_DATA_WIDTH/8
    )(
    //Control interface
    input ACC_CLK,
    input ARESETN,
    input CTRL_ACC_START,
    input CTRL_ACC_DONE,
    output CTRL_READY,      //Unused
    output CTRL_CANSTART,   //End of transfer - TLAST received
    input [C_BRAM_ADDR_WIDTH-1:0] DATA_DEPTH_M1,
    output DATA_DEPTH_READ,
    input DATA_DEPTH_EMPTY,
    //AXI Stream interface
    output AXIS_TLAST,
    output AXIS_TVALID,
    output [C_AXIS_DATA_WIDTH-1:0] AXIS_TDATA,
    input AXIS_TREADY,
    //ACC BRAM IF-0
    input [C_BRAM_ADDR_WIDTH-1:0] bram0_addr,
    input [C_BRAM_DATA_WIDTH-1:0] bram0_din,
    output [C_BRAM_DATA_WIDTH-1:0] bram0_dout,
    input [C_BRAM_DATA_WIDTH/8-1:0] bram0_we,
    input bram0_en,
    //ACC BRAM IF-1
    input [C_BRAM_ADDR_WIDTH-1:0] bram1_addr,
    input [C_BRAM_DATA_WIDTH-1:0] bram1_din,
    output [C_BRAM_DATA_WIDTH-1:0] bram1_dout,
    input [C_BRAM_DATA_WIDTH/8-1:0] bram1_we,
    input bram1_en
    );
    
    function integer clogb2 (input integer bit_depth);
    begin
        for (clogb2 = 0; bit_depth > 0; clogb2=clogb2+1)
            bit_depth = bit_depth >> 1;  
    end
    endfunction
        
    wire CTRL_EN_INPUT_IF;
    wire CTRL_EN_OUTPUT_IF;
    
    wire [C_BRAM_ADDR_WIDTH-1:0] out_bram_addr [C_MAX_MB_DEPTH-1:0];
    wire [C_BRAM_DATA_WIDTH-1:0] out_bram_dout [C_MAX_MB_DEPTH-1:0];
    
    wire [C_BRAM_ADDR_WIDTH-1:0] addr0 [C_MB_DEPTH-1:0];
    wire [C_BRAM_DATA_WIDTH-1:0] din0 [C_MB_DEPTH-1:0];
    wire [C_BRAM_DATA_WIDTH-1:0] dout0 [C_MB_DEPTH-1:0];
    wire [C_BRAM_DATA_WIDTH/8-1:0] we0 [C_MB_DEPTH-1:0];
    wire [C_MB_DEPTH-1:0] en0 [C_MB_DEPTH-1:0];
    
    wire [C_BRAM_ADDR_WIDTH-1:0] addr1 [C_MB_DEPTH-1:0]; 
    wire [C_BRAM_DATA_WIDTH-1:0] din1 [C_MB_DEPTH-1:0];
    wire [C_BRAM_DATA_WIDTH-1:0] dout1 [C_MB_DEPTH-1:0];
    wire [C_BRAM_DATA_WIDTH/8-1:0] we1 [C_MB_DEPTH-1:0];
    wire [C_MB_DEPTH-1:0] en1;
    
    wire [C_BRAM_ADDR_WIDTH-1:0] ifout_bram_addr;
    wire [C_BRAM_DATA_WIDTH-1:0] ifout_bram_dout;
        
    wire ctrl_next_out;
    
    reg [MB_SEL_BITS-1:0] start_cnt;
    reg [MB_SEL_BITS-1:0] start_next;
    reg [MB_SEL_BITS-1:0] acc_mb_sel;
    reg [MB_SEL_BITS-1:0] acc_mb_next;
    reg [MB_SEL_BITS-1:0] out_mb_sel;
    reg [MB_SEL_BITS-1:0] out_mb_next;
    
    reg start_allow;
    reg in_allow;
    reg out_allow;
    
    assign CTRL_READY = in_allow;
    assign CTRL_CANSTART = start_allow;
    
    //multibuffer selection logic
    generate
        if(C_MB_DEPTH > 1) begin
            always @(posedge ACC_CLK) begin
                if(~ARESETN) begin
                    start_cnt <= 0;
                    start_next <= 1;
                    acc_mb_sel <= 0;
                    acc_mb_next <= 1;
                    out_mb_sel <= 0;
                    out_mb_next <= 1;
                    start_allow <= 1;
                    in_allow <= 1;
                    out_allow <= 0;
                end
                else begin
                    //start pointer transition
                    if(CTRL_ACC_START) begin
                        if(start_next == out_mb_sel)
                            start_allow <= 0;
                        start_cnt <= start_next;
                        if(start_next < C_MB_DEPTH-1)
                            start_next <= start_next + 1;
                        else
                            start_next <= 0;
                    end
                    
                    //acc pointer transition
                    if(CTRL_ACC_DONE) begin
                        out_allow <= 1;
                        if(acc_mb_next == out_mb_sel)
                            in_allow <= 0;
                            
                        acc_mb_sel <= acc_mb_next;
                        if(acc_mb_next < C_MB_DEPTH-1)
                            acc_mb_next <= acc_mb_next + 1;
                        else
                            acc_mb_next <= 0;
                    end
                    
                    //output pointer transition
                    if(ctrl_next_out) begin
                        in_allow <= 1;
                        start_allow <= 1;
                        if(acc_mb_sel == out_mb_next)
                            out_allow <= 0;
                                  
                        out_mb_sel <= out_mb_next;
                        if(out_mb_next < C_MB_DEPTH-1)
                            out_mb_next <= out_mb_next + 1;
                        else
                            out_mb_next <= 0;
                    end
                end
            end
        end
        else begin
            always @(posedge ACC_CLK) begin
                if(~ARESETN) begin
                    in_allow <= 1;
                    start_allow <= 1;
                    out_allow <= 0;
                end
                else begin
                   if(ctrl_next_out) begin
                       in_allow <= 1;
                       start_allow <= 1;
                       out_allow <= 0;
                   end
                        
                   if(CTRL_ACC_DONE) begin
                       in_allow <= 0;
                       start_allow <= 0;
                       out_allow <= 1;
                   end
                end
            end
        end
    endgenerate
    
    //generate the two demuxes for the accelerator BRAM ports
    generate
        if(C_MB_DEPTH > 1) begin
            bram_demux #(
                .C_ADDR_WIDTH(C_BRAM_ADDR_WIDTH),
                .C_DATA_WIDTH(C_BRAM_DATA_WIDTH),
                .C_NUM_INTERFACES(C_MB_DEPTH)
            ) acc_port0 (
                .sel(acc_mb_sel),
                //BRAM IF
                .bram_addr(bram0_addr),
                .bram_dout(bram0_dout),
                .bram_din(bram0_din), 
                .bram_we(bram0_we),
                .bram_en(bram0_en),
                .bram0_addr(addr0[0]),
                .bram0_dout(dout0[0]),
                .bram0_din(din0[0]),
                .bram0_we(we0[0]),
                .bram0_en(en0[0]),
                .bram1_addr(addr0[1]),
                .bram1_dout(dout0[1]),
                .bram1_din(din0[1]),
                .bram1_we(we0[1]),
                .bram1_en(en0[1]),
                .bram2_addr(addr0[2]),
                .bram2_dout(dout0[2]),
                .bram2_din(din0[2]),
                .bram2_we(we0[2]),
                .bram2_en(en0[2]),
                .bram3_addr(addr0[3]),
                .bram3_dout(dout0[3]),
                .bram3_din(din0[3]),
                .bram3_we(we0[3]),
                .bram3_en(en0[3]),
                .bram4_addr(addr0[4]),
                .bram4_dout(dout0[4]),
                .bram4_din(din0[4]),
                .bram4_we(we0[4]),
                .bram4_en(en0[4]),
                .bram5_addr(addr0[5]),
                .bram5_dout(dout0[5]),
                .bram5_din(din0[5]),
                .bram5_we(we0[5]),
                .bram5_en(en0[5]),
                .bram6_addr(addr0[6]),
                .bram6_dout(dout0[6]),
                .bram6_din(din0[6]),
                .bram6_we(we0[6]),
                .bram6_en(en0[6]),
                .bram7_addr(addr0[7]),
                .bram7_dout(dout0[7]),
                .bram7_din(din0[7]),
                .bram7_we(we0[7]),
                .bram7_en(en0[7])           
            );
            
            bram_demux #(
                .C_ADDR_WIDTH(C_BRAM_ADDR_WIDTH),
                .C_DATA_WIDTH(C_BRAM_DATA_WIDTH),
                .C_NUM_INTERFACES(C_MB_DEPTH)
            ) acc_port1 (
                .sel(acc_mb_sel),
                //BRAM IF
                .bram_addr(bram1_addr),
                .bram_dout(bram1_dout),
                .bram_din(bram1_din), 
                .bram_we(bram1_we),
                .bram_en(bram1_en),
                .bram0_addr(addr1[0]),
                .bram0_dout(dout1[0]),
                .bram0_din(din1[0]),
                .bram0_we(we1[0]),
                .bram0_en(en1[0]),
                .bram1_addr(addr1[1]),
                .bram1_dout(dout1[1]),
                .bram1_din(din1[1]),
                .bram1_we(we1[1]),
                .bram1_en(en1[1]),
                .bram2_addr(addr1[2]),
                .bram2_dout(dout1[2]),
                .bram2_din(din1[2]),
                .bram2_we(we1[2]),
                .bram2_en(en1[2]),
                .bram3_addr(addr1[3]),
                .bram3_dout(dout1[3]),
                .bram3_din(din1[3]),
                .bram3_we(we1[3]),
                .bram3_en(en1[3]),
                .bram4_addr(addr1[4]),
                .bram4_dout(dout1[4]),
                .bram4_din(din1[4]),
                .bram4_we(we1[4]),
                .bram4_en(en1[4]),
                .bram5_addr(addr1[5]),
                .bram5_dout(dout1[5]),
                .bram5_din(din1[5]),
                .bram5_we(we1[5]),
                .bram5_en(en1[5]),
                .bram6_addr(addr1[6]),
                .bram6_dout(dout1[6]),
                .bram6_din(din1[6]),
                .bram6_we(we1[6]),
                .bram6_en(en1[6]),
                .bram7_addr(addr1[7]),
                .bram7_dout(dout1[7]),
                .bram7_din(din1[7]),
                .bram7_we(we1[7]),
                .bram7_en(en1[7])           
            );
        end
        else begin
            assign addr0[0] = bram0_addr;
            assign din0[0] = bram0_din;
            assign bram0_dout = dout0[0];
            assign we0[0] = bram0_we;
            assign en0[0] = bram0_en;
            
            assign addr1[0] = bram1_addr;
            assign din1[0] = bram1_din;
            assign bram1_dout = dout1[0];
            assign we1[0] = bram1_we;
            assign en1[0] = bram1_en;
        end
    endgenerate
    
    //generate output BRAM multi buffer demux if needed, otherwise direct connect (no mux)
    generate
        if(C_MB_DEPTH > 1) begin
            bram_demux #(
                .C_ADDR_WIDTH(C_BRAM_ADDR_WIDTH),
                .C_DATA_WIDTH(C_BRAM_DATA_WIDTH),
                .C_NUM_INTERFACES(C_MB_DEPTH)
                ) output_mux (
                .sel(out_mb_sel),
                //BRAM IF
                .bram_addr(ifout_bram_addr),
                .bram_din(0),
                .bram_dout(ifout_bram_dout), 
                .bram_we(0),
                .bram_en(1),
                .bram0_addr(out_bram_addr[0]),
                .bram0_dout(out_bram_dout[0]),
                .bram1_addr(out_bram_addr[1]),
                .bram1_dout(out_bram_dout[1]),
                .bram2_addr(out_bram_addr[2]),
                .bram2_dout(out_bram_dout[2]),
                .bram3_addr(out_bram_addr[3]),
                .bram3_dout(out_bram_dout[3]),
                .bram4_addr(out_bram_addr[4]),
                .bram4_dout(out_bram_dout[4]),
                .bram5_addr(out_bram_addr[5]),
                .bram5_dout(out_bram_dout[5]),
                .bram6_addr(out_bram_addr[6]),
                .bram6_dout(out_bram_dout[6]),
                .bram7_addr(out_bram_addr[7]),
                .bram7_dout(out_bram_dout[7])
            );
        end
        else begin
            //no mux needed, just connect to bram
            assign out_bram_addr[0] = ifout_bram_addr;
            assign ifout_bram_dout = out_bram_dout[0];
        end
    endgenerate
    
    bram2axis_interface #(
        .AXIS_DATA_WIDTH(C_AXIS_DATA_WIDTH),
        .BRAM_ADDR_WIDTH(C_BRAM_ADDR_WIDTH),
        .BRAM_DATA_WIDTH(C_BRAM_DATA_WIDTH),
        .BRAM_DATA_DEPTH(C_BRAM_DATA_DEPTH)
    ) bram2axis_if_i (
        //Control interface
        .ACC_CLK(ACC_CLK),
        .ARESETN(ARESETN),
        .CTRL_ALLOW(out_allow),
        .CTRL_FINISHED(ctrl_next_out),
        .AXIS_TLAST(AXIS_TLAST),
        .AXIS_TVALID(AXIS_TVALID),
        .AXIS_TDATA(AXIS_TDATA),
        .AXIS_TREADY(AXIS_TREADY),
        .BRAM_ADDR(ifout_bram_addr),
        .BRAM_DIN(ifout_bram_dout),
        .DATA_DEPTH_M1(DATA_DEPTH_M1),
        .DATA_DEPTH_READ(DATA_DEPTH_READ),
        .DATA_DEPTH_EMPTY(DATA_DEPTH_EMPTY)
    );
    
    //generate the number of BRAMs specified by multi buffer parameter
    genvar idx;
    generate
        for(idx = 0; idx < C_MB_DEPTH; idx=idx+1) begin :BRAM_GEN
            adapter_bram #(
                .C_DATA_DEPTH(C_BRAM_DATA_DEPTH),
                .C_ADDR_WIDTH(C_BRAM_ADDR_WIDTH),
                .C_DATA_WIDTH(C_BRAM_DATA_WIDTH),
                .C_TYPE(1), //output
                .C_IS_INOUT(0),
                .C_NUM_PORTS(C_NUM_PORTS)
            ) adapter_bram_i (
                //Control Interface
                .ACC_CLK(ACC_CLK),
                .CTRL_EN_INPUT_IF(0),
                .CTRL_EN_OUTPUT_IF(out_allow),
                .output_addr(out_bram_addr[idx]),
                .output_din(0),
                .output_dout(out_bram_dout[idx]),
                .output_we({NUM_BYTES{1'b0}}),
                .output_en(1),
                .bram0_addr(addr0[idx]),
                .bram0_din(din0[idx]),
                .bram0_dout(dout0[idx]),
                .bram0_we(we0[idx]),
                .bram0_en(en0[idx]),
                .bram1_addr(addr1[idx]),
                .bram1_din(din1[idx]),
                .bram1_dout(dout1[idx]),
                .bram1_we(we1[idx]),
                .bram1_en(en1[idx])
            );
        end
    endgenerate

endmodule

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
