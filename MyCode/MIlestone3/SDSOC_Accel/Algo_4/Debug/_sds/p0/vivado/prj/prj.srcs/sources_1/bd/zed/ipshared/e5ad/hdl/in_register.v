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
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx Inc.
// Engineer: Sam Skalicky
// 
// Create Date: 01/13/2016 03:46:50 PM
// Design Name: Accelerator Adapter
// Module Name: in_register
// Project Name: SDSoC Core Infrastructure 
// Target Devices: zynq
// Tool Versions: 2015.4
// Description: Generic N-bit wide input register. data is written into the register
//      in 32-bit chunks in a revolving fashion.
// 
// Dependencies: None
// 
// Revision 1.0
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module in_register #(
    parameter C_NUM_BITS = 32,
	parameter C_NUM_WORDS = cdiv32(C_NUM_BITS),
	parameter C_UPPER_BITS = 32 - ((C_NUM_WORDS*32) - C_NUM_BITS),
	parameter C_COUNT_BITS = clogb2(C_NUM_WORDS)
    )(
    input [31:0] din,
    input we,
    input clk,
    output [C_NUM_BITS-1:0] dout,
    output ready
    );
    
// function called cdiv32 returns the ceil(n/32)                     
function integer cdiv32 (input integer bit_depth);   
    integer div;           
begin           
    div = bit_depth - ((bit_depth / 32) * 32);  //get (bit_depth mod 32)        
    if(div == 0)
        cdiv32 = bit_depth / 32;
    else
        cdiv32 = 1 + (bit_depth / 32);     
end
endfunction   

// function called clogb2 returns the log2(n)                     
function integer clogb2 (input integer bit_depth);              
begin                                                           
    for(clogb2=0; bit_depth>1; clogb2=clogb2+1)                   
        bit_depth = bit_depth >> 1;                                 
    end                                                           
endfunction 
    
    reg [C_NUM_WORDS*32-1:0] data = 0;
    reg [C_COUNT_BITS:0] count=0;
    reg ready_i = 0;
    
    assign dout = data[C_NUM_BITS-1:0];
    assign ready = ready_i;
        
    //demux 32-bit data in to each word
    genvar idx;
    generate
        for(idx=0; idx<C_NUM_WORDS; idx=idx+1) begin :REG_WORD_GEN
            if(idx == C_NUM_WORDS-1) begin //last word
                always @(posedge clk) begin
                    if(we && count == idx)
                        data[((idx+1)*32)-1:(idx*32)] <= din[C_UPPER_BITS-1:0];
                end
            end
            else begin 
                always @(posedge clk) begin
                    if(we && count == idx)
                        data[((idx+1)*32)-1:(idx*32)] <= din;
                end
            end
        end
    endgenerate
    
    generate
        always @(posedge clk) begin 
           ready_i <= 0;
            if(we) begin
                if(C_NUM_WORDS > 1) begin            
                    if(count == C_NUM_WORDS-1) begin
                        count <= 0; 
                        ready_i <= 1;
                    end
                    else 
                        count <= count + 1;
                end
                else begin
                    ready_i <= 1;
                end
            end
        end
    endgenerate

endmodule

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
