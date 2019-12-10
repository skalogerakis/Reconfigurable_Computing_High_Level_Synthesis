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

module fifo2axis #(
    parameter DATA_WIDTH = 64,
	parameter FULL_ACTIVE=0        //zero (0) means active low, one (1) means active high
    ) (
    //Control interface
    input ACC_CLK,
    input ARESETN,
    input CTRL_ALLOW,       //Assert TLAST
    output CTRL_READY,      //Unused
    output CTRL_FINISHED,   //End of transfer
    //AXI Stream interface
    output AXIS_TLAST,
    output AXIS_TVALID,
    output [DATA_WIDTH-1:0] AXIS_TDATA,
    input AXIS_TREADY,
    //FIFO interface
    output FIFO_FULL,
    input [DATA_WIDTH-1:0] FIFO_DIN,
    input FIFO_WRITE
    );

    reg [DATA_WIDTH-1:0] data_reg;      //temporary storage for data
    reg data_reg_vld;                   //data in reg is valid
    reg tlast;
    
    //set active low/high for full
    generate
        if(FULL_ACTIVE)
            assign FIFO_FULL = data_reg_vld & (~AXIS_TREADY);   //if data in reg is valid, it's full
        else
            assign FIFO_FULL = ~(data_reg_vld & (~AXIS_TREADY));   //if data in reg is valid, it's full
    endgenerate
    
    //data is valid on the AXIS interface if:
        //1. the data in the register is valid
        //2. the AXIS interface is ready to receive (TREADY)
        //3. EITHER (a) the FIFO interface is ready to write, or (b) its the last element (according to the controller)
    assign AXIS_TVALID = data_reg_vld & AXIS_TREADY & (FIFO_WRITE | tlast);
    
    assign AXIS_TDATA = data_reg;       //pass data out from register
    assign AXIS_TLAST = tlast;          //pass tlast out from register
    
    assign CTRL_FINISHED = (~tlast) & (~data_reg_vld);  //transfer is done after tlast & reg_vld are cleared (with both clocks)
    assign CTRL_READY = 1; //always ready
    
    //assign tlast on the control clock
    always @(posedge ACC_CLK) begin
        if(~ARESETN)
            tlast <= 0;
        else begin
            if(~tlast && CTRL_ALLOW)
                tlast <= 1;
            if(tlast && AXIS_TREADY)
                tlast <= 0;
        end
    end
    
    //assign reg_vld on the AXIS clock, and clock in data to reg
    always @(posedge ACC_CLK) begin
		if(~ARESETN) begin
			data_reg <= 32'hDEADBEEF;
			data_reg_vld <= 0;
		end
		else begin
			//latch data into reg
			if((~data_reg_vld) && FIFO_WRITE) begin //if reg is empty, & has FIFO data
				data_reg <= FIFO_DIN;   //latch data
				data_reg_vld <= 1;      //data is valid
			end
			
			//send data out & latch in next data
			if(data_reg_vld && AXIS_TREADY && FIFO_WRITE)
				data_reg <= FIFO_DIN;      //read in next data
				
			//last data in reg is sent out
			if(data_reg_vld && AXIS_TREADY && tlast)
				data_reg_vld <= 0;
		end
    end
    
endmodule

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
