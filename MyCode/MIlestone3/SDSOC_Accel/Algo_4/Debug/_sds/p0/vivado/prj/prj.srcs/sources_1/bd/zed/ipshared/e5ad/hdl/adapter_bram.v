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

module adapter_bram #(
    parameter C_DATA_DEPTH = 16,
    parameter C_ADDR_WIDTH = 4,
    parameter C_DATA_WIDTH = 32,
    parameter C_TYPE = 0,   //0-Input, 1-Output
    parameter C_IS_INOUT = 0,
    parameter C_NUM_PORTS = 1
    )(
    //Control Interface
    input ACC_CLK,
    input CTRL_EN_INPUT_IF,
    input CTRL_EN_OUTPUT_IF,
    //Input BRAM IF
    input [C_ADDR_WIDTH-1:0] input_addr,
    input [C_DATA_WIDTH-1:0] input_din,
    output [C_DATA_WIDTH-1:0] input_dout,
    input [C_DATA_WIDTH/8-1:0] input_we,
    input input_en,
    //Output BRAM IF
    input [C_ADDR_WIDTH-1:0] output_addr,
    input [C_DATA_WIDTH-1:0] output_din,
    output [C_DATA_WIDTH-1:0] output_dout,
    input [C_DATA_WIDTH/8-1:0] output_we,
    input output_en,
    
    //ACC BRAM IF-0
    input [C_ADDR_WIDTH-1:0] bram0_addr,
    input [C_DATA_WIDTH-1:0] bram0_din,
    output [C_DATA_WIDTH-1:0] bram0_dout,
    input [C_DATA_WIDTH/8-1:0] bram0_we,
    input bram0_en,
    //ACC BRAM IF-1
    input [C_ADDR_WIDTH-1:0] bram1_addr,
    input [C_DATA_WIDTH-1:0] bram1_din,
    output [C_DATA_WIDTH-1:0] bram1_dout,
    input [C_DATA_WIDTH/8-1:0] bram1_we,
    input bram1_en
    );
        
    wire [C_ADDR_WIDTH-1:0] aaddr;
    wire [C_DATA_WIDTH-1:0] adin;
    wire [C_DATA_WIDTH-1:0] adout;
    wire [C_DATA_WIDTH/8-1:0] awe;
    wire aen;
    wire [C_ADDR_WIDTH-1:0] baddr;
    wire [C_DATA_WIDTH-1:0] bdin;
    wire [C_DATA_WIDTH-1:0] bdout;
    wire [C_DATA_WIDTH/8-1:0] bwe;
    wire ben;
    
    generate
        //handle in/out case
        if(C_IS_INOUT) begin
            //single port case
            if(C_NUM_PORTS == 1) begin
                //ACC bram port goes to BRAM port A
                assign aaddr = bram0_addr;
                assign adin = bram0_din;
                assign bram0_dout = adout;
                assign awe = bram0_we;
                assign aen = bram0_en;
                
                //In/out share port B
                bram_mux #(
                    .C_ADDR_WIDTH(C_ADDR_WIDTH),
                    .C_DATA_WIDTH(C_DATA_WIDTH)
                ) inout_mux (
                    .sel(CTRL_EN_INPUT_IF),
                    //BRAM IF
                    .bram_addr(baddr),
                    .bram_din(bdin),
                    .bram_dout(bdout),
                    .bram_we(bwe),
                    .bram_en(ben),
                    //BRAM IF-0
                    .bram0_addr(input_addr),
                    .bram0_din(input_din),
                    .bram0_dout(input_dout),
                    .bram0_we(input_we),
                    .bram0_en(input_en),
                    //BRAM IF-1
                    .bram1_addr(output_addr),
                    .bram1_din(output_din),
                    .bram1_dout(output_dout),
                    .bram1_we(output_we),
                    .bram1_en(output_en)
                );
            end
            //dual port case
            else begin
                //ACC bram port 0 shares BRAM port A with input
                bram_mux #(
                    .C_ADDR_WIDTH(C_ADDR_WIDTH),
                    .C_DATA_WIDTH(C_DATA_WIDTH)
                ) input_mux (
                    .sel(CTRL_EN_INPUT_IF),
                    //BRAM IF
                    .bram_addr(aaddr),
                    .bram_din(adin),
                    .bram_dout(adout),
                    .bram_we(awe),
                    .bram_en(aen),
                    //BRAM IF-0
                    .bram0_addr(input_addr),
                    .bram0_din(input_din),
                    .bram0_dout(input_dout),
                    .bram0_we(input_we),
                    .bram0_en(input_en),
                    //BRAM IF-1
                    .bram1_addr(bram0_addr),
                    .bram1_din(bram0_din),
                    .bram1_dout(bram0_dout),
                    .bram1_we(bram0_we),
                    .bram1_en(bram0_en)
                );
                //ACC bram port 1 shares BRAM port B with output
                bram_mux #(
                    .C_ADDR_WIDTH(C_ADDR_WIDTH),
                    .C_DATA_WIDTH(C_DATA_WIDTH)
                ) output_mux (
                    .sel(CTRL_EN_OUTPUT_IF),
                    //BRAM IF
                    .bram_addr(baddr),
                    .bram_din(bdin),
                    .bram_dout(bdout),
                    .bram_we(bwe),
                    .bram_en(ben),
                    //BRAM IF-0
                    .bram0_addr(output_addr),
                    .bram0_din(output_din),
                    .bram0_dout(output_dout),
                    .bram0_we(output_we),
                    .bram0_en(output_en),
                    //BRAM IF-1
                    .bram1_addr(bram1_addr),
                    .bram1_din(bram1_din),
                    .bram1_dout(bram1_dout),
                    .bram1_we(bram1_we),
                    .bram1_en(bram1_en)
                );
            end
        end
        else begin
            //Input only case
            if(C_TYPE == 0) begin
               //single port case
                if(C_NUM_PORTS == 1) begin
                    //ACC bram port 0 goes to BRAM port A
                    assign aaddr = bram0_addr;
                    assign adin = bram0_din;
                    assign bram0_dout = adout;
                    assign awe = bram0_we;
                    assign aen = bram0_en;
                    
                    //input goes to BRAM port B
                    assign baddr = input_addr;
                    assign bdin = input_din;
                    assign input_dout = bdout;
                    assign bwe = input_we;
                    assign ben = input_en;
                end
                //dual port case
                else begin
                    //ACC bram port 0 shares BRAM port A with input
                    bram_mux #(
                        .C_ADDR_WIDTH(C_ADDR_WIDTH),
                        .C_DATA_WIDTH(C_DATA_WIDTH)
                    ) input_mux (
                        .sel(CTRL_EN_INPUT_IF),
                        //BRAM IF
                        .bram_addr(aaddr),
                        .bram_din(adin),
                        .bram_dout(adout),
                        .bram_we(awe),
                        .bram_en(aen),
                        //BRAM IF-0
                        .bram0_addr(input_addr),
                        .bram0_din(input_din),
                        .bram0_dout(input_dout),
                        .bram0_we(input_we),
                        .bram0_en(input_en),
                        //BRAM IF-1
                        .bram1_addr(bram0_addr),
                        .bram1_din(bram0_din),
                        .bram1_dout(bram0_dout),
                        .bram1_we(bram0_we),
                        .bram1_en(bram0_en)
                    );
                    
                    //ACC bram port 1 goes to BRAM port B
                   assign baddr = bram1_addr;
                   assign bdin = bram1_din;
                   assign bram1_dout = bdout;
                   assign bwe = bram1_we;
                   assign ben = bram1_en;                    
                end 
            end
            //output only case
            else begin
                //single port case
                if(C_NUM_PORTS == 1) begin
                    //ACC bram port 0 goes to BRAM port A
                    assign aaddr = bram0_addr;
                    assign adin = bram0_din;
                    assign bram0_dout = adout;
                    assign awe = bram0_we;
                    assign aen = bram0_en;
                    
                    //output goes to BRAM port B
                    assign baddr = output_addr;
                    assign bdin = output_din;
                    assign output_dout = bdout;
                    assign bwe = output_we;
                    assign ben = output_en;
                end
                //dual port case
                else begin
                    //ACC bram port 0 goes to BRAM port A
                    assign aaddr = bram0_addr;
                    assign adin = bram0_din;
                    assign bram0_dout = adout;
                    assign awe = bram0_we;
                    assign aen = bram0_en;
                    
                    //ACC port 1 shares BRAM port B with output
                    bram_mux #(
                        .C_ADDR_WIDTH(C_ADDR_WIDTH),
                        .C_DATA_WIDTH(C_DATA_WIDTH)
                        ) output_mux (
                        .sel(CTRL_EN_OUTPUT_IF),
                        //BRAM IF
                        .bram_addr(baddr),
                        .bram_din(bdin),
                        .bram_dout(bdout),
                        .bram_we(bwe),
                        .bram_en(ben),
                        //BRAM IF-0
                        .bram0_addr(output_addr),
                        .bram0_din(output_din),
                        .bram0_dout(output_dout),
                        .bram0_we(output_we),
                        .bram0_en(output_en),
                        //BRAM IF-1
                        .bram1_addr(bram1_addr),
                        .bram1_din(bram1_din),
                        .bram1_dout(bram1_dout),
                        .bram1_we(bram1_we),
                        .bram1_en(bram1_en)
                    );
                end
            end
        end
    endgenerate
    
    bram #(
        .C_DATA_WIDTH(C_DATA_WIDTH),
        .C_DATA_DEPTH(C_DATA_DEPTH),
        .C_ADDR_WIDTH(C_ADDR_WIDTH)
    ) bram_i (
        .aclk(ACC_CLK),
        .aaddr(aaddr),
        .adin(adin),
        .adout(adout),
        .awe(awe),
        .aen(aen),
        .bclk(ACC_CLK),
        .baddr(baddr),
        .bdin(bdin),
        .bdout(bdout),
        .bwe(bwe),
        .ben(ben)
    );

endmodule
// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
