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

module axis2bram_interface #(
    parameter AXIS_DATA_WIDTH = 32,
    parameter BRAM_ADDR_WIDTH = 4,
    parameter BRAM_DATA_WIDTH = 32,
    parameter BRAM_DATA_DEPTH = 16
    )(
    //Control interface
    input ACC_CLK,
    input ARESETN,
    input CTRL_ALLOW,       //Enable data to be written into BRAM
    output CTRL_FINISHED,   //end of transfer - increment next multibuffer
    //AXI Stream interface
    input AXIS_TLAST,
    input AXIS_TVALID,
    input [AXIS_DATA_WIDTH-1:0] AXIS_TDATA,
    output AXIS_TREADY,
    //BRAM interface
    output [BRAM_ADDR_WIDTH-1:0] BRAM_ADDR,
    output [BRAM_DATA_WIDTH/8-1:0] BRAM_WREN,
    output [BRAM_DATA_WIDTH-1:0] BRAM_DOUT,
    output reg [BRAM_ADDR_WIDTH-1:0] DATA_DEPTH_M1
    );

    `include "adapter.vh"

    localparam NUM_BYTES = BRAM_DATA_WIDTH/8;
    localparam ADDR_INCR = 1 << f_clog2(NUM_BYTES);
    localparam LOW_BITS = f_clog2(ADDR_INCR);        
        
    reg running;
    reg done;
    wire data_valid;
    reg [BRAM_ADDR_WIDTH-1:0] current_address;
    reg [BRAM_ADDR_WIDTH-1:0] data_count_m1;
    
    //external port assignments
    assign AXIS_TREADY = running;   
    assign BRAM_ADDR = current_address[BRAM_ADDR_WIDTH-1:0];
    assign BRAM_WREN = {NUM_BYTES{data_valid}};
    assign BRAM_DOUT = AXIS_TDATA;   
    assign CTRL_FINISHED = done;
    
    //internal static assignments
    assign data_valid = CTRL_ALLOW && AXIS_TVALID;
    
    //data process
    always @(posedge ACC_CLK) begin
        if(~ARESETN) begin
            current_address <= 0;
            running <= 0;
            data_count_m1 <= 0;
            DATA_DEPTH_M1 <= 0;
        end 
        else begin
            //default values
            done <= 0;
                
            if(CTRL_ALLOW && ~running && ~done) begin
                running <= 1;
            end 
            
            if(running && data_valid && ~AXIS_TLAST) begin     //data valid but not the last
                current_address <= current_address + ADDR_INCR;
                data_count_m1 <= data_count_m1 + NUM_BYTES;
            end
            else if(running && data_valid && AXIS_TLAST) begin //data valid and last
                done <= 1;
                running <= 0;
                current_address <= 0;
                data_count_m1 <= 0;
                DATA_DEPTH_M1 <= data_count_m1;
            end
        end
    end

endmodule

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
