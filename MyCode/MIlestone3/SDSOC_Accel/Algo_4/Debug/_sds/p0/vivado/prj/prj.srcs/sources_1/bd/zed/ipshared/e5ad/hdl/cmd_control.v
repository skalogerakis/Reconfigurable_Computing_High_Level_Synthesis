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

module cmd_control #(
    parameter NUM_INPUT_SCALARS = 0,
    parameter NUM_OUTPUT_SCALARS = 0,
    parameter NUM_INPUT_BRAMs = 0,
    parameter NUM_OUTPUT_BRAMs = 0,
    parameter NUM_INPUT_FIFOs = 0,
    parameter NUM_OUTPUT_FIFOs = 0
    )(
    //command queue interface
    input clk,
    input rstn,
    input [31:0] din,
    output read,
    input empty,
    //accelerator interface
    output reg ap_start,
    output reg ap_start_single,
    input ap_done,
    input ap_ready,
    //scalar fifo interface
    input [NUM_INPUT_SCALARS-1:0] inscalar_fifo_empty,
    output [NUM_INPUT_SCALARS-1:0] inscalar_next,
    input [NUM_OUTPUT_SCALARS-1:0] outscalar_fifo_full,
    //bram interface status
    output inbram_ctrl_allow,
    input [NUM_INPUT_BRAMs-1:0] inbram_ctrl_ready,
    input [NUM_INPUT_BRAMs-1:0] inoutbram_ctrl_ready,
    input [NUM_INPUT_BRAMs-1:0] inbram_ctrl_finished,
    output outbram_ctrl_allow,
    input [NUM_OUTPUT_BRAMs-1:0] outbram_ctrl_ready,
    input [NUM_OUTPUT_BRAMs-1:0] outbram_ctrl_canstart,
    input [NUM_OUTPUT_BRAMs-1:0] outbram_ctrl_finished,
    //input fifo interface signals
    output infifo_ctrl_allow,
    //output fifo interface signals
    output outfifo_ctrl_allow,
    //input axis interface signals
    output inaxis_ctrl_allow,
    //output axis interface signals
    output outaxis_ctrl_allow
    );
            
    localparam idle=0,wait_deps=1,wait_ready=2;   //states in the state machine
    reg [1:0] ctrl_state = idle;
    
    reg read_i = 0;
    reg ap_start_i = 0;
    
    wire inscalars_ready;
    wire outscalars_ready;
    wire inbrams_ready;
    wire outbrams_canstart;
    wire args_ready;
    
    reg ready_latch;
    reg ready_clear;
        
    assign infifo_ctrl_allow = 1;
    assign outfifo_ctrl_allow = ap_done;
    assign inaxis_ctrl_allow = 1;
    assign outaxis_ctrl_allow = ap_done;
    
    //check if all the input/output args/scalars are ready
    generate
        if(NUM_INPUT_SCALARS > 0) begin
            assign inscalars_ready = (&(~inscalar_fifo_empty));
            assign inscalar_next = {NUM_INPUT_SCALARS{ap_done}};
        end
        else
            assign inscalars_ready = 1;

        if(NUM_OUTPUT_SCALARS > 0)
            assign outscalars_ready = (&(~outscalar_fifo_full));
        else
            assign outscalars_ready = 1;
        
        if(NUM_INPUT_BRAMs > 0) begin
            assign inbrams_ready = (&inbram_ctrl_ready);
        end
        else
            assign inbrams_ready = 1;

        if(NUM_OUTPUT_BRAMs > 0) begin
            assign outbrams_canstart = (&outbram_ctrl_canstart);
        end
        else begin
            assign outbrams_canstart = 1;
        end
                    
        assign args_ready = inscalars_ready & outscalars_ready & inbrams_ready & outbrams_canstart;
    endgenerate
    
    assign read = read_i;
    
    generate
        //state machine
        always @(posedge clk) begin
            if(~rstn) begin
                ctrl_state <= idle;
                //defaults
                read_i <= 0;
                ap_start <= 0;
                ap_start_single <= 0;
            end
            else begin
                //defaults
                read_i <= 0;
                ap_start_single <= 0;
                case(ctrl_state) 
                    idle: begin
                        //wait for data to be available
                        if(~empty) begin
                            //dequeue command word
                            read_i <= 1;
                            ctrl_state <= wait_deps;
                        end
                    end
                    wait_deps: begin
                        //wait for arguments to be ready
                        if(args_ready) begin
                            //start the logic to start the core at the acc_clk freq
                            ap_start <= 1;
                            ap_start_single <= 1;
                            ctrl_state <= wait_ready;
                        end
                    end
                    wait_ready: begin
                        //wait for ap_ready
                        if(ap_ready) begin
                            ap_start <= 0;
                            ctrl_state <= idle;
                        end
                    end
                    default: begin
                        ctrl_state <= idle;
                    end
                endcase
            end
        end
    endgenerate
            
endmodule

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
