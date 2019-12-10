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

module bram #(
        parameter C_DATA_WIDTH = 32,
        parameter C_DATA_DEPTH = 16,
        parameter C_ADDR_WIDTH = 4
    ) (
        input aclk,
        input [C_ADDR_WIDTH-1:0] aaddr,
        input [C_DATA_WIDTH-1:0] adin,
        output [C_DATA_WIDTH-1:0] adout,
        input [C_DATA_WIDTH/8-1:0] awe,
        input aen,
        input bclk,
        input [C_ADDR_WIDTH-1:0] baddr,
        input [C_DATA_WIDTH-1:0] bdin,
        output [C_DATA_WIDTH-1:0] bdout,
        input [C_DATA_WIDTH/8-1:0] bwe,
        input ben
    );

    `include "adapter.vh"    

    localparam NUM_BYTES = C_DATA_WIDTH/8;
    localparam ADD_INCR = 1 << f_clog2(NUM_BYTES);
    localparam BRAM_ADDR_WIDTH = f_clog2(C_DATA_DEPTH);
    
    wire [BRAM_ADDR_WIDTH-1:0] aaddr_i;
    wire [BRAM_ADDR_WIDTH-1:0] baddr_i;
    
    //truncate the address to word-based addressing
    assign aaddr_i = aaddr >> f_clog2(ADD_INCR);
    assign baddr_i = baddr >> f_clog2(ADD_INCR);
             
    xpm_memory_tdpram # (    
      // Common module parameters
      .MEMORY_SIZE        (C_DATA_DEPTH*C_DATA_WIDTH),  //positive integer
      .MEMORY_PRIMITIVE   ("auto"),                     //string; "auto", "distributed", "block" or "ultra";
      .CLOCKING_MODE      ("common_clock"),             //string; "common_clock", "independent_clock" 
      .MEMORY_INIT_FILE   ("none"),                     //string; "none" or "<filename>.mem" 
      .MEMORY_INIT_PARAM  (""    ),                     //string;
      .USE_MEM_INIT       (0),                          //integer; 0,1
      .WAKEUP_TIME        ("disable_sleep"),            //string; "disable_sleep" or "use_sleep_pin" 
      .MESSAGE_CONTROL    (0),                          //integer; 0,1
      .ECC_MODE           ("no_ecc"),                   //string; "no_ecc", "encode_only", "decode_only" or "both_encode_and_decode" 
      .AUTO_SLEEP_TIME    (0),                          //Do not Change    
      // Port A module parameters
      .WRITE_DATA_WIDTH_A (C_DATA_WIDTH),               //positive integer
      .READ_DATA_WIDTH_A  (C_DATA_WIDTH),               //positive integer
      .BYTE_WRITE_WIDTH_A (8),                          //integer; 8, 9, or WRITE_DATA_WIDTH_A value
      .ADDR_WIDTH_A       (BRAM_ADDR_WIDTH),            //positive integer
      .READ_RESET_VALUE_A ("0"),                        //string
      .READ_LATENCY_A     (1),                          //non-negative integer
      .WRITE_MODE_A       ("read_first"),               //string; "write_first", "read_first", "no_change"     
      // Port B module parameters
      .WRITE_DATA_WIDTH_B (C_DATA_WIDTH),               //positive integer
      .READ_DATA_WIDTH_B  (C_DATA_WIDTH),               //positive integer
      .BYTE_WRITE_WIDTH_B (8),                          //integer; 8, 9, or WRITE_DATA_WIDTH_B value
      .ADDR_WIDTH_B       (BRAM_ADDR_WIDTH),            //positive integer
      .READ_RESET_VALUE_B ("0"),                        //vector of READ_DATA_WIDTH_B bits
      .READ_LATENCY_B     (1),                          //non-negative integer
      .WRITE_MODE_B       ("read_first")                //string; "write_first", "read_first", "no_change"     
    ) xpm_memory_tdpram_inst (    
      // Common module ports
      .sleep          (1'b0),    
      // Port A module ports
      .clka           (aclk),
      .rsta           (1'b0),
      .ena            (aen),
      .regcea         (1'b1),
      .wea            (awe),
      .addra          (aaddr_i),
      .dina           (adin),
      .injectsbiterra (1'b0),
      .injectdbiterra (1'b0),
      .douta          (adout),
      .sbiterra       (),
      .dbiterra       (),    
      // Port B module ports
      .clkb           (bclk),
      .rstb           (1'b0),
      .enb            (ben),
      .regceb         (1'b1),
      .web            (bwe),
      .addrb          (baddr_i),
      .dinb           (bdin),
      .injectsbiterrb (1'b0),
      .injectdbiterrb (1'b0),
      .doutb          (bdout),
      .sbiterrb       (),
      .dbiterrb       ()    
    );
    
endmodule

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
