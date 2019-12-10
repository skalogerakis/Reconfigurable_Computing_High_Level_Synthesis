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

module bram_mux #(
    parameter C_ADDR_WIDTH = 32,
    parameter C_DATA_WIDTH = 32,
    parameter C_NUM_INTERFACES = 2,
    parameter SEL_BITS = clogb2(C_NUM_INTERFACES),
    parameter C_MAX_INTERFACES = 8
    )(
    input [SEL_BITS-1:0] sel,
    //BRAM IF
    output reg [C_ADDR_WIDTH-1:0] bram_addr,
    output reg [C_DATA_WIDTH-1:0] bram_din,
    input [C_DATA_WIDTH-1:0] bram_dout,
    output reg [C_DATA_WIDTH/8-1:0] bram_we,
    output reg bram_en,
    //BRAM IF-0
    input [C_ADDR_WIDTH-1:0] bram0_addr,
    input [C_DATA_WIDTH-1:0] bram0_din,
    output [C_DATA_WIDTH-1:0] bram0_dout,
    input [C_DATA_WIDTH/8-1:0] bram0_we,
    input bram0_en,
    //BRAM IF-1
    input [C_ADDR_WIDTH-1:0] bram1_addr,
    input [C_DATA_WIDTH-1:0] bram1_din,
    output [C_DATA_WIDTH-1:0] bram1_dout,
    input [C_DATA_WIDTH/8-1:0] bram1_we,
    input bram1_en,
    //BRAM IF-2
    input [C_ADDR_WIDTH-1:0] bram2_addr,
    input [C_DATA_WIDTH-1:0] bram2_din,
    output [C_DATA_WIDTH-1:0] bram2_dout,
    input [C_DATA_WIDTH/8-1:0] bram2_we,
    input bram2_en,
    //BRAM IF-3
    input [C_ADDR_WIDTH-1:0] bram3_addr,
    input [C_DATA_WIDTH-1:0] bram3_din,
    output [C_DATA_WIDTH-1:0] bram3_dout,
    input [C_DATA_WIDTH/8-1:0] bram3_we,
    input bram3_en,
    //BRAM IF-4
    input [C_ADDR_WIDTH-1:0] bram4_addr,
    input [C_DATA_WIDTH-1:0] bram4_din,
    output [C_DATA_WIDTH-1:0] bram4_dout,
    input [C_DATA_WIDTH/8-1:0] bram4_we,
    input bram4_en,
    //BRAM IF-5
    input [C_ADDR_WIDTH-1:0] bram5_addr,
    input [C_DATA_WIDTH-1:0] bram5_din,
    output [C_DATA_WIDTH-1:0] bram5_dout,
    input [C_DATA_WIDTH/8-1:0] bram5_we,
    input bram5_en,
    //BRAM IF-6
    input [C_ADDR_WIDTH-1:0] bram6_addr,
    input [C_DATA_WIDTH-1:0] bram6_din,
    output [C_DATA_WIDTH-1:0] bram6_dout,
    input [C_DATA_WIDTH/8-1:0] bram6_we,
    input bram6_en,
    //BRAM IF-7
    input [C_ADDR_WIDTH-1:0] bram7_addr,
    input [C_DATA_WIDTH-1:0] bram7_din,
    output [C_DATA_WIDTH-1:0] bram7_dout,
    input [C_DATA_WIDTH/8-1:0] bram7_we,
    input bram7_en
    ); 
    
    function integer clogb2 (input integer bit_depth);
    begin
        bit_depth = bit_depth - 1;
        for (clogb2 = 0; bit_depth > 0; clogb2=clogb2+1)
            bit_depth = bit_depth >> 1;  
    end
    endfunction
        
    wire [C_ADDR_WIDTH-1:0] addr [C_MAX_INTERFACES-1:0];
    wire [C_DATA_WIDTH-1:0] din [C_MAX_INTERFACES-1:0];
    reg [C_DATA_WIDTH-1:0] dout [C_MAX_INTERFACES-1:0];
    wire [C_DATA_WIDTH/8-1:0] we [C_MAX_INTERFACES-1:0];
    wire [C_MAX_INTERFACES-1:0] en;
    
    assign addr[0] = bram0_addr; 
    assign din[0] = bram0_din;
    assign bram0_dout = dout[0];
    assign we[0] = bram0_we;
    assign en[0] = bram0_en;
    assign addr[1] = bram1_addr; 
    assign din[1] = bram1_din;
    assign bram1_dout = dout[1];
    assign we[1] = bram1_we;
    assign en[1] = bram1_en;
    assign addr[2] = bram2_addr; 
    assign din[2] = bram2_din;
    assign bram2_dout = dout[2];
    assign we[2] = bram2_we;
    assign en[2] = bram2_en;
    assign addr[3] = bram3_addr; 
    assign din[3] = bram3_din;
    assign bram3_dout = dout[3];
    assign we[3] = bram3_we;
    assign en[3] = bram3_en;
    assign addr[4] = bram4_addr; 
    assign din[4] = bram4_din;
    assign bram4_dout = dout[4];
    assign we[4] = bram4_we;
    assign en[4] = bram4_en;
    assign addr[5] = bram5_addr; 
    assign din[5] = bram5_din;
    assign bram5_dout = dout[5];
    assign we[5] = bram5_we;
    assign en[5] = bram5_en;
    assign addr[6] = bram6_addr; 
    assign din[6] = bram6_din;
    assign bram6_dout = dout[6];
    assign we[6] = bram6_we;
    assign en[6] = bram6_en;
    assign addr[7] = bram7_addr; 
    assign din[7] = bram7_din;
    assign bram7_dout = dout[7];
    assign we[7] = bram7_we;
    assign en[7] = bram7_en;
    
    always @(*) begin
        bram_addr <= addr[sel];
        bram_din <= din[sel];
        bram_we <= we[sel];
        bram_en <= en[sel];
        dout[sel] <= bram_dout;
    end    
    
endmodule

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
