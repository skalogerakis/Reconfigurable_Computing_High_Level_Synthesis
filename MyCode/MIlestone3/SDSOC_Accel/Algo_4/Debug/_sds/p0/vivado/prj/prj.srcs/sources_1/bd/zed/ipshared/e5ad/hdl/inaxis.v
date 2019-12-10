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

module inaxis #(
    parameter DATA_WIDTH=64
)(
    //Control interface
    input ACC_CLK,
    input ARESETN,
    input CTRL_ALLOW,			//Start transfer
    output CTRL_READY,			//Data is ready on the input interface
    output CTRL_FINISHED,		//End of transfer
    //Data Motion AXIS
    input DM_TLAST,
    input DM_TVALID,
    input [DATA_WIDTH-1:0] DM_TDATA,
    output DM_TREADY,
    //Accelerator AXIS
    output AP_TLAST,
    output AP_TVALID,
    output [DATA_WIDTH-1:0] AP_TDATA,
    input AP_TREADY
    );
    

    wire start;         //signal to start the transaction
    reg running;        //track if AXI transaction is in progress
    wire enable;        //enable the AXIS-FIFO interface
    reg finished;       //track if we saw TLAST after running
    
    assign start = CTRL_ALLOW & (~running); //start if control says 'so' and we're not already running
    assign enable = running && (~finished);        //enable the interface if we're running, disables when done running immediately
        
    assign CTRL_FINISHED = finished;                //transaction is done
    assign CTRL_READY = 1; //always ready
    
    assign AP_TDATA = DM_TDATA;      //pass through data
    assign AP_TLAST = DM_TLAST;
    assign AP_TVALID = ((enable)?DM_TVALID:0);
    
    assign DM_TREADY = ((enable)?AP_TREADY:0);
    
    //running tracker
    always @(posedge ACC_CLK) begin
        if(~ARESETN)
            running <= 0;
        else begin
            if(start)
                running <= 1;     
            if(running && finished)
                running <= 0;
        end
    end
    
    //finished tracker
    always @(posedge ACC_CLK) begin
        if(~ARESETN)
            finished <= 0;
        else begin
            if(start)   //if transaction starts, its not done
                finished <= 0;
                
            if(running && DM_TVALID && DM_TLAST && AP_TREADY)    //transaction is done 
                finished <= 1;
        end
    end

endmodule

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
