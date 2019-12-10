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

module adapter #(
    parameter C_ACC_RESET_POLARITY = 0, //active reset value (zero is active low, one is active high)
    parameter C_NUM_INPUT_SCALARS = 0,
    parameter C_NUM_OUTPUT_SCALARS = 0,
    parameter C_QUEUE_DEPTH = 16,
    parameter C_NUM_INPUT_FIFOs = 0,
    parameter C_NUM_OUTPUT_FIFOs = 0,
    parameter C_NUM_OUTPUT_BRAMs = 0,
    parameter C_NUM_INPUT_BRAMs = 0
 ) (
    //axi lite interface 
    input S_AXI_ACLK,
    input S_AXI_ARESETN,
    input [31 : 0] S_AXI_AWADDR,
    input [2 : 0] S_AXI_AWPROT,
    input S_AXI_AWVALID,
    output S_AXI_AWREADY,
    input [31 : 0] S_AXI_WDATA,
    input [3 : 0] S_AXI_WSTRB,
    input S_AXI_WVALID,
    output S_AXI_WREADY,
    output [1 : 0] S_AXI_BRESP,
    output S_AXI_BVALID,
    input S_AXI_BREADY,
    input [31 : 0] S_AXI_ARADDR,
    input [2 : 0] S_AXI_ARPROT,
    input S_AXI_ARVALID,
    output S_AXI_ARREADY,
    output [31 : 0] S_AXI_RDATA,
    output [1 : 0] S_AXI_RRESP,
    output S_AXI_RVALID,
    input S_AXI_RREADY,
    //acc clock
    input acc_clk,
    input acc_rstn,
    //acc interface   
    output ap_rst,
    output ap_start,
    output ap_start_single,
    input ap_idle,
    input ap_done,
    input ap_ready,
    output ap_continue,
    output ap_clk,
    //scalar interface
    output [31:0] scalar_write_addr,
    output [31:0] scalar_read_addr,
    output [31:0] scalar_din,
    output scalar_we,
    output scalar_re,
    input [31:0] scalar_dout,
    output [C_NUM_INPUT_SCALARS-1:0] inscalar_next,
    input [C_NUM_INPUT_SCALARS-1:0] inscalar_fifo_empty,
    input [C_NUM_INPUT_SCALARS-1:0] inscalar_fifo_full,
    input [C_NUM_OUTPUT_SCALARS-1:0] outscalar_fifo_empty,
    input [C_NUM_OUTPUT_SCALARS-1:0] outscalar_fifo_full,
    input [C_NUM_OUTPUT_SCALARS-1:0] outscalar_null_empty,
    input [C_NUM_OUTPUT_SCALARS-1:0] outscalar_null_dout,
    output [C_NUM_OUTPUT_SCALARS-1:0] outscalar_null_read,
    //input argument control interface
    output inbram_ctrl_allow,
    input [C_NUM_INPUT_BRAMs-1:0] inbram_ctrl_ready,
    input [C_NUM_INPUT_BRAMs-1:0] inoutbram_ctrl_ready,
    //input argument control interface
    output infifo_ctrl_allow,
    //output bram control interface
    output outbram_ctrl_allow,
    input [C_NUM_OUTPUT_BRAMs-1:0] outbram_ctrl_ready,
    input [C_NUM_OUTPUT_BRAMs-1:0] outbram_ctrl_canstart,
    output [C_NUM_OUTPUT_BRAMs*32-1:0] outbram_depth,
    output [C_NUM_OUTPUT_BRAMs-1:0] outbram_depth_write,
    //output fifo control interface
    output outfifo_ctrl_allow,
    //input axis control interface
    output inaxis_ctrl_allow,
    //output axis control interface
    output outaxis_ctrl_allow,
    output ap_done_irq
    );
    

    localparam C_MAX = 128; //maximum quantity of scalars, fifos, brams
    
    localparam idle=0,update=1,wait_deps=2,start=3,wait_done=4;
    reg [2:0] ctrl_state = idle;
    
    integer idx;
    
    reg [31:0] slv_reg_in;
    reg slv_reg_in_vld;
    wire [31:0] slv_reg_out;
    wire slv_reg_out_vld;
    wire [13:0] slv_reg_addr;
    wire slv_reg_addr_vld;

    wire [C_MAX-1:0] outscalar_fifo_empty_i;
    wire [C_MAX-1:0] outscalar_fifo_full_i;
    reg [C_MAX-1:0] outscalar_null_read_i;
    wire [C_MAX-1:0] outscalar_null_empty_i;
    wire [C_MAX-1:0] outscalar_null_dout_i;
    wire [C_MAX-1:0] inscalar_fifo_empty_i;
    wire [C_MAX-1:0] inscalar_fifo_full_i;
    reg [C_MAX*32-1:0] outbram_depth_i;
    reg [C_MAX-1:0] outbram_depth_write_i;
    
    reg ap_rst_i;
    
    reg start_core;         //signal to start acc core
    
    reg running_core;       //state of accelerator is running
    
    wire [31:0] cmd_dout;    //data out from command queue
    wire cmd_read;           //read signal to command queue
    reg cmd_write;           //write signal to command queue
    wire cmd_empty;          //empty signal from command queue
    wire cmd_full;           //full signal from command queue
    
    wire done_dout;          //data out from done queue
    reg done_read;           //read signal to done queue
    wire done_empty;         //empty signal from done queue
    wire done_full;          //full signal from done queue
    
    wire [31:0] control_reg;  //control register 0
    wire [31:0] status_reg;  //status register 1
    
    //scalar registers
    reg [31:0] scalar_write_addr_i;
    reg [31:0] scalar_read_addr_i;
    reg scalar_we_i;
    reg scalar_re_i;
    
    //accelerator assignments
    assign ap_rst = ((acc_rstn) ? (~C_ACC_RESET_POLARITY) : C_ACC_RESET_POLARITY);
    assign ap_continue = 0;
    assign ap_clk = acc_clk;
    
    //scalar assignments
    assign scalar_write_addr = scalar_write_addr_i;
    assign scalar_read_addr = scalar_read_addr_i;
    assign scalar_din = slv_reg_out;
    assign scalar_we = scalar_we_i;
    assign scalar_re = scalar_re_i;
    
    generate
        if(C_NUM_OUTPUT_SCALARS > 0) begin
            assign outscalar_null_read[C_NUM_OUTPUT_SCALARS-1:0] = outscalar_null_read_i[C_NUM_OUTPUT_SCALARS-1:0];
            assign outscalar_null_empty_i[C_NUM_OUTPUT_SCALARS-1:0] = {{(C_MAX-C_NUM_OUTPUT_SCALARS){1'b0}},outscalar_null_empty};
            assign outscalar_null_dout_i[C_NUM_OUTPUT_SCALARS-1:0] = {{(C_MAX-C_NUM_OUTPUT_SCALARS){1'b0}},outscalar_null_dout};
        end
        else begin
            assign outscalar_null_empty_i = {C_MAX{1'b0}};
            assign outscalar_null_dout_i = {C_MAX{1'b0}};
        end
    endgenerate
    
    //bram assignments
    generate
       if(C_NUM_OUTPUT_BRAMs > 0) begin
	       assign outbram_depth = outbram_depth_i[C_NUM_OUTPUT_BRAMs*32-1:0];
	       assign outbram_depth_write = outbram_depth_write_i[C_NUM_OUTPUT_BRAMs-1:0];
       end
       else begin
	       assign outbram_depth = 0;
	       assign outbram_depth_write = 0;
       end
    endgenerate
        
    //internal signal assignments
    assign control_reg[0] = 0;      //start reset signal - unused
    assign control_reg[1] = 0; //reset ongoing status - unused
    assign control_reg[31:2] = 0;            //unused
    
    assign status_reg[0] = 0;    //TDB: core running status bit
    assign status_reg[1] = 0;       //registered acc done bit (COR) - unimplemented
    assign status_reg[2] = 0;         //straight ap_idle signal - unimplemented
    assign status_reg[3] = 0;        //straight ap_ready signal - unimplemented
    assign status_reg[4] = 0;       //done full signal from queue - unimplemented (CDC)
    assign status_reg[5] = done_empty;      //done empty signal from queue
    assign status_reg[6] = done_dout;       //done data out signal from queue
    assign status_reg[31:7] = 0;            //unused

    assign ap_done_irq = done_dout && !done_empty;

    //set in/out scalar status based on number of enabled in/out scalars
    genvar i;
    generate
        if(C_NUM_OUTPUT_SCALARS == 0) begin
            assign outscalar_fifo_full_i = 0;
            assign outscalar_fifo_empty_i = 0;
        end
        
        if(C_NUM_INPUT_SCALARS == 0) begin
            assign inscalar_fifo_full_i = 0;
            assign inscalar_fifo_empty_i = 0;
        end
        
        for(i=0; i<C_NUM_OUTPUT_SCALARS; i=i+1) begin : OUTSCALAR_ASSIGN
            assign outscalar_fifo_full_i[i] = outscalar_fifo_full[i];
            assign outscalar_fifo_empty_i[i] = outscalar_fifo_empty[i];
        end
        for(i=0; i<C_NUM_INPUT_SCALARS; i=i+1) begin : INSCALAR_ASSIGN
            assign inscalar_fifo_full_i[i] = inscalar_fifo_full[i];
            assign inscalar_fifo_empty_i[i] = inscalar_fifo_empty[i];
        end
    endgenerate
            
    //write address decode, register map implementation
    always @(posedge S_AXI_ACLK) begin
       //default values
       outbram_depth_write_i <= 0;
       
        if(S_AXI_ARESETN == 0) begin
            //values to set on reset
        end
        else begin
            if(slv_reg_out_vld) begin
                case(slv_reg_addr)
                    14'd0: begin
                        //slv_reg_out[0];  //write 1 to bit 0 to start reset sequence - unimplemented
                        //slv_reg_out[31:1], read only
                    end
                    14'd1: begin
                        //slv_reg_out[0], read only
                        //slv_reg_out[1]; done clean - unused
                        //slv_reg_out[31:2], read only
                    end
                    //14'd2 command reg implemented in non-clocked process
		          //14'd130-3 input scalar, implemented in non-clocked process
                    //14'd258-131 output scalar, read-only
                    //14'd386-259 input scalar status, read-only
                    //14'd514-387 output scalar status, read-only
                    14'd515: begin  //output arg0 length
                        outbram_depth_i[31:0] <= slv_reg_out;
                        outbram_depth_write_i[0] <= 1;
                    end
                    14'd516: begin  //output arg1 length
                        outbram_depth_i[63:32] <= slv_reg_out;
                        outbram_depth_write_i[1] <= 1;
                    end
                    14'd517: begin  //output arg2 length
                        outbram_depth_i[95:64] <= slv_reg_out;
                        outbram_depth_write_i[2] <= 1;
                    end
                    14'd518: begin  //output arg3 length
                        outbram_depth_i[127:96] <= slv_reg_out;
                        outbram_depth_write_i[3] <= 1;
                    end
                    14'd519: begin  //output arg4 length
                        outbram_depth_i[159:128] <= slv_reg_out;
                        outbram_depth_write_i[4] <= 1;
                    end
                    14'd520: begin  //output arg5 length
                        outbram_depth_i[191:160] <= slv_reg_out;
                        outbram_depth_write_i[5] <= 1;
                    end
                    14'd521: begin  //output arg6 length
                        outbram_depth_i[223:192] <= slv_reg_out;
                        outbram_depth_write_i[6] <= 1;
                    end
                    14'd522: begin  //output arg7 length
                        outbram_depth_i[255:224] <= slv_reg_out;
                        outbram_depth_write_i[7] <= 1;
                    end
                    14'd523: begin  //output arg8 length
                        outbram_depth_i[287:256] <= slv_reg_out;
                        outbram_depth_write_i[8] <= 1;
                    end
                    14'd524: begin  //output arg9 length
                        outbram_depth_i[319:288] <= slv_reg_out;
                        outbram_depth_write_i[9] <= 1;
                    end
                    14'd525: begin  //output arg10 length
                        outbram_depth_i[351:320] <= slv_reg_out;
                        outbram_depth_write_i[10] <= 1;
                    end
                    14'd526: begin  //output arg11 length
                        outbram_depth_i[383:352] <= slv_reg_out;
                        outbram_depth_write_i[11] <= 1;
                    end
                    14'd527: begin  //output arg12 length
                        outbram_depth_i[415:384] <= slv_reg_out;
                        outbram_depth_write_i[12] <= 1;
                    end
                    14'd528: begin  //output arg13 length
                        outbram_depth_i[447:416] <= slv_reg_out;
                        outbram_depth_write_i[13] <= 1;
                    end
                    14'd529: begin  //output arg14 length
                        outbram_depth_i[479:448] <= slv_reg_out;
                        outbram_depth_write_i[14] <= 1;
                    end
                    14'd530: begin  //output arg15 length
                        outbram_depth_i[511:480] <= slv_reg_out;
                        outbram_depth_write_i[15] <= 1;
                    end
                    14'd531: begin  //output arg16 length
                        outbram_depth_i[543:512] <= slv_reg_out;
                        outbram_depth_write_i[16] <= 1;
                    end
                    14'd532: begin  //output arg17 length
                        outbram_depth_i[575:544] <= slv_reg_out;
                        outbram_depth_write_i[17] <= 1;
                    end
                    14'd533: begin  //output arg18 length
                        outbram_depth_i[607:576] <= slv_reg_out;
                        outbram_depth_write_i[18] <= 1;
                    end
                    14'd534: begin  //output arg19 length
                        outbram_depth_i[639:608] <= slv_reg_out;
                        outbram_depth_write_i[19] <= 1;
                    end
                    14'd535: begin  //output arg20 length
                        outbram_depth_i[671:640] <= slv_reg_out;
                        outbram_depth_write_i[20] <= 1;
                    end
                    14'd536: begin  //output arg21 length
                        outbram_depth_i[703:672] <= slv_reg_out;
                        outbram_depth_write_i[21] <= 1;
                    end
                    14'd537: begin  //output arg22 length
                        outbram_depth_i[735:704] <= slv_reg_out;
                        outbram_depth_write_i[22] <= 1;
                    end
                    14'd538: begin  //output arg23 length
                        outbram_depth_i[767:736] <= slv_reg_out;
                        outbram_depth_write_i[23] <= 1;
                    end
                    14'd539: begin  //output arg24 length
                        outbram_depth_i[799:768] <= slv_reg_out;
                        outbram_depth_write_i[24] <= 1;
                    end
                    14'd540: begin  //output arg25 length
                        outbram_depth_i[831:800] <= slv_reg_out;
                        outbram_depth_write_i[25] <= 1;
                    end
                    14'd541: begin  //output arg26 length
                        outbram_depth_i[863:832] <= slv_reg_out;
                        outbram_depth_write_i[26] <= 1;
                    end
                    14'd542: begin  //output arg27 length
                        outbram_depth_i[895:864] <= slv_reg_out;
                        outbram_depth_write_i[27] <= 1;
                    end
                    14'd543: begin  //output arg28 length
                        outbram_depth_i[927:896] <= slv_reg_out;
                        outbram_depth_write_i[28] <= 1;
                    end
                    14'd544: begin  //output arg29 length
                        outbram_depth_i[959:928] <= slv_reg_out;
                        outbram_depth_write_i[29] <= 1;
                    end
                    14'd545: begin  //output arg30 length
                        outbram_depth_i[991:960] <= slv_reg_out;
                        outbram_depth_write_i[30] <= 1;
                    end
                    14'd546: begin  //output arg31 length
                        outbram_depth_i[1023:992] <= slv_reg_out;
                        outbram_depth_write_i[31] <= 1;
                    end
                    14'd547: begin  //output arg32 length
                        outbram_depth_i[1055:1024] <= slv_reg_out;
                        outbram_depth_write_i[32] <= 1;
                    end
                    14'd548: begin  //output arg33 length
                        outbram_depth_i[1087:1056] <= slv_reg_out;
                        outbram_depth_write_i[33] <= 1;
                    end
                    14'd549: begin  //output arg34 length
                        outbram_depth_i[1119:1088] <= slv_reg_out;
                        outbram_depth_write_i[34] <= 1;
                    end
                    14'd550: begin  //output arg35 length
                        outbram_depth_i[1151:1120] <= slv_reg_out;
                        outbram_depth_write_i[35] <= 1;
                    end
                    14'd551: begin  //output arg36 length
                        outbram_depth_i[1183:1152] <= slv_reg_out;
                        outbram_depth_write_i[36] <= 1;
                    end
                    14'd552: begin  //output arg37 length
                        outbram_depth_i[1215:1184] <= slv_reg_out;
                        outbram_depth_write_i[37] <= 1;
                    end
                    14'd553: begin  //output arg38 length
                        outbram_depth_i[1247:1216] <= slv_reg_out;
                        outbram_depth_write_i[38] <= 1;
                    end
                    14'd554: begin  //output arg39 length
                        outbram_depth_i[1279:1248] <= slv_reg_out;
                        outbram_depth_write_i[39] <= 1;
                    end
                    14'd555: begin  //output arg40 length
                        outbram_depth_i[1311:1280] <= slv_reg_out;
                        outbram_depth_write_i[40] <= 1;
                    end
                    14'd556: begin  //output arg41 length
                        outbram_depth_i[1343:1312] <= slv_reg_out;
                        outbram_depth_write_i[41] <= 1;
                    end
                    14'd557: begin  //output arg42 length
                        outbram_depth_i[1375:1344] <= slv_reg_out;
                        outbram_depth_write_i[42] <= 1;
                    end
                    14'd558: begin  //output arg43 length
                        outbram_depth_i[1407:1376] <= slv_reg_out;
                        outbram_depth_write_i[43] <= 1;
                    end
                    14'd559: begin  //output arg44 length
                        outbram_depth_i[1439:1408] <= slv_reg_out;
                        outbram_depth_write_i[44] <= 1;
                    end
                    14'd560: begin  //output arg45 length
                        outbram_depth_i[1471:1440] <= slv_reg_out;
                        outbram_depth_write_i[45] <= 1;
                    end
                    14'd561: begin  //output arg46 length
                        outbram_depth_i[1503:1472] <= slv_reg_out;
                        outbram_depth_write_i[46] <= 1;
                    end
                    14'd562: begin  //output arg47 length
                        outbram_depth_i[1535:1504] <= slv_reg_out;
                        outbram_depth_write_i[47] <= 1;
                    end
                    14'd563: begin  //output arg48 length
                        outbram_depth_i[1567:1536] <= slv_reg_out;
                        outbram_depth_write_i[48] <= 1;
                    end
                    14'd564: begin  //output arg49 length
                        outbram_depth_i[1599:1568] <= slv_reg_out;
                        outbram_depth_write_i[49] <= 1;
                    end
                    14'd565: begin  //output arg50 length
                        outbram_depth_i[1631:1600] <= slv_reg_out;
                        outbram_depth_write_i[50] <= 1;
                    end
                    14'd566: begin  //output arg51 length
                        outbram_depth_i[1663:1632] <= slv_reg_out;
                        outbram_depth_write_i[51] <= 1;
                    end
                    14'd567: begin  //output arg52 length
                        outbram_depth_i[1695:1664] <= slv_reg_out;
                        outbram_depth_write_i[52] <= 1;
                    end
                    14'd568: begin  //output arg53 length
                        outbram_depth_i[1727:1696] <= slv_reg_out;
                        outbram_depth_write_i[53] <= 1;
                    end
                    14'd569: begin  //output arg54 length
                        outbram_depth_i[1759:1728] <= slv_reg_out;
                        outbram_depth_write_i[54] <= 1;
                    end
                    14'd570: begin  //output arg55 length
                        outbram_depth_i[1791:1760] <= slv_reg_out;
                        outbram_depth_write_i[55] <= 1;
                    end
                    14'd571: begin  //output arg56 length
                        outbram_depth_i[1823:1792] <= slv_reg_out;
                        outbram_depth_write_i[56] <= 1;
                    end
                    14'd572: begin  //output arg57 length
                        outbram_depth_i[1855:1824] <= slv_reg_out;
                        outbram_depth_write_i[57] <= 1;
                    end
                    14'd573: begin  //output arg58 length
                        outbram_depth_i[1887:1856] <= slv_reg_out;
                        outbram_depth_write_i[58] <= 1;
                    end
                    14'd574: begin  //output arg59 length
                        outbram_depth_i[1919:1888] <= slv_reg_out;
                        outbram_depth_write_i[59] <= 1;
                    end
                    14'd575: begin  //output arg60 length
                        outbram_depth_i[1951:1920] <= slv_reg_out;
                        outbram_depth_write_i[60] <= 1;
                    end
                    14'd576: begin  //output arg61 length
                        outbram_depth_i[1983:1952] <= slv_reg_out;
                        outbram_depth_write_i[61] <= 1;
                    end
                    14'd577: begin  //output arg62 length
                        outbram_depth_i[2015:1984] <= slv_reg_out;
                        outbram_depth_write_i[62] <= 1;
                    end
                    14'd578: begin  //output arg63 length
                        outbram_depth_i[2047:2016] <= slv_reg_out;
                        outbram_depth_write_i[63] <= 1;
                    end
                    14'd579: begin  //output arg64 length
                        outbram_depth_i[2079:2048] <= slv_reg_out;
                        outbram_depth_write_i[64] <= 1;
                    end
                    14'd580: begin  //output arg65 length
                        outbram_depth_i[2111:2080] <= slv_reg_out;
                        outbram_depth_write_i[65] <= 1;
                    end
                    14'd581: begin  //output arg66 length
                        outbram_depth_i[2143:2112] <= slv_reg_out;
                        outbram_depth_write_i[66] <= 1;
                    end
                    14'd582: begin  //output arg67 length
                        outbram_depth_i[2175:2144] <= slv_reg_out;
                        outbram_depth_write_i[67] <= 1;
                    end
                    14'd583: begin  //output arg68 length
                        outbram_depth_i[2207:2176] <= slv_reg_out;
                        outbram_depth_write_i[68] <= 1;
                    end
                    14'd584: begin  //output arg69 length
                        outbram_depth_i[2239:2208] <= slv_reg_out;
                        outbram_depth_write_i[69] <= 1;
                    end
                    14'd585: begin  //output arg70 length
                        outbram_depth_i[2271:2240] <= slv_reg_out;
                        outbram_depth_write_i[70] <= 1;
                    end
                    14'd586: begin  //output arg71 length
                        outbram_depth_i[2303:2272] <= slv_reg_out;
                        outbram_depth_write_i[71] <= 1;
                    end
                    14'd587: begin  //output arg72 length
                        outbram_depth_i[2335:2304] <= slv_reg_out;
                        outbram_depth_write_i[72] <= 1;
                    end
                    14'd588: begin  //output arg73 length
                        outbram_depth_i[2367:2336] <= slv_reg_out;
                        outbram_depth_write_i[73] <= 1;
                    end
                    14'd589: begin  //output arg74 length
                        outbram_depth_i[2399:2368] <= slv_reg_out;
                        outbram_depth_write_i[74] <= 1;
                    end
                    14'd590: begin  //output arg75 length
                        outbram_depth_i[2431:2400] <= slv_reg_out;
                        outbram_depth_write_i[75] <= 1;
                    end
                    14'd591: begin  //output arg76 length
                        outbram_depth_i[2463:2432] <= slv_reg_out;
                        outbram_depth_write_i[76] <= 1;
                    end
                    14'd592: begin  //output arg77 length
                        outbram_depth_i[2495:2464] <= slv_reg_out;
                        outbram_depth_write_i[77] <= 1;
                    end
                    14'd593: begin  //output arg78 length
                        outbram_depth_i[2527:2496] <= slv_reg_out;
                        outbram_depth_write_i[78] <= 1;
                    end
                    14'd594: begin  //output arg79 length
                        outbram_depth_i[2559:2528] <= slv_reg_out;
                        outbram_depth_write_i[79] <= 1;
                    end
                    14'd595: begin  //output arg80 length
                        outbram_depth_i[2591:2560] <= slv_reg_out;
                        outbram_depth_write_i[80] <= 1;
                    end
                    14'd596: begin  //output arg81 length
                        outbram_depth_i[2623:2592] <= slv_reg_out;
                        outbram_depth_write_i[81] <= 1;
                    end
                    14'd597: begin  //output arg82 length
                        outbram_depth_i[2655:2624] <= slv_reg_out;
                        outbram_depth_write_i[82] <= 1;
                    end
                    14'd598: begin  //output arg83 length
                        outbram_depth_i[2687:2656] <= slv_reg_out;
                        outbram_depth_write_i[83] <= 1;
                    end
                    14'd599: begin  //output arg84 length
                        outbram_depth_i[2719:2688] <= slv_reg_out;
                        outbram_depth_write_i[84] <= 1;
                    end
                    14'd600: begin  //output arg85 length
                        outbram_depth_i[2751:2720] <= slv_reg_out;
                        outbram_depth_write_i[85] <= 1;
                    end
                    14'd601: begin  //output arg86 length
                        outbram_depth_i[2783:2752] <= slv_reg_out;
                        outbram_depth_write_i[86] <= 1;
                    end
                    14'd602: begin  //output arg87 length
                        outbram_depth_i[2815:2784] <= slv_reg_out;
                        outbram_depth_write_i[87] <= 1;
                    end
                    14'd603: begin  //output arg88 length
                        outbram_depth_i[2847:2816] <= slv_reg_out;
                        outbram_depth_write_i[88] <= 1;
                    end
                    14'd604: begin  //output arg89 length
                        outbram_depth_i[2879:2848] <= slv_reg_out;
                        outbram_depth_write_i[89] <= 1;
                    end
                    14'd605: begin  //output arg90 length
                        outbram_depth_i[2911:2880] <= slv_reg_out;
                        outbram_depth_write_i[90] <= 1;
                    end
                    14'd606: begin  //output arg91 length
                        outbram_depth_i[2943:2912] <= slv_reg_out;
                        outbram_depth_write_i[91] <= 1;
                    end
                    14'd607: begin  //output arg92 length
                        outbram_depth_i[2975:2944] <= slv_reg_out;
                        outbram_depth_write_i[92] <= 1;
                    end
                    14'd608: begin  //output arg93 length
                        outbram_depth_i[3007:2976] <= slv_reg_out;
                        outbram_depth_write_i[93] <= 1;
                    end
                    14'd609: begin  //output arg94 length
                        outbram_depth_i[3039:3008] <= slv_reg_out;
                        outbram_depth_write_i[94] <= 1;
                    end
                    14'd610: begin  //output arg95 length
                        outbram_depth_i[3071:3040] <= slv_reg_out;
                        outbram_depth_write_i[95] <= 1;
                    end
                    14'd611: begin  //output arg96 length
                        outbram_depth_i[3103:3072] <= slv_reg_out;
                        outbram_depth_write_i[96] <= 1;
                    end
                    14'd612: begin  //output arg97 length
                        outbram_depth_i[3135:3104] <= slv_reg_out;
                        outbram_depth_write_i[97] <= 1;
                    end
                    14'd613: begin  //output arg98 length
                        outbram_depth_i[3167:3136] <= slv_reg_out;
                        outbram_depth_write_i[98] <= 1;
                    end
                    14'd614: begin  //output arg99 length
                        outbram_depth_i[3199:3168] <= slv_reg_out;
                        outbram_depth_write_i[99] <= 1;
                    end
                    14'd615: begin  //output arg100 length
                        outbram_depth_i[3231:3200] <= slv_reg_out;
                        outbram_depth_write_i[100] <= 1;
                    end
                    14'd616: begin  //output arg101 length
                        outbram_depth_i[3263:3232] <= slv_reg_out;
                        outbram_depth_write_i[101] <= 1;
                    end
                    14'd617: begin  //output arg102 length
                        outbram_depth_i[3295:3264] <= slv_reg_out;
                        outbram_depth_write_i[102] <= 1;
                    end
                    14'd618: begin  //output arg103 length
                        outbram_depth_i[3327:3296] <= slv_reg_out;
                        outbram_depth_write_i[103] <= 1;
                    end
                    14'd619: begin  //output arg104 length
                        outbram_depth_i[3359:3328] <= slv_reg_out;
                        outbram_depth_write_i[104] <= 1;
                    end
                    14'd620: begin  //output arg105 length
                        outbram_depth_i[3391:3360] <= slv_reg_out;
                        outbram_depth_write_i[105] <= 1;
                    end
                    14'd621: begin  //output arg106 length
                        outbram_depth_i[3423:3392] <= slv_reg_out;
                        outbram_depth_write_i[106] <= 1;
                    end
                    14'd622: begin  //output arg107 length
                        outbram_depth_i[3455:3424] <= slv_reg_out;
                        outbram_depth_write_i[107] <= 1;
                    end
                    14'd623: begin  //output arg108 length
                        outbram_depth_i[3487:3456] <= slv_reg_out;
                        outbram_depth_write_i[108] <= 1;
                    end
                    14'd624: begin  //output arg109 length
                        outbram_depth_i[3519:3488] <= slv_reg_out;
                        outbram_depth_write_i[109] <= 1;
                    end
                    14'd625: begin  //output arg110 length
                        outbram_depth_i[3551:3520] <= slv_reg_out;
                        outbram_depth_write_i[110] <= 1;
                    end
                    14'd626: begin  //output arg111 length
                        outbram_depth_i[3583:3552] <= slv_reg_out;
                        outbram_depth_write_i[111] <= 1;
                    end
                    14'd627: begin  //output arg112 length
                        outbram_depth_i[3615:3584] <= slv_reg_out;
                        outbram_depth_write_i[112] <= 1;
                    end
                    14'd628: begin  //output arg113 length
                        outbram_depth_i[3647:3616] <= slv_reg_out;
                        outbram_depth_write_i[113] <= 1;
                    end
                    14'd629: begin  //output arg114 length
                        outbram_depth_i[3679:3648] <= slv_reg_out;
                        outbram_depth_write_i[114] <= 1;
                    end
                    14'd630: begin  //output arg115 length
                        outbram_depth_i[3711:3680] <= slv_reg_out;
                        outbram_depth_write_i[115] <= 1;
                    end
                    14'd631: begin  //output arg116 length
                        outbram_depth_i[3743:3712] <= slv_reg_out;
                        outbram_depth_write_i[116] <= 1;
                    end
                    14'd632: begin  //output arg117 length
                        outbram_depth_i[3775:3744] <= slv_reg_out;
                        outbram_depth_write_i[117] <= 1;
                    end
                    14'd633: begin  //output arg118 length
                        outbram_depth_i[3807:3776] <= slv_reg_out;
                        outbram_depth_write_i[118] <= 1;
                    end
                    14'd634: begin  //output arg119 length
                        outbram_depth_i[3839:3808] <= slv_reg_out;
                        outbram_depth_write_i[119] <= 1;
                    end
                    14'd635: begin  //output arg120 length
                        outbram_depth_i[3871:3840] <= slv_reg_out;
                        outbram_depth_write_i[120] <= 1;
                    end
                    14'd636: begin  //output arg121 length
                        outbram_depth_i[3903:3872] <= slv_reg_out;
                        outbram_depth_write_i[121] <= 1;
                    end
                    14'd637: begin  //output arg122 length
                        outbram_depth_i[3935:3904] <= slv_reg_out;
                        outbram_depth_write_i[122] <= 1;
                    end
                    14'd638: begin  //output arg123 length
                        outbram_depth_i[3967:3936] <= slv_reg_out;
                        outbram_depth_write_i[123] <= 1;
                    end
                    14'd639: begin  //output arg124 length
                        outbram_depth_i[3999:3968] <= slv_reg_out;
                        outbram_depth_write_i[124] <= 1;
                    end
                    14'd640: begin  //output arg125 length
                        outbram_depth_i[4031:4000] <= slv_reg_out;
                        outbram_depth_write_i[125] <= 1;
                    end
                    14'd641: begin  //output arg126 length
                        outbram_depth_i[4063:4032] <= slv_reg_out;
                        outbram_depth_write_i[126] <= 1;
                    end
                    14'd642: begin  //output arg127 length
                        outbram_depth_i[4095:4064] <= slv_reg_out;
                        outbram_depth_write_i[127] <= 1;
                    end
                    default: begin
                    end
                endcase
            end
        end 
    end
    
    //combinational logic for scalar module write-enable (we) generation and address translation (adapter address to scalar module addressing)
    always @(*) begin
        //default values
       scalar_write_addr_i <= 0;
        scalar_we_i <= 0;
        cmd_write <= 0;
        
        if(slv_reg_out_vld) begin
            case(slv_reg_addr)
                //14'd0 control reg, implemented in clocked process
                //14'd1 status reg, implemented in clocked process
                14'd2: begin  //command reg
                    cmd_write <= 1;
                end
                14'd3: begin  //input scalar 0
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 0;
                end
                14'd4: begin  //input scalar 1
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 1;
                end
                14'd5: begin  //input scalar 2
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 2;
                end
                14'd6: begin  //input scalar 3
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 3;
                end
                14'd7: begin  //input scalar 4
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 4;
                end
                14'd8: begin  //input scalar 5
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 5;
                end
                14'd9: begin  //input scalar 6
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 6;
                end
                14'd10: begin  //input scalar 7
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 7;
                end
                14'd11: begin  //input scalar 8
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 8;
                end
                14'd12: begin  //input scalar 9
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 9;
                end
                14'd13: begin  //input scalar 10
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 10;
                end
                14'd14: begin  //input scalar 11
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 11;
                end
                14'd15: begin  //input scalar 12
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 12;
                end
                14'd16: begin  //input scalar 13
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 13;
                end
                14'd17: begin  //input scalar 14
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 14;
                end
                14'd18: begin  //input scalar 15
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 15;
                end
                14'd19: begin  //input scalar 16
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 16;
                end
                14'd20: begin  //input scalar 17
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 17;
                end
                14'd21: begin  //input scalar 18
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 18;
                end
                14'd22: begin  //input scalar 19
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 19;
                end
                14'd23: begin  //input scalar 20
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 20;
                end
                14'd24: begin  //input scalar 21
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 21;
                end
                14'd25: begin  //input scalar 22
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 22;
                end
                14'd26: begin  //input scalar 23
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 23;
                end
                14'd27: begin  //input scalar 24
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 24;
                end
                14'd28: begin  //input scalar 25
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 25;
                end
                14'd29: begin  //input scalar 26
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 26;
                end
                14'd30: begin  //input scalar 27
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 27;
                end
                14'd31: begin  //input scalar 28
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 28;
                end
                14'd32: begin  //input scalar 29
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 29;
                end
                14'd33: begin  //input scalar 30
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 30;
                end
                14'd34: begin  //input scalar 31
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 31;
                end
                14'd35: begin  //input scalar 32
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 32;
                end
                14'd36: begin  //input scalar 33
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 33;
                end
                14'd37: begin  //input scalar 34
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 34;
                end
                14'd38: begin  //input scalar 35
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 35;
                end
                14'd39: begin  //input scalar 36
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 36;
                end
                14'd40: begin  //input scalar 37
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 37;
                end
                14'd41: begin  //input scalar 38
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 38;
                end
                14'd42: begin  //input scalar 39
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 39;
                end
                14'd43: begin  //input scalar 40
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 40;
                end
                14'd44: begin  //input scalar 41
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 41;
                end
                14'd45: begin  //input scalar 42
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 42;
                end
                14'd46: begin  //input scalar 43
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 43;
                end
                14'd47: begin  //input scalar 44
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 44;
                end
                14'd48: begin  //input scalar 45
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 45;
                end
                14'd49: begin  //input scalar 46
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 46;
                end
                14'd50: begin  //input scalar 47
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 47;
                end
                14'd51: begin  //input scalar 48
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 48;
                end
                14'd52: begin  //input scalar 49
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 49;
                end
                14'd53: begin  //input scalar 50
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 50;
                end
                14'd54: begin  //input scalar 51
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 51;
                end
                14'd55: begin  //input scalar 52
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 52;
                end
                14'd56: begin  //input scalar 53
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 53;
                end
                14'd57: begin  //input scalar 54
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 54;
                end
                14'd58: begin  //input scalar 55
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 55;
                end
                14'd59: begin  //input scalar 56
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 56;
                end
                14'd60: begin  //input scalar 57
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 57;
                end
                14'd61: begin  //input scalar 58
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 58;
                end
                14'd62: begin  //input scalar 59
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 59;
                end
                14'd63: begin  //input scalar 60
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 60;
                end
                14'd64: begin  //input scalar 61
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 61;
                end
                14'd65: begin  //input scalar 62
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 62;
                end
                14'd66: begin  //input scalar 63
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 63;
                end
                14'd67: begin  //input scalar 64
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 64;
                end
                14'd68: begin  //input scalar 65
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 65;
                end
                14'd69: begin  //input scalar 66
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 66;
                end
                14'd70: begin  //input scalar 67
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 67;
                end
                14'd71: begin  //input scalar 68
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 68;
                end
                14'd72: begin  //input scalar 69
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 69;
                end
                14'd73: begin  //input scalar 70
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 70;
                end
                14'd74: begin  //input scalar 71
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 71;
                end
                14'd75: begin  //input scalar 72
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 72;
                end
                14'd76: begin  //input scalar 73
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 73;
                end
                14'd77: begin  //input scalar 74
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 74;
                end
                14'd78: begin  //input scalar 75
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 75;
                end
                14'd79: begin  //input scalar 76
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 76;
                end
                14'd80: begin  //input scalar 77
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 77;
                end
                14'd81: begin  //input scalar 78
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 78;
                end
                14'd82: begin  //input scalar 79
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 79;
                end
                14'd83: begin  //input scalar 80
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 80;
                end
                14'd84: begin  //input scalar 81
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 81;
                end
                14'd85: begin  //input scalar 82
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 82;
                end
                14'd86: begin  //input scalar 83
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 83;
                end
                14'd87: begin  //input scalar 84
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 84;
                end
                14'd88: begin  //input scalar 85
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 85;
                end
                14'd89: begin  //input scalar 86
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 86;
                end
                14'd90: begin  //input scalar 87
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 87;
                end
                14'd91: begin  //input scalar 88
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 88;
                end
                14'd92: begin  //input scalar 89
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 89;
                end
                14'd93: begin  //input scalar 90
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 90;
                end
                14'd94: begin  //input scalar 91
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 91;
                end
                14'd95: begin  //input scalar 92
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 92;
                end
                14'd96: begin  //input scalar 93
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 93;
                end
                14'd97: begin  //input scalar 94
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 94;
                end
                14'd98: begin  //input scalar 95
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 95;
                end
                14'd99: begin  //input scalar 96
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 96;
                end
                14'd100: begin  //input scalar 97
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 97;
                end
                14'd101: begin  //input scalar 98
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 98;
                end
                14'd102: begin  //input scalar 99
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 99;
                end
                14'd103: begin  //input scalar 100
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 100;
                end
                14'd104: begin  //input scalar 101
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 101;
                end
                14'd105: begin  //input scalar 102
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 102;
                end
                14'd106: begin  //input scalar 103
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 103;
                end
                14'd107: begin  //input scalar 104
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 104;
                end
                14'd108: begin  //input scalar 105
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 105;
                end
                14'd109: begin  //input scalar 106
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 106;
                end
                14'd110: begin  //input scalar 107
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 107;
                end
                14'd111: begin  //input scalar 108
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 108;
                end
                14'd112: begin  //input scalar 109
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 109;
                end
                14'd113: begin  //input scalar 110
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 110;
                end
                14'd114: begin  //input scalar 111
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 111;
                end
                14'd115: begin  //input scalar 112
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 112;
                end
                14'd116: begin  //input scalar 113
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 113;
                end
                14'd117: begin  //input scalar 114
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 114;
                end
                14'd118: begin  //input scalar 115
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 115;
                end
                14'd119: begin  //input scalar 116
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 116;
                end
                14'd120: begin  //input scalar 117
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 117;
                end
                14'd121: begin  //input scalar 118
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 118;
                end
                14'd122: begin  //input scalar 119
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 119;
                end
                14'd123: begin  //input scalar 120
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 120;
                end
                14'd124: begin  //input scalar 121
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 121;
                end
                14'd125: begin  //input scalar 122
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 122;
                end
                14'd126: begin  //input scalar 123
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 123;
                end
                14'd127: begin  //input scalar 124
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 124;
                end
                14'd128: begin  //input scalar 125
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 125;
                end
                14'd129: begin  //input scalar 126
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 126;
                end
                14'd130: begin  //input scalar 127
                    scalar_we_i <= 1;
                    scalar_write_addr_i <= 127;
                end
                //14'd258-131 output scalar, read-only
                //14'd386-259 input scalar status, read-only
                //14'd514-387 output scalar status, read-only
                //14'd642-515 output argument length, implemented in clocked process
                default: begin
                end
            endcase
        end
    end
    
    //read address decode, register map implementation
    always @(*) begin
        //default values
        slv_reg_in <= 32'h5eaf000d;
        slv_reg_in_vld <= 0;
        scalar_read_addr_i <= 0;
        scalar_re_i <= 0;
        outscalar_null_read_i <= {C_MAX{1'b0}};
        done_read <= 0;
       
        if(slv_reg_addr_vld) begin
            case(slv_reg_addr)
                14'd0: begin   //control register
                    slv_reg_in <= control_reg;
                    slv_reg_in_vld <= 1;
                end
                14'd1: begin   //status register
                    slv_reg_in <= status_reg;
                    slv_reg_in_vld <= 1;
                    if(~done_empty)
                        done_read <= 1;
                end
                14'd2: begin   //command register
                    slv_reg_in <= {26'd0,   //Reserved
			                 1'd0,           //bit[5] cmd_empty - unimplemented (CDC)
			                 cmd_full,    //bit[4]
			                 4'd0};       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                //14'd130-3 input scalar, write only
                14'd131: begin  //output scalar 0
                    scalar_read_addr_i <= C_MAX+0;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd132: begin  //output scalar 1
                    scalar_read_addr_i <= C_MAX+1;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd133: begin  //output scalar 2
                    scalar_read_addr_i <= C_MAX+2;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd134: begin  //output scalar 3
                    scalar_read_addr_i <= C_MAX+3;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd135: begin  //output scalar 4
                    scalar_read_addr_i <= C_MAX+4;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd136: begin  //output scalar 5
                    scalar_read_addr_i <= C_MAX+5;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd137: begin  //output scalar 6
                    scalar_read_addr_i <= C_MAX+6;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd138: begin  //output scalar 7
                    scalar_read_addr_i <= C_MAX+7;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd139: begin  //output scalar 8
                    scalar_read_addr_i <= C_MAX+8;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd140: begin  //output scalar 9
                    scalar_read_addr_i <= C_MAX+9;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd141: begin  //output scalar 10
                    scalar_read_addr_i <= C_MAX+10;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd142: begin  //output scalar 11
                    scalar_read_addr_i <= C_MAX+11;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd143: begin  //output scalar 12
                    scalar_read_addr_i <= C_MAX+12;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd144: begin  //output scalar 13
                    scalar_read_addr_i <= C_MAX+13;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd145: begin  //output scalar 14
                    scalar_read_addr_i <= C_MAX+14;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd146: begin  //output scalar 15
                    scalar_read_addr_i <= C_MAX+15;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd147: begin  //output scalar 16
                    scalar_read_addr_i <= C_MAX+16;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd148: begin  //output scalar 17
                    scalar_read_addr_i <= C_MAX+17;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd149: begin  //output scalar 18
                    scalar_read_addr_i <= C_MAX+18;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd150: begin  //output scalar 19
                    scalar_read_addr_i <= C_MAX+19;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd151: begin  //output scalar 20
                    scalar_read_addr_i <= C_MAX+20;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd152: begin  //output scalar 21
                    scalar_read_addr_i <= C_MAX+21;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd153: begin  //output scalar 22
                    scalar_read_addr_i <= C_MAX+22;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd154: begin  //output scalar 23
                    scalar_read_addr_i <= C_MAX+23;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd155: begin  //output scalar 24
                    scalar_read_addr_i <= C_MAX+24;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd156: begin  //output scalar 25
                    scalar_read_addr_i <= C_MAX+25;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd157: begin  //output scalar 26
                    scalar_read_addr_i <= C_MAX+26;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd158: begin  //output scalar 27
                    scalar_read_addr_i <= C_MAX+27;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd159: begin  //output scalar 28
                    scalar_read_addr_i <= C_MAX+28;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd160: begin  //output scalar 29
                    scalar_read_addr_i <= C_MAX+29;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd161: begin  //output scalar 30
                    scalar_read_addr_i <= C_MAX+30;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd162: begin  //output scalar 31
                    scalar_read_addr_i <= C_MAX+31;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd163: begin  //output scalar 32
                    scalar_read_addr_i <= C_MAX+32;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd164: begin  //output scalar 33
                    scalar_read_addr_i <= C_MAX+33;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd165: begin  //output scalar 34
                    scalar_read_addr_i <= C_MAX+34;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd166: begin  //output scalar 35
                    scalar_read_addr_i <= C_MAX+35;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd167: begin  //output scalar 36
                    scalar_read_addr_i <= C_MAX+36;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd168: begin  //output scalar 37
                    scalar_read_addr_i <= C_MAX+37;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd169: begin  //output scalar 38
                    scalar_read_addr_i <= C_MAX+38;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd170: begin  //output scalar 39
                    scalar_read_addr_i <= C_MAX+39;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd171: begin  //output scalar 40
                    scalar_read_addr_i <= C_MAX+40;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd172: begin  //output scalar 41
                    scalar_read_addr_i <= C_MAX+41;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd173: begin  //output scalar 42
                    scalar_read_addr_i <= C_MAX+42;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd174: begin  //output scalar 43
                    scalar_read_addr_i <= C_MAX+43;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd175: begin  //output scalar 44
                    scalar_read_addr_i <= C_MAX+44;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd176: begin  //output scalar 45
                    scalar_read_addr_i <= C_MAX+45;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd177: begin  //output scalar 46
                    scalar_read_addr_i <= C_MAX+46;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd178: begin  //output scalar 47
                    scalar_read_addr_i <= C_MAX+47;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd179: begin  //output scalar 48
                    scalar_read_addr_i <= C_MAX+48;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd180: begin  //output scalar 49
                    scalar_read_addr_i <= C_MAX+49;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd181: begin  //output scalar 50
                    scalar_read_addr_i <= C_MAX+50;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd182: begin  //output scalar 51
                    scalar_read_addr_i <= C_MAX+51;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd183: begin  //output scalar 52
                    scalar_read_addr_i <= C_MAX+52;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd184: begin  //output scalar 53
                    scalar_read_addr_i <= C_MAX+53;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd185: begin  //output scalar 54
                    scalar_read_addr_i <= C_MAX+54;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd186: begin  //output scalar 55
                    scalar_read_addr_i <= C_MAX+55;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd187: begin  //output scalar 56
                    scalar_read_addr_i <= C_MAX+56;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd188: begin  //output scalar 57
                    scalar_read_addr_i <= C_MAX+57;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd189: begin  //output scalar 58
                    scalar_read_addr_i <= C_MAX+58;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd190: begin  //output scalar 59
                    scalar_read_addr_i <= C_MAX+59;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd191: begin  //output scalar 60
                    scalar_read_addr_i <= C_MAX+60;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd192: begin  //output scalar 61
                    scalar_read_addr_i <= C_MAX+61;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd193: begin  //output scalar 62
                    scalar_read_addr_i <= C_MAX+62;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd194: begin  //output scalar 63
                    scalar_read_addr_i <= C_MAX+63;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd195: begin  //output scalar 64
                    scalar_read_addr_i <= C_MAX+64;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd196: begin  //output scalar 65
                    scalar_read_addr_i <= C_MAX+65;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd197: begin  //output scalar 66
                    scalar_read_addr_i <= C_MAX+66;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd198: begin  //output scalar 67
                    scalar_read_addr_i <= C_MAX+67;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd199: begin  //output scalar 68
                    scalar_read_addr_i <= C_MAX+68;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd200: begin  //output scalar 69
                    scalar_read_addr_i <= C_MAX+69;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd201: begin  //output scalar 70
                    scalar_read_addr_i <= C_MAX+70;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd202: begin  //output scalar 71
                    scalar_read_addr_i <= C_MAX+71;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd203: begin  //output scalar 72
                    scalar_read_addr_i <= C_MAX+72;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd204: begin  //output scalar 73
                    scalar_read_addr_i <= C_MAX+73;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd205: begin  //output scalar 74
                    scalar_read_addr_i <= C_MAX+74;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd206: begin  //output scalar 75
                    scalar_read_addr_i <= C_MAX+75;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd207: begin  //output scalar 76
                    scalar_read_addr_i <= C_MAX+76;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd208: begin  //output scalar 77
                    scalar_read_addr_i <= C_MAX+77;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd209: begin  //output scalar 78
                    scalar_read_addr_i <= C_MAX+78;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd210: begin  //output scalar 79
                    scalar_read_addr_i <= C_MAX+79;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd211: begin  //output scalar 80
                    scalar_read_addr_i <= C_MAX+80;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd212: begin  //output scalar 81
                    scalar_read_addr_i <= C_MAX+81;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd213: begin  //output scalar 82
                    scalar_read_addr_i <= C_MAX+82;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd214: begin  //output scalar 83
                    scalar_read_addr_i <= C_MAX+83;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd215: begin  //output scalar 84
                    scalar_read_addr_i <= C_MAX+84;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd216: begin  //output scalar 85
                    scalar_read_addr_i <= C_MAX+85;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd217: begin  //output scalar 86
                    scalar_read_addr_i <= C_MAX+86;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd218: begin  //output scalar 87
                    scalar_read_addr_i <= C_MAX+87;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd219: begin  //output scalar 88
                    scalar_read_addr_i <= C_MAX+88;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd220: begin  //output scalar 89
                    scalar_read_addr_i <= C_MAX+89;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd221: begin  //output scalar 90
                    scalar_read_addr_i <= C_MAX+90;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd222: begin  //output scalar 91
                    scalar_read_addr_i <= C_MAX+91;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd223: begin  //output scalar 92
                    scalar_read_addr_i <= C_MAX+92;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd224: begin  //output scalar 93
                    scalar_read_addr_i <= C_MAX+93;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd225: begin  //output scalar 94
                    scalar_read_addr_i <= C_MAX+94;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd226: begin  //output scalar 95
                    scalar_read_addr_i <= C_MAX+95;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd227: begin  //output scalar 96
                    scalar_read_addr_i <= C_MAX+96;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd228: begin  //output scalar 97
                    scalar_read_addr_i <= C_MAX+97;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd229: begin  //output scalar 98
                    scalar_read_addr_i <= C_MAX+98;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd230: begin  //output scalar 99
                    scalar_read_addr_i <= C_MAX+99;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd231: begin  //output scalar 100
                    scalar_read_addr_i <= C_MAX+100;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd232: begin  //output scalar 101
                    scalar_read_addr_i <= C_MAX+101;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd233: begin  //output scalar 102
                    scalar_read_addr_i <= C_MAX+102;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd234: begin  //output scalar 103
                    scalar_read_addr_i <= C_MAX+103;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd235: begin  //output scalar 104
                    scalar_read_addr_i <= C_MAX+104;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd236: begin  //output scalar 105
                    scalar_read_addr_i <= C_MAX+105;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd237: begin  //output scalar 106
                    scalar_read_addr_i <= C_MAX+106;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd238: begin  //output scalar 107
                    scalar_read_addr_i <= C_MAX+107;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd239: begin  //output scalar 108
                    scalar_read_addr_i <= C_MAX+108;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd240: begin  //output scalar 109
                    scalar_read_addr_i <= C_MAX+109;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd241: begin  //output scalar 110
                    scalar_read_addr_i <= C_MAX+110;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd242: begin  //output scalar 111
                    scalar_read_addr_i <= C_MAX+111;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd243: begin  //output scalar 112
                    scalar_read_addr_i <= C_MAX+112;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd244: begin  //output scalar 113
                    scalar_read_addr_i <= C_MAX+113;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd245: begin  //output scalar 114
                    scalar_read_addr_i <= C_MAX+114;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd246: begin  //output scalar 115
                    scalar_read_addr_i <= C_MAX+115;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd247: begin  //output scalar 116
                    scalar_read_addr_i <= C_MAX+116;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd248: begin  //output scalar 117
                    scalar_read_addr_i <= C_MAX+117;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd249: begin  //output scalar 118
                    scalar_read_addr_i <= C_MAX+118;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd250: begin  //output scalar 119
                    scalar_read_addr_i <= C_MAX+119;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd251: begin  //output scalar 120
                    scalar_read_addr_i <= C_MAX+120;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd252: begin  //output scalar 121
                    scalar_read_addr_i <= C_MAX+121;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd253: begin  //output scalar 122
                    scalar_read_addr_i <= C_MAX+122;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd254: begin  //output scalar 123
                    scalar_read_addr_i <= C_MAX+123;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd255: begin  //output scalar 124
                    scalar_read_addr_i <= C_MAX+124;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd256: begin  //output scalar 125
                    scalar_read_addr_i <= C_MAX+125;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd257: begin  //output scalar 126
                    scalar_read_addr_i <= C_MAX+126;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd258: begin  //output scalar 127
                    scalar_read_addr_i <= C_MAX+127;
                    slv_reg_in <= scalar_dout;
                    slv_reg_in_vld <= 1;
                    scalar_re_i <= 1;
                end
                14'd259: begin  //input scalar 0 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[0], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[0],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd260: begin  //input scalar 1 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[1], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[1],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd261: begin  //input scalar 2 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[2], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[2],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd262: begin  //input scalar 3 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[3], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[3],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd263: begin  //input scalar 4 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[4], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[4],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd264: begin  //input scalar 5 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[5], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[5],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd265: begin  //input scalar 6 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[6], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[6],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd266: begin  //input scalar 7 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[7], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[7],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd267: begin  //input scalar 8 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[8], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[8],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd268: begin  //input scalar 9 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[9], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[9],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd269: begin  //input scalar 10 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[10], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[10],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd270: begin  //input scalar 11 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[11], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[11],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd271: begin  //input scalar 12 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[12], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[12],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd272: begin  //input scalar 13 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[13], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[13],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd273: begin  //input scalar 14 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[14], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[14],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd274: begin  //input scalar 15 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[15], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[15],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd275: begin  //input scalar 16 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[16], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[16],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd276: begin  //input scalar 17 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[17], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[17],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd277: begin  //input scalar 18 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[18], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[18],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd278: begin  //input scalar 19 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[19], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[19],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd279: begin  //input scalar 20 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[20], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[20],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd280: begin  //input scalar 21 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[21], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[21],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd281: begin  //input scalar 22 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[22], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[22],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd282: begin  //input scalar 23 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[23], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[23],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd283: begin  //input scalar 24 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[24], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[24],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd284: begin  //input scalar 25 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[25], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[25],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd285: begin  //input scalar 26 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[26], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[26],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd286: begin  //input scalar 27 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[27], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[27],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd287: begin  //input scalar 28 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[28], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[28],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd288: begin  //input scalar 29 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[29], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[29],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd289: begin  //input scalar 30 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[30], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[30],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd290: begin  //input scalar 31 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[31], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[31],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd291: begin  //input scalar 32 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[32], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[32],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd292: begin  //input scalar 33 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[33], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[33],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd293: begin  //input scalar 34 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[34], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[34],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd294: begin  //input scalar 35 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[35], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[35],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd295: begin  //input scalar 36 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[36], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[36],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd296: begin  //input scalar 37 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[37], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[37],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd297: begin  //input scalar 38 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[38], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[38],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd298: begin  //input scalar 39 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[39], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[39],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd299: begin  //input scalar 40 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[40], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[40],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd300: begin  //input scalar 41 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[41], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[41],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd301: begin  //input scalar 42 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[42], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[42],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd302: begin  //input scalar 43 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[43], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[43],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd303: begin  //input scalar 44 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[44], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[44],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd304: begin  //input scalar 45 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[45], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[45],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd305: begin  //input scalar 46 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[46], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[46],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd306: begin  //input scalar 47 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[47], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[47],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd307: begin  //input scalar 48 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[48], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[48],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd308: begin  //input scalar 49 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[49], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[49],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd309: begin  //input scalar 50 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[50], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[50],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd310: begin  //input scalar 51 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[51], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[51],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd311: begin  //input scalar 52 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[52], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[52],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd312: begin  //input scalar 53 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[53], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[53],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd313: begin  //input scalar 54 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[54], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[54],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd314: begin  //input scalar 55 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[55], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[55],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd315: begin  //input scalar 56 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[56], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[56],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd316: begin  //input scalar 57 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[57], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[57],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd317: begin  //input scalar 58 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[58], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[58],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd318: begin  //input scalar 59 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[59], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[59],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd319: begin  //input scalar 60 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[60], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[60],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd320: begin  //input scalar 61 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[61], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[61],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd321: begin  //input scalar 62 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[62], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[62],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd322: begin  //input scalar 63 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[63], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[63],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd323: begin  //input scalar 64 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[64], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[64],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd324: begin  //input scalar 65 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[65], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[65],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd325: begin  //input scalar 66 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[66], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[66],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd326: begin  //input scalar 67 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[67], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[67],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd327: begin  //input scalar 68 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[68], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[68],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd328: begin  //input scalar 69 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[69], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[69],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd329: begin  //input scalar 70 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[70], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[70],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd330: begin  //input scalar 71 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[71], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[71],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd331: begin  //input scalar 72 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[72], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[72],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd332: begin  //input scalar 73 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[73], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[73],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd333: begin  //input scalar 74 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[74], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[74],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd334: begin  //input scalar 75 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[75], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[75],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd335: begin  //input scalar 76 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[76], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[76],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd336: begin  //input scalar 77 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[77], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[77],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd337: begin  //input scalar 78 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[78], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[78],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd338: begin  //input scalar 79 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[79], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[79],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd339: begin  //input scalar 80 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[80], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[80],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd340: begin  //input scalar 81 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[81], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[81],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd341: begin  //input scalar 82 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[82], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[82],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd342: begin  //input scalar 83 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[83], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[83],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd343: begin  //input scalar 84 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[84], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[84],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd344: begin  //input scalar 85 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[85], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[85],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd345: begin  //input scalar 86 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[86], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[86],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd346: begin  //input scalar 87 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[87], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[87],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd347: begin  //input scalar 88 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[88], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[88],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd348: begin  //input scalar 89 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[89], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[89],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd349: begin  //input scalar 90 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[90], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[90],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd350: begin  //input scalar 91 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[91], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[91],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd351: begin  //input scalar 92 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[92], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[92],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd352: begin  //input scalar 93 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[93], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[93],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd353: begin  //input scalar 94 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[94], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[94],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd354: begin  //input scalar 95 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[95], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[95],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd355: begin  //input scalar 96 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[96], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[96],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd356: begin  //input scalar 97 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[97], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[97],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd357: begin  //input scalar 98 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[98], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[98],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd358: begin  //input scalar 99 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[99], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[99],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd359: begin  //input scalar 100 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[100], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[100],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd360: begin  //input scalar 101 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[101], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[101],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd361: begin  //input scalar 102 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[102], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[102],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd362: begin  //input scalar 103 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[103], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[103],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd363: begin  //input scalar 104 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[104], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[104],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd364: begin  //input scalar 105 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[105], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[105],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd365: begin  //input scalar 106 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[106], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[106],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd366: begin  //input scalar 107 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[107], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[107],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd367: begin  //input scalar 108 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[108], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[108],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd368: begin  //input scalar 109 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[109], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[109],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd369: begin  //input scalar 110 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[110], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[110],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd370: begin  //input scalar 111 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[111], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[111],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd371: begin  //input scalar 112 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[112], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[112],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd372: begin  //input scalar 113 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[113], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[113],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd373: begin  //input scalar 114 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[114], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[114],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd374: begin  //input scalar 115 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[115], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[115],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd375: begin  //input scalar 116 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[116], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[116],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd376: begin  //input scalar 117 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[117], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[117],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd377: begin  //input scalar 118 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[118], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[118],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd378: begin  //input scalar 119 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[119], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[119],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd379: begin  //input scalar 120 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[120], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[120],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd380: begin  //input scalar 121 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[121], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[121],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd381: begin  //input scalar 122 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[122], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[122],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd382: begin  //input scalar 123 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[123], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[123],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd383: begin  //input scalar 124 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[124], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[124],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd384: begin  //input scalar 125 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[125], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[125],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd385: begin  //input scalar 126 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[126], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[126],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd386: begin  //input scalar 127 status
                        slv_reg_in <= {26'd0,                     //Reserved
                                       inscalar_fifo_empty_i[127], //bit[5] - input scalar fifo empty
                                       inscalar_fifo_full_i[127],  //bit[4] - input scalar fifo full
                                       4'd0};                        //bits[3:0] - number of elements in fifo (unimplemented)
                        slv_reg_in_vld <= 1;
                end
                14'd387: begin  //output scalar 0 status
                    outscalar_null_read_i[0] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[0],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[0],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[0],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd388: begin  //output scalar 1 status
                    outscalar_null_read_i[1] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[1],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[1],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[1],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd389: begin  //output scalar 2 status
                    outscalar_null_read_i[2] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[2],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[2],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[2],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd390: begin  //output scalar 3 status
                    outscalar_null_read_i[3] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[3],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[3],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[3],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd391: begin  //output scalar 4 status
                    outscalar_null_read_i[4] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[4],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[4],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[4],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd392: begin  //output scalar 5 status
                    outscalar_null_read_i[5] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[5],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[5],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[5],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd393: begin  //output scalar 6 status
                    outscalar_null_read_i[6] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[6],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[6],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[6],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd394: begin  //output scalar 7 status
                    outscalar_null_read_i[7] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[7],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[7],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[7],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd395: begin  //output scalar 8 status
                    outscalar_null_read_i[8] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[8],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[8],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[8],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd396: begin  //output scalar 9 status
                    outscalar_null_read_i[9] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[9],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[9],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[9],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd397: begin  //output scalar 10 status
                    outscalar_null_read_i[10] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[10],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[10],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[10],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd398: begin  //output scalar 11 status
                    outscalar_null_read_i[11] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[11],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[11],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[11],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd399: begin  //output scalar 12 status
                    outscalar_null_read_i[12] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[12],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[12],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[12],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd400: begin  //output scalar 13 status
                    outscalar_null_read_i[13] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[13],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[13],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[13],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd401: begin  //output scalar 14 status
                    outscalar_null_read_i[14] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[14],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[14],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[14],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd402: begin  //output scalar 15 status
                    outscalar_null_read_i[15] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[15],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[15],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[15],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd403: begin  //output scalar 16 status
                    outscalar_null_read_i[16] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[16],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[16],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[16],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd404: begin  //output scalar 17 status
                    outscalar_null_read_i[17] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[17],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[17],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[17],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd405: begin  //output scalar 18 status
                    outscalar_null_read_i[18] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[18],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[18],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[18],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd406: begin  //output scalar 19 status
                    outscalar_null_read_i[19] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[19],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[19],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[19],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd407: begin  //output scalar 20 status
                    outscalar_null_read_i[20] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[20],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[20],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[20],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd408: begin  //output scalar 21 status
                    outscalar_null_read_i[21] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[21],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[21],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[21],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd409: begin  //output scalar 22 status
                    outscalar_null_read_i[22] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[22],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[22],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[22],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd410: begin  //output scalar 23 status
                    outscalar_null_read_i[23] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[23],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[23],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[23],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd411: begin  //output scalar 24 status
                    outscalar_null_read_i[24] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[24],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[24],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[24],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd412: begin  //output scalar 25 status
                    outscalar_null_read_i[25] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[25],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[25],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[25],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd413: begin  //output scalar 26 status
                    outscalar_null_read_i[26] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[26],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[26],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[26],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd414: begin  //output scalar 27 status
                    outscalar_null_read_i[27] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[27],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[27],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[27],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd415: begin  //output scalar 28 status
                    outscalar_null_read_i[28] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[28],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[28],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[28],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd416: begin  //output scalar 29 status
                    outscalar_null_read_i[29] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[29],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[29],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[29],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd417: begin  //output scalar 30 status
                    outscalar_null_read_i[30] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[30],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[30],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[30],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd418: begin  //output scalar 31 status
                    outscalar_null_read_i[31] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[31],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[31],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[31],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd419: begin  //output scalar 32 status
                    outscalar_null_read_i[32] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[32],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[32],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[32],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd420: begin  //output scalar 33 status
                    outscalar_null_read_i[33] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[33],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[33],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[33],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd421: begin  //output scalar 34 status
                    outscalar_null_read_i[34] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[34],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[34],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[34],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd422: begin  //output scalar 35 status
                    outscalar_null_read_i[35] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[35],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[35],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[35],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd423: begin  //output scalar 36 status
                    outscalar_null_read_i[36] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[36],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[36],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[36],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd424: begin  //output scalar 37 status
                    outscalar_null_read_i[37] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[37],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[37],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[37],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd425: begin  //output scalar 38 status
                    outscalar_null_read_i[38] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[38],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[38],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[38],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd426: begin  //output scalar 39 status
                    outscalar_null_read_i[39] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[39],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[39],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[39],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd427: begin  //output scalar 40 status
                    outscalar_null_read_i[40] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[40],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[40],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[40],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd428: begin  //output scalar 41 status
                    outscalar_null_read_i[41] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[41],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[41],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[41],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd429: begin  //output scalar 42 status
                    outscalar_null_read_i[42] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[42],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[42],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[42],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd430: begin  //output scalar 43 status
                    outscalar_null_read_i[43] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[43],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[43],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[43],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd431: begin  //output scalar 44 status
                    outscalar_null_read_i[44] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[44],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[44],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[44],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd432: begin  //output scalar 45 status
                    outscalar_null_read_i[45] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[45],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[45],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[45],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd433: begin  //output scalar 46 status
                    outscalar_null_read_i[46] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[46],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[46],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[46],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd434: begin  //output scalar 47 status
                    outscalar_null_read_i[47] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[47],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[47],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[47],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd435: begin  //output scalar 48 status
                    outscalar_null_read_i[48] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[48],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[48],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[48],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd436: begin  //output scalar 49 status
                    outscalar_null_read_i[49] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[49],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[49],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[49],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd437: begin  //output scalar 50 status
                    outscalar_null_read_i[50] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[50],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[50],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[50],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd438: begin  //output scalar 51 status
                    outscalar_null_read_i[51] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[51],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[51],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[51],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd439: begin  //output scalar 52 status
                    outscalar_null_read_i[52] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[52],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[52],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[52],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd440: begin  //output scalar 53 status
                    outscalar_null_read_i[53] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[53],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[53],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[53],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd441: begin  //output scalar 54 status
                    outscalar_null_read_i[54] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[54],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[54],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[54],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd442: begin  //output scalar 55 status
                    outscalar_null_read_i[55] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[55],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[55],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[55],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd443: begin  //output scalar 56 status
                    outscalar_null_read_i[56] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[56],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[56],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[56],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd444: begin  //output scalar 57 status
                    outscalar_null_read_i[57] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[57],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[57],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[57],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd445: begin  //output scalar 58 status
                    outscalar_null_read_i[58] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[58],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[58],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[58],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd446: begin  //output scalar 59 status
                    outscalar_null_read_i[59] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[59],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[59],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[59],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd447: begin  //output scalar 60 status
                    outscalar_null_read_i[60] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[60],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[60],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[60],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd448: begin  //output scalar 61 status
                    outscalar_null_read_i[61] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[61],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[61],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[61],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd449: begin  //output scalar 62 status
                    outscalar_null_read_i[62] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[62],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[62],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[62],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd450: begin  //output scalar 63 status
                    outscalar_null_read_i[63] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[63],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[63],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[63],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd451: begin  //output scalar 64 status
                    outscalar_null_read_i[64] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[64],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[64],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[64],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd452: begin  //output scalar 65 status
                    outscalar_null_read_i[65] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[65],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[65],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[65],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd453: begin  //output scalar 66 status
                    outscalar_null_read_i[66] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[66],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[66],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[66],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd454: begin  //output scalar 67 status
                    outscalar_null_read_i[67] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[67],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[67],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[67],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd455: begin  //output scalar 68 status
                    outscalar_null_read_i[68] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[68],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[68],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[68],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd456: begin  //output scalar 69 status
                    outscalar_null_read_i[69] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[69],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[69],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[69],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd457: begin  //output scalar 70 status
                    outscalar_null_read_i[70] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[70],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[70],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[70],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd458: begin  //output scalar 71 status
                    outscalar_null_read_i[71] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[71],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[71],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[71],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd459: begin  //output scalar 72 status
                    outscalar_null_read_i[72] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[72],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[72],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[72],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd460: begin  //output scalar 73 status
                    outscalar_null_read_i[73] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[73],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[73],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[73],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd461: begin  //output scalar 74 status
                    outscalar_null_read_i[74] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[74],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[74],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[74],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd462: begin  //output scalar 75 status
                    outscalar_null_read_i[75] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[75],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[75],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[75],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd463: begin  //output scalar 76 status
                    outscalar_null_read_i[76] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[76],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[76],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[76],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd464: begin  //output scalar 77 status
                    outscalar_null_read_i[77] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[77],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[77],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[77],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd465: begin  //output scalar 78 status
                    outscalar_null_read_i[78] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[78],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[78],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[78],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd466: begin  //output scalar 79 status
                    outscalar_null_read_i[79] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[79],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[79],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[79],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd467: begin  //output scalar 80 status
                    outscalar_null_read_i[80] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[80],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[80],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[80],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd468: begin  //output scalar 81 status
                    outscalar_null_read_i[81] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[81],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[81],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[81],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd469: begin  //output scalar 82 status
                    outscalar_null_read_i[82] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[82],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[82],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[82],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd470: begin  //output scalar 83 status
                    outscalar_null_read_i[83] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[83],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[83],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[83],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd471: begin  //output scalar 84 status
                    outscalar_null_read_i[84] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[84],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[84],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[84],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd472: begin  //output scalar 85 status
                    outscalar_null_read_i[85] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[85],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[85],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[85],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd473: begin  //output scalar 86 status
                    outscalar_null_read_i[86] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[86],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[86],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[86],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd474: begin  //output scalar 87 status
                    outscalar_null_read_i[87] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[87],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[87],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[87],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd475: begin  //output scalar 88 status
                    outscalar_null_read_i[88] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[88],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[88],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[88],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd476: begin  //output scalar 89 status
                    outscalar_null_read_i[89] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[89],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[89],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[89],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd477: begin  //output scalar 90 status
                    outscalar_null_read_i[90] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[90],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[90],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[90],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd478: begin  //output scalar 91 status
                    outscalar_null_read_i[91] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[91],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[91],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[91],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd479: begin  //output scalar 92 status
                    outscalar_null_read_i[92] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[92],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[92],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[92],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd480: begin  //output scalar 93 status
                    outscalar_null_read_i[93] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[93],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[93],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[93],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd481: begin  //output scalar 94 status
                    outscalar_null_read_i[94] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[94],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[94],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[94],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd482: begin  //output scalar 95 status
                    outscalar_null_read_i[95] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[95],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[95],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[95],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd483: begin  //output scalar 96 status
                    outscalar_null_read_i[96] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[96],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[96],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[96],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd484: begin  //output scalar 97 status
                    outscalar_null_read_i[97] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[97],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[97],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[97],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd485: begin  //output scalar 98 status
                    outscalar_null_read_i[98] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[98],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[98],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[98],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd486: begin  //output scalar 99 status
                    outscalar_null_read_i[99] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[99],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[99],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[99],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd487: begin  //output scalar 100 status
                    outscalar_null_read_i[100] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[100],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[100],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[100],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd488: begin  //output scalar 101 status
                    outscalar_null_read_i[101] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[101],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[101],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[101],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd489: begin  //output scalar 102 status
                    outscalar_null_read_i[102] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[102],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[102],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[102],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd490: begin  //output scalar 103 status
                    outscalar_null_read_i[103] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[103],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[103],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[103],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd491: begin  //output scalar 104 status
                    outscalar_null_read_i[104] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[104],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[104],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[104],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd492: begin  //output scalar 105 status
                    outscalar_null_read_i[105] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[105],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[105],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[105],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd493: begin  //output scalar 106 status
                    outscalar_null_read_i[106] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[106],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[106],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[106],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd494: begin  //output scalar 107 status
                    outscalar_null_read_i[107] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[107],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[107],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[107],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd495: begin  //output scalar 108 status
                    outscalar_null_read_i[108] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[108],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[108],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[108],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd496: begin  //output scalar 109 status
                    outscalar_null_read_i[109] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[109],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[109],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[109],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd497: begin  //output scalar 110 status
                    outscalar_null_read_i[110] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[110],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[110],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[110],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd498: begin  //output scalar 111 status
                    outscalar_null_read_i[111] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[111],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[111],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[111],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd499: begin  //output scalar 112 status
                    outscalar_null_read_i[112] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[112],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[112],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[112],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd500: begin  //output scalar 113 status
                    outscalar_null_read_i[113] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[113],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[113],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[113],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd501: begin  //output scalar 114 status
                    outscalar_null_read_i[114] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[114],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[114],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[114],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd502: begin  //output scalar 115 status
                    outscalar_null_read_i[115] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[115],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[115],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[115],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd503: begin  //output scalar 116 status
                    outscalar_null_read_i[116] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[116],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[116],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[116],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd504: begin  //output scalar 117 status
                    outscalar_null_read_i[117] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[117],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[117],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[117],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd505: begin  //output scalar 118 status
                    outscalar_null_read_i[118] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[118],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[118],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[118],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd506: begin  //output scalar 119 status
                    outscalar_null_read_i[119] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[119],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[119],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[119],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd507: begin  //output scalar 120 status
                    outscalar_null_read_i[120] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[120],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[120],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[120],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd508: begin  //output scalar 121 status
                    outscalar_null_read_i[121] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[121],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[121],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[121],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd509: begin  //output scalar 122 status
                    outscalar_null_read_i[122] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[122],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[122],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[122],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd510: begin  //output scalar 123 status
                    outscalar_null_read_i[123] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[123],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[123],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[123],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd511: begin  //output scalar 124 status
                    outscalar_null_read_i[124] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[124],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[124],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[124],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd512: begin  //output scalar 125 status
                    outscalar_null_read_i[125] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[125],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[125],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[125],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd513: begin  //output scalar 126 status
                    outscalar_null_read_i[126] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[126],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[126],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[126],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                14'd514: begin  //output scalar 127 status
                    outscalar_null_read_i[127] <= 1;
                    slv_reg_in <= {23'd0,                       //Reserved
                                   outscalar_fifo_empty_i[127],   //bit[8] - output scalar fifo empty
                                   1'b0,                               //bit[7] - Reserved
                                   outscalar_null_dout_i[127],    //bit[6] - output scalar null fifo data out
                                   outscalar_null_empty_i[127],   //bit[5] - output scalar null fifo empty
                                   1'b0,                        //bit[4] - output scalar null fifo full (0)
                                   4'd0};                       //bits[3:0] - number of elements in fifo (unimplemented)
                    slv_reg_in_vld <= 1;
                end
                default: begin
                end
            endcase
        end
    end
    
    //command register queue
    fifo #( 
        .WIDTH(32),
        .DEPTH(C_QUEUE_DEPTH)
    ) cmd_queue (
        .wr_clk(S_AXI_ACLK),
        .din(slv_reg_out),
        .write(cmd_write),
        .full(cmd_full),
        .dout(cmd_dout),
        .read(cmd_read),
        .empty(cmd_empty),
        .rd_clk(acc_clk), 
        .rst(0) 
    );
    
    //ap_done queue
    fifo #( 
        .WIDTH(1),
        .DEPTH(C_QUEUE_DEPTH)
    ) done_queue (
        .wr_clk(acc_clk),
        .din(1'b1),
        .write(ap_done),
        .full(done_full),
        .dout(done_dout),
        .read(done_read),
        .empty(done_empty),
        .rd_clk(S_AXI_ACLK), 
        .rst(0) 
    );
    
    //command queue handler
    cmd_control #(
        .NUM_INPUT_SCALARS(C_NUM_INPUT_SCALARS),
        .NUM_OUTPUT_SCALARS(C_NUM_OUTPUT_SCALARS),
        .NUM_INPUT_FIFOs(C_NUM_INPUT_FIFOs),
        .NUM_OUTPUT_FIFOs(C_NUM_OUTPUT_FIFOs),
        .NUM_INPUT_BRAMs(C_NUM_INPUT_BRAMs),
        .NUM_OUTPUT_BRAMs(C_NUM_OUTPUT_BRAMs)
    ) cmd_ctrl (
        //command queue interface
        .clk(acc_clk),
        .rstn(acc_rstn),
        .din(cmd_dout),
        .read(cmd_read),
        .empty(cmd_empty),
        .ap_start(ap_start),
        .ap_start_single(ap_start_single),
        .ap_done(ap_done),
        .ap_ready(ap_ready),
        .inscalar_fifo_empty(inscalar_fifo_empty),
        .inscalar_next(inscalar_next),
        .outscalar_fifo_full(outscalar_fifo_full),
        .inbram_ctrl_allow(inbram_ctrl_allow),
        .inbram_ctrl_ready(inbram_ctrl_ready),
        .inoutbram_ctrl_ready(inoutbram_ctrl_ready),
        .outbram_ctrl_allow(outbram_ctrl_allow),
        .outbram_ctrl_ready(outbram_ctrl_ready),
        .outbram_ctrl_canstart(outbram_ctrl_canstart),
        .infifo_ctrl_allow(infifo_ctrl_allow),
        .outfifo_ctrl_allow(outfifo_ctrl_allow),
        .inaxis_ctrl_allow(inaxis_ctrl_allow),
        .outaxis_ctrl_allow(outaxis_ctrl_allow)
    );
    
    //axi lite interface module
    AXI_LITE_IF #(
        .C_S_AXI_DATA_WIDTH(32)
    ) axi_lite_if_i (
        .slv_reg_in(slv_reg_in),
        .slv_reg_in_vld(slv_reg_in_vld),
        .slv_reg_out(slv_reg_out),
        .slv_reg_out_vld(slv_reg_out_vld),
        .slv_reg_addr(slv_reg_addr),
        .slv_reg_addr_vld(slv_reg_addr_vld),
        .S_AXI_ACLK(S_AXI_ACLK),
        .S_AXI_ARESETN(S_AXI_ARESETN),
        .S_AXI_AWADDR(S_AXI_AWADDR),
        .S_AXI_AWPROT(S_AXI_AWPROT),
        .S_AXI_AWVALID(S_AXI_AWVALID),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_WDATA(S_AXI_WDATA),
        .S_AXI_WSTRB(S_AXI_WSTRB),
        .S_AXI_WVALID(S_AXI_WVALID),
        .S_AXI_WREADY(S_AXI_WREADY),
        .S_AXI_BRESP(S_AXI_BRESP),
        .S_AXI_BVALID(S_AXI_BVALID),
        .S_AXI_BREADY(S_AXI_BREADY),
        .S_AXI_ARADDR(S_AXI_ARADDR),
        .S_AXI_ARPROT(S_AXI_ARPROT),
        .S_AXI_ARVALID(S_AXI_ARVALID),
        .S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_RDATA(S_AXI_RDATA),
        .S_AXI_RRESP(S_AXI_RRESP),
        .S_AXI_RVALID(S_AXI_RVALID),
        .S_AXI_RREADY(S_AXI_RREADY)
    );
    
endmodule
