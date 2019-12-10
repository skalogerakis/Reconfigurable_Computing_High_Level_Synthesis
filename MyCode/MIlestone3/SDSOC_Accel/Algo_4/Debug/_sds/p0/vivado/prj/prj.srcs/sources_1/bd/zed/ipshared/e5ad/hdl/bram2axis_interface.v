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

module bram2axis_interface #(
    parameter AXIS_DATA_WIDTH = 64,
    parameter BRAM_ADDR_WIDTH = 32,
    parameter BRAM_DATA_WIDTH = 32,
    parameter BRAM_DATA_DEPTH = 4
    )(
    //Control interface
    input ACC_CLK,
    input ARESETN,
    input CTRL_ALLOW,       //Enable data to be written into BRAM
    output CTRL_FINISHED,   //End of transfer - TLAST received
    //AXI Stream interface
    output AXIS_TLAST,
    output AXIS_TVALID,
    output [AXIS_DATA_WIDTH-1:0] AXIS_TDATA,
    input AXIS_TREADY,
    //BRAM interfaces
    output [BRAM_ADDR_WIDTH-1:0] BRAM_ADDR,
    input [BRAM_DATA_WIDTH-1:0] BRAM_DIN,
    input [BRAM_ADDR_WIDTH-1:0] DATA_DEPTH_M1,
    output DATA_DEPTH_READ,
    input DATA_DEPTH_EMPTY
    );

    `include "adapter.vh"    

    localparam NUM_BYTES = BRAM_DATA_WIDTH/8;
    localparam DEPTH_BYTES = BRAM_DATA_DEPTH * NUM_BYTES;
    localparam ADDR_INCR = 1 << f_clog2(NUM_BYTES);
    
    localparam idle=0,run=1,stall=2,done=3;
    
    reg [1:0] state;
    reg next;
    reg tvalid;
    reg tlast;
    wire data_valid;
    reg allow_reg;
    reg [BRAM_ADDR_WIDTH-1:0] current_address;
    reg [BRAM_DATA_WIDTH-1:0] data_reg;
    reg [BRAM_ADDR_WIDTH-1:0] depth_m1;
    reg [BRAM_ADDR_WIDTH-1:0] data_count_m1;
    wire [BRAM_ADDR_WIDTH-1:0] data_count_m1_comb;
    wire [BRAM_ADDR_WIDTH-1:0] current_p1;
    reg depth_read;
    
    //external port assignments
    assign AXIS_TVALID = tvalid;
    assign AXIS_TLAST = tlast;    
    assign AXIS_TDATA = (state == run || state == done) ? BRAM_DIN : data_reg;
    
    assign BRAM_ADDR = current_address;  
      
    assign CTRL_FINISHED = next;
    
    assign DATA_DEPTH_READ = depth_read;
    
    //internal static assignments
    assign data_valid = allow_reg && AXIS_TVALID;
    assign current_p1 = current_address + ADDR_INCR;
    assign data_count_m1_comb = data_count_m1 + NUM_BYTES;
	
	//sm process
    always @(posedge ACC_CLK) begin
        if(~ARESETN) begin
            state <= idle; 
        end 
        else begin
            case(state)
                idle: begin
                    if(allow_reg && CTRL_ALLOW) begin
                        state <= run;
                    end
                end
                run: begin
                    if(AXIS_TREADY) begin
                        if(data_count_m1 >= depth_m1) begin
                            state <= done;
                        end
                    end
                    else begin
                        state <= stall;                    
                    end
                end
                stall: begin
                    if(AXIS_TREADY) begin
                        if(data_count_m1 < depth_m1) begin
                           state <= run;
						end
                        else begin
                            state <= done;
                        end
                    end
                end
                done: begin                    
                    if(next)
                        state <= idle;
                end
            endcase
        end
    end
        
    //data process
    always @(posedge ACC_CLK) begin
        allow_reg <= CTRL_ALLOW;
        if(~ARESETN) begin
            current_address <= 0;
            data_count_m1 <= 0;
            tlast <= 0;
            tvalid <= 0;
        end 
        else begin
            //default values
            depth_read <= 0;
            next <= 0;
            
            case(state)
                idle: begin
                    if(allow_reg && CTRL_ALLOW) begin
                        //tvalid <= 1;
                        tvalid <= 0;
                        if(DATA_DEPTH_EMPTY) //if depth fifo is empty, use static depth
                            depth_m1 <= DEPTH_BYTES - NUM_BYTES;
                        else begin
                            depth_m1 <= DATA_DEPTH_M1;
                            depth_read <= 1;
                        end
                        
                        //if(AXIS_TREADY) begin
                            //current_address <= current_p1;
                            //data_count_m1 <= data_count_m1_comb;
                        //end
                    end
                end
                run: begin
                    if(AXIS_TREADY) begin
                    	tvalid <= 1;
                        if(data_count_m1 < depth_m1) begin
                            current_address <= current_p1;
                            data_count_m1 <= data_count_m1_comb;
                            //tvalid <= 1;
                            tlast <= 0;
                        end
                        else begin
                            tlast <= 1;
                        end
                    end
                    else begin
                        data_reg <= BRAM_DIN;                        
                    end
                end
                stall: begin
                    if(AXIS_TREADY) begin
                        if(data_count_m1 < depth_m1) begin
                            current_address <= current_p1;
                            data_count_m1 <= data_count_m1_comb;
						end
                        else begin
							tlast <= 1;
                        end
                    end
                end
                done: begin
                    if(tlast && AXIS_TREADY) begin                        
                        next <= 1;      
                        tvalid <= 0;
                        tlast <= 0;   
                        current_address <= 0;
                        data_count_m1 <= 0;
                    end
                end
            endcase
        end
    end

endmodule

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
