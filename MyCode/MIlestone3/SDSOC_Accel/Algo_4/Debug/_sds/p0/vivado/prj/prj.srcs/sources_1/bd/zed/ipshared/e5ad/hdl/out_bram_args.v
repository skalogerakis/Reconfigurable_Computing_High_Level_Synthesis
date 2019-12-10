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

module out_bram_args #(
    parameter C_QUEUE_DEPTH = 16,
    parameter C_NUM_OUTPUT_BRAMs = 0, 
    parameter M_AXIS_BRAM_0_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_1_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_2_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_3_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_4_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_5_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_6_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_7_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_8_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_9_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_10_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_11_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_12_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_13_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_14_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_15_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_16_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_17_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_18_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_19_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_20_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_21_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_22_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_23_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_24_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_25_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_26_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_27_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_28_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_29_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_30_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_31_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_32_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_33_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_34_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_35_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_36_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_37_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_38_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_39_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_40_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_41_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_42_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_43_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_44_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_45_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_46_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_47_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_48_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_49_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_50_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_51_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_52_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_53_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_54_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_55_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_56_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_57_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_58_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_59_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_60_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_61_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_62_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_63_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_64_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_65_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_66_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_67_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_68_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_69_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_70_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_71_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_72_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_73_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_74_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_75_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_76_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_77_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_78_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_79_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_80_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_81_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_82_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_83_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_84_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_85_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_86_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_87_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_88_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_89_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_90_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_91_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_92_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_93_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_94_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_95_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_96_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_97_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_98_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_99_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_100_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_101_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_102_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_103_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_104_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_105_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_106_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_107_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_108_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_109_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_110_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_111_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_112_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_113_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_114_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_115_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_116_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_117_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_118_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_119_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_120_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_121_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_122_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_123_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_124_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_125_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_126_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter M_AXIS_BRAM_127_PORTS = 1,            //number of bram ports (dual-ported, partitioned)
    parameter [31:0] M_AXIS_BRAM_0_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_1_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_2_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_3_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_4_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_5_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_6_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_7_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_8_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_9_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_10_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_11_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_12_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_13_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_14_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_15_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_16_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_17_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_18_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_19_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_20_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_21_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_22_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_23_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_24_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_25_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_26_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_27_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_28_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_29_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_30_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_31_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_32_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_33_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_34_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_35_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_36_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_37_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_38_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_39_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_40_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_41_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_42_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_43_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_44_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_45_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_46_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_47_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_48_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_49_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_50_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_51_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_52_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_53_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_54_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_55_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_56_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_57_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_58_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_59_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_60_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_61_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_62_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_63_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_64_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_65_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_66_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_67_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_68_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_69_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_70_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_71_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_72_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_73_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_74_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_75_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_76_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_77_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_78_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_79_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_80_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_81_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_82_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_83_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_84_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_85_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_86_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_87_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_88_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_89_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_90_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_91_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_92_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_93_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_94_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_95_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_96_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_97_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_98_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_99_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_100_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_101_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_102_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_103_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_104_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_105_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_106_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_107_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_108_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_109_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_110_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_111_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_112_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_113_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_114_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_115_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_116_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_117_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_118_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_119_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_120_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_121_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_122_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_123_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_124_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_125_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_126_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_127_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] M_AXIS_BRAM_0_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_1_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_2_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_3_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_4_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_5_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_6_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_7_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_8_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_9_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_10_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_11_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_12_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_13_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_14_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_15_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_16_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_17_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_18_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_19_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_20_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_21_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_22_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_23_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_24_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_25_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_26_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_27_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_28_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_29_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_30_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_31_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_32_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_33_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_34_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_35_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_36_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_37_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_38_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_39_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_40_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_41_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_42_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_43_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_44_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_45_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_46_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_47_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_48_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_49_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_50_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_51_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_52_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_53_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_54_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_55_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_56_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_57_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_58_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_59_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_60_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_61_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_62_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_63_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_64_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_65_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_66_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_67_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_68_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_69_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_70_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_71_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_72_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_73_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_74_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_75_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_76_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_77_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_78_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_79_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_80_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_81_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_82_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_83_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_84_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_85_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_86_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_87_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_88_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_89_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_90_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_91_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_92_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_93_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_94_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_95_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_96_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_97_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_98_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_99_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_100_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_101_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_102_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_103_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_104_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_105_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_106_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_107_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_108_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_109_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_110_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_111_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_112_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_113_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_114_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_115_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_116_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_117_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_118_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_119_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_120_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_121_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_122_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_123_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_124_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_125_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_126_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_127_DEPTH = 2,      //depth of FIFO in adapter for input bram interface (minimum value 1, required for clock conversion)
    parameter [31:0] M_AXIS_BRAM_0_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_1_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_2_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_3_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_4_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_5_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_6_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_7_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_8_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_9_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_10_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_11_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_12_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_13_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_14_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_15_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_16_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_17_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_18_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_19_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_20_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_21_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_22_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_23_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_24_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_25_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_26_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_27_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_28_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_29_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_30_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_31_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_32_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_33_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_34_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_35_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_36_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_37_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_38_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_39_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_40_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_41_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_42_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_43_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_44_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_45_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_46_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_47_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_48_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_49_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_50_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_51_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_52_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_53_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_54_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_55_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_56_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_57_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_58_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_59_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_60_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_61_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_62_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_63_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_64_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_65_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_66_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_67_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_68_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_69_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_70_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_71_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_72_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_73_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_74_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_75_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_76_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_77_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_78_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_79_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_80_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_81_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_82_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_83_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_84_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_85_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_86_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_87_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_88_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_89_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_90_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_91_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_92_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_93_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_94_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_95_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_96_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_97_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_98_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_99_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_100_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_101_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_102_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_103_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_104_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_105_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_106_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_107_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_108_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_109_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_110_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_111_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_112_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_113_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_114_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_115_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_116_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_117_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_118_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_119_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_120_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_121_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_122_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_123_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_124_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_125_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_126_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_127_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] M_AXIS_BRAM_0_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_1_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_2_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_3_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_4_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_5_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_6_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_7_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_8_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_9_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_10_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_11_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_12_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_13_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_14_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_15_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_16_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_17_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_18_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_19_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_20_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_21_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_22_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_23_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_24_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_25_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_26_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_27_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_28_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_29_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_30_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_31_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_32_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_33_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_34_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_35_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_36_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_37_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_38_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_39_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_40_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_41_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_42_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_43_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_44_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_45_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_46_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_47_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_48_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_49_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_50_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_51_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_52_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_53_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_54_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_55_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_56_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_57_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_58_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_59_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_60_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_61_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_62_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_63_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_64_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_65_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_66_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_67_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_68_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_69_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_70_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_71_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_72_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_73_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_74_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_75_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_76_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_77_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_78_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_79_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_80_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_81_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_82_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_83_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_84_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_85_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_86_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_87_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_88_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_89_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_90_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_91_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_92_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_93_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_94_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_95_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_96_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_97_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_98_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_99_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_100_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_101_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_102_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_103_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_104_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_105_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_106_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_107_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_108_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_109_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_110_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_111_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_112_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_113_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_114_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_115_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_116_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_117_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_118_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_119_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_120_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_121_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_122_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_123_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_124_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_125_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_126_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_127_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAM_0_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_1_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_2_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_3_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_4_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_5_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_6_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_7_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_8_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_9_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_10_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_11_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_12_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_13_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_14_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_15_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_16_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_17_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_18_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_19_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_20_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_21_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_22_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_23_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_24_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_25_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_26_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_27_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_28_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_29_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_30_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_31_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_32_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_33_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_34_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_35_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_36_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_37_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_38_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_39_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_40_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_41_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_42_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_43_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_44_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_45_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_46_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_47_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_48_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_49_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_50_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_51_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_52_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_53_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_54_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_55_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_56_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_57_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_58_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_59_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_60_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_61_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_62_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_63_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_64_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_65_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_66_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_67_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_68_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_69_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_70_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_71_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_72_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_73_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_74_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_75_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_76_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_77_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_78_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_79_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_80_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_81_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_82_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_83_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_84_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_85_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_86_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_87_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_88_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_89_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_90_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_91_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_92_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_93_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_94_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_95_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_96_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_97_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_98_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_99_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_100_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_101_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_102_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_103_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_104_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_105_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_106_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_107_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_108_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_109_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_110_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_111_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_112_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_113_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_114_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_115_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_116_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_117_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_118_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_119_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_120_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_121_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_122_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_123_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_124_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_125_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_126_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_127_MB_DEPTH = 1, //depth of BRAM in adapter for output bram interface
    parameter [31:0] M_AXIS_BRAM_0_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_1_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_2_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_3_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_4_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_5_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_6_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_7_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_8_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_9_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_10_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_11_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_12_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_13_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_14_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_15_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_16_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_17_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_18_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_19_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_20_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_21_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_22_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_23_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_24_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_25_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_26_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_27_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_28_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_29_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_30_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_31_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_32_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_33_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_34_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_35_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_36_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_37_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_38_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_39_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_40_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_41_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_42_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_43_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_44_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_45_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_46_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_47_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_48_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_49_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_50_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_51_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_52_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_53_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_54_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_55_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_56_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_57_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_58_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_59_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_60_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_61_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_62_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_63_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_64_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_65_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_66_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_67_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_68_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_69_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_70_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_71_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_72_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_73_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_74_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_75_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_76_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_77_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_78_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_79_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_80_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_81_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_82_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_83_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_84_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_85_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_86_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_87_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_88_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_89_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_90_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_91_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_92_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_93_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_94_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_95_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_96_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_97_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_98_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_99_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_100_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_101_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_102_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_103_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_104_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_105_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_106_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_107_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_108_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_109_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_110_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_111_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_112_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_113_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_114_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_115_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_116_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_117_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_118_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_119_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_120_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_121_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_122_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_123_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_124_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_125_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_126_ADDR_WIDTH = 1,
    parameter [31:0] M_AXIS_BRAM_127_ADDR_WIDTH = 1
 ) (
    input acc_clk,
    input acc_aresetn,
    //control interface
    input dm_clk,
    input dm_aresetn,
    input outbram_allow,
    input acc_start,
    input acc_done,
    output [C_NUM_OUTPUT_BRAMs-1:0] outbram_ready,
    output [C_NUM_OUTPUT_BRAMs-1:0] outbram_canstart,
    input [C_NUM_OUTPUT_BRAMs*32-1:0] outbram_depth,
    input [C_NUM_OUTPUT_BRAMs-1:0] outbram_depth_write,
    //-----------------------------------------------------------
    //out AXI-Stream output interface 0
    input m_axis_bram_0_aclk,
    input m_axis_bram_0_aresetn,
    output m_axis_bram_0_tlast,
    output m_axis_bram_0_tvalid,
    output [M_AXIS_BRAM_0_DMWIDTH/8-1:0] m_axis_bram_0_tkeep,
    output [M_AXIS_BRAM_0_DMWIDTH/8-1:0] m_axis_bram_0_tstrb,
    output [M_AXIS_BRAM_0_DMWIDTH-1:0] m_axis_bram_0_tdata,
    input m_axis_bram_0_tready,
    input [M_AXIS_BRAM_0_ADDR_WIDTH-1:0] ap_bram_0_addr0,
    input [M_AXIS_BRAM_0_WIDTH-1:0] ap_bram_0_din0,
    output [M_AXIS_BRAM_0_WIDTH-1:0] ap_bram_0_dout0,
    input [M_AXIS_BRAM_0_WIDTH/8-1:0]ap_bram_0_we0,
    input ap_bram_0_en0,
    input [M_AXIS_BRAM_0_ADDR_WIDTH-1:0] ap_bram_0_addr1,
    input [M_AXIS_BRAM_0_WIDTH-1:0] ap_bram_0_din1,
    output [M_AXIS_BRAM_0_WIDTH-1:0] ap_bram_0_dout1,
    input [M_AXIS_BRAM_0_WIDTH/8-1:0]ap_bram_0_we1,
    input ap_bram_0_en1,
    //out AXI-Stream output interface 1
    input m_axis_bram_1_aclk,
    input m_axis_bram_1_aresetn,
    output m_axis_bram_1_tlast,
    output m_axis_bram_1_tvalid,
    output [M_AXIS_BRAM_1_DMWIDTH/8-1:0] m_axis_bram_1_tkeep,
    output [M_AXIS_BRAM_1_DMWIDTH/8-1:0] m_axis_bram_1_tstrb,
    output [M_AXIS_BRAM_1_DMWIDTH-1:0] m_axis_bram_1_tdata,
    input m_axis_bram_1_tready,
    input [M_AXIS_BRAM_1_ADDR_WIDTH-1:0] ap_bram_1_addr0,
    input [M_AXIS_BRAM_1_WIDTH-1:0] ap_bram_1_din0,
    output [M_AXIS_BRAM_1_WIDTH-1:0] ap_bram_1_dout0,
    input [M_AXIS_BRAM_1_WIDTH/8-1:0]ap_bram_1_we0,
    input ap_bram_1_en0,
    input [M_AXIS_BRAM_1_ADDR_WIDTH-1:0] ap_bram_1_addr1,
    input [M_AXIS_BRAM_1_WIDTH-1:0] ap_bram_1_din1,
    output [M_AXIS_BRAM_1_WIDTH-1:0] ap_bram_1_dout1,
    input [M_AXIS_BRAM_1_WIDTH/8-1:0]ap_bram_1_we1,
    input ap_bram_1_en1,
    //out AXI-Stream output interface 2
    input m_axis_bram_2_aclk,
    input m_axis_bram_2_aresetn,
    output m_axis_bram_2_tlast,
    output m_axis_bram_2_tvalid,
    output [M_AXIS_BRAM_2_DMWIDTH/8-1:0] m_axis_bram_2_tkeep,
    output [M_AXIS_BRAM_2_DMWIDTH/8-1:0] m_axis_bram_2_tstrb,
    output [M_AXIS_BRAM_2_DMWIDTH-1:0] m_axis_bram_2_tdata,
    input m_axis_bram_2_tready,
    input [M_AXIS_BRAM_2_ADDR_WIDTH-1:0] ap_bram_2_addr0,
    input [M_AXIS_BRAM_2_WIDTH-1:0] ap_bram_2_din0,
    output [M_AXIS_BRAM_2_WIDTH-1:0] ap_bram_2_dout0,
    input [M_AXIS_BRAM_2_WIDTH/8-1:0]ap_bram_2_we0,
    input ap_bram_2_en0,
    input [M_AXIS_BRAM_2_ADDR_WIDTH-1:0] ap_bram_2_addr1,
    input [M_AXIS_BRAM_2_WIDTH-1:0] ap_bram_2_din1,
    output [M_AXIS_BRAM_2_WIDTH-1:0] ap_bram_2_dout1,
    input [M_AXIS_BRAM_2_WIDTH/8-1:0]ap_bram_2_we1,
    input ap_bram_2_en1,
    //out AXI-Stream output interface 3
    input m_axis_bram_3_aclk,
    input m_axis_bram_3_aresetn,
    output m_axis_bram_3_tlast,
    output m_axis_bram_3_tvalid,
    output [M_AXIS_BRAM_3_DMWIDTH/8-1:0] m_axis_bram_3_tkeep,
    output [M_AXIS_BRAM_3_DMWIDTH/8-1:0] m_axis_bram_3_tstrb,
    output [M_AXIS_BRAM_3_DMWIDTH-1:0] m_axis_bram_3_tdata,
    input m_axis_bram_3_tready,
    input [M_AXIS_BRAM_3_ADDR_WIDTH-1:0] ap_bram_3_addr0,
    input [M_AXIS_BRAM_3_WIDTH-1:0] ap_bram_3_din0,
    output [M_AXIS_BRAM_3_WIDTH-1:0] ap_bram_3_dout0,
    input [M_AXIS_BRAM_3_WIDTH/8-1:0]ap_bram_3_we0,
    input ap_bram_3_en0,
    input [M_AXIS_BRAM_3_ADDR_WIDTH-1:0] ap_bram_3_addr1,
    input [M_AXIS_BRAM_3_WIDTH-1:0] ap_bram_3_din1,
    output [M_AXIS_BRAM_3_WIDTH-1:0] ap_bram_3_dout1,
    input [M_AXIS_BRAM_3_WIDTH/8-1:0]ap_bram_3_we1,
    input ap_bram_3_en1,
    //out AXI-Stream output interface 4
    input m_axis_bram_4_aclk,
    input m_axis_bram_4_aresetn,
    output m_axis_bram_4_tlast,
    output m_axis_bram_4_tvalid,
    output [M_AXIS_BRAM_4_DMWIDTH/8-1:0] m_axis_bram_4_tkeep,
    output [M_AXIS_BRAM_4_DMWIDTH/8-1:0] m_axis_bram_4_tstrb,
    output [M_AXIS_BRAM_4_DMWIDTH-1:0] m_axis_bram_4_tdata,
    input m_axis_bram_4_tready,
    input [M_AXIS_BRAM_4_ADDR_WIDTH-1:0] ap_bram_4_addr0,
    input [M_AXIS_BRAM_4_WIDTH-1:0] ap_bram_4_din0,
    output [M_AXIS_BRAM_4_WIDTH-1:0] ap_bram_4_dout0,
    input [M_AXIS_BRAM_4_WIDTH/8-1:0]ap_bram_4_we0,
    input ap_bram_4_en0,
    input [M_AXIS_BRAM_4_ADDR_WIDTH-1:0] ap_bram_4_addr1,
    input [M_AXIS_BRAM_4_WIDTH-1:0] ap_bram_4_din1,
    output [M_AXIS_BRAM_4_WIDTH-1:0] ap_bram_4_dout1,
    input [M_AXIS_BRAM_4_WIDTH/8-1:0]ap_bram_4_we1,
    input ap_bram_4_en1,
    //out AXI-Stream output interface 5
    input m_axis_bram_5_aclk,
    input m_axis_bram_5_aresetn,
    output m_axis_bram_5_tlast,
    output m_axis_bram_5_tvalid,
    output [M_AXIS_BRAM_5_DMWIDTH/8-1:0] m_axis_bram_5_tkeep,
    output [M_AXIS_BRAM_5_DMWIDTH/8-1:0] m_axis_bram_5_tstrb,
    output [M_AXIS_BRAM_5_DMWIDTH-1:0] m_axis_bram_5_tdata,
    input m_axis_bram_5_tready,
    input [M_AXIS_BRAM_5_ADDR_WIDTH-1:0] ap_bram_5_addr0,
    input [M_AXIS_BRAM_5_WIDTH-1:0] ap_bram_5_din0,
    output [M_AXIS_BRAM_5_WIDTH-1:0] ap_bram_5_dout0,
    input [M_AXIS_BRAM_5_WIDTH/8-1:0]ap_bram_5_we0,
    input ap_bram_5_en0,
    input [M_AXIS_BRAM_5_ADDR_WIDTH-1:0] ap_bram_5_addr1,
    input [M_AXIS_BRAM_5_WIDTH-1:0] ap_bram_5_din1,
    output [M_AXIS_BRAM_5_WIDTH-1:0] ap_bram_5_dout1,
    input [M_AXIS_BRAM_5_WIDTH/8-1:0]ap_bram_5_we1,
    input ap_bram_5_en1,
    //out AXI-Stream output interface 6
    input m_axis_bram_6_aclk,
    input m_axis_bram_6_aresetn,
    output m_axis_bram_6_tlast,
    output m_axis_bram_6_tvalid,
    output [M_AXIS_BRAM_6_DMWIDTH/8-1:0] m_axis_bram_6_tkeep,
    output [M_AXIS_BRAM_6_DMWIDTH/8-1:0] m_axis_bram_6_tstrb,
    output [M_AXIS_BRAM_6_DMWIDTH-1:0] m_axis_bram_6_tdata,
    input m_axis_bram_6_tready,
    input [M_AXIS_BRAM_6_ADDR_WIDTH-1:0] ap_bram_6_addr0,
    input [M_AXIS_BRAM_6_WIDTH-1:0] ap_bram_6_din0,
    output [M_AXIS_BRAM_6_WIDTH-1:0] ap_bram_6_dout0,
    input [M_AXIS_BRAM_6_WIDTH/8-1:0]ap_bram_6_we0,
    input ap_bram_6_en0,
    input [M_AXIS_BRAM_6_ADDR_WIDTH-1:0] ap_bram_6_addr1,
    input [M_AXIS_BRAM_6_WIDTH-1:0] ap_bram_6_din1,
    output [M_AXIS_BRAM_6_WIDTH-1:0] ap_bram_6_dout1,
    input [M_AXIS_BRAM_6_WIDTH/8-1:0]ap_bram_6_we1,
    input ap_bram_6_en1,
    //out AXI-Stream output interface 7
    input m_axis_bram_7_aclk,
    input m_axis_bram_7_aresetn,
    output m_axis_bram_7_tlast,
    output m_axis_bram_7_tvalid,
    output [M_AXIS_BRAM_7_DMWIDTH/8-1:0] m_axis_bram_7_tkeep,
    output [M_AXIS_BRAM_7_DMWIDTH/8-1:0] m_axis_bram_7_tstrb,
    output [M_AXIS_BRAM_7_DMWIDTH-1:0] m_axis_bram_7_tdata,
    input m_axis_bram_7_tready,
    input [M_AXIS_BRAM_7_ADDR_WIDTH-1:0] ap_bram_7_addr0,
    input [M_AXIS_BRAM_7_WIDTH-1:0] ap_bram_7_din0,
    output [M_AXIS_BRAM_7_WIDTH-1:0] ap_bram_7_dout0,
    input [M_AXIS_BRAM_7_WIDTH/8-1:0]ap_bram_7_we0,
    input ap_bram_7_en0,
    input [M_AXIS_BRAM_7_ADDR_WIDTH-1:0] ap_bram_7_addr1,
    input [M_AXIS_BRAM_7_WIDTH-1:0] ap_bram_7_din1,
    output [M_AXIS_BRAM_7_WIDTH-1:0] ap_bram_7_dout1,
    input [M_AXIS_BRAM_7_WIDTH/8-1:0]ap_bram_7_we1,
    input ap_bram_7_en1,
    //out AXI-Stream output interface 8
    input m_axis_bram_8_aclk,
    input m_axis_bram_8_aresetn,
    output m_axis_bram_8_tlast,
    output m_axis_bram_8_tvalid,
    output [M_AXIS_BRAM_8_DMWIDTH/8-1:0] m_axis_bram_8_tkeep,
    output [M_AXIS_BRAM_8_DMWIDTH/8-1:0] m_axis_bram_8_tstrb,
    output [M_AXIS_BRAM_8_DMWIDTH-1:0] m_axis_bram_8_tdata,
    input m_axis_bram_8_tready,
    input [M_AXIS_BRAM_8_ADDR_WIDTH-1:0] ap_bram_8_addr0,
    input [M_AXIS_BRAM_8_WIDTH-1:0] ap_bram_8_din0,
    output [M_AXIS_BRAM_8_WIDTH-1:0] ap_bram_8_dout0,
    input [M_AXIS_BRAM_8_WIDTH/8-1:0]ap_bram_8_we0,
    input ap_bram_8_en0,
    input [M_AXIS_BRAM_8_ADDR_WIDTH-1:0] ap_bram_8_addr1,
    input [M_AXIS_BRAM_8_WIDTH-1:0] ap_bram_8_din1,
    output [M_AXIS_BRAM_8_WIDTH-1:0] ap_bram_8_dout1,
    input [M_AXIS_BRAM_8_WIDTH/8-1:0]ap_bram_8_we1,
    input ap_bram_8_en1,
    //out AXI-Stream output interface 9
    input m_axis_bram_9_aclk,
    input m_axis_bram_9_aresetn,
    output m_axis_bram_9_tlast,
    output m_axis_bram_9_tvalid,
    output [M_AXIS_BRAM_9_DMWIDTH/8-1:0] m_axis_bram_9_tkeep,
    output [M_AXIS_BRAM_9_DMWIDTH/8-1:0] m_axis_bram_9_tstrb,
    output [M_AXIS_BRAM_9_DMWIDTH-1:0] m_axis_bram_9_tdata,
    input m_axis_bram_9_tready,
    input [M_AXIS_BRAM_9_ADDR_WIDTH-1:0] ap_bram_9_addr0,
    input [M_AXIS_BRAM_9_WIDTH-1:0] ap_bram_9_din0,
    output [M_AXIS_BRAM_9_WIDTH-1:0] ap_bram_9_dout0,
    input [M_AXIS_BRAM_9_WIDTH/8-1:0]ap_bram_9_we0,
    input ap_bram_9_en0,
    input [M_AXIS_BRAM_9_ADDR_WIDTH-1:0] ap_bram_9_addr1,
    input [M_AXIS_BRAM_9_WIDTH-1:0] ap_bram_9_din1,
    output [M_AXIS_BRAM_9_WIDTH-1:0] ap_bram_9_dout1,
    input [M_AXIS_BRAM_9_WIDTH/8-1:0]ap_bram_9_we1,
    input ap_bram_9_en1,
    //out AXI-Stream output interface 10
    input m_axis_bram_10_aclk,
    input m_axis_bram_10_aresetn,
    output m_axis_bram_10_tlast,
    output m_axis_bram_10_tvalid,
    output [M_AXIS_BRAM_10_DMWIDTH/8-1:0] m_axis_bram_10_tkeep,
    output [M_AXIS_BRAM_10_DMWIDTH/8-1:0] m_axis_bram_10_tstrb,
    output [M_AXIS_BRAM_10_DMWIDTH-1:0] m_axis_bram_10_tdata,
    input m_axis_bram_10_tready,
    input [M_AXIS_BRAM_10_ADDR_WIDTH-1:0] ap_bram_10_addr0,
    input [M_AXIS_BRAM_10_WIDTH-1:0] ap_bram_10_din0,
    output [M_AXIS_BRAM_10_WIDTH-1:0] ap_bram_10_dout0,
    input [M_AXIS_BRAM_10_WIDTH/8-1:0]ap_bram_10_we0,
    input ap_bram_10_en0,
    input [M_AXIS_BRAM_10_ADDR_WIDTH-1:0] ap_bram_10_addr1,
    input [M_AXIS_BRAM_10_WIDTH-1:0] ap_bram_10_din1,
    output [M_AXIS_BRAM_10_WIDTH-1:0] ap_bram_10_dout1,
    input [M_AXIS_BRAM_10_WIDTH/8-1:0]ap_bram_10_we1,
    input ap_bram_10_en1,
    //out AXI-Stream output interface 11
    input m_axis_bram_11_aclk,
    input m_axis_bram_11_aresetn,
    output m_axis_bram_11_tlast,
    output m_axis_bram_11_tvalid,
    output [M_AXIS_BRAM_11_DMWIDTH/8-1:0] m_axis_bram_11_tkeep,
    output [M_AXIS_BRAM_11_DMWIDTH/8-1:0] m_axis_bram_11_tstrb,
    output [M_AXIS_BRAM_11_DMWIDTH-1:0] m_axis_bram_11_tdata,
    input m_axis_bram_11_tready,
    input [M_AXIS_BRAM_11_ADDR_WIDTH-1:0] ap_bram_11_addr0,
    input [M_AXIS_BRAM_11_WIDTH-1:0] ap_bram_11_din0,
    output [M_AXIS_BRAM_11_WIDTH-1:0] ap_bram_11_dout0,
    input [M_AXIS_BRAM_11_WIDTH/8-1:0]ap_bram_11_we0,
    input ap_bram_11_en0,
    input [M_AXIS_BRAM_11_ADDR_WIDTH-1:0] ap_bram_11_addr1,
    input [M_AXIS_BRAM_11_WIDTH-1:0] ap_bram_11_din1,
    output [M_AXIS_BRAM_11_WIDTH-1:0] ap_bram_11_dout1,
    input [M_AXIS_BRAM_11_WIDTH/8-1:0]ap_bram_11_we1,
    input ap_bram_11_en1,
    //out AXI-Stream output interface 12
    input m_axis_bram_12_aclk,
    input m_axis_bram_12_aresetn,
    output m_axis_bram_12_tlast,
    output m_axis_bram_12_tvalid,
    output [M_AXIS_BRAM_12_DMWIDTH/8-1:0] m_axis_bram_12_tkeep,
    output [M_AXIS_BRAM_12_DMWIDTH/8-1:0] m_axis_bram_12_tstrb,
    output [M_AXIS_BRAM_12_DMWIDTH-1:0] m_axis_bram_12_tdata,
    input m_axis_bram_12_tready,
    input [M_AXIS_BRAM_12_ADDR_WIDTH-1:0] ap_bram_12_addr0,
    input [M_AXIS_BRAM_12_WIDTH-1:0] ap_bram_12_din0,
    output [M_AXIS_BRAM_12_WIDTH-1:0] ap_bram_12_dout0,
    input [M_AXIS_BRAM_12_WIDTH/8-1:0]ap_bram_12_we0,
    input ap_bram_12_en0,
    input [M_AXIS_BRAM_12_ADDR_WIDTH-1:0] ap_bram_12_addr1,
    input [M_AXIS_BRAM_12_WIDTH-1:0] ap_bram_12_din1,
    output [M_AXIS_BRAM_12_WIDTH-1:0] ap_bram_12_dout1,
    input [M_AXIS_BRAM_12_WIDTH/8-1:0]ap_bram_12_we1,
    input ap_bram_12_en1,
    //out AXI-Stream output interface 13
    input m_axis_bram_13_aclk,
    input m_axis_bram_13_aresetn,
    output m_axis_bram_13_tlast,
    output m_axis_bram_13_tvalid,
    output [M_AXIS_BRAM_13_DMWIDTH/8-1:0] m_axis_bram_13_tkeep,
    output [M_AXIS_BRAM_13_DMWIDTH/8-1:0] m_axis_bram_13_tstrb,
    output [M_AXIS_BRAM_13_DMWIDTH-1:0] m_axis_bram_13_tdata,
    input m_axis_bram_13_tready,
    input [M_AXIS_BRAM_13_ADDR_WIDTH-1:0] ap_bram_13_addr0,
    input [M_AXIS_BRAM_13_WIDTH-1:0] ap_bram_13_din0,
    output [M_AXIS_BRAM_13_WIDTH-1:0] ap_bram_13_dout0,
    input [M_AXIS_BRAM_13_WIDTH/8-1:0]ap_bram_13_we0,
    input ap_bram_13_en0,
    input [M_AXIS_BRAM_13_ADDR_WIDTH-1:0] ap_bram_13_addr1,
    input [M_AXIS_BRAM_13_WIDTH-1:0] ap_bram_13_din1,
    output [M_AXIS_BRAM_13_WIDTH-1:0] ap_bram_13_dout1,
    input [M_AXIS_BRAM_13_WIDTH/8-1:0]ap_bram_13_we1,
    input ap_bram_13_en1,
    //out AXI-Stream output interface 14
    input m_axis_bram_14_aclk,
    input m_axis_bram_14_aresetn,
    output m_axis_bram_14_tlast,
    output m_axis_bram_14_tvalid,
    output [M_AXIS_BRAM_14_DMWIDTH/8-1:0] m_axis_bram_14_tkeep,
    output [M_AXIS_BRAM_14_DMWIDTH/8-1:0] m_axis_bram_14_tstrb,
    output [M_AXIS_BRAM_14_DMWIDTH-1:0] m_axis_bram_14_tdata,
    input m_axis_bram_14_tready,
    input [M_AXIS_BRAM_14_ADDR_WIDTH-1:0] ap_bram_14_addr0,
    input [M_AXIS_BRAM_14_WIDTH-1:0] ap_bram_14_din0,
    output [M_AXIS_BRAM_14_WIDTH-1:0] ap_bram_14_dout0,
    input [M_AXIS_BRAM_14_WIDTH/8-1:0]ap_bram_14_we0,
    input ap_bram_14_en0,
    input [M_AXIS_BRAM_14_ADDR_WIDTH-1:0] ap_bram_14_addr1,
    input [M_AXIS_BRAM_14_WIDTH-1:0] ap_bram_14_din1,
    output [M_AXIS_BRAM_14_WIDTH-1:0] ap_bram_14_dout1,
    input [M_AXIS_BRAM_14_WIDTH/8-1:0]ap_bram_14_we1,
    input ap_bram_14_en1,
    //out AXI-Stream output interface 15
    input m_axis_bram_15_aclk,
    input m_axis_bram_15_aresetn,
    output m_axis_bram_15_tlast,
    output m_axis_bram_15_tvalid,
    output [M_AXIS_BRAM_15_DMWIDTH/8-1:0] m_axis_bram_15_tkeep,
    output [M_AXIS_BRAM_15_DMWIDTH/8-1:0] m_axis_bram_15_tstrb,
    output [M_AXIS_BRAM_15_DMWIDTH-1:0] m_axis_bram_15_tdata,
    input m_axis_bram_15_tready,
    input [M_AXIS_BRAM_15_ADDR_WIDTH-1:0] ap_bram_15_addr0,
    input [M_AXIS_BRAM_15_WIDTH-1:0] ap_bram_15_din0,
    output [M_AXIS_BRAM_15_WIDTH-1:0] ap_bram_15_dout0,
    input [M_AXIS_BRAM_15_WIDTH/8-1:0]ap_bram_15_we0,
    input ap_bram_15_en0,
    input [M_AXIS_BRAM_15_ADDR_WIDTH-1:0] ap_bram_15_addr1,
    input [M_AXIS_BRAM_15_WIDTH-1:0] ap_bram_15_din1,
    output [M_AXIS_BRAM_15_WIDTH-1:0] ap_bram_15_dout1,
    input [M_AXIS_BRAM_15_WIDTH/8-1:0]ap_bram_15_we1,
    input ap_bram_15_en1,
    //out AXI-Stream output interface 16
    input m_axis_bram_16_aclk,
    input m_axis_bram_16_aresetn,
    output m_axis_bram_16_tlast,
    output m_axis_bram_16_tvalid,
    output [M_AXIS_BRAM_16_DMWIDTH/8-1:0] m_axis_bram_16_tkeep,
    output [M_AXIS_BRAM_16_DMWIDTH/8-1:0] m_axis_bram_16_tstrb,
    output [M_AXIS_BRAM_16_DMWIDTH-1:0] m_axis_bram_16_tdata,
    input m_axis_bram_16_tready,
    input [M_AXIS_BRAM_16_ADDR_WIDTH-1:0] ap_bram_16_addr0,
    input [M_AXIS_BRAM_16_WIDTH-1:0] ap_bram_16_din0,
    output [M_AXIS_BRAM_16_WIDTH-1:0] ap_bram_16_dout0,
    input [M_AXIS_BRAM_16_WIDTH/8-1:0]ap_bram_16_we0,
    input ap_bram_16_en0,
    input [M_AXIS_BRAM_16_ADDR_WIDTH-1:0] ap_bram_16_addr1,
    input [M_AXIS_BRAM_16_WIDTH-1:0] ap_bram_16_din1,
    output [M_AXIS_BRAM_16_WIDTH-1:0] ap_bram_16_dout1,
    input [M_AXIS_BRAM_16_WIDTH/8-1:0]ap_bram_16_we1,
    input ap_bram_16_en1,
    //out AXI-Stream output interface 17
    input m_axis_bram_17_aclk,
    input m_axis_bram_17_aresetn,
    output m_axis_bram_17_tlast,
    output m_axis_bram_17_tvalid,
    output [M_AXIS_BRAM_17_DMWIDTH/8-1:0] m_axis_bram_17_tkeep,
    output [M_AXIS_BRAM_17_DMWIDTH/8-1:0] m_axis_bram_17_tstrb,
    output [M_AXIS_BRAM_17_DMWIDTH-1:0] m_axis_bram_17_tdata,
    input m_axis_bram_17_tready,
    input [M_AXIS_BRAM_17_ADDR_WIDTH-1:0] ap_bram_17_addr0,
    input [M_AXIS_BRAM_17_WIDTH-1:0] ap_bram_17_din0,
    output [M_AXIS_BRAM_17_WIDTH-1:0] ap_bram_17_dout0,
    input [M_AXIS_BRAM_17_WIDTH/8-1:0]ap_bram_17_we0,
    input ap_bram_17_en0,
    input [M_AXIS_BRAM_17_ADDR_WIDTH-1:0] ap_bram_17_addr1,
    input [M_AXIS_BRAM_17_WIDTH-1:0] ap_bram_17_din1,
    output [M_AXIS_BRAM_17_WIDTH-1:0] ap_bram_17_dout1,
    input [M_AXIS_BRAM_17_WIDTH/8-1:0]ap_bram_17_we1,
    input ap_bram_17_en1,
    //out AXI-Stream output interface 18
    input m_axis_bram_18_aclk,
    input m_axis_bram_18_aresetn,
    output m_axis_bram_18_tlast,
    output m_axis_bram_18_tvalid,
    output [M_AXIS_BRAM_18_DMWIDTH/8-1:0] m_axis_bram_18_tkeep,
    output [M_AXIS_BRAM_18_DMWIDTH/8-1:0] m_axis_bram_18_tstrb,
    output [M_AXIS_BRAM_18_DMWIDTH-1:0] m_axis_bram_18_tdata,
    input m_axis_bram_18_tready,
    input [M_AXIS_BRAM_18_ADDR_WIDTH-1:0] ap_bram_18_addr0,
    input [M_AXIS_BRAM_18_WIDTH-1:0] ap_bram_18_din0,
    output [M_AXIS_BRAM_18_WIDTH-1:0] ap_bram_18_dout0,
    input [M_AXIS_BRAM_18_WIDTH/8-1:0]ap_bram_18_we0,
    input ap_bram_18_en0,
    input [M_AXIS_BRAM_18_ADDR_WIDTH-1:0] ap_bram_18_addr1,
    input [M_AXIS_BRAM_18_WIDTH-1:0] ap_bram_18_din1,
    output [M_AXIS_BRAM_18_WIDTH-1:0] ap_bram_18_dout1,
    input [M_AXIS_BRAM_18_WIDTH/8-1:0]ap_bram_18_we1,
    input ap_bram_18_en1,
    //out AXI-Stream output interface 19
    input m_axis_bram_19_aclk,
    input m_axis_bram_19_aresetn,
    output m_axis_bram_19_tlast,
    output m_axis_bram_19_tvalid,
    output [M_AXIS_BRAM_19_DMWIDTH/8-1:0] m_axis_bram_19_tkeep,
    output [M_AXIS_BRAM_19_DMWIDTH/8-1:0] m_axis_bram_19_tstrb,
    output [M_AXIS_BRAM_19_DMWIDTH-1:0] m_axis_bram_19_tdata,
    input m_axis_bram_19_tready,
    input [M_AXIS_BRAM_19_ADDR_WIDTH-1:0] ap_bram_19_addr0,
    input [M_AXIS_BRAM_19_WIDTH-1:0] ap_bram_19_din0,
    output [M_AXIS_BRAM_19_WIDTH-1:0] ap_bram_19_dout0,
    input [M_AXIS_BRAM_19_WIDTH/8-1:0]ap_bram_19_we0,
    input ap_bram_19_en0,
    input [M_AXIS_BRAM_19_ADDR_WIDTH-1:0] ap_bram_19_addr1,
    input [M_AXIS_BRAM_19_WIDTH-1:0] ap_bram_19_din1,
    output [M_AXIS_BRAM_19_WIDTH-1:0] ap_bram_19_dout1,
    input [M_AXIS_BRAM_19_WIDTH/8-1:0]ap_bram_19_we1,
    input ap_bram_19_en1,
    //out AXI-Stream output interface 20
    input m_axis_bram_20_aclk,
    input m_axis_bram_20_aresetn,
    output m_axis_bram_20_tlast,
    output m_axis_bram_20_tvalid,
    output [M_AXIS_BRAM_20_DMWIDTH/8-1:0] m_axis_bram_20_tkeep,
    output [M_AXIS_BRAM_20_DMWIDTH/8-1:0] m_axis_bram_20_tstrb,
    output [M_AXIS_BRAM_20_DMWIDTH-1:0] m_axis_bram_20_tdata,
    input m_axis_bram_20_tready,
    input [M_AXIS_BRAM_20_ADDR_WIDTH-1:0] ap_bram_20_addr0,
    input [M_AXIS_BRAM_20_WIDTH-1:0] ap_bram_20_din0,
    output [M_AXIS_BRAM_20_WIDTH-1:0] ap_bram_20_dout0,
    input [M_AXIS_BRAM_20_WIDTH/8-1:0]ap_bram_20_we0,
    input ap_bram_20_en0,
    input [M_AXIS_BRAM_20_ADDR_WIDTH-1:0] ap_bram_20_addr1,
    input [M_AXIS_BRAM_20_WIDTH-1:0] ap_bram_20_din1,
    output [M_AXIS_BRAM_20_WIDTH-1:0] ap_bram_20_dout1,
    input [M_AXIS_BRAM_20_WIDTH/8-1:0]ap_bram_20_we1,
    input ap_bram_20_en1,
    //out AXI-Stream output interface 21
    input m_axis_bram_21_aclk,
    input m_axis_bram_21_aresetn,
    output m_axis_bram_21_tlast,
    output m_axis_bram_21_tvalid,
    output [M_AXIS_BRAM_21_DMWIDTH/8-1:0] m_axis_bram_21_tkeep,
    output [M_AXIS_BRAM_21_DMWIDTH/8-1:0] m_axis_bram_21_tstrb,
    output [M_AXIS_BRAM_21_DMWIDTH-1:0] m_axis_bram_21_tdata,
    input m_axis_bram_21_tready,
    input [M_AXIS_BRAM_21_ADDR_WIDTH-1:0] ap_bram_21_addr0,
    input [M_AXIS_BRAM_21_WIDTH-1:0] ap_bram_21_din0,
    output [M_AXIS_BRAM_21_WIDTH-1:0] ap_bram_21_dout0,
    input [M_AXIS_BRAM_21_WIDTH/8-1:0]ap_bram_21_we0,
    input ap_bram_21_en0,
    input [M_AXIS_BRAM_21_ADDR_WIDTH-1:0] ap_bram_21_addr1,
    input [M_AXIS_BRAM_21_WIDTH-1:0] ap_bram_21_din1,
    output [M_AXIS_BRAM_21_WIDTH-1:0] ap_bram_21_dout1,
    input [M_AXIS_BRAM_21_WIDTH/8-1:0]ap_bram_21_we1,
    input ap_bram_21_en1,
    //out AXI-Stream output interface 22
    input m_axis_bram_22_aclk,
    input m_axis_bram_22_aresetn,
    output m_axis_bram_22_tlast,
    output m_axis_bram_22_tvalid,
    output [M_AXIS_BRAM_22_DMWIDTH/8-1:0] m_axis_bram_22_tkeep,
    output [M_AXIS_BRAM_22_DMWIDTH/8-1:0] m_axis_bram_22_tstrb,
    output [M_AXIS_BRAM_22_DMWIDTH-1:0] m_axis_bram_22_tdata,
    input m_axis_bram_22_tready,
    input [M_AXIS_BRAM_22_ADDR_WIDTH-1:0] ap_bram_22_addr0,
    input [M_AXIS_BRAM_22_WIDTH-1:0] ap_bram_22_din0,
    output [M_AXIS_BRAM_22_WIDTH-1:0] ap_bram_22_dout0,
    input [M_AXIS_BRAM_22_WIDTH/8-1:0]ap_bram_22_we0,
    input ap_bram_22_en0,
    input [M_AXIS_BRAM_22_ADDR_WIDTH-1:0] ap_bram_22_addr1,
    input [M_AXIS_BRAM_22_WIDTH-1:0] ap_bram_22_din1,
    output [M_AXIS_BRAM_22_WIDTH-1:0] ap_bram_22_dout1,
    input [M_AXIS_BRAM_22_WIDTH/8-1:0]ap_bram_22_we1,
    input ap_bram_22_en1,
    //out AXI-Stream output interface 23
    input m_axis_bram_23_aclk,
    input m_axis_bram_23_aresetn,
    output m_axis_bram_23_tlast,
    output m_axis_bram_23_tvalid,
    output [M_AXIS_BRAM_23_DMWIDTH/8-1:0] m_axis_bram_23_tkeep,
    output [M_AXIS_BRAM_23_DMWIDTH/8-1:0] m_axis_bram_23_tstrb,
    output [M_AXIS_BRAM_23_DMWIDTH-1:0] m_axis_bram_23_tdata,
    input m_axis_bram_23_tready,
    input [M_AXIS_BRAM_23_ADDR_WIDTH-1:0] ap_bram_23_addr0,
    input [M_AXIS_BRAM_23_WIDTH-1:0] ap_bram_23_din0,
    output [M_AXIS_BRAM_23_WIDTH-1:0] ap_bram_23_dout0,
    input [M_AXIS_BRAM_23_WIDTH/8-1:0]ap_bram_23_we0,
    input ap_bram_23_en0,
    input [M_AXIS_BRAM_23_ADDR_WIDTH-1:0] ap_bram_23_addr1,
    input [M_AXIS_BRAM_23_WIDTH-1:0] ap_bram_23_din1,
    output [M_AXIS_BRAM_23_WIDTH-1:0] ap_bram_23_dout1,
    input [M_AXIS_BRAM_23_WIDTH/8-1:0]ap_bram_23_we1,
    input ap_bram_23_en1,
    //out AXI-Stream output interface 24
    input m_axis_bram_24_aclk,
    input m_axis_bram_24_aresetn,
    output m_axis_bram_24_tlast,
    output m_axis_bram_24_tvalid,
    output [M_AXIS_BRAM_24_DMWIDTH/8-1:0] m_axis_bram_24_tkeep,
    output [M_AXIS_BRAM_24_DMWIDTH/8-1:0] m_axis_bram_24_tstrb,
    output [M_AXIS_BRAM_24_DMWIDTH-1:0] m_axis_bram_24_tdata,
    input m_axis_bram_24_tready,
    input [M_AXIS_BRAM_24_ADDR_WIDTH-1:0] ap_bram_24_addr0,
    input [M_AXIS_BRAM_24_WIDTH-1:0] ap_bram_24_din0,
    output [M_AXIS_BRAM_24_WIDTH-1:0] ap_bram_24_dout0,
    input [M_AXIS_BRAM_24_WIDTH/8-1:0]ap_bram_24_we0,
    input ap_bram_24_en0,
    input [M_AXIS_BRAM_24_ADDR_WIDTH-1:0] ap_bram_24_addr1,
    input [M_AXIS_BRAM_24_WIDTH-1:0] ap_bram_24_din1,
    output [M_AXIS_BRAM_24_WIDTH-1:0] ap_bram_24_dout1,
    input [M_AXIS_BRAM_24_WIDTH/8-1:0]ap_bram_24_we1,
    input ap_bram_24_en1,
    //out AXI-Stream output interface 25
    input m_axis_bram_25_aclk,
    input m_axis_bram_25_aresetn,
    output m_axis_bram_25_tlast,
    output m_axis_bram_25_tvalid,
    output [M_AXIS_BRAM_25_DMWIDTH/8-1:0] m_axis_bram_25_tkeep,
    output [M_AXIS_BRAM_25_DMWIDTH/8-1:0] m_axis_bram_25_tstrb,
    output [M_AXIS_BRAM_25_DMWIDTH-1:0] m_axis_bram_25_tdata,
    input m_axis_bram_25_tready,
    input [M_AXIS_BRAM_25_ADDR_WIDTH-1:0] ap_bram_25_addr0,
    input [M_AXIS_BRAM_25_WIDTH-1:0] ap_bram_25_din0,
    output [M_AXIS_BRAM_25_WIDTH-1:0] ap_bram_25_dout0,
    input [M_AXIS_BRAM_25_WIDTH/8-1:0]ap_bram_25_we0,
    input ap_bram_25_en0,
    input [M_AXIS_BRAM_25_ADDR_WIDTH-1:0] ap_bram_25_addr1,
    input [M_AXIS_BRAM_25_WIDTH-1:0] ap_bram_25_din1,
    output [M_AXIS_BRAM_25_WIDTH-1:0] ap_bram_25_dout1,
    input [M_AXIS_BRAM_25_WIDTH/8-1:0]ap_bram_25_we1,
    input ap_bram_25_en1,
    //out AXI-Stream output interface 26
    input m_axis_bram_26_aclk,
    input m_axis_bram_26_aresetn,
    output m_axis_bram_26_tlast,
    output m_axis_bram_26_tvalid,
    output [M_AXIS_BRAM_26_DMWIDTH/8-1:0] m_axis_bram_26_tkeep,
    output [M_AXIS_BRAM_26_DMWIDTH/8-1:0] m_axis_bram_26_tstrb,
    output [M_AXIS_BRAM_26_DMWIDTH-1:0] m_axis_bram_26_tdata,
    input m_axis_bram_26_tready,
    input [M_AXIS_BRAM_26_ADDR_WIDTH-1:0] ap_bram_26_addr0,
    input [M_AXIS_BRAM_26_WIDTH-1:0] ap_bram_26_din0,
    output [M_AXIS_BRAM_26_WIDTH-1:0] ap_bram_26_dout0,
    input [M_AXIS_BRAM_26_WIDTH/8-1:0]ap_bram_26_we0,
    input ap_bram_26_en0,
    input [M_AXIS_BRAM_26_ADDR_WIDTH-1:0] ap_bram_26_addr1,
    input [M_AXIS_BRAM_26_WIDTH-1:0] ap_bram_26_din1,
    output [M_AXIS_BRAM_26_WIDTH-1:0] ap_bram_26_dout1,
    input [M_AXIS_BRAM_26_WIDTH/8-1:0]ap_bram_26_we1,
    input ap_bram_26_en1,
    //out AXI-Stream output interface 27
    input m_axis_bram_27_aclk,
    input m_axis_bram_27_aresetn,
    output m_axis_bram_27_tlast,
    output m_axis_bram_27_tvalid,
    output [M_AXIS_BRAM_27_DMWIDTH/8-1:0] m_axis_bram_27_tkeep,
    output [M_AXIS_BRAM_27_DMWIDTH/8-1:0] m_axis_bram_27_tstrb,
    output [M_AXIS_BRAM_27_DMWIDTH-1:0] m_axis_bram_27_tdata,
    input m_axis_bram_27_tready,
    input [M_AXIS_BRAM_27_ADDR_WIDTH-1:0] ap_bram_27_addr0,
    input [M_AXIS_BRAM_27_WIDTH-1:0] ap_bram_27_din0,
    output [M_AXIS_BRAM_27_WIDTH-1:0] ap_bram_27_dout0,
    input [M_AXIS_BRAM_27_WIDTH/8-1:0]ap_bram_27_we0,
    input ap_bram_27_en0,
    input [M_AXIS_BRAM_27_ADDR_WIDTH-1:0] ap_bram_27_addr1,
    input [M_AXIS_BRAM_27_WIDTH-1:0] ap_bram_27_din1,
    output [M_AXIS_BRAM_27_WIDTH-1:0] ap_bram_27_dout1,
    input [M_AXIS_BRAM_27_WIDTH/8-1:0]ap_bram_27_we1,
    input ap_bram_27_en1,
    //out AXI-Stream output interface 28
    input m_axis_bram_28_aclk,
    input m_axis_bram_28_aresetn,
    output m_axis_bram_28_tlast,
    output m_axis_bram_28_tvalid,
    output [M_AXIS_BRAM_28_DMWIDTH/8-1:0] m_axis_bram_28_tkeep,
    output [M_AXIS_BRAM_28_DMWIDTH/8-1:0] m_axis_bram_28_tstrb,
    output [M_AXIS_BRAM_28_DMWIDTH-1:0] m_axis_bram_28_tdata,
    input m_axis_bram_28_tready,
    input [M_AXIS_BRAM_28_ADDR_WIDTH-1:0] ap_bram_28_addr0,
    input [M_AXIS_BRAM_28_WIDTH-1:0] ap_bram_28_din0,
    output [M_AXIS_BRAM_28_WIDTH-1:0] ap_bram_28_dout0,
    input [M_AXIS_BRAM_28_WIDTH/8-1:0]ap_bram_28_we0,
    input ap_bram_28_en0,
    input [M_AXIS_BRAM_28_ADDR_WIDTH-1:0] ap_bram_28_addr1,
    input [M_AXIS_BRAM_28_WIDTH-1:0] ap_bram_28_din1,
    output [M_AXIS_BRAM_28_WIDTH-1:0] ap_bram_28_dout1,
    input [M_AXIS_BRAM_28_WIDTH/8-1:0]ap_bram_28_we1,
    input ap_bram_28_en1,
    //out AXI-Stream output interface 29
    input m_axis_bram_29_aclk,
    input m_axis_bram_29_aresetn,
    output m_axis_bram_29_tlast,
    output m_axis_bram_29_tvalid,
    output [M_AXIS_BRAM_29_DMWIDTH/8-1:0] m_axis_bram_29_tkeep,
    output [M_AXIS_BRAM_29_DMWIDTH/8-1:0] m_axis_bram_29_tstrb,
    output [M_AXIS_BRAM_29_DMWIDTH-1:0] m_axis_bram_29_tdata,
    input m_axis_bram_29_tready,
    input [M_AXIS_BRAM_29_ADDR_WIDTH-1:0] ap_bram_29_addr0,
    input [M_AXIS_BRAM_29_WIDTH-1:0] ap_bram_29_din0,
    output [M_AXIS_BRAM_29_WIDTH-1:0] ap_bram_29_dout0,
    input [M_AXIS_BRAM_29_WIDTH/8-1:0]ap_bram_29_we0,
    input ap_bram_29_en0,
    input [M_AXIS_BRAM_29_ADDR_WIDTH-1:0] ap_bram_29_addr1,
    input [M_AXIS_BRAM_29_WIDTH-1:0] ap_bram_29_din1,
    output [M_AXIS_BRAM_29_WIDTH-1:0] ap_bram_29_dout1,
    input [M_AXIS_BRAM_29_WIDTH/8-1:0]ap_bram_29_we1,
    input ap_bram_29_en1,
    //out AXI-Stream output interface 30
    input m_axis_bram_30_aclk,
    input m_axis_bram_30_aresetn,
    output m_axis_bram_30_tlast,
    output m_axis_bram_30_tvalid,
    output [M_AXIS_BRAM_30_DMWIDTH/8-1:0] m_axis_bram_30_tkeep,
    output [M_AXIS_BRAM_30_DMWIDTH/8-1:0] m_axis_bram_30_tstrb,
    output [M_AXIS_BRAM_30_DMWIDTH-1:0] m_axis_bram_30_tdata,
    input m_axis_bram_30_tready,
    input [M_AXIS_BRAM_30_ADDR_WIDTH-1:0] ap_bram_30_addr0,
    input [M_AXIS_BRAM_30_WIDTH-1:0] ap_bram_30_din0,
    output [M_AXIS_BRAM_30_WIDTH-1:0] ap_bram_30_dout0,
    input [M_AXIS_BRAM_30_WIDTH/8-1:0]ap_bram_30_we0,
    input ap_bram_30_en0,
    input [M_AXIS_BRAM_30_ADDR_WIDTH-1:0] ap_bram_30_addr1,
    input [M_AXIS_BRAM_30_WIDTH-1:0] ap_bram_30_din1,
    output [M_AXIS_BRAM_30_WIDTH-1:0] ap_bram_30_dout1,
    input [M_AXIS_BRAM_30_WIDTH/8-1:0]ap_bram_30_we1,
    input ap_bram_30_en1,
    //out AXI-Stream output interface 31
    input m_axis_bram_31_aclk,
    input m_axis_bram_31_aresetn,
    output m_axis_bram_31_tlast,
    output m_axis_bram_31_tvalid,
    output [M_AXIS_BRAM_31_DMWIDTH/8-1:0] m_axis_bram_31_tkeep,
    output [M_AXIS_BRAM_31_DMWIDTH/8-1:0] m_axis_bram_31_tstrb,
    output [M_AXIS_BRAM_31_DMWIDTH-1:0] m_axis_bram_31_tdata,
    input m_axis_bram_31_tready,
    input [M_AXIS_BRAM_31_ADDR_WIDTH-1:0] ap_bram_31_addr0,
    input [M_AXIS_BRAM_31_WIDTH-1:0] ap_bram_31_din0,
    output [M_AXIS_BRAM_31_WIDTH-1:0] ap_bram_31_dout0,
    input [M_AXIS_BRAM_31_WIDTH/8-1:0]ap_bram_31_we0,
    input ap_bram_31_en0,
    input [M_AXIS_BRAM_31_ADDR_WIDTH-1:0] ap_bram_31_addr1,
    input [M_AXIS_BRAM_31_WIDTH-1:0] ap_bram_31_din1,
    output [M_AXIS_BRAM_31_WIDTH-1:0] ap_bram_31_dout1,
    input [M_AXIS_BRAM_31_WIDTH/8-1:0]ap_bram_31_we1,
    input ap_bram_31_en1,
    //out AXI-Stream output interface 32
    input m_axis_bram_32_aclk,
    input m_axis_bram_32_aresetn,
    output m_axis_bram_32_tlast,
    output m_axis_bram_32_tvalid,
    output [M_AXIS_BRAM_32_DMWIDTH/8-1:0] m_axis_bram_32_tkeep,
    output [M_AXIS_BRAM_32_DMWIDTH/8-1:0] m_axis_bram_32_tstrb,
    output [M_AXIS_BRAM_32_DMWIDTH-1:0] m_axis_bram_32_tdata,
    input m_axis_bram_32_tready,
    input [M_AXIS_BRAM_32_ADDR_WIDTH-1:0] ap_bram_32_addr0,
    input [M_AXIS_BRAM_32_WIDTH-1:0] ap_bram_32_din0,
    output [M_AXIS_BRAM_32_WIDTH-1:0] ap_bram_32_dout0,
    input [M_AXIS_BRAM_32_WIDTH/8-1:0]ap_bram_32_we0,
    input ap_bram_32_en0,
    input [M_AXIS_BRAM_32_ADDR_WIDTH-1:0] ap_bram_32_addr1,
    input [M_AXIS_BRAM_32_WIDTH-1:0] ap_bram_32_din1,
    output [M_AXIS_BRAM_32_WIDTH-1:0] ap_bram_32_dout1,
    input [M_AXIS_BRAM_32_WIDTH/8-1:0]ap_bram_32_we1,
    input ap_bram_32_en1,
    //out AXI-Stream output interface 33
    input m_axis_bram_33_aclk,
    input m_axis_bram_33_aresetn,
    output m_axis_bram_33_tlast,
    output m_axis_bram_33_tvalid,
    output [M_AXIS_BRAM_33_DMWIDTH/8-1:0] m_axis_bram_33_tkeep,
    output [M_AXIS_BRAM_33_DMWIDTH/8-1:0] m_axis_bram_33_tstrb,
    output [M_AXIS_BRAM_33_DMWIDTH-1:0] m_axis_bram_33_tdata,
    input m_axis_bram_33_tready,
    input [M_AXIS_BRAM_33_ADDR_WIDTH-1:0] ap_bram_33_addr0,
    input [M_AXIS_BRAM_33_WIDTH-1:0] ap_bram_33_din0,
    output [M_AXIS_BRAM_33_WIDTH-1:0] ap_bram_33_dout0,
    input [M_AXIS_BRAM_33_WIDTH/8-1:0]ap_bram_33_we0,
    input ap_bram_33_en0,
    input [M_AXIS_BRAM_33_ADDR_WIDTH-1:0] ap_bram_33_addr1,
    input [M_AXIS_BRAM_33_WIDTH-1:0] ap_bram_33_din1,
    output [M_AXIS_BRAM_33_WIDTH-1:0] ap_bram_33_dout1,
    input [M_AXIS_BRAM_33_WIDTH/8-1:0]ap_bram_33_we1,
    input ap_bram_33_en1,
    //out AXI-Stream output interface 34
    input m_axis_bram_34_aclk,
    input m_axis_bram_34_aresetn,
    output m_axis_bram_34_tlast,
    output m_axis_bram_34_tvalid,
    output [M_AXIS_BRAM_34_DMWIDTH/8-1:0] m_axis_bram_34_tkeep,
    output [M_AXIS_BRAM_34_DMWIDTH/8-1:0] m_axis_bram_34_tstrb,
    output [M_AXIS_BRAM_34_DMWIDTH-1:0] m_axis_bram_34_tdata,
    input m_axis_bram_34_tready,
    input [M_AXIS_BRAM_34_ADDR_WIDTH-1:0] ap_bram_34_addr0,
    input [M_AXIS_BRAM_34_WIDTH-1:0] ap_bram_34_din0,
    output [M_AXIS_BRAM_34_WIDTH-1:0] ap_bram_34_dout0,
    input [M_AXIS_BRAM_34_WIDTH/8-1:0]ap_bram_34_we0,
    input ap_bram_34_en0,
    input [M_AXIS_BRAM_34_ADDR_WIDTH-1:0] ap_bram_34_addr1,
    input [M_AXIS_BRAM_34_WIDTH-1:0] ap_bram_34_din1,
    output [M_AXIS_BRAM_34_WIDTH-1:0] ap_bram_34_dout1,
    input [M_AXIS_BRAM_34_WIDTH/8-1:0]ap_bram_34_we1,
    input ap_bram_34_en1,
    //out AXI-Stream output interface 35
    input m_axis_bram_35_aclk,
    input m_axis_bram_35_aresetn,
    output m_axis_bram_35_tlast,
    output m_axis_bram_35_tvalid,
    output [M_AXIS_BRAM_35_DMWIDTH/8-1:0] m_axis_bram_35_tkeep,
    output [M_AXIS_BRAM_35_DMWIDTH/8-1:0] m_axis_bram_35_tstrb,
    output [M_AXIS_BRAM_35_DMWIDTH-1:0] m_axis_bram_35_tdata,
    input m_axis_bram_35_tready,
    input [M_AXIS_BRAM_35_ADDR_WIDTH-1:0] ap_bram_35_addr0,
    input [M_AXIS_BRAM_35_WIDTH-1:0] ap_bram_35_din0,
    output [M_AXIS_BRAM_35_WIDTH-1:0] ap_bram_35_dout0,
    input [M_AXIS_BRAM_35_WIDTH/8-1:0]ap_bram_35_we0,
    input ap_bram_35_en0,
    input [M_AXIS_BRAM_35_ADDR_WIDTH-1:0] ap_bram_35_addr1,
    input [M_AXIS_BRAM_35_WIDTH-1:0] ap_bram_35_din1,
    output [M_AXIS_BRAM_35_WIDTH-1:0] ap_bram_35_dout1,
    input [M_AXIS_BRAM_35_WIDTH/8-1:0]ap_bram_35_we1,
    input ap_bram_35_en1,
    //out AXI-Stream output interface 36
    input m_axis_bram_36_aclk,
    input m_axis_bram_36_aresetn,
    output m_axis_bram_36_tlast,
    output m_axis_bram_36_tvalid,
    output [M_AXIS_BRAM_36_DMWIDTH/8-1:0] m_axis_bram_36_tkeep,
    output [M_AXIS_BRAM_36_DMWIDTH/8-1:0] m_axis_bram_36_tstrb,
    output [M_AXIS_BRAM_36_DMWIDTH-1:0] m_axis_bram_36_tdata,
    input m_axis_bram_36_tready,
    input [M_AXIS_BRAM_36_ADDR_WIDTH-1:0] ap_bram_36_addr0,
    input [M_AXIS_BRAM_36_WIDTH-1:0] ap_bram_36_din0,
    output [M_AXIS_BRAM_36_WIDTH-1:0] ap_bram_36_dout0,
    input [M_AXIS_BRAM_36_WIDTH/8-1:0]ap_bram_36_we0,
    input ap_bram_36_en0,
    input [M_AXIS_BRAM_36_ADDR_WIDTH-1:0] ap_bram_36_addr1,
    input [M_AXIS_BRAM_36_WIDTH-1:0] ap_bram_36_din1,
    output [M_AXIS_BRAM_36_WIDTH-1:0] ap_bram_36_dout1,
    input [M_AXIS_BRAM_36_WIDTH/8-1:0]ap_bram_36_we1,
    input ap_bram_36_en1,
    //out AXI-Stream output interface 37
    input m_axis_bram_37_aclk,
    input m_axis_bram_37_aresetn,
    output m_axis_bram_37_tlast,
    output m_axis_bram_37_tvalid,
    output [M_AXIS_BRAM_37_DMWIDTH/8-1:0] m_axis_bram_37_tkeep,
    output [M_AXIS_BRAM_37_DMWIDTH/8-1:0] m_axis_bram_37_tstrb,
    output [M_AXIS_BRAM_37_DMWIDTH-1:0] m_axis_bram_37_tdata,
    input m_axis_bram_37_tready,
    input [M_AXIS_BRAM_37_ADDR_WIDTH-1:0] ap_bram_37_addr0,
    input [M_AXIS_BRAM_37_WIDTH-1:0] ap_bram_37_din0,
    output [M_AXIS_BRAM_37_WIDTH-1:0] ap_bram_37_dout0,
    input [M_AXIS_BRAM_37_WIDTH/8-1:0]ap_bram_37_we0,
    input ap_bram_37_en0,
    input [M_AXIS_BRAM_37_ADDR_WIDTH-1:0] ap_bram_37_addr1,
    input [M_AXIS_BRAM_37_WIDTH-1:0] ap_bram_37_din1,
    output [M_AXIS_BRAM_37_WIDTH-1:0] ap_bram_37_dout1,
    input [M_AXIS_BRAM_37_WIDTH/8-1:0]ap_bram_37_we1,
    input ap_bram_37_en1,
    //out AXI-Stream output interface 38
    input m_axis_bram_38_aclk,
    input m_axis_bram_38_aresetn,
    output m_axis_bram_38_tlast,
    output m_axis_bram_38_tvalid,
    output [M_AXIS_BRAM_38_DMWIDTH/8-1:0] m_axis_bram_38_tkeep,
    output [M_AXIS_BRAM_38_DMWIDTH/8-1:0] m_axis_bram_38_tstrb,
    output [M_AXIS_BRAM_38_DMWIDTH-1:0] m_axis_bram_38_tdata,
    input m_axis_bram_38_tready,
    input [M_AXIS_BRAM_38_ADDR_WIDTH-1:0] ap_bram_38_addr0,
    input [M_AXIS_BRAM_38_WIDTH-1:0] ap_bram_38_din0,
    output [M_AXIS_BRAM_38_WIDTH-1:0] ap_bram_38_dout0,
    input [M_AXIS_BRAM_38_WIDTH/8-1:0]ap_bram_38_we0,
    input ap_bram_38_en0,
    input [M_AXIS_BRAM_38_ADDR_WIDTH-1:0] ap_bram_38_addr1,
    input [M_AXIS_BRAM_38_WIDTH-1:0] ap_bram_38_din1,
    output [M_AXIS_BRAM_38_WIDTH-1:0] ap_bram_38_dout1,
    input [M_AXIS_BRAM_38_WIDTH/8-1:0]ap_bram_38_we1,
    input ap_bram_38_en1,
    //out AXI-Stream output interface 39
    input m_axis_bram_39_aclk,
    input m_axis_bram_39_aresetn,
    output m_axis_bram_39_tlast,
    output m_axis_bram_39_tvalid,
    output [M_AXIS_BRAM_39_DMWIDTH/8-1:0] m_axis_bram_39_tkeep,
    output [M_AXIS_BRAM_39_DMWIDTH/8-1:0] m_axis_bram_39_tstrb,
    output [M_AXIS_BRAM_39_DMWIDTH-1:0] m_axis_bram_39_tdata,
    input m_axis_bram_39_tready,
    input [M_AXIS_BRAM_39_ADDR_WIDTH-1:0] ap_bram_39_addr0,
    input [M_AXIS_BRAM_39_WIDTH-1:0] ap_bram_39_din0,
    output [M_AXIS_BRAM_39_WIDTH-1:0] ap_bram_39_dout0,
    input [M_AXIS_BRAM_39_WIDTH/8-1:0]ap_bram_39_we0,
    input ap_bram_39_en0,
    input [M_AXIS_BRAM_39_ADDR_WIDTH-1:0] ap_bram_39_addr1,
    input [M_AXIS_BRAM_39_WIDTH-1:0] ap_bram_39_din1,
    output [M_AXIS_BRAM_39_WIDTH-1:0] ap_bram_39_dout1,
    input [M_AXIS_BRAM_39_WIDTH/8-1:0]ap_bram_39_we1,
    input ap_bram_39_en1,
    //out AXI-Stream output interface 40
    input m_axis_bram_40_aclk,
    input m_axis_bram_40_aresetn,
    output m_axis_bram_40_tlast,
    output m_axis_bram_40_tvalid,
    output [M_AXIS_BRAM_40_DMWIDTH/8-1:0] m_axis_bram_40_tkeep,
    output [M_AXIS_BRAM_40_DMWIDTH/8-1:0] m_axis_bram_40_tstrb,
    output [M_AXIS_BRAM_40_DMWIDTH-1:0] m_axis_bram_40_tdata,
    input m_axis_bram_40_tready,
    input [M_AXIS_BRAM_40_ADDR_WIDTH-1:0] ap_bram_40_addr0,
    input [M_AXIS_BRAM_40_WIDTH-1:0] ap_bram_40_din0,
    output [M_AXIS_BRAM_40_WIDTH-1:0] ap_bram_40_dout0,
    input [M_AXIS_BRAM_40_WIDTH/8-1:0]ap_bram_40_we0,
    input ap_bram_40_en0,
    input [M_AXIS_BRAM_40_ADDR_WIDTH-1:0] ap_bram_40_addr1,
    input [M_AXIS_BRAM_40_WIDTH-1:0] ap_bram_40_din1,
    output [M_AXIS_BRAM_40_WIDTH-1:0] ap_bram_40_dout1,
    input [M_AXIS_BRAM_40_WIDTH/8-1:0]ap_bram_40_we1,
    input ap_bram_40_en1,
    //out AXI-Stream output interface 41
    input m_axis_bram_41_aclk,
    input m_axis_bram_41_aresetn,
    output m_axis_bram_41_tlast,
    output m_axis_bram_41_tvalid,
    output [M_AXIS_BRAM_41_DMWIDTH/8-1:0] m_axis_bram_41_tkeep,
    output [M_AXIS_BRAM_41_DMWIDTH/8-1:0] m_axis_bram_41_tstrb,
    output [M_AXIS_BRAM_41_DMWIDTH-1:0] m_axis_bram_41_tdata,
    input m_axis_bram_41_tready,
    input [M_AXIS_BRAM_41_ADDR_WIDTH-1:0] ap_bram_41_addr0,
    input [M_AXIS_BRAM_41_WIDTH-1:0] ap_bram_41_din0,
    output [M_AXIS_BRAM_41_WIDTH-1:0] ap_bram_41_dout0,
    input [M_AXIS_BRAM_41_WIDTH/8-1:0]ap_bram_41_we0,
    input ap_bram_41_en0,
    input [M_AXIS_BRAM_41_ADDR_WIDTH-1:0] ap_bram_41_addr1,
    input [M_AXIS_BRAM_41_WIDTH-1:0] ap_bram_41_din1,
    output [M_AXIS_BRAM_41_WIDTH-1:0] ap_bram_41_dout1,
    input [M_AXIS_BRAM_41_WIDTH/8-1:0]ap_bram_41_we1,
    input ap_bram_41_en1,
    //out AXI-Stream output interface 42
    input m_axis_bram_42_aclk,
    input m_axis_bram_42_aresetn,
    output m_axis_bram_42_tlast,
    output m_axis_bram_42_tvalid,
    output [M_AXIS_BRAM_42_DMWIDTH/8-1:0] m_axis_bram_42_tkeep,
    output [M_AXIS_BRAM_42_DMWIDTH/8-1:0] m_axis_bram_42_tstrb,
    output [M_AXIS_BRAM_42_DMWIDTH-1:0] m_axis_bram_42_tdata,
    input m_axis_bram_42_tready,
    input [M_AXIS_BRAM_42_ADDR_WIDTH-1:0] ap_bram_42_addr0,
    input [M_AXIS_BRAM_42_WIDTH-1:0] ap_bram_42_din0,
    output [M_AXIS_BRAM_42_WIDTH-1:0] ap_bram_42_dout0,
    input [M_AXIS_BRAM_42_WIDTH/8-1:0]ap_bram_42_we0,
    input ap_bram_42_en0,
    input [M_AXIS_BRAM_42_ADDR_WIDTH-1:0] ap_bram_42_addr1,
    input [M_AXIS_BRAM_42_WIDTH-1:0] ap_bram_42_din1,
    output [M_AXIS_BRAM_42_WIDTH-1:0] ap_bram_42_dout1,
    input [M_AXIS_BRAM_42_WIDTH/8-1:0]ap_bram_42_we1,
    input ap_bram_42_en1,
    //out AXI-Stream output interface 43
    input m_axis_bram_43_aclk,
    input m_axis_bram_43_aresetn,
    output m_axis_bram_43_tlast,
    output m_axis_bram_43_tvalid,
    output [M_AXIS_BRAM_43_DMWIDTH/8-1:0] m_axis_bram_43_tkeep,
    output [M_AXIS_BRAM_43_DMWIDTH/8-1:0] m_axis_bram_43_tstrb,
    output [M_AXIS_BRAM_43_DMWIDTH-1:0] m_axis_bram_43_tdata,
    input m_axis_bram_43_tready,
    input [M_AXIS_BRAM_43_ADDR_WIDTH-1:0] ap_bram_43_addr0,
    input [M_AXIS_BRAM_43_WIDTH-1:0] ap_bram_43_din0,
    output [M_AXIS_BRAM_43_WIDTH-1:0] ap_bram_43_dout0,
    input [M_AXIS_BRAM_43_WIDTH/8-1:0]ap_bram_43_we0,
    input ap_bram_43_en0,
    input [M_AXIS_BRAM_43_ADDR_WIDTH-1:0] ap_bram_43_addr1,
    input [M_AXIS_BRAM_43_WIDTH-1:0] ap_bram_43_din1,
    output [M_AXIS_BRAM_43_WIDTH-1:0] ap_bram_43_dout1,
    input [M_AXIS_BRAM_43_WIDTH/8-1:0]ap_bram_43_we1,
    input ap_bram_43_en1,
    //out AXI-Stream output interface 44
    input m_axis_bram_44_aclk,
    input m_axis_bram_44_aresetn,
    output m_axis_bram_44_tlast,
    output m_axis_bram_44_tvalid,
    output [M_AXIS_BRAM_44_DMWIDTH/8-1:0] m_axis_bram_44_tkeep,
    output [M_AXIS_BRAM_44_DMWIDTH/8-1:0] m_axis_bram_44_tstrb,
    output [M_AXIS_BRAM_44_DMWIDTH-1:0] m_axis_bram_44_tdata,
    input m_axis_bram_44_tready,
    input [M_AXIS_BRAM_44_ADDR_WIDTH-1:0] ap_bram_44_addr0,
    input [M_AXIS_BRAM_44_WIDTH-1:0] ap_bram_44_din0,
    output [M_AXIS_BRAM_44_WIDTH-1:0] ap_bram_44_dout0,
    input [M_AXIS_BRAM_44_WIDTH/8-1:0]ap_bram_44_we0,
    input ap_bram_44_en0,
    input [M_AXIS_BRAM_44_ADDR_WIDTH-1:0] ap_bram_44_addr1,
    input [M_AXIS_BRAM_44_WIDTH-1:0] ap_bram_44_din1,
    output [M_AXIS_BRAM_44_WIDTH-1:0] ap_bram_44_dout1,
    input [M_AXIS_BRAM_44_WIDTH/8-1:0]ap_bram_44_we1,
    input ap_bram_44_en1,
    //out AXI-Stream output interface 45
    input m_axis_bram_45_aclk,
    input m_axis_bram_45_aresetn,
    output m_axis_bram_45_tlast,
    output m_axis_bram_45_tvalid,
    output [M_AXIS_BRAM_45_DMWIDTH/8-1:0] m_axis_bram_45_tkeep,
    output [M_AXIS_BRAM_45_DMWIDTH/8-1:0] m_axis_bram_45_tstrb,
    output [M_AXIS_BRAM_45_DMWIDTH-1:0] m_axis_bram_45_tdata,
    input m_axis_bram_45_tready,
    input [M_AXIS_BRAM_45_ADDR_WIDTH-1:0] ap_bram_45_addr0,
    input [M_AXIS_BRAM_45_WIDTH-1:0] ap_bram_45_din0,
    output [M_AXIS_BRAM_45_WIDTH-1:0] ap_bram_45_dout0,
    input [M_AXIS_BRAM_45_WIDTH/8-1:0]ap_bram_45_we0,
    input ap_bram_45_en0,
    input [M_AXIS_BRAM_45_ADDR_WIDTH-1:0] ap_bram_45_addr1,
    input [M_AXIS_BRAM_45_WIDTH-1:0] ap_bram_45_din1,
    output [M_AXIS_BRAM_45_WIDTH-1:0] ap_bram_45_dout1,
    input [M_AXIS_BRAM_45_WIDTH/8-1:0]ap_bram_45_we1,
    input ap_bram_45_en1,
    //out AXI-Stream output interface 46
    input m_axis_bram_46_aclk,
    input m_axis_bram_46_aresetn,
    output m_axis_bram_46_tlast,
    output m_axis_bram_46_tvalid,
    output [M_AXIS_BRAM_46_DMWIDTH/8-1:0] m_axis_bram_46_tkeep,
    output [M_AXIS_BRAM_46_DMWIDTH/8-1:0] m_axis_bram_46_tstrb,
    output [M_AXIS_BRAM_46_DMWIDTH-1:0] m_axis_bram_46_tdata,
    input m_axis_bram_46_tready,
    input [M_AXIS_BRAM_46_ADDR_WIDTH-1:0] ap_bram_46_addr0,
    input [M_AXIS_BRAM_46_WIDTH-1:0] ap_bram_46_din0,
    output [M_AXIS_BRAM_46_WIDTH-1:0] ap_bram_46_dout0,
    input [M_AXIS_BRAM_46_WIDTH/8-1:0]ap_bram_46_we0,
    input ap_bram_46_en0,
    input [M_AXIS_BRAM_46_ADDR_WIDTH-1:0] ap_bram_46_addr1,
    input [M_AXIS_BRAM_46_WIDTH-1:0] ap_bram_46_din1,
    output [M_AXIS_BRAM_46_WIDTH-1:0] ap_bram_46_dout1,
    input [M_AXIS_BRAM_46_WIDTH/8-1:0]ap_bram_46_we1,
    input ap_bram_46_en1,
    //out AXI-Stream output interface 47
    input m_axis_bram_47_aclk,
    input m_axis_bram_47_aresetn,
    output m_axis_bram_47_tlast,
    output m_axis_bram_47_tvalid,
    output [M_AXIS_BRAM_47_DMWIDTH/8-1:0] m_axis_bram_47_tkeep,
    output [M_AXIS_BRAM_47_DMWIDTH/8-1:0] m_axis_bram_47_tstrb,
    output [M_AXIS_BRAM_47_DMWIDTH-1:0] m_axis_bram_47_tdata,
    input m_axis_bram_47_tready,
    input [M_AXIS_BRAM_47_ADDR_WIDTH-1:0] ap_bram_47_addr0,
    input [M_AXIS_BRAM_47_WIDTH-1:0] ap_bram_47_din0,
    output [M_AXIS_BRAM_47_WIDTH-1:0] ap_bram_47_dout0,
    input [M_AXIS_BRAM_47_WIDTH/8-1:0]ap_bram_47_we0,
    input ap_bram_47_en0,
    input [M_AXIS_BRAM_47_ADDR_WIDTH-1:0] ap_bram_47_addr1,
    input [M_AXIS_BRAM_47_WIDTH-1:0] ap_bram_47_din1,
    output [M_AXIS_BRAM_47_WIDTH-1:0] ap_bram_47_dout1,
    input [M_AXIS_BRAM_47_WIDTH/8-1:0]ap_bram_47_we1,
    input ap_bram_47_en1,
    //out AXI-Stream output interface 48
    input m_axis_bram_48_aclk,
    input m_axis_bram_48_aresetn,
    output m_axis_bram_48_tlast,
    output m_axis_bram_48_tvalid,
    output [M_AXIS_BRAM_48_DMWIDTH/8-1:0] m_axis_bram_48_tkeep,
    output [M_AXIS_BRAM_48_DMWIDTH/8-1:0] m_axis_bram_48_tstrb,
    output [M_AXIS_BRAM_48_DMWIDTH-1:0] m_axis_bram_48_tdata,
    input m_axis_bram_48_tready,
    input [M_AXIS_BRAM_48_ADDR_WIDTH-1:0] ap_bram_48_addr0,
    input [M_AXIS_BRAM_48_WIDTH-1:0] ap_bram_48_din0,
    output [M_AXIS_BRAM_48_WIDTH-1:0] ap_bram_48_dout0,
    input [M_AXIS_BRAM_48_WIDTH/8-1:0]ap_bram_48_we0,
    input ap_bram_48_en0,
    input [M_AXIS_BRAM_48_ADDR_WIDTH-1:0] ap_bram_48_addr1,
    input [M_AXIS_BRAM_48_WIDTH-1:0] ap_bram_48_din1,
    output [M_AXIS_BRAM_48_WIDTH-1:0] ap_bram_48_dout1,
    input [M_AXIS_BRAM_48_WIDTH/8-1:0]ap_bram_48_we1,
    input ap_bram_48_en1,
    //out AXI-Stream output interface 49
    input m_axis_bram_49_aclk,
    input m_axis_bram_49_aresetn,
    output m_axis_bram_49_tlast,
    output m_axis_bram_49_tvalid,
    output [M_AXIS_BRAM_49_DMWIDTH/8-1:0] m_axis_bram_49_tkeep,
    output [M_AXIS_BRAM_49_DMWIDTH/8-1:0] m_axis_bram_49_tstrb,
    output [M_AXIS_BRAM_49_DMWIDTH-1:0] m_axis_bram_49_tdata,
    input m_axis_bram_49_tready,
    input [M_AXIS_BRAM_49_ADDR_WIDTH-1:0] ap_bram_49_addr0,
    input [M_AXIS_BRAM_49_WIDTH-1:0] ap_bram_49_din0,
    output [M_AXIS_BRAM_49_WIDTH-1:0] ap_bram_49_dout0,
    input [M_AXIS_BRAM_49_WIDTH/8-1:0]ap_bram_49_we0,
    input ap_bram_49_en0,
    input [M_AXIS_BRAM_49_ADDR_WIDTH-1:0] ap_bram_49_addr1,
    input [M_AXIS_BRAM_49_WIDTH-1:0] ap_bram_49_din1,
    output [M_AXIS_BRAM_49_WIDTH-1:0] ap_bram_49_dout1,
    input [M_AXIS_BRAM_49_WIDTH/8-1:0]ap_bram_49_we1,
    input ap_bram_49_en1,
    //out AXI-Stream output interface 50
    input m_axis_bram_50_aclk,
    input m_axis_bram_50_aresetn,
    output m_axis_bram_50_tlast,
    output m_axis_bram_50_tvalid,
    output [M_AXIS_BRAM_50_DMWIDTH/8-1:0] m_axis_bram_50_tkeep,
    output [M_AXIS_BRAM_50_DMWIDTH/8-1:0] m_axis_bram_50_tstrb,
    output [M_AXIS_BRAM_50_DMWIDTH-1:0] m_axis_bram_50_tdata,
    input m_axis_bram_50_tready,
    input [M_AXIS_BRAM_50_ADDR_WIDTH-1:0] ap_bram_50_addr0,
    input [M_AXIS_BRAM_50_WIDTH-1:0] ap_bram_50_din0,
    output [M_AXIS_BRAM_50_WIDTH-1:0] ap_bram_50_dout0,
    input [M_AXIS_BRAM_50_WIDTH/8-1:0]ap_bram_50_we0,
    input ap_bram_50_en0,
    input [M_AXIS_BRAM_50_ADDR_WIDTH-1:0] ap_bram_50_addr1,
    input [M_AXIS_BRAM_50_WIDTH-1:0] ap_bram_50_din1,
    output [M_AXIS_BRAM_50_WIDTH-1:0] ap_bram_50_dout1,
    input [M_AXIS_BRAM_50_WIDTH/8-1:0]ap_bram_50_we1,
    input ap_bram_50_en1,
    //out AXI-Stream output interface 51
    input m_axis_bram_51_aclk,
    input m_axis_bram_51_aresetn,
    output m_axis_bram_51_tlast,
    output m_axis_bram_51_tvalid,
    output [M_AXIS_BRAM_51_DMWIDTH/8-1:0] m_axis_bram_51_tkeep,
    output [M_AXIS_BRAM_51_DMWIDTH/8-1:0] m_axis_bram_51_tstrb,
    output [M_AXIS_BRAM_51_DMWIDTH-1:0] m_axis_bram_51_tdata,
    input m_axis_bram_51_tready,
    input [M_AXIS_BRAM_51_ADDR_WIDTH-1:0] ap_bram_51_addr0,
    input [M_AXIS_BRAM_51_WIDTH-1:0] ap_bram_51_din0,
    output [M_AXIS_BRAM_51_WIDTH-1:0] ap_bram_51_dout0,
    input [M_AXIS_BRAM_51_WIDTH/8-1:0]ap_bram_51_we0,
    input ap_bram_51_en0,
    input [M_AXIS_BRAM_51_ADDR_WIDTH-1:0] ap_bram_51_addr1,
    input [M_AXIS_BRAM_51_WIDTH-1:0] ap_bram_51_din1,
    output [M_AXIS_BRAM_51_WIDTH-1:0] ap_bram_51_dout1,
    input [M_AXIS_BRAM_51_WIDTH/8-1:0]ap_bram_51_we1,
    input ap_bram_51_en1,
    //out AXI-Stream output interface 52
    input m_axis_bram_52_aclk,
    input m_axis_bram_52_aresetn,
    output m_axis_bram_52_tlast,
    output m_axis_bram_52_tvalid,
    output [M_AXIS_BRAM_52_DMWIDTH/8-1:0] m_axis_bram_52_tkeep,
    output [M_AXIS_BRAM_52_DMWIDTH/8-1:0] m_axis_bram_52_tstrb,
    output [M_AXIS_BRAM_52_DMWIDTH-1:0] m_axis_bram_52_tdata,
    input m_axis_bram_52_tready,
    input [M_AXIS_BRAM_52_ADDR_WIDTH-1:0] ap_bram_52_addr0,
    input [M_AXIS_BRAM_52_WIDTH-1:0] ap_bram_52_din0,
    output [M_AXIS_BRAM_52_WIDTH-1:0] ap_bram_52_dout0,
    input [M_AXIS_BRAM_52_WIDTH/8-1:0]ap_bram_52_we0,
    input ap_bram_52_en0,
    input [M_AXIS_BRAM_52_ADDR_WIDTH-1:0] ap_bram_52_addr1,
    input [M_AXIS_BRAM_52_WIDTH-1:0] ap_bram_52_din1,
    output [M_AXIS_BRAM_52_WIDTH-1:0] ap_bram_52_dout1,
    input [M_AXIS_BRAM_52_WIDTH/8-1:0]ap_bram_52_we1,
    input ap_bram_52_en1,
    //out AXI-Stream output interface 53
    input m_axis_bram_53_aclk,
    input m_axis_bram_53_aresetn,
    output m_axis_bram_53_tlast,
    output m_axis_bram_53_tvalid,
    output [M_AXIS_BRAM_53_DMWIDTH/8-1:0] m_axis_bram_53_tkeep,
    output [M_AXIS_BRAM_53_DMWIDTH/8-1:0] m_axis_bram_53_tstrb,
    output [M_AXIS_BRAM_53_DMWIDTH-1:0] m_axis_bram_53_tdata,
    input m_axis_bram_53_tready,
    input [M_AXIS_BRAM_53_ADDR_WIDTH-1:0] ap_bram_53_addr0,
    input [M_AXIS_BRAM_53_WIDTH-1:0] ap_bram_53_din0,
    output [M_AXIS_BRAM_53_WIDTH-1:0] ap_bram_53_dout0,
    input [M_AXIS_BRAM_53_WIDTH/8-1:0]ap_bram_53_we0,
    input ap_bram_53_en0,
    input [M_AXIS_BRAM_53_ADDR_WIDTH-1:0] ap_bram_53_addr1,
    input [M_AXIS_BRAM_53_WIDTH-1:0] ap_bram_53_din1,
    output [M_AXIS_BRAM_53_WIDTH-1:0] ap_bram_53_dout1,
    input [M_AXIS_BRAM_53_WIDTH/8-1:0]ap_bram_53_we1,
    input ap_bram_53_en1,
    //out AXI-Stream output interface 54
    input m_axis_bram_54_aclk,
    input m_axis_bram_54_aresetn,
    output m_axis_bram_54_tlast,
    output m_axis_bram_54_tvalid,
    output [M_AXIS_BRAM_54_DMWIDTH/8-1:0] m_axis_bram_54_tkeep,
    output [M_AXIS_BRAM_54_DMWIDTH/8-1:0] m_axis_bram_54_tstrb,
    output [M_AXIS_BRAM_54_DMWIDTH-1:0] m_axis_bram_54_tdata,
    input m_axis_bram_54_tready,
    input [M_AXIS_BRAM_54_ADDR_WIDTH-1:0] ap_bram_54_addr0,
    input [M_AXIS_BRAM_54_WIDTH-1:0] ap_bram_54_din0,
    output [M_AXIS_BRAM_54_WIDTH-1:0] ap_bram_54_dout0,
    input [M_AXIS_BRAM_54_WIDTH/8-1:0]ap_bram_54_we0,
    input ap_bram_54_en0,
    input [M_AXIS_BRAM_54_ADDR_WIDTH-1:0] ap_bram_54_addr1,
    input [M_AXIS_BRAM_54_WIDTH-1:0] ap_bram_54_din1,
    output [M_AXIS_BRAM_54_WIDTH-1:0] ap_bram_54_dout1,
    input [M_AXIS_BRAM_54_WIDTH/8-1:0]ap_bram_54_we1,
    input ap_bram_54_en1,
    //out AXI-Stream output interface 55
    input m_axis_bram_55_aclk,
    input m_axis_bram_55_aresetn,
    output m_axis_bram_55_tlast,
    output m_axis_bram_55_tvalid,
    output [M_AXIS_BRAM_55_DMWIDTH/8-1:0] m_axis_bram_55_tkeep,
    output [M_AXIS_BRAM_55_DMWIDTH/8-1:0] m_axis_bram_55_tstrb,
    output [M_AXIS_BRAM_55_DMWIDTH-1:0] m_axis_bram_55_tdata,
    input m_axis_bram_55_tready,
    input [M_AXIS_BRAM_55_ADDR_WIDTH-1:0] ap_bram_55_addr0,
    input [M_AXIS_BRAM_55_WIDTH-1:0] ap_bram_55_din0,
    output [M_AXIS_BRAM_55_WIDTH-1:0] ap_bram_55_dout0,
    input [M_AXIS_BRAM_55_WIDTH/8-1:0]ap_bram_55_we0,
    input ap_bram_55_en0,
    input [M_AXIS_BRAM_55_ADDR_WIDTH-1:0] ap_bram_55_addr1,
    input [M_AXIS_BRAM_55_WIDTH-1:0] ap_bram_55_din1,
    output [M_AXIS_BRAM_55_WIDTH-1:0] ap_bram_55_dout1,
    input [M_AXIS_BRAM_55_WIDTH/8-1:0]ap_bram_55_we1,
    input ap_bram_55_en1,
    //out AXI-Stream output interface 56
    input m_axis_bram_56_aclk,
    input m_axis_bram_56_aresetn,
    output m_axis_bram_56_tlast,
    output m_axis_bram_56_tvalid,
    output [M_AXIS_BRAM_56_DMWIDTH/8-1:0] m_axis_bram_56_tkeep,
    output [M_AXIS_BRAM_56_DMWIDTH/8-1:0] m_axis_bram_56_tstrb,
    output [M_AXIS_BRAM_56_DMWIDTH-1:0] m_axis_bram_56_tdata,
    input m_axis_bram_56_tready,
    input [M_AXIS_BRAM_56_ADDR_WIDTH-1:0] ap_bram_56_addr0,
    input [M_AXIS_BRAM_56_WIDTH-1:0] ap_bram_56_din0,
    output [M_AXIS_BRAM_56_WIDTH-1:0] ap_bram_56_dout0,
    input [M_AXIS_BRAM_56_WIDTH/8-1:0]ap_bram_56_we0,
    input ap_bram_56_en0,
    input [M_AXIS_BRAM_56_ADDR_WIDTH-1:0] ap_bram_56_addr1,
    input [M_AXIS_BRAM_56_WIDTH-1:0] ap_bram_56_din1,
    output [M_AXIS_BRAM_56_WIDTH-1:0] ap_bram_56_dout1,
    input [M_AXIS_BRAM_56_WIDTH/8-1:0]ap_bram_56_we1,
    input ap_bram_56_en1,
    //out AXI-Stream output interface 57
    input m_axis_bram_57_aclk,
    input m_axis_bram_57_aresetn,
    output m_axis_bram_57_tlast,
    output m_axis_bram_57_tvalid,
    output [M_AXIS_BRAM_57_DMWIDTH/8-1:0] m_axis_bram_57_tkeep,
    output [M_AXIS_BRAM_57_DMWIDTH/8-1:0] m_axis_bram_57_tstrb,
    output [M_AXIS_BRAM_57_DMWIDTH-1:0] m_axis_bram_57_tdata,
    input m_axis_bram_57_tready,
    input [M_AXIS_BRAM_57_ADDR_WIDTH-1:0] ap_bram_57_addr0,
    input [M_AXIS_BRAM_57_WIDTH-1:0] ap_bram_57_din0,
    output [M_AXIS_BRAM_57_WIDTH-1:0] ap_bram_57_dout0,
    input [M_AXIS_BRAM_57_WIDTH/8-1:0]ap_bram_57_we0,
    input ap_bram_57_en0,
    input [M_AXIS_BRAM_57_ADDR_WIDTH-1:0] ap_bram_57_addr1,
    input [M_AXIS_BRAM_57_WIDTH-1:0] ap_bram_57_din1,
    output [M_AXIS_BRAM_57_WIDTH-1:0] ap_bram_57_dout1,
    input [M_AXIS_BRAM_57_WIDTH/8-1:0]ap_bram_57_we1,
    input ap_bram_57_en1,
    //out AXI-Stream output interface 58
    input m_axis_bram_58_aclk,
    input m_axis_bram_58_aresetn,
    output m_axis_bram_58_tlast,
    output m_axis_bram_58_tvalid,
    output [M_AXIS_BRAM_58_DMWIDTH/8-1:0] m_axis_bram_58_tkeep,
    output [M_AXIS_BRAM_58_DMWIDTH/8-1:0] m_axis_bram_58_tstrb,
    output [M_AXIS_BRAM_58_DMWIDTH-1:0] m_axis_bram_58_tdata,
    input m_axis_bram_58_tready,
    input [M_AXIS_BRAM_58_ADDR_WIDTH-1:0] ap_bram_58_addr0,
    input [M_AXIS_BRAM_58_WIDTH-1:0] ap_bram_58_din0,
    output [M_AXIS_BRAM_58_WIDTH-1:0] ap_bram_58_dout0,
    input [M_AXIS_BRAM_58_WIDTH/8-1:0]ap_bram_58_we0,
    input ap_bram_58_en0,
    input [M_AXIS_BRAM_58_ADDR_WIDTH-1:0] ap_bram_58_addr1,
    input [M_AXIS_BRAM_58_WIDTH-1:0] ap_bram_58_din1,
    output [M_AXIS_BRAM_58_WIDTH-1:0] ap_bram_58_dout1,
    input [M_AXIS_BRAM_58_WIDTH/8-1:0]ap_bram_58_we1,
    input ap_bram_58_en1,
    //out AXI-Stream output interface 59
    input m_axis_bram_59_aclk,
    input m_axis_bram_59_aresetn,
    output m_axis_bram_59_tlast,
    output m_axis_bram_59_tvalid,
    output [M_AXIS_BRAM_59_DMWIDTH/8-1:0] m_axis_bram_59_tkeep,
    output [M_AXIS_BRAM_59_DMWIDTH/8-1:0] m_axis_bram_59_tstrb,
    output [M_AXIS_BRAM_59_DMWIDTH-1:0] m_axis_bram_59_tdata,
    input m_axis_bram_59_tready,
    input [M_AXIS_BRAM_59_ADDR_WIDTH-1:0] ap_bram_59_addr0,
    input [M_AXIS_BRAM_59_WIDTH-1:0] ap_bram_59_din0,
    output [M_AXIS_BRAM_59_WIDTH-1:0] ap_bram_59_dout0,
    input [M_AXIS_BRAM_59_WIDTH/8-1:0]ap_bram_59_we0,
    input ap_bram_59_en0,
    input [M_AXIS_BRAM_59_ADDR_WIDTH-1:0] ap_bram_59_addr1,
    input [M_AXIS_BRAM_59_WIDTH-1:0] ap_bram_59_din1,
    output [M_AXIS_BRAM_59_WIDTH-1:0] ap_bram_59_dout1,
    input [M_AXIS_BRAM_59_WIDTH/8-1:0]ap_bram_59_we1,
    input ap_bram_59_en1,
    //out AXI-Stream output interface 60
    input m_axis_bram_60_aclk,
    input m_axis_bram_60_aresetn,
    output m_axis_bram_60_tlast,
    output m_axis_bram_60_tvalid,
    output [M_AXIS_BRAM_60_DMWIDTH/8-1:0] m_axis_bram_60_tkeep,
    output [M_AXIS_BRAM_60_DMWIDTH/8-1:0] m_axis_bram_60_tstrb,
    output [M_AXIS_BRAM_60_DMWIDTH-1:0] m_axis_bram_60_tdata,
    input m_axis_bram_60_tready,
    input [M_AXIS_BRAM_60_ADDR_WIDTH-1:0] ap_bram_60_addr0,
    input [M_AXIS_BRAM_60_WIDTH-1:0] ap_bram_60_din0,
    output [M_AXIS_BRAM_60_WIDTH-1:0] ap_bram_60_dout0,
    input [M_AXIS_BRAM_60_WIDTH/8-1:0]ap_bram_60_we0,
    input ap_bram_60_en0,
    input [M_AXIS_BRAM_60_ADDR_WIDTH-1:0] ap_bram_60_addr1,
    input [M_AXIS_BRAM_60_WIDTH-1:0] ap_bram_60_din1,
    output [M_AXIS_BRAM_60_WIDTH-1:0] ap_bram_60_dout1,
    input [M_AXIS_BRAM_60_WIDTH/8-1:0]ap_bram_60_we1,
    input ap_bram_60_en1,
    //out AXI-Stream output interface 61
    input m_axis_bram_61_aclk,
    input m_axis_bram_61_aresetn,
    output m_axis_bram_61_tlast,
    output m_axis_bram_61_tvalid,
    output [M_AXIS_BRAM_61_DMWIDTH/8-1:0] m_axis_bram_61_tkeep,
    output [M_AXIS_BRAM_61_DMWIDTH/8-1:0] m_axis_bram_61_tstrb,
    output [M_AXIS_BRAM_61_DMWIDTH-1:0] m_axis_bram_61_tdata,
    input m_axis_bram_61_tready,
    input [M_AXIS_BRAM_61_ADDR_WIDTH-1:0] ap_bram_61_addr0,
    input [M_AXIS_BRAM_61_WIDTH-1:0] ap_bram_61_din0,
    output [M_AXIS_BRAM_61_WIDTH-1:0] ap_bram_61_dout0,
    input [M_AXIS_BRAM_61_WIDTH/8-1:0]ap_bram_61_we0,
    input ap_bram_61_en0,
    input [M_AXIS_BRAM_61_ADDR_WIDTH-1:0] ap_bram_61_addr1,
    input [M_AXIS_BRAM_61_WIDTH-1:0] ap_bram_61_din1,
    output [M_AXIS_BRAM_61_WIDTH-1:0] ap_bram_61_dout1,
    input [M_AXIS_BRAM_61_WIDTH/8-1:0]ap_bram_61_we1,
    input ap_bram_61_en1,
    //out AXI-Stream output interface 62
    input m_axis_bram_62_aclk,
    input m_axis_bram_62_aresetn,
    output m_axis_bram_62_tlast,
    output m_axis_bram_62_tvalid,
    output [M_AXIS_BRAM_62_DMWIDTH/8-1:0] m_axis_bram_62_tkeep,
    output [M_AXIS_BRAM_62_DMWIDTH/8-1:0] m_axis_bram_62_tstrb,
    output [M_AXIS_BRAM_62_DMWIDTH-1:0] m_axis_bram_62_tdata,
    input m_axis_bram_62_tready,
    input [M_AXIS_BRAM_62_ADDR_WIDTH-1:0] ap_bram_62_addr0,
    input [M_AXIS_BRAM_62_WIDTH-1:0] ap_bram_62_din0,
    output [M_AXIS_BRAM_62_WIDTH-1:0] ap_bram_62_dout0,
    input [M_AXIS_BRAM_62_WIDTH/8-1:0]ap_bram_62_we0,
    input ap_bram_62_en0,
    input [M_AXIS_BRAM_62_ADDR_WIDTH-1:0] ap_bram_62_addr1,
    input [M_AXIS_BRAM_62_WIDTH-1:0] ap_bram_62_din1,
    output [M_AXIS_BRAM_62_WIDTH-1:0] ap_bram_62_dout1,
    input [M_AXIS_BRAM_62_WIDTH/8-1:0]ap_bram_62_we1,
    input ap_bram_62_en1,
    //out AXI-Stream output interface 63
    input m_axis_bram_63_aclk,
    input m_axis_bram_63_aresetn,
    output m_axis_bram_63_tlast,
    output m_axis_bram_63_tvalid,
    output [M_AXIS_BRAM_63_DMWIDTH/8-1:0] m_axis_bram_63_tkeep,
    output [M_AXIS_BRAM_63_DMWIDTH/8-1:0] m_axis_bram_63_tstrb,
    output [M_AXIS_BRAM_63_DMWIDTH-1:0] m_axis_bram_63_tdata,
    input m_axis_bram_63_tready,
    input [M_AXIS_BRAM_63_ADDR_WIDTH-1:0] ap_bram_63_addr0,
    input [M_AXIS_BRAM_63_WIDTH-1:0] ap_bram_63_din0,
    output [M_AXIS_BRAM_63_WIDTH-1:0] ap_bram_63_dout0,
    input [M_AXIS_BRAM_63_WIDTH/8-1:0]ap_bram_63_we0,
    input ap_bram_63_en0,
    input [M_AXIS_BRAM_63_ADDR_WIDTH-1:0] ap_bram_63_addr1,
    input [M_AXIS_BRAM_63_WIDTH-1:0] ap_bram_63_din1,
    output [M_AXIS_BRAM_63_WIDTH-1:0] ap_bram_63_dout1,
    input [M_AXIS_BRAM_63_WIDTH/8-1:0]ap_bram_63_we1,
    input ap_bram_63_en1,
    //out AXI-Stream output interface 64
    input m_axis_bram_64_aclk,
    input m_axis_bram_64_aresetn,
    output m_axis_bram_64_tlast,
    output m_axis_bram_64_tvalid,
    output [M_AXIS_BRAM_64_DMWIDTH/8-1:0] m_axis_bram_64_tkeep,
    output [M_AXIS_BRAM_64_DMWIDTH/8-1:0] m_axis_bram_64_tstrb,
    output [M_AXIS_BRAM_64_DMWIDTH-1:0] m_axis_bram_64_tdata,
    input m_axis_bram_64_tready,
    input [M_AXIS_BRAM_64_ADDR_WIDTH-1:0] ap_bram_64_addr0,
    input [M_AXIS_BRAM_64_WIDTH-1:0] ap_bram_64_din0,
    output [M_AXIS_BRAM_64_WIDTH-1:0] ap_bram_64_dout0,
    input [M_AXIS_BRAM_64_WIDTH/8-1:0]ap_bram_64_we0,
    input ap_bram_64_en0,
    input [M_AXIS_BRAM_64_ADDR_WIDTH-1:0] ap_bram_64_addr1,
    input [M_AXIS_BRAM_64_WIDTH-1:0] ap_bram_64_din1,
    output [M_AXIS_BRAM_64_WIDTH-1:0] ap_bram_64_dout1,
    input [M_AXIS_BRAM_64_WIDTH/8-1:0]ap_bram_64_we1,
    input ap_bram_64_en1,
    //out AXI-Stream output interface 65
    input m_axis_bram_65_aclk,
    input m_axis_bram_65_aresetn,
    output m_axis_bram_65_tlast,
    output m_axis_bram_65_tvalid,
    output [M_AXIS_BRAM_65_DMWIDTH/8-1:0] m_axis_bram_65_tkeep,
    output [M_AXIS_BRAM_65_DMWIDTH/8-1:0] m_axis_bram_65_tstrb,
    output [M_AXIS_BRAM_65_DMWIDTH-1:0] m_axis_bram_65_tdata,
    input m_axis_bram_65_tready,
    input [M_AXIS_BRAM_65_ADDR_WIDTH-1:0] ap_bram_65_addr0,
    input [M_AXIS_BRAM_65_WIDTH-1:0] ap_bram_65_din0,
    output [M_AXIS_BRAM_65_WIDTH-1:0] ap_bram_65_dout0,
    input [M_AXIS_BRAM_65_WIDTH/8-1:0]ap_bram_65_we0,
    input ap_bram_65_en0,
    input [M_AXIS_BRAM_65_ADDR_WIDTH-1:0] ap_bram_65_addr1,
    input [M_AXIS_BRAM_65_WIDTH-1:0] ap_bram_65_din1,
    output [M_AXIS_BRAM_65_WIDTH-1:0] ap_bram_65_dout1,
    input [M_AXIS_BRAM_65_WIDTH/8-1:0]ap_bram_65_we1,
    input ap_bram_65_en1,
    //out AXI-Stream output interface 66
    input m_axis_bram_66_aclk,
    input m_axis_bram_66_aresetn,
    output m_axis_bram_66_tlast,
    output m_axis_bram_66_tvalid,
    output [M_AXIS_BRAM_66_DMWIDTH/8-1:0] m_axis_bram_66_tkeep,
    output [M_AXIS_BRAM_66_DMWIDTH/8-1:0] m_axis_bram_66_tstrb,
    output [M_AXIS_BRAM_66_DMWIDTH-1:0] m_axis_bram_66_tdata,
    input m_axis_bram_66_tready,
    input [M_AXIS_BRAM_66_ADDR_WIDTH-1:0] ap_bram_66_addr0,
    input [M_AXIS_BRAM_66_WIDTH-1:0] ap_bram_66_din0,
    output [M_AXIS_BRAM_66_WIDTH-1:0] ap_bram_66_dout0,
    input [M_AXIS_BRAM_66_WIDTH/8-1:0]ap_bram_66_we0,
    input ap_bram_66_en0,
    input [M_AXIS_BRAM_66_ADDR_WIDTH-1:0] ap_bram_66_addr1,
    input [M_AXIS_BRAM_66_WIDTH-1:0] ap_bram_66_din1,
    output [M_AXIS_BRAM_66_WIDTH-1:0] ap_bram_66_dout1,
    input [M_AXIS_BRAM_66_WIDTH/8-1:0]ap_bram_66_we1,
    input ap_bram_66_en1,
    //out AXI-Stream output interface 67
    input m_axis_bram_67_aclk,
    input m_axis_bram_67_aresetn,
    output m_axis_bram_67_tlast,
    output m_axis_bram_67_tvalid,
    output [M_AXIS_BRAM_67_DMWIDTH/8-1:0] m_axis_bram_67_tkeep,
    output [M_AXIS_BRAM_67_DMWIDTH/8-1:0] m_axis_bram_67_tstrb,
    output [M_AXIS_BRAM_67_DMWIDTH-1:0] m_axis_bram_67_tdata,
    input m_axis_bram_67_tready,
    input [M_AXIS_BRAM_67_ADDR_WIDTH-1:0] ap_bram_67_addr0,
    input [M_AXIS_BRAM_67_WIDTH-1:0] ap_bram_67_din0,
    output [M_AXIS_BRAM_67_WIDTH-1:0] ap_bram_67_dout0,
    input [M_AXIS_BRAM_67_WIDTH/8-1:0]ap_bram_67_we0,
    input ap_bram_67_en0,
    input [M_AXIS_BRAM_67_ADDR_WIDTH-1:0] ap_bram_67_addr1,
    input [M_AXIS_BRAM_67_WIDTH-1:0] ap_bram_67_din1,
    output [M_AXIS_BRAM_67_WIDTH-1:0] ap_bram_67_dout1,
    input [M_AXIS_BRAM_67_WIDTH/8-1:0]ap_bram_67_we1,
    input ap_bram_67_en1,
    //out AXI-Stream output interface 68
    input m_axis_bram_68_aclk,
    input m_axis_bram_68_aresetn,
    output m_axis_bram_68_tlast,
    output m_axis_bram_68_tvalid,
    output [M_AXIS_BRAM_68_DMWIDTH/8-1:0] m_axis_bram_68_tkeep,
    output [M_AXIS_BRAM_68_DMWIDTH/8-1:0] m_axis_bram_68_tstrb,
    output [M_AXIS_BRAM_68_DMWIDTH-1:0] m_axis_bram_68_tdata,
    input m_axis_bram_68_tready,
    input [M_AXIS_BRAM_68_ADDR_WIDTH-1:0] ap_bram_68_addr0,
    input [M_AXIS_BRAM_68_WIDTH-1:0] ap_bram_68_din0,
    output [M_AXIS_BRAM_68_WIDTH-1:0] ap_bram_68_dout0,
    input [M_AXIS_BRAM_68_WIDTH/8-1:0]ap_bram_68_we0,
    input ap_bram_68_en0,
    input [M_AXIS_BRAM_68_ADDR_WIDTH-1:0] ap_bram_68_addr1,
    input [M_AXIS_BRAM_68_WIDTH-1:0] ap_bram_68_din1,
    output [M_AXIS_BRAM_68_WIDTH-1:0] ap_bram_68_dout1,
    input [M_AXIS_BRAM_68_WIDTH/8-1:0]ap_bram_68_we1,
    input ap_bram_68_en1,
    //out AXI-Stream output interface 69
    input m_axis_bram_69_aclk,
    input m_axis_bram_69_aresetn,
    output m_axis_bram_69_tlast,
    output m_axis_bram_69_tvalid,
    output [M_AXIS_BRAM_69_DMWIDTH/8-1:0] m_axis_bram_69_tkeep,
    output [M_AXIS_BRAM_69_DMWIDTH/8-1:0] m_axis_bram_69_tstrb,
    output [M_AXIS_BRAM_69_DMWIDTH-1:0] m_axis_bram_69_tdata,
    input m_axis_bram_69_tready,
    input [M_AXIS_BRAM_69_ADDR_WIDTH-1:0] ap_bram_69_addr0,
    input [M_AXIS_BRAM_69_WIDTH-1:0] ap_bram_69_din0,
    output [M_AXIS_BRAM_69_WIDTH-1:0] ap_bram_69_dout0,
    input [M_AXIS_BRAM_69_WIDTH/8-1:0]ap_bram_69_we0,
    input ap_bram_69_en0,
    input [M_AXIS_BRAM_69_ADDR_WIDTH-1:0] ap_bram_69_addr1,
    input [M_AXIS_BRAM_69_WIDTH-1:0] ap_bram_69_din1,
    output [M_AXIS_BRAM_69_WIDTH-1:0] ap_bram_69_dout1,
    input [M_AXIS_BRAM_69_WIDTH/8-1:0]ap_bram_69_we1,
    input ap_bram_69_en1,
    //out AXI-Stream output interface 70
    input m_axis_bram_70_aclk,
    input m_axis_bram_70_aresetn,
    output m_axis_bram_70_tlast,
    output m_axis_bram_70_tvalid,
    output [M_AXIS_BRAM_70_DMWIDTH/8-1:0] m_axis_bram_70_tkeep,
    output [M_AXIS_BRAM_70_DMWIDTH/8-1:0] m_axis_bram_70_tstrb,
    output [M_AXIS_BRAM_70_DMWIDTH-1:0] m_axis_bram_70_tdata,
    input m_axis_bram_70_tready,
    input [M_AXIS_BRAM_70_ADDR_WIDTH-1:0] ap_bram_70_addr0,
    input [M_AXIS_BRAM_70_WIDTH-1:0] ap_bram_70_din0,
    output [M_AXIS_BRAM_70_WIDTH-1:0] ap_bram_70_dout0,
    input [M_AXIS_BRAM_70_WIDTH/8-1:0]ap_bram_70_we0,
    input ap_bram_70_en0,
    input [M_AXIS_BRAM_70_ADDR_WIDTH-1:0] ap_bram_70_addr1,
    input [M_AXIS_BRAM_70_WIDTH-1:0] ap_bram_70_din1,
    output [M_AXIS_BRAM_70_WIDTH-1:0] ap_bram_70_dout1,
    input [M_AXIS_BRAM_70_WIDTH/8-1:0]ap_bram_70_we1,
    input ap_bram_70_en1,
    //out AXI-Stream output interface 71
    input m_axis_bram_71_aclk,
    input m_axis_bram_71_aresetn,
    output m_axis_bram_71_tlast,
    output m_axis_bram_71_tvalid,
    output [M_AXIS_BRAM_71_DMWIDTH/8-1:0] m_axis_bram_71_tkeep,
    output [M_AXIS_BRAM_71_DMWIDTH/8-1:0] m_axis_bram_71_tstrb,
    output [M_AXIS_BRAM_71_DMWIDTH-1:0] m_axis_bram_71_tdata,
    input m_axis_bram_71_tready,
    input [M_AXIS_BRAM_71_ADDR_WIDTH-1:0] ap_bram_71_addr0,
    input [M_AXIS_BRAM_71_WIDTH-1:0] ap_bram_71_din0,
    output [M_AXIS_BRAM_71_WIDTH-1:0] ap_bram_71_dout0,
    input [M_AXIS_BRAM_71_WIDTH/8-1:0]ap_bram_71_we0,
    input ap_bram_71_en0,
    input [M_AXIS_BRAM_71_ADDR_WIDTH-1:0] ap_bram_71_addr1,
    input [M_AXIS_BRAM_71_WIDTH-1:0] ap_bram_71_din1,
    output [M_AXIS_BRAM_71_WIDTH-1:0] ap_bram_71_dout1,
    input [M_AXIS_BRAM_71_WIDTH/8-1:0]ap_bram_71_we1,
    input ap_bram_71_en1,
    //out AXI-Stream output interface 72
    input m_axis_bram_72_aclk,
    input m_axis_bram_72_aresetn,
    output m_axis_bram_72_tlast,
    output m_axis_bram_72_tvalid,
    output [M_AXIS_BRAM_72_DMWIDTH/8-1:0] m_axis_bram_72_tkeep,
    output [M_AXIS_BRAM_72_DMWIDTH/8-1:0] m_axis_bram_72_tstrb,
    output [M_AXIS_BRAM_72_DMWIDTH-1:0] m_axis_bram_72_tdata,
    input m_axis_bram_72_tready,
    input [M_AXIS_BRAM_72_ADDR_WIDTH-1:0] ap_bram_72_addr0,
    input [M_AXIS_BRAM_72_WIDTH-1:0] ap_bram_72_din0,
    output [M_AXIS_BRAM_72_WIDTH-1:0] ap_bram_72_dout0,
    input [M_AXIS_BRAM_72_WIDTH/8-1:0]ap_bram_72_we0,
    input ap_bram_72_en0,
    input [M_AXIS_BRAM_72_ADDR_WIDTH-1:0] ap_bram_72_addr1,
    input [M_AXIS_BRAM_72_WIDTH-1:0] ap_bram_72_din1,
    output [M_AXIS_BRAM_72_WIDTH-1:0] ap_bram_72_dout1,
    input [M_AXIS_BRAM_72_WIDTH/8-1:0]ap_bram_72_we1,
    input ap_bram_72_en1,
    //out AXI-Stream output interface 73
    input m_axis_bram_73_aclk,
    input m_axis_bram_73_aresetn,
    output m_axis_bram_73_tlast,
    output m_axis_bram_73_tvalid,
    output [M_AXIS_BRAM_73_DMWIDTH/8-1:0] m_axis_bram_73_tkeep,
    output [M_AXIS_BRAM_73_DMWIDTH/8-1:0] m_axis_bram_73_tstrb,
    output [M_AXIS_BRAM_73_DMWIDTH-1:0] m_axis_bram_73_tdata,
    input m_axis_bram_73_tready,
    input [M_AXIS_BRAM_73_ADDR_WIDTH-1:0] ap_bram_73_addr0,
    input [M_AXIS_BRAM_73_WIDTH-1:0] ap_bram_73_din0,
    output [M_AXIS_BRAM_73_WIDTH-1:0] ap_bram_73_dout0,
    input [M_AXIS_BRAM_73_WIDTH/8-1:0]ap_bram_73_we0,
    input ap_bram_73_en0,
    input [M_AXIS_BRAM_73_ADDR_WIDTH-1:0] ap_bram_73_addr1,
    input [M_AXIS_BRAM_73_WIDTH-1:0] ap_bram_73_din1,
    output [M_AXIS_BRAM_73_WIDTH-1:0] ap_bram_73_dout1,
    input [M_AXIS_BRAM_73_WIDTH/8-1:0]ap_bram_73_we1,
    input ap_bram_73_en1,
    //out AXI-Stream output interface 74
    input m_axis_bram_74_aclk,
    input m_axis_bram_74_aresetn,
    output m_axis_bram_74_tlast,
    output m_axis_bram_74_tvalid,
    output [M_AXIS_BRAM_74_DMWIDTH/8-1:0] m_axis_bram_74_tkeep,
    output [M_AXIS_BRAM_74_DMWIDTH/8-1:0] m_axis_bram_74_tstrb,
    output [M_AXIS_BRAM_74_DMWIDTH-1:0] m_axis_bram_74_tdata,
    input m_axis_bram_74_tready,
    input [M_AXIS_BRAM_74_ADDR_WIDTH-1:0] ap_bram_74_addr0,
    input [M_AXIS_BRAM_74_WIDTH-1:0] ap_bram_74_din0,
    output [M_AXIS_BRAM_74_WIDTH-1:0] ap_bram_74_dout0,
    input [M_AXIS_BRAM_74_WIDTH/8-1:0]ap_bram_74_we0,
    input ap_bram_74_en0,
    input [M_AXIS_BRAM_74_ADDR_WIDTH-1:0] ap_bram_74_addr1,
    input [M_AXIS_BRAM_74_WIDTH-1:0] ap_bram_74_din1,
    output [M_AXIS_BRAM_74_WIDTH-1:0] ap_bram_74_dout1,
    input [M_AXIS_BRAM_74_WIDTH/8-1:0]ap_bram_74_we1,
    input ap_bram_74_en1,
    //out AXI-Stream output interface 75
    input m_axis_bram_75_aclk,
    input m_axis_bram_75_aresetn,
    output m_axis_bram_75_tlast,
    output m_axis_bram_75_tvalid,
    output [M_AXIS_BRAM_75_DMWIDTH/8-1:0] m_axis_bram_75_tkeep,
    output [M_AXIS_BRAM_75_DMWIDTH/8-1:0] m_axis_bram_75_tstrb,
    output [M_AXIS_BRAM_75_DMWIDTH-1:0] m_axis_bram_75_tdata,
    input m_axis_bram_75_tready,
    input [M_AXIS_BRAM_75_ADDR_WIDTH-1:0] ap_bram_75_addr0,
    input [M_AXIS_BRAM_75_WIDTH-1:0] ap_bram_75_din0,
    output [M_AXIS_BRAM_75_WIDTH-1:0] ap_bram_75_dout0,
    input [M_AXIS_BRAM_75_WIDTH/8-1:0]ap_bram_75_we0,
    input ap_bram_75_en0,
    input [M_AXIS_BRAM_75_ADDR_WIDTH-1:0] ap_bram_75_addr1,
    input [M_AXIS_BRAM_75_WIDTH-1:0] ap_bram_75_din1,
    output [M_AXIS_BRAM_75_WIDTH-1:0] ap_bram_75_dout1,
    input [M_AXIS_BRAM_75_WIDTH/8-1:0]ap_bram_75_we1,
    input ap_bram_75_en1,
    //out AXI-Stream output interface 76
    input m_axis_bram_76_aclk,
    input m_axis_bram_76_aresetn,
    output m_axis_bram_76_tlast,
    output m_axis_bram_76_tvalid,
    output [M_AXIS_BRAM_76_DMWIDTH/8-1:0] m_axis_bram_76_tkeep,
    output [M_AXIS_BRAM_76_DMWIDTH/8-1:0] m_axis_bram_76_tstrb,
    output [M_AXIS_BRAM_76_DMWIDTH-1:0] m_axis_bram_76_tdata,
    input m_axis_bram_76_tready,
    input [M_AXIS_BRAM_76_ADDR_WIDTH-1:0] ap_bram_76_addr0,
    input [M_AXIS_BRAM_76_WIDTH-1:0] ap_bram_76_din0,
    output [M_AXIS_BRAM_76_WIDTH-1:0] ap_bram_76_dout0,
    input [M_AXIS_BRAM_76_WIDTH/8-1:0]ap_bram_76_we0,
    input ap_bram_76_en0,
    input [M_AXIS_BRAM_76_ADDR_WIDTH-1:0] ap_bram_76_addr1,
    input [M_AXIS_BRAM_76_WIDTH-1:0] ap_bram_76_din1,
    output [M_AXIS_BRAM_76_WIDTH-1:0] ap_bram_76_dout1,
    input [M_AXIS_BRAM_76_WIDTH/8-1:0]ap_bram_76_we1,
    input ap_bram_76_en1,
    //out AXI-Stream output interface 77
    input m_axis_bram_77_aclk,
    input m_axis_bram_77_aresetn,
    output m_axis_bram_77_tlast,
    output m_axis_bram_77_tvalid,
    output [M_AXIS_BRAM_77_DMWIDTH/8-1:0] m_axis_bram_77_tkeep,
    output [M_AXIS_BRAM_77_DMWIDTH/8-1:0] m_axis_bram_77_tstrb,
    output [M_AXIS_BRAM_77_DMWIDTH-1:0] m_axis_bram_77_tdata,
    input m_axis_bram_77_tready,
    input [M_AXIS_BRAM_77_ADDR_WIDTH-1:0] ap_bram_77_addr0,
    input [M_AXIS_BRAM_77_WIDTH-1:0] ap_bram_77_din0,
    output [M_AXIS_BRAM_77_WIDTH-1:0] ap_bram_77_dout0,
    input [M_AXIS_BRAM_77_WIDTH/8-1:0]ap_bram_77_we0,
    input ap_bram_77_en0,
    input [M_AXIS_BRAM_77_ADDR_WIDTH-1:0] ap_bram_77_addr1,
    input [M_AXIS_BRAM_77_WIDTH-1:0] ap_bram_77_din1,
    output [M_AXIS_BRAM_77_WIDTH-1:0] ap_bram_77_dout1,
    input [M_AXIS_BRAM_77_WIDTH/8-1:0]ap_bram_77_we1,
    input ap_bram_77_en1,
    //out AXI-Stream output interface 78
    input m_axis_bram_78_aclk,
    input m_axis_bram_78_aresetn,
    output m_axis_bram_78_tlast,
    output m_axis_bram_78_tvalid,
    output [M_AXIS_BRAM_78_DMWIDTH/8-1:0] m_axis_bram_78_tkeep,
    output [M_AXIS_BRAM_78_DMWIDTH/8-1:0] m_axis_bram_78_tstrb,
    output [M_AXIS_BRAM_78_DMWIDTH-1:0] m_axis_bram_78_tdata,
    input m_axis_bram_78_tready,
    input [M_AXIS_BRAM_78_ADDR_WIDTH-1:0] ap_bram_78_addr0,
    input [M_AXIS_BRAM_78_WIDTH-1:0] ap_bram_78_din0,
    output [M_AXIS_BRAM_78_WIDTH-1:0] ap_bram_78_dout0,
    input [M_AXIS_BRAM_78_WIDTH/8-1:0]ap_bram_78_we0,
    input ap_bram_78_en0,
    input [M_AXIS_BRAM_78_ADDR_WIDTH-1:0] ap_bram_78_addr1,
    input [M_AXIS_BRAM_78_WIDTH-1:0] ap_bram_78_din1,
    output [M_AXIS_BRAM_78_WIDTH-1:0] ap_bram_78_dout1,
    input [M_AXIS_BRAM_78_WIDTH/8-1:0]ap_bram_78_we1,
    input ap_bram_78_en1,
    //out AXI-Stream output interface 79
    input m_axis_bram_79_aclk,
    input m_axis_bram_79_aresetn,
    output m_axis_bram_79_tlast,
    output m_axis_bram_79_tvalid,
    output [M_AXIS_BRAM_79_DMWIDTH/8-1:0] m_axis_bram_79_tkeep,
    output [M_AXIS_BRAM_79_DMWIDTH/8-1:0] m_axis_bram_79_tstrb,
    output [M_AXIS_BRAM_79_DMWIDTH-1:0] m_axis_bram_79_tdata,
    input m_axis_bram_79_tready,
    input [M_AXIS_BRAM_79_ADDR_WIDTH-1:0] ap_bram_79_addr0,
    input [M_AXIS_BRAM_79_WIDTH-1:0] ap_bram_79_din0,
    output [M_AXIS_BRAM_79_WIDTH-1:0] ap_bram_79_dout0,
    input [M_AXIS_BRAM_79_WIDTH/8-1:0]ap_bram_79_we0,
    input ap_bram_79_en0,
    input [M_AXIS_BRAM_79_ADDR_WIDTH-1:0] ap_bram_79_addr1,
    input [M_AXIS_BRAM_79_WIDTH-1:0] ap_bram_79_din1,
    output [M_AXIS_BRAM_79_WIDTH-1:0] ap_bram_79_dout1,
    input [M_AXIS_BRAM_79_WIDTH/8-1:0]ap_bram_79_we1,
    input ap_bram_79_en1,
    //out AXI-Stream output interface 80
    input m_axis_bram_80_aclk,
    input m_axis_bram_80_aresetn,
    output m_axis_bram_80_tlast,
    output m_axis_bram_80_tvalid,
    output [M_AXIS_BRAM_80_DMWIDTH/8-1:0] m_axis_bram_80_tkeep,
    output [M_AXIS_BRAM_80_DMWIDTH/8-1:0] m_axis_bram_80_tstrb,
    output [M_AXIS_BRAM_80_DMWIDTH-1:0] m_axis_bram_80_tdata,
    input m_axis_bram_80_tready,
    input [M_AXIS_BRAM_80_ADDR_WIDTH-1:0] ap_bram_80_addr0,
    input [M_AXIS_BRAM_80_WIDTH-1:0] ap_bram_80_din0,
    output [M_AXIS_BRAM_80_WIDTH-1:0] ap_bram_80_dout0,
    input [M_AXIS_BRAM_80_WIDTH/8-1:0]ap_bram_80_we0,
    input ap_bram_80_en0,
    input [M_AXIS_BRAM_80_ADDR_WIDTH-1:0] ap_bram_80_addr1,
    input [M_AXIS_BRAM_80_WIDTH-1:0] ap_bram_80_din1,
    output [M_AXIS_BRAM_80_WIDTH-1:0] ap_bram_80_dout1,
    input [M_AXIS_BRAM_80_WIDTH/8-1:0]ap_bram_80_we1,
    input ap_bram_80_en1,
    //out AXI-Stream output interface 81
    input m_axis_bram_81_aclk,
    input m_axis_bram_81_aresetn,
    output m_axis_bram_81_tlast,
    output m_axis_bram_81_tvalid,
    output [M_AXIS_BRAM_81_DMWIDTH/8-1:0] m_axis_bram_81_tkeep,
    output [M_AXIS_BRAM_81_DMWIDTH/8-1:0] m_axis_bram_81_tstrb,
    output [M_AXIS_BRAM_81_DMWIDTH-1:0] m_axis_bram_81_tdata,
    input m_axis_bram_81_tready,
    input [M_AXIS_BRAM_81_ADDR_WIDTH-1:0] ap_bram_81_addr0,
    input [M_AXIS_BRAM_81_WIDTH-1:0] ap_bram_81_din0,
    output [M_AXIS_BRAM_81_WIDTH-1:0] ap_bram_81_dout0,
    input [M_AXIS_BRAM_81_WIDTH/8-1:0]ap_bram_81_we0,
    input ap_bram_81_en0,
    input [M_AXIS_BRAM_81_ADDR_WIDTH-1:0] ap_bram_81_addr1,
    input [M_AXIS_BRAM_81_WIDTH-1:0] ap_bram_81_din1,
    output [M_AXIS_BRAM_81_WIDTH-1:0] ap_bram_81_dout1,
    input [M_AXIS_BRAM_81_WIDTH/8-1:0]ap_bram_81_we1,
    input ap_bram_81_en1,
    //out AXI-Stream output interface 82
    input m_axis_bram_82_aclk,
    input m_axis_bram_82_aresetn,
    output m_axis_bram_82_tlast,
    output m_axis_bram_82_tvalid,
    output [M_AXIS_BRAM_82_DMWIDTH/8-1:0] m_axis_bram_82_tkeep,
    output [M_AXIS_BRAM_82_DMWIDTH/8-1:0] m_axis_bram_82_tstrb,
    output [M_AXIS_BRAM_82_DMWIDTH-1:0] m_axis_bram_82_tdata,
    input m_axis_bram_82_tready,
    input [M_AXIS_BRAM_82_ADDR_WIDTH-1:0] ap_bram_82_addr0,
    input [M_AXIS_BRAM_82_WIDTH-1:0] ap_bram_82_din0,
    output [M_AXIS_BRAM_82_WIDTH-1:0] ap_bram_82_dout0,
    input [M_AXIS_BRAM_82_WIDTH/8-1:0]ap_bram_82_we0,
    input ap_bram_82_en0,
    input [M_AXIS_BRAM_82_ADDR_WIDTH-1:0] ap_bram_82_addr1,
    input [M_AXIS_BRAM_82_WIDTH-1:0] ap_bram_82_din1,
    output [M_AXIS_BRAM_82_WIDTH-1:0] ap_bram_82_dout1,
    input [M_AXIS_BRAM_82_WIDTH/8-1:0]ap_bram_82_we1,
    input ap_bram_82_en1,
    //out AXI-Stream output interface 83
    input m_axis_bram_83_aclk,
    input m_axis_bram_83_aresetn,
    output m_axis_bram_83_tlast,
    output m_axis_bram_83_tvalid,
    output [M_AXIS_BRAM_83_DMWIDTH/8-1:0] m_axis_bram_83_tkeep,
    output [M_AXIS_BRAM_83_DMWIDTH/8-1:0] m_axis_bram_83_tstrb,
    output [M_AXIS_BRAM_83_DMWIDTH-1:0] m_axis_bram_83_tdata,
    input m_axis_bram_83_tready,
    input [M_AXIS_BRAM_83_ADDR_WIDTH-1:0] ap_bram_83_addr0,
    input [M_AXIS_BRAM_83_WIDTH-1:0] ap_bram_83_din0,
    output [M_AXIS_BRAM_83_WIDTH-1:0] ap_bram_83_dout0,
    input [M_AXIS_BRAM_83_WIDTH/8-1:0]ap_bram_83_we0,
    input ap_bram_83_en0,
    input [M_AXIS_BRAM_83_ADDR_WIDTH-1:0] ap_bram_83_addr1,
    input [M_AXIS_BRAM_83_WIDTH-1:0] ap_bram_83_din1,
    output [M_AXIS_BRAM_83_WIDTH-1:0] ap_bram_83_dout1,
    input [M_AXIS_BRAM_83_WIDTH/8-1:0]ap_bram_83_we1,
    input ap_bram_83_en1,
    //out AXI-Stream output interface 84
    input m_axis_bram_84_aclk,
    input m_axis_bram_84_aresetn,
    output m_axis_bram_84_tlast,
    output m_axis_bram_84_tvalid,
    output [M_AXIS_BRAM_84_DMWIDTH/8-1:0] m_axis_bram_84_tkeep,
    output [M_AXIS_BRAM_84_DMWIDTH/8-1:0] m_axis_bram_84_tstrb,
    output [M_AXIS_BRAM_84_DMWIDTH-1:0] m_axis_bram_84_tdata,
    input m_axis_bram_84_tready,
    input [M_AXIS_BRAM_84_ADDR_WIDTH-1:0] ap_bram_84_addr0,
    input [M_AXIS_BRAM_84_WIDTH-1:0] ap_bram_84_din0,
    output [M_AXIS_BRAM_84_WIDTH-1:0] ap_bram_84_dout0,
    input [M_AXIS_BRAM_84_WIDTH/8-1:0]ap_bram_84_we0,
    input ap_bram_84_en0,
    input [M_AXIS_BRAM_84_ADDR_WIDTH-1:0] ap_bram_84_addr1,
    input [M_AXIS_BRAM_84_WIDTH-1:0] ap_bram_84_din1,
    output [M_AXIS_BRAM_84_WIDTH-1:0] ap_bram_84_dout1,
    input [M_AXIS_BRAM_84_WIDTH/8-1:0]ap_bram_84_we1,
    input ap_bram_84_en1,
    //out AXI-Stream output interface 85
    input m_axis_bram_85_aclk,
    input m_axis_bram_85_aresetn,
    output m_axis_bram_85_tlast,
    output m_axis_bram_85_tvalid,
    output [M_AXIS_BRAM_85_DMWIDTH/8-1:0] m_axis_bram_85_tkeep,
    output [M_AXIS_BRAM_85_DMWIDTH/8-1:0] m_axis_bram_85_tstrb,
    output [M_AXIS_BRAM_85_DMWIDTH-1:0] m_axis_bram_85_tdata,
    input m_axis_bram_85_tready,
    input [M_AXIS_BRAM_85_ADDR_WIDTH-1:0] ap_bram_85_addr0,
    input [M_AXIS_BRAM_85_WIDTH-1:0] ap_bram_85_din0,
    output [M_AXIS_BRAM_85_WIDTH-1:0] ap_bram_85_dout0,
    input [M_AXIS_BRAM_85_WIDTH/8-1:0]ap_bram_85_we0,
    input ap_bram_85_en0,
    input [M_AXIS_BRAM_85_ADDR_WIDTH-1:0] ap_bram_85_addr1,
    input [M_AXIS_BRAM_85_WIDTH-1:0] ap_bram_85_din1,
    output [M_AXIS_BRAM_85_WIDTH-1:0] ap_bram_85_dout1,
    input [M_AXIS_BRAM_85_WIDTH/8-1:0]ap_bram_85_we1,
    input ap_bram_85_en1,
    //out AXI-Stream output interface 86
    input m_axis_bram_86_aclk,
    input m_axis_bram_86_aresetn,
    output m_axis_bram_86_tlast,
    output m_axis_bram_86_tvalid,
    output [M_AXIS_BRAM_86_DMWIDTH/8-1:0] m_axis_bram_86_tkeep,
    output [M_AXIS_BRAM_86_DMWIDTH/8-1:0] m_axis_bram_86_tstrb,
    output [M_AXIS_BRAM_86_DMWIDTH-1:0] m_axis_bram_86_tdata,
    input m_axis_bram_86_tready,
    input [M_AXIS_BRAM_86_ADDR_WIDTH-1:0] ap_bram_86_addr0,
    input [M_AXIS_BRAM_86_WIDTH-1:0] ap_bram_86_din0,
    output [M_AXIS_BRAM_86_WIDTH-1:0] ap_bram_86_dout0,
    input [M_AXIS_BRAM_86_WIDTH/8-1:0]ap_bram_86_we0,
    input ap_bram_86_en0,
    input [M_AXIS_BRAM_86_ADDR_WIDTH-1:0] ap_bram_86_addr1,
    input [M_AXIS_BRAM_86_WIDTH-1:0] ap_bram_86_din1,
    output [M_AXIS_BRAM_86_WIDTH-1:0] ap_bram_86_dout1,
    input [M_AXIS_BRAM_86_WIDTH/8-1:0]ap_bram_86_we1,
    input ap_bram_86_en1,
    //out AXI-Stream output interface 87
    input m_axis_bram_87_aclk,
    input m_axis_bram_87_aresetn,
    output m_axis_bram_87_tlast,
    output m_axis_bram_87_tvalid,
    output [M_AXIS_BRAM_87_DMWIDTH/8-1:0] m_axis_bram_87_tkeep,
    output [M_AXIS_BRAM_87_DMWIDTH/8-1:0] m_axis_bram_87_tstrb,
    output [M_AXIS_BRAM_87_DMWIDTH-1:0] m_axis_bram_87_tdata,
    input m_axis_bram_87_tready,
    input [M_AXIS_BRAM_87_ADDR_WIDTH-1:0] ap_bram_87_addr0,
    input [M_AXIS_BRAM_87_WIDTH-1:0] ap_bram_87_din0,
    output [M_AXIS_BRAM_87_WIDTH-1:0] ap_bram_87_dout0,
    input [M_AXIS_BRAM_87_WIDTH/8-1:0]ap_bram_87_we0,
    input ap_bram_87_en0,
    input [M_AXIS_BRAM_87_ADDR_WIDTH-1:0] ap_bram_87_addr1,
    input [M_AXIS_BRAM_87_WIDTH-1:0] ap_bram_87_din1,
    output [M_AXIS_BRAM_87_WIDTH-1:0] ap_bram_87_dout1,
    input [M_AXIS_BRAM_87_WIDTH/8-1:0]ap_bram_87_we1,
    input ap_bram_87_en1,
    //out AXI-Stream output interface 88
    input m_axis_bram_88_aclk,
    input m_axis_bram_88_aresetn,
    output m_axis_bram_88_tlast,
    output m_axis_bram_88_tvalid,
    output [M_AXIS_BRAM_88_DMWIDTH/8-1:0] m_axis_bram_88_tkeep,
    output [M_AXIS_BRAM_88_DMWIDTH/8-1:0] m_axis_bram_88_tstrb,
    output [M_AXIS_BRAM_88_DMWIDTH-1:0] m_axis_bram_88_tdata,
    input m_axis_bram_88_tready,
    input [M_AXIS_BRAM_88_ADDR_WIDTH-1:0] ap_bram_88_addr0,
    input [M_AXIS_BRAM_88_WIDTH-1:0] ap_bram_88_din0,
    output [M_AXIS_BRAM_88_WIDTH-1:0] ap_bram_88_dout0,
    input [M_AXIS_BRAM_88_WIDTH/8-1:0]ap_bram_88_we0,
    input ap_bram_88_en0,
    input [M_AXIS_BRAM_88_ADDR_WIDTH-1:0] ap_bram_88_addr1,
    input [M_AXIS_BRAM_88_WIDTH-1:0] ap_bram_88_din1,
    output [M_AXIS_BRAM_88_WIDTH-1:0] ap_bram_88_dout1,
    input [M_AXIS_BRAM_88_WIDTH/8-1:0]ap_bram_88_we1,
    input ap_bram_88_en1,
    //out AXI-Stream output interface 89
    input m_axis_bram_89_aclk,
    input m_axis_bram_89_aresetn,
    output m_axis_bram_89_tlast,
    output m_axis_bram_89_tvalid,
    output [M_AXIS_BRAM_89_DMWIDTH/8-1:0] m_axis_bram_89_tkeep,
    output [M_AXIS_BRAM_89_DMWIDTH/8-1:0] m_axis_bram_89_tstrb,
    output [M_AXIS_BRAM_89_DMWIDTH-1:0] m_axis_bram_89_tdata,
    input m_axis_bram_89_tready,
    input [M_AXIS_BRAM_89_ADDR_WIDTH-1:0] ap_bram_89_addr0,
    input [M_AXIS_BRAM_89_WIDTH-1:0] ap_bram_89_din0,
    output [M_AXIS_BRAM_89_WIDTH-1:0] ap_bram_89_dout0,
    input [M_AXIS_BRAM_89_WIDTH/8-1:0]ap_bram_89_we0,
    input ap_bram_89_en0,
    input [M_AXIS_BRAM_89_ADDR_WIDTH-1:0] ap_bram_89_addr1,
    input [M_AXIS_BRAM_89_WIDTH-1:0] ap_bram_89_din1,
    output [M_AXIS_BRAM_89_WIDTH-1:0] ap_bram_89_dout1,
    input [M_AXIS_BRAM_89_WIDTH/8-1:0]ap_bram_89_we1,
    input ap_bram_89_en1,
    //out AXI-Stream output interface 90
    input m_axis_bram_90_aclk,
    input m_axis_bram_90_aresetn,
    output m_axis_bram_90_tlast,
    output m_axis_bram_90_tvalid,
    output [M_AXIS_BRAM_90_DMWIDTH/8-1:0] m_axis_bram_90_tkeep,
    output [M_AXIS_BRAM_90_DMWIDTH/8-1:0] m_axis_bram_90_tstrb,
    output [M_AXIS_BRAM_90_DMWIDTH-1:0] m_axis_bram_90_tdata,
    input m_axis_bram_90_tready,
    input [M_AXIS_BRAM_90_ADDR_WIDTH-1:0] ap_bram_90_addr0,
    input [M_AXIS_BRAM_90_WIDTH-1:0] ap_bram_90_din0,
    output [M_AXIS_BRAM_90_WIDTH-1:0] ap_bram_90_dout0,
    input [M_AXIS_BRAM_90_WIDTH/8-1:0]ap_bram_90_we0,
    input ap_bram_90_en0,
    input [M_AXIS_BRAM_90_ADDR_WIDTH-1:0] ap_bram_90_addr1,
    input [M_AXIS_BRAM_90_WIDTH-1:0] ap_bram_90_din1,
    output [M_AXIS_BRAM_90_WIDTH-1:0] ap_bram_90_dout1,
    input [M_AXIS_BRAM_90_WIDTH/8-1:0]ap_bram_90_we1,
    input ap_bram_90_en1,
    //out AXI-Stream output interface 91
    input m_axis_bram_91_aclk,
    input m_axis_bram_91_aresetn,
    output m_axis_bram_91_tlast,
    output m_axis_bram_91_tvalid,
    output [M_AXIS_BRAM_91_DMWIDTH/8-1:0] m_axis_bram_91_tkeep,
    output [M_AXIS_BRAM_91_DMWIDTH/8-1:0] m_axis_bram_91_tstrb,
    output [M_AXIS_BRAM_91_DMWIDTH-1:0] m_axis_bram_91_tdata,
    input m_axis_bram_91_tready,
    input [M_AXIS_BRAM_91_ADDR_WIDTH-1:0] ap_bram_91_addr0,
    input [M_AXIS_BRAM_91_WIDTH-1:0] ap_bram_91_din0,
    output [M_AXIS_BRAM_91_WIDTH-1:0] ap_bram_91_dout0,
    input [M_AXIS_BRAM_91_WIDTH/8-1:0]ap_bram_91_we0,
    input ap_bram_91_en0,
    input [M_AXIS_BRAM_91_ADDR_WIDTH-1:0] ap_bram_91_addr1,
    input [M_AXIS_BRAM_91_WIDTH-1:0] ap_bram_91_din1,
    output [M_AXIS_BRAM_91_WIDTH-1:0] ap_bram_91_dout1,
    input [M_AXIS_BRAM_91_WIDTH/8-1:0]ap_bram_91_we1,
    input ap_bram_91_en1,
    //out AXI-Stream output interface 92
    input m_axis_bram_92_aclk,
    input m_axis_bram_92_aresetn,
    output m_axis_bram_92_tlast,
    output m_axis_bram_92_tvalid,
    output [M_AXIS_BRAM_92_DMWIDTH/8-1:0] m_axis_bram_92_tkeep,
    output [M_AXIS_BRAM_92_DMWIDTH/8-1:0] m_axis_bram_92_tstrb,
    output [M_AXIS_BRAM_92_DMWIDTH-1:0] m_axis_bram_92_tdata,
    input m_axis_bram_92_tready,
    input [M_AXIS_BRAM_92_ADDR_WIDTH-1:0] ap_bram_92_addr0,
    input [M_AXIS_BRAM_92_WIDTH-1:0] ap_bram_92_din0,
    output [M_AXIS_BRAM_92_WIDTH-1:0] ap_bram_92_dout0,
    input [M_AXIS_BRAM_92_WIDTH/8-1:0]ap_bram_92_we0,
    input ap_bram_92_en0,
    input [M_AXIS_BRAM_92_ADDR_WIDTH-1:0] ap_bram_92_addr1,
    input [M_AXIS_BRAM_92_WIDTH-1:0] ap_bram_92_din1,
    output [M_AXIS_BRAM_92_WIDTH-1:0] ap_bram_92_dout1,
    input [M_AXIS_BRAM_92_WIDTH/8-1:0]ap_bram_92_we1,
    input ap_bram_92_en1,
    //out AXI-Stream output interface 93
    input m_axis_bram_93_aclk,
    input m_axis_bram_93_aresetn,
    output m_axis_bram_93_tlast,
    output m_axis_bram_93_tvalid,
    output [M_AXIS_BRAM_93_DMWIDTH/8-1:0] m_axis_bram_93_tkeep,
    output [M_AXIS_BRAM_93_DMWIDTH/8-1:0] m_axis_bram_93_tstrb,
    output [M_AXIS_BRAM_93_DMWIDTH-1:0] m_axis_bram_93_tdata,
    input m_axis_bram_93_tready,
    input [M_AXIS_BRAM_93_ADDR_WIDTH-1:0] ap_bram_93_addr0,
    input [M_AXIS_BRAM_93_WIDTH-1:0] ap_bram_93_din0,
    output [M_AXIS_BRAM_93_WIDTH-1:0] ap_bram_93_dout0,
    input [M_AXIS_BRAM_93_WIDTH/8-1:0]ap_bram_93_we0,
    input ap_bram_93_en0,
    input [M_AXIS_BRAM_93_ADDR_WIDTH-1:0] ap_bram_93_addr1,
    input [M_AXIS_BRAM_93_WIDTH-1:0] ap_bram_93_din1,
    output [M_AXIS_BRAM_93_WIDTH-1:0] ap_bram_93_dout1,
    input [M_AXIS_BRAM_93_WIDTH/8-1:0]ap_bram_93_we1,
    input ap_bram_93_en1,
    //out AXI-Stream output interface 94
    input m_axis_bram_94_aclk,
    input m_axis_bram_94_aresetn,
    output m_axis_bram_94_tlast,
    output m_axis_bram_94_tvalid,
    output [M_AXIS_BRAM_94_DMWIDTH/8-1:0] m_axis_bram_94_tkeep,
    output [M_AXIS_BRAM_94_DMWIDTH/8-1:0] m_axis_bram_94_tstrb,
    output [M_AXIS_BRAM_94_DMWIDTH-1:0] m_axis_bram_94_tdata,
    input m_axis_bram_94_tready,
    input [M_AXIS_BRAM_94_ADDR_WIDTH-1:0] ap_bram_94_addr0,
    input [M_AXIS_BRAM_94_WIDTH-1:0] ap_bram_94_din0,
    output [M_AXIS_BRAM_94_WIDTH-1:0] ap_bram_94_dout0,
    input [M_AXIS_BRAM_94_WIDTH/8-1:0]ap_bram_94_we0,
    input ap_bram_94_en0,
    input [M_AXIS_BRAM_94_ADDR_WIDTH-1:0] ap_bram_94_addr1,
    input [M_AXIS_BRAM_94_WIDTH-1:0] ap_bram_94_din1,
    output [M_AXIS_BRAM_94_WIDTH-1:0] ap_bram_94_dout1,
    input [M_AXIS_BRAM_94_WIDTH/8-1:0]ap_bram_94_we1,
    input ap_bram_94_en1,
    //out AXI-Stream output interface 95
    input m_axis_bram_95_aclk,
    input m_axis_bram_95_aresetn,
    output m_axis_bram_95_tlast,
    output m_axis_bram_95_tvalid,
    output [M_AXIS_BRAM_95_DMWIDTH/8-1:0] m_axis_bram_95_tkeep,
    output [M_AXIS_BRAM_95_DMWIDTH/8-1:0] m_axis_bram_95_tstrb,
    output [M_AXIS_BRAM_95_DMWIDTH-1:0] m_axis_bram_95_tdata,
    input m_axis_bram_95_tready,
    input [M_AXIS_BRAM_95_ADDR_WIDTH-1:0] ap_bram_95_addr0,
    input [M_AXIS_BRAM_95_WIDTH-1:0] ap_bram_95_din0,
    output [M_AXIS_BRAM_95_WIDTH-1:0] ap_bram_95_dout0,
    input [M_AXIS_BRAM_95_WIDTH/8-1:0]ap_bram_95_we0,
    input ap_bram_95_en0,
    input [M_AXIS_BRAM_95_ADDR_WIDTH-1:0] ap_bram_95_addr1,
    input [M_AXIS_BRAM_95_WIDTH-1:0] ap_bram_95_din1,
    output [M_AXIS_BRAM_95_WIDTH-1:0] ap_bram_95_dout1,
    input [M_AXIS_BRAM_95_WIDTH/8-1:0]ap_bram_95_we1,
    input ap_bram_95_en1,
    //out AXI-Stream output interface 96
    input m_axis_bram_96_aclk,
    input m_axis_bram_96_aresetn,
    output m_axis_bram_96_tlast,
    output m_axis_bram_96_tvalid,
    output [M_AXIS_BRAM_96_DMWIDTH/8-1:0] m_axis_bram_96_tkeep,
    output [M_AXIS_BRAM_96_DMWIDTH/8-1:0] m_axis_bram_96_tstrb,
    output [M_AXIS_BRAM_96_DMWIDTH-1:0] m_axis_bram_96_tdata,
    input m_axis_bram_96_tready,
    input [M_AXIS_BRAM_96_ADDR_WIDTH-1:0] ap_bram_96_addr0,
    input [M_AXIS_BRAM_96_WIDTH-1:0] ap_bram_96_din0,
    output [M_AXIS_BRAM_96_WIDTH-1:0] ap_bram_96_dout0,
    input [M_AXIS_BRAM_96_WIDTH/8-1:0]ap_bram_96_we0,
    input ap_bram_96_en0,
    input [M_AXIS_BRAM_96_ADDR_WIDTH-1:0] ap_bram_96_addr1,
    input [M_AXIS_BRAM_96_WIDTH-1:0] ap_bram_96_din1,
    output [M_AXIS_BRAM_96_WIDTH-1:0] ap_bram_96_dout1,
    input [M_AXIS_BRAM_96_WIDTH/8-1:0]ap_bram_96_we1,
    input ap_bram_96_en1,
    //out AXI-Stream output interface 97
    input m_axis_bram_97_aclk,
    input m_axis_bram_97_aresetn,
    output m_axis_bram_97_tlast,
    output m_axis_bram_97_tvalid,
    output [M_AXIS_BRAM_97_DMWIDTH/8-1:0] m_axis_bram_97_tkeep,
    output [M_AXIS_BRAM_97_DMWIDTH/8-1:0] m_axis_bram_97_tstrb,
    output [M_AXIS_BRAM_97_DMWIDTH-1:0] m_axis_bram_97_tdata,
    input m_axis_bram_97_tready,
    input [M_AXIS_BRAM_97_ADDR_WIDTH-1:0] ap_bram_97_addr0,
    input [M_AXIS_BRAM_97_WIDTH-1:0] ap_bram_97_din0,
    output [M_AXIS_BRAM_97_WIDTH-1:0] ap_bram_97_dout0,
    input [M_AXIS_BRAM_97_WIDTH/8-1:0]ap_bram_97_we0,
    input ap_bram_97_en0,
    input [M_AXIS_BRAM_97_ADDR_WIDTH-1:0] ap_bram_97_addr1,
    input [M_AXIS_BRAM_97_WIDTH-1:0] ap_bram_97_din1,
    output [M_AXIS_BRAM_97_WIDTH-1:0] ap_bram_97_dout1,
    input [M_AXIS_BRAM_97_WIDTH/8-1:0]ap_bram_97_we1,
    input ap_bram_97_en1,
    //out AXI-Stream output interface 98
    input m_axis_bram_98_aclk,
    input m_axis_bram_98_aresetn,
    output m_axis_bram_98_tlast,
    output m_axis_bram_98_tvalid,
    output [M_AXIS_BRAM_98_DMWIDTH/8-1:0] m_axis_bram_98_tkeep,
    output [M_AXIS_BRAM_98_DMWIDTH/8-1:0] m_axis_bram_98_tstrb,
    output [M_AXIS_BRAM_98_DMWIDTH-1:0] m_axis_bram_98_tdata,
    input m_axis_bram_98_tready,
    input [M_AXIS_BRAM_98_ADDR_WIDTH-1:0] ap_bram_98_addr0,
    input [M_AXIS_BRAM_98_WIDTH-1:0] ap_bram_98_din0,
    output [M_AXIS_BRAM_98_WIDTH-1:0] ap_bram_98_dout0,
    input [M_AXIS_BRAM_98_WIDTH/8-1:0]ap_bram_98_we0,
    input ap_bram_98_en0,
    input [M_AXIS_BRAM_98_ADDR_WIDTH-1:0] ap_bram_98_addr1,
    input [M_AXIS_BRAM_98_WIDTH-1:0] ap_bram_98_din1,
    output [M_AXIS_BRAM_98_WIDTH-1:0] ap_bram_98_dout1,
    input [M_AXIS_BRAM_98_WIDTH/8-1:0]ap_bram_98_we1,
    input ap_bram_98_en1,
    //out AXI-Stream output interface 99
    input m_axis_bram_99_aclk,
    input m_axis_bram_99_aresetn,
    output m_axis_bram_99_tlast,
    output m_axis_bram_99_tvalid,
    output [M_AXIS_BRAM_99_DMWIDTH/8-1:0] m_axis_bram_99_tkeep,
    output [M_AXIS_BRAM_99_DMWIDTH/8-1:0] m_axis_bram_99_tstrb,
    output [M_AXIS_BRAM_99_DMWIDTH-1:0] m_axis_bram_99_tdata,
    input m_axis_bram_99_tready,
    input [M_AXIS_BRAM_99_ADDR_WIDTH-1:0] ap_bram_99_addr0,
    input [M_AXIS_BRAM_99_WIDTH-1:0] ap_bram_99_din0,
    output [M_AXIS_BRAM_99_WIDTH-1:0] ap_bram_99_dout0,
    input [M_AXIS_BRAM_99_WIDTH/8-1:0]ap_bram_99_we0,
    input ap_bram_99_en0,
    input [M_AXIS_BRAM_99_ADDR_WIDTH-1:0] ap_bram_99_addr1,
    input [M_AXIS_BRAM_99_WIDTH-1:0] ap_bram_99_din1,
    output [M_AXIS_BRAM_99_WIDTH-1:0] ap_bram_99_dout1,
    input [M_AXIS_BRAM_99_WIDTH/8-1:0]ap_bram_99_we1,
    input ap_bram_99_en1,
    //out AXI-Stream output interface 100
    input m_axis_bram_100_aclk,
    input m_axis_bram_100_aresetn,
    output m_axis_bram_100_tlast,
    output m_axis_bram_100_tvalid,
    output [M_AXIS_BRAM_100_DMWIDTH/8-1:0] m_axis_bram_100_tkeep,
    output [M_AXIS_BRAM_100_DMWIDTH/8-1:0] m_axis_bram_100_tstrb,
    output [M_AXIS_BRAM_100_DMWIDTH-1:0] m_axis_bram_100_tdata,
    input m_axis_bram_100_tready,
    input [M_AXIS_BRAM_100_ADDR_WIDTH-1:0] ap_bram_100_addr0,
    input [M_AXIS_BRAM_100_WIDTH-1:0] ap_bram_100_din0,
    output [M_AXIS_BRAM_100_WIDTH-1:0] ap_bram_100_dout0,
    input [M_AXIS_BRAM_100_WIDTH/8-1:0]ap_bram_100_we0,
    input ap_bram_100_en0,
    input [M_AXIS_BRAM_100_ADDR_WIDTH-1:0] ap_bram_100_addr1,
    input [M_AXIS_BRAM_100_WIDTH-1:0] ap_bram_100_din1,
    output [M_AXIS_BRAM_100_WIDTH-1:0] ap_bram_100_dout1,
    input [M_AXIS_BRAM_100_WIDTH/8-1:0]ap_bram_100_we1,
    input ap_bram_100_en1,
    //out AXI-Stream output interface 101
    input m_axis_bram_101_aclk,
    input m_axis_bram_101_aresetn,
    output m_axis_bram_101_tlast,
    output m_axis_bram_101_tvalid,
    output [M_AXIS_BRAM_101_DMWIDTH/8-1:0] m_axis_bram_101_tkeep,
    output [M_AXIS_BRAM_101_DMWIDTH/8-1:0] m_axis_bram_101_tstrb,
    output [M_AXIS_BRAM_101_DMWIDTH-1:0] m_axis_bram_101_tdata,
    input m_axis_bram_101_tready,
    input [M_AXIS_BRAM_101_ADDR_WIDTH-1:0] ap_bram_101_addr0,
    input [M_AXIS_BRAM_101_WIDTH-1:0] ap_bram_101_din0,
    output [M_AXIS_BRAM_101_WIDTH-1:0] ap_bram_101_dout0,
    input [M_AXIS_BRAM_101_WIDTH/8-1:0]ap_bram_101_we0,
    input ap_bram_101_en0,
    input [M_AXIS_BRAM_101_ADDR_WIDTH-1:0] ap_bram_101_addr1,
    input [M_AXIS_BRAM_101_WIDTH-1:0] ap_bram_101_din1,
    output [M_AXIS_BRAM_101_WIDTH-1:0] ap_bram_101_dout1,
    input [M_AXIS_BRAM_101_WIDTH/8-1:0]ap_bram_101_we1,
    input ap_bram_101_en1,
    //out AXI-Stream output interface 102
    input m_axis_bram_102_aclk,
    input m_axis_bram_102_aresetn,
    output m_axis_bram_102_tlast,
    output m_axis_bram_102_tvalid,
    output [M_AXIS_BRAM_102_DMWIDTH/8-1:0] m_axis_bram_102_tkeep,
    output [M_AXIS_BRAM_102_DMWIDTH/8-1:0] m_axis_bram_102_tstrb,
    output [M_AXIS_BRAM_102_DMWIDTH-1:0] m_axis_bram_102_tdata,
    input m_axis_bram_102_tready,
    input [M_AXIS_BRAM_102_ADDR_WIDTH-1:0] ap_bram_102_addr0,
    input [M_AXIS_BRAM_102_WIDTH-1:0] ap_bram_102_din0,
    output [M_AXIS_BRAM_102_WIDTH-1:0] ap_bram_102_dout0,
    input [M_AXIS_BRAM_102_WIDTH/8-1:0]ap_bram_102_we0,
    input ap_bram_102_en0,
    input [M_AXIS_BRAM_102_ADDR_WIDTH-1:0] ap_bram_102_addr1,
    input [M_AXIS_BRAM_102_WIDTH-1:0] ap_bram_102_din1,
    output [M_AXIS_BRAM_102_WIDTH-1:0] ap_bram_102_dout1,
    input [M_AXIS_BRAM_102_WIDTH/8-1:0]ap_bram_102_we1,
    input ap_bram_102_en1,
    //out AXI-Stream output interface 103
    input m_axis_bram_103_aclk,
    input m_axis_bram_103_aresetn,
    output m_axis_bram_103_tlast,
    output m_axis_bram_103_tvalid,
    output [M_AXIS_BRAM_103_DMWIDTH/8-1:0] m_axis_bram_103_tkeep,
    output [M_AXIS_BRAM_103_DMWIDTH/8-1:0] m_axis_bram_103_tstrb,
    output [M_AXIS_BRAM_103_DMWIDTH-1:0] m_axis_bram_103_tdata,
    input m_axis_bram_103_tready,
    input [M_AXIS_BRAM_103_ADDR_WIDTH-1:0] ap_bram_103_addr0,
    input [M_AXIS_BRAM_103_WIDTH-1:0] ap_bram_103_din0,
    output [M_AXIS_BRAM_103_WIDTH-1:0] ap_bram_103_dout0,
    input [M_AXIS_BRAM_103_WIDTH/8-1:0]ap_bram_103_we0,
    input ap_bram_103_en0,
    input [M_AXIS_BRAM_103_ADDR_WIDTH-1:0] ap_bram_103_addr1,
    input [M_AXIS_BRAM_103_WIDTH-1:0] ap_bram_103_din1,
    output [M_AXIS_BRAM_103_WIDTH-1:0] ap_bram_103_dout1,
    input [M_AXIS_BRAM_103_WIDTH/8-1:0]ap_bram_103_we1,
    input ap_bram_103_en1,
    //out AXI-Stream output interface 104
    input m_axis_bram_104_aclk,
    input m_axis_bram_104_aresetn,
    output m_axis_bram_104_tlast,
    output m_axis_bram_104_tvalid,
    output [M_AXIS_BRAM_104_DMWIDTH/8-1:0] m_axis_bram_104_tkeep,
    output [M_AXIS_BRAM_104_DMWIDTH/8-1:0] m_axis_bram_104_tstrb,
    output [M_AXIS_BRAM_104_DMWIDTH-1:0] m_axis_bram_104_tdata,
    input m_axis_bram_104_tready,
    input [M_AXIS_BRAM_104_ADDR_WIDTH-1:0] ap_bram_104_addr0,
    input [M_AXIS_BRAM_104_WIDTH-1:0] ap_bram_104_din0,
    output [M_AXIS_BRAM_104_WIDTH-1:0] ap_bram_104_dout0,
    input [M_AXIS_BRAM_104_WIDTH/8-1:0]ap_bram_104_we0,
    input ap_bram_104_en0,
    input [M_AXIS_BRAM_104_ADDR_WIDTH-1:0] ap_bram_104_addr1,
    input [M_AXIS_BRAM_104_WIDTH-1:0] ap_bram_104_din1,
    output [M_AXIS_BRAM_104_WIDTH-1:0] ap_bram_104_dout1,
    input [M_AXIS_BRAM_104_WIDTH/8-1:0]ap_bram_104_we1,
    input ap_bram_104_en1,
    //out AXI-Stream output interface 105
    input m_axis_bram_105_aclk,
    input m_axis_bram_105_aresetn,
    output m_axis_bram_105_tlast,
    output m_axis_bram_105_tvalid,
    output [M_AXIS_BRAM_105_DMWIDTH/8-1:0] m_axis_bram_105_tkeep,
    output [M_AXIS_BRAM_105_DMWIDTH/8-1:0] m_axis_bram_105_tstrb,
    output [M_AXIS_BRAM_105_DMWIDTH-1:0] m_axis_bram_105_tdata,
    input m_axis_bram_105_tready,
    input [M_AXIS_BRAM_105_ADDR_WIDTH-1:0] ap_bram_105_addr0,
    input [M_AXIS_BRAM_105_WIDTH-1:0] ap_bram_105_din0,
    output [M_AXIS_BRAM_105_WIDTH-1:0] ap_bram_105_dout0,
    input [M_AXIS_BRAM_105_WIDTH/8-1:0]ap_bram_105_we0,
    input ap_bram_105_en0,
    input [M_AXIS_BRAM_105_ADDR_WIDTH-1:0] ap_bram_105_addr1,
    input [M_AXIS_BRAM_105_WIDTH-1:0] ap_bram_105_din1,
    output [M_AXIS_BRAM_105_WIDTH-1:0] ap_bram_105_dout1,
    input [M_AXIS_BRAM_105_WIDTH/8-1:0]ap_bram_105_we1,
    input ap_bram_105_en1,
    //out AXI-Stream output interface 106
    input m_axis_bram_106_aclk,
    input m_axis_bram_106_aresetn,
    output m_axis_bram_106_tlast,
    output m_axis_bram_106_tvalid,
    output [M_AXIS_BRAM_106_DMWIDTH/8-1:0] m_axis_bram_106_tkeep,
    output [M_AXIS_BRAM_106_DMWIDTH/8-1:0] m_axis_bram_106_tstrb,
    output [M_AXIS_BRAM_106_DMWIDTH-1:0] m_axis_bram_106_tdata,
    input m_axis_bram_106_tready,
    input [M_AXIS_BRAM_106_ADDR_WIDTH-1:0] ap_bram_106_addr0,
    input [M_AXIS_BRAM_106_WIDTH-1:0] ap_bram_106_din0,
    output [M_AXIS_BRAM_106_WIDTH-1:0] ap_bram_106_dout0,
    input [M_AXIS_BRAM_106_WIDTH/8-1:0]ap_bram_106_we0,
    input ap_bram_106_en0,
    input [M_AXIS_BRAM_106_ADDR_WIDTH-1:0] ap_bram_106_addr1,
    input [M_AXIS_BRAM_106_WIDTH-1:0] ap_bram_106_din1,
    output [M_AXIS_BRAM_106_WIDTH-1:0] ap_bram_106_dout1,
    input [M_AXIS_BRAM_106_WIDTH/8-1:0]ap_bram_106_we1,
    input ap_bram_106_en1,
    //out AXI-Stream output interface 107
    input m_axis_bram_107_aclk,
    input m_axis_bram_107_aresetn,
    output m_axis_bram_107_tlast,
    output m_axis_bram_107_tvalid,
    output [M_AXIS_BRAM_107_DMWIDTH/8-1:0] m_axis_bram_107_tkeep,
    output [M_AXIS_BRAM_107_DMWIDTH/8-1:0] m_axis_bram_107_tstrb,
    output [M_AXIS_BRAM_107_DMWIDTH-1:0] m_axis_bram_107_tdata,
    input m_axis_bram_107_tready,
    input [M_AXIS_BRAM_107_ADDR_WIDTH-1:0] ap_bram_107_addr0,
    input [M_AXIS_BRAM_107_WIDTH-1:0] ap_bram_107_din0,
    output [M_AXIS_BRAM_107_WIDTH-1:0] ap_bram_107_dout0,
    input [M_AXIS_BRAM_107_WIDTH/8-1:0]ap_bram_107_we0,
    input ap_bram_107_en0,
    input [M_AXIS_BRAM_107_ADDR_WIDTH-1:0] ap_bram_107_addr1,
    input [M_AXIS_BRAM_107_WIDTH-1:0] ap_bram_107_din1,
    output [M_AXIS_BRAM_107_WIDTH-1:0] ap_bram_107_dout1,
    input [M_AXIS_BRAM_107_WIDTH/8-1:0]ap_bram_107_we1,
    input ap_bram_107_en1,
    //out AXI-Stream output interface 108
    input m_axis_bram_108_aclk,
    input m_axis_bram_108_aresetn,
    output m_axis_bram_108_tlast,
    output m_axis_bram_108_tvalid,
    output [M_AXIS_BRAM_108_DMWIDTH/8-1:0] m_axis_bram_108_tkeep,
    output [M_AXIS_BRAM_108_DMWIDTH/8-1:0] m_axis_bram_108_tstrb,
    output [M_AXIS_BRAM_108_DMWIDTH-1:0] m_axis_bram_108_tdata,
    input m_axis_bram_108_tready,
    input [M_AXIS_BRAM_108_ADDR_WIDTH-1:0] ap_bram_108_addr0,
    input [M_AXIS_BRAM_108_WIDTH-1:0] ap_bram_108_din0,
    output [M_AXIS_BRAM_108_WIDTH-1:0] ap_bram_108_dout0,
    input [M_AXIS_BRAM_108_WIDTH/8-1:0]ap_bram_108_we0,
    input ap_bram_108_en0,
    input [M_AXIS_BRAM_108_ADDR_WIDTH-1:0] ap_bram_108_addr1,
    input [M_AXIS_BRAM_108_WIDTH-1:0] ap_bram_108_din1,
    output [M_AXIS_BRAM_108_WIDTH-1:0] ap_bram_108_dout1,
    input [M_AXIS_BRAM_108_WIDTH/8-1:0]ap_bram_108_we1,
    input ap_bram_108_en1,
    //out AXI-Stream output interface 109
    input m_axis_bram_109_aclk,
    input m_axis_bram_109_aresetn,
    output m_axis_bram_109_tlast,
    output m_axis_bram_109_tvalid,
    output [M_AXIS_BRAM_109_DMWIDTH/8-1:0] m_axis_bram_109_tkeep,
    output [M_AXIS_BRAM_109_DMWIDTH/8-1:0] m_axis_bram_109_tstrb,
    output [M_AXIS_BRAM_109_DMWIDTH-1:0] m_axis_bram_109_tdata,
    input m_axis_bram_109_tready,
    input [M_AXIS_BRAM_109_ADDR_WIDTH-1:0] ap_bram_109_addr0,
    input [M_AXIS_BRAM_109_WIDTH-1:0] ap_bram_109_din0,
    output [M_AXIS_BRAM_109_WIDTH-1:0] ap_bram_109_dout0,
    input [M_AXIS_BRAM_109_WIDTH/8-1:0]ap_bram_109_we0,
    input ap_bram_109_en0,
    input [M_AXIS_BRAM_109_ADDR_WIDTH-1:0] ap_bram_109_addr1,
    input [M_AXIS_BRAM_109_WIDTH-1:0] ap_bram_109_din1,
    output [M_AXIS_BRAM_109_WIDTH-1:0] ap_bram_109_dout1,
    input [M_AXIS_BRAM_109_WIDTH/8-1:0]ap_bram_109_we1,
    input ap_bram_109_en1,
    //out AXI-Stream output interface 110
    input m_axis_bram_110_aclk,
    input m_axis_bram_110_aresetn,
    output m_axis_bram_110_tlast,
    output m_axis_bram_110_tvalid,
    output [M_AXIS_BRAM_110_DMWIDTH/8-1:0] m_axis_bram_110_tkeep,
    output [M_AXIS_BRAM_110_DMWIDTH/8-1:0] m_axis_bram_110_tstrb,
    output [M_AXIS_BRAM_110_DMWIDTH-1:0] m_axis_bram_110_tdata,
    input m_axis_bram_110_tready,
    input [M_AXIS_BRAM_110_ADDR_WIDTH-1:0] ap_bram_110_addr0,
    input [M_AXIS_BRAM_110_WIDTH-1:0] ap_bram_110_din0,
    output [M_AXIS_BRAM_110_WIDTH-1:0] ap_bram_110_dout0,
    input [M_AXIS_BRAM_110_WIDTH/8-1:0]ap_bram_110_we0,
    input ap_bram_110_en0,
    input [M_AXIS_BRAM_110_ADDR_WIDTH-1:0] ap_bram_110_addr1,
    input [M_AXIS_BRAM_110_WIDTH-1:0] ap_bram_110_din1,
    output [M_AXIS_BRAM_110_WIDTH-1:0] ap_bram_110_dout1,
    input [M_AXIS_BRAM_110_WIDTH/8-1:0]ap_bram_110_we1,
    input ap_bram_110_en1,
    //out AXI-Stream output interface 111
    input m_axis_bram_111_aclk,
    input m_axis_bram_111_aresetn,
    output m_axis_bram_111_tlast,
    output m_axis_bram_111_tvalid,
    output [M_AXIS_BRAM_111_DMWIDTH/8-1:0] m_axis_bram_111_tkeep,
    output [M_AXIS_BRAM_111_DMWIDTH/8-1:0] m_axis_bram_111_tstrb,
    output [M_AXIS_BRAM_111_DMWIDTH-1:0] m_axis_bram_111_tdata,
    input m_axis_bram_111_tready,
    input [M_AXIS_BRAM_111_ADDR_WIDTH-1:0] ap_bram_111_addr0,
    input [M_AXIS_BRAM_111_WIDTH-1:0] ap_bram_111_din0,
    output [M_AXIS_BRAM_111_WIDTH-1:0] ap_bram_111_dout0,
    input [M_AXIS_BRAM_111_WIDTH/8-1:0]ap_bram_111_we0,
    input ap_bram_111_en0,
    input [M_AXIS_BRAM_111_ADDR_WIDTH-1:0] ap_bram_111_addr1,
    input [M_AXIS_BRAM_111_WIDTH-1:0] ap_bram_111_din1,
    output [M_AXIS_BRAM_111_WIDTH-1:0] ap_bram_111_dout1,
    input [M_AXIS_BRAM_111_WIDTH/8-1:0]ap_bram_111_we1,
    input ap_bram_111_en1,
    //out AXI-Stream output interface 112
    input m_axis_bram_112_aclk,
    input m_axis_bram_112_aresetn,
    output m_axis_bram_112_tlast,
    output m_axis_bram_112_tvalid,
    output [M_AXIS_BRAM_112_DMWIDTH/8-1:0] m_axis_bram_112_tkeep,
    output [M_AXIS_BRAM_112_DMWIDTH/8-1:0] m_axis_bram_112_tstrb,
    output [M_AXIS_BRAM_112_DMWIDTH-1:0] m_axis_bram_112_tdata,
    input m_axis_bram_112_tready,
    input [M_AXIS_BRAM_112_ADDR_WIDTH-1:0] ap_bram_112_addr0,
    input [M_AXIS_BRAM_112_WIDTH-1:0] ap_bram_112_din0,
    output [M_AXIS_BRAM_112_WIDTH-1:0] ap_bram_112_dout0,
    input [M_AXIS_BRAM_112_WIDTH/8-1:0]ap_bram_112_we0,
    input ap_bram_112_en0,
    input [M_AXIS_BRAM_112_ADDR_WIDTH-1:0] ap_bram_112_addr1,
    input [M_AXIS_BRAM_112_WIDTH-1:0] ap_bram_112_din1,
    output [M_AXIS_BRAM_112_WIDTH-1:0] ap_bram_112_dout1,
    input [M_AXIS_BRAM_112_WIDTH/8-1:0]ap_bram_112_we1,
    input ap_bram_112_en1,
    //out AXI-Stream output interface 113
    input m_axis_bram_113_aclk,
    input m_axis_bram_113_aresetn,
    output m_axis_bram_113_tlast,
    output m_axis_bram_113_tvalid,
    output [M_AXIS_BRAM_113_DMWIDTH/8-1:0] m_axis_bram_113_tkeep,
    output [M_AXIS_BRAM_113_DMWIDTH/8-1:0] m_axis_bram_113_tstrb,
    output [M_AXIS_BRAM_113_DMWIDTH-1:0] m_axis_bram_113_tdata,
    input m_axis_bram_113_tready,
    input [M_AXIS_BRAM_113_ADDR_WIDTH-1:0] ap_bram_113_addr0,
    input [M_AXIS_BRAM_113_WIDTH-1:0] ap_bram_113_din0,
    output [M_AXIS_BRAM_113_WIDTH-1:0] ap_bram_113_dout0,
    input [M_AXIS_BRAM_113_WIDTH/8-1:0]ap_bram_113_we0,
    input ap_bram_113_en0,
    input [M_AXIS_BRAM_113_ADDR_WIDTH-1:0] ap_bram_113_addr1,
    input [M_AXIS_BRAM_113_WIDTH-1:0] ap_bram_113_din1,
    output [M_AXIS_BRAM_113_WIDTH-1:0] ap_bram_113_dout1,
    input [M_AXIS_BRAM_113_WIDTH/8-1:0]ap_bram_113_we1,
    input ap_bram_113_en1,
    //out AXI-Stream output interface 114
    input m_axis_bram_114_aclk,
    input m_axis_bram_114_aresetn,
    output m_axis_bram_114_tlast,
    output m_axis_bram_114_tvalid,
    output [M_AXIS_BRAM_114_DMWIDTH/8-1:0] m_axis_bram_114_tkeep,
    output [M_AXIS_BRAM_114_DMWIDTH/8-1:0] m_axis_bram_114_tstrb,
    output [M_AXIS_BRAM_114_DMWIDTH-1:0] m_axis_bram_114_tdata,
    input m_axis_bram_114_tready,
    input [M_AXIS_BRAM_114_ADDR_WIDTH-1:0] ap_bram_114_addr0,
    input [M_AXIS_BRAM_114_WIDTH-1:0] ap_bram_114_din0,
    output [M_AXIS_BRAM_114_WIDTH-1:0] ap_bram_114_dout0,
    input [M_AXIS_BRAM_114_WIDTH/8-1:0]ap_bram_114_we0,
    input ap_bram_114_en0,
    input [M_AXIS_BRAM_114_ADDR_WIDTH-1:0] ap_bram_114_addr1,
    input [M_AXIS_BRAM_114_WIDTH-1:0] ap_bram_114_din1,
    output [M_AXIS_BRAM_114_WIDTH-1:0] ap_bram_114_dout1,
    input [M_AXIS_BRAM_114_WIDTH/8-1:0]ap_bram_114_we1,
    input ap_bram_114_en1,
    //out AXI-Stream output interface 115
    input m_axis_bram_115_aclk,
    input m_axis_bram_115_aresetn,
    output m_axis_bram_115_tlast,
    output m_axis_bram_115_tvalid,
    output [M_AXIS_BRAM_115_DMWIDTH/8-1:0] m_axis_bram_115_tkeep,
    output [M_AXIS_BRAM_115_DMWIDTH/8-1:0] m_axis_bram_115_tstrb,
    output [M_AXIS_BRAM_115_DMWIDTH-1:0] m_axis_bram_115_tdata,
    input m_axis_bram_115_tready,
    input [M_AXIS_BRAM_115_ADDR_WIDTH-1:0] ap_bram_115_addr0,
    input [M_AXIS_BRAM_115_WIDTH-1:0] ap_bram_115_din0,
    output [M_AXIS_BRAM_115_WIDTH-1:0] ap_bram_115_dout0,
    input [M_AXIS_BRAM_115_WIDTH/8-1:0]ap_bram_115_we0,
    input ap_bram_115_en0,
    input [M_AXIS_BRAM_115_ADDR_WIDTH-1:0] ap_bram_115_addr1,
    input [M_AXIS_BRAM_115_WIDTH-1:0] ap_bram_115_din1,
    output [M_AXIS_BRAM_115_WIDTH-1:0] ap_bram_115_dout1,
    input [M_AXIS_BRAM_115_WIDTH/8-1:0]ap_bram_115_we1,
    input ap_bram_115_en1,
    //out AXI-Stream output interface 116
    input m_axis_bram_116_aclk,
    input m_axis_bram_116_aresetn,
    output m_axis_bram_116_tlast,
    output m_axis_bram_116_tvalid,
    output [M_AXIS_BRAM_116_DMWIDTH/8-1:0] m_axis_bram_116_tkeep,
    output [M_AXIS_BRAM_116_DMWIDTH/8-1:0] m_axis_bram_116_tstrb,
    output [M_AXIS_BRAM_116_DMWIDTH-1:0] m_axis_bram_116_tdata,
    input m_axis_bram_116_tready,
    input [M_AXIS_BRAM_116_ADDR_WIDTH-1:0] ap_bram_116_addr0,
    input [M_AXIS_BRAM_116_WIDTH-1:0] ap_bram_116_din0,
    output [M_AXIS_BRAM_116_WIDTH-1:0] ap_bram_116_dout0,
    input [M_AXIS_BRAM_116_WIDTH/8-1:0]ap_bram_116_we0,
    input ap_bram_116_en0,
    input [M_AXIS_BRAM_116_ADDR_WIDTH-1:0] ap_bram_116_addr1,
    input [M_AXIS_BRAM_116_WIDTH-1:0] ap_bram_116_din1,
    output [M_AXIS_BRAM_116_WIDTH-1:0] ap_bram_116_dout1,
    input [M_AXIS_BRAM_116_WIDTH/8-1:0]ap_bram_116_we1,
    input ap_bram_116_en1,
    //out AXI-Stream output interface 117
    input m_axis_bram_117_aclk,
    input m_axis_bram_117_aresetn,
    output m_axis_bram_117_tlast,
    output m_axis_bram_117_tvalid,
    output [M_AXIS_BRAM_117_DMWIDTH/8-1:0] m_axis_bram_117_tkeep,
    output [M_AXIS_BRAM_117_DMWIDTH/8-1:0] m_axis_bram_117_tstrb,
    output [M_AXIS_BRAM_117_DMWIDTH-1:0] m_axis_bram_117_tdata,
    input m_axis_bram_117_tready,
    input [M_AXIS_BRAM_117_ADDR_WIDTH-1:0] ap_bram_117_addr0,
    input [M_AXIS_BRAM_117_WIDTH-1:0] ap_bram_117_din0,
    output [M_AXIS_BRAM_117_WIDTH-1:0] ap_bram_117_dout0,
    input [M_AXIS_BRAM_117_WIDTH/8-1:0]ap_bram_117_we0,
    input ap_bram_117_en0,
    input [M_AXIS_BRAM_117_ADDR_WIDTH-1:0] ap_bram_117_addr1,
    input [M_AXIS_BRAM_117_WIDTH-1:0] ap_bram_117_din1,
    output [M_AXIS_BRAM_117_WIDTH-1:0] ap_bram_117_dout1,
    input [M_AXIS_BRAM_117_WIDTH/8-1:0]ap_bram_117_we1,
    input ap_bram_117_en1,
    //out AXI-Stream output interface 118
    input m_axis_bram_118_aclk,
    input m_axis_bram_118_aresetn,
    output m_axis_bram_118_tlast,
    output m_axis_bram_118_tvalid,
    output [M_AXIS_BRAM_118_DMWIDTH/8-1:0] m_axis_bram_118_tkeep,
    output [M_AXIS_BRAM_118_DMWIDTH/8-1:0] m_axis_bram_118_tstrb,
    output [M_AXIS_BRAM_118_DMWIDTH-1:0] m_axis_bram_118_tdata,
    input m_axis_bram_118_tready,
    input [M_AXIS_BRAM_118_ADDR_WIDTH-1:0] ap_bram_118_addr0,
    input [M_AXIS_BRAM_118_WIDTH-1:0] ap_bram_118_din0,
    output [M_AXIS_BRAM_118_WIDTH-1:0] ap_bram_118_dout0,
    input [M_AXIS_BRAM_118_WIDTH/8-1:0]ap_bram_118_we0,
    input ap_bram_118_en0,
    input [M_AXIS_BRAM_118_ADDR_WIDTH-1:0] ap_bram_118_addr1,
    input [M_AXIS_BRAM_118_WIDTH-1:0] ap_bram_118_din1,
    output [M_AXIS_BRAM_118_WIDTH-1:0] ap_bram_118_dout1,
    input [M_AXIS_BRAM_118_WIDTH/8-1:0]ap_bram_118_we1,
    input ap_bram_118_en1,
    //out AXI-Stream output interface 119
    input m_axis_bram_119_aclk,
    input m_axis_bram_119_aresetn,
    output m_axis_bram_119_tlast,
    output m_axis_bram_119_tvalid,
    output [M_AXIS_BRAM_119_DMWIDTH/8-1:0] m_axis_bram_119_tkeep,
    output [M_AXIS_BRAM_119_DMWIDTH/8-1:0] m_axis_bram_119_tstrb,
    output [M_AXIS_BRAM_119_DMWIDTH-1:0] m_axis_bram_119_tdata,
    input m_axis_bram_119_tready,
    input [M_AXIS_BRAM_119_ADDR_WIDTH-1:0] ap_bram_119_addr0,
    input [M_AXIS_BRAM_119_WIDTH-1:0] ap_bram_119_din0,
    output [M_AXIS_BRAM_119_WIDTH-1:0] ap_bram_119_dout0,
    input [M_AXIS_BRAM_119_WIDTH/8-1:0]ap_bram_119_we0,
    input ap_bram_119_en0,
    input [M_AXIS_BRAM_119_ADDR_WIDTH-1:0] ap_bram_119_addr1,
    input [M_AXIS_BRAM_119_WIDTH-1:0] ap_bram_119_din1,
    output [M_AXIS_BRAM_119_WIDTH-1:0] ap_bram_119_dout1,
    input [M_AXIS_BRAM_119_WIDTH/8-1:0]ap_bram_119_we1,
    input ap_bram_119_en1,
    //out AXI-Stream output interface 120
    input m_axis_bram_120_aclk,
    input m_axis_bram_120_aresetn,
    output m_axis_bram_120_tlast,
    output m_axis_bram_120_tvalid,
    output [M_AXIS_BRAM_120_DMWIDTH/8-1:0] m_axis_bram_120_tkeep,
    output [M_AXIS_BRAM_120_DMWIDTH/8-1:0] m_axis_bram_120_tstrb,
    output [M_AXIS_BRAM_120_DMWIDTH-1:0] m_axis_bram_120_tdata,
    input m_axis_bram_120_tready,
    input [M_AXIS_BRAM_120_ADDR_WIDTH-1:0] ap_bram_120_addr0,
    input [M_AXIS_BRAM_120_WIDTH-1:0] ap_bram_120_din0,
    output [M_AXIS_BRAM_120_WIDTH-1:0] ap_bram_120_dout0,
    input [M_AXIS_BRAM_120_WIDTH/8-1:0]ap_bram_120_we0,
    input ap_bram_120_en0,
    input [M_AXIS_BRAM_120_ADDR_WIDTH-1:0] ap_bram_120_addr1,
    input [M_AXIS_BRAM_120_WIDTH-1:0] ap_bram_120_din1,
    output [M_AXIS_BRAM_120_WIDTH-1:0] ap_bram_120_dout1,
    input [M_AXIS_BRAM_120_WIDTH/8-1:0]ap_bram_120_we1,
    input ap_bram_120_en1,
    //out AXI-Stream output interface 121
    input m_axis_bram_121_aclk,
    input m_axis_bram_121_aresetn,
    output m_axis_bram_121_tlast,
    output m_axis_bram_121_tvalid,
    output [M_AXIS_BRAM_121_DMWIDTH/8-1:0] m_axis_bram_121_tkeep,
    output [M_AXIS_BRAM_121_DMWIDTH/8-1:0] m_axis_bram_121_tstrb,
    output [M_AXIS_BRAM_121_DMWIDTH-1:0] m_axis_bram_121_tdata,
    input m_axis_bram_121_tready,
    input [M_AXIS_BRAM_121_ADDR_WIDTH-1:0] ap_bram_121_addr0,
    input [M_AXIS_BRAM_121_WIDTH-1:0] ap_bram_121_din0,
    output [M_AXIS_BRAM_121_WIDTH-1:0] ap_bram_121_dout0,
    input [M_AXIS_BRAM_121_WIDTH/8-1:0]ap_bram_121_we0,
    input ap_bram_121_en0,
    input [M_AXIS_BRAM_121_ADDR_WIDTH-1:0] ap_bram_121_addr1,
    input [M_AXIS_BRAM_121_WIDTH-1:0] ap_bram_121_din1,
    output [M_AXIS_BRAM_121_WIDTH-1:0] ap_bram_121_dout1,
    input [M_AXIS_BRAM_121_WIDTH/8-1:0]ap_bram_121_we1,
    input ap_bram_121_en1,
    //out AXI-Stream output interface 122
    input m_axis_bram_122_aclk,
    input m_axis_bram_122_aresetn,
    output m_axis_bram_122_tlast,
    output m_axis_bram_122_tvalid,
    output [M_AXIS_BRAM_122_DMWIDTH/8-1:0] m_axis_bram_122_tkeep,
    output [M_AXIS_BRAM_122_DMWIDTH/8-1:0] m_axis_bram_122_tstrb,
    output [M_AXIS_BRAM_122_DMWIDTH-1:0] m_axis_bram_122_tdata,
    input m_axis_bram_122_tready,
    input [M_AXIS_BRAM_122_ADDR_WIDTH-1:0] ap_bram_122_addr0,
    input [M_AXIS_BRAM_122_WIDTH-1:0] ap_bram_122_din0,
    output [M_AXIS_BRAM_122_WIDTH-1:0] ap_bram_122_dout0,
    input [M_AXIS_BRAM_122_WIDTH/8-1:0]ap_bram_122_we0,
    input ap_bram_122_en0,
    input [M_AXIS_BRAM_122_ADDR_WIDTH-1:0] ap_bram_122_addr1,
    input [M_AXIS_BRAM_122_WIDTH-1:0] ap_bram_122_din1,
    output [M_AXIS_BRAM_122_WIDTH-1:0] ap_bram_122_dout1,
    input [M_AXIS_BRAM_122_WIDTH/8-1:0]ap_bram_122_we1,
    input ap_bram_122_en1,
    //out AXI-Stream output interface 123
    input m_axis_bram_123_aclk,
    input m_axis_bram_123_aresetn,
    output m_axis_bram_123_tlast,
    output m_axis_bram_123_tvalid,
    output [M_AXIS_BRAM_123_DMWIDTH/8-1:0] m_axis_bram_123_tkeep,
    output [M_AXIS_BRAM_123_DMWIDTH/8-1:0] m_axis_bram_123_tstrb,
    output [M_AXIS_BRAM_123_DMWIDTH-1:0] m_axis_bram_123_tdata,
    input m_axis_bram_123_tready,
    input [M_AXIS_BRAM_123_ADDR_WIDTH-1:0] ap_bram_123_addr0,
    input [M_AXIS_BRAM_123_WIDTH-1:0] ap_bram_123_din0,
    output [M_AXIS_BRAM_123_WIDTH-1:0] ap_bram_123_dout0,
    input [M_AXIS_BRAM_123_WIDTH/8-1:0]ap_bram_123_we0,
    input ap_bram_123_en0,
    input [M_AXIS_BRAM_123_ADDR_WIDTH-1:0] ap_bram_123_addr1,
    input [M_AXIS_BRAM_123_WIDTH-1:0] ap_bram_123_din1,
    output [M_AXIS_BRAM_123_WIDTH-1:0] ap_bram_123_dout1,
    input [M_AXIS_BRAM_123_WIDTH/8-1:0]ap_bram_123_we1,
    input ap_bram_123_en1,
    //out AXI-Stream output interface 124
    input m_axis_bram_124_aclk,
    input m_axis_bram_124_aresetn,
    output m_axis_bram_124_tlast,
    output m_axis_bram_124_tvalid,
    output [M_AXIS_BRAM_124_DMWIDTH/8-1:0] m_axis_bram_124_tkeep,
    output [M_AXIS_BRAM_124_DMWIDTH/8-1:0] m_axis_bram_124_tstrb,
    output [M_AXIS_BRAM_124_DMWIDTH-1:0] m_axis_bram_124_tdata,
    input m_axis_bram_124_tready,
    input [M_AXIS_BRAM_124_ADDR_WIDTH-1:0] ap_bram_124_addr0,
    input [M_AXIS_BRAM_124_WIDTH-1:0] ap_bram_124_din0,
    output [M_AXIS_BRAM_124_WIDTH-1:0] ap_bram_124_dout0,
    input [M_AXIS_BRAM_124_WIDTH/8-1:0]ap_bram_124_we0,
    input ap_bram_124_en0,
    input [M_AXIS_BRAM_124_ADDR_WIDTH-1:0] ap_bram_124_addr1,
    input [M_AXIS_BRAM_124_WIDTH-1:0] ap_bram_124_din1,
    output [M_AXIS_BRAM_124_WIDTH-1:0] ap_bram_124_dout1,
    input [M_AXIS_BRAM_124_WIDTH/8-1:0]ap_bram_124_we1,
    input ap_bram_124_en1,
    //out AXI-Stream output interface 125
    input m_axis_bram_125_aclk,
    input m_axis_bram_125_aresetn,
    output m_axis_bram_125_tlast,
    output m_axis_bram_125_tvalid,
    output [M_AXIS_BRAM_125_DMWIDTH/8-1:0] m_axis_bram_125_tkeep,
    output [M_AXIS_BRAM_125_DMWIDTH/8-1:0] m_axis_bram_125_tstrb,
    output [M_AXIS_BRAM_125_DMWIDTH-1:0] m_axis_bram_125_tdata,
    input m_axis_bram_125_tready,
    input [M_AXIS_BRAM_125_ADDR_WIDTH-1:0] ap_bram_125_addr0,
    input [M_AXIS_BRAM_125_WIDTH-1:0] ap_bram_125_din0,
    output [M_AXIS_BRAM_125_WIDTH-1:0] ap_bram_125_dout0,
    input [M_AXIS_BRAM_125_WIDTH/8-1:0]ap_bram_125_we0,
    input ap_bram_125_en0,
    input [M_AXIS_BRAM_125_ADDR_WIDTH-1:0] ap_bram_125_addr1,
    input [M_AXIS_BRAM_125_WIDTH-1:0] ap_bram_125_din1,
    output [M_AXIS_BRAM_125_WIDTH-1:0] ap_bram_125_dout1,
    input [M_AXIS_BRAM_125_WIDTH/8-1:0]ap_bram_125_we1,
    input ap_bram_125_en1,
    //out AXI-Stream output interface 126
    input m_axis_bram_126_aclk,
    input m_axis_bram_126_aresetn,
    output m_axis_bram_126_tlast,
    output m_axis_bram_126_tvalid,
    output [M_AXIS_BRAM_126_DMWIDTH/8-1:0] m_axis_bram_126_tkeep,
    output [M_AXIS_BRAM_126_DMWIDTH/8-1:0] m_axis_bram_126_tstrb,
    output [M_AXIS_BRAM_126_DMWIDTH-1:0] m_axis_bram_126_tdata,
    input m_axis_bram_126_tready,
    input [M_AXIS_BRAM_126_ADDR_WIDTH-1:0] ap_bram_126_addr0,
    input [M_AXIS_BRAM_126_WIDTH-1:0] ap_bram_126_din0,
    output [M_AXIS_BRAM_126_WIDTH-1:0] ap_bram_126_dout0,
    input [M_AXIS_BRAM_126_WIDTH/8-1:0]ap_bram_126_we0,
    input ap_bram_126_en0,
    input [M_AXIS_BRAM_126_ADDR_WIDTH-1:0] ap_bram_126_addr1,
    input [M_AXIS_BRAM_126_WIDTH-1:0] ap_bram_126_din1,
    output [M_AXIS_BRAM_126_WIDTH-1:0] ap_bram_126_dout1,
    input [M_AXIS_BRAM_126_WIDTH/8-1:0]ap_bram_126_we1,
    input ap_bram_126_en1,
    //out AXI-Stream output interface 127
    input m_axis_bram_127_aclk,
    input m_axis_bram_127_aresetn,
    output m_axis_bram_127_tlast,
    output m_axis_bram_127_tvalid,
    output [M_AXIS_BRAM_127_DMWIDTH/8-1:0] m_axis_bram_127_tkeep,
    output [M_AXIS_BRAM_127_DMWIDTH/8-1:0] m_axis_bram_127_tstrb,
    output [M_AXIS_BRAM_127_DMWIDTH-1:0] m_axis_bram_127_tdata,
    input m_axis_bram_127_tready,
    input [M_AXIS_BRAM_127_ADDR_WIDTH-1:0] ap_bram_127_addr0,
    input [M_AXIS_BRAM_127_WIDTH-1:0] ap_bram_127_din0,
    output [M_AXIS_BRAM_127_WIDTH-1:0] ap_bram_127_dout0,
    input [M_AXIS_BRAM_127_WIDTH/8-1:0]ap_bram_127_we0,
    input ap_bram_127_en0,
    input [M_AXIS_BRAM_127_ADDR_WIDTH-1:0] ap_bram_127_addr1,
    input [M_AXIS_BRAM_127_WIDTH-1:0] ap_bram_127_din1,
    output [M_AXIS_BRAM_127_WIDTH-1:0] ap_bram_127_dout1,
    input [M_AXIS_BRAM_127_WIDTH/8-1:0]ap_bram_127_we1,
    input ap_bram_127_en1
    );
    

    localparam C_MAX_OUTPUT_BRAMs = 128;
    localparam C_MAX_BIT_WIDTH = 1024;
    localparam [(C_MAX_OUTPUT_BRAMs*32)-1:0] C_PORT_BIT_ARRAY = {M_AXIS_BRAM_127_PORTS,M_AXIS_BRAM_126_PORTS,M_AXIS_BRAM_125_PORTS,M_AXIS_BRAM_124_PORTS,M_AXIS_BRAM_123_PORTS,M_AXIS_BRAM_122_PORTS,M_AXIS_BRAM_121_PORTS,M_AXIS_BRAM_120_PORTS,M_AXIS_BRAM_119_PORTS,M_AXIS_BRAM_118_PORTS,M_AXIS_BRAM_117_PORTS,M_AXIS_BRAM_116_PORTS,M_AXIS_BRAM_115_PORTS,M_AXIS_BRAM_114_PORTS,M_AXIS_BRAM_113_PORTS,M_AXIS_BRAM_112_PORTS,M_AXIS_BRAM_111_PORTS,M_AXIS_BRAM_110_PORTS,M_AXIS_BRAM_109_PORTS,M_AXIS_BRAM_108_PORTS,M_AXIS_BRAM_107_PORTS,M_AXIS_BRAM_106_PORTS,M_AXIS_BRAM_105_PORTS,M_AXIS_BRAM_104_PORTS,M_AXIS_BRAM_103_PORTS,M_AXIS_BRAM_102_PORTS,M_AXIS_BRAM_101_PORTS,M_AXIS_BRAM_100_PORTS,M_AXIS_BRAM_99_PORTS,M_AXIS_BRAM_98_PORTS,M_AXIS_BRAM_97_PORTS,M_AXIS_BRAM_96_PORTS,M_AXIS_BRAM_95_PORTS,M_AXIS_BRAM_94_PORTS,M_AXIS_BRAM_93_PORTS,M_AXIS_BRAM_92_PORTS,M_AXIS_BRAM_91_PORTS,M_AXIS_BRAM_90_PORTS,M_AXIS_BRAM_89_PORTS,M_AXIS_BRAM_88_PORTS,M_AXIS_BRAM_87_PORTS,M_AXIS_BRAM_86_PORTS,M_AXIS_BRAM_85_PORTS,M_AXIS_BRAM_84_PORTS,M_AXIS_BRAM_83_PORTS,M_AXIS_BRAM_82_PORTS,M_AXIS_BRAM_81_PORTS,M_AXIS_BRAM_80_PORTS,M_AXIS_BRAM_79_PORTS,M_AXIS_BRAM_78_PORTS,M_AXIS_BRAM_77_PORTS,M_AXIS_BRAM_76_PORTS,M_AXIS_BRAM_75_PORTS,M_AXIS_BRAM_74_PORTS,M_AXIS_BRAM_73_PORTS,M_AXIS_BRAM_72_PORTS,M_AXIS_BRAM_71_PORTS,M_AXIS_BRAM_70_PORTS,M_AXIS_BRAM_69_PORTS,M_AXIS_BRAM_68_PORTS,M_AXIS_BRAM_67_PORTS,M_AXIS_BRAM_66_PORTS,M_AXIS_BRAM_65_PORTS,M_AXIS_BRAM_64_PORTS,M_AXIS_BRAM_63_PORTS,M_AXIS_BRAM_62_PORTS,M_AXIS_BRAM_61_PORTS,M_AXIS_BRAM_60_PORTS,M_AXIS_BRAM_59_PORTS,M_AXIS_BRAM_58_PORTS,M_AXIS_BRAM_57_PORTS,M_AXIS_BRAM_56_PORTS,M_AXIS_BRAM_55_PORTS,M_AXIS_BRAM_54_PORTS,M_AXIS_BRAM_53_PORTS,M_AXIS_BRAM_52_PORTS,M_AXIS_BRAM_51_PORTS,M_AXIS_BRAM_50_PORTS,M_AXIS_BRAM_49_PORTS,M_AXIS_BRAM_48_PORTS,M_AXIS_BRAM_47_PORTS,M_AXIS_BRAM_46_PORTS,M_AXIS_BRAM_45_PORTS,M_AXIS_BRAM_44_PORTS,M_AXIS_BRAM_43_PORTS,M_AXIS_BRAM_42_PORTS,M_AXIS_BRAM_41_PORTS,M_AXIS_BRAM_40_PORTS,M_AXIS_BRAM_39_PORTS,M_AXIS_BRAM_38_PORTS,M_AXIS_BRAM_37_PORTS,M_AXIS_BRAM_36_PORTS,M_AXIS_BRAM_35_PORTS,M_AXIS_BRAM_34_PORTS,M_AXIS_BRAM_33_PORTS,M_AXIS_BRAM_32_PORTS,M_AXIS_BRAM_31_PORTS,M_AXIS_BRAM_30_PORTS,M_AXIS_BRAM_29_PORTS,M_AXIS_BRAM_28_PORTS,M_AXIS_BRAM_27_PORTS,M_AXIS_BRAM_26_PORTS,M_AXIS_BRAM_25_PORTS,M_AXIS_BRAM_24_PORTS,M_AXIS_BRAM_23_PORTS,M_AXIS_BRAM_22_PORTS,M_AXIS_BRAM_21_PORTS,M_AXIS_BRAM_20_PORTS,M_AXIS_BRAM_19_PORTS,M_AXIS_BRAM_18_PORTS,M_AXIS_BRAM_17_PORTS,M_AXIS_BRAM_16_PORTS,M_AXIS_BRAM_15_PORTS,M_AXIS_BRAM_14_PORTS,M_AXIS_BRAM_13_PORTS,M_AXIS_BRAM_12_PORTS,M_AXIS_BRAM_11_PORTS,M_AXIS_BRAM_10_PORTS,M_AXIS_BRAM_9_PORTS,M_AXIS_BRAM_8_PORTS,M_AXIS_BRAM_7_PORTS,M_AXIS_BRAM_6_PORTS,M_AXIS_BRAM_5_PORTS,M_AXIS_BRAM_4_PORTS,M_AXIS_BRAM_3_PORTS,M_AXIS_BRAM_2_PORTS,M_AXIS_BRAM_1_PORTS,M_AXIS_BRAM_0_PORTS};
    localparam [(C_MAX_OUTPUT_BRAMs*32)-1:0] C_OUTBRAM_BIT_ARRAY = {M_AXIS_BRAM_127_WIDTH,M_AXIS_BRAM_126_WIDTH,M_AXIS_BRAM_125_WIDTH,M_AXIS_BRAM_124_WIDTH,M_AXIS_BRAM_123_WIDTH,M_AXIS_BRAM_122_WIDTH,M_AXIS_BRAM_121_WIDTH,M_AXIS_BRAM_120_WIDTH,M_AXIS_BRAM_119_WIDTH,M_AXIS_BRAM_118_WIDTH,M_AXIS_BRAM_117_WIDTH,M_AXIS_BRAM_116_WIDTH,M_AXIS_BRAM_115_WIDTH,M_AXIS_BRAM_114_WIDTH,M_AXIS_BRAM_113_WIDTH,M_AXIS_BRAM_112_WIDTH,M_AXIS_BRAM_111_WIDTH,M_AXIS_BRAM_110_WIDTH,M_AXIS_BRAM_109_WIDTH,M_AXIS_BRAM_108_WIDTH,M_AXIS_BRAM_107_WIDTH,M_AXIS_BRAM_106_WIDTH,M_AXIS_BRAM_105_WIDTH,M_AXIS_BRAM_104_WIDTH,M_AXIS_BRAM_103_WIDTH,M_AXIS_BRAM_102_WIDTH,M_AXIS_BRAM_101_WIDTH,M_AXIS_BRAM_100_WIDTH,M_AXIS_BRAM_99_WIDTH,M_AXIS_BRAM_98_WIDTH,M_AXIS_BRAM_97_WIDTH,M_AXIS_BRAM_96_WIDTH,M_AXIS_BRAM_95_WIDTH,M_AXIS_BRAM_94_WIDTH,M_AXIS_BRAM_93_WIDTH,M_AXIS_BRAM_92_WIDTH,M_AXIS_BRAM_91_WIDTH,M_AXIS_BRAM_90_WIDTH,M_AXIS_BRAM_89_WIDTH,M_AXIS_BRAM_88_WIDTH,M_AXIS_BRAM_87_WIDTH,M_AXIS_BRAM_86_WIDTH,M_AXIS_BRAM_85_WIDTH,M_AXIS_BRAM_84_WIDTH,M_AXIS_BRAM_83_WIDTH,M_AXIS_BRAM_82_WIDTH,M_AXIS_BRAM_81_WIDTH,M_AXIS_BRAM_80_WIDTH,M_AXIS_BRAM_79_WIDTH,M_AXIS_BRAM_78_WIDTH,M_AXIS_BRAM_77_WIDTH,M_AXIS_BRAM_76_WIDTH,M_AXIS_BRAM_75_WIDTH,M_AXIS_BRAM_74_WIDTH,M_AXIS_BRAM_73_WIDTH,M_AXIS_BRAM_72_WIDTH,M_AXIS_BRAM_71_WIDTH,M_AXIS_BRAM_70_WIDTH,M_AXIS_BRAM_69_WIDTH,M_AXIS_BRAM_68_WIDTH,M_AXIS_BRAM_67_WIDTH,M_AXIS_BRAM_66_WIDTH,M_AXIS_BRAM_65_WIDTH,M_AXIS_BRAM_64_WIDTH,M_AXIS_BRAM_63_WIDTH,M_AXIS_BRAM_62_WIDTH,M_AXIS_BRAM_61_WIDTH,M_AXIS_BRAM_60_WIDTH,M_AXIS_BRAM_59_WIDTH,M_AXIS_BRAM_58_WIDTH,M_AXIS_BRAM_57_WIDTH,M_AXIS_BRAM_56_WIDTH,M_AXIS_BRAM_55_WIDTH,M_AXIS_BRAM_54_WIDTH,M_AXIS_BRAM_53_WIDTH,M_AXIS_BRAM_52_WIDTH,M_AXIS_BRAM_51_WIDTH,M_AXIS_BRAM_50_WIDTH,M_AXIS_BRAM_49_WIDTH,M_AXIS_BRAM_48_WIDTH,M_AXIS_BRAM_47_WIDTH,M_AXIS_BRAM_46_WIDTH,M_AXIS_BRAM_45_WIDTH,M_AXIS_BRAM_44_WIDTH,M_AXIS_BRAM_43_WIDTH,M_AXIS_BRAM_42_WIDTH,M_AXIS_BRAM_41_WIDTH,M_AXIS_BRAM_40_WIDTH,M_AXIS_BRAM_39_WIDTH,M_AXIS_BRAM_38_WIDTH,M_AXIS_BRAM_37_WIDTH,M_AXIS_BRAM_36_WIDTH,M_AXIS_BRAM_35_WIDTH,M_AXIS_BRAM_34_WIDTH,M_AXIS_BRAM_33_WIDTH,M_AXIS_BRAM_32_WIDTH,M_AXIS_BRAM_31_WIDTH,M_AXIS_BRAM_30_WIDTH,M_AXIS_BRAM_29_WIDTH,M_AXIS_BRAM_28_WIDTH,M_AXIS_BRAM_27_WIDTH,M_AXIS_BRAM_26_WIDTH,M_AXIS_BRAM_25_WIDTH,M_AXIS_BRAM_24_WIDTH,M_AXIS_BRAM_23_WIDTH,M_AXIS_BRAM_22_WIDTH,M_AXIS_BRAM_21_WIDTH,M_AXIS_BRAM_20_WIDTH,M_AXIS_BRAM_19_WIDTH,M_AXIS_BRAM_18_WIDTH,M_AXIS_BRAM_17_WIDTH,M_AXIS_BRAM_16_WIDTH,M_AXIS_BRAM_15_WIDTH,M_AXIS_BRAM_14_WIDTH,M_AXIS_BRAM_13_WIDTH,M_AXIS_BRAM_12_WIDTH,M_AXIS_BRAM_11_WIDTH,M_AXIS_BRAM_10_WIDTH,M_AXIS_BRAM_9_WIDTH,M_AXIS_BRAM_8_WIDTH,M_AXIS_BRAM_7_WIDTH,M_AXIS_BRAM_6_WIDTH,M_AXIS_BRAM_5_WIDTH,M_AXIS_BRAM_4_WIDTH,M_AXIS_BRAM_3_WIDTH,M_AXIS_BRAM_2_WIDTH,M_AXIS_BRAM_1_WIDTH,M_AXIS_BRAM_0_WIDTH};
    localparam [(C_MAX_OUTPUT_BRAMs*32)-1:0] C_DEPTH_BIT_ARRAY = {M_AXIS_BRAM_127_DEPTH,M_AXIS_BRAM_126_DEPTH,M_AXIS_BRAM_125_DEPTH,M_AXIS_BRAM_124_DEPTH,M_AXIS_BRAM_123_DEPTH,M_AXIS_BRAM_122_DEPTH,M_AXIS_BRAM_121_DEPTH,M_AXIS_BRAM_120_DEPTH,M_AXIS_BRAM_119_DEPTH,M_AXIS_BRAM_118_DEPTH,M_AXIS_BRAM_117_DEPTH,M_AXIS_BRAM_116_DEPTH,M_AXIS_BRAM_115_DEPTH,M_AXIS_BRAM_114_DEPTH,M_AXIS_BRAM_113_DEPTH,M_AXIS_BRAM_112_DEPTH,M_AXIS_BRAM_111_DEPTH,M_AXIS_BRAM_110_DEPTH,M_AXIS_BRAM_109_DEPTH,M_AXIS_BRAM_108_DEPTH,M_AXIS_BRAM_107_DEPTH,M_AXIS_BRAM_106_DEPTH,M_AXIS_BRAM_105_DEPTH,M_AXIS_BRAM_104_DEPTH,M_AXIS_BRAM_103_DEPTH,M_AXIS_BRAM_102_DEPTH,M_AXIS_BRAM_101_DEPTH,M_AXIS_BRAM_100_DEPTH,M_AXIS_BRAM_99_DEPTH,M_AXIS_BRAM_98_DEPTH,M_AXIS_BRAM_97_DEPTH,M_AXIS_BRAM_96_DEPTH,M_AXIS_BRAM_95_DEPTH,M_AXIS_BRAM_94_DEPTH,M_AXIS_BRAM_93_DEPTH,M_AXIS_BRAM_92_DEPTH,M_AXIS_BRAM_91_DEPTH,M_AXIS_BRAM_90_DEPTH,M_AXIS_BRAM_89_DEPTH,M_AXIS_BRAM_88_DEPTH,M_AXIS_BRAM_87_DEPTH,M_AXIS_BRAM_86_DEPTH,M_AXIS_BRAM_85_DEPTH,M_AXIS_BRAM_84_DEPTH,M_AXIS_BRAM_83_DEPTH,M_AXIS_BRAM_82_DEPTH,M_AXIS_BRAM_81_DEPTH,M_AXIS_BRAM_80_DEPTH,M_AXIS_BRAM_79_DEPTH,M_AXIS_BRAM_78_DEPTH,M_AXIS_BRAM_77_DEPTH,M_AXIS_BRAM_76_DEPTH,M_AXIS_BRAM_75_DEPTH,M_AXIS_BRAM_74_DEPTH,M_AXIS_BRAM_73_DEPTH,M_AXIS_BRAM_72_DEPTH,M_AXIS_BRAM_71_DEPTH,M_AXIS_BRAM_70_DEPTH,M_AXIS_BRAM_69_DEPTH,M_AXIS_BRAM_68_DEPTH,M_AXIS_BRAM_67_DEPTH,M_AXIS_BRAM_66_DEPTH,M_AXIS_BRAM_65_DEPTH,M_AXIS_BRAM_64_DEPTH,M_AXIS_BRAM_63_DEPTH,M_AXIS_BRAM_62_DEPTH,M_AXIS_BRAM_61_DEPTH,M_AXIS_BRAM_60_DEPTH,M_AXIS_BRAM_59_DEPTH,M_AXIS_BRAM_58_DEPTH,M_AXIS_BRAM_57_DEPTH,M_AXIS_BRAM_56_DEPTH,M_AXIS_BRAM_55_DEPTH,M_AXIS_BRAM_54_DEPTH,M_AXIS_BRAM_53_DEPTH,M_AXIS_BRAM_52_DEPTH,M_AXIS_BRAM_51_DEPTH,M_AXIS_BRAM_50_DEPTH,M_AXIS_BRAM_49_DEPTH,M_AXIS_BRAM_48_DEPTH,M_AXIS_BRAM_47_DEPTH,M_AXIS_BRAM_46_DEPTH,M_AXIS_BRAM_45_DEPTH,M_AXIS_BRAM_44_DEPTH,M_AXIS_BRAM_43_DEPTH,M_AXIS_BRAM_42_DEPTH,M_AXIS_BRAM_41_DEPTH,M_AXIS_BRAM_40_DEPTH,M_AXIS_BRAM_39_DEPTH,M_AXIS_BRAM_38_DEPTH,M_AXIS_BRAM_37_DEPTH,M_AXIS_BRAM_36_DEPTH,M_AXIS_BRAM_35_DEPTH,M_AXIS_BRAM_34_DEPTH,M_AXIS_BRAM_33_DEPTH,M_AXIS_BRAM_32_DEPTH,M_AXIS_BRAM_31_DEPTH,M_AXIS_BRAM_30_DEPTH,M_AXIS_BRAM_29_DEPTH,M_AXIS_BRAM_28_DEPTH,M_AXIS_BRAM_27_DEPTH,M_AXIS_BRAM_26_DEPTH,M_AXIS_BRAM_25_DEPTH,M_AXIS_BRAM_24_DEPTH,M_AXIS_BRAM_23_DEPTH,M_AXIS_BRAM_22_DEPTH,M_AXIS_BRAM_21_DEPTH,M_AXIS_BRAM_20_DEPTH,M_AXIS_BRAM_19_DEPTH,M_AXIS_BRAM_18_DEPTH,M_AXIS_BRAM_17_DEPTH,M_AXIS_BRAM_16_DEPTH,M_AXIS_BRAM_15_DEPTH,M_AXIS_BRAM_14_DEPTH,M_AXIS_BRAM_13_DEPTH,M_AXIS_BRAM_12_DEPTH,M_AXIS_BRAM_11_DEPTH,M_AXIS_BRAM_10_DEPTH,M_AXIS_BRAM_9_DEPTH,M_AXIS_BRAM_8_DEPTH,M_AXIS_BRAM_7_DEPTH,M_AXIS_BRAM_6_DEPTH,M_AXIS_BRAM_5_DEPTH,M_AXIS_BRAM_4_DEPTH,M_AXIS_BRAM_3_DEPTH,M_AXIS_BRAM_2_DEPTH,M_AXIS_BRAM_1_DEPTH,M_AXIS_BRAM_0_DEPTH};
    localparam [(C_MAX_OUTPUT_BRAMs*32)-1:0] C_DMWIDTH_BIT_ARRAY = {M_AXIS_BRAM_127_DMWIDTH,M_AXIS_BRAM_126_DMWIDTH,M_AXIS_BRAM_125_DMWIDTH,M_AXIS_BRAM_124_DMWIDTH,M_AXIS_BRAM_123_DMWIDTH,M_AXIS_BRAM_122_DMWIDTH,M_AXIS_BRAM_121_DMWIDTH,M_AXIS_BRAM_120_DMWIDTH,M_AXIS_BRAM_119_DMWIDTH,M_AXIS_BRAM_118_DMWIDTH,M_AXIS_BRAM_117_DMWIDTH,M_AXIS_BRAM_116_DMWIDTH,M_AXIS_BRAM_115_DMWIDTH,M_AXIS_BRAM_114_DMWIDTH,M_AXIS_BRAM_113_DMWIDTH,M_AXIS_BRAM_112_DMWIDTH,M_AXIS_BRAM_111_DMWIDTH,M_AXIS_BRAM_110_DMWIDTH,M_AXIS_BRAM_109_DMWIDTH,M_AXIS_BRAM_108_DMWIDTH,M_AXIS_BRAM_107_DMWIDTH,M_AXIS_BRAM_106_DMWIDTH,M_AXIS_BRAM_105_DMWIDTH,M_AXIS_BRAM_104_DMWIDTH,M_AXIS_BRAM_103_DMWIDTH,M_AXIS_BRAM_102_DMWIDTH,M_AXIS_BRAM_101_DMWIDTH,M_AXIS_BRAM_100_DMWIDTH,M_AXIS_BRAM_99_DMWIDTH,M_AXIS_BRAM_98_DMWIDTH,M_AXIS_BRAM_97_DMWIDTH,M_AXIS_BRAM_96_DMWIDTH,M_AXIS_BRAM_95_DMWIDTH,M_AXIS_BRAM_94_DMWIDTH,M_AXIS_BRAM_93_DMWIDTH,M_AXIS_BRAM_92_DMWIDTH,M_AXIS_BRAM_91_DMWIDTH,M_AXIS_BRAM_90_DMWIDTH,M_AXIS_BRAM_89_DMWIDTH,M_AXIS_BRAM_88_DMWIDTH,M_AXIS_BRAM_87_DMWIDTH,M_AXIS_BRAM_86_DMWIDTH,M_AXIS_BRAM_85_DMWIDTH,M_AXIS_BRAM_84_DMWIDTH,M_AXIS_BRAM_83_DMWIDTH,M_AXIS_BRAM_82_DMWIDTH,M_AXIS_BRAM_81_DMWIDTH,M_AXIS_BRAM_80_DMWIDTH,M_AXIS_BRAM_79_DMWIDTH,M_AXIS_BRAM_78_DMWIDTH,M_AXIS_BRAM_77_DMWIDTH,M_AXIS_BRAM_76_DMWIDTH,M_AXIS_BRAM_75_DMWIDTH,M_AXIS_BRAM_74_DMWIDTH,M_AXIS_BRAM_73_DMWIDTH,M_AXIS_BRAM_72_DMWIDTH,M_AXIS_BRAM_71_DMWIDTH,M_AXIS_BRAM_70_DMWIDTH,M_AXIS_BRAM_69_DMWIDTH,M_AXIS_BRAM_68_DMWIDTH,M_AXIS_BRAM_67_DMWIDTH,M_AXIS_BRAM_66_DMWIDTH,M_AXIS_BRAM_65_DMWIDTH,M_AXIS_BRAM_64_DMWIDTH,M_AXIS_BRAM_63_DMWIDTH,M_AXIS_BRAM_62_DMWIDTH,M_AXIS_BRAM_61_DMWIDTH,M_AXIS_BRAM_60_DMWIDTH,M_AXIS_BRAM_59_DMWIDTH,M_AXIS_BRAM_58_DMWIDTH,M_AXIS_BRAM_57_DMWIDTH,M_AXIS_BRAM_56_DMWIDTH,M_AXIS_BRAM_55_DMWIDTH,M_AXIS_BRAM_54_DMWIDTH,M_AXIS_BRAM_53_DMWIDTH,M_AXIS_BRAM_52_DMWIDTH,M_AXIS_BRAM_51_DMWIDTH,M_AXIS_BRAM_50_DMWIDTH,M_AXIS_BRAM_49_DMWIDTH,M_AXIS_BRAM_48_DMWIDTH,M_AXIS_BRAM_47_DMWIDTH,M_AXIS_BRAM_46_DMWIDTH,M_AXIS_BRAM_45_DMWIDTH,M_AXIS_BRAM_44_DMWIDTH,M_AXIS_BRAM_43_DMWIDTH,M_AXIS_BRAM_42_DMWIDTH,M_AXIS_BRAM_41_DMWIDTH,M_AXIS_BRAM_40_DMWIDTH,M_AXIS_BRAM_39_DMWIDTH,M_AXIS_BRAM_38_DMWIDTH,M_AXIS_BRAM_37_DMWIDTH,M_AXIS_BRAM_36_DMWIDTH,M_AXIS_BRAM_35_DMWIDTH,M_AXIS_BRAM_34_DMWIDTH,M_AXIS_BRAM_33_DMWIDTH,M_AXIS_BRAM_32_DMWIDTH,M_AXIS_BRAM_31_DMWIDTH,M_AXIS_BRAM_30_DMWIDTH,M_AXIS_BRAM_29_DMWIDTH,M_AXIS_BRAM_28_DMWIDTH,M_AXIS_BRAM_27_DMWIDTH,M_AXIS_BRAM_26_DMWIDTH,M_AXIS_BRAM_25_DMWIDTH,M_AXIS_BRAM_24_DMWIDTH,M_AXIS_BRAM_23_DMWIDTH,M_AXIS_BRAM_22_DMWIDTH,M_AXIS_BRAM_21_DMWIDTH,M_AXIS_BRAM_20_DMWIDTH,M_AXIS_BRAM_19_DMWIDTH,M_AXIS_BRAM_18_DMWIDTH,M_AXIS_BRAM_17_DMWIDTH,M_AXIS_BRAM_16_DMWIDTH,M_AXIS_BRAM_15_DMWIDTH,M_AXIS_BRAM_14_DMWIDTH,M_AXIS_BRAM_13_DMWIDTH,M_AXIS_BRAM_12_DMWIDTH,M_AXIS_BRAM_11_DMWIDTH,M_AXIS_BRAM_10_DMWIDTH,M_AXIS_BRAM_9_DMWIDTH,M_AXIS_BRAM_8_DMWIDTH,M_AXIS_BRAM_7_DMWIDTH,M_AXIS_BRAM_6_DMWIDTH,M_AXIS_BRAM_5_DMWIDTH,M_AXIS_BRAM_4_DMWIDTH,M_AXIS_BRAM_3_DMWIDTH,M_AXIS_BRAM_2_DMWIDTH,M_AXIS_BRAM_1_DMWIDTH,M_AXIS_BRAM_0_DMWIDTH};
    localparam [(C_MAX_OUTPUT_BRAMs*32)-1:0] C_IS_ASYNC_BIT_ARRAY = {M_AXIS_BRAM_127_IS_ASYNC,M_AXIS_BRAM_126_IS_ASYNC,M_AXIS_BRAM_125_IS_ASYNC,M_AXIS_BRAM_124_IS_ASYNC,M_AXIS_BRAM_123_IS_ASYNC,M_AXIS_BRAM_122_IS_ASYNC,M_AXIS_BRAM_121_IS_ASYNC,M_AXIS_BRAM_120_IS_ASYNC,M_AXIS_BRAM_119_IS_ASYNC,M_AXIS_BRAM_118_IS_ASYNC,M_AXIS_BRAM_117_IS_ASYNC,M_AXIS_BRAM_116_IS_ASYNC,M_AXIS_BRAM_115_IS_ASYNC,M_AXIS_BRAM_114_IS_ASYNC,M_AXIS_BRAM_113_IS_ASYNC,M_AXIS_BRAM_112_IS_ASYNC,M_AXIS_BRAM_111_IS_ASYNC,M_AXIS_BRAM_110_IS_ASYNC,M_AXIS_BRAM_109_IS_ASYNC,M_AXIS_BRAM_108_IS_ASYNC,M_AXIS_BRAM_107_IS_ASYNC,M_AXIS_BRAM_106_IS_ASYNC,M_AXIS_BRAM_105_IS_ASYNC,M_AXIS_BRAM_104_IS_ASYNC,M_AXIS_BRAM_103_IS_ASYNC,M_AXIS_BRAM_102_IS_ASYNC,M_AXIS_BRAM_101_IS_ASYNC,M_AXIS_BRAM_100_IS_ASYNC,M_AXIS_BRAM_99_IS_ASYNC,M_AXIS_BRAM_98_IS_ASYNC,M_AXIS_BRAM_97_IS_ASYNC,M_AXIS_BRAM_96_IS_ASYNC,M_AXIS_BRAM_95_IS_ASYNC,M_AXIS_BRAM_94_IS_ASYNC,M_AXIS_BRAM_93_IS_ASYNC,M_AXIS_BRAM_92_IS_ASYNC,M_AXIS_BRAM_91_IS_ASYNC,M_AXIS_BRAM_90_IS_ASYNC,M_AXIS_BRAM_89_IS_ASYNC,M_AXIS_BRAM_88_IS_ASYNC,M_AXIS_BRAM_87_IS_ASYNC,M_AXIS_BRAM_86_IS_ASYNC,M_AXIS_BRAM_85_IS_ASYNC,M_AXIS_BRAM_84_IS_ASYNC,M_AXIS_BRAM_83_IS_ASYNC,M_AXIS_BRAM_82_IS_ASYNC,M_AXIS_BRAM_81_IS_ASYNC,M_AXIS_BRAM_80_IS_ASYNC,M_AXIS_BRAM_79_IS_ASYNC,M_AXIS_BRAM_78_IS_ASYNC,M_AXIS_BRAM_77_IS_ASYNC,M_AXIS_BRAM_76_IS_ASYNC,M_AXIS_BRAM_75_IS_ASYNC,M_AXIS_BRAM_74_IS_ASYNC,M_AXIS_BRAM_73_IS_ASYNC,M_AXIS_BRAM_72_IS_ASYNC,M_AXIS_BRAM_71_IS_ASYNC,M_AXIS_BRAM_70_IS_ASYNC,M_AXIS_BRAM_69_IS_ASYNC,M_AXIS_BRAM_68_IS_ASYNC,M_AXIS_BRAM_67_IS_ASYNC,M_AXIS_BRAM_66_IS_ASYNC,M_AXIS_BRAM_65_IS_ASYNC,M_AXIS_BRAM_64_IS_ASYNC,M_AXIS_BRAM_63_IS_ASYNC,M_AXIS_BRAM_62_IS_ASYNC,M_AXIS_BRAM_61_IS_ASYNC,M_AXIS_BRAM_60_IS_ASYNC,M_AXIS_BRAM_59_IS_ASYNC,M_AXIS_BRAM_58_IS_ASYNC,M_AXIS_BRAM_57_IS_ASYNC,M_AXIS_BRAM_56_IS_ASYNC,M_AXIS_BRAM_55_IS_ASYNC,M_AXIS_BRAM_54_IS_ASYNC,M_AXIS_BRAM_53_IS_ASYNC,M_AXIS_BRAM_52_IS_ASYNC,M_AXIS_BRAM_51_IS_ASYNC,M_AXIS_BRAM_50_IS_ASYNC,M_AXIS_BRAM_49_IS_ASYNC,M_AXIS_BRAM_48_IS_ASYNC,M_AXIS_BRAM_47_IS_ASYNC,M_AXIS_BRAM_46_IS_ASYNC,M_AXIS_BRAM_45_IS_ASYNC,M_AXIS_BRAM_44_IS_ASYNC,M_AXIS_BRAM_43_IS_ASYNC,M_AXIS_BRAM_42_IS_ASYNC,M_AXIS_BRAM_41_IS_ASYNC,M_AXIS_BRAM_40_IS_ASYNC,M_AXIS_BRAM_39_IS_ASYNC,M_AXIS_BRAM_38_IS_ASYNC,M_AXIS_BRAM_37_IS_ASYNC,M_AXIS_BRAM_36_IS_ASYNC,M_AXIS_BRAM_35_IS_ASYNC,M_AXIS_BRAM_34_IS_ASYNC,M_AXIS_BRAM_33_IS_ASYNC,M_AXIS_BRAM_32_IS_ASYNC,M_AXIS_BRAM_31_IS_ASYNC,M_AXIS_BRAM_30_IS_ASYNC,M_AXIS_BRAM_29_IS_ASYNC,M_AXIS_BRAM_28_IS_ASYNC,M_AXIS_BRAM_27_IS_ASYNC,M_AXIS_BRAM_26_IS_ASYNC,M_AXIS_BRAM_25_IS_ASYNC,M_AXIS_BRAM_24_IS_ASYNC,M_AXIS_BRAM_23_IS_ASYNC,M_AXIS_BRAM_22_IS_ASYNC,M_AXIS_BRAM_21_IS_ASYNC,M_AXIS_BRAM_20_IS_ASYNC,M_AXIS_BRAM_19_IS_ASYNC,M_AXIS_BRAM_18_IS_ASYNC,M_AXIS_BRAM_17_IS_ASYNC,M_AXIS_BRAM_16_IS_ASYNC,M_AXIS_BRAM_15_IS_ASYNC,M_AXIS_BRAM_14_IS_ASYNC,M_AXIS_BRAM_13_IS_ASYNC,M_AXIS_BRAM_12_IS_ASYNC,M_AXIS_BRAM_11_IS_ASYNC,M_AXIS_BRAM_10_IS_ASYNC,M_AXIS_BRAM_9_IS_ASYNC,M_AXIS_BRAM_8_IS_ASYNC,M_AXIS_BRAM_7_IS_ASYNC,M_AXIS_BRAM_6_IS_ASYNC,M_AXIS_BRAM_5_IS_ASYNC,M_AXIS_BRAM_4_IS_ASYNC,M_AXIS_BRAM_3_IS_ASYNC,M_AXIS_BRAM_2_IS_ASYNC,M_AXIS_BRAM_1_IS_ASYNC,M_AXIS_BRAM_0_IS_ASYNC};
    localparam [C_MAX_OUTPUT_BRAMs*32-1:0] C_ADDR_BIT_ARRAY = {M_AXIS_BRAM_127_ADDR_WIDTH,M_AXIS_BRAM_126_ADDR_WIDTH,M_AXIS_BRAM_125_ADDR_WIDTH,M_AXIS_BRAM_124_ADDR_WIDTH,M_AXIS_BRAM_123_ADDR_WIDTH,M_AXIS_BRAM_122_ADDR_WIDTH,M_AXIS_BRAM_121_ADDR_WIDTH,M_AXIS_BRAM_120_ADDR_WIDTH,M_AXIS_BRAM_119_ADDR_WIDTH,M_AXIS_BRAM_118_ADDR_WIDTH,M_AXIS_BRAM_117_ADDR_WIDTH,M_AXIS_BRAM_116_ADDR_WIDTH,M_AXIS_BRAM_115_ADDR_WIDTH,M_AXIS_BRAM_114_ADDR_WIDTH,M_AXIS_BRAM_113_ADDR_WIDTH,M_AXIS_BRAM_112_ADDR_WIDTH,M_AXIS_BRAM_111_ADDR_WIDTH,M_AXIS_BRAM_110_ADDR_WIDTH,M_AXIS_BRAM_109_ADDR_WIDTH,M_AXIS_BRAM_108_ADDR_WIDTH,M_AXIS_BRAM_107_ADDR_WIDTH,M_AXIS_BRAM_106_ADDR_WIDTH,M_AXIS_BRAM_105_ADDR_WIDTH,M_AXIS_BRAM_104_ADDR_WIDTH,M_AXIS_BRAM_103_ADDR_WIDTH,M_AXIS_BRAM_102_ADDR_WIDTH,M_AXIS_BRAM_101_ADDR_WIDTH,M_AXIS_BRAM_100_ADDR_WIDTH,M_AXIS_BRAM_99_ADDR_WIDTH,M_AXIS_BRAM_98_ADDR_WIDTH,M_AXIS_BRAM_97_ADDR_WIDTH,M_AXIS_BRAM_96_ADDR_WIDTH,M_AXIS_BRAM_95_ADDR_WIDTH,M_AXIS_BRAM_94_ADDR_WIDTH,M_AXIS_BRAM_93_ADDR_WIDTH,M_AXIS_BRAM_92_ADDR_WIDTH,M_AXIS_BRAM_91_ADDR_WIDTH,M_AXIS_BRAM_90_ADDR_WIDTH,M_AXIS_BRAM_89_ADDR_WIDTH,M_AXIS_BRAM_88_ADDR_WIDTH,M_AXIS_BRAM_87_ADDR_WIDTH,M_AXIS_BRAM_86_ADDR_WIDTH,M_AXIS_BRAM_85_ADDR_WIDTH,M_AXIS_BRAM_84_ADDR_WIDTH,M_AXIS_BRAM_83_ADDR_WIDTH,M_AXIS_BRAM_82_ADDR_WIDTH,M_AXIS_BRAM_81_ADDR_WIDTH,M_AXIS_BRAM_80_ADDR_WIDTH,M_AXIS_BRAM_79_ADDR_WIDTH,M_AXIS_BRAM_78_ADDR_WIDTH,M_AXIS_BRAM_77_ADDR_WIDTH,M_AXIS_BRAM_76_ADDR_WIDTH,M_AXIS_BRAM_75_ADDR_WIDTH,M_AXIS_BRAM_74_ADDR_WIDTH,M_AXIS_BRAM_73_ADDR_WIDTH,M_AXIS_BRAM_72_ADDR_WIDTH,M_AXIS_BRAM_71_ADDR_WIDTH,M_AXIS_BRAM_70_ADDR_WIDTH,M_AXIS_BRAM_69_ADDR_WIDTH,M_AXIS_BRAM_68_ADDR_WIDTH,M_AXIS_BRAM_67_ADDR_WIDTH,M_AXIS_BRAM_66_ADDR_WIDTH,M_AXIS_BRAM_65_ADDR_WIDTH,M_AXIS_BRAM_64_ADDR_WIDTH,M_AXIS_BRAM_63_ADDR_WIDTH,M_AXIS_BRAM_62_ADDR_WIDTH,M_AXIS_BRAM_61_ADDR_WIDTH,M_AXIS_BRAM_60_ADDR_WIDTH,M_AXIS_BRAM_59_ADDR_WIDTH,M_AXIS_BRAM_58_ADDR_WIDTH,M_AXIS_BRAM_57_ADDR_WIDTH,M_AXIS_BRAM_56_ADDR_WIDTH,M_AXIS_BRAM_55_ADDR_WIDTH,M_AXIS_BRAM_54_ADDR_WIDTH,M_AXIS_BRAM_53_ADDR_WIDTH,M_AXIS_BRAM_52_ADDR_WIDTH,M_AXIS_BRAM_51_ADDR_WIDTH,M_AXIS_BRAM_50_ADDR_WIDTH,M_AXIS_BRAM_49_ADDR_WIDTH,M_AXIS_BRAM_48_ADDR_WIDTH,M_AXIS_BRAM_47_ADDR_WIDTH,M_AXIS_BRAM_46_ADDR_WIDTH,M_AXIS_BRAM_45_ADDR_WIDTH,M_AXIS_BRAM_44_ADDR_WIDTH,M_AXIS_BRAM_43_ADDR_WIDTH,M_AXIS_BRAM_42_ADDR_WIDTH,M_AXIS_BRAM_41_ADDR_WIDTH,M_AXIS_BRAM_40_ADDR_WIDTH,M_AXIS_BRAM_39_ADDR_WIDTH,M_AXIS_BRAM_38_ADDR_WIDTH,M_AXIS_BRAM_37_ADDR_WIDTH,M_AXIS_BRAM_36_ADDR_WIDTH,M_AXIS_BRAM_35_ADDR_WIDTH,M_AXIS_BRAM_34_ADDR_WIDTH,M_AXIS_BRAM_33_ADDR_WIDTH,M_AXIS_BRAM_32_ADDR_WIDTH,M_AXIS_BRAM_31_ADDR_WIDTH,M_AXIS_BRAM_30_ADDR_WIDTH,M_AXIS_BRAM_29_ADDR_WIDTH,M_AXIS_BRAM_28_ADDR_WIDTH,M_AXIS_BRAM_27_ADDR_WIDTH,M_AXIS_BRAM_26_ADDR_WIDTH,M_AXIS_BRAM_25_ADDR_WIDTH,M_AXIS_BRAM_24_ADDR_WIDTH,M_AXIS_BRAM_23_ADDR_WIDTH,M_AXIS_BRAM_22_ADDR_WIDTH,M_AXIS_BRAM_21_ADDR_WIDTH,M_AXIS_BRAM_20_ADDR_WIDTH,M_AXIS_BRAM_19_ADDR_WIDTH,M_AXIS_BRAM_18_ADDR_WIDTH,M_AXIS_BRAM_17_ADDR_WIDTH,M_AXIS_BRAM_16_ADDR_WIDTH,M_AXIS_BRAM_15_ADDR_WIDTH,M_AXIS_BRAM_14_ADDR_WIDTH,M_AXIS_BRAM_13_ADDR_WIDTH,M_AXIS_BRAM_12_ADDR_WIDTH,M_AXIS_BRAM_11_ADDR_WIDTH,M_AXIS_BRAM_10_ADDR_WIDTH,M_AXIS_BRAM_9_ADDR_WIDTH,M_AXIS_BRAM_8_ADDR_WIDTH,M_AXIS_BRAM_7_ADDR_WIDTH,M_AXIS_BRAM_6_ADDR_WIDTH,M_AXIS_BRAM_5_ADDR_WIDTH,M_AXIS_BRAM_4_ADDR_WIDTH,M_AXIS_BRAM_3_ADDR_WIDTH,M_AXIS_BRAM_2_ADDR_WIDTH,M_AXIS_BRAM_1_ADDR_WIDTH,M_AXIS_BRAM_0_ADDR_WIDTH};
    localparam [C_MAX_OUTPUT_BRAMs*32-1:0] C_MB_DEPTH_BIT_ARRAY = {M_AXIS_BRAM_127_MB_DEPTH,M_AXIS_BRAM_126_MB_DEPTH,M_AXIS_BRAM_125_MB_DEPTH,M_AXIS_BRAM_124_MB_DEPTH,M_AXIS_BRAM_123_MB_DEPTH,M_AXIS_BRAM_122_MB_DEPTH,M_AXIS_BRAM_121_MB_DEPTH,M_AXIS_BRAM_120_MB_DEPTH,M_AXIS_BRAM_119_MB_DEPTH,M_AXIS_BRAM_118_MB_DEPTH,M_AXIS_BRAM_117_MB_DEPTH,M_AXIS_BRAM_116_MB_DEPTH,M_AXIS_BRAM_115_MB_DEPTH,M_AXIS_BRAM_114_MB_DEPTH,M_AXIS_BRAM_113_MB_DEPTH,M_AXIS_BRAM_112_MB_DEPTH,M_AXIS_BRAM_111_MB_DEPTH,M_AXIS_BRAM_110_MB_DEPTH,M_AXIS_BRAM_109_MB_DEPTH,M_AXIS_BRAM_108_MB_DEPTH,M_AXIS_BRAM_107_MB_DEPTH,M_AXIS_BRAM_106_MB_DEPTH,M_AXIS_BRAM_105_MB_DEPTH,M_AXIS_BRAM_104_MB_DEPTH,M_AXIS_BRAM_103_MB_DEPTH,M_AXIS_BRAM_102_MB_DEPTH,M_AXIS_BRAM_101_MB_DEPTH,M_AXIS_BRAM_100_MB_DEPTH,M_AXIS_BRAM_99_MB_DEPTH,M_AXIS_BRAM_98_MB_DEPTH,M_AXIS_BRAM_97_MB_DEPTH,M_AXIS_BRAM_96_MB_DEPTH,M_AXIS_BRAM_95_MB_DEPTH,M_AXIS_BRAM_94_MB_DEPTH,M_AXIS_BRAM_93_MB_DEPTH,M_AXIS_BRAM_92_MB_DEPTH,M_AXIS_BRAM_91_MB_DEPTH,M_AXIS_BRAM_90_MB_DEPTH,M_AXIS_BRAM_89_MB_DEPTH,M_AXIS_BRAM_88_MB_DEPTH,M_AXIS_BRAM_87_MB_DEPTH,M_AXIS_BRAM_86_MB_DEPTH,M_AXIS_BRAM_85_MB_DEPTH,M_AXIS_BRAM_84_MB_DEPTH,M_AXIS_BRAM_83_MB_DEPTH,M_AXIS_BRAM_82_MB_DEPTH,M_AXIS_BRAM_81_MB_DEPTH,M_AXIS_BRAM_80_MB_DEPTH,M_AXIS_BRAM_79_MB_DEPTH,M_AXIS_BRAM_78_MB_DEPTH,M_AXIS_BRAM_77_MB_DEPTH,M_AXIS_BRAM_76_MB_DEPTH,M_AXIS_BRAM_75_MB_DEPTH,M_AXIS_BRAM_74_MB_DEPTH,M_AXIS_BRAM_73_MB_DEPTH,M_AXIS_BRAM_72_MB_DEPTH,M_AXIS_BRAM_71_MB_DEPTH,M_AXIS_BRAM_70_MB_DEPTH,M_AXIS_BRAM_69_MB_DEPTH,M_AXIS_BRAM_68_MB_DEPTH,M_AXIS_BRAM_67_MB_DEPTH,M_AXIS_BRAM_66_MB_DEPTH,M_AXIS_BRAM_65_MB_DEPTH,M_AXIS_BRAM_64_MB_DEPTH,M_AXIS_BRAM_63_MB_DEPTH,M_AXIS_BRAM_62_MB_DEPTH,M_AXIS_BRAM_61_MB_DEPTH,M_AXIS_BRAM_60_MB_DEPTH,M_AXIS_BRAM_59_MB_DEPTH,M_AXIS_BRAM_58_MB_DEPTH,M_AXIS_BRAM_57_MB_DEPTH,M_AXIS_BRAM_56_MB_DEPTH,M_AXIS_BRAM_55_MB_DEPTH,M_AXIS_BRAM_54_MB_DEPTH,M_AXIS_BRAM_53_MB_DEPTH,M_AXIS_BRAM_52_MB_DEPTH,M_AXIS_BRAM_51_MB_DEPTH,M_AXIS_BRAM_50_MB_DEPTH,M_AXIS_BRAM_49_MB_DEPTH,M_AXIS_BRAM_48_MB_DEPTH,M_AXIS_BRAM_47_MB_DEPTH,M_AXIS_BRAM_46_MB_DEPTH,M_AXIS_BRAM_45_MB_DEPTH,M_AXIS_BRAM_44_MB_DEPTH,M_AXIS_BRAM_43_MB_DEPTH,M_AXIS_BRAM_42_MB_DEPTH,M_AXIS_BRAM_41_MB_DEPTH,M_AXIS_BRAM_40_MB_DEPTH,M_AXIS_BRAM_39_MB_DEPTH,M_AXIS_BRAM_38_MB_DEPTH,M_AXIS_BRAM_37_MB_DEPTH,M_AXIS_BRAM_36_MB_DEPTH,M_AXIS_BRAM_35_MB_DEPTH,M_AXIS_BRAM_34_MB_DEPTH,M_AXIS_BRAM_33_MB_DEPTH,M_AXIS_BRAM_32_MB_DEPTH,M_AXIS_BRAM_31_MB_DEPTH,M_AXIS_BRAM_30_MB_DEPTH,M_AXIS_BRAM_29_MB_DEPTH,M_AXIS_BRAM_28_MB_DEPTH,M_AXIS_BRAM_27_MB_DEPTH,M_AXIS_BRAM_26_MB_DEPTH,M_AXIS_BRAM_25_MB_DEPTH,M_AXIS_BRAM_24_MB_DEPTH,M_AXIS_BRAM_23_MB_DEPTH,M_AXIS_BRAM_22_MB_DEPTH,M_AXIS_BRAM_21_MB_DEPTH,M_AXIS_BRAM_20_MB_DEPTH,M_AXIS_BRAM_19_MB_DEPTH,M_AXIS_BRAM_18_MB_DEPTH,M_AXIS_BRAM_17_MB_DEPTH,M_AXIS_BRAM_16_MB_DEPTH,M_AXIS_BRAM_15_MB_DEPTH,M_AXIS_BRAM_14_MB_DEPTH,M_AXIS_BRAM_13_MB_DEPTH,M_AXIS_BRAM_12_MB_DEPTH,M_AXIS_BRAM_11_MB_DEPTH,M_AXIS_BRAM_10_MB_DEPTH,M_AXIS_BRAM_9_MB_DEPTH,M_AXIS_BRAM_8_MB_DEPTH,M_AXIS_BRAM_7_MB_DEPTH,M_AXIS_BRAM_6_MB_DEPTH,M_AXIS_BRAM_5_MB_DEPTH,M_AXIS_BRAM_4_MB_DEPTH,M_AXIS_BRAM_3_MB_DEPTH,M_AXIS_BRAM_2_MB_DEPTH,M_AXIS_BRAM_1_MB_DEPTH,M_AXIS_BRAM_0_MB_DEPTH};
    
    wire [C_NUM_OUTPUT_BRAMs-1:0] axis_clk;
    wire [C_NUM_OUTPUT_BRAMs-1:0] axis_rst;
    
    wire [31:0] fifo_depth [C_NUM_OUTPUT_BRAMs-1:0];
    wire [C_NUM_OUTPUT_BRAMs-1:0] fifo_depth_empty;
    wire [C_NUM_OUTPUT_BRAMs-1:0] fifo_depth_read;
    
    wire [C_NUM_OUTPUT_BRAMs-1:0] dwconv1_tlast;
    wire [C_NUM_OUTPUT_BRAMs-1:0] dwconv1_tvalid;
    wire [C_MAX_BIT_WIDTH-1:0] dwconv1_tdata [C_NUM_OUTPUT_BRAMs-1:0];
    wire [C_NUM_OUTPUT_BRAMs-1:0] dwconv1_tready;
    wire [C_MAX_BIT_WIDTH/8-1:0] dwconv1_tkeep [C_NUM_OUTPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH/8-1:0] dwconv1_tstrb [C_NUM_OUTPUT_BRAMs-1:0];
    
    wire [C_NUM_OUTPUT_BRAMs-1:0] buf1_tlast;
    wire [C_NUM_OUTPUT_BRAMs-1:0] buf1_tvalid;
    wire [C_MAX_BIT_WIDTH-1:0] buf1_tdata [C_NUM_OUTPUT_BRAMs-1:0];
    wire [C_NUM_OUTPUT_BRAMs-1:0] buf1_tready;

    wire [C_NUM_OUTPUT_BRAMs-1:0] out_tlast;
    wire [C_NUM_OUTPUT_BRAMs-1:0] out_tvalid;
    wire [C_MAX_BIT_WIDTH-1:0] out_tdata [C_NUM_OUTPUT_BRAMs-1:0];
    wire [C_NUM_OUTPUT_BRAMs-1:0] out_tready;
    
    wire [C_MAX_BIT_WIDTH-1:0] addr0 [C_NUM_OUTPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0] addr1 [C_NUM_OUTPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0] din0 [C_NUM_OUTPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0] din1 [C_NUM_OUTPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0] dout0 [C_NUM_OUTPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0] dout1 [C_NUM_OUTPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH/8-1:0] we0 [C_NUM_OUTPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH/8-1:0] we1 [C_NUM_OUTPUT_BRAMs-1:0];
    wire [C_NUM_OUTPUT_BRAMs-1:0] en0;
    wire [C_NUM_OUTPUT_BRAMs-1:0] en1;
    
    //assign inputs to buses, and buses to outputs
    generate
        if(C_NUM_OUTPUT_BRAMs > 0) begin
            assign addr0[0][M_AXIS_BRAM_0_ADDR_WIDTH-1:0] = ap_bram_0_addr0;
            assign din0[0][M_AXIS_BRAM_0_WIDTH-1:0] = ap_bram_0_din0;
            assign ap_bram_0_dout0 = dout0[0][M_AXIS_BRAM_0_WIDTH-1:0];
            assign we0[0][M_AXIS_BRAM_0_WIDTH/8-1:0] = ap_bram_0_we0;
            assign en0[0] = ap_bram_0_en0;
            assign addr1[0][M_AXIS_BRAM_0_ADDR_WIDTH-1:0] = ap_bram_0_addr1;
            assign din1[0][M_AXIS_BRAM_0_WIDTH-1:0] = ap_bram_0_din1;
            assign ap_bram_0_dout1 = dout1[0][M_AXIS_BRAM_0_WIDTH-1:0];
            assign we1[0][M_AXIS_BRAM_0_WIDTH/8-1:0] = ap_bram_0_we1;
            assign en1[0] = ap_bram_0_en1;
            
            assign axis_clk[0] = m_axis_bram_0_aclk;
            assign axis_rst[0] = m_axis_bram_0_aresetn;
            assign dwconv1_tready[0] = m_axis_bram_0_tready;
            assign m_axis_bram_0_tlast = dwconv1_tlast[0];
            assign m_axis_bram_0_tvalid = dwconv1_tvalid[0];
            assign m_axis_bram_0_tkeep = dwconv1_tkeep[0][M_AXIS_BRAM_0_DMWIDTH/8-1:0];
            assign m_axis_bram_0_tstrb = dwconv1_tstrb[0][M_AXIS_BRAM_0_DMWIDTH/8-1:0];
            assign m_axis_bram_0_tdata = dwconv1_tdata[0][M_AXIS_BRAM_0_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 1) begin
            assign addr0[1][M_AXIS_BRAM_1_ADDR_WIDTH-1:0] = ap_bram_1_addr0;
            assign din0[1][M_AXIS_BRAM_1_WIDTH-1:0] = ap_bram_1_din0;
            assign ap_bram_1_dout0 = dout0[1][M_AXIS_BRAM_1_WIDTH-1:0];
            assign we0[1][M_AXIS_BRAM_1_WIDTH/8-1:0] = ap_bram_1_we0;
            assign en0[1] = ap_bram_1_en0;
            assign addr1[1][M_AXIS_BRAM_1_ADDR_WIDTH-1:0] = ap_bram_1_addr1;
            assign din1[1][M_AXIS_BRAM_1_WIDTH-1:0] = ap_bram_1_din1;
            assign ap_bram_1_dout1 = dout1[1][M_AXIS_BRAM_1_WIDTH-1:0];
            assign we1[1][M_AXIS_BRAM_1_WIDTH/8-1:0] = ap_bram_1_we1;
            assign en1[1] = ap_bram_1_en1;
            
            assign axis_clk[1] = m_axis_bram_1_aclk;
            assign axis_rst[1] = m_axis_bram_1_aresetn;
            assign dwconv1_tready[1] = m_axis_bram_1_tready;
            assign m_axis_bram_1_tlast = dwconv1_tlast[1];
            assign m_axis_bram_1_tvalid = dwconv1_tvalid[1];
            assign m_axis_bram_1_tkeep = dwconv1_tkeep[1][M_AXIS_BRAM_1_DMWIDTH/8-1:0];
            assign m_axis_bram_1_tstrb = dwconv1_tstrb[1][M_AXIS_BRAM_1_DMWIDTH/8-1:0];
            assign m_axis_bram_1_tdata = dwconv1_tdata[1][M_AXIS_BRAM_1_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 2) begin
            assign addr0[2][M_AXIS_BRAM_2_ADDR_WIDTH-1:0] = ap_bram_2_addr0;
            assign din0[2][M_AXIS_BRAM_2_WIDTH-1:0] = ap_bram_2_din0;
            assign ap_bram_2_dout0 = dout0[2][M_AXIS_BRAM_2_WIDTH-1:0];
            assign we0[2][M_AXIS_BRAM_2_WIDTH/8-1:0] = ap_bram_2_we0;
            assign en0[2] = ap_bram_2_en0;
            assign addr1[2][M_AXIS_BRAM_2_ADDR_WIDTH-1:0] = ap_bram_2_addr1;
            assign din1[2][M_AXIS_BRAM_2_WIDTH-1:0] = ap_bram_2_din1;
            assign ap_bram_2_dout1 = dout1[2][M_AXIS_BRAM_2_WIDTH-1:0];
            assign we1[2][M_AXIS_BRAM_2_WIDTH/8-1:0] = ap_bram_2_we1;
            assign en1[2] = ap_bram_2_en1;
            
            assign axis_clk[2] = m_axis_bram_2_aclk;
            assign axis_rst[2] = m_axis_bram_2_aresetn;
            assign dwconv1_tready[2] = m_axis_bram_2_tready;
            assign m_axis_bram_2_tlast = dwconv1_tlast[2];
            assign m_axis_bram_2_tvalid = dwconv1_tvalid[2];
            assign m_axis_bram_2_tkeep = dwconv1_tkeep[2][M_AXIS_BRAM_2_DMWIDTH/8-1:0];
            assign m_axis_bram_2_tstrb = dwconv1_tstrb[2][M_AXIS_BRAM_2_DMWIDTH/8-1:0];
            assign m_axis_bram_2_tdata = dwconv1_tdata[2][M_AXIS_BRAM_2_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 3) begin
            assign addr0[3][M_AXIS_BRAM_3_ADDR_WIDTH-1:0] = ap_bram_3_addr0;
            assign din0[3][M_AXIS_BRAM_3_WIDTH-1:0] = ap_bram_3_din0;
            assign ap_bram_3_dout0 = dout0[3][M_AXIS_BRAM_3_WIDTH-1:0];
            assign we0[3][M_AXIS_BRAM_3_WIDTH/8-1:0] = ap_bram_3_we0;
            assign en0[3] = ap_bram_3_en0;
            assign addr1[3][M_AXIS_BRAM_3_ADDR_WIDTH-1:0] = ap_bram_3_addr1;
            assign din1[3][M_AXIS_BRAM_3_WIDTH-1:0] = ap_bram_3_din1;
            assign ap_bram_3_dout1 = dout1[3][M_AXIS_BRAM_3_WIDTH-1:0];
            assign we1[3][M_AXIS_BRAM_3_WIDTH/8-1:0] = ap_bram_3_we1;
            assign en1[3] = ap_bram_3_en1;
            
            assign axis_clk[3] = m_axis_bram_3_aclk;
            assign axis_rst[3] = m_axis_bram_3_aresetn;
            assign dwconv1_tready[3] = m_axis_bram_3_tready;
            assign m_axis_bram_3_tlast = dwconv1_tlast[3];
            assign m_axis_bram_3_tvalid = dwconv1_tvalid[3];
            assign m_axis_bram_3_tkeep = dwconv1_tkeep[3][M_AXIS_BRAM_3_DMWIDTH/8-1:0];
            assign m_axis_bram_3_tstrb = dwconv1_tstrb[3][M_AXIS_BRAM_3_DMWIDTH/8-1:0];
            assign m_axis_bram_3_tdata = dwconv1_tdata[3][M_AXIS_BRAM_3_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 4) begin
            assign addr0[4][M_AXIS_BRAM_4_ADDR_WIDTH-1:0] = ap_bram_4_addr0;
            assign din0[4][M_AXIS_BRAM_4_WIDTH-1:0] = ap_bram_4_din0;
            assign ap_bram_4_dout0 = dout0[4][M_AXIS_BRAM_4_WIDTH-1:0];
            assign we0[4][M_AXIS_BRAM_4_WIDTH/8-1:0] = ap_bram_4_we0;
            assign en0[4] = ap_bram_4_en0;
            assign addr1[4][M_AXIS_BRAM_4_ADDR_WIDTH-1:0] = ap_bram_4_addr1;
            assign din1[4][M_AXIS_BRAM_4_WIDTH-1:0] = ap_bram_4_din1;
            assign ap_bram_4_dout1 = dout1[4][M_AXIS_BRAM_4_WIDTH-1:0];
            assign we1[4][M_AXIS_BRAM_4_WIDTH/8-1:0] = ap_bram_4_we1;
            assign en1[4] = ap_bram_4_en1;
            
            assign axis_clk[4] = m_axis_bram_4_aclk;
            assign axis_rst[4] = m_axis_bram_4_aresetn;
            assign dwconv1_tready[4] = m_axis_bram_4_tready;
            assign m_axis_bram_4_tlast = dwconv1_tlast[4];
            assign m_axis_bram_4_tvalid = dwconv1_tvalid[4];
            assign m_axis_bram_4_tkeep = dwconv1_tkeep[4][M_AXIS_BRAM_4_DMWIDTH/8-1:0];
            assign m_axis_bram_4_tstrb = dwconv1_tstrb[4][M_AXIS_BRAM_4_DMWIDTH/8-1:0];
            assign m_axis_bram_4_tdata = dwconv1_tdata[4][M_AXIS_BRAM_4_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 5) begin
            assign addr0[5][M_AXIS_BRAM_5_ADDR_WIDTH-1:0] = ap_bram_5_addr0;
            assign din0[5][M_AXIS_BRAM_5_WIDTH-1:0] = ap_bram_5_din0;
            assign ap_bram_5_dout0 = dout0[5][M_AXIS_BRAM_5_WIDTH-1:0];
            assign we0[5][M_AXIS_BRAM_5_WIDTH/8-1:0] = ap_bram_5_we0;
            assign en0[5] = ap_bram_5_en0;
            assign addr1[5][M_AXIS_BRAM_5_ADDR_WIDTH-1:0] = ap_bram_5_addr1;
            assign din1[5][M_AXIS_BRAM_5_WIDTH-1:0] = ap_bram_5_din1;
            assign ap_bram_5_dout1 = dout1[5][M_AXIS_BRAM_5_WIDTH-1:0];
            assign we1[5][M_AXIS_BRAM_5_WIDTH/8-1:0] = ap_bram_5_we1;
            assign en1[5] = ap_bram_5_en1;
            
            assign axis_clk[5] = m_axis_bram_5_aclk;
            assign axis_rst[5] = m_axis_bram_5_aresetn;
            assign dwconv1_tready[5] = m_axis_bram_5_tready;
            assign m_axis_bram_5_tlast = dwconv1_tlast[5];
            assign m_axis_bram_5_tvalid = dwconv1_tvalid[5];
            assign m_axis_bram_5_tkeep = dwconv1_tkeep[5][M_AXIS_BRAM_5_DMWIDTH/8-1:0];
            assign m_axis_bram_5_tstrb = dwconv1_tstrb[5][M_AXIS_BRAM_5_DMWIDTH/8-1:0];
            assign m_axis_bram_5_tdata = dwconv1_tdata[5][M_AXIS_BRAM_5_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 6) begin
            assign addr0[6][M_AXIS_BRAM_6_ADDR_WIDTH-1:0] = ap_bram_6_addr0;
            assign din0[6][M_AXIS_BRAM_6_WIDTH-1:0] = ap_bram_6_din0;
            assign ap_bram_6_dout0 = dout0[6][M_AXIS_BRAM_6_WIDTH-1:0];
            assign we0[6][M_AXIS_BRAM_6_WIDTH/8-1:0] = ap_bram_6_we0;
            assign en0[6] = ap_bram_6_en0;
            assign addr1[6][M_AXIS_BRAM_6_ADDR_WIDTH-1:0] = ap_bram_6_addr1;
            assign din1[6][M_AXIS_BRAM_6_WIDTH-1:0] = ap_bram_6_din1;
            assign ap_bram_6_dout1 = dout1[6][M_AXIS_BRAM_6_WIDTH-1:0];
            assign we1[6][M_AXIS_BRAM_6_WIDTH/8-1:0] = ap_bram_6_we1;
            assign en1[6] = ap_bram_6_en1;
            
            assign axis_clk[6] = m_axis_bram_6_aclk;
            assign axis_rst[6] = m_axis_bram_6_aresetn;
            assign dwconv1_tready[6] = m_axis_bram_6_tready;
            assign m_axis_bram_6_tlast = dwconv1_tlast[6];
            assign m_axis_bram_6_tvalid = dwconv1_tvalid[6];
            assign m_axis_bram_6_tkeep = dwconv1_tkeep[6][M_AXIS_BRAM_6_DMWIDTH/8-1:0];
            assign m_axis_bram_6_tstrb = dwconv1_tstrb[6][M_AXIS_BRAM_6_DMWIDTH/8-1:0];
            assign m_axis_bram_6_tdata = dwconv1_tdata[6][M_AXIS_BRAM_6_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 7) begin
            assign addr0[7][M_AXIS_BRAM_7_ADDR_WIDTH-1:0] = ap_bram_7_addr0;
            assign din0[7][M_AXIS_BRAM_7_WIDTH-1:0] = ap_bram_7_din0;
            assign ap_bram_7_dout0 = dout0[7][M_AXIS_BRAM_7_WIDTH-1:0];
            assign we0[7][M_AXIS_BRAM_7_WIDTH/8-1:0] = ap_bram_7_we0;
            assign en0[7] = ap_bram_7_en0;
            assign addr1[7][M_AXIS_BRAM_7_ADDR_WIDTH-1:0] = ap_bram_7_addr1;
            assign din1[7][M_AXIS_BRAM_7_WIDTH-1:0] = ap_bram_7_din1;
            assign ap_bram_7_dout1 = dout1[7][M_AXIS_BRAM_7_WIDTH-1:0];
            assign we1[7][M_AXIS_BRAM_7_WIDTH/8-1:0] = ap_bram_7_we1;
            assign en1[7] = ap_bram_7_en1;
            
            assign axis_clk[7] = m_axis_bram_7_aclk;
            assign axis_rst[7] = m_axis_bram_7_aresetn;
            assign dwconv1_tready[7] = m_axis_bram_7_tready;
            assign m_axis_bram_7_tlast = dwconv1_tlast[7];
            assign m_axis_bram_7_tvalid = dwconv1_tvalid[7];
            assign m_axis_bram_7_tkeep = dwconv1_tkeep[7][M_AXIS_BRAM_7_DMWIDTH/8-1:0];
            assign m_axis_bram_7_tstrb = dwconv1_tstrb[7][M_AXIS_BRAM_7_DMWIDTH/8-1:0];
            assign m_axis_bram_7_tdata = dwconv1_tdata[7][M_AXIS_BRAM_7_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 8) begin
            assign addr0[8][M_AXIS_BRAM_8_ADDR_WIDTH-1:0] = ap_bram_8_addr0;
            assign din0[8][M_AXIS_BRAM_8_WIDTH-1:0] = ap_bram_8_din0;
            assign ap_bram_8_dout0 = dout0[8][M_AXIS_BRAM_8_WIDTH-1:0];
            assign we0[8][M_AXIS_BRAM_8_WIDTH/8-1:0] = ap_bram_8_we0;
            assign en0[8] = ap_bram_8_en0;
            assign addr1[8][M_AXIS_BRAM_8_ADDR_WIDTH-1:0] = ap_bram_8_addr1;
            assign din1[8][M_AXIS_BRAM_8_WIDTH-1:0] = ap_bram_8_din1;
            assign ap_bram_8_dout1 = dout1[8][M_AXIS_BRAM_8_WIDTH-1:0];
            assign we1[8][M_AXIS_BRAM_8_WIDTH/8-1:0] = ap_bram_8_we1;
            assign en1[8] = ap_bram_8_en1;
            
            assign axis_clk[8] = m_axis_bram_8_aclk;
            assign axis_rst[8] = m_axis_bram_8_aresetn;
            assign dwconv1_tready[8] = m_axis_bram_8_tready;
            assign m_axis_bram_8_tlast = dwconv1_tlast[8];
            assign m_axis_bram_8_tvalid = dwconv1_tvalid[8];
            assign m_axis_bram_8_tkeep = dwconv1_tkeep[8][M_AXIS_BRAM_8_DMWIDTH/8-1:0];
            assign m_axis_bram_8_tstrb = dwconv1_tstrb[8][M_AXIS_BRAM_8_DMWIDTH/8-1:0];
            assign m_axis_bram_8_tdata = dwconv1_tdata[8][M_AXIS_BRAM_8_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 9) begin
            assign addr0[9][M_AXIS_BRAM_9_ADDR_WIDTH-1:0] = ap_bram_9_addr0;
            assign din0[9][M_AXIS_BRAM_9_WIDTH-1:0] = ap_bram_9_din0;
            assign ap_bram_9_dout0 = dout0[9][M_AXIS_BRAM_9_WIDTH-1:0];
            assign we0[9][M_AXIS_BRAM_9_WIDTH/8-1:0] = ap_bram_9_we0;
            assign en0[9] = ap_bram_9_en0;
            assign addr1[9][M_AXIS_BRAM_9_ADDR_WIDTH-1:0] = ap_bram_9_addr1;
            assign din1[9][M_AXIS_BRAM_9_WIDTH-1:0] = ap_bram_9_din1;
            assign ap_bram_9_dout1 = dout1[9][M_AXIS_BRAM_9_WIDTH-1:0];
            assign we1[9][M_AXIS_BRAM_9_WIDTH/8-1:0] = ap_bram_9_we1;
            assign en1[9] = ap_bram_9_en1;
            
            assign axis_clk[9] = m_axis_bram_9_aclk;
            assign axis_rst[9] = m_axis_bram_9_aresetn;
            assign dwconv1_tready[9] = m_axis_bram_9_tready;
            assign m_axis_bram_9_tlast = dwconv1_tlast[9];
            assign m_axis_bram_9_tvalid = dwconv1_tvalid[9];
            assign m_axis_bram_9_tkeep = dwconv1_tkeep[9][M_AXIS_BRAM_9_DMWIDTH/8-1:0];
            assign m_axis_bram_9_tstrb = dwconv1_tstrb[9][M_AXIS_BRAM_9_DMWIDTH/8-1:0];
            assign m_axis_bram_9_tdata = dwconv1_tdata[9][M_AXIS_BRAM_9_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 10) begin
            assign addr0[10][M_AXIS_BRAM_10_ADDR_WIDTH-1:0] = ap_bram_10_addr0;
            assign din0[10][M_AXIS_BRAM_10_WIDTH-1:0] = ap_bram_10_din0;
            assign ap_bram_10_dout0 = dout0[10][M_AXIS_BRAM_10_WIDTH-1:0];
            assign we0[10][M_AXIS_BRAM_10_WIDTH/8-1:0] = ap_bram_10_we0;
            assign en0[10] = ap_bram_10_en0;
            assign addr1[10][M_AXIS_BRAM_10_ADDR_WIDTH-1:0] = ap_bram_10_addr1;
            assign din1[10][M_AXIS_BRAM_10_WIDTH-1:0] = ap_bram_10_din1;
            assign ap_bram_10_dout1 = dout1[10][M_AXIS_BRAM_10_WIDTH-1:0];
            assign we1[10][M_AXIS_BRAM_10_WIDTH/8-1:0] = ap_bram_10_we1;
            assign en1[10] = ap_bram_10_en1;
            
            assign axis_clk[10] = m_axis_bram_10_aclk;
            assign axis_rst[10] = m_axis_bram_10_aresetn;
            assign dwconv1_tready[10] = m_axis_bram_10_tready;
            assign m_axis_bram_10_tlast = dwconv1_tlast[10];
            assign m_axis_bram_10_tvalid = dwconv1_tvalid[10];
            assign m_axis_bram_10_tkeep = dwconv1_tkeep[10][M_AXIS_BRAM_10_DMWIDTH/8-1:0];
            assign m_axis_bram_10_tstrb = dwconv1_tstrb[10][M_AXIS_BRAM_10_DMWIDTH/8-1:0];
            assign m_axis_bram_10_tdata = dwconv1_tdata[10][M_AXIS_BRAM_10_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 11) begin
            assign addr0[11][M_AXIS_BRAM_11_ADDR_WIDTH-1:0] = ap_bram_11_addr0;
            assign din0[11][M_AXIS_BRAM_11_WIDTH-1:0] = ap_bram_11_din0;
            assign ap_bram_11_dout0 = dout0[11][M_AXIS_BRAM_11_WIDTH-1:0];
            assign we0[11][M_AXIS_BRAM_11_WIDTH/8-1:0] = ap_bram_11_we0;
            assign en0[11] = ap_bram_11_en0;
            assign addr1[11][M_AXIS_BRAM_11_ADDR_WIDTH-1:0] = ap_bram_11_addr1;
            assign din1[11][M_AXIS_BRAM_11_WIDTH-1:0] = ap_bram_11_din1;
            assign ap_bram_11_dout1 = dout1[11][M_AXIS_BRAM_11_WIDTH-1:0];
            assign we1[11][M_AXIS_BRAM_11_WIDTH/8-1:0] = ap_bram_11_we1;
            assign en1[11] = ap_bram_11_en1;
            
            assign axis_clk[11] = m_axis_bram_11_aclk;
            assign axis_rst[11] = m_axis_bram_11_aresetn;
            assign dwconv1_tready[11] = m_axis_bram_11_tready;
            assign m_axis_bram_11_tlast = dwconv1_tlast[11];
            assign m_axis_bram_11_tvalid = dwconv1_tvalid[11];
            assign m_axis_bram_11_tkeep = dwconv1_tkeep[11][M_AXIS_BRAM_11_DMWIDTH/8-1:0];
            assign m_axis_bram_11_tstrb = dwconv1_tstrb[11][M_AXIS_BRAM_11_DMWIDTH/8-1:0];
            assign m_axis_bram_11_tdata = dwconv1_tdata[11][M_AXIS_BRAM_11_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 12) begin
            assign addr0[12][M_AXIS_BRAM_12_ADDR_WIDTH-1:0] = ap_bram_12_addr0;
            assign din0[12][M_AXIS_BRAM_12_WIDTH-1:0] = ap_bram_12_din0;
            assign ap_bram_12_dout0 = dout0[12][M_AXIS_BRAM_12_WIDTH-1:0];
            assign we0[12][M_AXIS_BRAM_12_WIDTH/8-1:0] = ap_bram_12_we0;
            assign en0[12] = ap_bram_12_en0;
            assign addr1[12][M_AXIS_BRAM_12_ADDR_WIDTH-1:0] = ap_bram_12_addr1;
            assign din1[12][M_AXIS_BRAM_12_WIDTH-1:0] = ap_bram_12_din1;
            assign ap_bram_12_dout1 = dout1[12][M_AXIS_BRAM_12_WIDTH-1:0];
            assign we1[12][M_AXIS_BRAM_12_WIDTH/8-1:0] = ap_bram_12_we1;
            assign en1[12] = ap_bram_12_en1;
            
            assign axis_clk[12] = m_axis_bram_12_aclk;
            assign axis_rst[12] = m_axis_bram_12_aresetn;
            assign dwconv1_tready[12] = m_axis_bram_12_tready;
            assign m_axis_bram_12_tlast = dwconv1_tlast[12];
            assign m_axis_bram_12_tvalid = dwconv1_tvalid[12];
            assign m_axis_bram_12_tkeep = dwconv1_tkeep[12][M_AXIS_BRAM_12_DMWIDTH/8-1:0];
            assign m_axis_bram_12_tstrb = dwconv1_tstrb[12][M_AXIS_BRAM_12_DMWIDTH/8-1:0];
            assign m_axis_bram_12_tdata = dwconv1_tdata[12][M_AXIS_BRAM_12_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 13) begin
            assign addr0[13][M_AXIS_BRAM_13_ADDR_WIDTH-1:0] = ap_bram_13_addr0;
            assign din0[13][M_AXIS_BRAM_13_WIDTH-1:0] = ap_bram_13_din0;
            assign ap_bram_13_dout0 = dout0[13][M_AXIS_BRAM_13_WIDTH-1:0];
            assign we0[13][M_AXIS_BRAM_13_WIDTH/8-1:0] = ap_bram_13_we0;
            assign en0[13] = ap_bram_13_en0;
            assign addr1[13][M_AXIS_BRAM_13_ADDR_WIDTH-1:0] = ap_bram_13_addr1;
            assign din1[13][M_AXIS_BRAM_13_WIDTH-1:0] = ap_bram_13_din1;
            assign ap_bram_13_dout1 = dout1[13][M_AXIS_BRAM_13_WIDTH-1:0];
            assign we1[13][M_AXIS_BRAM_13_WIDTH/8-1:0] = ap_bram_13_we1;
            assign en1[13] = ap_bram_13_en1;
            
            assign axis_clk[13] = m_axis_bram_13_aclk;
            assign axis_rst[13] = m_axis_bram_13_aresetn;
            assign dwconv1_tready[13] = m_axis_bram_13_tready;
            assign m_axis_bram_13_tlast = dwconv1_tlast[13];
            assign m_axis_bram_13_tvalid = dwconv1_tvalid[13];
            assign m_axis_bram_13_tkeep = dwconv1_tkeep[13][M_AXIS_BRAM_13_DMWIDTH/8-1:0];
            assign m_axis_bram_13_tstrb = dwconv1_tstrb[13][M_AXIS_BRAM_13_DMWIDTH/8-1:0];
            assign m_axis_bram_13_tdata = dwconv1_tdata[13][M_AXIS_BRAM_13_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 14) begin
            assign addr0[14][M_AXIS_BRAM_14_ADDR_WIDTH-1:0] = ap_bram_14_addr0;
            assign din0[14][M_AXIS_BRAM_14_WIDTH-1:0] = ap_bram_14_din0;
            assign ap_bram_14_dout0 = dout0[14][M_AXIS_BRAM_14_WIDTH-1:0];
            assign we0[14][M_AXIS_BRAM_14_WIDTH/8-1:0] = ap_bram_14_we0;
            assign en0[14] = ap_bram_14_en0;
            assign addr1[14][M_AXIS_BRAM_14_ADDR_WIDTH-1:0] = ap_bram_14_addr1;
            assign din1[14][M_AXIS_BRAM_14_WIDTH-1:0] = ap_bram_14_din1;
            assign ap_bram_14_dout1 = dout1[14][M_AXIS_BRAM_14_WIDTH-1:0];
            assign we1[14][M_AXIS_BRAM_14_WIDTH/8-1:0] = ap_bram_14_we1;
            assign en1[14] = ap_bram_14_en1;
            
            assign axis_clk[14] = m_axis_bram_14_aclk;
            assign axis_rst[14] = m_axis_bram_14_aresetn;
            assign dwconv1_tready[14] = m_axis_bram_14_tready;
            assign m_axis_bram_14_tlast = dwconv1_tlast[14];
            assign m_axis_bram_14_tvalid = dwconv1_tvalid[14];
            assign m_axis_bram_14_tkeep = dwconv1_tkeep[14][M_AXIS_BRAM_14_DMWIDTH/8-1:0];
            assign m_axis_bram_14_tstrb = dwconv1_tstrb[14][M_AXIS_BRAM_14_DMWIDTH/8-1:0];
            assign m_axis_bram_14_tdata = dwconv1_tdata[14][M_AXIS_BRAM_14_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 15) begin
            assign addr0[15][M_AXIS_BRAM_15_ADDR_WIDTH-1:0] = ap_bram_15_addr0;
            assign din0[15][M_AXIS_BRAM_15_WIDTH-1:0] = ap_bram_15_din0;
            assign ap_bram_15_dout0 = dout0[15][M_AXIS_BRAM_15_WIDTH-1:0];
            assign we0[15][M_AXIS_BRAM_15_WIDTH/8-1:0] = ap_bram_15_we0;
            assign en0[15] = ap_bram_15_en0;
            assign addr1[15][M_AXIS_BRAM_15_ADDR_WIDTH-1:0] = ap_bram_15_addr1;
            assign din1[15][M_AXIS_BRAM_15_WIDTH-1:0] = ap_bram_15_din1;
            assign ap_bram_15_dout1 = dout1[15][M_AXIS_BRAM_15_WIDTH-1:0];
            assign we1[15][M_AXIS_BRAM_15_WIDTH/8-1:0] = ap_bram_15_we1;
            assign en1[15] = ap_bram_15_en1;
            
            assign axis_clk[15] = m_axis_bram_15_aclk;
            assign axis_rst[15] = m_axis_bram_15_aresetn;
            assign dwconv1_tready[15] = m_axis_bram_15_tready;
            assign m_axis_bram_15_tlast = dwconv1_tlast[15];
            assign m_axis_bram_15_tvalid = dwconv1_tvalid[15];
            assign m_axis_bram_15_tkeep = dwconv1_tkeep[15][M_AXIS_BRAM_15_DMWIDTH/8-1:0];
            assign m_axis_bram_15_tstrb = dwconv1_tstrb[15][M_AXIS_BRAM_15_DMWIDTH/8-1:0];
            assign m_axis_bram_15_tdata = dwconv1_tdata[15][M_AXIS_BRAM_15_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 16) begin
            assign addr0[16][M_AXIS_BRAM_16_ADDR_WIDTH-1:0] = ap_bram_16_addr0;
            assign din0[16][M_AXIS_BRAM_16_WIDTH-1:0] = ap_bram_16_din0;
            assign ap_bram_16_dout0 = dout0[16][M_AXIS_BRAM_16_WIDTH-1:0];
            assign we0[16][M_AXIS_BRAM_16_WIDTH/8-1:0] = ap_bram_16_we0;
            assign en0[16] = ap_bram_16_en0;
            assign addr1[16][M_AXIS_BRAM_16_ADDR_WIDTH-1:0] = ap_bram_16_addr1;
            assign din1[16][M_AXIS_BRAM_16_WIDTH-1:0] = ap_bram_16_din1;
            assign ap_bram_16_dout1 = dout1[16][M_AXIS_BRAM_16_WIDTH-1:0];
            assign we1[16][M_AXIS_BRAM_16_WIDTH/8-1:0] = ap_bram_16_we1;
            assign en1[16] = ap_bram_16_en1;
            
            assign axis_clk[16] = m_axis_bram_16_aclk;
            assign axis_rst[16] = m_axis_bram_16_aresetn;
            assign dwconv1_tready[16] = m_axis_bram_16_tready;
            assign m_axis_bram_16_tlast = dwconv1_tlast[16];
            assign m_axis_bram_16_tvalid = dwconv1_tvalid[16];
            assign m_axis_bram_16_tkeep = dwconv1_tkeep[16][M_AXIS_BRAM_16_DMWIDTH/8-1:0];
            assign m_axis_bram_16_tstrb = dwconv1_tstrb[16][M_AXIS_BRAM_16_DMWIDTH/8-1:0];
            assign m_axis_bram_16_tdata = dwconv1_tdata[16][M_AXIS_BRAM_16_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 17) begin
            assign addr0[17][M_AXIS_BRAM_17_ADDR_WIDTH-1:0] = ap_bram_17_addr0;
            assign din0[17][M_AXIS_BRAM_17_WIDTH-1:0] = ap_bram_17_din0;
            assign ap_bram_17_dout0 = dout0[17][M_AXIS_BRAM_17_WIDTH-1:0];
            assign we0[17][M_AXIS_BRAM_17_WIDTH/8-1:0] = ap_bram_17_we0;
            assign en0[17] = ap_bram_17_en0;
            assign addr1[17][M_AXIS_BRAM_17_ADDR_WIDTH-1:0] = ap_bram_17_addr1;
            assign din1[17][M_AXIS_BRAM_17_WIDTH-1:0] = ap_bram_17_din1;
            assign ap_bram_17_dout1 = dout1[17][M_AXIS_BRAM_17_WIDTH-1:0];
            assign we1[17][M_AXIS_BRAM_17_WIDTH/8-1:0] = ap_bram_17_we1;
            assign en1[17] = ap_bram_17_en1;
            
            assign axis_clk[17] = m_axis_bram_17_aclk;
            assign axis_rst[17] = m_axis_bram_17_aresetn;
            assign dwconv1_tready[17] = m_axis_bram_17_tready;
            assign m_axis_bram_17_tlast = dwconv1_tlast[17];
            assign m_axis_bram_17_tvalid = dwconv1_tvalid[17];
            assign m_axis_bram_17_tkeep = dwconv1_tkeep[17][M_AXIS_BRAM_17_DMWIDTH/8-1:0];
            assign m_axis_bram_17_tstrb = dwconv1_tstrb[17][M_AXIS_BRAM_17_DMWIDTH/8-1:0];
            assign m_axis_bram_17_tdata = dwconv1_tdata[17][M_AXIS_BRAM_17_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 18) begin
            assign addr0[18][M_AXIS_BRAM_18_ADDR_WIDTH-1:0] = ap_bram_18_addr0;
            assign din0[18][M_AXIS_BRAM_18_WIDTH-1:0] = ap_bram_18_din0;
            assign ap_bram_18_dout0 = dout0[18][M_AXIS_BRAM_18_WIDTH-1:0];
            assign we0[18][M_AXIS_BRAM_18_WIDTH/8-1:0] = ap_bram_18_we0;
            assign en0[18] = ap_bram_18_en0;
            assign addr1[18][M_AXIS_BRAM_18_ADDR_WIDTH-1:0] = ap_bram_18_addr1;
            assign din1[18][M_AXIS_BRAM_18_WIDTH-1:0] = ap_bram_18_din1;
            assign ap_bram_18_dout1 = dout1[18][M_AXIS_BRAM_18_WIDTH-1:0];
            assign we1[18][M_AXIS_BRAM_18_WIDTH/8-1:0] = ap_bram_18_we1;
            assign en1[18] = ap_bram_18_en1;
            
            assign axis_clk[18] = m_axis_bram_18_aclk;
            assign axis_rst[18] = m_axis_bram_18_aresetn;
            assign dwconv1_tready[18] = m_axis_bram_18_tready;
            assign m_axis_bram_18_tlast = dwconv1_tlast[18];
            assign m_axis_bram_18_tvalid = dwconv1_tvalid[18];
            assign m_axis_bram_18_tkeep = dwconv1_tkeep[18][M_AXIS_BRAM_18_DMWIDTH/8-1:0];
            assign m_axis_bram_18_tstrb = dwconv1_tstrb[18][M_AXIS_BRAM_18_DMWIDTH/8-1:0];
            assign m_axis_bram_18_tdata = dwconv1_tdata[18][M_AXIS_BRAM_18_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 19) begin
            assign addr0[19][M_AXIS_BRAM_19_ADDR_WIDTH-1:0] = ap_bram_19_addr0;
            assign din0[19][M_AXIS_BRAM_19_WIDTH-1:0] = ap_bram_19_din0;
            assign ap_bram_19_dout0 = dout0[19][M_AXIS_BRAM_19_WIDTH-1:0];
            assign we0[19][M_AXIS_BRAM_19_WIDTH/8-1:0] = ap_bram_19_we0;
            assign en0[19] = ap_bram_19_en0;
            assign addr1[19][M_AXIS_BRAM_19_ADDR_WIDTH-1:0] = ap_bram_19_addr1;
            assign din1[19][M_AXIS_BRAM_19_WIDTH-1:0] = ap_bram_19_din1;
            assign ap_bram_19_dout1 = dout1[19][M_AXIS_BRAM_19_WIDTH-1:0];
            assign we1[19][M_AXIS_BRAM_19_WIDTH/8-1:0] = ap_bram_19_we1;
            assign en1[19] = ap_bram_19_en1;
            
            assign axis_clk[19] = m_axis_bram_19_aclk;
            assign axis_rst[19] = m_axis_bram_19_aresetn;
            assign dwconv1_tready[19] = m_axis_bram_19_tready;
            assign m_axis_bram_19_tlast = dwconv1_tlast[19];
            assign m_axis_bram_19_tvalid = dwconv1_tvalid[19];
            assign m_axis_bram_19_tkeep = dwconv1_tkeep[19][M_AXIS_BRAM_19_DMWIDTH/8-1:0];
            assign m_axis_bram_19_tstrb = dwconv1_tstrb[19][M_AXIS_BRAM_19_DMWIDTH/8-1:0];
            assign m_axis_bram_19_tdata = dwconv1_tdata[19][M_AXIS_BRAM_19_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 20) begin
            assign addr0[20][M_AXIS_BRAM_20_ADDR_WIDTH-1:0] = ap_bram_20_addr0;
            assign din0[20][M_AXIS_BRAM_20_WIDTH-1:0] = ap_bram_20_din0;
            assign ap_bram_20_dout0 = dout0[20][M_AXIS_BRAM_20_WIDTH-1:0];
            assign we0[20][M_AXIS_BRAM_20_WIDTH/8-1:0] = ap_bram_20_we0;
            assign en0[20] = ap_bram_20_en0;
            assign addr1[20][M_AXIS_BRAM_20_ADDR_WIDTH-1:0] = ap_bram_20_addr1;
            assign din1[20][M_AXIS_BRAM_20_WIDTH-1:0] = ap_bram_20_din1;
            assign ap_bram_20_dout1 = dout1[20][M_AXIS_BRAM_20_WIDTH-1:0];
            assign we1[20][M_AXIS_BRAM_20_WIDTH/8-1:0] = ap_bram_20_we1;
            assign en1[20] = ap_bram_20_en1;
            
            assign axis_clk[20] = m_axis_bram_20_aclk;
            assign axis_rst[20] = m_axis_bram_20_aresetn;
            assign dwconv1_tready[20] = m_axis_bram_20_tready;
            assign m_axis_bram_20_tlast = dwconv1_tlast[20];
            assign m_axis_bram_20_tvalid = dwconv1_tvalid[20];
            assign m_axis_bram_20_tkeep = dwconv1_tkeep[20][M_AXIS_BRAM_20_DMWIDTH/8-1:0];
            assign m_axis_bram_20_tstrb = dwconv1_tstrb[20][M_AXIS_BRAM_20_DMWIDTH/8-1:0];
            assign m_axis_bram_20_tdata = dwconv1_tdata[20][M_AXIS_BRAM_20_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 21) begin
            assign addr0[21][M_AXIS_BRAM_21_ADDR_WIDTH-1:0] = ap_bram_21_addr0;
            assign din0[21][M_AXIS_BRAM_21_WIDTH-1:0] = ap_bram_21_din0;
            assign ap_bram_21_dout0 = dout0[21][M_AXIS_BRAM_21_WIDTH-1:0];
            assign we0[21][M_AXIS_BRAM_21_WIDTH/8-1:0] = ap_bram_21_we0;
            assign en0[21] = ap_bram_21_en0;
            assign addr1[21][M_AXIS_BRAM_21_ADDR_WIDTH-1:0] = ap_bram_21_addr1;
            assign din1[21][M_AXIS_BRAM_21_WIDTH-1:0] = ap_bram_21_din1;
            assign ap_bram_21_dout1 = dout1[21][M_AXIS_BRAM_21_WIDTH-1:0];
            assign we1[21][M_AXIS_BRAM_21_WIDTH/8-1:0] = ap_bram_21_we1;
            assign en1[21] = ap_bram_21_en1;
            
            assign axis_clk[21] = m_axis_bram_21_aclk;
            assign axis_rst[21] = m_axis_bram_21_aresetn;
            assign dwconv1_tready[21] = m_axis_bram_21_tready;
            assign m_axis_bram_21_tlast = dwconv1_tlast[21];
            assign m_axis_bram_21_tvalid = dwconv1_tvalid[21];
            assign m_axis_bram_21_tkeep = dwconv1_tkeep[21][M_AXIS_BRAM_21_DMWIDTH/8-1:0];
            assign m_axis_bram_21_tstrb = dwconv1_tstrb[21][M_AXIS_BRAM_21_DMWIDTH/8-1:0];
            assign m_axis_bram_21_tdata = dwconv1_tdata[21][M_AXIS_BRAM_21_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 22) begin
            assign addr0[22][M_AXIS_BRAM_22_ADDR_WIDTH-1:0] = ap_bram_22_addr0;
            assign din0[22][M_AXIS_BRAM_22_WIDTH-1:0] = ap_bram_22_din0;
            assign ap_bram_22_dout0 = dout0[22][M_AXIS_BRAM_22_WIDTH-1:0];
            assign we0[22][M_AXIS_BRAM_22_WIDTH/8-1:0] = ap_bram_22_we0;
            assign en0[22] = ap_bram_22_en0;
            assign addr1[22][M_AXIS_BRAM_22_ADDR_WIDTH-1:0] = ap_bram_22_addr1;
            assign din1[22][M_AXIS_BRAM_22_WIDTH-1:0] = ap_bram_22_din1;
            assign ap_bram_22_dout1 = dout1[22][M_AXIS_BRAM_22_WIDTH-1:0];
            assign we1[22][M_AXIS_BRAM_22_WIDTH/8-1:0] = ap_bram_22_we1;
            assign en1[22] = ap_bram_22_en1;
            
            assign axis_clk[22] = m_axis_bram_22_aclk;
            assign axis_rst[22] = m_axis_bram_22_aresetn;
            assign dwconv1_tready[22] = m_axis_bram_22_tready;
            assign m_axis_bram_22_tlast = dwconv1_tlast[22];
            assign m_axis_bram_22_tvalid = dwconv1_tvalid[22];
            assign m_axis_bram_22_tkeep = dwconv1_tkeep[22][M_AXIS_BRAM_22_DMWIDTH/8-1:0];
            assign m_axis_bram_22_tstrb = dwconv1_tstrb[22][M_AXIS_BRAM_22_DMWIDTH/8-1:0];
            assign m_axis_bram_22_tdata = dwconv1_tdata[22][M_AXIS_BRAM_22_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 23) begin
            assign addr0[23][M_AXIS_BRAM_23_ADDR_WIDTH-1:0] = ap_bram_23_addr0;
            assign din0[23][M_AXIS_BRAM_23_WIDTH-1:0] = ap_bram_23_din0;
            assign ap_bram_23_dout0 = dout0[23][M_AXIS_BRAM_23_WIDTH-1:0];
            assign we0[23][M_AXIS_BRAM_23_WIDTH/8-1:0] = ap_bram_23_we0;
            assign en0[23] = ap_bram_23_en0;
            assign addr1[23][M_AXIS_BRAM_23_ADDR_WIDTH-1:0] = ap_bram_23_addr1;
            assign din1[23][M_AXIS_BRAM_23_WIDTH-1:0] = ap_bram_23_din1;
            assign ap_bram_23_dout1 = dout1[23][M_AXIS_BRAM_23_WIDTH-1:0];
            assign we1[23][M_AXIS_BRAM_23_WIDTH/8-1:0] = ap_bram_23_we1;
            assign en1[23] = ap_bram_23_en1;
            
            assign axis_clk[23] = m_axis_bram_23_aclk;
            assign axis_rst[23] = m_axis_bram_23_aresetn;
            assign dwconv1_tready[23] = m_axis_bram_23_tready;
            assign m_axis_bram_23_tlast = dwconv1_tlast[23];
            assign m_axis_bram_23_tvalid = dwconv1_tvalid[23];
            assign m_axis_bram_23_tkeep = dwconv1_tkeep[23][M_AXIS_BRAM_23_DMWIDTH/8-1:0];
            assign m_axis_bram_23_tstrb = dwconv1_tstrb[23][M_AXIS_BRAM_23_DMWIDTH/8-1:0];
            assign m_axis_bram_23_tdata = dwconv1_tdata[23][M_AXIS_BRAM_23_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 24) begin
            assign addr0[24][M_AXIS_BRAM_24_ADDR_WIDTH-1:0] = ap_bram_24_addr0;
            assign din0[24][M_AXIS_BRAM_24_WIDTH-1:0] = ap_bram_24_din0;
            assign ap_bram_24_dout0 = dout0[24][M_AXIS_BRAM_24_WIDTH-1:0];
            assign we0[24][M_AXIS_BRAM_24_WIDTH/8-1:0] = ap_bram_24_we0;
            assign en0[24] = ap_bram_24_en0;
            assign addr1[24][M_AXIS_BRAM_24_ADDR_WIDTH-1:0] = ap_bram_24_addr1;
            assign din1[24][M_AXIS_BRAM_24_WIDTH-1:0] = ap_bram_24_din1;
            assign ap_bram_24_dout1 = dout1[24][M_AXIS_BRAM_24_WIDTH-1:0];
            assign we1[24][M_AXIS_BRAM_24_WIDTH/8-1:0] = ap_bram_24_we1;
            assign en1[24] = ap_bram_24_en1;
            
            assign axis_clk[24] = m_axis_bram_24_aclk;
            assign axis_rst[24] = m_axis_bram_24_aresetn;
            assign dwconv1_tready[24] = m_axis_bram_24_tready;
            assign m_axis_bram_24_tlast = dwconv1_tlast[24];
            assign m_axis_bram_24_tvalid = dwconv1_tvalid[24];
            assign m_axis_bram_24_tkeep = dwconv1_tkeep[24][M_AXIS_BRAM_24_DMWIDTH/8-1:0];
            assign m_axis_bram_24_tstrb = dwconv1_tstrb[24][M_AXIS_BRAM_24_DMWIDTH/8-1:0];
            assign m_axis_bram_24_tdata = dwconv1_tdata[24][M_AXIS_BRAM_24_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 25) begin
            assign addr0[25][M_AXIS_BRAM_25_ADDR_WIDTH-1:0] = ap_bram_25_addr0;
            assign din0[25][M_AXIS_BRAM_25_WIDTH-1:0] = ap_bram_25_din0;
            assign ap_bram_25_dout0 = dout0[25][M_AXIS_BRAM_25_WIDTH-1:0];
            assign we0[25][M_AXIS_BRAM_25_WIDTH/8-1:0] = ap_bram_25_we0;
            assign en0[25] = ap_bram_25_en0;
            assign addr1[25][M_AXIS_BRAM_25_ADDR_WIDTH-1:0] = ap_bram_25_addr1;
            assign din1[25][M_AXIS_BRAM_25_WIDTH-1:0] = ap_bram_25_din1;
            assign ap_bram_25_dout1 = dout1[25][M_AXIS_BRAM_25_WIDTH-1:0];
            assign we1[25][M_AXIS_BRAM_25_WIDTH/8-1:0] = ap_bram_25_we1;
            assign en1[25] = ap_bram_25_en1;
            
            assign axis_clk[25] = m_axis_bram_25_aclk;
            assign axis_rst[25] = m_axis_bram_25_aresetn;
            assign dwconv1_tready[25] = m_axis_bram_25_tready;
            assign m_axis_bram_25_tlast = dwconv1_tlast[25];
            assign m_axis_bram_25_tvalid = dwconv1_tvalid[25];
            assign m_axis_bram_25_tkeep = dwconv1_tkeep[25][M_AXIS_BRAM_25_DMWIDTH/8-1:0];
            assign m_axis_bram_25_tstrb = dwconv1_tstrb[25][M_AXIS_BRAM_25_DMWIDTH/8-1:0];
            assign m_axis_bram_25_tdata = dwconv1_tdata[25][M_AXIS_BRAM_25_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 26) begin
            assign addr0[26][M_AXIS_BRAM_26_ADDR_WIDTH-1:0] = ap_bram_26_addr0;
            assign din0[26][M_AXIS_BRAM_26_WIDTH-1:0] = ap_bram_26_din0;
            assign ap_bram_26_dout0 = dout0[26][M_AXIS_BRAM_26_WIDTH-1:0];
            assign we0[26][M_AXIS_BRAM_26_WIDTH/8-1:0] = ap_bram_26_we0;
            assign en0[26] = ap_bram_26_en0;
            assign addr1[26][M_AXIS_BRAM_26_ADDR_WIDTH-1:0] = ap_bram_26_addr1;
            assign din1[26][M_AXIS_BRAM_26_WIDTH-1:0] = ap_bram_26_din1;
            assign ap_bram_26_dout1 = dout1[26][M_AXIS_BRAM_26_WIDTH-1:0];
            assign we1[26][M_AXIS_BRAM_26_WIDTH/8-1:0] = ap_bram_26_we1;
            assign en1[26] = ap_bram_26_en1;
            
            assign axis_clk[26] = m_axis_bram_26_aclk;
            assign axis_rst[26] = m_axis_bram_26_aresetn;
            assign dwconv1_tready[26] = m_axis_bram_26_tready;
            assign m_axis_bram_26_tlast = dwconv1_tlast[26];
            assign m_axis_bram_26_tvalid = dwconv1_tvalid[26];
            assign m_axis_bram_26_tkeep = dwconv1_tkeep[26][M_AXIS_BRAM_26_DMWIDTH/8-1:0];
            assign m_axis_bram_26_tstrb = dwconv1_tstrb[26][M_AXIS_BRAM_26_DMWIDTH/8-1:0];
            assign m_axis_bram_26_tdata = dwconv1_tdata[26][M_AXIS_BRAM_26_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 27) begin
            assign addr0[27][M_AXIS_BRAM_27_ADDR_WIDTH-1:0] = ap_bram_27_addr0;
            assign din0[27][M_AXIS_BRAM_27_WIDTH-1:0] = ap_bram_27_din0;
            assign ap_bram_27_dout0 = dout0[27][M_AXIS_BRAM_27_WIDTH-1:0];
            assign we0[27][M_AXIS_BRAM_27_WIDTH/8-1:0] = ap_bram_27_we0;
            assign en0[27] = ap_bram_27_en0;
            assign addr1[27][M_AXIS_BRAM_27_ADDR_WIDTH-1:0] = ap_bram_27_addr1;
            assign din1[27][M_AXIS_BRAM_27_WIDTH-1:0] = ap_bram_27_din1;
            assign ap_bram_27_dout1 = dout1[27][M_AXIS_BRAM_27_WIDTH-1:0];
            assign we1[27][M_AXIS_BRAM_27_WIDTH/8-1:0] = ap_bram_27_we1;
            assign en1[27] = ap_bram_27_en1;
            
            assign axis_clk[27] = m_axis_bram_27_aclk;
            assign axis_rst[27] = m_axis_bram_27_aresetn;
            assign dwconv1_tready[27] = m_axis_bram_27_tready;
            assign m_axis_bram_27_tlast = dwconv1_tlast[27];
            assign m_axis_bram_27_tvalid = dwconv1_tvalid[27];
            assign m_axis_bram_27_tkeep = dwconv1_tkeep[27][M_AXIS_BRAM_27_DMWIDTH/8-1:0];
            assign m_axis_bram_27_tstrb = dwconv1_tstrb[27][M_AXIS_BRAM_27_DMWIDTH/8-1:0];
            assign m_axis_bram_27_tdata = dwconv1_tdata[27][M_AXIS_BRAM_27_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 28) begin
            assign addr0[28][M_AXIS_BRAM_28_ADDR_WIDTH-1:0] = ap_bram_28_addr0;
            assign din0[28][M_AXIS_BRAM_28_WIDTH-1:0] = ap_bram_28_din0;
            assign ap_bram_28_dout0 = dout0[28][M_AXIS_BRAM_28_WIDTH-1:0];
            assign we0[28][M_AXIS_BRAM_28_WIDTH/8-1:0] = ap_bram_28_we0;
            assign en0[28] = ap_bram_28_en0;
            assign addr1[28][M_AXIS_BRAM_28_ADDR_WIDTH-1:0] = ap_bram_28_addr1;
            assign din1[28][M_AXIS_BRAM_28_WIDTH-1:0] = ap_bram_28_din1;
            assign ap_bram_28_dout1 = dout1[28][M_AXIS_BRAM_28_WIDTH-1:0];
            assign we1[28][M_AXIS_BRAM_28_WIDTH/8-1:0] = ap_bram_28_we1;
            assign en1[28] = ap_bram_28_en1;
            
            assign axis_clk[28] = m_axis_bram_28_aclk;
            assign axis_rst[28] = m_axis_bram_28_aresetn;
            assign dwconv1_tready[28] = m_axis_bram_28_tready;
            assign m_axis_bram_28_tlast = dwconv1_tlast[28];
            assign m_axis_bram_28_tvalid = dwconv1_tvalid[28];
            assign m_axis_bram_28_tkeep = dwconv1_tkeep[28][M_AXIS_BRAM_28_DMWIDTH/8-1:0];
            assign m_axis_bram_28_tstrb = dwconv1_tstrb[28][M_AXIS_BRAM_28_DMWIDTH/8-1:0];
            assign m_axis_bram_28_tdata = dwconv1_tdata[28][M_AXIS_BRAM_28_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 29) begin
            assign addr0[29][M_AXIS_BRAM_29_ADDR_WIDTH-1:0] = ap_bram_29_addr0;
            assign din0[29][M_AXIS_BRAM_29_WIDTH-1:0] = ap_bram_29_din0;
            assign ap_bram_29_dout0 = dout0[29][M_AXIS_BRAM_29_WIDTH-1:0];
            assign we0[29][M_AXIS_BRAM_29_WIDTH/8-1:0] = ap_bram_29_we0;
            assign en0[29] = ap_bram_29_en0;
            assign addr1[29][M_AXIS_BRAM_29_ADDR_WIDTH-1:0] = ap_bram_29_addr1;
            assign din1[29][M_AXIS_BRAM_29_WIDTH-1:0] = ap_bram_29_din1;
            assign ap_bram_29_dout1 = dout1[29][M_AXIS_BRAM_29_WIDTH-1:0];
            assign we1[29][M_AXIS_BRAM_29_WIDTH/8-1:0] = ap_bram_29_we1;
            assign en1[29] = ap_bram_29_en1;
            
            assign axis_clk[29] = m_axis_bram_29_aclk;
            assign axis_rst[29] = m_axis_bram_29_aresetn;
            assign dwconv1_tready[29] = m_axis_bram_29_tready;
            assign m_axis_bram_29_tlast = dwconv1_tlast[29];
            assign m_axis_bram_29_tvalid = dwconv1_tvalid[29];
            assign m_axis_bram_29_tkeep = dwconv1_tkeep[29][M_AXIS_BRAM_29_DMWIDTH/8-1:0];
            assign m_axis_bram_29_tstrb = dwconv1_tstrb[29][M_AXIS_BRAM_29_DMWIDTH/8-1:0];
            assign m_axis_bram_29_tdata = dwconv1_tdata[29][M_AXIS_BRAM_29_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 30) begin
            assign addr0[30][M_AXIS_BRAM_30_ADDR_WIDTH-1:0] = ap_bram_30_addr0;
            assign din0[30][M_AXIS_BRAM_30_WIDTH-1:0] = ap_bram_30_din0;
            assign ap_bram_30_dout0 = dout0[30][M_AXIS_BRAM_30_WIDTH-1:0];
            assign we0[30][M_AXIS_BRAM_30_WIDTH/8-1:0] = ap_bram_30_we0;
            assign en0[30] = ap_bram_30_en0;
            assign addr1[30][M_AXIS_BRAM_30_ADDR_WIDTH-1:0] = ap_bram_30_addr1;
            assign din1[30][M_AXIS_BRAM_30_WIDTH-1:0] = ap_bram_30_din1;
            assign ap_bram_30_dout1 = dout1[30][M_AXIS_BRAM_30_WIDTH-1:0];
            assign we1[30][M_AXIS_BRAM_30_WIDTH/8-1:0] = ap_bram_30_we1;
            assign en1[30] = ap_bram_30_en1;
            
            assign axis_clk[30] = m_axis_bram_30_aclk;
            assign axis_rst[30] = m_axis_bram_30_aresetn;
            assign dwconv1_tready[30] = m_axis_bram_30_tready;
            assign m_axis_bram_30_tlast = dwconv1_tlast[30];
            assign m_axis_bram_30_tvalid = dwconv1_tvalid[30];
            assign m_axis_bram_30_tkeep = dwconv1_tkeep[30][M_AXIS_BRAM_30_DMWIDTH/8-1:0];
            assign m_axis_bram_30_tstrb = dwconv1_tstrb[30][M_AXIS_BRAM_30_DMWIDTH/8-1:0];
            assign m_axis_bram_30_tdata = dwconv1_tdata[30][M_AXIS_BRAM_30_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 31) begin
            assign addr0[31][M_AXIS_BRAM_31_ADDR_WIDTH-1:0] = ap_bram_31_addr0;
            assign din0[31][M_AXIS_BRAM_31_WIDTH-1:0] = ap_bram_31_din0;
            assign ap_bram_31_dout0 = dout0[31][M_AXIS_BRAM_31_WIDTH-1:0];
            assign we0[31][M_AXIS_BRAM_31_WIDTH/8-1:0] = ap_bram_31_we0;
            assign en0[31] = ap_bram_31_en0;
            assign addr1[31][M_AXIS_BRAM_31_ADDR_WIDTH-1:0] = ap_bram_31_addr1;
            assign din1[31][M_AXIS_BRAM_31_WIDTH-1:0] = ap_bram_31_din1;
            assign ap_bram_31_dout1 = dout1[31][M_AXIS_BRAM_31_WIDTH-1:0];
            assign we1[31][M_AXIS_BRAM_31_WIDTH/8-1:0] = ap_bram_31_we1;
            assign en1[31] = ap_bram_31_en1;
            
            assign axis_clk[31] = m_axis_bram_31_aclk;
            assign axis_rst[31] = m_axis_bram_31_aresetn;
            assign dwconv1_tready[31] = m_axis_bram_31_tready;
            assign m_axis_bram_31_tlast = dwconv1_tlast[31];
            assign m_axis_bram_31_tvalid = dwconv1_tvalid[31];
            assign m_axis_bram_31_tkeep = dwconv1_tkeep[31][M_AXIS_BRAM_31_DMWIDTH/8-1:0];
            assign m_axis_bram_31_tstrb = dwconv1_tstrb[31][M_AXIS_BRAM_31_DMWIDTH/8-1:0];
            assign m_axis_bram_31_tdata = dwconv1_tdata[31][M_AXIS_BRAM_31_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 32) begin
            assign addr0[32][M_AXIS_BRAM_32_ADDR_WIDTH-1:0] = ap_bram_32_addr0;
            assign din0[32][M_AXIS_BRAM_32_WIDTH-1:0] = ap_bram_32_din0;
            assign ap_bram_32_dout0 = dout0[32][M_AXIS_BRAM_32_WIDTH-1:0];
            assign we0[32][M_AXIS_BRAM_32_WIDTH/8-1:0] = ap_bram_32_we0;
            assign en0[32] = ap_bram_32_en0;
            assign addr1[32][M_AXIS_BRAM_32_ADDR_WIDTH-1:0] = ap_bram_32_addr1;
            assign din1[32][M_AXIS_BRAM_32_WIDTH-1:0] = ap_bram_32_din1;
            assign ap_bram_32_dout1 = dout1[32][M_AXIS_BRAM_32_WIDTH-1:0];
            assign we1[32][M_AXIS_BRAM_32_WIDTH/8-1:0] = ap_bram_32_we1;
            assign en1[32] = ap_bram_32_en1;
            
            assign axis_clk[32] = m_axis_bram_32_aclk;
            assign axis_rst[32] = m_axis_bram_32_aresetn;
            assign dwconv1_tready[32] = m_axis_bram_32_tready;
            assign m_axis_bram_32_tlast = dwconv1_tlast[32];
            assign m_axis_bram_32_tvalid = dwconv1_tvalid[32];
            assign m_axis_bram_32_tkeep = dwconv1_tkeep[32][M_AXIS_BRAM_32_DMWIDTH/8-1:0];
            assign m_axis_bram_32_tstrb = dwconv1_tstrb[32][M_AXIS_BRAM_32_DMWIDTH/8-1:0];
            assign m_axis_bram_32_tdata = dwconv1_tdata[32][M_AXIS_BRAM_32_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 33) begin
            assign addr0[33][M_AXIS_BRAM_33_ADDR_WIDTH-1:0] = ap_bram_33_addr0;
            assign din0[33][M_AXIS_BRAM_33_WIDTH-1:0] = ap_bram_33_din0;
            assign ap_bram_33_dout0 = dout0[33][M_AXIS_BRAM_33_WIDTH-1:0];
            assign we0[33][M_AXIS_BRAM_33_WIDTH/8-1:0] = ap_bram_33_we0;
            assign en0[33] = ap_bram_33_en0;
            assign addr1[33][M_AXIS_BRAM_33_ADDR_WIDTH-1:0] = ap_bram_33_addr1;
            assign din1[33][M_AXIS_BRAM_33_WIDTH-1:0] = ap_bram_33_din1;
            assign ap_bram_33_dout1 = dout1[33][M_AXIS_BRAM_33_WIDTH-1:0];
            assign we1[33][M_AXIS_BRAM_33_WIDTH/8-1:0] = ap_bram_33_we1;
            assign en1[33] = ap_bram_33_en1;
            
            assign axis_clk[33] = m_axis_bram_33_aclk;
            assign axis_rst[33] = m_axis_bram_33_aresetn;
            assign dwconv1_tready[33] = m_axis_bram_33_tready;
            assign m_axis_bram_33_tlast = dwconv1_tlast[33];
            assign m_axis_bram_33_tvalid = dwconv1_tvalid[33];
            assign m_axis_bram_33_tkeep = dwconv1_tkeep[33][M_AXIS_BRAM_33_DMWIDTH/8-1:0];
            assign m_axis_bram_33_tstrb = dwconv1_tstrb[33][M_AXIS_BRAM_33_DMWIDTH/8-1:0];
            assign m_axis_bram_33_tdata = dwconv1_tdata[33][M_AXIS_BRAM_33_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 34) begin
            assign addr0[34][M_AXIS_BRAM_34_ADDR_WIDTH-1:0] = ap_bram_34_addr0;
            assign din0[34][M_AXIS_BRAM_34_WIDTH-1:0] = ap_bram_34_din0;
            assign ap_bram_34_dout0 = dout0[34][M_AXIS_BRAM_34_WIDTH-1:0];
            assign we0[34][M_AXIS_BRAM_34_WIDTH/8-1:0] = ap_bram_34_we0;
            assign en0[34] = ap_bram_34_en0;
            assign addr1[34][M_AXIS_BRAM_34_ADDR_WIDTH-1:0] = ap_bram_34_addr1;
            assign din1[34][M_AXIS_BRAM_34_WIDTH-1:0] = ap_bram_34_din1;
            assign ap_bram_34_dout1 = dout1[34][M_AXIS_BRAM_34_WIDTH-1:0];
            assign we1[34][M_AXIS_BRAM_34_WIDTH/8-1:0] = ap_bram_34_we1;
            assign en1[34] = ap_bram_34_en1;
            
            assign axis_clk[34] = m_axis_bram_34_aclk;
            assign axis_rst[34] = m_axis_bram_34_aresetn;
            assign dwconv1_tready[34] = m_axis_bram_34_tready;
            assign m_axis_bram_34_tlast = dwconv1_tlast[34];
            assign m_axis_bram_34_tvalid = dwconv1_tvalid[34];
            assign m_axis_bram_34_tkeep = dwconv1_tkeep[34][M_AXIS_BRAM_34_DMWIDTH/8-1:0];
            assign m_axis_bram_34_tstrb = dwconv1_tstrb[34][M_AXIS_BRAM_34_DMWIDTH/8-1:0];
            assign m_axis_bram_34_tdata = dwconv1_tdata[34][M_AXIS_BRAM_34_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 35) begin
            assign addr0[35][M_AXIS_BRAM_35_ADDR_WIDTH-1:0] = ap_bram_35_addr0;
            assign din0[35][M_AXIS_BRAM_35_WIDTH-1:0] = ap_bram_35_din0;
            assign ap_bram_35_dout0 = dout0[35][M_AXIS_BRAM_35_WIDTH-1:0];
            assign we0[35][M_AXIS_BRAM_35_WIDTH/8-1:0] = ap_bram_35_we0;
            assign en0[35] = ap_bram_35_en0;
            assign addr1[35][M_AXIS_BRAM_35_ADDR_WIDTH-1:0] = ap_bram_35_addr1;
            assign din1[35][M_AXIS_BRAM_35_WIDTH-1:0] = ap_bram_35_din1;
            assign ap_bram_35_dout1 = dout1[35][M_AXIS_BRAM_35_WIDTH-1:0];
            assign we1[35][M_AXIS_BRAM_35_WIDTH/8-1:0] = ap_bram_35_we1;
            assign en1[35] = ap_bram_35_en1;
            
            assign axis_clk[35] = m_axis_bram_35_aclk;
            assign axis_rst[35] = m_axis_bram_35_aresetn;
            assign dwconv1_tready[35] = m_axis_bram_35_tready;
            assign m_axis_bram_35_tlast = dwconv1_tlast[35];
            assign m_axis_bram_35_tvalid = dwconv1_tvalid[35];
            assign m_axis_bram_35_tkeep = dwconv1_tkeep[35][M_AXIS_BRAM_35_DMWIDTH/8-1:0];
            assign m_axis_bram_35_tstrb = dwconv1_tstrb[35][M_AXIS_BRAM_35_DMWIDTH/8-1:0];
            assign m_axis_bram_35_tdata = dwconv1_tdata[35][M_AXIS_BRAM_35_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 36) begin
            assign addr0[36][M_AXIS_BRAM_36_ADDR_WIDTH-1:0] = ap_bram_36_addr0;
            assign din0[36][M_AXIS_BRAM_36_WIDTH-1:0] = ap_bram_36_din0;
            assign ap_bram_36_dout0 = dout0[36][M_AXIS_BRAM_36_WIDTH-1:0];
            assign we0[36][M_AXIS_BRAM_36_WIDTH/8-1:0] = ap_bram_36_we0;
            assign en0[36] = ap_bram_36_en0;
            assign addr1[36][M_AXIS_BRAM_36_ADDR_WIDTH-1:0] = ap_bram_36_addr1;
            assign din1[36][M_AXIS_BRAM_36_WIDTH-1:0] = ap_bram_36_din1;
            assign ap_bram_36_dout1 = dout1[36][M_AXIS_BRAM_36_WIDTH-1:0];
            assign we1[36][M_AXIS_BRAM_36_WIDTH/8-1:0] = ap_bram_36_we1;
            assign en1[36] = ap_bram_36_en1;
            
            assign axis_clk[36] = m_axis_bram_36_aclk;
            assign axis_rst[36] = m_axis_bram_36_aresetn;
            assign dwconv1_tready[36] = m_axis_bram_36_tready;
            assign m_axis_bram_36_tlast = dwconv1_tlast[36];
            assign m_axis_bram_36_tvalid = dwconv1_tvalid[36];
            assign m_axis_bram_36_tkeep = dwconv1_tkeep[36][M_AXIS_BRAM_36_DMWIDTH/8-1:0];
            assign m_axis_bram_36_tstrb = dwconv1_tstrb[36][M_AXIS_BRAM_36_DMWIDTH/8-1:0];
            assign m_axis_bram_36_tdata = dwconv1_tdata[36][M_AXIS_BRAM_36_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 37) begin
            assign addr0[37][M_AXIS_BRAM_37_ADDR_WIDTH-1:0] = ap_bram_37_addr0;
            assign din0[37][M_AXIS_BRAM_37_WIDTH-1:0] = ap_bram_37_din0;
            assign ap_bram_37_dout0 = dout0[37][M_AXIS_BRAM_37_WIDTH-1:0];
            assign we0[37][M_AXIS_BRAM_37_WIDTH/8-1:0] = ap_bram_37_we0;
            assign en0[37] = ap_bram_37_en0;
            assign addr1[37][M_AXIS_BRAM_37_ADDR_WIDTH-1:0] = ap_bram_37_addr1;
            assign din1[37][M_AXIS_BRAM_37_WIDTH-1:0] = ap_bram_37_din1;
            assign ap_bram_37_dout1 = dout1[37][M_AXIS_BRAM_37_WIDTH-1:0];
            assign we1[37][M_AXIS_BRAM_37_WIDTH/8-1:0] = ap_bram_37_we1;
            assign en1[37] = ap_bram_37_en1;
            
            assign axis_clk[37] = m_axis_bram_37_aclk;
            assign axis_rst[37] = m_axis_bram_37_aresetn;
            assign dwconv1_tready[37] = m_axis_bram_37_tready;
            assign m_axis_bram_37_tlast = dwconv1_tlast[37];
            assign m_axis_bram_37_tvalid = dwconv1_tvalid[37];
            assign m_axis_bram_37_tkeep = dwconv1_tkeep[37][M_AXIS_BRAM_37_DMWIDTH/8-1:0];
            assign m_axis_bram_37_tstrb = dwconv1_tstrb[37][M_AXIS_BRAM_37_DMWIDTH/8-1:0];
            assign m_axis_bram_37_tdata = dwconv1_tdata[37][M_AXIS_BRAM_37_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 38) begin
            assign addr0[38][M_AXIS_BRAM_38_ADDR_WIDTH-1:0] = ap_bram_38_addr0;
            assign din0[38][M_AXIS_BRAM_38_WIDTH-1:0] = ap_bram_38_din0;
            assign ap_bram_38_dout0 = dout0[38][M_AXIS_BRAM_38_WIDTH-1:0];
            assign we0[38][M_AXIS_BRAM_38_WIDTH/8-1:0] = ap_bram_38_we0;
            assign en0[38] = ap_bram_38_en0;
            assign addr1[38][M_AXIS_BRAM_38_ADDR_WIDTH-1:0] = ap_bram_38_addr1;
            assign din1[38][M_AXIS_BRAM_38_WIDTH-1:0] = ap_bram_38_din1;
            assign ap_bram_38_dout1 = dout1[38][M_AXIS_BRAM_38_WIDTH-1:0];
            assign we1[38][M_AXIS_BRAM_38_WIDTH/8-1:0] = ap_bram_38_we1;
            assign en1[38] = ap_bram_38_en1;
            
            assign axis_clk[38] = m_axis_bram_38_aclk;
            assign axis_rst[38] = m_axis_bram_38_aresetn;
            assign dwconv1_tready[38] = m_axis_bram_38_tready;
            assign m_axis_bram_38_tlast = dwconv1_tlast[38];
            assign m_axis_bram_38_tvalid = dwconv1_tvalid[38];
            assign m_axis_bram_38_tkeep = dwconv1_tkeep[38][M_AXIS_BRAM_38_DMWIDTH/8-1:0];
            assign m_axis_bram_38_tstrb = dwconv1_tstrb[38][M_AXIS_BRAM_38_DMWIDTH/8-1:0];
            assign m_axis_bram_38_tdata = dwconv1_tdata[38][M_AXIS_BRAM_38_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 39) begin
            assign addr0[39][M_AXIS_BRAM_39_ADDR_WIDTH-1:0] = ap_bram_39_addr0;
            assign din0[39][M_AXIS_BRAM_39_WIDTH-1:0] = ap_bram_39_din0;
            assign ap_bram_39_dout0 = dout0[39][M_AXIS_BRAM_39_WIDTH-1:0];
            assign we0[39][M_AXIS_BRAM_39_WIDTH/8-1:0] = ap_bram_39_we0;
            assign en0[39] = ap_bram_39_en0;
            assign addr1[39][M_AXIS_BRAM_39_ADDR_WIDTH-1:0] = ap_bram_39_addr1;
            assign din1[39][M_AXIS_BRAM_39_WIDTH-1:0] = ap_bram_39_din1;
            assign ap_bram_39_dout1 = dout1[39][M_AXIS_BRAM_39_WIDTH-1:0];
            assign we1[39][M_AXIS_BRAM_39_WIDTH/8-1:0] = ap_bram_39_we1;
            assign en1[39] = ap_bram_39_en1;
            
            assign axis_clk[39] = m_axis_bram_39_aclk;
            assign axis_rst[39] = m_axis_bram_39_aresetn;
            assign dwconv1_tready[39] = m_axis_bram_39_tready;
            assign m_axis_bram_39_tlast = dwconv1_tlast[39];
            assign m_axis_bram_39_tvalid = dwconv1_tvalid[39];
            assign m_axis_bram_39_tkeep = dwconv1_tkeep[39][M_AXIS_BRAM_39_DMWIDTH/8-1:0];
            assign m_axis_bram_39_tstrb = dwconv1_tstrb[39][M_AXIS_BRAM_39_DMWIDTH/8-1:0];
            assign m_axis_bram_39_tdata = dwconv1_tdata[39][M_AXIS_BRAM_39_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 40) begin
            assign addr0[40][M_AXIS_BRAM_40_ADDR_WIDTH-1:0] = ap_bram_40_addr0;
            assign din0[40][M_AXIS_BRAM_40_WIDTH-1:0] = ap_bram_40_din0;
            assign ap_bram_40_dout0 = dout0[40][M_AXIS_BRAM_40_WIDTH-1:0];
            assign we0[40][M_AXIS_BRAM_40_WIDTH/8-1:0] = ap_bram_40_we0;
            assign en0[40] = ap_bram_40_en0;
            assign addr1[40][M_AXIS_BRAM_40_ADDR_WIDTH-1:0] = ap_bram_40_addr1;
            assign din1[40][M_AXIS_BRAM_40_WIDTH-1:0] = ap_bram_40_din1;
            assign ap_bram_40_dout1 = dout1[40][M_AXIS_BRAM_40_WIDTH-1:0];
            assign we1[40][M_AXIS_BRAM_40_WIDTH/8-1:0] = ap_bram_40_we1;
            assign en1[40] = ap_bram_40_en1;
            
            assign axis_clk[40] = m_axis_bram_40_aclk;
            assign axis_rst[40] = m_axis_bram_40_aresetn;
            assign dwconv1_tready[40] = m_axis_bram_40_tready;
            assign m_axis_bram_40_tlast = dwconv1_tlast[40];
            assign m_axis_bram_40_tvalid = dwconv1_tvalid[40];
            assign m_axis_bram_40_tkeep = dwconv1_tkeep[40][M_AXIS_BRAM_40_DMWIDTH/8-1:0];
            assign m_axis_bram_40_tstrb = dwconv1_tstrb[40][M_AXIS_BRAM_40_DMWIDTH/8-1:0];
            assign m_axis_bram_40_tdata = dwconv1_tdata[40][M_AXIS_BRAM_40_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 41) begin
            assign addr0[41][M_AXIS_BRAM_41_ADDR_WIDTH-1:0] = ap_bram_41_addr0;
            assign din0[41][M_AXIS_BRAM_41_WIDTH-1:0] = ap_bram_41_din0;
            assign ap_bram_41_dout0 = dout0[41][M_AXIS_BRAM_41_WIDTH-1:0];
            assign we0[41][M_AXIS_BRAM_41_WIDTH/8-1:0] = ap_bram_41_we0;
            assign en0[41] = ap_bram_41_en0;
            assign addr1[41][M_AXIS_BRAM_41_ADDR_WIDTH-1:0] = ap_bram_41_addr1;
            assign din1[41][M_AXIS_BRAM_41_WIDTH-1:0] = ap_bram_41_din1;
            assign ap_bram_41_dout1 = dout1[41][M_AXIS_BRAM_41_WIDTH-1:0];
            assign we1[41][M_AXIS_BRAM_41_WIDTH/8-1:0] = ap_bram_41_we1;
            assign en1[41] = ap_bram_41_en1;
            
            assign axis_clk[41] = m_axis_bram_41_aclk;
            assign axis_rst[41] = m_axis_bram_41_aresetn;
            assign dwconv1_tready[41] = m_axis_bram_41_tready;
            assign m_axis_bram_41_tlast = dwconv1_tlast[41];
            assign m_axis_bram_41_tvalid = dwconv1_tvalid[41];
            assign m_axis_bram_41_tkeep = dwconv1_tkeep[41][M_AXIS_BRAM_41_DMWIDTH/8-1:0];
            assign m_axis_bram_41_tstrb = dwconv1_tstrb[41][M_AXIS_BRAM_41_DMWIDTH/8-1:0];
            assign m_axis_bram_41_tdata = dwconv1_tdata[41][M_AXIS_BRAM_41_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 42) begin
            assign addr0[42][M_AXIS_BRAM_42_ADDR_WIDTH-1:0] = ap_bram_42_addr0;
            assign din0[42][M_AXIS_BRAM_42_WIDTH-1:0] = ap_bram_42_din0;
            assign ap_bram_42_dout0 = dout0[42][M_AXIS_BRAM_42_WIDTH-1:0];
            assign we0[42][M_AXIS_BRAM_42_WIDTH/8-1:0] = ap_bram_42_we0;
            assign en0[42] = ap_bram_42_en0;
            assign addr1[42][M_AXIS_BRAM_42_ADDR_WIDTH-1:0] = ap_bram_42_addr1;
            assign din1[42][M_AXIS_BRAM_42_WIDTH-1:0] = ap_bram_42_din1;
            assign ap_bram_42_dout1 = dout1[42][M_AXIS_BRAM_42_WIDTH-1:0];
            assign we1[42][M_AXIS_BRAM_42_WIDTH/8-1:0] = ap_bram_42_we1;
            assign en1[42] = ap_bram_42_en1;
            
            assign axis_clk[42] = m_axis_bram_42_aclk;
            assign axis_rst[42] = m_axis_bram_42_aresetn;
            assign dwconv1_tready[42] = m_axis_bram_42_tready;
            assign m_axis_bram_42_tlast = dwconv1_tlast[42];
            assign m_axis_bram_42_tvalid = dwconv1_tvalid[42];
            assign m_axis_bram_42_tkeep = dwconv1_tkeep[42][M_AXIS_BRAM_42_DMWIDTH/8-1:0];
            assign m_axis_bram_42_tstrb = dwconv1_tstrb[42][M_AXIS_BRAM_42_DMWIDTH/8-1:0];
            assign m_axis_bram_42_tdata = dwconv1_tdata[42][M_AXIS_BRAM_42_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 43) begin
            assign addr0[43][M_AXIS_BRAM_43_ADDR_WIDTH-1:0] = ap_bram_43_addr0;
            assign din0[43][M_AXIS_BRAM_43_WIDTH-1:0] = ap_bram_43_din0;
            assign ap_bram_43_dout0 = dout0[43][M_AXIS_BRAM_43_WIDTH-1:0];
            assign we0[43][M_AXIS_BRAM_43_WIDTH/8-1:0] = ap_bram_43_we0;
            assign en0[43] = ap_bram_43_en0;
            assign addr1[43][M_AXIS_BRAM_43_ADDR_WIDTH-1:0] = ap_bram_43_addr1;
            assign din1[43][M_AXIS_BRAM_43_WIDTH-1:0] = ap_bram_43_din1;
            assign ap_bram_43_dout1 = dout1[43][M_AXIS_BRAM_43_WIDTH-1:0];
            assign we1[43][M_AXIS_BRAM_43_WIDTH/8-1:0] = ap_bram_43_we1;
            assign en1[43] = ap_bram_43_en1;
            
            assign axis_clk[43] = m_axis_bram_43_aclk;
            assign axis_rst[43] = m_axis_bram_43_aresetn;
            assign dwconv1_tready[43] = m_axis_bram_43_tready;
            assign m_axis_bram_43_tlast = dwconv1_tlast[43];
            assign m_axis_bram_43_tvalid = dwconv1_tvalid[43];
            assign m_axis_bram_43_tkeep = dwconv1_tkeep[43][M_AXIS_BRAM_43_DMWIDTH/8-1:0];
            assign m_axis_bram_43_tstrb = dwconv1_tstrb[43][M_AXIS_BRAM_43_DMWIDTH/8-1:0];
            assign m_axis_bram_43_tdata = dwconv1_tdata[43][M_AXIS_BRAM_43_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 44) begin
            assign addr0[44][M_AXIS_BRAM_44_ADDR_WIDTH-1:0] = ap_bram_44_addr0;
            assign din0[44][M_AXIS_BRAM_44_WIDTH-1:0] = ap_bram_44_din0;
            assign ap_bram_44_dout0 = dout0[44][M_AXIS_BRAM_44_WIDTH-1:0];
            assign we0[44][M_AXIS_BRAM_44_WIDTH/8-1:0] = ap_bram_44_we0;
            assign en0[44] = ap_bram_44_en0;
            assign addr1[44][M_AXIS_BRAM_44_ADDR_WIDTH-1:0] = ap_bram_44_addr1;
            assign din1[44][M_AXIS_BRAM_44_WIDTH-1:0] = ap_bram_44_din1;
            assign ap_bram_44_dout1 = dout1[44][M_AXIS_BRAM_44_WIDTH-1:0];
            assign we1[44][M_AXIS_BRAM_44_WIDTH/8-1:0] = ap_bram_44_we1;
            assign en1[44] = ap_bram_44_en1;
            
            assign axis_clk[44] = m_axis_bram_44_aclk;
            assign axis_rst[44] = m_axis_bram_44_aresetn;
            assign dwconv1_tready[44] = m_axis_bram_44_tready;
            assign m_axis_bram_44_tlast = dwconv1_tlast[44];
            assign m_axis_bram_44_tvalid = dwconv1_tvalid[44];
            assign m_axis_bram_44_tkeep = dwconv1_tkeep[44][M_AXIS_BRAM_44_DMWIDTH/8-1:0];
            assign m_axis_bram_44_tstrb = dwconv1_tstrb[44][M_AXIS_BRAM_44_DMWIDTH/8-1:0];
            assign m_axis_bram_44_tdata = dwconv1_tdata[44][M_AXIS_BRAM_44_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 45) begin
            assign addr0[45][M_AXIS_BRAM_45_ADDR_WIDTH-1:0] = ap_bram_45_addr0;
            assign din0[45][M_AXIS_BRAM_45_WIDTH-1:0] = ap_bram_45_din0;
            assign ap_bram_45_dout0 = dout0[45][M_AXIS_BRAM_45_WIDTH-1:0];
            assign we0[45][M_AXIS_BRAM_45_WIDTH/8-1:0] = ap_bram_45_we0;
            assign en0[45] = ap_bram_45_en0;
            assign addr1[45][M_AXIS_BRAM_45_ADDR_WIDTH-1:0] = ap_bram_45_addr1;
            assign din1[45][M_AXIS_BRAM_45_WIDTH-1:0] = ap_bram_45_din1;
            assign ap_bram_45_dout1 = dout1[45][M_AXIS_BRAM_45_WIDTH-1:0];
            assign we1[45][M_AXIS_BRAM_45_WIDTH/8-1:0] = ap_bram_45_we1;
            assign en1[45] = ap_bram_45_en1;
            
            assign axis_clk[45] = m_axis_bram_45_aclk;
            assign axis_rst[45] = m_axis_bram_45_aresetn;
            assign dwconv1_tready[45] = m_axis_bram_45_tready;
            assign m_axis_bram_45_tlast = dwconv1_tlast[45];
            assign m_axis_bram_45_tvalid = dwconv1_tvalid[45];
            assign m_axis_bram_45_tkeep = dwconv1_tkeep[45][M_AXIS_BRAM_45_DMWIDTH/8-1:0];
            assign m_axis_bram_45_tstrb = dwconv1_tstrb[45][M_AXIS_BRAM_45_DMWIDTH/8-1:0];
            assign m_axis_bram_45_tdata = dwconv1_tdata[45][M_AXIS_BRAM_45_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 46) begin
            assign addr0[46][M_AXIS_BRAM_46_ADDR_WIDTH-1:0] = ap_bram_46_addr0;
            assign din0[46][M_AXIS_BRAM_46_WIDTH-1:0] = ap_bram_46_din0;
            assign ap_bram_46_dout0 = dout0[46][M_AXIS_BRAM_46_WIDTH-1:0];
            assign we0[46][M_AXIS_BRAM_46_WIDTH/8-1:0] = ap_bram_46_we0;
            assign en0[46] = ap_bram_46_en0;
            assign addr1[46][M_AXIS_BRAM_46_ADDR_WIDTH-1:0] = ap_bram_46_addr1;
            assign din1[46][M_AXIS_BRAM_46_WIDTH-1:0] = ap_bram_46_din1;
            assign ap_bram_46_dout1 = dout1[46][M_AXIS_BRAM_46_WIDTH-1:0];
            assign we1[46][M_AXIS_BRAM_46_WIDTH/8-1:0] = ap_bram_46_we1;
            assign en1[46] = ap_bram_46_en1;
            
            assign axis_clk[46] = m_axis_bram_46_aclk;
            assign axis_rst[46] = m_axis_bram_46_aresetn;
            assign dwconv1_tready[46] = m_axis_bram_46_tready;
            assign m_axis_bram_46_tlast = dwconv1_tlast[46];
            assign m_axis_bram_46_tvalid = dwconv1_tvalid[46];
            assign m_axis_bram_46_tkeep = dwconv1_tkeep[46][M_AXIS_BRAM_46_DMWIDTH/8-1:0];
            assign m_axis_bram_46_tstrb = dwconv1_tstrb[46][M_AXIS_BRAM_46_DMWIDTH/8-1:0];
            assign m_axis_bram_46_tdata = dwconv1_tdata[46][M_AXIS_BRAM_46_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 47) begin
            assign addr0[47][M_AXIS_BRAM_47_ADDR_WIDTH-1:0] = ap_bram_47_addr0;
            assign din0[47][M_AXIS_BRAM_47_WIDTH-1:0] = ap_bram_47_din0;
            assign ap_bram_47_dout0 = dout0[47][M_AXIS_BRAM_47_WIDTH-1:0];
            assign we0[47][M_AXIS_BRAM_47_WIDTH/8-1:0] = ap_bram_47_we0;
            assign en0[47] = ap_bram_47_en0;
            assign addr1[47][M_AXIS_BRAM_47_ADDR_WIDTH-1:0] = ap_bram_47_addr1;
            assign din1[47][M_AXIS_BRAM_47_WIDTH-1:0] = ap_bram_47_din1;
            assign ap_bram_47_dout1 = dout1[47][M_AXIS_BRAM_47_WIDTH-1:0];
            assign we1[47][M_AXIS_BRAM_47_WIDTH/8-1:0] = ap_bram_47_we1;
            assign en1[47] = ap_bram_47_en1;
            
            assign axis_clk[47] = m_axis_bram_47_aclk;
            assign axis_rst[47] = m_axis_bram_47_aresetn;
            assign dwconv1_tready[47] = m_axis_bram_47_tready;
            assign m_axis_bram_47_tlast = dwconv1_tlast[47];
            assign m_axis_bram_47_tvalid = dwconv1_tvalid[47];
            assign m_axis_bram_47_tkeep = dwconv1_tkeep[47][M_AXIS_BRAM_47_DMWIDTH/8-1:0];
            assign m_axis_bram_47_tstrb = dwconv1_tstrb[47][M_AXIS_BRAM_47_DMWIDTH/8-1:0];
            assign m_axis_bram_47_tdata = dwconv1_tdata[47][M_AXIS_BRAM_47_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 48) begin
            assign addr0[48][M_AXIS_BRAM_48_ADDR_WIDTH-1:0] = ap_bram_48_addr0;
            assign din0[48][M_AXIS_BRAM_48_WIDTH-1:0] = ap_bram_48_din0;
            assign ap_bram_48_dout0 = dout0[48][M_AXIS_BRAM_48_WIDTH-1:0];
            assign we0[48][M_AXIS_BRAM_48_WIDTH/8-1:0] = ap_bram_48_we0;
            assign en0[48] = ap_bram_48_en0;
            assign addr1[48][M_AXIS_BRAM_48_ADDR_WIDTH-1:0] = ap_bram_48_addr1;
            assign din1[48][M_AXIS_BRAM_48_WIDTH-1:0] = ap_bram_48_din1;
            assign ap_bram_48_dout1 = dout1[48][M_AXIS_BRAM_48_WIDTH-1:0];
            assign we1[48][M_AXIS_BRAM_48_WIDTH/8-1:0] = ap_bram_48_we1;
            assign en1[48] = ap_bram_48_en1;
            
            assign axis_clk[48] = m_axis_bram_48_aclk;
            assign axis_rst[48] = m_axis_bram_48_aresetn;
            assign dwconv1_tready[48] = m_axis_bram_48_tready;
            assign m_axis_bram_48_tlast = dwconv1_tlast[48];
            assign m_axis_bram_48_tvalid = dwconv1_tvalid[48];
            assign m_axis_bram_48_tkeep = dwconv1_tkeep[48][M_AXIS_BRAM_48_DMWIDTH/8-1:0];
            assign m_axis_bram_48_tstrb = dwconv1_tstrb[48][M_AXIS_BRAM_48_DMWIDTH/8-1:0];
            assign m_axis_bram_48_tdata = dwconv1_tdata[48][M_AXIS_BRAM_48_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 49) begin
            assign addr0[49][M_AXIS_BRAM_49_ADDR_WIDTH-1:0] = ap_bram_49_addr0;
            assign din0[49][M_AXIS_BRAM_49_WIDTH-1:0] = ap_bram_49_din0;
            assign ap_bram_49_dout0 = dout0[49][M_AXIS_BRAM_49_WIDTH-1:0];
            assign we0[49][M_AXIS_BRAM_49_WIDTH/8-1:0] = ap_bram_49_we0;
            assign en0[49] = ap_bram_49_en0;
            assign addr1[49][M_AXIS_BRAM_49_ADDR_WIDTH-1:0] = ap_bram_49_addr1;
            assign din1[49][M_AXIS_BRAM_49_WIDTH-1:0] = ap_bram_49_din1;
            assign ap_bram_49_dout1 = dout1[49][M_AXIS_BRAM_49_WIDTH-1:0];
            assign we1[49][M_AXIS_BRAM_49_WIDTH/8-1:0] = ap_bram_49_we1;
            assign en1[49] = ap_bram_49_en1;
            
            assign axis_clk[49] = m_axis_bram_49_aclk;
            assign axis_rst[49] = m_axis_bram_49_aresetn;
            assign dwconv1_tready[49] = m_axis_bram_49_tready;
            assign m_axis_bram_49_tlast = dwconv1_tlast[49];
            assign m_axis_bram_49_tvalid = dwconv1_tvalid[49];
            assign m_axis_bram_49_tkeep = dwconv1_tkeep[49][M_AXIS_BRAM_49_DMWIDTH/8-1:0];
            assign m_axis_bram_49_tstrb = dwconv1_tstrb[49][M_AXIS_BRAM_49_DMWIDTH/8-1:0];
            assign m_axis_bram_49_tdata = dwconv1_tdata[49][M_AXIS_BRAM_49_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 50) begin
            assign addr0[50][M_AXIS_BRAM_50_ADDR_WIDTH-1:0] = ap_bram_50_addr0;
            assign din0[50][M_AXIS_BRAM_50_WIDTH-1:0] = ap_bram_50_din0;
            assign ap_bram_50_dout0 = dout0[50][M_AXIS_BRAM_50_WIDTH-1:0];
            assign we0[50][M_AXIS_BRAM_50_WIDTH/8-1:0] = ap_bram_50_we0;
            assign en0[50] = ap_bram_50_en0;
            assign addr1[50][M_AXIS_BRAM_50_ADDR_WIDTH-1:0] = ap_bram_50_addr1;
            assign din1[50][M_AXIS_BRAM_50_WIDTH-1:0] = ap_bram_50_din1;
            assign ap_bram_50_dout1 = dout1[50][M_AXIS_BRAM_50_WIDTH-1:0];
            assign we1[50][M_AXIS_BRAM_50_WIDTH/8-1:0] = ap_bram_50_we1;
            assign en1[50] = ap_bram_50_en1;
            
            assign axis_clk[50] = m_axis_bram_50_aclk;
            assign axis_rst[50] = m_axis_bram_50_aresetn;
            assign dwconv1_tready[50] = m_axis_bram_50_tready;
            assign m_axis_bram_50_tlast = dwconv1_tlast[50];
            assign m_axis_bram_50_tvalid = dwconv1_tvalid[50];
            assign m_axis_bram_50_tkeep = dwconv1_tkeep[50][M_AXIS_BRAM_50_DMWIDTH/8-1:0];
            assign m_axis_bram_50_tstrb = dwconv1_tstrb[50][M_AXIS_BRAM_50_DMWIDTH/8-1:0];
            assign m_axis_bram_50_tdata = dwconv1_tdata[50][M_AXIS_BRAM_50_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 51) begin
            assign addr0[51][M_AXIS_BRAM_51_ADDR_WIDTH-1:0] = ap_bram_51_addr0;
            assign din0[51][M_AXIS_BRAM_51_WIDTH-1:0] = ap_bram_51_din0;
            assign ap_bram_51_dout0 = dout0[51][M_AXIS_BRAM_51_WIDTH-1:0];
            assign we0[51][M_AXIS_BRAM_51_WIDTH/8-1:0] = ap_bram_51_we0;
            assign en0[51] = ap_bram_51_en0;
            assign addr1[51][M_AXIS_BRAM_51_ADDR_WIDTH-1:0] = ap_bram_51_addr1;
            assign din1[51][M_AXIS_BRAM_51_WIDTH-1:0] = ap_bram_51_din1;
            assign ap_bram_51_dout1 = dout1[51][M_AXIS_BRAM_51_WIDTH-1:0];
            assign we1[51][M_AXIS_BRAM_51_WIDTH/8-1:0] = ap_bram_51_we1;
            assign en1[51] = ap_bram_51_en1;
            
            assign axis_clk[51] = m_axis_bram_51_aclk;
            assign axis_rst[51] = m_axis_bram_51_aresetn;
            assign dwconv1_tready[51] = m_axis_bram_51_tready;
            assign m_axis_bram_51_tlast = dwconv1_tlast[51];
            assign m_axis_bram_51_tvalid = dwconv1_tvalid[51];
            assign m_axis_bram_51_tkeep = dwconv1_tkeep[51][M_AXIS_BRAM_51_DMWIDTH/8-1:0];
            assign m_axis_bram_51_tstrb = dwconv1_tstrb[51][M_AXIS_BRAM_51_DMWIDTH/8-1:0];
            assign m_axis_bram_51_tdata = dwconv1_tdata[51][M_AXIS_BRAM_51_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 52) begin
            assign addr0[52][M_AXIS_BRAM_52_ADDR_WIDTH-1:0] = ap_bram_52_addr0;
            assign din0[52][M_AXIS_BRAM_52_WIDTH-1:0] = ap_bram_52_din0;
            assign ap_bram_52_dout0 = dout0[52][M_AXIS_BRAM_52_WIDTH-1:0];
            assign we0[52][M_AXIS_BRAM_52_WIDTH/8-1:0] = ap_bram_52_we0;
            assign en0[52] = ap_bram_52_en0;
            assign addr1[52][M_AXIS_BRAM_52_ADDR_WIDTH-1:0] = ap_bram_52_addr1;
            assign din1[52][M_AXIS_BRAM_52_WIDTH-1:0] = ap_bram_52_din1;
            assign ap_bram_52_dout1 = dout1[52][M_AXIS_BRAM_52_WIDTH-1:0];
            assign we1[52][M_AXIS_BRAM_52_WIDTH/8-1:0] = ap_bram_52_we1;
            assign en1[52] = ap_bram_52_en1;
            
            assign axis_clk[52] = m_axis_bram_52_aclk;
            assign axis_rst[52] = m_axis_bram_52_aresetn;
            assign dwconv1_tready[52] = m_axis_bram_52_tready;
            assign m_axis_bram_52_tlast = dwconv1_tlast[52];
            assign m_axis_bram_52_tvalid = dwconv1_tvalid[52];
            assign m_axis_bram_52_tkeep = dwconv1_tkeep[52][M_AXIS_BRAM_52_DMWIDTH/8-1:0];
            assign m_axis_bram_52_tstrb = dwconv1_tstrb[52][M_AXIS_BRAM_52_DMWIDTH/8-1:0];
            assign m_axis_bram_52_tdata = dwconv1_tdata[52][M_AXIS_BRAM_52_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 53) begin
            assign addr0[53][M_AXIS_BRAM_53_ADDR_WIDTH-1:0] = ap_bram_53_addr0;
            assign din0[53][M_AXIS_BRAM_53_WIDTH-1:0] = ap_bram_53_din0;
            assign ap_bram_53_dout0 = dout0[53][M_AXIS_BRAM_53_WIDTH-1:0];
            assign we0[53][M_AXIS_BRAM_53_WIDTH/8-1:0] = ap_bram_53_we0;
            assign en0[53] = ap_bram_53_en0;
            assign addr1[53][M_AXIS_BRAM_53_ADDR_WIDTH-1:0] = ap_bram_53_addr1;
            assign din1[53][M_AXIS_BRAM_53_WIDTH-1:0] = ap_bram_53_din1;
            assign ap_bram_53_dout1 = dout1[53][M_AXIS_BRAM_53_WIDTH-1:0];
            assign we1[53][M_AXIS_BRAM_53_WIDTH/8-1:0] = ap_bram_53_we1;
            assign en1[53] = ap_bram_53_en1;
            
            assign axis_clk[53] = m_axis_bram_53_aclk;
            assign axis_rst[53] = m_axis_bram_53_aresetn;
            assign dwconv1_tready[53] = m_axis_bram_53_tready;
            assign m_axis_bram_53_tlast = dwconv1_tlast[53];
            assign m_axis_bram_53_tvalid = dwconv1_tvalid[53];
            assign m_axis_bram_53_tkeep = dwconv1_tkeep[53][M_AXIS_BRAM_53_DMWIDTH/8-1:0];
            assign m_axis_bram_53_tstrb = dwconv1_tstrb[53][M_AXIS_BRAM_53_DMWIDTH/8-1:0];
            assign m_axis_bram_53_tdata = dwconv1_tdata[53][M_AXIS_BRAM_53_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 54) begin
            assign addr0[54][M_AXIS_BRAM_54_ADDR_WIDTH-1:0] = ap_bram_54_addr0;
            assign din0[54][M_AXIS_BRAM_54_WIDTH-1:0] = ap_bram_54_din0;
            assign ap_bram_54_dout0 = dout0[54][M_AXIS_BRAM_54_WIDTH-1:0];
            assign we0[54][M_AXIS_BRAM_54_WIDTH/8-1:0] = ap_bram_54_we0;
            assign en0[54] = ap_bram_54_en0;
            assign addr1[54][M_AXIS_BRAM_54_ADDR_WIDTH-1:0] = ap_bram_54_addr1;
            assign din1[54][M_AXIS_BRAM_54_WIDTH-1:0] = ap_bram_54_din1;
            assign ap_bram_54_dout1 = dout1[54][M_AXIS_BRAM_54_WIDTH-1:0];
            assign we1[54][M_AXIS_BRAM_54_WIDTH/8-1:0] = ap_bram_54_we1;
            assign en1[54] = ap_bram_54_en1;
            
            assign axis_clk[54] = m_axis_bram_54_aclk;
            assign axis_rst[54] = m_axis_bram_54_aresetn;
            assign dwconv1_tready[54] = m_axis_bram_54_tready;
            assign m_axis_bram_54_tlast = dwconv1_tlast[54];
            assign m_axis_bram_54_tvalid = dwconv1_tvalid[54];
            assign m_axis_bram_54_tkeep = dwconv1_tkeep[54][M_AXIS_BRAM_54_DMWIDTH/8-1:0];
            assign m_axis_bram_54_tstrb = dwconv1_tstrb[54][M_AXIS_BRAM_54_DMWIDTH/8-1:0];
            assign m_axis_bram_54_tdata = dwconv1_tdata[54][M_AXIS_BRAM_54_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 55) begin
            assign addr0[55][M_AXIS_BRAM_55_ADDR_WIDTH-1:0] = ap_bram_55_addr0;
            assign din0[55][M_AXIS_BRAM_55_WIDTH-1:0] = ap_bram_55_din0;
            assign ap_bram_55_dout0 = dout0[55][M_AXIS_BRAM_55_WIDTH-1:0];
            assign we0[55][M_AXIS_BRAM_55_WIDTH/8-1:0] = ap_bram_55_we0;
            assign en0[55] = ap_bram_55_en0;
            assign addr1[55][M_AXIS_BRAM_55_ADDR_WIDTH-1:0] = ap_bram_55_addr1;
            assign din1[55][M_AXIS_BRAM_55_WIDTH-1:0] = ap_bram_55_din1;
            assign ap_bram_55_dout1 = dout1[55][M_AXIS_BRAM_55_WIDTH-1:0];
            assign we1[55][M_AXIS_BRAM_55_WIDTH/8-1:0] = ap_bram_55_we1;
            assign en1[55] = ap_bram_55_en1;
            
            assign axis_clk[55] = m_axis_bram_55_aclk;
            assign axis_rst[55] = m_axis_bram_55_aresetn;
            assign dwconv1_tready[55] = m_axis_bram_55_tready;
            assign m_axis_bram_55_tlast = dwconv1_tlast[55];
            assign m_axis_bram_55_tvalid = dwconv1_tvalid[55];
            assign m_axis_bram_55_tkeep = dwconv1_tkeep[55][M_AXIS_BRAM_55_DMWIDTH/8-1:0];
            assign m_axis_bram_55_tstrb = dwconv1_tstrb[55][M_AXIS_BRAM_55_DMWIDTH/8-1:0];
            assign m_axis_bram_55_tdata = dwconv1_tdata[55][M_AXIS_BRAM_55_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 56) begin
            assign addr0[56][M_AXIS_BRAM_56_ADDR_WIDTH-1:0] = ap_bram_56_addr0;
            assign din0[56][M_AXIS_BRAM_56_WIDTH-1:0] = ap_bram_56_din0;
            assign ap_bram_56_dout0 = dout0[56][M_AXIS_BRAM_56_WIDTH-1:0];
            assign we0[56][M_AXIS_BRAM_56_WIDTH/8-1:0] = ap_bram_56_we0;
            assign en0[56] = ap_bram_56_en0;
            assign addr1[56][M_AXIS_BRAM_56_ADDR_WIDTH-1:0] = ap_bram_56_addr1;
            assign din1[56][M_AXIS_BRAM_56_WIDTH-1:0] = ap_bram_56_din1;
            assign ap_bram_56_dout1 = dout1[56][M_AXIS_BRAM_56_WIDTH-1:0];
            assign we1[56][M_AXIS_BRAM_56_WIDTH/8-1:0] = ap_bram_56_we1;
            assign en1[56] = ap_bram_56_en1;
            
            assign axis_clk[56] = m_axis_bram_56_aclk;
            assign axis_rst[56] = m_axis_bram_56_aresetn;
            assign dwconv1_tready[56] = m_axis_bram_56_tready;
            assign m_axis_bram_56_tlast = dwconv1_tlast[56];
            assign m_axis_bram_56_tvalid = dwconv1_tvalid[56];
            assign m_axis_bram_56_tkeep = dwconv1_tkeep[56][M_AXIS_BRAM_56_DMWIDTH/8-1:0];
            assign m_axis_bram_56_tstrb = dwconv1_tstrb[56][M_AXIS_BRAM_56_DMWIDTH/8-1:0];
            assign m_axis_bram_56_tdata = dwconv1_tdata[56][M_AXIS_BRAM_56_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 57) begin
            assign addr0[57][M_AXIS_BRAM_57_ADDR_WIDTH-1:0] = ap_bram_57_addr0;
            assign din0[57][M_AXIS_BRAM_57_WIDTH-1:0] = ap_bram_57_din0;
            assign ap_bram_57_dout0 = dout0[57][M_AXIS_BRAM_57_WIDTH-1:0];
            assign we0[57][M_AXIS_BRAM_57_WIDTH/8-1:0] = ap_bram_57_we0;
            assign en0[57] = ap_bram_57_en0;
            assign addr1[57][M_AXIS_BRAM_57_ADDR_WIDTH-1:0] = ap_bram_57_addr1;
            assign din1[57][M_AXIS_BRAM_57_WIDTH-1:0] = ap_bram_57_din1;
            assign ap_bram_57_dout1 = dout1[57][M_AXIS_BRAM_57_WIDTH-1:0];
            assign we1[57][M_AXIS_BRAM_57_WIDTH/8-1:0] = ap_bram_57_we1;
            assign en1[57] = ap_bram_57_en1;
            
            assign axis_clk[57] = m_axis_bram_57_aclk;
            assign axis_rst[57] = m_axis_bram_57_aresetn;
            assign dwconv1_tready[57] = m_axis_bram_57_tready;
            assign m_axis_bram_57_tlast = dwconv1_tlast[57];
            assign m_axis_bram_57_tvalid = dwconv1_tvalid[57];
            assign m_axis_bram_57_tkeep = dwconv1_tkeep[57][M_AXIS_BRAM_57_DMWIDTH/8-1:0];
            assign m_axis_bram_57_tstrb = dwconv1_tstrb[57][M_AXIS_BRAM_57_DMWIDTH/8-1:0];
            assign m_axis_bram_57_tdata = dwconv1_tdata[57][M_AXIS_BRAM_57_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 58) begin
            assign addr0[58][M_AXIS_BRAM_58_ADDR_WIDTH-1:0] = ap_bram_58_addr0;
            assign din0[58][M_AXIS_BRAM_58_WIDTH-1:0] = ap_bram_58_din0;
            assign ap_bram_58_dout0 = dout0[58][M_AXIS_BRAM_58_WIDTH-1:0];
            assign we0[58][M_AXIS_BRAM_58_WIDTH/8-1:0] = ap_bram_58_we0;
            assign en0[58] = ap_bram_58_en0;
            assign addr1[58][M_AXIS_BRAM_58_ADDR_WIDTH-1:0] = ap_bram_58_addr1;
            assign din1[58][M_AXIS_BRAM_58_WIDTH-1:0] = ap_bram_58_din1;
            assign ap_bram_58_dout1 = dout1[58][M_AXIS_BRAM_58_WIDTH-1:0];
            assign we1[58][M_AXIS_BRAM_58_WIDTH/8-1:0] = ap_bram_58_we1;
            assign en1[58] = ap_bram_58_en1;
            
            assign axis_clk[58] = m_axis_bram_58_aclk;
            assign axis_rst[58] = m_axis_bram_58_aresetn;
            assign dwconv1_tready[58] = m_axis_bram_58_tready;
            assign m_axis_bram_58_tlast = dwconv1_tlast[58];
            assign m_axis_bram_58_tvalid = dwconv1_tvalid[58];
            assign m_axis_bram_58_tkeep = dwconv1_tkeep[58][M_AXIS_BRAM_58_DMWIDTH/8-1:0];
            assign m_axis_bram_58_tstrb = dwconv1_tstrb[58][M_AXIS_BRAM_58_DMWIDTH/8-1:0];
            assign m_axis_bram_58_tdata = dwconv1_tdata[58][M_AXIS_BRAM_58_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 59) begin
            assign addr0[59][M_AXIS_BRAM_59_ADDR_WIDTH-1:0] = ap_bram_59_addr0;
            assign din0[59][M_AXIS_BRAM_59_WIDTH-1:0] = ap_bram_59_din0;
            assign ap_bram_59_dout0 = dout0[59][M_AXIS_BRAM_59_WIDTH-1:0];
            assign we0[59][M_AXIS_BRAM_59_WIDTH/8-1:0] = ap_bram_59_we0;
            assign en0[59] = ap_bram_59_en0;
            assign addr1[59][M_AXIS_BRAM_59_ADDR_WIDTH-1:0] = ap_bram_59_addr1;
            assign din1[59][M_AXIS_BRAM_59_WIDTH-1:0] = ap_bram_59_din1;
            assign ap_bram_59_dout1 = dout1[59][M_AXIS_BRAM_59_WIDTH-1:0];
            assign we1[59][M_AXIS_BRAM_59_WIDTH/8-1:0] = ap_bram_59_we1;
            assign en1[59] = ap_bram_59_en1;
            
            assign axis_clk[59] = m_axis_bram_59_aclk;
            assign axis_rst[59] = m_axis_bram_59_aresetn;
            assign dwconv1_tready[59] = m_axis_bram_59_tready;
            assign m_axis_bram_59_tlast = dwconv1_tlast[59];
            assign m_axis_bram_59_tvalid = dwconv1_tvalid[59];
            assign m_axis_bram_59_tkeep = dwconv1_tkeep[59][M_AXIS_BRAM_59_DMWIDTH/8-1:0];
            assign m_axis_bram_59_tstrb = dwconv1_tstrb[59][M_AXIS_BRAM_59_DMWIDTH/8-1:0];
            assign m_axis_bram_59_tdata = dwconv1_tdata[59][M_AXIS_BRAM_59_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 60) begin
            assign addr0[60][M_AXIS_BRAM_60_ADDR_WIDTH-1:0] = ap_bram_60_addr0;
            assign din0[60][M_AXIS_BRAM_60_WIDTH-1:0] = ap_bram_60_din0;
            assign ap_bram_60_dout0 = dout0[60][M_AXIS_BRAM_60_WIDTH-1:0];
            assign we0[60][M_AXIS_BRAM_60_WIDTH/8-1:0] = ap_bram_60_we0;
            assign en0[60] = ap_bram_60_en0;
            assign addr1[60][M_AXIS_BRAM_60_ADDR_WIDTH-1:0] = ap_bram_60_addr1;
            assign din1[60][M_AXIS_BRAM_60_WIDTH-1:0] = ap_bram_60_din1;
            assign ap_bram_60_dout1 = dout1[60][M_AXIS_BRAM_60_WIDTH-1:0];
            assign we1[60][M_AXIS_BRAM_60_WIDTH/8-1:0] = ap_bram_60_we1;
            assign en1[60] = ap_bram_60_en1;
            
            assign axis_clk[60] = m_axis_bram_60_aclk;
            assign axis_rst[60] = m_axis_bram_60_aresetn;
            assign dwconv1_tready[60] = m_axis_bram_60_tready;
            assign m_axis_bram_60_tlast = dwconv1_tlast[60];
            assign m_axis_bram_60_tvalid = dwconv1_tvalid[60];
            assign m_axis_bram_60_tkeep = dwconv1_tkeep[60][M_AXIS_BRAM_60_DMWIDTH/8-1:0];
            assign m_axis_bram_60_tstrb = dwconv1_tstrb[60][M_AXIS_BRAM_60_DMWIDTH/8-1:0];
            assign m_axis_bram_60_tdata = dwconv1_tdata[60][M_AXIS_BRAM_60_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 61) begin
            assign addr0[61][M_AXIS_BRAM_61_ADDR_WIDTH-1:0] = ap_bram_61_addr0;
            assign din0[61][M_AXIS_BRAM_61_WIDTH-1:0] = ap_bram_61_din0;
            assign ap_bram_61_dout0 = dout0[61][M_AXIS_BRAM_61_WIDTH-1:0];
            assign we0[61][M_AXIS_BRAM_61_WIDTH/8-1:0] = ap_bram_61_we0;
            assign en0[61] = ap_bram_61_en0;
            assign addr1[61][M_AXIS_BRAM_61_ADDR_WIDTH-1:0] = ap_bram_61_addr1;
            assign din1[61][M_AXIS_BRAM_61_WIDTH-1:0] = ap_bram_61_din1;
            assign ap_bram_61_dout1 = dout1[61][M_AXIS_BRAM_61_WIDTH-1:0];
            assign we1[61][M_AXIS_BRAM_61_WIDTH/8-1:0] = ap_bram_61_we1;
            assign en1[61] = ap_bram_61_en1;
            
            assign axis_clk[61] = m_axis_bram_61_aclk;
            assign axis_rst[61] = m_axis_bram_61_aresetn;
            assign dwconv1_tready[61] = m_axis_bram_61_tready;
            assign m_axis_bram_61_tlast = dwconv1_tlast[61];
            assign m_axis_bram_61_tvalid = dwconv1_tvalid[61];
            assign m_axis_bram_61_tkeep = dwconv1_tkeep[61][M_AXIS_BRAM_61_DMWIDTH/8-1:0];
            assign m_axis_bram_61_tstrb = dwconv1_tstrb[61][M_AXIS_BRAM_61_DMWIDTH/8-1:0];
            assign m_axis_bram_61_tdata = dwconv1_tdata[61][M_AXIS_BRAM_61_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 62) begin
            assign addr0[62][M_AXIS_BRAM_62_ADDR_WIDTH-1:0] = ap_bram_62_addr0;
            assign din0[62][M_AXIS_BRAM_62_WIDTH-1:0] = ap_bram_62_din0;
            assign ap_bram_62_dout0 = dout0[62][M_AXIS_BRAM_62_WIDTH-1:0];
            assign we0[62][M_AXIS_BRAM_62_WIDTH/8-1:0] = ap_bram_62_we0;
            assign en0[62] = ap_bram_62_en0;
            assign addr1[62][M_AXIS_BRAM_62_ADDR_WIDTH-1:0] = ap_bram_62_addr1;
            assign din1[62][M_AXIS_BRAM_62_WIDTH-1:0] = ap_bram_62_din1;
            assign ap_bram_62_dout1 = dout1[62][M_AXIS_BRAM_62_WIDTH-1:0];
            assign we1[62][M_AXIS_BRAM_62_WIDTH/8-1:0] = ap_bram_62_we1;
            assign en1[62] = ap_bram_62_en1;
            
            assign axis_clk[62] = m_axis_bram_62_aclk;
            assign axis_rst[62] = m_axis_bram_62_aresetn;
            assign dwconv1_tready[62] = m_axis_bram_62_tready;
            assign m_axis_bram_62_tlast = dwconv1_tlast[62];
            assign m_axis_bram_62_tvalid = dwconv1_tvalid[62];
            assign m_axis_bram_62_tkeep = dwconv1_tkeep[62][M_AXIS_BRAM_62_DMWIDTH/8-1:0];
            assign m_axis_bram_62_tstrb = dwconv1_tstrb[62][M_AXIS_BRAM_62_DMWIDTH/8-1:0];
            assign m_axis_bram_62_tdata = dwconv1_tdata[62][M_AXIS_BRAM_62_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 63) begin
            assign addr0[63][M_AXIS_BRAM_63_ADDR_WIDTH-1:0] = ap_bram_63_addr0;
            assign din0[63][M_AXIS_BRAM_63_WIDTH-1:0] = ap_bram_63_din0;
            assign ap_bram_63_dout0 = dout0[63][M_AXIS_BRAM_63_WIDTH-1:0];
            assign we0[63][M_AXIS_BRAM_63_WIDTH/8-1:0] = ap_bram_63_we0;
            assign en0[63] = ap_bram_63_en0;
            assign addr1[63][M_AXIS_BRAM_63_ADDR_WIDTH-1:0] = ap_bram_63_addr1;
            assign din1[63][M_AXIS_BRAM_63_WIDTH-1:0] = ap_bram_63_din1;
            assign ap_bram_63_dout1 = dout1[63][M_AXIS_BRAM_63_WIDTH-1:0];
            assign we1[63][M_AXIS_BRAM_63_WIDTH/8-1:0] = ap_bram_63_we1;
            assign en1[63] = ap_bram_63_en1;
            
            assign axis_clk[63] = m_axis_bram_63_aclk;
            assign axis_rst[63] = m_axis_bram_63_aresetn;
            assign dwconv1_tready[63] = m_axis_bram_63_tready;
            assign m_axis_bram_63_tlast = dwconv1_tlast[63];
            assign m_axis_bram_63_tvalid = dwconv1_tvalid[63];
            assign m_axis_bram_63_tkeep = dwconv1_tkeep[63][M_AXIS_BRAM_63_DMWIDTH/8-1:0];
            assign m_axis_bram_63_tstrb = dwconv1_tstrb[63][M_AXIS_BRAM_63_DMWIDTH/8-1:0];
            assign m_axis_bram_63_tdata = dwconv1_tdata[63][M_AXIS_BRAM_63_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 64) begin
            assign addr0[64][M_AXIS_BRAM_64_ADDR_WIDTH-1:0] = ap_bram_64_addr0;
            assign din0[64][M_AXIS_BRAM_64_WIDTH-1:0] = ap_bram_64_din0;
            assign ap_bram_64_dout0 = dout0[64][M_AXIS_BRAM_64_WIDTH-1:0];
            assign we0[64][M_AXIS_BRAM_64_WIDTH/8-1:0] = ap_bram_64_we0;
            assign en0[64] = ap_bram_64_en0;
            assign addr1[64][M_AXIS_BRAM_64_ADDR_WIDTH-1:0] = ap_bram_64_addr1;
            assign din1[64][M_AXIS_BRAM_64_WIDTH-1:0] = ap_bram_64_din1;
            assign ap_bram_64_dout1 = dout1[64][M_AXIS_BRAM_64_WIDTH-1:0];
            assign we1[64][M_AXIS_BRAM_64_WIDTH/8-1:0] = ap_bram_64_we1;
            assign en1[64] = ap_bram_64_en1;
            
            assign axis_clk[64] = m_axis_bram_64_aclk;
            assign axis_rst[64] = m_axis_bram_64_aresetn;
            assign dwconv1_tready[64] = m_axis_bram_64_tready;
            assign m_axis_bram_64_tlast = dwconv1_tlast[64];
            assign m_axis_bram_64_tvalid = dwconv1_tvalid[64];
            assign m_axis_bram_64_tkeep = dwconv1_tkeep[64][M_AXIS_BRAM_64_DMWIDTH/8-1:0];
            assign m_axis_bram_64_tstrb = dwconv1_tstrb[64][M_AXIS_BRAM_64_DMWIDTH/8-1:0];
            assign m_axis_bram_64_tdata = dwconv1_tdata[64][M_AXIS_BRAM_64_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 65) begin
            assign addr0[65][M_AXIS_BRAM_65_ADDR_WIDTH-1:0] = ap_bram_65_addr0;
            assign din0[65][M_AXIS_BRAM_65_WIDTH-1:0] = ap_bram_65_din0;
            assign ap_bram_65_dout0 = dout0[65][M_AXIS_BRAM_65_WIDTH-1:0];
            assign we0[65][M_AXIS_BRAM_65_WIDTH/8-1:0] = ap_bram_65_we0;
            assign en0[65] = ap_bram_65_en0;
            assign addr1[65][M_AXIS_BRAM_65_ADDR_WIDTH-1:0] = ap_bram_65_addr1;
            assign din1[65][M_AXIS_BRAM_65_WIDTH-1:0] = ap_bram_65_din1;
            assign ap_bram_65_dout1 = dout1[65][M_AXIS_BRAM_65_WIDTH-1:0];
            assign we1[65][M_AXIS_BRAM_65_WIDTH/8-1:0] = ap_bram_65_we1;
            assign en1[65] = ap_bram_65_en1;
            
            assign axis_clk[65] = m_axis_bram_65_aclk;
            assign axis_rst[65] = m_axis_bram_65_aresetn;
            assign dwconv1_tready[65] = m_axis_bram_65_tready;
            assign m_axis_bram_65_tlast = dwconv1_tlast[65];
            assign m_axis_bram_65_tvalid = dwconv1_tvalid[65];
            assign m_axis_bram_65_tkeep = dwconv1_tkeep[65][M_AXIS_BRAM_65_DMWIDTH/8-1:0];
            assign m_axis_bram_65_tstrb = dwconv1_tstrb[65][M_AXIS_BRAM_65_DMWIDTH/8-1:0];
            assign m_axis_bram_65_tdata = dwconv1_tdata[65][M_AXIS_BRAM_65_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 66) begin
            assign addr0[66][M_AXIS_BRAM_66_ADDR_WIDTH-1:0] = ap_bram_66_addr0;
            assign din0[66][M_AXIS_BRAM_66_WIDTH-1:0] = ap_bram_66_din0;
            assign ap_bram_66_dout0 = dout0[66][M_AXIS_BRAM_66_WIDTH-1:0];
            assign we0[66][M_AXIS_BRAM_66_WIDTH/8-1:0] = ap_bram_66_we0;
            assign en0[66] = ap_bram_66_en0;
            assign addr1[66][M_AXIS_BRAM_66_ADDR_WIDTH-1:0] = ap_bram_66_addr1;
            assign din1[66][M_AXIS_BRAM_66_WIDTH-1:0] = ap_bram_66_din1;
            assign ap_bram_66_dout1 = dout1[66][M_AXIS_BRAM_66_WIDTH-1:0];
            assign we1[66][M_AXIS_BRAM_66_WIDTH/8-1:0] = ap_bram_66_we1;
            assign en1[66] = ap_bram_66_en1;
            
            assign axis_clk[66] = m_axis_bram_66_aclk;
            assign axis_rst[66] = m_axis_bram_66_aresetn;
            assign dwconv1_tready[66] = m_axis_bram_66_tready;
            assign m_axis_bram_66_tlast = dwconv1_tlast[66];
            assign m_axis_bram_66_tvalid = dwconv1_tvalid[66];
            assign m_axis_bram_66_tkeep = dwconv1_tkeep[66][M_AXIS_BRAM_66_DMWIDTH/8-1:0];
            assign m_axis_bram_66_tstrb = dwconv1_tstrb[66][M_AXIS_BRAM_66_DMWIDTH/8-1:0];
            assign m_axis_bram_66_tdata = dwconv1_tdata[66][M_AXIS_BRAM_66_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 67) begin
            assign addr0[67][M_AXIS_BRAM_67_ADDR_WIDTH-1:0] = ap_bram_67_addr0;
            assign din0[67][M_AXIS_BRAM_67_WIDTH-1:0] = ap_bram_67_din0;
            assign ap_bram_67_dout0 = dout0[67][M_AXIS_BRAM_67_WIDTH-1:0];
            assign we0[67][M_AXIS_BRAM_67_WIDTH/8-1:0] = ap_bram_67_we0;
            assign en0[67] = ap_bram_67_en0;
            assign addr1[67][M_AXIS_BRAM_67_ADDR_WIDTH-1:0] = ap_bram_67_addr1;
            assign din1[67][M_AXIS_BRAM_67_WIDTH-1:0] = ap_bram_67_din1;
            assign ap_bram_67_dout1 = dout1[67][M_AXIS_BRAM_67_WIDTH-1:0];
            assign we1[67][M_AXIS_BRAM_67_WIDTH/8-1:0] = ap_bram_67_we1;
            assign en1[67] = ap_bram_67_en1;
            
            assign axis_clk[67] = m_axis_bram_67_aclk;
            assign axis_rst[67] = m_axis_bram_67_aresetn;
            assign dwconv1_tready[67] = m_axis_bram_67_tready;
            assign m_axis_bram_67_tlast = dwconv1_tlast[67];
            assign m_axis_bram_67_tvalid = dwconv1_tvalid[67];
            assign m_axis_bram_67_tkeep = dwconv1_tkeep[67][M_AXIS_BRAM_67_DMWIDTH/8-1:0];
            assign m_axis_bram_67_tstrb = dwconv1_tstrb[67][M_AXIS_BRAM_67_DMWIDTH/8-1:0];
            assign m_axis_bram_67_tdata = dwconv1_tdata[67][M_AXIS_BRAM_67_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 68) begin
            assign addr0[68][M_AXIS_BRAM_68_ADDR_WIDTH-1:0] = ap_bram_68_addr0;
            assign din0[68][M_AXIS_BRAM_68_WIDTH-1:0] = ap_bram_68_din0;
            assign ap_bram_68_dout0 = dout0[68][M_AXIS_BRAM_68_WIDTH-1:0];
            assign we0[68][M_AXIS_BRAM_68_WIDTH/8-1:0] = ap_bram_68_we0;
            assign en0[68] = ap_bram_68_en0;
            assign addr1[68][M_AXIS_BRAM_68_ADDR_WIDTH-1:0] = ap_bram_68_addr1;
            assign din1[68][M_AXIS_BRAM_68_WIDTH-1:0] = ap_bram_68_din1;
            assign ap_bram_68_dout1 = dout1[68][M_AXIS_BRAM_68_WIDTH-1:0];
            assign we1[68][M_AXIS_BRAM_68_WIDTH/8-1:0] = ap_bram_68_we1;
            assign en1[68] = ap_bram_68_en1;
            
            assign axis_clk[68] = m_axis_bram_68_aclk;
            assign axis_rst[68] = m_axis_bram_68_aresetn;
            assign dwconv1_tready[68] = m_axis_bram_68_tready;
            assign m_axis_bram_68_tlast = dwconv1_tlast[68];
            assign m_axis_bram_68_tvalid = dwconv1_tvalid[68];
            assign m_axis_bram_68_tkeep = dwconv1_tkeep[68][M_AXIS_BRAM_68_DMWIDTH/8-1:0];
            assign m_axis_bram_68_tstrb = dwconv1_tstrb[68][M_AXIS_BRAM_68_DMWIDTH/8-1:0];
            assign m_axis_bram_68_tdata = dwconv1_tdata[68][M_AXIS_BRAM_68_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 69) begin
            assign addr0[69][M_AXIS_BRAM_69_ADDR_WIDTH-1:0] = ap_bram_69_addr0;
            assign din0[69][M_AXIS_BRAM_69_WIDTH-1:0] = ap_bram_69_din0;
            assign ap_bram_69_dout0 = dout0[69][M_AXIS_BRAM_69_WIDTH-1:0];
            assign we0[69][M_AXIS_BRAM_69_WIDTH/8-1:0] = ap_bram_69_we0;
            assign en0[69] = ap_bram_69_en0;
            assign addr1[69][M_AXIS_BRAM_69_ADDR_WIDTH-1:0] = ap_bram_69_addr1;
            assign din1[69][M_AXIS_BRAM_69_WIDTH-1:0] = ap_bram_69_din1;
            assign ap_bram_69_dout1 = dout1[69][M_AXIS_BRAM_69_WIDTH-1:0];
            assign we1[69][M_AXIS_BRAM_69_WIDTH/8-1:0] = ap_bram_69_we1;
            assign en1[69] = ap_bram_69_en1;
            
            assign axis_clk[69] = m_axis_bram_69_aclk;
            assign axis_rst[69] = m_axis_bram_69_aresetn;
            assign dwconv1_tready[69] = m_axis_bram_69_tready;
            assign m_axis_bram_69_tlast = dwconv1_tlast[69];
            assign m_axis_bram_69_tvalid = dwconv1_tvalid[69];
            assign m_axis_bram_69_tkeep = dwconv1_tkeep[69][M_AXIS_BRAM_69_DMWIDTH/8-1:0];
            assign m_axis_bram_69_tstrb = dwconv1_tstrb[69][M_AXIS_BRAM_69_DMWIDTH/8-1:0];
            assign m_axis_bram_69_tdata = dwconv1_tdata[69][M_AXIS_BRAM_69_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 70) begin
            assign addr0[70][M_AXIS_BRAM_70_ADDR_WIDTH-1:0] = ap_bram_70_addr0;
            assign din0[70][M_AXIS_BRAM_70_WIDTH-1:0] = ap_bram_70_din0;
            assign ap_bram_70_dout0 = dout0[70][M_AXIS_BRAM_70_WIDTH-1:0];
            assign we0[70][M_AXIS_BRAM_70_WIDTH/8-1:0] = ap_bram_70_we0;
            assign en0[70] = ap_bram_70_en0;
            assign addr1[70][M_AXIS_BRAM_70_ADDR_WIDTH-1:0] = ap_bram_70_addr1;
            assign din1[70][M_AXIS_BRAM_70_WIDTH-1:0] = ap_bram_70_din1;
            assign ap_bram_70_dout1 = dout1[70][M_AXIS_BRAM_70_WIDTH-1:0];
            assign we1[70][M_AXIS_BRAM_70_WIDTH/8-1:0] = ap_bram_70_we1;
            assign en1[70] = ap_bram_70_en1;
            
            assign axis_clk[70] = m_axis_bram_70_aclk;
            assign axis_rst[70] = m_axis_bram_70_aresetn;
            assign dwconv1_tready[70] = m_axis_bram_70_tready;
            assign m_axis_bram_70_tlast = dwconv1_tlast[70];
            assign m_axis_bram_70_tvalid = dwconv1_tvalid[70];
            assign m_axis_bram_70_tkeep = dwconv1_tkeep[70][M_AXIS_BRAM_70_DMWIDTH/8-1:0];
            assign m_axis_bram_70_tstrb = dwconv1_tstrb[70][M_AXIS_BRAM_70_DMWIDTH/8-1:0];
            assign m_axis_bram_70_tdata = dwconv1_tdata[70][M_AXIS_BRAM_70_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 71) begin
            assign addr0[71][M_AXIS_BRAM_71_ADDR_WIDTH-1:0] = ap_bram_71_addr0;
            assign din0[71][M_AXIS_BRAM_71_WIDTH-1:0] = ap_bram_71_din0;
            assign ap_bram_71_dout0 = dout0[71][M_AXIS_BRAM_71_WIDTH-1:0];
            assign we0[71][M_AXIS_BRAM_71_WIDTH/8-1:0] = ap_bram_71_we0;
            assign en0[71] = ap_bram_71_en0;
            assign addr1[71][M_AXIS_BRAM_71_ADDR_WIDTH-1:0] = ap_bram_71_addr1;
            assign din1[71][M_AXIS_BRAM_71_WIDTH-1:0] = ap_bram_71_din1;
            assign ap_bram_71_dout1 = dout1[71][M_AXIS_BRAM_71_WIDTH-1:0];
            assign we1[71][M_AXIS_BRAM_71_WIDTH/8-1:0] = ap_bram_71_we1;
            assign en1[71] = ap_bram_71_en1;
            
            assign axis_clk[71] = m_axis_bram_71_aclk;
            assign axis_rst[71] = m_axis_bram_71_aresetn;
            assign dwconv1_tready[71] = m_axis_bram_71_tready;
            assign m_axis_bram_71_tlast = dwconv1_tlast[71];
            assign m_axis_bram_71_tvalid = dwconv1_tvalid[71];
            assign m_axis_bram_71_tkeep = dwconv1_tkeep[71][M_AXIS_BRAM_71_DMWIDTH/8-1:0];
            assign m_axis_bram_71_tstrb = dwconv1_tstrb[71][M_AXIS_BRAM_71_DMWIDTH/8-1:0];
            assign m_axis_bram_71_tdata = dwconv1_tdata[71][M_AXIS_BRAM_71_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 72) begin
            assign addr0[72][M_AXIS_BRAM_72_ADDR_WIDTH-1:0] = ap_bram_72_addr0;
            assign din0[72][M_AXIS_BRAM_72_WIDTH-1:0] = ap_bram_72_din0;
            assign ap_bram_72_dout0 = dout0[72][M_AXIS_BRAM_72_WIDTH-1:0];
            assign we0[72][M_AXIS_BRAM_72_WIDTH/8-1:0] = ap_bram_72_we0;
            assign en0[72] = ap_bram_72_en0;
            assign addr1[72][M_AXIS_BRAM_72_ADDR_WIDTH-1:0] = ap_bram_72_addr1;
            assign din1[72][M_AXIS_BRAM_72_WIDTH-1:0] = ap_bram_72_din1;
            assign ap_bram_72_dout1 = dout1[72][M_AXIS_BRAM_72_WIDTH-1:0];
            assign we1[72][M_AXIS_BRAM_72_WIDTH/8-1:0] = ap_bram_72_we1;
            assign en1[72] = ap_bram_72_en1;
            
            assign axis_clk[72] = m_axis_bram_72_aclk;
            assign axis_rst[72] = m_axis_bram_72_aresetn;
            assign dwconv1_tready[72] = m_axis_bram_72_tready;
            assign m_axis_bram_72_tlast = dwconv1_tlast[72];
            assign m_axis_bram_72_tvalid = dwconv1_tvalid[72];
            assign m_axis_bram_72_tkeep = dwconv1_tkeep[72][M_AXIS_BRAM_72_DMWIDTH/8-1:0];
            assign m_axis_bram_72_tstrb = dwconv1_tstrb[72][M_AXIS_BRAM_72_DMWIDTH/8-1:0];
            assign m_axis_bram_72_tdata = dwconv1_tdata[72][M_AXIS_BRAM_72_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 73) begin
            assign addr0[73][M_AXIS_BRAM_73_ADDR_WIDTH-1:0] = ap_bram_73_addr0;
            assign din0[73][M_AXIS_BRAM_73_WIDTH-1:0] = ap_bram_73_din0;
            assign ap_bram_73_dout0 = dout0[73][M_AXIS_BRAM_73_WIDTH-1:0];
            assign we0[73][M_AXIS_BRAM_73_WIDTH/8-1:0] = ap_bram_73_we0;
            assign en0[73] = ap_bram_73_en0;
            assign addr1[73][M_AXIS_BRAM_73_ADDR_WIDTH-1:0] = ap_bram_73_addr1;
            assign din1[73][M_AXIS_BRAM_73_WIDTH-1:0] = ap_bram_73_din1;
            assign ap_bram_73_dout1 = dout1[73][M_AXIS_BRAM_73_WIDTH-1:0];
            assign we1[73][M_AXIS_BRAM_73_WIDTH/8-1:0] = ap_bram_73_we1;
            assign en1[73] = ap_bram_73_en1;
            
            assign axis_clk[73] = m_axis_bram_73_aclk;
            assign axis_rst[73] = m_axis_bram_73_aresetn;
            assign dwconv1_tready[73] = m_axis_bram_73_tready;
            assign m_axis_bram_73_tlast = dwconv1_tlast[73];
            assign m_axis_bram_73_tvalid = dwconv1_tvalid[73];
            assign m_axis_bram_73_tkeep = dwconv1_tkeep[73][M_AXIS_BRAM_73_DMWIDTH/8-1:0];
            assign m_axis_bram_73_tstrb = dwconv1_tstrb[73][M_AXIS_BRAM_73_DMWIDTH/8-1:0];
            assign m_axis_bram_73_tdata = dwconv1_tdata[73][M_AXIS_BRAM_73_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 74) begin
            assign addr0[74][M_AXIS_BRAM_74_ADDR_WIDTH-1:0] = ap_bram_74_addr0;
            assign din0[74][M_AXIS_BRAM_74_WIDTH-1:0] = ap_bram_74_din0;
            assign ap_bram_74_dout0 = dout0[74][M_AXIS_BRAM_74_WIDTH-1:0];
            assign we0[74][M_AXIS_BRAM_74_WIDTH/8-1:0] = ap_bram_74_we0;
            assign en0[74] = ap_bram_74_en0;
            assign addr1[74][M_AXIS_BRAM_74_ADDR_WIDTH-1:0] = ap_bram_74_addr1;
            assign din1[74][M_AXIS_BRAM_74_WIDTH-1:0] = ap_bram_74_din1;
            assign ap_bram_74_dout1 = dout1[74][M_AXIS_BRAM_74_WIDTH-1:0];
            assign we1[74][M_AXIS_BRAM_74_WIDTH/8-1:0] = ap_bram_74_we1;
            assign en1[74] = ap_bram_74_en1;
            
            assign axis_clk[74] = m_axis_bram_74_aclk;
            assign axis_rst[74] = m_axis_bram_74_aresetn;
            assign dwconv1_tready[74] = m_axis_bram_74_tready;
            assign m_axis_bram_74_tlast = dwconv1_tlast[74];
            assign m_axis_bram_74_tvalid = dwconv1_tvalid[74];
            assign m_axis_bram_74_tkeep = dwconv1_tkeep[74][M_AXIS_BRAM_74_DMWIDTH/8-1:0];
            assign m_axis_bram_74_tstrb = dwconv1_tstrb[74][M_AXIS_BRAM_74_DMWIDTH/8-1:0];
            assign m_axis_bram_74_tdata = dwconv1_tdata[74][M_AXIS_BRAM_74_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 75) begin
            assign addr0[75][M_AXIS_BRAM_75_ADDR_WIDTH-1:0] = ap_bram_75_addr0;
            assign din0[75][M_AXIS_BRAM_75_WIDTH-1:0] = ap_bram_75_din0;
            assign ap_bram_75_dout0 = dout0[75][M_AXIS_BRAM_75_WIDTH-1:0];
            assign we0[75][M_AXIS_BRAM_75_WIDTH/8-1:0] = ap_bram_75_we0;
            assign en0[75] = ap_bram_75_en0;
            assign addr1[75][M_AXIS_BRAM_75_ADDR_WIDTH-1:0] = ap_bram_75_addr1;
            assign din1[75][M_AXIS_BRAM_75_WIDTH-1:0] = ap_bram_75_din1;
            assign ap_bram_75_dout1 = dout1[75][M_AXIS_BRAM_75_WIDTH-1:0];
            assign we1[75][M_AXIS_BRAM_75_WIDTH/8-1:0] = ap_bram_75_we1;
            assign en1[75] = ap_bram_75_en1;
            
            assign axis_clk[75] = m_axis_bram_75_aclk;
            assign axis_rst[75] = m_axis_bram_75_aresetn;
            assign dwconv1_tready[75] = m_axis_bram_75_tready;
            assign m_axis_bram_75_tlast = dwconv1_tlast[75];
            assign m_axis_bram_75_tvalid = dwconv1_tvalid[75];
            assign m_axis_bram_75_tkeep = dwconv1_tkeep[75][M_AXIS_BRAM_75_DMWIDTH/8-1:0];
            assign m_axis_bram_75_tstrb = dwconv1_tstrb[75][M_AXIS_BRAM_75_DMWIDTH/8-1:0];
            assign m_axis_bram_75_tdata = dwconv1_tdata[75][M_AXIS_BRAM_75_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 76) begin
            assign addr0[76][M_AXIS_BRAM_76_ADDR_WIDTH-1:0] = ap_bram_76_addr0;
            assign din0[76][M_AXIS_BRAM_76_WIDTH-1:0] = ap_bram_76_din0;
            assign ap_bram_76_dout0 = dout0[76][M_AXIS_BRAM_76_WIDTH-1:0];
            assign we0[76][M_AXIS_BRAM_76_WIDTH/8-1:0] = ap_bram_76_we0;
            assign en0[76] = ap_bram_76_en0;
            assign addr1[76][M_AXIS_BRAM_76_ADDR_WIDTH-1:0] = ap_bram_76_addr1;
            assign din1[76][M_AXIS_BRAM_76_WIDTH-1:0] = ap_bram_76_din1;
            assign ap_bram_76_dout1 = dout1[76][M_AXIS_BRAM_76_WIDTH-1:0];
            assign we1[76][M_AXIS_BRAM_76_WIDTH/8-1:0] = ap_bram_76_we1;
            assign en1[76] = ap_bram_76_en1;
            
            assign axis_clk[76] = m_axis_bram_76_aclk;
            assign axis_rst[76] = m_axis_bram_76_aresetn;
            assign dwconv1_tready[76] = m_axis_bram_76_tready;
            assign m_axis_bram_76_tlast = dwconv1_tlast[76];
            assign m_axis_bram_76_tvalid = dwconv1_tvalid[76];
            assign m_axis_bram_76_tkeep = dwconv1_tkeep[76][M_AXIS_BRAM_76_DMWIDTH/8-1:0];
            assign m_axis_bram_76_tstrb = dwconv1_tstrb[76][M_AXIS_BRAM_76_DMWIDTH/8-1:0];
            assign m_axis_bram_76_tdata = dwconv1_tdata[76][M_AXIS_BRAM_76_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 77) begin
            assign addr0[77][M_AXIS_BRAM_77_ADDR_WIDTH-1:0] = ap_bram_77_addr0;
            assign din0[77][M_AXIS_BRAM_77_WIDTH-1:0] = ap_bram_77_din0;
            assign ap_bram_77_dout0 = dout0[77][M_AXIS_BRAM_77_WIDTH-1:0];
            assign we0[77][M_AXIS_BRAM_77_WIDTH/8-1:0] = ap_bram_77_we0;
            assign en0[77] = ap_bram_77_en0;
            assign addr1[77][M_AXIS_BRAM_77_ADDR_WIDTH-1:0] = ap_bram_77_addr1;
            assign din1[77][M_AXIS_BRAM_77_WIDTH-1:0] = ap_bram_77_din1;
            assign ap_bram_77_dout1 = dout1[77][M_AXIS_BRAM_77_WIDTH-1:0];
            assign we1[77][M_AXIS_BRAM_77_WIDTH/8-1:0] = ap_bram_77_we1;
            assign en1[77] = ap_bram_77_en1;
            
            assign axis_clk[77] = m_axis_bram_77_aclk;
            assign axis_rst[77] = m_axis_bram_77_aresetn;
            assign dwconv1_tready[77] = m_axis_bram_77_tready;
            assign m_axis_bram_77_tlast = dwconv1_tlast[77];
            assign m_axis_bram_77_tvalid = dwconv1_tvalid[77];
            assign m_axis_bram_77_tkeep = dwconv1_tkeep[77][M_AXIS_BRAM_77_DMWIDTH/8-1:0];
            assign m_axis_bram_77_tstrb = dwconv1_tstrb[77][M_AXIS_BRAM_77_DMWIDTH/8-1:0];
            assign m_axis_bram_77_tdata = dwconv1_tdata[77][M_AXIS_BRAM_77_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 78) begin
            assign addr0[78][M_AXIS_BRAM_78_ADDR_WIDTH-1:0] = ap_bram_78_addr0;
            assign din0[78][M_AXIS_BRAM_78_WIDTH-1:0] = ap_bram_78_din0;
            assign ap_bram_78_dout0 = dout0[78][M_AXIS_BRAM_78_WIDTH-1:0];
            assign we0[78][M_AXIS_BRAM_78_WIDTH/8-1:0] = ap_bram_78_we0;
            assign en0[78] = ap_bram_78_en0;
            assign addr1[78][M_AXIS_BRAM_78_ADDR_WIDTH-1:0] = ap_bram_78_addr1;
            assign din1[78][M_AXIS_BRAM_78_WIDTH-1:0] = ap_bram_78_din1;
            assign ap_bram_78_dout1 = dout1[78][M_AXIS_BRAM_78_WIDTH-1:0];
            assign we1[78][M_AXIS_BRAM_78_WIDTH/8-1:0] = ap_bram_78_we1;
            assign en1[78] = ap_bram_78_en1;
            
            assign axis_clk[78] = m_axis_bram_78_aclk;
            assign axis_rst[78] = m_axis_bram_78_aresetn;
            assign dwconv1_tready[78] = m_axis_bram_78_tready;
            assign m_axis_bram_78_tlast = dwconv1_tlast[78];
            assign m_axis_bram_78_tvalid = dwconv1_tvalid[78];
            assign m_axis_bram_78_tkeep = dwconv1_tkeep[78][M_AXIS_BRAM_78_DMWIDTH/8-1:0];
            assign m_axis_bram_78_tstrb = dwconv1_tstrb[78][M_AXIS_BRAM_78_DMWIDTH/8-1:0];
            assign m_axis_bram_78_tdata = dwconv1_tdata[78][M_AXIS_BRAM_78_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 79) begin
            assign addr0[79][M_AXIS_BRAM_79_ADDR_WIDTH-1:0] = ap_bram_79_addr0;
            assign din0[79][M_AXIS_BRAM_79_WIDTH-1:0] = ap_bram_79_din0;
            assign ap_bram_79_dout0 = dout0[79][M_AXIS_BRAM_79_WIDTH-1:0];
            assign we0[79][M_AXIS_BRAM_79_WIDTH/8-1:0] = ap_bram_79_we0;
            assign en0[79] = ap_bram_79_en0;
            assign addr1[79][M_AXIS_BRAM_79_ADDR_WIDTH-1:0] = ap_bram_79_addr1;
            assign din1[79][M_AXIS_BRAM_79_WIDTH-1:0] = ap_bram_79_din1;
            assign ap_bram_79_dout1 = dout1[79][M_AXIS_BRAM_79_WIDTH-1:0];
            assign we1[79][M_AXIS_BRAM_79_WIDTH/8-1:0] = ap_bram_79_we1;
            assign en1[79] = ap_bram_79_en1;
            
            assign axis_clk[79] = m_axis_bram_79_aclk;
            assign axis_rst[79] = m_axis_bram_79_aresetn;
            assign dwconv1_tready[79] = m_axis_bram_79_tready;
            assign m_axis_bram_79_tlast = dwconv1_tlast[79];
            assign m_axis_bram_79_tvalid = dwconv1_tvalid[79];
            assign m_axis_bram_79_tkeep = dwconv1_tkeep[79][M_AXIS_BRAM_79_DMWIDTH/8-1:0];
            assign m_axis_bram_79_tstrb = dwconv1_tstrb[79][M_AXIS_BRAM_79_DMWIDTH/8-1:0];
            assign m_axis_bram_79_tdata = dwconv1_tdata[79][M_AXIS_BRAM_79_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 80) begin
            assign addr0[80][M_AXIS_BRAM_80_ADDR_WIDTH-1:0] = ap_bram_80_addr0;
            assign din0[80][M_AXIS_BRAM_80_WIDTH-1:0] = ap_bram_80_din0;
            assign ap_bram_80_dout0 = dout0[80][M_AXIS_BRAM_80_WIDTH-1:0];
            assign we0[80][M_AXIS_BRAM_80_WIDTH/8-1:0] = ap_bram_80_we0;
            assign en0[80] = ap_bram_80_en0;
            assign addr1[80][M_AXIS_BRAM_80_ADDR_WIDTH-1:0] = ap_bram_80_addr1;
            assign din1[80][M_AXIS_BRAM_80_WIDTH-1:0] = ap_bram_80_din1;
            assign ap_bram_80_dout1 = dout1[80][M_AXIS_BRAM_80_WIDTH-1:0];
            assign we1[80][M_AXIS_BRAM_80_WIDTH/8-1:0] = ap_bram_80_we1;
            assign en1[80] = ap_bram_80_en1;
            
            assign axis_clk[80] = m_axis_bram_80_aclk;
            assign axis_rst[80] = m_axis_bram_80_aresetn;
            assign dwconv1_tready[80] = m_axis_bram_80_tready;
            assign m_axis_bram_80_tlast = dwconv1_tlast[80];
            assign m_axis_bram_80_tvalid = dwconv1_tvalid[80];
            assign m_axis_bram_80_tkeep = dwconv1_tkeep[80][M_AXIS_BRAM_80_DMWIDTH/8-1:0];
            assign m_axis_bram_80_tstrb = dwconv1_tstrb[80][M_AXIS_BRAM_80_DMWIDTH/8-1:0];
            assign m_axis_bram_80_tdata = dwconv1_tdata[80][M_AXIS_BRAM_80_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 81) begin
            assign addr0[81][M_AXIS_BRAM_81_ADDR_WIDTH-1:0] = ap_bram_81_addr0;
            assign din0[81][M_AXIS_BRAM_81_WIDTH-1:0] = ap_bram_81_din0;
            assign ap_bram_81_dout0 = dout0[81][M_AXIS_BRAM_81_WIDTH-1:0];
            assign we0[81][M_AXIS_BRAM_81_WIDTH/8-1:0] = ap_bram_81_we0;
            assign en0[81] = ap_bram_81_en0;
            assign addr1[81][M_AXIS_BRAM_81_ADDR_WIDTH-1:0] = ap_bram_81_addr1;
            assign din1[81][M_AXIS_BRAM_81_WIDTH-1:0] = ap_bram_81_din1;
            assign ap_bram_81_dout1 = dout1[81][M_AXIS_BRAM_81_WIDTH-1:0];
            assign we1[81][M_AXIS_BRAM_81_WIDTH/8-1:0] = ap_bram_81_we1;
            assign en1[81] = ap_bram_81_en1;
            
            assign axis_clk[81] = m_axis_bram_81_aclk;
            assign axis_rst[81] = m_axis_bram_81_aresetn;
            assign dwconv1_tready[81] = m_axis_bram_81_tready;
            assign m_axis_bram_81_tlast = dwconv1_tlast[81];
            assign m_axis_bram_81_tvalid = dwconv1_tvalid[81];
            assign m_axis_bram_81_tkeep = dwconv1_tkeep[81][M_AXIS_BRAM_81_DMWIDTH/8-1:0];
            assign m_axis_bram_81_tstrb = dwconv1_tstrb[81][M_AXIS_BRAM_81_DMWIDTH/8-1:0];
            assign m_axis_bram_81_tdata = dwconv1_tdata[81][M_AXIS_BRAM_81_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 82) begin
            assign addr0[82][M_AXIS_BRAM_82_ADDR_WIDTH-1:0] = ap_bram_82_addr0;
            assign din0[82][M_AXIS_BRAM_82_WIDTH-1:0] = ap_bram_82_din0;
            assign ap_bram_82_dout0 = dout0[82][M_AXIS_BRAM_82_WIDTH-1:0];
            assign we0[82][M_AXIS_BRAM_82_WIDTH/8-1:0] = ap_bram_82_we0;
            assign en0[82] = ap_bram_82_en0;
            assign addr1[82][M_AXIS_BRAM_82_ADDR_WIDTH-1:0] = ap_bram_82_addr1;
            assign din1[82][M_AXIS_BRAM_82_WIDTH-1:0] = ap_bram_82_din1;
            assign ap_bram_82_dout1 = dout1[82][M_AXIS_BRAM_82_WIDTH-1:0];
            assign we1[82][M_AXIS_BRAM_82_WIDTH/8-1:0] = ap_bram_82_we1;
            assign en1[82] = ap_bram_82_en1;
            
            assign axis_clk[82] = m_axis_bram_82_aclk;
            assign axis_rst[82] = m_axis_bram_82_aresetn;
            assign dwconv1_tready[82] = m_axis_bram_82_tready;
            assign m_axis_bram_82_tlast = dwconv1_tlast[82];
            assign m_axis_bram_82_tvalid = dwconv1_tvalid[82];
            assign m_axis_bram_82_tkeep = dwconv1_tkeep[82][M_AXIS_BRAM_82_DMWIDTH/8-1:0];
            assign m_axis_bram_82_tstrb = dwconv1_tstrb[82][M_AXIS_BRAM_82_DMWIDTH/8-1:0];
            assign m_axis_bram_82_tdata = dwconv1_tdata[82][M_AXIS_BRAM_82_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 83) begin
            assign addr0[83][M_AXIS_BRAM_83_ADDR_WIDTH-1:0] = ap_bram_83_addr0;
            assign din0[83][M_AXIS_BRAM_83_WIDTH-1:0] = ap_bram_83_din0;
            assign ap_bram_83_dout0 = dout0[83][M_AXIS_BRAM_83_WIDTH-1:0];
            assign we0[83][M_AXIS_BRAM_83_WIDTH/8-1:0] = ap_bram_83_we0;
            assign en0[83] = ap_bram_83_en0;
            assign addr1[83][M_AXIS_BRAM_83_ADDR_WIDTH-1:0] = ap_bram_83_addr1;
            assign din1[83][M_AXIS_BRAM_83_WIDTH-1:0] = ap_bram_83_din1;
            assign ap_bram_83_dout1 = dout1[83][M_AXIS_BRAM_83_WIDTH-1:0];
            assign we1[83][M_AXIS_BRAM_83_WIDTH/8-1:0] = ap_bram_83_we1;
            assign en1[83] = ap_bram_83_en1;
            
            assign axis_clk[83] = m_axis_bram_83_aclk;
            assign axis_rst[83] = m_axis_bram_83_aresetn;
            assign dwconv1_tready[83] = m_axis_bram_83_tready;
            assign m_axis_bram_83_tlast = dwconv1_tlast[83];
            assign m_axis_bram_83_tvalid = dwconv1_tvalid[83];
            assign m_axis_bram_83_tkeep = dwconv1_tkeep[83][M_AXIS_BRAM_83_DMWIDTH/8-1:0];
            assign m_axis_bram_83_tstrb = dwconv1_tstrb[83][M_AXIS_BRAM_83_DMWIDTH/8-1:0];
            assign m_axis_bram_83_tdata = dwconv1_tdata[83][M_AXIS_BRAM_83_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 84) begin
            assign addr0[84][M_AXIS_BRAM_84_ADDR_WIDTH-1:0] = ap_bram_84_addr0;
            assign din0[84][M_AXIS_BRAM_84_WIDTH-1:0] = ap_bram_84_din0;
            assign ap_bram_84_dout0 = dout0[84][M_AXIS_BRAM_84_WIDTH-1:0];
            assign we0[84][M_AXIS_BRAM_84_WIDTH/8-1:0] = ap_bram_84_we0;
            assign en0[84] = ap_bram_84_en0;
            assign addr1[84][M_AXIS_BRAM_84_ADDR_WIDTH-1:0] = ap_bram_84_addr1;
            assign din1[84][M_AXIS_BRAM_84_WIDTH-1:0] = ap_bram_84_din1;
            assign ap_bram_84_dout1 = dout1[84][M_AXIS_BRAM_84_WIDTH-1:0];
            assign we1[84][M_AXIS_BRAM_84_WIDTH/8-1:0] = ap_bram_84_we1;
            assign en1[84] = ap_bram_84_en1;
            
            assign axis_clk[84] = m_axis_bram_84_aclk;
            assign axis_rst[84] = m_axis_bram_84_aresetn;
            assign dwconv1_tready[84] = m_axis_bram_84_tready;
            assign m_axis_bram_84_tlast = dwconv1_tlast[84];
            assign m_axis_bram_84_tvalid = dwconv1_tvalid[84];
            assign m_axis_bram_84_tkeep = dwconv1_tkeep[84][M_AXIS_BRAM_84_DMWIDTH/8-1:0];
            assign m_axis_bram_84_tstrb = dwconv1_tstrb[84][M_AXIS_BRAM_84_DMWIDTH/8-1:0];
            assign m_axis_bram_84_tdata = dwconv1_tdata[84][M_AXIS_BRAM_84_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 85) begin
            assign addr0[85][M_AXIS_BRAM_85_ADDR_WIDTH-1:0] = ap_bram_85_addr0;
            assign din0[85][M_AXIS_BRAM_85_WIDTH-1:0] = ap_bram_85_din0;
            assign ap_bram_85_dout0 = dout0[85][M_AXIS_BRAM_85_WIDTH-1:0];
            assign we0[85][M_AXIS_BRAM_85_WIDTH/8-1:0] = ap_bram_85_we0;
            assign en0[85] = ap_bram_85_en0;
            assign addr1[85][M_AXIS_BRAM_85_ADDR_WIDTH-1:0] = ap_bram_85_addr1;
            assign din1[85][M_AXIS_BRAM_85_WIDTH-1:0] = ap_bram_85_din1;
            assign ap_bram_85_dout1 = dout1[85][M_AXIS_BRAM_85_WIDTH-1:0];
            assign we1[85][M_AXIS_BRAM_85_WIDTH/8-1:0] = ap_bram_85_we1;
            assign en1[85] = ap_bram_85_en1;
            
            assign axis_clk[85] = m_axis_bram_85_aclk;
            assign axis_rst[85] = m_axis_bram_85_aresetn;
            assign dwconv1_tready[85] = m_axis_bram_85_tready;
            assign m_axis_bram_85_tlast = dwconv1_tlast[85];
            assign m_axis_bram_85_tvalid = dwconv1_tvalid[85];
            assign m_axis_bram_85_tkeep = dwconv1_tkeep[85][M_AXIS_BRAM_85_DMWIDTH/8-1:0];
            assign m_axis_bram_85_tstrb = dwconv1_tstrb[85][M_AXIS_BRAM_85_DMWIDTH/8-1:0];
            assign m_axis_bram_85_tdata = dwconv1_tdata[85][M_AXIS_BRAM_85_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 86) begin
            assign addr0[86][M_AXIS_BRAM_86_ADDR_WIDTH-1:0] = ap_bram_86_addr0;
            assign din0[86][M_AXIS_BRAM_86_WIDTH-1:0] = ap_bram_86_din0;
            assign ap_bram_86_dout0 = dout0[86][M_AXIS_BRAM_86_WIDTH-1:0];
            assign we0[86][M_AXIS_BRAM_86_WIDTH/8-1:0] = ap_bram_86_we0;
            assign en0[86] = ap_bram_86_en0;
            assign addr1[86][M_AXIS_BRAM_86_ADDR_WIDTH-1:0] = ap_bram_86_addr1;
            assign din1[86][M_AXIS_BRAM_86_WIDTH-1:0] = ap_bram_86_din1;
            assign ap_bram_86_dout1 = dout1[86][M_AXIS_BRAM_86_WIDTH-1:0];
            assign we1[86][M_AXIS_BRAM_86_WIDTH/8-1:0] = ap_bram_86_we1;
            assign en1[86] = ap_bram_86_en1;
            
            assign axis_clk[86] = m_axis_bram_86_aclk;
            assign axis_rst[86] = m_axis_bram_86_aresetn;
            assign dwconv1_tready[86] = m_axis_bram_86_tready;
            assign m_axis_bram_86_tlast = dwconv1_tlast[86];
            assign m_axis_bram_86_tvalid = dwconv1_tvalid[86];
            assign m_axis_bram_86_tkeep = dwconv1_tkeep[86][M_AXIS_BRAM_86_DMWIDTH/8-1:0];
            assign m_axis_bram_86_tstrb = dwconv1_tstrb[86][M_AXIS_BRAM_86_DMWIDTH/8-1:0];
            assign m_axis_bram_86_tdata = dwconv1_tdata[86][M_AXIS_BRAM_86_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 87) begin
            assign addr0[87][M_AXIS_BRAM_87_ADDR_WIDTH-1:0] = ap_bram_87_addr0;
            assign din0[87][M_AXIS_BRAM_87_WIDTH-1:0] = ap_bram_87_din0;
            assign ap_bram_87_dout0 = dout0[87][M_AXIS_BRAM_87_WIDTH-1:0];
            assign we0[87][M_AXIS_BRAM_87_WIDTH/8-1:0] = ap_bram_87_we0;
            assign en0[87] = ap_bram_87_en0;
            assign addr1[87][M_AXIS_BRAM_87_ADDR_WIDTH-1:0] = ap_bram_87_addr1;
            assign din1[87][M_AXIS_BRAM_87_WIDTH-1:0] = ap_bram_87_din1;
            assign ap_bram_87_dout1 = dout1[87][M_AXIS_BRAM_87_WIDTH-1:0];
            assign we1[87][M_AXIS_BRAM_87_WIDTH/8-1:0] = ap_bram_87_we1;
            assign en1[87] = ap_bram_87_en1;
            
            assign axis_clk[87] = m_axis_bram_87_aclk;
            assign axis_rst[87] = m_axis_bram_87_aresetn;
            assign dwconv1_tready[87] = m_axis_bram_87_tready;
            assign m_axis_bram_87_tlast = dwconv1_tlast[87];
            assign m_axis_bram_87_tvalid = dwconv1_tvalid[87];
            assign m_axis_bram_87_tkeep = dwconv1_tkeep[87][M_AXIS_BRAM_87_DMWIDTH/8-1:0];
            assign m_axis_bram_87_tstrb = dwconv1_tstrb[87][M_AXIS_BRAM_87_DMWIDTH/8-1:0];
            assign m_axis_bram_87_tdata = dwconv1_tdata[87][M_AXIS_BRAM_87_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 88) begin
            assign addr0[88][M_AXIS_BRAM_88_ADDR_WIDTH-1:0] = ap_bram_88_addr0;
            assign din0[88][M_AXIS_BRAM_88_WIDTH-1:0] = ap_bram_88_din0;
            assign ap_bram_88_dout0 = dout0[88][M_AXIS_BRAM_88_WIDTH-1:0];
            assign we0[88][M_AXIS_BRAM_88_WIDTH/8-1:0] = ap_bram_88_we0;
            assign en0[88] = ap_bram_88_en0;
            assign addr1[88][M_AXIS_BRAM_88_ADDR_WIDTH-1:0] = ap_bram_88_addr1;
            assign din1[88][M_AXIS_BRAM_88_WIDTH-1:0] = ap_bram_88_din1;
            assign ap_bram_88_dout1 = dout1[88][M_AXIS_BRAM_88_WIDTH-1:0];
            assign we1[88][M_AXIS_BRAM_88_WIDTH/8-1:0] = ap_bram_88_we1;
            assign en1[88] = ap_bram_88_en1;
            
            assign axis_clk[88] = m_axis_bram_88_aclk;
            assign axis_rst[88] = m_axis_bram_88_aresetn;
            assign dwconv1_tready[88] = m_axis_bram_88_tready;
            assign m_axis_bram_88_tlast = dwconv1_tlast[88];
            assign m_axis_bram_88_tvalid = dwconv1_tvalid[88];
            assign m_axis_bram_88_tkeep = dwconv1_tkeep[88][M_AXIS_BRAM_88_DMWIDTH/8-1:0];
            assign m_axis_bram_88_tstrb = dwconv1_tstrb[88][M_AXIS_BRAM_88_DMWIDTH/8-1:0];
            assign m_axis_bram_88_tdata = dwconv1_tdata[88][M_AXIS_BRAM_88_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 89) begin
            assign addr0[89][M_AXIS_BRAM_89_ADDR_WIDTH-1:0] = ap_bram_89_addr0;
            assign din0[89][M_AXIS_BRAM_89_WIDTH-1:0] = ap_bram_89_din0;
            assign ap_bram_89_dout0 = dout0[89][M_AXIS_BRAM_89_WIDTH-1:0];
            assign we0[89][M_AXIS_BRAM_89_WIDTH/8-1:0] = ap_bram_89_we0;
            assign en0[89] = ap_bram_89_en0;
            assign addr1[89][M_AXIS_BRAM_89_ADDR_WIDTH-1:0] = ap_bram_89_addr1;
            assign din1[89][M_AXIS_BRAM_89_WIDTH-1:0] = ap_bram_89_din1;
            assign ap_bram_89_dout1 = dout1[89][M_AXIS_BRAM_89_WIDTH-1:0];
            assign we1[89][M_AXIS_BRAM_89_WIDTH/8-1:0] = ap_bram_89_we1;
            assign en1[89] = ap_bram_89_en1;
            
            assign axis_clk[89] = m_axis_bram_89_aclk;
            assign axis_rst[89] = m_axis_bram_89_aresetn;
            assign dwconv1_tready[89] = m_axis_bram_89_tready;
            assign m_axis_bram_89_tlast = dwconv1_tlast[89];
            assign m_axis_bram_89_tvalid = dwconv1_tvalid[89];
            assign m_axis_bram_89_tkeep = dwconv1_tkeep[89][M_AXIS_BRAM_89_DMWIDTH/8-1:0];
            assign m_axis_bram_89_tstrb = dwconv1_tstrb[89][M_AXIS_BRAM_89_DMWIDTH/8-1:0];
            assign m_axis_bram_89_tdata = dwconv1_tdata[89][M_AXIS_BRAM_89_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 90) begin
            assign addr0[90][M_AXIS_BRAM_90_ADDR_WIDTH-1:0] = ap_bram_90_addr0;
            assign din0[90][M_AXIS_BRAM_90_WIDTH-1:0] = ap_bram_90_din0;
            assign ap_bram_90_dout0 = dout0[90][M_AXIS_BRAM_90_WIDTH-1:0];
            assign we0[90][M_AXIS_BRAM_90_WIDTH/8-1:0] = ap_bram_90_we0;
            assign en0[90] = ap_bram_90_en0;
            assign addr1[90][M_AXIS_BRAM_90_ADDR_WIDTH-1:0] = ap_bram_90_addr1;
            assign din1[90][M_AXIS_BRAM_90_WIDTH-1:0] = ap_bram_90_din1;
            assign ap_bram_90_dout1 = dout1[90][M_AXIS_BRAM_90_WIDTH-1:0];
            assign we1[90][M_AXIS_BRAM_90_WIDTH/8-1:0] = ap_bram_90_we1;
            assign en1[90] = ap_bram_90_en1;
            
            assign axis_clk[90] = m_axis_bram_90_aclk;
            assign axis_rst[90] = m_axis_bram_90_aresetn;
            assign dwconv1_tready[90] = m_axis_bram_90_tready;
            assign m_axis_bram_90_tlast = dwconv1_tlast[90];
            assign m_axis_bram_90_tvalid = dwconv1_tvalid[90];
            assign m_axis_bram_90_tkeep = dwconv1_tkeep[90][M_AXIS_BRAM_90_DMWIDTH/8-1:0];
            assign m_axis_bram_90_tstrb = dwconv1_tstrb[90][M_AXIS_BRAM_90_DMWIDTH/8-1:0];
            assign m_axis_bram_90_tdata = dwconv1_tdata[90][M_AXIS_BRAM_90_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 91) begin
            assign addr0[91][M_AXIS_BRAM_91_ADDR_WIDTH-1:0] = ap_bram_91_addr0;
            assign din0[91][M_AXIS_BRAM_91_WIDTH-1:0] = ap_bram_91_din0;
            assign ap_bram_91_dout0 = dout0[91][M_AXIS_BRAM_91_WIDTH-1:0];
            assign we0[91][M_AXIS_BRAM_91_WIDTH/8-1:0] = ap_bram_91_we0;
            assign en0[91] = ap_bram_91_en0;
            assign addr1[91][M_AXIS_BRAM_91_ADDR_WIDTH-1:0] = ap_bram_91_addr1;
            assign din1[91][M_AXIS_BRAM_91_WIDTH-1:0] = ap_bram_91_din1;
            assign ap_bram_91_dout1 = dout1[91][M_AXIS_BRAM_91_WIDTH-1:0];
            assign we1[91][M_AXIS_BRAM_91_WIDTH/8-1:0] = ap_bram_91_we1;
            assign en1[91] = ap_bram_91_en1;
            
            assign axis_clk[91] = m_axis_bram_91_aclk;
            assign axis_rst[91] = m_axis_bram_91_aresetn;
            assign dwconv1_tready[91] = m_axis_bram_91_tready;
            assign m_axis_bram_91_tlast = dwconv1_tlast[91];
            assign m_axis_bram_91_tvalid = dwconv1_tvalid[91];
            assign m_axis_bram_91_tkeep = dwconv1_tkeep[91][M_AXIS_BRAM_91_DMWIDTH/8-1:0];
            assign m_axis_bram_91_tstrb = dwconv1_tstrb[91][M_AXIS_BRAM_91_DMWIDTH/8-1:0];
            assign m_axis_bram_91_tdata = dwconv1_tdata[91][M_AXIS_BRAM_91_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 92) begin
            assign addr0[92][M_AXIS_BRAM_92_ADDR_WIDTH-1:0] = ap_bram_92_addr0;
            assign din0[92][M_AXIS_BRAM_92_WIDTH-1:0] = ap_bram_92_din0;
            assign ap_bram_92_dout0 = dout0[92][M_AXIS_BRAM_92_WIDTH-1:0];
            assign we0[92][M_AXIS_BRAM_92_WIDTH/8-1:0] = ap_bram_92_we0;
            assign en0[92] = ap_bram_92_en0;
            assign addr1[92][M_AXIS_BRAM_92_ADDR_WIDTH-1:0] = ap_bram_92_addr1;
            assign din1[92][M_AXIS_BRAM_92_WIDTH-1:0] = ap_bram_92_din1;
            assign ap_bram_92_dout1 = dout1[92][M_AXIS_BRAM_92_WIDTH-1:0];
            assign we1[92][M_AXIS_BRAM_92_WIDTH/8-1:0] = ap_bram_92_we1;
            assign en1[92] = ap_bram_92_en1;
            
            assign axis_clk[92] = m_axis_bram_92_aclk;
            assign axis_rst[92] = m_axis_bram_92_aresetn;
            assign dwconv1_tready[92] = m_axis_bram_92_tready;
            assign m_axis_bram_92_tlast = dwconv1_tlast[92];
            assign m_axis_bram_92_tvalid = dwconv1_tvalid[92];
            assign m_axis_bram_92_tkeep = dwconv1_tkeep[92][M_AXIS_BRAM_92_DMWIDTH/8-1:0];
            assign m_axis_bram_92_tstrb = dwconv1_tstrb[92][M_AXIS_BRAM_92_DMWIDTH/8-1:0];
            assign m_axis_bram_92_tdata = dwconv1_tdata[92][M_AXIS_BRAM_92_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 93) begin
            assign addr0[93][M_AXIS_BRAM_93_ADDR_WIDTH-1:0] = ap_bram_93_addr0;
            assign din0[93][M_AXIS_BRAM_93_WIDTH-1:0] = ap_bram_93_din0;
            assign ap_bram_93_dout0 = dout0[93][M_AXIS_BRAM_93_WIDTH-1:0];
            assign we0[93][M_AXIS_BRAM_93_WIDTH/8-1:0] = ap_bram_93_we0;
            assign en0[93] = ap_bram_93_en0;
            assign addr1[93][M_AXIS_BRAM_93_ADDR_WIDTH-1:0] = ap_bram_93_addr1;
            assign din1[93][M_AXIS_BRAM_93_WIDTH-1:0] = ap_bram_93_din1;
            assign ap_bram_93_dout1 = dout1[93][M_AXIS_BRAM_93_WIDTH-1:0];
            assign we1[93][M_AXIS_BRAM_93_WIDTH/8-1:0] = ap_bram_93_we1;
            assign en1[93] = ap_bram_93_en1;
            
            assign axis_clk[93] = m_axis_bram_93_aclk;
            assign axis_rst[93] = m_axis_bram_93_aresetn;
            assign dwconv1_tready[93] = m_axis_bram_93_tready;
            assign m_axis_bram_93_tlast = dwconv1_tlast[93];
            assign m_axis_bram_93_tvalid = dwconv1_tvalid[93];
            assign m_axis_bram_93_tkeep = dwconv1_tkeep[93][M_AXIS_BRAM_93_DMWIDTH/8-1:0];
            assign m_axis_bram_93_tstrb = dwconv1_tstrb[93][M_AXIS_BRAM_93_DMWIDTH/8-1:0];
            assign m_axis_bram_93_tdata = dwconv1_tdata[93][M_AXIS_BRAM_93_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 94) begin
            assign addr0[94][M_AXIS_BRAM_94_ADDR_WIDTH-1:0] = ap_bram_94_addr0;
            assign din0[94][M_AXIS_BRAM_94_WIDTH-1:0] = ap_bram_94_din0;
            assign ap_bram_94_dout0 = dout0[94][M_AXIS_BRAM_94_WIDTH-1:0];
            assign we0[94][M_AXIS_BRAM_94_WIDTH/8-1:0] = ap_bram_94_we0;
            assign en0[94] = ap_bram_94_en0;
            assign addr1[94][M_AXIS_BRAM_94_ADDR_WIDTH-1:0] = ap_bram_94_addr1;
            assign din1[94][M_AXIS_BRAM_94_WIDTH-1:0] = ap_bram_94_din1;
            assign ap_bram_94_dout1 = dout1[94][M_AXIS_BRAM_94_WIDTH-1:0];
            assign we1[94][M_AXIS_BRAM_94_WIDTH/8-1:0] = ap_bram_94_we1;
            assign en1[94] = ap_bram_94_en1;
            
            assign axis_clk[94] = m_axis_bram_94_aclk;
            assign axis_rst[94] = m_axis_bram_94_aresetn;
            assign dwconv1_tready[94] = m_axis_bram_94_tready;
            assign m_axis_bram_94_tlast = dwconv1_tlast[94];
            assign m_axis_bram_94_tvalid = dwconv1_tvalid[94];
            assign m_axis_bram_94_tkeep = dwconv1_tkeep[94][M_AXIS_BRAM_94_DMWIDTH/8-1:0];
            assign m_axis_bram_94_tstrb = dwconv1_tstrb[94][M_AXIS_BRAM_94_DMWIDTH/8-1:0];
            assign m_axis_bram_94_tdata = dwconv1_tdata[94][M_AXIS_BRAM_94_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 95) begin
            assign addr0[95][M_AXIS_BRAM_95_ADDR_WIDTH-1:0] = ap_bram_95_addr0;
            assign din0[95][M_AXIS_BRAM_95_WIDTH-1:0] = ap_bram_95_din0;
            assign ap_bram_95_dout0 = dout0[95][M_AXIS_BRAM_95_WIDTH-1:0];
            assign we0[95][M_AXIS_BRAM_95_WIDTH/8-1:0] = ap_bram_95_we0;
            assign en0[95] = ap_bram_95_en0;
            assign addr1[95][M_AXIS_BRAM_95_ADDR_WIDTH-1:0] = ap_bram_95_addr1;
            assign din1[95][M_AXIS_BRAM_95_WIDTH-1:0] = ap_bram_95_din1;
            assign ap_bram_95_dout1 = dout1[95][M_AXIS_BRAM_95_WIDTH-1:0];
            assign we1[95][M_AXIS_BRAM_95_WIDTH/8-1:0] = ap_bram_95_we1;
            assign en1[95] = ap_bram_95_en1;
            
            assign axis_clk[95] = m_axis_bram_95_aclk;
            assign axis_rst[95] = m_axis_bram_95_aresetn;
            assign dwconv1_tready[95] = m_axis_bram_95_tready;
            assign m_axis_bram_95_tlast = dwconv1_tlast[95];
            assign m_axis_bram_95_tvalid = dwconv1_tvalid[95];
            assign m_axis_bram_95_tkeep = dwconv1_tkeep[95][M_AXIS_BRAM_95_DMWIDTH/8-1:0];
            assign m_axis_bram_95_tstrb = dwconv1_tstrb[95][M_AXIS_BRAM_95_DMWIDTH/8-1:0];
            assign m_axis_bram_95_tdata = dwconv1_tdata[95][M_AXIS_BRAM_95_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 96) begin
            assign addr0[96][M_AXIS_BRAM_96_ADDR_WIDTH-1:0] = ap_bram_96_addr0;
            assign din0[96][M_AXIS_BRAM_96_WIDTH-1:0] = ap_bram_96_din0;
            assign ap_bram_96_dout0 = dout0[96][M_AXIS_BRAM_96_WIDTH-1:0];
            assign we0[96][M_AXIS_BRAM_96_WIDTH/8-1:0] = ap_bram_96_we0;
            assign en0[96] = ap_bram_96_en0;
            assign addr1[96][M_AXIS_BRAM_96_ADDR_WIDTH-1:0] = ap_bram_96_addr1;
            assign din1[96][M_AXIS_BRAM_96_WIDTH-1:0] = ap_bram_96_din1;
            assign ap_bram_96_dout1 = dout1[96][M_AXIS_BRAM_96_WIDTH-1:0];
            assign we1[96][M_AXIS_BRAM_96_WIDTH/8-1:0] = ap_bram_96_we1;
            assign en1[96] = ap_bram_96_en1;
            
            assign axis_clk[96] = m_axis_bram_96_aclk;
            assign axis_rst[96] = m_axis_bram_96_aresetn;
            assign dwconv1_tready[96] = m_axis_bram_96_tready;
            assign m_axis_bram_96_tlast = dwconv1_tlast[96];
            assign m_axis_bram_96_tvalid = dwconv1_tvalid[96];
            assign m_axis_bram_96_tkeep = dwconv1_tkeep[96][M_AXIS_BRAM_96_DMWIDTH/8-1:0];
            assign m_axis_bram_96_tstrb = dwconv1_tstrb[96][M_AXIS_BRAM_96_DMWIDTH/8-1:0];
            assign m_axis_bram_96_tdata = dwconv1_tdata[96][M_AXIS_BRAM_96_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 97) begin
            assign addr0[97][M_AXIS_BRAM_97_ADDR_WIDTH-1:0] = ap_bram_97_addr0;
            assign din0[97][M_AXIS_BRAM_97_WIDTH-1:0] = ap_bram_97_din0;
            assign ap_bram_97_dout0 = dout0[97][M_AXIS_BRAM_97_WIDTH-1:0];
            assign we0[97][M_AXIS_BRAM_97_WIDTH/8-1:0] = ap_bram_97_we0;
            assign en0[97] = ap_bram_97_en0;
            assign addr1[97][M_AXIS_BRAM_97_ADDR_WIDTH-1:0] = ap_bram_97_addr1;
            assign din1[97][M_AXIS_BRAM_97_WIDTH-1:0] = ap_bram_97_din1;
            assign ap_bram_97_dout1 = dout1[97][M_AXIS_BRAM_97_WIDTH-1:0];
            assign we1[97][M_AXIS_BRAM_97_WIDTH/8-1:0] = ap_bram_97_we1;
            assign en1[97] = ap_bram_97_en1;
            
            assign axis_clk[97] = m_axis_bram_97_aclk;
            assign axis_rst[97] = m_axis_bram_97_aresetn;
            assign dwconv1_tready[97] = m_axis_bram_97_tready;
            assign m_axis_bram_97_tlast = dwconv1_tlast[97];
            assign m_axis_bram_97_tvalid = dwconv1_tvalid[97];
            assign m_axis_bram_97_tkeep = dwconv1_tkeep[97][M_AXIS_BRAM_97_DMWIDTH/8-1:0];
            assign m_axis_bram_97_tstrb = dwconv1_tstrb[97][M_AXIS_BRAM_97_DMWIDTH/8-1:0];
            assign m_axis_bram_97_tdata = dwconv1_tdata[97][M_AXIS_BRAM_97_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 98) begin
            assign addr0[98][M_AXIS_BRAM_98_ADDR_WIDTH-1:0] = ap_bram_98_addr0;
            assign din0[98][M_AXIS_BRAM_98_WIDTH-1:0] = ap_bram_98_din0;
            assign ap_bram_98_dout0 = dout0[98][M_AXIS_BRAM_98_WIDTH-1:0];
            assign we0[98][M_AXIS_BRAM_98_WIDTH/8-1:0] = ap_bram_98_we0;
            assign en0[98] = ap_bram_98_en0;
            assign addr1[98][M_AXIS_BRAM_98_ADDR_WIDTH-1:0] = ap_bram_98_addr1;
            assign din1[98][M_AXIS_BRAM_98_WIDTH-1:0] = ap_bram_98_din1;
            assign ap_bram_98_dout1 = dout1[98][M_AXIS_BRAM_98_WIDTH-1:0];
            assign we1[98][M_AXIS_BRAM_98_WIDTH/8-1:0] = ap_bram_98_we1;
            assign en1[98] = ap_bram_98_en1;
            
            assign axis_clk[98] = m_axis_bram_98_aclk;
            assign axis_rst[98] = m_axis_bram_98_aresetn;
            assign dwconv1_tready[98] = m_axis_bram_98_tready;
            assign m_axis_bram_98_tlast = dwconv1_tlast[98];
            assign m_axis_bram_98_tvalid = dwconv1_tvalid[98];
            assign m_axis_bram_98_tkeep = dwconv1_tkeep[98][M_AXIS_BRAM_98_DMWIDTH/8-1:0];
            assign m_axis_bram_98_tstrb = dwconv1_tstrb[98][M_AXIS_BRAM_98_DMWIDTH/8-1:0];
            assign m_axis_bram_98_tdata = dwconv1_tdata[98][M_AXIS_BRAM_98_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 99) begin
            assign addr0[99][M_AXIS_BRAM_99_ADDR_WIDTH-1:0] = ap_bram_99_addr0;
            assign din0[99][M_AXIS_BRAM_99_WIDTH-1:0] = ap_bram_99_din0;
            assign ap_bram_99_dout0 = dout0[99][M_AXIS_BRAM_99_WIDTH-1:0];
            assign we0[99][M_AXIS_BRAM_99_WIDTH/8-1:0] = ap_bram_99_we0;
            assign en0[99] = ap_bram_99_en0;
            assign addr1[99][M_AXIS_BRAM_99_ADDR_WIDTH-1:0] = ap_bram_99_addr1;
            assign din1[99][M_AXIS_BRAM_99_WIDTH-1:0] = ap_bram_99_din1;
            assign ap_bram_99_dout1 = dout1[99][M_AXIS_BRAM_99_WIDTH-1:0];
            assign we1[99][M_AXIS_BRAM_99_WIDTH/8-1:0] = ap_bram_99_we1;
            assign en1[99] = ap_bram_99_en1;
            
            assign axis_clk[99] = m_axis_bram_99_aclk;
            assign axis_rst[99] = m_axis_bram_99_aresetn;
            assign dwconv1_tready[99] = m_axis_bram_99_tready;
            assign m_axis_bram_99_tlast = dwconv1_tlast[99];
            assign m_axis_bram_99_tvalid = dwconv1_tvalid[99];
            assign m_axis_bram_99_tkeep = dwconv1_tkeep[99][M_AXIS_BRAM_99_DMWIDTH/8-1:0];
            assign m_axis_bram_99_tstrb = dwconv1_tstrb[99][M_AXIS_BRAM_99_DMWIDTH/8-1:0];
            assign m_axis_bram_99_tdata = dwconv1_tdata[99][M_AXIS_BRAM_99_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 100) begin
            assign addr0[100][M_AXIS_BRAM_100_ADDR_WIDTH-1:0] = ap_bram_100_addr0;
            assign din0[100][M_AXIS_BRAM_100_WIDTH-1:0] = ap_bram_100_din0;
            assign ap_bram_100_dout0 = dout0[100][M_AXIS_BRAM_100_WIDTH-1:0];
            assign we0[100][M_AXIS_BRAM_100_WIDTH/8-1:0] = ap_bram_100_we0;
            assign en0[100] = ap_bram_100_en0;
            assign addr1[100][M_AXIS_BRAM_100_ADDR_WIDTH-1:0] = ap_bram_100_addr1;
            assign din1[100][M_AXIS_BRAM_100_WIDTH-1:0] = ap_bram_100_din1;
            assign ap_bram_100_dout1 = dout1[100][M_AXIS_BRAM_100_WIDTH-1:0];
            assign we1[100][M_AXIS_BRAM_100_WIDTH/8-1:0] = ap_bram_100_we1;
            assign en1[100] = ap_bram_100_en1;
            
            assign axis_clk[100] = m_axis_bram_100_aclk;
            assign axis_rst[100] = m_axis_bram_100_aresetn;
            assign dwconv1_tready[100] = m_axis_bram_100_tready;
            assign m_axis_bram_100_tlast = dwconv1_tlast[100];
            assign m_axis_bram_100_tvalid = dwconv1_tvalid[100];
            assign m_axis_bram_100_tkeep = dwconv1_tkeep[100][M_AXIS_BRAM_100_DMWIDTH/8-1:0];
            assign m_axis_bram_100_tstrb = dwconv1_tstrb[100][M_AXIS_BRAM_100_DMWIDTH/8-1:0];
            assign m_axis_bram_100_tdata = dwconv1_tdata[100][M_AXIS_BRAM_100_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 101) begin
            assign addr0[101][M_AXIS_BRAM_101_ADDR_WIDTH-1:0] = ap_bram_101_addr0;
            assign din0[101][M_AXIS_BRAM_101_WIDTH-1:0] = ap_bram_101_din0;
            assign ap_bram_101_dout0 = dout0[101][M_AXIS_BRAM_101_WIDTH-1:0];
            assign we0[101][M_AXIS_BRAM_101_WIDTH/8-1:0] = ap_bram_101_we0;
            assign en0[101] = ap_bram_101_en0;
            assign addr1[101][M_AXIS_BRAM_101_ADDR_WIDTH-1:0] = ap_bram_101_addr1;
            assign din1[101][M_AXIS_BRAM_101_WIDTH-1:0] = ap_bram_101_din1;
            assign ap_bram_101_dout1 = dout1[101][M_AXIS_BRAM_101_WIDTH-1:0];
            assign we1[101][M_AXIS_BRAM_101_WIDTH/8-1:0] = ap_bram_101_we1;
            assign en1[101] = ap_bram_101_en1;
            
            assign axis_clk[101] = m_axis_bram_101_aclk;
            assign axis_rst[101] = m_axis_bram_101_aresetn;
            assign dwconv1_tready[101] = m_axis_bram_101_tready;
            assign m_axis_bram_101_tlast = dwconv1_tlast[101];
            assign m_axis_bram_101_tvalid = dwconv1_tvalid[101];
            assign m_axis_bram_101_tkeep = dwconv1_tkeep[101][M_AXIS_BRAM_101_DMWIDTH/8-1:0];
            assign m_axis_bram_101_tstrb = dwconv1_tstrb[101][M_AXIS_BRAM_101_DMWIDTH/8-1:0];
            assign m_axis_bram_101_tdata = dwconv1_tdata[101][M_AXIS_BRAM_101_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 102) begin
            assign addr0[102][M_AXIS_BRAM_102_ADDR_WIDTH-1:0] = ap_bram_102_addr0;
            assign din0[102][M_AXIS_BRAM_102_WIDTH-1:0] = ap_bram_102_din0;
            assign ap_bram_102_dout0 = dout0[102][M_AXIS_BRAM_102_WIDTH-1:0];
            assign we0[102][M_AXIS_BRAM_102_WIDTH/8-1:0] = ap_bram_102_we0;
            assign en0[102] = ap_bram_102_en0;
            assign addr1[102][M_AXIS_BRAM_102_ADDR_WIDTH-1:0] = ap_bram_102_addr1;
            assign din1[102][M_AXIS_BRAM_102_WIDTH-1:0] = ap_bram_102_din1;
            assign ap_bram_102_dout1 = dout1[102][M_AXIS_BRAM_102_WIDTH-1:0];
            assign we1[102][M_AXIS_BRAM_102_WIDTH/8-1:0] = ap_bram_102_we1;
            assign en1[102] = ap_bram_102_en1;
            
            assign axis_clk[102] = m_axis_bram_102_aclk;
            assign axis_rst[102] = m_axis_bram_102_aresetn;
            assign dwconv1_tready[102] = m_axis_bram_102_tready;
            assign m_axis_bram_102_tlast = dwconv1_tlast[102];
            assign m_axis_bram_102_tvalid = dwconv1_tvalid[102];
            assign m_axis_bram_102_tkeep = dwconv1_tkeep[102][M_AXIS_BRAM_102_DMWIDTH/8-1:0];
            assign m_axis_bram_102_tstrb = dwconv1_tstrb[102][M_AXIS_BRAM_102_DMWIDTH/8-1:0];
            assign m_axis_bram_102_tdata = dwconv1_tdata[102][M_AXIS_BRAM_102_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 103) begin
            assign addr0[103][M_AXIS_BRAM_103_ADDR_WIDTH-1:0] = ap_bram_103_addr0;
            assign din0[103][M_AXIS_BRAM_103_WIDTH-1:0] = ap_bram_103_din0;
            assign ap_bram_103_dout0 = dout0[103][M_AXIS_BRAM_103_WIDTH-1:0];
            assign we0[103][M_AXIS_BRAM_103_WIDTH/8-1:0] = ap_bram_103_we0;
            assign en0[103] = ap_bram_103_en0;
            assign addr1[103][M_AXIS_BRAM_103_ADDR_WIDTH-1:0] = ap_bram_103_addr1;
            assign din1[103][M_AXIS_BRAM_103_WIDTH-1:0] = ap_bram_103_din1;
            assign ap_bram_103_dout1 = dout1[103][M_AXIS_BRAM_103_WIDTH-1:0];
            assign we1[103][M_AXIS_BRAM_103_WIDTH/8-1:0] = ap_bram_103_we1;
            assign en1[103] = ap_bram_103_en1;
            
            assign axis_clk[103] = m_axis_bram_103_aclk;
            assign axis_rst[103] = m_axis_bram_103_aresetn;
            assign dwconv1_tready[103] = m_axis_bram_103_tready;
            assign m_axis_bram_103_tlast = dwconv1_tlast[103];
            assign m_axis_bram_103_tvalid = dwconv1_tvalid[103];
            assign m_axis_bram_103_tkeep = dwconv1_tkeep[103][M_AXIS_BRAM_103_DMWIDTH/8-1:0];
            assign m_axis_bram_103_tstrb = dwconv1_tstrb[103][M_AXIS_BRAM_103_DMWIDTH/8-1:0];
            assign m_axis_bram_103_tdata = dwconv1_tdata[103][M_AXIS_BRAM_103_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 104) begin
            assign addr0[104][M_AXIS_BRAM_104_ADDR_WIDTH-1:0] = ap_bram_104_addr0;
            assign din0[104][M_AXIS_BRAM_104_WIDTH-1:0] = ap_bram_104_din0;
            assign ap_bram_104_dout0 = dout0[104][M_AXIS_BRAM_104_WIDTH-1:0];
            assign we0[104][M_AXIS_BRAM_104_WIDTH/8-1:0] = ap_bram_104_we0;
            assign en0[104] = ap_bram_104_en0;
            assign addr1[104][M_AXIS_BRAM_104_ADDR_WIDTH-1:0] = ap_bram_104_addr1;
            assign din1[104][M_AXIS_BRAM_104_WIDTH-1:0] = ap_bram_104_din1;
            assign ap_bram_104_dout1 = dout1[104][M_AXIS_BRAM_104_WIDTH-1:0];
            assign we1[104][M_AXIS_BRAM_104_WIDTH/8-1:0] = ap_bram_104_we1;
            assign en1[104] = ap_bram_104_en1;
            
            assign axis_clk[104] = m_axis_bram_104_aclk;
            assign axis_rst[104] = m_axis_bram_104_aresetn;
            assign dwconv1_tready[104] = m_axis_bram_104_tready;
            assign m_axis_bram_104_tlast = dwconv1_tlast[104];
            assign m_axis_bram_104_tvalid = dwconv1_tvalid[104];
            assign m_axis_bram_104_tkeep = dwconv1_tkeep[104][M_AXIS_BRAM_104_DMWIDTH/8-1:0];
            assign m_axis_bram_104_tstrb = dwconv1_tstrb[104][M_AXIS_BRAM_104_DMWIDTH/8-1:0];
            assign m_axis_bram_104_tdata = dwconv1_tdata[104][M_AXIS_BRAM_104_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 105) begin
            assign addr0[105][M_AXIS_BRAM_105_ADDR_WIDTH-1:0] = ap_bram_105_addr0;
            assign din0[105][M_AXIS_BRAM_105_WIDTH-1:0] = ap_bram_105_din0;
            assign ap_bram_105_dout0 = dout0[105][M_AXIS_BRAM_105_WIDTH-1:0];
            assign we0[105][M_AXIS_BRAM_105_WIDTH/8-1:0] = ap_bram_105_we0;
            assign en0[105] = ap_bram_105_en0;
            assign addr1[105][M_AXIS_BRAM_105_ADDR_WIDTH-1:0] = ap_bram_105_addr1;
            assign din1[105][M_AXIS_BRAM_105_WIDTH-1:0] = ap_bram_105_din1;
            assign ap_bram_105_dout1 = dout1[105][M_AXIS_BRAM_105_WIDTH-1:0];
            assign we1[105][M_AXIS_BRAM_105_WIDTH/8-1:0] = ap_bram_105_we1;
            assign en1[105] = ap_bram_105_en1;
            
            assign axis_clk[105] = m_axis_bram_105_aclk;
            assign axis_rst[105] = m_axis_bram_105_aresetn;
            assign dwconv1_tready[105] = m_axis_bram_105_tready;
            assign m_axis_bram_105_tlast = dwconv1_tlast[105];
            assign m_axis_bram_105_tvalid = dwconv1_tvalid[105];
            assign m_axis_bram_105_tkeep = dwconv1_tkeep[105][M_AXIS_BRAM_105_DMWIDTH/8-1:0];
            assign m_axis_bram_105_tstrb = dwconv1_tstrb[105][M_AXIS_BRAM_105_DMWIDTH/8-1:0];
            assign m_axis_bram_105_tdata = dwconv1_tdata[105][M_AXIS_BRAM_105_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 106) begin
            assign addr0[106][M_AXIS_BRAM_106_ADDR_WIDTH-1:0] = ap_bram_106_addr0;
            assign din0[106][M_AXIS_BRAM_106_WIDTH-1:0] = ap_bram_106_din0;
            assign ap_bram_106_dout0 = dout0[106][M_AXIS_BRAM_106_WIDTH-1:0];
            assign we0[106][M_AXIS_BRAM_106_WIDTH/8-1:0] = ap_bram_106_we0;
            assign en0[106] = ap_bram_106_en0;
            assign addr1[106][M_AXIS_BRAM_106_ADDR_WIDTH-1:0] = ap_bram_106_addr1;
            assign din1[106][M_AXIS_BRAM_106_WIDTH-1:0] = ap_bram_106_din1;
            assign ap_bram_106_dout1 = dout1[106][M_AXIS_BRAM_106_WIDTH-1:0];
            assign we1[106][M_AXIS_BRAM_106_WIDTH/8-1:0] = ap_bram_106_we1;
            assign en1[106] = ap_bram_106_en1;
            
            assign axis_clk[106] = m_axis_bram_106_aclk;
            assign axis_rst[106] = m_axis_bram_106_aresetn;
            assign dwconv1_tready[106] = m_axis_bram_106_tready;
            assign m_axis_bram_106_tlast = dwconv1_tlast[106];
            assign m_axis_bram_106_tvalid = dwconv1_tvalid[106];
            assign m_axis_bram_106_tkeep = dwconv1_tkeep[106][M_AXIS_BRAM_106_DMWIDTH/8-1:0];
            assign m_axis_bram_106_tstrb = dwconv1_tstrb[106][M_AXIS_BRAM_106_DMWIDTH/8-1:0];
            assign m_axis_bram_106_tdata = dwconv1_tdata[106][M_AXIS_BRAM_106_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 107) begin
            assign addr0[107][M_AXIS_BRAM_107_ADDR_WIDTH-1:0] = ap_bram_107_addr0;
            assign din0[107][M_AXIS_BRAM_107_WIDTH-1:0] = ap_bram_107_din0;
            assign ap_bram_107_dout0 = dout0[107][M_AXIS_BRAM_107_WIDTH-1:0];
            assign we0[107][M_AXIS_BRAM_107_WIDTH/8-1:0] = ap_bram_107_we0;
            assign en0[107] = ap_bram_107_en0;
            assign addr1[107][M_AXIS_BRAM_107_ADDR_WIDTH-1:0] = ap_bram_107_addr1;
            assign din1[107][M_AXIS_BRAM_107_WIDTH-1:0] = ap_bram_107_din1;
            assign ap_bram_107_dout1 = dout1[107][M_AXIS_BRAM_107_WIDTH-1:0];
            assign we1[107][M_AXIS_BRAM_107_WIDTH/8-1:0] = ap_bram_107_we1;
            assign en1[107] = ap_bram_107_en1;
            
            assign axis_clk[107] = m_axis_bram_107_aclk;
            assign axis_rst[107] = m_axis_bram_107_aresetn;
            assign dwconv1_tready[107] = m_axis_bram_107_tready;
            assign m_axis_bram_107_tlast = dwconv1_tlast[107];
            assign m_axis_bram_107_tvalid = dwconv1_tvalid[107];
            assign m_axis_bram_107_tkeep = dwconv1_tkeep[107][M_AXIS_BRAM_107_DMWIDTH/8-1:0];
            assign m_axis_bram_107_tstrb = dwconv1_tstrb[107][M_AXIS_BRAM_107_DMWIDTH/8-1:0];
            assign m_axis_bram_107_tdata = dwconv1_tdata[107][M_AXIS_BRAM_107_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 108) begin
            assign addr0[108][M_AXIS_BRAM_108_ADDR_WIDTH-1:0] = ap_bram_108_addr0;
            assign din0[108][M_AXIS_BRAM_108_WIDTH-1:0] = ap_bram_108_din0;
            assign ap_bram_108_dout0 = dout0[108][M_AXIS_BRAM_108_WIDTH-1:0];
            assign we0[108][M_AXIS_BRAM_108_WIDTH/8-1:0] = ap_bram_108_we0;
            assign en0[108] = ap_bram_108_en0;
            assign addr1[108][M_AXIS_BRAM_108_ADDR_WIDTH-1:0] = ap_bram_108_addr1;
            assign din1[108][M_AXIS_BRAM_108_WIDTH-1:0] = ap_bram_108_din1;
            assign ap_bram_108_dout1 = dout1[108][M_AXIS_BRAM_108_WIDTH-1:0];
            assign we1[108][M_AXIS_BRAM_108_WIDTH/8-1:0] = ap_bram_108_we1;
            assign en1[108] = ap_bram_108_en1;
            
            assign axis_clk[108] = m_axis_bram_108_aclk;
            assign axis_rst[108] = m_axis_bram_108_aresetn;
            assign dwconv1_tready[108] = m_axis_bram_108_tready;
            assign m_axis_bram_108_tlast = dwconv1_tlast[108];
            assign m_axis_bram_108_tvalid = dwconv1_tvalid[108];
            assign m_axis_bram_108_tkeep = dwconv1_tkeep[108][M_AXIS_BRAM_108_DMWIDTH/8-1:0];
            assign m_axis_bram_108_tstrb = dwconv1_tstrb[108][M_AXIS_BRAM_108_DMWIDTH/8-1:0];
            assign m_axis_bram_108_tdata = dwconv1_tdata[108][M_AXIS_BRAM_108_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 109) begin
            assign addr0[109][M_AXIS_BRAM_109_ADDR_WIDTH-1:0] = ap_bram_109_addr0;
            assign din0[109][M_AXIS_BRAM_109_WIDTH-1:0] = ap_bram_109_din0;
            assign ap_bram_109_dout0 = dout0[109][M_AXIS_BRAM_109_WIDTH-1:0];
            assign we0[109][M_AXIS_BRAM_109_WIDTH/8-1:0] = ap_bram_109_we0;
            assign en0[109] = ap_bram_109_en0;
            assign addr1[109][M_AXIS_BRAM_109_ADDR_WIDTH-1:0] = ap_bram_109_addr1;
            assign din1[109][M_AXIS_BRAM_109_WIDTH-1:0] = ap_bram_109_din1;
            assign ap_bram_109_dout1 = dout1[109][M_AXIS_BRAM_109_WIDTH-1:0];
            assign we1[109][M_AXIS_BRAM_109_WIDTH/8-1:0] = ap_bram_109_we1;
            assign en1[109] = ap_bram_109_en1;
            
            assign axis_clk[109] = m_axis_bram_109_aclk;
            assign axis_rst[109] = m_axis_bram_109_aresetn;
            assign dwconv1_tready[109] = m_axis_bram_109_tready;
            assign m_axis_bram_109_tlast = dwconv1_tlast[109];
            assign m_axis_bram_109_tvalid = dwconv1_tvalid[109];
            assign m_axis_bram_109_tkeep = dwconv1_tkeep[109][M_AXIS_BRAM_109_DMWIDTH/8-1:0];
            assign m_axis_bram_109_tstrb = dwconv1_tstrb[109][M_AXIS_BRAM_109_DMWIDTH/8-1:0];
            assign m_axis_bram_109_tdata = dwconv1_tdata[109][M_AXIS_BRAM_109_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 110) begin
            assign addr0[110][M_AXIS_BRAM_110_ADDR_WIDTH-1:0] = ap_bram_110_addr0;
            assign din0[110][M_AXIS_BRAM_110_WIDTH-1:0] = ap_bram_110_din0;
            assign ap_bram_110_dout0 = dout0[110][M_AXIS_BRAM_110_WIDTH-1:0];
            assign we0[110][M_AXIS_BRAM_110_WIDTH/8-1:0] = ap_bram_110_we0;
            assign en0[110] = ap_bram_110_en0;
            assign addr1[110][M_AXIS_BRAM_110_ADDR_WIDTH-1:0] = ap_bram_110_addr1;
            assign din1[110][M_AXIS_BRAM_110_WIDTH-1:0] = ap_bram_110_din1;
            assign ap_bram_110_dout1 = dout1[110][M_AXIS_BRAM_110_WIDTH-1:0];
            assign we1[110][M_AXIS_BRAM_110_WIDTH/8-1:0] = ap_bram_110_we1;
            assign en1[110] = ap_bram_110_en1;
            
            assign axis_clk[110] = m_axis_bram_110_aclk;
            assign axis_rst[110] = m_axis_bram_110_aresetn;
            assign dwconv1_tready[110] = m_axis_bram_110_tready;
            assign m_axis_bram_110_tlast = dwconv1_tlast[110];
            assign m_axis_bram_110_tvalid = dwconv1_tvalid[110];
            assign m_axis_bram_110_tkeep = dwconv1_tkeep[110][M_AXIS_BRAM_110_DMWIDTH/8-1:0];
            assign m_axis_bram_110_tstrb = dwconv1_tstrb[110][M_AXIS_BRAM_110_DMWIDTH/8-1:0];
            assign m_axis_bram_110_tdata = dwconv1_tdata[110][M_AXIS_BRAM_110_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 111) begin
            assign addr0[111][M_AXIS_BRAM_111_ADDR_WIDTH-1:0] = ap_bram_111_addr0;
            assign din0[111][M_AXIS_BRAM_111_WIDTH-1:0] = ap_bram_111_din0;
            assign ap_bram_111_dout0 = dout0[111][M_AXIS_BRAM_111_WIDTH-1:0];
            assign we0[111][M_AXIS_BRAM_111_WIDTH/8-1:0] = ap_bram_111_we0;
            assign en0[111] = ap_bram_111_en0;
            assign addr1[111][M_AXIS_BRAM_111_ADDR_WIDTH-1:0] = ap_bram_111_addr1;
            assign din1[111][M_AXIS_BRAM_111_WIDTH-1:0] = ap_bram_111_din1;
            assign ap_bram_111_dout1 = dout1[111][M_AXIS_BRAM_111_WIDTH-1:0];
            assign we1[111][M_AXIS_BRAM_111_WIDTH/8-1:0] = ap_bram_111_we1;
            assign en1[111] = ap_bram_111_en1;
            
            assign axis_clk[111] = m_axis_bram_111_aclk;
            assign axis_rst[111] = m_axis_bram_111_aresetn;
            assign dwconv1_tready[111] = m_axis_bram_111_tready;
            assign m_axis_bram_111_tlast = dwconv1_tlast[111];
            assign m_axis_bram_111_tvalid = dwconv1_tvalid[111];
            assign m_axis_bram_111_tkeep = dwconv1_tkeep[111][M_AXIS_BRAM_111_DMWIDTH/8-1:0];
            assign m_axis_bram_111_tstrb = dwconv1_tstrb[111][M_AXIS_BRAM_111_DMWIDTH/8-1:0];
            assign m_axis_bram_111_tdata = dwconv1_tdata[111][M_AXIS_BRAM_111_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 112) begin
            assign addr0[112][M_AXIS_BRAM_112_ADDR_WIDTH-1:0] = ap_bram_112_addr0;
            assign din0[112][M_AXIS_BRAM_112_WIDTH-1:0] = ap_bram_112_din0;
            assign ap_bram_112_dout0 = dout0[112][M_AXIS_BRAM_112_WIDTH-1:0];
            assign we0[112][M_AXIS_BRAM_112_WIDTH/8-1:0] = ap_bram_112_we0;
            assign en0[112] = ap_bram_112_en0;
            assign addr1[112][M_AXIS_BRAM_112_ADDR_WIDTH-1:0] = ap_bram_112_addr1;
            assign din1[112][M_AXIS_BRAM_112_WIDTH-1:0] = ap_bram_112_din1;
            assign ap_bram_112_dout1 = dout1[112][M_AXIS_BRAM_112_WIDTH-1:0];
            assign we1[112][M_AXIS_BRAM_112_WIDTH/8-1:0] = ap_bram_112_we1;
            assign en1[112] = ap_bram_112_en1;
            
            assign axis_clk[112] = m_axis_bram_112_aclk;
            assign axis_rst[112] = m_axis_bram_112_aresetn;
            assign dwconv1_tready[112] = m_axis_bram_112_tready;
            assign m_axis_bram_112_tlast = dwconv1_tlast[112];
            assign m_axis_bram_112_tvalid = dwconv1_tvalid[112];
            assign m_axis_bram_112_tkeep = dwconv1_tkeep[112][M_AXIS_BRAM_112_DMWIDTH/8-1:0];
            assign m_axis_bram_112_tstrb = dwconv1_tstrb[112][M_AXIS_BRAM_112_DMWIDTH/8-1:0];
            assign m_axis_bram_112_tdata = dwconv1_tdata[112][M_AXIS_BRAM_112_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 113) begin
            assign addr0[113][M_AXIS_BRAM_113_ADDR_WIDTH-1:0] = ap_bram_113_addr0;
            assign din0[113][M_AXIS_BRAM_113_WIDTH-1:0] = ap_bram_113_din0;
            assign ap_bram_113_dout0 = dout0[113][M_AXIS_BRAM_113_WIDTH-1:0];
            assign we0[113][M_AXIS_BRAM_113_WIDTH/8-1:0] = ap_bram_113_we0;
            assign en0[113] = ap_bram_113_en0;
            assign addr1[113][M_AXIS_BRAM_113_ADDR_WIDTH-1:0] = ap_bram_113_addr1;
            assign din1[113][M_AXIS_BRAM_113_WIDTH-1:0] = ap_bram_113_din1;
            assign ap_bram_113_dout1 = dout1[113][M_AXIS_BRAM_113_WIDTH-1:0];
            assign we1[113][M_AXIS_BRAM_113_WIDTH/8-1:0] = ap_bram_113_we1;
            assign en1[113] = ap_bram_113_en1;
            
            assign axis_clk[113] = m_axis_bram_113_aclk;
            assign axis_rst[113] = m_axis_bram_113_aresetn;
            assign dwconv1_tready[113] = m_axis_bram_113_tready;
            assign m_axis_bram_113_tlast = dwconv1_tlast[113];
            assign m_axis_bram_113_tvalid = dwconv1_tvalid[113];
            assign m_axis_bram_113_tkeep = dwconv1_tkeep[113][M_AXIS_BRAM_113_DMWIDTH/8-1:0];
            assign m_axis_bram_113_tstrb = dwconv1_tstrb[113][M_AXIS_BRAM_113_DMWIDTH/8-1:0];
            assign m_axis_bram_113_tdata = dwconv1_tdata[113][M_AXIS_BRAM_113_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 114) begin
            assign addr0[114][M_AXIS_BRAM_114_ADDR_WIDTH-1:0] = ap_bram_114_addr0;
            assign din0[114][M_AXIS_BRAM_114_WIDTH-1:0] = ap_bram_114_din0;
            assign ap_bram_114_dout0 = dout0[114][M_AXIS_BRAM_114_WIDTH-1:0];
            assign we0[114][M_AXIS_BRAM_114_WIDTH/8-1:0] = ap_bram_114_we0;
            assign en0[114] = ap_bram_114_en0;
            assign addr1[114][M_AXIS_BRAM_114_ADDR_WIDTH-1:0] = ap_bram_114_addr1;
            assign din1[114][M_AXIS_BRAM_114_WIDTH-1:0] = ap_bram_114_din1;
            assign ap_bram_114_dout1 = dout1[114][M_AXIS_BRAM_114_WIDTH-1:0];
            assign we1[114][M_AXIS_BRAM_114_WIDTH/8-1:0] = ap_bram_114_we1;
            assign en1[114] = ap_bram_114_en1;
            
            assign axis_clk[114] = m_axis_bram_114_aclk;
            assign axis_rst[114] = m_axis_bram_114_aresetn;
            assign dwconv1_tready[114] = m_axis_bram_114_tready;
            assign m_axis_bram_114_tlast = dwconv1_tlast[114];
            assign m_axis_bram_114_tvalid = dwconv1_tvalid[114];
            assign m_axis_bram_114_tkeep = dwconv1_tkeep[114][M_AXIS_BRAM_114_DMWIDTH/8-1:0];
            assign m_axis_bram_114_tstrb = dwconv1_tstrb[114][M_AXIS_BRAM_114_DMWIDTH/8-1:0];
            assign m_axis_bram_114_tdata = dwconv1_tdata[114][M_AXIS_BRAM_114_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 115) begin
            assign addr0[115][M_AXIS_BRAM_115_ADDR_WIDTH-1:0] = ap_bram_115_addr0;
            assign din0[115][M_AXIS_BRAM_115_WIDTH-1:0] = ap_bram_115_din0;
            assign ap_bram_115_dout0 = dout0[115][M_AXIS_BRAM_115_WIDTH-1:0];
            assign we0[115][M_AXIS_BRAM_115_WIDTH/8-1:0] = ap_bram_115_we0;
            assign en0[115] = ap_bram_115_en0;
            assign addr1[115][M_AXIS_BRAM_115_ADDR_WIDTH-1:0] = ap_bram_115_addr1;
            assign din1[115][M_AXIS_BRAM_115_WIDTH-1:0] = ap_bram_115_din1;
            assign ap_bram_115_dout1 = dout1[115][M_AXIS_BRAM_115_WIDTH-1:0];
            assign we1[115][M_AXIS_BRAM_115_WIDTH/8-1:0] = ap_bram_115_we1;
            assign en1[115] = ap_bram_115_en1;
            
            assign axis_clk[115] = m_axis_bram_115_aclk;
            assign axis_rst[115] = m_axis_bram_115_aresetn;
            assign dwconv1_tready[115] = m_axis_bram_115_tready;
            assign m_axis_bram_115_tlast = dwconv1_tlast[115];
            assign m_axis_bram_115_tvalid = dwconv1_tvalid[115];
            assign m_axis_bram_115_tkeep = dwconv1_tkeep[115][M_AXIS_BRAM_115_DMWIDTH/8-1:0];
            assign m_axis_bram_115_tstrb = dwconv1_tstrb[115][M_AXIS_BRAM_115_DMWIDTH/8-1:0];
            assign m_axis_bram_115_tdata = dwconv1_tdata[115][M_AXIS_BRAM_115_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 116) begin
            assign addr0[116][M_AXIS_BRAM_116_ADDR_WIDTH-1:0] = ap_bram_116_addr0;
            assign din0[116][M_AXIS_BRAM_116_WIDTH-1:0] = ap_bram_116_din0;
            assign ap_bram_116_dout0 = dout0[116][M_AXIS_BRAM_116_WIDTH-1:0];
            assign we0[116][M_AXIS_BRAM_116_WIDTH/8-1:0] = ap_bram_116_we0;
            assign en0[116] = ap_bram_116_en0;
            assign addr1[116][M_AXIS_BRAM_116_ADDR_WIDTH-1:0] = ap_bram_116_addr1;
            assign din1[116][M_AXIS_BRAM_116_WIDTH-1:0] = ap_bram_116_din1;
            assign ap_bram_116_dout1 = dout1[116][M_AXIS_BRAM_116_WIDTH-1:0];
            assign we1[116][M_AXIS_BRAM_116_WIDTH/8-1:0] = ap_bram_116_we1;
            assign en1[116] = ap_bram_116_en1;
            
            assign axis_clk[116] = m_axis_bram_116_aclk;
            assign axis_rst[116] = m_axis_bram_116_aresetn;
            assign dwconv1_tready[116] = m_axis_bram_116_tready;
            assign m_axis_bram_116_tlast = dwconv1_tlast[116];
            assign m_axis_bram_116_tvalid = dwconv1_tvalid[116];
            assign m_axis_bram_116_tkeep = dwconv1_tkeep[116][M_AXIS_BRAM_116_DMWIDTH/8-1:0];
            assign m_axis_bram_116_tstrb = dwconv1_tstrb[116][M_AXIS_BRAM_116_DMWIDTH/8-1:0];
            assign m_axis_bram_116_tdata = dwconv1_tdata[116][M_AXIS_BRAM_116_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 117) begin
            assign addr0[117][M_AXIS_BRAM_117_ADDR_WIDTH-1:0] = ap_bram_117_addr0;
            assign din0[117][M_AXIS_BRAM_117_WIDTH-1:0] = ap_bram_117_din0;
            assign ap_bram_117_dout0 = dout0[117][M_AXIS_BRAM_117_WIDTH-1:0];
            assign we0[117][M_AXIS_BRAM_117_WIDTH/8-1:0] = ap_bram_117_we0;
            assign en0[117] = ap_bram_117_en0;
            assign addr1[117][M_AXIS_BRAM_117_ADDR_WIDTH-1:0] = ap_bram_117_addr1;
            assign din1[117][M_AXIS_BRAM_117_WIDTH-1:0] = ap_bram_117_din1;
            assign ap_bram_117_dout1 = dout1[117][M_AXIS_BRAM_117_WIDTH-1:0];
            assign we1[117][M_AXIS_BRAM_117_WIDTH/8-1:0] = ap_bram_117_we1;
            assign en1[117] = ap_bram_117_en1;
            
            assign axis_clk[117] = m_axis_bram_117_aclk;
            assign axis_rst[117] = m_axis_bram_117_aresetn;
            assign dwconv1_tready[117] = m_axis_bram_117_tready;
            assign m_axis_bram_117_tlast = dwconv1_tlast[117];
            assign m_axis_bram_117_tvalid = dwconv1_tvalid[117];
            assign m_axis_bram_117_tkeep = dwconv1_tkeep[117][M_AXIS_BRAM_117_DMWIDTH/8-1:0];
            assign m_axis_bram_117_tstrb = dwconv1_tstrb[117][M_AXIS_BRAM_117_DMWIDTH/8-1:0];
            assign m_axis_bram_117_tdata = dwconv1_tdata[117][M_AXIS_BRAM_117_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 118) begin
            assign addr0[118][M_AXIS_BRAM_118_ADDR_WIDTH-1:0] = ap_bram_118_addr0;
            assign din0[118][M_AXIS_BRAM_118_WIDTH-1:0] = ap_bram_118_din0;
            assign ap_bram_118_dout0 = dout0[118][M_AXIS_BRAM_118_WIDTH-1:0];
            assign we0[118][M_AXIS_BRAM_118_WIDTH/8-1:0] = ap_bram_118_we0;
            assign en0[118] = ap_bram_118_en0;
            assign addr1[118][M_AXIS_BRAM_118_ADDR_WIDTH-1:0] = ap_bram_118_addr1;
            assign din1[118][M_AXIS_BRAM_118_WIDTH-1:0] = ap_bram_118_din1;
            assign ap_bram_118_dout1 = dout1[118][M_AXIS_BRAM_118_WIDTH-1:0];
            assign we1[118][M_AXIS_BRAM_118_WIDTH/8-1:0] = ap_bram_118_we1;
            assign en1[118] = ap_bram_118_en1;
            
            assign axis_clk[118] = m_axis_bram_118_aclk;
            assign axis_rst[118] = m_axis_bram_118_aresetn;
            assign dwconv1_tready[118] = m_axis_bram_118_tready;
            assign m_axis_bram_118_tlast = dwconv1_tlast[118];
            assign m_axis_bram_118_tvalid = dwconv1_tvalid[118];
            assign m_axis_bram_118_tkeep = dwconv1_tkeep[118][M_AXIS_BRAM_118_DMWIDTH/8-1:0];
            assign m_axis_bram_118_tstrb = dwconv1_tstrb[118][M_AXIS_BRAM_118_DMWIDTH/8-1:0];
            assign m_axis_bram_118_tdata = dwconv1_tdata[118][M_AXIS_BRAM_118_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 119) begin
            assign addr0[119][M_AXIS_BRAM_119_ADDR_WIDTH-1:0] = ap_bram_119_addr0;
            assign din0[119][M_AXIS_BRAM_119_WIDTH-1:0] = ap_bram_119_din0;
            assign ap_bram_119_dout0 = dout0[119][M_AXIS_BRAM_119_WIDTH-1:0];
            assign we0[119][M_AXIS_BRAM_119_WIDTH/8-1:0] = ap_bram_119_we0;
            assign en0[119] = ap_bram_119_en0;
            assign addr1[119][M_AXIS_BRAM_119_ADDR_WIDTH-1:0] = ap_bram_119_addr1;
            assign din1[119][M_AXIS_BRAM_119_WIDTH-1:0] = ap_bram_119_din1;
            assign ap_bram_119_dout1 = dout1[119][M_AXIS_BRAM_119_WIDTH-1:0];
            assign we1[119][M_AXIS_BRAM_119_WIDTH/8-1:0] = ap_bram_119_we1;
            assign en1[119] = ap_bram_119_en1;
            
            assign axis_clk[119] = m_axis_bram_119_aclk;
            assign axis_rst[119] = m_axis_bram_119_aresetn;
            assign dwconv1_tready[119] = m_axis_bram_119_tready;
            assign m_axis_bram_119_tlast = dwconv1_tlast[119];
            assign m_axis_bram_119_tvalid = dwconv1_tvalid[119];
            assign m_axis_bram_119_tkeep = dwconv1_tkeep[119][M_AXIS_BRAM_119_DMWIDTH/8-1:0];
            assign m_axis_bram_119_tstrb = dwconv1_tstrb[119][M_AXIS_BRAM_119_DMWIDTH/8-1:0];
            assign m_axis_bram_119_tdata = dwconv1_tdata[119][M_AXIS_BRAM_119_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 120) begin
            assign addr0[120][M_AXIS_BRAM_120_ADDR_WIDTH-1:0] = ap_bram_120_addr0;
            assign din0[120][M_AXIS_BRAM_120_WIDTH-1:0] = ap_bram_120_din0;
            assign ap_bram_120_dout0 = dout0[120][M_AXIS_BRAM_120_WIDTH-1:0];
            assign we0[120][M_AXIS_BRAM_120_WIDTH/8-1:0] = ap_bram_120_we0;
            assign en0[120] = ap_bram_120_en0;
            assign addr1[120][M_AXIS_BRAM_120_ADDR_WIDTH-1:0] = ap_bram_120_addr1;
            assign din1[120][M_AXIS_BRAM_120_WIDTH-1:0] = ap_bram_120_din1;
            assign ap_bram_120_dout1 = dout1[120][M_AXIS_BRAM_120_WIDTH-1:0];
            assign we1[120][M_AXIS_BRAM_120_WIDTH/8-1:0] = ap_bram_120_we1;
            assign en1[120] = ap_bram_120_en1;
            
            assign axis_clk[120] = m_axis_bram_120_aclk;
            assign axis_rst[120] = m_axis_bram_120_aresetn;
            assign dwconv1_tready[120] = m_axis_bram_120_tready;
            assign m_axis_bram_120_tlast = dwconv1_tlast[120];
            assign m_axis_bram_120_tvalid = dwconv1_tvalid[120];
            assign m_axis_bram_120_tkeep = dwconv1_tkeep[120][M_AXIS_BRAM_120_DMWIDTH/8-1:0];
            assign m_axis_bram_120_tstrb = dwconv1_tstrb[120][M_AXIS_BRAM_120_DMWIDTH/8-1:0];
            assign m_axis_bram_120_tdata = dwconv1_tdata[120][M_AXIS_BRAM_120_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 121) begin
            assign addr0[121][M_AXIS_BRAM_121_ADDR_WIDTH-1:0] = ap_bram_121_addr0;
            assign din0[121][M_AXIS_BRAM_121_WIDTH-1:0] = ap_bram_121_din0;
            assign ap_bram_121_dout0 = dout0[121][M_AXIS_BRAM_121_WIDTH-1:0];
            assign we0[121][M_AXIS_BRAM_121_WIDTH/8-1:0] = ap_bram_121_we0;
            assign en0[121] = ap_bram_121_en0;
            assign addr1[121][M_AXIS_BRAM_121_ADDR_WIDTH-1:0] = ap_bram_121_addr1;
            assign din1[121][M_AXIS_BRAM_121_WIDTH-1:0] = ap_bram_121_din1;
            assign ap_bram_121_dout1 = dout1[121][M_AXIS_BRAM_121_WIDTH-1:0];
            assign we1[121][M_AXIS_BRAM_121_WIDTH/8-1:0] = ap_bram_121_we1;
            assign en1[121] = ap_bram_121_en1;
            
            assign axis_clk[121] = m_axis_bram_121_aclk;
            assign axis_rst[121] = m_axis_bram_121_aresetn;
            assign dwconv1_tready[121] = m_axis_bram_121_tready;
            assign m_axis_bram_121_tlast = dwconv1_tlast[121];
            assign m_axis_bram_121_tvalid = dwconv1_tvalid[121];
            assign m_axis_bram_121_tkeep = dwconv1_tkeep[121][M_AXIS_BRAM_121_DMWIDTH/8-1:0];
            assign m_axis_bram_121_tstrb = dwconv1_tstrb[121][M_AXIS_BRAM_121_DMWIDTH/8-1:0];
            assign m_axis_bram_121_tdata = dwconv1_tdata[121][M_AXIS_BRAM_121_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 122) begin
            assign addr0[122][M_AXIS_BRAM_122_ADDR_WIDTH-1:0] = ap_bram_122_addr0;
            assign din0[122][M_AXIS_BRAM_122_WIDTH-1:0] = ap_bram_122_din0;
            assign ap_bram_122_dout0 = dout0[122][M_AXIS_BRAM_122_WIDTH-1:0];
            assign we0[122][M_AXIS_BRAM_122_WIDTH/8-1:0] = ap_bram_122_we0;
            assign en0[122] = ap_bram_122_en0;
            assign addr1[122][M_AXIS_BRAM_122_ADDR_WIDTH-1:0] = ap_bram_122_addr1;
            assign din1[122][M_AXIS_BRAM_122_WIDTH-1:0] = ap_bram_122_din1;
            assign ap_bram_122_dout1 = dout1[122][M_AXIS_BRAM_122_WIDTH-1:0];
            assign we1[122][M_AXIS_BRAM_122_WIDTH/8-1:0] = ap_bram_122_we1;
            assign en1[122] = ap_bram_122_en1;
            
            assign axis_clk[122] = m_axis_bram_122_aclk;
            assign axis_rst[122] = m_axis_bram_122_aresetn;
            assign dwconv1_tready[122] = m_axis_bram_122_tready;
            assign m_axis_bram_122_tlast = dwconv1_tlast[122];
            assign m_axis_bram_122_tvalid = dwconv1_tvalid[122];
            assign m_axis_bram_122_tkeep = dwconv1_tkeep[122][M_AXIS_BRAM_122_DMWIDTH/8-1:0];
            assign m_axis_bram_122_tstrb = dwconv1_tstrb[122][M_AXIS_BRAM_122_DMWIDTH/8-1:0];
            assign m_axis_bram_122_tdata = dwconv1_tdata[122][M_AXIS_BRAM_122_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 123) begin
            assign addr0[123][M_AXIS_BRAM_123_ADDR_WIDTH-1:0] = ap_bram_123_addr0;
            assign din0[123][M_AXIS_BRAM_123_WIDTH-1:0] = ap_bram_123_din0;
            assign ap_bram_123_dout0 = dout0[123][M_AXIS_BRAM_123_WIDTH-1:0];
            assign we0[123][M_AXIS_BRAM_123_WIDTH/8-1:0] = ap_bram_123_we0;
            assign en0[123] = ap_bram_123_en0;
            assign addr1[123][M_AXIS_BRAM_123_ADDR_WIDTH-1:0] = ap_bram_123_addr1;
            assign din1[123][M_AXIS_BRAM_123_WIDTH-1:0] = ap_bram_123_din1;
            assign ap_bram_123_dout1 = dout1[123][M_AXIS_BRAM_123_WIDTH-1:0];
            assign we1[123][M_AXIS_BRAM_123_WIDTH/8-1:0] = ap_bram_123_we1;
            assign en1[123] = ap_bram_123_en1;
            
            assign axis_clk[123] = m_axis_bram_123_aclk;
            assign axis_rst[123] = m_axis_bram_123_aresetn;
            assign dwconv1_tready[123] = m_axis_bram_123_tready;
            assign m_axis_bram_123_tlast = dwconv1_tlast[123];
            assign m_axis_bram_123_tvalid = dwconv1_tvalid[123];
            assign m_axis_bram_123_tkeep = dwconv1_tkeep[123][M_AXIS_BRAM_123_DMWIDTH/8-1:0];
            assign m_axis_bram_123_tstrb = dwconv1_tstrb[123][M_AXIS_BRAM_123_DMWIDTH/8-1:0];
            assign m_axis_bram_123_tdata = dwconv1_tdata[123][M_AXIS_BRAM_123_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 124) begin
            assign addr0[124][M_AXIS_BRAM_124_ADDR_WIDTH-1:0] = ap_bram_124_addr0;
            assign din0[124][M_AXIS_BRAM_124_WIDTH-1:0] = ap_bram_124_din0;
            assign ap_bram_124_dout0 = dout0[124][M_AXIS_BRAM_124_WIDTH-1:0];
            assign we0[124][M_AXIS_BRAM_124_WIDTH/8-1:0] = ap_bram_124_we0;
            assign en0[124] = ap_bram_124_en0;
            assign addr1[124][M_AXIS_BRAM_124_ADDR_WIDTH-1:0] = ap_bram_124_addr1;
            assign din1[124][M_AXIS_BRAM_124_WIDTH-1:0] = ap_bram_124_din1;
            assign ap_bram_124_dout1 = dout1[124][M_AXIS_BRAM_124_WIDTH-1:0];
            assign we1[124][M_AXIS_BRAM_124_WIDTH/8-1:0] = ap_bram_124_we1;
            assign en1[124] = ap_bram_124_en1;
            
            assign axis_clk[124] = m_axis_bram_124_aclk;
            assign axis_rst[124] = m_axis_bram_124_aresetn;
            assign dwconv1_tready[124] = m_axis_bram_124_tready;
            assign m_axis_bram_124_tlast = dwconv1_tlast[124];
            assign m_axis_bram_124_tvalid = dwconv1_tvalid[124];
            assign m_axis_bram_124_tkeep = dwconv1_tkeep[124][M_AXIS_BRAM_124_DMWIDTH/8-1:0];
            assign m_axis_bram_124_tstrb = dwconv1_tstrb[124][M_AXIS_BRAM_124_DMWIDTH/8-1:0];
            assign m_axis_bram_124_tdata = dwconv1_tdata[124][M_AXIS_BRAM_124_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 125) begin
            assign addr0[125][M_AXIS_BRAM_125_ADDR_WIDTH-1:0] = ap_bram_125_addr0;
            assign din0[125][M_AXIS_BRAM_125_WIDTH-1:0] = ap_bram_125_din0;
            assign ap_bram_125_dout0 = dout0[125][M_AXIS_BRAM_125_WIDTH-1:0];
            assign we0[125][M_AXIS_BRAM_125_WIDTH/8-1:0] = ap_bram_125_we0;
            assign en0[125] = ap_bram_125_en0;
            assign addr1[125][M_AXIS_BRAM_125_ADDR_WIDTH-1:0] = ap_bram_125_addr1;
            assign din1[125][M_AXIS_BRAM_125_WIDTH-1:0] = ap_bram_125_din1;
            assign ap_bram_125_dout1 = dout1[125][M_AXIS_BRAM_125_WIDTH-1:0];
            assign we1[125][M_AXIS_BRAM_125_WIDTH/8-1:0] = ap_bram_125_we1;
            assign en1[125] = ap_bram_125_en1;
            
            assign axis_clk[125] = m_axis_bram_125_aclk;
            assign axis_rst[125] = m_axis_bram_125_aresetn;
            assign dwconv1_tready[125] = m_axis_bram_125_tready;
            assign m_axis_bram_125_tlast = dwconv1_tlast[125];
            assign m_axis_bram_125_tvalid = dwconv1_tvalid[125];
            assign m_axis_bram_125_tkeep = dwconv1_tkeep[125][M_AXIS_BRAM_125_DMWIDTH/8-1:0];
            assign m_axis_bram_125_tstrb = dwconv1_tstrb[125][M_AXIS_BRAM_125_DMWIDTH/8-1:0];
            assign m_axis_bram_125_tdata = dwconv1_tdata[125][M_AXIS_BRAM_125_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 126) begin
            assign addr0[126][M_AXIS_BRAM_126_ADDR_WIDTH-1:0] = ap_bram_126_addr0;
            assign din0[126][M_AXIS_BRAM_126_WIDTH-1:0] = ap_bram_126_din0;
            assign ap_bram_126_dout0 = dout0[126][M_AXIS_BRAM_126_WIDTH-1:0];
            assign we0[126][M_AXIS_BRAM_126_WIDTH/8-1:0] = ap_bram_126_we0;
            assign en0[126] = ap_bram_126_en0;
            assign addr1[126][M_AXIS_BRAM_126_ADDR_WIDTH-1:0] = ap_bram_126_addr1;
            assign din1[126][M_AXIS_BRAM_126_WIDTH-1:0] = ap_bram_126_din1;
            assign ap_bram_126_dout1 = dout1[126][M_AXIS_BRAM_126_WIDTH-1:0];
            assign we1[126][M_AXIS_BRAM_126_WIDTH/8-1:0] = ap_bram_126_we1;
            assign en1[126] = ap_bram_126_en1;
            
            assign axis_clk[126] = m_axis_bram_126_aclk;
            assign axis_rst[126] = m_axis_bram_126_aresetn;
            assign dwconv1_tready[126] = m_axis_bram_126_tready;
            assign m_axis_bram_126_tlast = dwconv1_tlast[126];
            assign m_axis_bram_126_tvalid = dwconv1_tvalid[126];
            assign m_axis_bram_126_tkeep = dwconv1_tkeep[126][M_AXIS_BRAM_126_DMWIDTH/8-1:0];
            assign m_axis_bram_126_tstrb = dwconv1_tstrb[126][M_AXIS_BRAM_126_DMWIDTH/8-1:0];
            assign m_axis_bram_126_tdata = dwconv1_tdata[126][M_AXIS_BRAM_126_DMWIDTH-1:0];
        end
        if(C_NUM_OUTPUT_BRAMs > 127) begin
            assign addr0[127][M_AXIS_BRAM_127_ADDR_WIDTH-1:0] = ap_bram_127_addr0;
            assign din0[127][M_AXIS_BRAM_127_WIDTH-1:0] = ap_bram_127_din0;
            assign ap_bram_127_dout0 = dout0[127][M_AXIS_BRAM_127_WIDTH-1:0];
            assign we0[127][M_AXIS_BRAM_127_WIDTH/8-1:0] = ap_bram_127_we0;
            assign en0[127] = ap_bram_127_en0;
            assign addr1[127][M_AXIS_BRAM_127_ADDR_WIDTH-1:0] = ap_bram_127_addr1;
            assign din1[127][M_AXIS_BRAM_127_WIDTH-1:0] = ap_bram_127_din1;
            assign ap_bram_127_dout1 = dout1[127][M_AXIS_BRAM_127_WIDTH-1:0];
            assign we1[127][M_AXIS_BRAM_127_WIDTH/8-1:0] = ap_bram_127_we1;
            assign en1[127] = ap_bram_127_en1;
            
            assign axis_clk[127] = m_axis_bram_127_aclk;
            assign axis_rst[127] = m_axis_bram_127_aresetn;
            assign dwconv1_tready[127] = m_axis_bram_127_tready;
            assign m_axis_bram_127_tlast = dwconv1_tlast[127];
            assign m_axis_bram_127_tvalid = dwconv1_tvalid[127];
            assign m_axis_bram_127_tkeep = dwconv1_tkeep[127][M_AXIS_BRAM_127_DMWIDTH/8-1:0];
            assign m_axis_bram_127_tstrb = dwconv1_tstrb[127][M_AXIS_BRAM_127_DMWIDTH/8-1:0];
            assign m_axis_bram_127_tdata = dwconv1_tdata[127][M_AXIS_BRAM_127_DMWIDTH-1:0];
        end
    endgenerate
    
    //instantiate the bram2axis modules
    genvar idx;
    generate
        for(idx=0; idx<C_NUM_OUTPUT_BRAMs; idx=idx+1) begin: IN_FIFO_GEN
            //check if data width converter is needed
            if(C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx] != C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]) begin
                axis_dwidth_converter_v1_1_9_axis_dwidth_converter #(
                    .C_S_AXIS_TDATA_WIDTH(C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                    .C_M_AXIS_TDATA_WIDTH(C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                    .C_AXIS_TID_WIDTH(1),
                    .C_AXIS_TDEST_WIDTH(1),
                    .C_S_AXIS_TUSER_WIDTH(1),
                    .C_M_AXIS_TUSER_WIDTH(1),
                    .C_AXIS_SIGNAL_SET(32'h1F)  //Enabled: TLAST, TKEEP, TSTRB, TDATA, TREADY
                ) data_width_conv_1i (
                    .aclk(axis_clk[idx]),
                    .aresetn(axis_rst[idx]),
                    .aclken(1'b1),
                    .s_axis_tvalid(buf1_tvalid[idx]),
                    .s_axis_tready(buf1_tready[idx]),
                    .s_axis_tdata(buf1_tdata[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                    .s_axis_tstrb({C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}}),
                    .s_axis_tkeep({C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}}),
                    .s_axis_tlast(buf1_tlast[idx]),
//                    .s_axis_tid(),
//                    .s_axis_tdest(),
//                    .s_axis_tuser(),
                    .m_axis_tvalid(dwconv1_tvalid[idx]),
                    .m_axis_tready(dwconv1_tready[idx]),
                    .m_axis_tdata(dwconv1_tdata[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                    .m_axis_tstrb(dwconv1_tkeep[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                    .m_axis_tkeep(dwconv1_tstrb[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                    .m_axis_tlast(dwconv1_tlast[idx])
//                    .m_axis_tid(),
//                    .m_axis_tdest(),
//                    .m_axis_tuser()
                );
            end
            else begin
                //if no buffering, wire the input signals straight through
                assign dwconv1_tlast[idx] = buf1_tlast[idx];
                assign dwconv1_tvalid[idx] = buf1_tvalid[idx];
                assign buf1_tready[idx] = dwconv1_tready[idx];   //input
                assign dwconv1_tdata[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0] = buf1_tdata[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0];
                assign dwconv1_tkeep[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0] = {C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}};
                assign dwconv1_tstrb[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0] = {C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}};
            end
                        
            if(C_IS_ASYNC_BIT_ARRAY[32*(idx+1)-1:32*idx] == 0) begin
                axis_fifo #(
                    .C_DATA_WIDTH(C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                    .C_DATA_DEPTH(16),
                    .C_IS_ASYNC(C_IS_ASYNC_BIT_ARRAY[32*(idx+1)-1:32*idx])
                ) axis_fifo1_i (
                    .aresetn(acc_aresetn),
                    .inclk(acc_clk),
                    .in_tdata(out_tdata[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                    .in_tlast(out_tlast[idx]),  
                    .in_tvalid(out_tvalid[idx]),
                    .in_tready(out_tready[idx]),
                    .outclk(axis_clk[idx]), 
                    .out_tdata(buf1_tdata[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                    .out_tready(buf1_tready[idx]),
                    .out_tvalid(buf1_tvalid[idx]),
                    .out_tlast(buf1_tlast[idx])
                );
            end
            else begin
                //if no buffering, wire the input signals straight through
                assign buf1_tlast[idx] = out_tlast[idx];
                assign buf1_tvalid[idx] = out_tvalid[idx];
                assign out_tready[idx] = buf1_tready[idx];   //input
                assign buf1_tdata[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0] = out_tdata[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0];
            end
            
            fifo #( 
                .WIDTH(32),
                .DEPTH(C_QUEUE_DEPTH)
            ) depth_queue_i (
                .wr_clk(dm_clk),
                .din(outbram_depth[(idx+1)*32-1:idx*32]),
                .write(outbram_depth_write[idx]),
                .full(),
                .dout(fifo_depth[idx]),
                .read(fifo_depth_read[idx]),
                .empty(fifo_depth_empty[idx]),
                .rd_clk(acc_clk), 
                .rst(0) 
            );
            
            localparam NUM_BYTES = C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8; 
            wire [C_ADDR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0] bram_data_depth_m1; 
            assign bram_data_depth_m1 = fifo_depth[idx] - NUM_BYTES; 
            
            bram2axis #( 
                .C_AXIS_DATA_WIDTH(C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_BRAM_DATA_DEPTH(C_DEPTH_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_BRAM_DATA_WIDTH(C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_BRAM_ADDR_WIDTH(C_ADDR_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_MB_DEPTH(C_MB_DEPTH_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_NUM_PORTS(C_PORT_BIT_ARRAY[32*(idx+1)-1:32*idx])
            ) bram2axis_i (
                .ACC_CLK(acc_clk),
                .ARESETN(acc_aresetn),
                .CTRL_ACC_START(acc_start),
                .CTRL_ACC_DONE(acc_done),
                .CTRL_READY(outbram_ready[idx]),
                .CTRL_CANSTART(outbram_canstart[idx]),
                .DATA_DEPTH_M1(bram_data_depth_m1),
                .DATA_DEPTH_READ(fifo_depth_read[idx]),
                .DATA_DEPTH_EMPTY(fifo_depth_empty[idx]),
                //.AXI Stream interface
                .AXIS_TLAST(out_tlast[idx]),
                .AXIS_TVALID(out_tvalid[idx]),
                .AXIS_TDATA(out_tdata[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .AXIS_TREADY(out_tready[idx]),
                //ACC BRAM IF-0
                .bram0_addr(addr0[idx][C_ADDR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram0_din(din0[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram0_dout(dout0[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram0_we(we0[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                .bram0_en(en0[idx]),
                //ACC BRAM IF-1
                .bram1_addr(addr1[idx][C_ADDR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram1_din(din1[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram1_dout(dout1[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram1_we(we1[idx][C_OUTBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                .bram1_en(en1[idx])
            );
        end
    endgenerate
endmodule
