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

module in_bram_args #(
    parameter C_NUM_INPUT_BRAMs = 0, 
    parameter S_AXIS_BRAM_0_PORTS = 1,
    parameter S_AXIS_BRAM_1_PORTS = 1,
    parameter S_AXIS_BRAM_2_PORTS = 1,
    parameter S_AXIS_BRAM_3_PORTS = 1,
    parameter S_AXIS_BRAM_4_PORTS = 1,
    parameter S_AXIS_BRAM_5_PORTS = 1,
    parameter S_AXIS_BRAM_6_PORTS = 1,
    parameter S_AXIS_BRAM_7_PORTS = 1,
    parameter S_AXIS_BRAM_8_PORTS = 1,
    parameter S_AXIS_BRAM_9_PORTS = 1,
    parameter S_AXIS_BRAM_10_PORTS = 1,
    parameter S_AXIS_BRAM_11_PORTS = 1,
    parameter S_AXIS_BRAM_12_PORTS = 1,
    parameter S_AXIS_BRAM_13_PORTS = 1,
    parameter S_AXIS_BRAM_14_PORTS = 1,
    parameter S_AXIS_BRAM_15_PORTS = 1,
    parameter S_AXIS_BRAM_16_PORTS = 1,
    parameter S_AXIS_BRAM_17_PORTS = 1,
    parameter S_AXIS_BRAM_18_PORTS = 1,
    parameter S_AXIS_BRAM_19_PORTS = 1,
    parameter S_AXIS_BRAM_20_PORTS = 1,
    parameter S_AXIS_BRAM_21_PORTS = 1,
    parameter S_AXIS_BRAM_22_PORTS = 1,
    parameter S_AXIS_BRAM_23_PORTS = 1,
    parameter S_AXIS_BRAM_24_PORTS = 1,
    parameter S_AXIS_BRAM_25_PORTS = 1,
    parameter S_AXIS_BRAM_26_PORTS = 1,
    parameter S_AXIS_BRAM_27_PORTS = 1,
    parameter S_AXIS_BRAM_28_PORTS = 1,
    parameter S_AXIS_BRAM_29_PORTS = 1,
    parameter S_AXIS_BRAM_30_PORTS = 1,
    parameter S_AXIS_BRAM_31_PORTS = 1,
    parameter S_AXIS_BRAM_32_PORTS = 1,
    parameter S_AXIS_BRAM_33_PORTS = 1,
    parameter S_AXIS_BRAM_34_PORTS = 1,
    parameter S_AXIS_BRAM_35_PORTS = 1,
    parameter S_AXIS_BRAM_36_PORTS = 1,
    parameter S_AXIS_BRAM_37_PORTS = 1,
    parameter S_AXIS_BRAM_38_PORTS = 1,
    parameter S_AXIS_BRAM_39_PORTS = 1,
    parameter S_AXIS_BRAM_40_PORTS = 1,
    parameter S_AXIS_BRAM_41_PORTS = 1,
    parameter S_AXIS_BRAM_42_PORTS = 1,
    parameter S_AXIS_BRAM_43_PORTS = 1,
    parameter S_AXIS_BRAM_44_PORTS = 1,
    parameter S_AXIS_BRAM_45_PORTS = 1,
    parameter S_AXIS_BRAM_46_PORTS = 1,
    parameter S_AXIS_BRAM_47_PORTS = 1,
    parameter S_AXIS_BRAM_48_PORTS = 1,
    parameter S_AXIS_BRAM_49_PORTS = 1,
    parameter S_AXIS_BRAM_50_PORTS = 1,
    parameter S_AXIS_BRAM_51_PORTS = 1,
    parameter S_AXIS_BRAM_52_PORTS = 1,
    parameter S_AXIS_BRAM_53_PORTS = 1,
    parameter S_AXIS_BRAM_54_PORTS = 1,
    parameter S_AXIS_BRAM_55_PORTS = 1,
    parameter S_AXIS_BRAM_56_PORTS = 1,
    parameter S_AXIS_BRAM_57_PORTS = 1,
    parameter S_AXIS_BRAM_58_PORTS = 1,
    parameter S_AXIS_BRAM_59_PORTS = 1,
    parameter S_AXIS_BRAM_60_PORTS = 1,
    parameter S_AXIS_BRAM_61_PORTS = 1,
    parameter S_AXIS_BRAM_62_PORTS = 1,
    parameter S_AXIS_BRAM_63_PORTS = 1,
    parameter S_AXIS_BRAM_64_PORTS = 1,
    parameter S_AXIS_BRAM_65_PORTS = 1,
    parameter S_AXIS_BRAM_66_PORTS = 1,
    parameter S_AXIS_BRAM_67_PORTS = 1,
    parameter S_AXIS_BRAM_68_PORTS = 1,
    parameter S_AXIS_BRAM_69_PORTS = 1,
    parameter S_AXIS_BRAM_70_PORTS = 1,
    parameter S_AXIS_BRAM_71_PORTS = 1,
    parameter S_AXIS_BRAM_72_PORTS = 1,
    parameter S_AXIS_BRAM_73_PORTS = 1,
    parameter S_AXIS_BRAM_74_PORTS = 1,
    parameter S_AXIS_BRAM_75_PORTS = 1,
    parameter S_AXIS_BRAM_76_PORTS = 1,
    parameter S_AXIS_BRAM_77_PORTS = 1,
    parameter S_AXIS_BRAM_78_PORTS = 1,
    parameter S_AXIS_BRAM_79_PORTS = 1,
    parameter S_AXIS_BRAM_80_PORTS = 1,
    parameter S_AXIS_BRAM_81_PORTS = 1,
    parameter S_AXIS_BRAM_82_PORTS = 1,
    parameter S_AXIS_BRAM_83_PORTS = 1,
    parameter S_AXIS_BRAM_84_PORTS = 1,
    parameter S_AXIS_BRAM_85_PORTS = 1,
    parameter S_AXIS_BRAM_86_PORTS = 1,
    parameter S_AXIS_BRAM_87_PORTS = 1,
    parameter S_AXIS_BRAM_88_PORTS = 1,
    parameter S_AXIS_BRAM_89_PORTS = 1,
    parameter S_AXIS_BRAM_90_PORTS = 1,
    parameter S_AXIS_BRAM_91_PORTS = 1,
    parameter S_AXIS_BRAM_92_PORTS = 1,
    parameter S_AXIS_BRAM_93_PORTS = 1,
    parameter S_AXIS_BRAM_94_PORTS = 1,
    parameter S_AXIS_BRAM_95_PORTS = 1,
    parameter S_AXIS_BRAM_96_PORTS = 1,
    parameter S_AXIS_BRAM_97_PORTS = 1,
    parameter S_AXIS_BRAM_98_PORTS = 1,
    parameter S_AXIS_BRAM_99_PORTS = 1,
    parameter S_AXIS_BRAM_100_PORTS = 1,
    parameter S_AXIS_BRAM_101_PORTS = 1,
    parameter S_AXIS_BRAM_102_PORTS = 1,
    parameter S_AXIS_BRAM_103_PORTS = 1,
    parameter S_AXIS_BRAM_104_PORTS = 1,
    parameter S_AXIS_BRAM_105_PORTS = 1,
    parameter S_AXIS_BRAM_106_PORTS = 1,
    parameter S_AXIS_BRAM_107_PORTS = 1,
    parameter S_AXIS_BRAM_108_PORTS = 1,
    parameter S_AXIS_BRAM_109_PORTS = 1,
    parameter S_AXIS_BRAM_110_PORTS = 1,
    parameter S_AXIS_BRAM_111_PORTS = 1,
    parameter S_AXIS_BRAM_112_PORTS = 1,
    parameter S_AXIS_BRAM_113_PORTS = 1,
    parameter S_AXIS_BRAM_114_PORTS = 1,
    parameter S_AXIS_BRAM_115_PORTS = 1,
    parameter S_AXIS_BRAM_116_PORTS = 1,
    parameter S_AXIS_BRAM_117_PORTS = 1,
    parameter S_AXIS_BRAM_118_PORTS = 1,
    parameter S_AXIS_BRAM_119_PORTS = 1,
    parameter S_AXIS_BRAM_120_PORTS = 1,
    parameter S_AXIS_BRAM_121_PORTS = 1,
    parameter S_AXIS_BRAM_122_PORTS = 1,
    parameter S_AXIS_BRAM_123_PORTS = 1,
    parameter S_AXIS_BRAM_124_PORTS = 1,
    parameter S_AXIS_BRAM_125_PORTS = 1,
    parameter S_AXIS_BRAM_126_PORTS = 1,
    parameter S_AXIS_BRAM_127_PORTS = 1,
    parameter [31:0] S_AXIS_BRAM_0_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_1_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_2_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_3_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_4_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_5_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_6_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_7_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_8_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_9_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_10_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_11_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_12_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_13_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_14_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_15_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_16_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_17_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_18_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_19_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_20_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_21_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_22_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_23_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_24_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_25_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_26_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_27_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_28_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_29_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_30_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_31_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_32_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_33_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_34_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_35_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_36_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_37_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_38_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_39_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_40_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_41_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_42_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_43_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_44_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_45_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_46_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_47_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_48_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_49_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_50_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_51_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_52_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_53_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_54_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_55_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_56_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_57_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_58_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_59_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_60_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_61_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_62_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_63_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_64_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_65_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_66_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_67_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_68_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_69_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_70_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_71_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_72_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_73_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_74_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_75_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_76_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_77_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_78_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_79_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_80_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_81_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_82_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_83_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_84_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_85_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_86_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_87_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_88_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_89_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_90_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_91_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_92_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_93_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_94_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_95_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_96_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_97_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_98_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_99_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_100_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_101_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_102_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_103_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_104_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_105_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_106_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_107_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_108_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_109_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_110_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_111_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_112_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_113_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_114_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_115_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_116_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_117_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_118_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_119_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_120_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_121_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_122_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_123_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_124_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_125_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_126_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_127_WIDTH = 8,     //width of input bram interface on the accelerator
    parameter [31:0] S_AXIS_BRAM_0_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_1_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_2_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_3_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_4_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_5_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_6_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_7_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_8_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_9_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_10_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_11_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_12_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_13_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_14_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_15_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_16_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_17_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_18_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_19_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_20_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_21_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_22_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_23_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_24_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_25_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_26_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_27_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_28_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_29_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_30_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_31_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_32_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_33_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_34_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_35_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_36_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_37_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_38_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_39_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_40_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_41_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_42_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_43_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_44_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_45_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_46_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_47_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_48_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_49_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_50_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_51_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_52_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_53_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_54_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_55_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_56_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_57_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_58_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_59_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_60_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_61_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_62_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_63_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_64_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_65_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_66_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_67_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_68_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_69_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_70_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_71_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_72_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_73_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_74_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_75_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_76_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_77_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_78_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_79_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_80_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_81_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_82_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_83_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_84_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_85_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_86_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_87_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_88_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_89_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_90_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_91_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_92_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_93_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_94_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_95_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_96_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_97_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_98_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_99_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_100_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_101_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_102_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_103_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_104_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_105_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_106_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_107_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_108_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_109_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_110_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_111_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_112_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_113_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_114_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_115_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_116_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_117_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_118_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_119_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_120_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_121_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_122_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_123_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_124_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_125_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_126_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_127_DEPTH = 2,      //depth of BRAM in adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_0_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_1_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_2_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_3_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_4_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_5_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_6_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_7_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_8_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_9_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_10_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_11_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_12_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_13_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_14_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_15_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_16_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_17_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_18_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_19_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_20_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_21_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_22_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_23_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_24_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_25_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_26_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_27_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_28_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_29_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_30_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_31_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_32_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_33_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_34_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_35_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_36_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_37_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_38_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_39_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_40_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_41_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_42_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_43_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_44_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_45_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_46_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_47_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_48_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_49_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_50_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_51_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_52_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_53_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_54_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_55_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_56_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_57_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_58_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_59_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_60_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_61_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_62_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_63_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_64_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_65_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_66_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_67_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_68_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_69_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_70_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_71_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_72_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_73_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_74_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_75_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_76_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_77_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_78_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_79_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_80_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_81_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_82_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_83_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_84_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_85_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_86_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_87_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_88_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_89_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_90_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_91_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_92_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_93_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_94_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_95_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_96_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_97_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_98_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_99_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_100_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_101_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_102_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_103_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_104_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_105_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_106_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_107_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_108_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_109_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_110_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_111_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_112_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_113_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_114_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_115_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_116_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_117_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_118_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_119_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_120_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_121_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_122_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_123_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_124_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_125_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_126_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_127_DMWIDTH = 8,   //width of AXIS interface from DM to adapter for input bram interface
    parameter [31:0] S_AXIS_BRAM_0_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_1_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_2_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_3_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_4_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_5_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_6_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_7_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_8_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_9_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_10_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_11_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_12_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_13_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_14_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_15_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_16_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_17_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_18_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_19_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_20_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_21_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_22_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_23_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_24_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_25_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_26_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_27_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_28_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_29_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_30_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_31_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_32_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_33_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_34_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_35_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_36_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_37_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_38_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_39_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_40_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_41_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_42_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_43_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_44_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_45_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_46_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_47_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_48_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_49_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_50_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_51_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_52_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_53_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_54_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_55_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_56_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_57_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_58_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_59_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_60_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_61_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_62_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_63_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_64_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_65_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_66_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_67_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_68_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_69_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_70_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_71_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_72_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_73_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_74_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_75_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_76_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_77_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_78_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_79_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_80_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_81_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_82_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_83_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_84_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_85_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_86_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_87_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_88_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_89_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_90_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_91_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_92_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_93_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_94_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_95_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_96_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_97_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_98_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_99_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_100_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_101_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_102_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_103_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_104_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_105_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_106_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_107_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_108_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_109_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_110_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_111_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_112_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_113_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_114_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_115_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_116_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_117_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_118_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_119_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_120_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_121_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_122_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_123_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_124_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_125_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_126_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] S_AXIS_BRAM_127_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_0_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_1_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_2_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_3_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_4_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_5_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_6_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_7_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_8_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_9_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_10_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_11_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_12_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_13_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_14_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_15_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_16_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_17_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_18_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_19_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_20_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_21_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_22_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_23_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_24_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_25_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_26_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_27_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_28_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_29_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_30_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_31_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_32_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_33_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_34_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_35_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_36_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_37_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_38_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_39_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_40_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_41_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_42_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_43_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_44_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_45_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_46_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_47_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_48_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_49_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_50_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_51_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_52_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_53_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_54_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_55_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_56_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_57_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_58_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_59_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_60_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_61_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_62_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_63_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_64_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_65_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_66_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_67_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_68_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_69_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_70_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_71_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_72_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_73_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_74_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_75_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_76_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_77_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_78_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_79_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_80_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_81_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_82_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_83_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_84_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_85_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_86_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_87_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_88_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_89_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_90_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_91_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_92_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_93_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_94_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_95_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_96_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_97_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_98_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_99_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_100_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_101_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_102_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_103_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_104_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_105_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_106_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_107_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_108_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_109_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_110_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_111_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_112_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_113_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_114_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_115_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_116_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_117_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_118_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_119_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_120_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_121_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_122_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_123_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_124_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_125_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_126_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_127_DMWIDTH = 8,
    parameter [31:0] M_AXIS_BRAMIO_0_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_1_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_2_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_3_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_4_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_5_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_6_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_7_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_8_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_9_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_10_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_11_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_12_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_13_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_14_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_15_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_16_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_17_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_18_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_19_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_20_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_21_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_22_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_23_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_24_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_25_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_26_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_27_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_28_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_29_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_30_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_31_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_32_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_33_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_34_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_35_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_36_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_37_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_38_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_39_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_40_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_41_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_42_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_43_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_44_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_45_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_46_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_47_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_48_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_49_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_50_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_51_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_52_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_53_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_54_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_55_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_56_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_57_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_58_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_59_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_60_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_61_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_62_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_63_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_64_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_65_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_66_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_67_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_68_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_69_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_70_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_71_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_72_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_73_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_74_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_75_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_76_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_77_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_78_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_79_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_80_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_81_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_82_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_83_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_84_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_85_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_86_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_87_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_88_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_89_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_90_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_91_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_92_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_93_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_94_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_95_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_96_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_97_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_98_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_99_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_100_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_101_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_102_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_103_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_104_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_105_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_106_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_107_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_108_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_109_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_110_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_111_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_112_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_113_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_114_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_115_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_116_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_117_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_118_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_119_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_120_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_121_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_122_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_123_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_124_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_125_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_126_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [31:0] M_AXIS_BRAMIO_127_IS_ASYNC = 0,   //should fifo buffer be asynchronous (0) or synchronours (1)
    parameter [0:0] S_AXIS_BRAM_0_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_1_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_2_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_3_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_4_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_5_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_6_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_7_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_8_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_9_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_10_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_11_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_12_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_13_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_14_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_15_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_16_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_17_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_18_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_19_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_20_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_21_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_22_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_23_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_24_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_25_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_26_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_27_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_28_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_29_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_30_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_31_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_32_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_33_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_34_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_35_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_36_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_37_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_38_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_39_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_40_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_41_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_42_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_43_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_44_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_45_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_46_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_47_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_48_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_49_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_50_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_51_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_52_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_53_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_54_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_55_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_56_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_57_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_58_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_59_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_60_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_61_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_62_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_63_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_64_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_65_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_66_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_67_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_68_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_69_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_70_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_71_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_72_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_73_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_74_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_75_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_76_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_77_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_78_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_79_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_80_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_81_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_82_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_83_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_84_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_85_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_86_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_87_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_88_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_89_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_90_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_91_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_92_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_93_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_94_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_95_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_96_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_97_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_98_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_99_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_100_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_101_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_102_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_103_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_104_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_105_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_106_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_107_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_108_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_109_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_110_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_111_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_112_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_113_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_114_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_115_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_116_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_117_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_118_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_119_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_120_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_121_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_122_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_123_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_124_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_125_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_126_IS_INOUT = 0,
    parameter [0:0] S_AXIS_BRAM_127_IS_INOUT = 0,
    parameter [31:0] S_AXIS_BRAM_0_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_1_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_2_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_3_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_4_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_5_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_6_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_7_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_8_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_9_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_10_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_11_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_12_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_13_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_14_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_15_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_16_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_17_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_18_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_19_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_20_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_21_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_22_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_23_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_24_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_25_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_26_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_27_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_28_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_29_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_30_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_31_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_32_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_33_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_34_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_35_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_36_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_37_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_38_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_39_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_40_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_41_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_42_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_43_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_44_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_45_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_46_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_47_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_48_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_49_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_50_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_51_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_52_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_53_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_54_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_55_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_56_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_57_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_58_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_59_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_60_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_61_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_62_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_63_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_64_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_65_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_66_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_67_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_68_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_69_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_70_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_71_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_72_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_73_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_74_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_75_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_76_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_77_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_78_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_79_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_80_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_81_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_82_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_83_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_84_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_85_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_86_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_87_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_88_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_89_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_90_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_91_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_92_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_93_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_94_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_95_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_96_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_97_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_98_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_99_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_100_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_101_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_102_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_103_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_104_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_105_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_106_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_107_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_108_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_109_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_110_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_111_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_112_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_113_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_114_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_115_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_116_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_117_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_118_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_119_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_120_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_121_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_122_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_123_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_124_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_125_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_126_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_127_MB_DEPTH = 1,  //depth, number of copies of BRAM args
    parameter [31:0] S_AXIS_BRAM_0_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_1_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_2_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_3_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_4_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_5_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_6_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_7_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_8_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_9_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_10_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_11_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_12_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_13_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_14_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_15_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_16_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_17_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_18_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_19_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_20_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_21_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_22_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_23_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_24_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_25_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_26_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_27_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_28_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_29_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_30_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_31_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_32_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_33_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_34_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_35_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_36_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_37_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_38_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_39_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_40_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_41_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_42_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_43_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_44_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_45_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_46_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_47_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_48_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_49_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_50_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_51_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_52_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_53_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_54_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_55_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_56_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_57_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_58_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_59_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_60_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_61_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_62_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_63_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_64_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_65_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_66_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_67_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_68_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_69_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_70_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_71_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_72_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_73_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_74_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_75_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_76_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_77_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_78_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_79_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_80_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_81_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_82_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_83_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_84_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_85_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_86_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_87_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_88_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_89_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_90_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_91_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_92_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_93_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_94_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_95_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_96_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_97_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_98_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_99_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_100_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_101_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_102_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_103_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_104_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_105_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_106_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_107_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_108_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_109_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_110_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_111_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_112_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_113_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_114_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_115_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_116_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_117_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_118_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_119_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_120_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_121_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_122_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_123_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_124_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_125_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_126_ADDR_WIDTH = 1,
    parameter [31:0] S_AXIS_BRAM_127_ADDR_WIDTH = 1
 ) (
    input acc_clk,
    input acc_aresetn,
    //control interface
    input in_bram_allow_in,
    input in_bram_allow_out,
    input acc_start,
    input acc_done,
    output [C_NUM_INPUT_BRAMs-1:0] in_bram_ready,
    output [C_NUM_INPUT_BRAMs-1:0] inout_bram_ready,
    //-----------------------------------------------------------
    //input AXI-Stream to FIFO interface 0
    input s_axis_bram_0_aclk,
    input s_axis_bram_0_aresetn,
    input s_axis_bram_0_tlast,
    input s_axis_bram_0_tvalid,
    input [S_AXIS_BRAM_0_DMWIDTH/8-1:0] s_axis_bram_0_tkeep,
    input [S_AXIS_BRAM_0_DMWIDTH/8-1:0] s_axis_bram_0_tstrb,
    input [S_AXIS_BRAM_0_DMWIDTH-1:0] s_axis_bram_0_tdata,
    output s_axis_bram_0_tready,
    input [S_AXIS_BRAM_0_ADDR_WIDTH-1:0] ap_bram_0_addr0,
    input [S_AXIS_BRAM_0_WIDTH-1:0] ap_bram_0_din0,
    output [S_AXIS_BRAM_0_WIDTH-1:0] ap_bram_0_dout0,
    input [S_AXIS_BRAM_0_WIDTH/8-1:0] ap_bram_0_we0,
    input ap_bram_0_en0,
    input [S_AXIS_BRAM_0_ADDR_WIDTH-1:0] ap_bram_0_addr1,
    input [S_AXIS_BRAM_0_WIDTH-1:0] ap_bram_0_din1,
    output [S_AXIS_BRAM_0_WIDTH-1:0] ap_bram_0_dout1,
    input [S_AXIS_BRAM_0_WIDTH/8-1:0] ap_bram_0_we1,
    input ap_bram_0_en1,
    //input AXI-Stream to FIFO interface 1
    input s_axis_bram_1_aclk,
    input s_axis_bram_1_aresetn,
    input s_axis_bram_1_tlast,
    input s_axis_bram_1_tvalid,
    input [S_AXIS_BRAM_1_DMWIDTH/8-1:0] s_axis_bram_1_tkeep,
    input [S_AXIS_BRAM_1_DMWIDTH/8-1:0] s_axis_bram_1_tstrb,
    input [S_AXIS_BRAM_1_DMWIDTH-1:0] s_axis_bram_1_tdata,
    output s_axis_bram_1_tready,
    input [S_AXIS_BRAM_1_ADDR_WIDTH-1:0] ap_bram_1_addr0,
    input [S_AXIS_BRAM_1_WIDTH-1:0] ap_bram_1_din0,
    output [S_AXIS_BRAM_1_WIDTH-1:0] ap_bram_1_dout0,
    input [S_AXIS_BRAM_1_WIDTH/8-1:0] ap_bram_1_we0,
    input ap_bram_1_en0,
    input [S_AXIS_BRAM_1_ADDR_WIDTH-1:0] ap_bram_1_addr1,
    input [S_AXIS_BRAM_1_WIDTH-1:0] ap_bram_1_din1,
    output [S_AXIS_BRAM_1_WIDTH-1:0] ap_bram_1_dout1,
    input [S_AXIS_BRAM_1_WIDTH/8-1:0] ap_bram_1_we1,
    input ap_bram_1_en1,
    //input AXI-Stream to FIFO interface 2
    input s_axis_bram_2_aclk,
    input s_axis_bram_2_aresetn,
    input s_axis_bram_2_tlast,
    input s_axis_bram_2_tvalid,
    input [S_AXIS_BRAM_2_DMWIDTH/8-1:0] s_axis_bram_2_tkeep,
    input [S_AXIS_BRAM_2_DMWIDTH/8-1:0] s_axis_bram_2_tstrb,
    input [S_AXIS_BRAM_2_DMWIDTH-1:0] s_axis_bram_2_tdata,
    output s_axis_bram_2_tready,
    input [S_AXIS_BRAM_2_ADDR_WIDTH-1:0] ap_bram_2_addr0,
    input [S_AXIS_BRAM_2_WIDTH-1:0] ap_bram_2_din0,
    output [S_AXIS_BRAM_2_WIDTH-1:0] ap_bram_2_dout0,
    input [S_AXIS_BRAM_2_WIDTH/8-1:0] ap_bram_2_we0,
    input ap_bram_2_en0,
    input [S_AXIS_BRAM_2_ADDR_WIDTH-1:0] ap_bram_2_addr1,
    input [S_AXIS_BRAM_2_WIDTH-1:0] ap_bram_2_din1,
    output [S_AXIS_BRAM_2_WIDTH-1:0] ap_bram_2_dout1,
    input [S_AXIS_BRAM_2_WIDTH/8-1:0] ap_bram_2_we1,
    input ap_bram_2_en1,
    //input AXI-Stream to FIFO interface 3
    input s_axis_bram_3_aclk,
    input s_axis_bram_3_aresetn,
    input s_axis_bram_3_tlast,
    input s_axis_bram_3_tvalid,
    input [S_AXIS_BRAM_3_DMWIDTH/8-1:0] s_axis_bram_3_tkeep,
    input [S_AXIS_BRAM_3_DMWIDTH/8-1:0] s_axis_bram_3_tstrb,
    input [S_AXIS_BRAM_3_DMWIDTH-1:0] s_axis_bram_3_tdata,
    output s_axis_bram_3_tready,
    input [S_AXIS_BRAM_3_ADDR_WIDTH-1:0] ap_bram_3_addr0,
    input [S_AXIS_BRAM_3_WIDTH-1:0] ap_bram_3_din0,
    output [S_AXIS_BRAM_3_WIDTH-1:0] ap_bram_3_dout0,
    input [S_AXIS_BRAM_3_WIDTH/8-1:0] ap_bram_3_we0,
    input ap_bram_3_en0,
    input [S_AXIS_BRAM_3_ADDR_WIDTH-1:0] ap_bram_3_addr1,
    input [S_AXIS_BRAM_3_WIDTH-1:0] ap_bram_3_din1,
    output [S_AXIS_BRAM_3_WIDTH-1:0] ap_bram_3_dout1,
    input [S_AXIS_BRAM_3_WIDTH/8-1:0] ap_bram_3_we1,
    input ap_bram_3_en1,
    //input AXI-Stream to FIFO interface 4
    input s_axis_bram_4_aclk,
    input s_axis_bram_4_aresetn,
    input s_axis_bram_4_tlast,
    input s_axis_bram_4_tvalid,
    input [S_AXIS_BRAM_4_DMWIDTH/8-1:0] s_axis_bram_4_tkeep,
    input [S_AXIS_BRAM_4_DMWIDTH/8-1:0] s_axis_bram_4_tstrb,
    input [S_AXIS_BRAM_4_DMWIDTH-1:0] s_axis_bram_4_tdata,
    output s_axis_bram_4_tready,
    input [S_AXIS_BRAM_4_ADDR_WIDTH-1:0] ap_bram_4_addr0,
    input [S_AXIS_BRAM_4_WIDTH-1:0] ap_bram_4_din0,
    output [S_AXIS_BRAM_4_WIDTH-1:0] ap_bram_4_dout0,
    input [S_AXIS_BRAM_4_WIDTH/8-1:0] ap_bram_4_we0,
    input ap_bram_4_en0,
    input [S_AXIS_BRAM_4_ADDR_WIDTH-1:0] ap_bram_4_addr1,
    input [S_AXIS_BRAM_4_WIDTH-1:0] ap_bram_4_din1,
    output [S_AXIS_BRAM_4_WIDTH-1:0] ap_bram_4_dout1,
    input [S_AXIS_BRAM_4_WIDTH/8-1:0] ap_bram_4_we1,
    input ap_bram_4_en1,
    //input AXI-Stream to FIFO interface 5
    input s_axis_bram_5_aclk,
    input s_axis_bram_5_aresetn,
    input s_axis_bram_5_tlast,
    input s_axis_bram_5_tvalid,
    input [S_AXIS_BRAM_5_DMWIDTH/8-1:0] s_axis_bram_5_tkeep,
    input [S_AXIS_BRAM_5_DMWIDTH/8-1:0] s_axis_bram_5_tstrb,
    input [S_AXIS_BRAM_5_DMWIDTH-1:0] s_axis_bram_5_tdata,
    output s_axis_bram_5_tready,
    input [S_AXIS_BRAM_5_ADDR_WIDTH-1:0] ap_bram_5_addr0,
    input [S_AXIS_BRAM_5_WIDTH-1:0] ap_bram_5_din0,
    output [S_AXIS_BRAM_5_WIDTH-1:0] ap_bram_5_dout0,
    input [S_AXIS_BRAM_5_WIDTH/8-1:0] ap_bram_5_we0,
    input ap_bram_5_en0,
    input [S_AXIS_BRAM_5_ADDR_WIDTH-1:0] ap_bram_5_addr1,
    input [S_AXIS_BRAM_5_WIDTH-1:0] ap_bram_5_din1,
    output [S_AXIS_BRAM_5_WIDTH-1:0] ap_bram_5_dout1,
    input [S_AXIS_BRAM_5_WIDTH/8-1:0] ap_bram_5_we1,
    input ap_bram_5_en1,
    //input AXI-Stream to FIFO interface 6
    input s_axis_bram_6_aclk,
    input s_axis_bram_6_aresetn,
    input s_axis_bram_6_tlast,
    input s_axis_bram_6_tvalid,
    input [S_AXIS_BRAM_6_DMWIDTH/8-1:0] s_axis_bram_6_tkeep,
    input [S_AXIS_BRAM_6_DMWIDTH/8-1:0] s_axis_bram_6_tstrb,
    input [S_AXIS_BRAM_6_DMWIDTH-1:0] s_axis_bram_6_tdata,
    output s_axis_bram_6_tready,
    input [S_AXIS_BRAM_6_ADDR_WIDTH-1:0] ap_bram_6_addr0,
    input [S_AXIS_BRAM_6_WIDTH-1:0] ap_bram_6_din0,
    output [S_AXIS_BRAM_6_WIDTH-1:0] ap_bram_6_dout0,
    input [S_AXIS_BRAM_6_WIDTH/8-1:0] ap_bram_6_we0,
    input ap_bram_6_en0,
    input [S_AXIS_BRAM_6_ADDR_WIDTH-1:0] ap_bram_6_addr1,
    input [S_AXIS_BRAM_6_WIDTH-1:0] ap_bram_6_din1,
    output [S_AXIS_BRAM_6_WIDTH-1:0] ap_bram_6_dout1,
    input [S_AXIS_BRAM_6_WIDTH/8-1:0] ap_bram_6_we1,
    input ap_bram_6_en1,
    //input AXI-Stream to FIFO interface 7
    input s_axis_bram_7_aclk,
    input s_axis_bram_7_aresetn,
    input s_axis_bram_7_tlast,
    input s_axis_bram_7_tvalid,
    input [S_AXIS_BRAM_7_DMWIDTH/8-1:0] s_axis_bram_7_tkeep,
    input [S_AXIS_BRAM_7_DMWIDTH/8-1:0] s_axis_bram_7_tstrb,
    input [S_AXIS_BRAM_7_DMWIDTH-1:0] s_axis_bram_7_tdata,
    output s_axis_bram_7_tready,
    input [S_AXIS_BRAM_7_ADDR_WIDTH-1:0] ap_bram_7_addr0,
    input [S_AXIS_BRAM_7_WIDTH-1:0] ap_bram_7_din0,
    output [S_AXIS_BRAM_7_WIDTH-1:0] ap_bram_7_dout0,
    input [S_AXIS_BRAM_7_WIDTH/8-1:0] ap_bram_7_we0,
    input ap_bram_7_en0,
    input [S_AXIS_BRAM_7_ADDR_WIDTH-1:0] ap_bram_7_addr1,
    input [S_AXIS_BRAM_7_WIDTH-1:0] ap_bram_7_din1,
    output [S_AXIS_BRAM_7_WIDTH-1:0] ap_bram_7_dout1,
    input [S_AXIS_BRAM_7_WIDTH/8-1:0] ap_bram_7_we1,
    input ap_bram_7_en1,
    //input AXI-Stream to FIFO interface 8
    input s_axis_bram_8_aclk,
    input s_axis_bram_8_aresetn,
    input s_axis_bram_8_tlast,
    input s_axis_bram_8_tvalid,
    input [S_AXIS_BRAM_8_DMWIDTH/8-1:0] s_axis_bram_8_tkeep,
    input [S_AXIS_BRAM_8_DMWIDTH/8-1:0] s_axis_bram_8_tstrb,
    input [S_AXIS_BRAM_8_DMWIDTH-1:0] s_axis_bram_8_tdata,
    output s_axis_bram_8_tready,
    input [S_AXIS_BRAM_8_ADDR_WIDTH-1:0] ap_bram_8_addr0,
    input [S_AXIS_BRAM_8_WIDTH-1:0] ap_bram_8_din0,
    output [S_AXIS_BRAM_8_WIDTH-1:0] ap_bram_8_dout0,
    input [S_AXIS_BRAM_8_WIDTH/8-1:0] ap_bram_8_we0,
    input ap_bram_8_en0,
    input [S_AXIS_BRAM_8_ADDR_WIDTH-1:0] ap_bram_8_addr1,
    input [S_AXIS_BRAM_8_WIDTH-1:0] ap_bram_8_din1,
    output [S_AXIS_BRAM_8_WIDTH-1:0] ap_bram_8_dout1,
    input [S_AXIS_BRAM_8_WIDTH/8-1:0] ap_bram_8_we1,
    input ap_bram_8_en1,
    //input AXI-Stream to FIFO interface 9
    input s_axis_bram_9_aclk,
    input s_axis_bram_9_aresetn,
    input s_axis_bram_9_tlast,
    input s_axis_bram_9_tvalid,
    input [S_AXIS_BRAM_9_DMWIDTH/8-1:0] s_axis_bram_9_tkeep,
    input [S_AXIS_BRAM_9_DMWIDTH/8-1:0] s_axis_bram_9_tstrb,
    input [S_AXIS_BRAM_9_DMWIDTH-1:0] s_axis_bram_9_tdata,
    output s_axis_bram_9_tready,
    input [S_AXIS_BRAM_9_ADDR_WIDTH-1:0] ap_bram_9_addr0,
    input [S_AXIS_BRAM_9_WIDTH-1:0] ap_bram_9_din0,
    output [S_AXIS_BRAM_9_WIDTH-1:0] ap_bram_9_dout0,
    input [S_AXIS_BRAM_9_WIDTH/8-1:0] ap_bram_9_we0,
    input ap_bram_9_en0,
    input [S_AXIS_BRAM_9_ADDR_WIDTH-1:0] ap_bram_9_addr1,
    input [S_AXIS_BRAM_9_WIDTH-1:0] ap_bram_9_din1,
    output [S_AXIS_BRAM_9_WIDTH-1:0] ap_bram_9_dout1,
    input [S_AXIS_BRAM_9_WIDTH/8-1:0] ap_bram_9_we1,
    input ap_bram_9_en1,
    //input AXI-Stream to FIFO interface 10
    input s_axis_bram_10_aclk,
    input s_axis_bram_10_aresetn,
    input s_axis_bram_10_tlast,
    input s_axis_bram_10_tvalid,
    input [S_AXIS_BRAM_10_DMWIDTH/8-1:0] s_axis_bram_10_tkeep,
    input [S_AXIS_BRAM_10_DMWIDTH/8-1:0] s_axis_bram_10_tstrb,
    input [S_AXIS_BRAM_10_DMWIDTH-1:0] s_axis_bram_10_tdata,
    output s_axis_bram_10_tready,
    input [S_AXIS_BRAM_10_ADDR_WIDTH-1:0] ap_bram_10_addr0,
    input [S_AXIS_BRAM_10_WIDTH-1:0] ap_bram_10_din0,
    output [S_AXIS_BRAM_10_WIDTH-1:0] ap_bram_10_dout0,
    input [S_AXIS_BRAM_10_WIDTH/8-1:0] ap_bram_10_we0,
    input ap_bram_10_en0,
    input [S_AXIS_BRAM_10_ADDR_WIDTH-1:0] ap_bram_10_addr1,
    input [S_AXIS_BRAM_10_WIDTH-1:0] ap_bram_10_din1,
    output [S_AXIS_BRAM_10_WIDTH-1:0] ap_bram_10_dout1,
    input [S_AXIS_BRAM_10_WIDTH/8-1:0] ap_bram_10_we1,
    input ap_bram_10_en1,
    //input AXI-Stream to FIFO interface 11
    input s_axis_bram_11_aclk,
    input s_axis_bram_11_aresetn,
    input s_axis_bram_11_tlast,
    input s_axis_bram_11_tvalid,
    input [S_AXIS_BRAM_11_DMWIDTH/8-1:0] s_axis_bram_11_tkeep,
    input [S_AXIS_BRAM_11_DMWIDTH/8-1:0] s_axis_bram_11_tstrb,
    input [S_AXIS_BRAM_11_DMWIDTH-1:0] s_axis_bram_11_tdata,
    output s_axis_bram_11_tready,
    input [S_AXIS_BRAM_11_ADDR_WIDTH-1:0] ap_bram_11_addr0,
    input [S_AXIS_BRAM_11_WIDTH-1:0] ap_bram_11_din0,
    output [S_AXIS_BRAM_11_WIDTH-1:0] ap_bram_11_dout0,
    input [S_AXIS_BRAM_11_WIDTH/8-1:0] ap_bram_11_we0,
    input ap_bram_11_en0,
    input [S_AXIS_BRAM_11_ADDR_WIDTH-1:0] ap_bram_11_addr1,
    input [S_AXIS_BRAM_11_WIDTH-1:0] ap_bram_11_din1,
    output [S_AXIS_BRAM_11_WIDTH-1:0] ap_bram_11_dout1,
    input [S_AXIS_BRAM_11_WIDTH/8-1:0] ap_bram_11_we1,
    input ap_bram_11_en1,
    //input AXI-Stream to FIFO interface 12
    input s_axis_bram_12_aclk,
    input s_axis_bram_12_aresetn,
    input s_axis_bram_12_tlast,
    input s_axis_bram_12_tvalid,
    input [S_AXIS_BRAM_12_DMWIDTH/8-1:0] s_axis_bram_12_tkeep,
    input [S_AXIS_BRAM_12_DMWIDTH/8-1:0] s_axis_bram_12_tstrb,
    input [S_AXIS_BRAM_12_DMWIDTH-1:0] s_axis_bram_12_tdata,
    output s_axis_bram_12_tready,
    input [S_AXIS_BRAM_12_ADDR_WIDTH-1:0] ap_bram_12_addr0,
    input [S_AXIS_BRAM_12_WIDTH-1:0] ap_bram_12_din0,
    output [S_AXIS_BRAM_12_WIDTH-1:0] ap_bram_12_dout0,
    input [S_AXIS_BRAM_12_WIDTH/8-1:0] ap_bram_12_we0,
    input ap_bram_12_en0,
    input [S_AXIS_BRAM_12_ADDR_WIDTH-1:0] ap_bram_12_addr1,
    input [S_AXIS_BRAM_12_WIDTH-1:0] ap_bram_12_din1,
    output [S_AXIS_BRAM_12_WIDTH-1:0] ap_bram_12_dout1,
    input [S_AXIS_BRAM_12_WIDTH/8-1:0] ap_bram_12_we1,
    input ap_bram_12_en1,
    //input AXI-Stream to FIFO interface 13
    input s_axis_bram_13_aclk,
    input s_axis_bram_13_aresetn,
    input s_axis_bram_13_tlast,
    input s_axis_bram_13_tvalid,
    input [S_AXIS_BRAM_13_DMWIDTH/8-1:0] s_axis_bram_13_tkeep,
    input [S_AXIS_BRAM_13_DMWIDTH/8-1:0] s_axis_bram_13_tstrb,
    input [S_AXIS_BRAM_13_DMWIDTH-1:0] s_axis_bram_13_tdata,
    output s_axis_bram_13_tready,
    input [S_AXIS_BRAM_13_ADDR_WIDTH-1:0] ap_bram_13_addr0,
    input [S_AXIS_BRAM_13_WIDTH-1:0] ap_bram_13_din0,
    output [S_AXIS_BRAM_13_WIDTH-1:0] ap_bram_13_dout0,
    input [S_AXIS_BRAM_13_WIDTH/8-1:0] ap_bram_13_we0,
    input ap_bram_13_en0,
    input [S_AXIS_BRAM_13_ADDR_WIDTH-1:0] ap_bram_13_addr1,
    input [S_AXIS_BRAM_13_WIDTH-1:0] ap_bram_13_din1,
    output [S_AXIS_BRAM_13_WIDTH-1:0] ap_bram_13_dout1,
    input [S_AXIS_BRAM_13_WIDTH/8-1:0] ap_bram_13_we1,
    input ap_bram_13_en1,
    //input AXI-Stream to FIFO interface 14
    input s_axis_bram_14_aclk,
    input s_axis_bram_14_aresetn,
    input s_axis_bram_14_tlast,
    input s_axis_bram_14_tvalid,
    input [S_AXIS_BRAM_14_DMWIDTH/8-1:0] s_axis_bram_14_tkeep,
    input [S_AXIS_BRAM_14_DMWIDTH/8-1:0] s_axis_bram_14_tstrb,
    input [S_AXIS_BRAM_14_DMWIDTH-1:0] s_axis_bram_14_tdata,
    output s_axis_bram_14_tready,
    input [S_AXIS_BRAM_14_ADDR_WIDTH-1:0] ap_bram_14_addr0,
    input [S_AXIS_BRAM_14_WIDTH-1:0] ap_bram_14_din0,
    output [S_AXIS_BRAM_14_WIDTH-1:0] ap_bram_14_dout0,
    input [S_AXIS_BRAM_14_WIDTH/8-1:0] ap_bram_14_we0,
    input ap_bram_14_en0,
    input [S_AXIS_BRAM_14_ADDR_WIDTH-1:0] ap_bram_14_addr1,
    input [S_AXIS_BRAM_14_WIDTH-1:0] ap_bram_14_din1,
    output [S_AXIS_BRAM_14_WIDTH-1:0] ap_bram_14_dout1,
    input [S_AXIS_BRAM_14_WIDTH/8-1:0] ap_bram_14_we1,
    input ap_bram_14_en1,
    //input AXI-Stream to FIFO interface 15
    input s_axis_bram_15_aclk,
    input s_axis_bram_15_aresetn,
    input s_axis_bram_15_tlast,
    input s_axis_bram_15_tvalid,
    input [S_AXIS_BRAM_15_DMWIDTH/8-1:0] s_axis_bram_15_tkeep,
    input [S_AXIS_BRAM_15_DMWIDTH/8-1:0] s_axis_bram_15_tstrb,
    input [S_AXIS_BRAM_15_DMWIDTH-1:0] s_axis_bram_15_tdata,
    output s_axis_bram_15_tready,
    input [S_AXIS_BRAM_15_ADDR_WIDTH-1:0] ap_bram_15_addr0,
    input [S_AXIS_BRAM_15_WIDTH-1:0] ap_bram_15_din0,
    output [S_AXIS_BRAM_15_WIDTH-1:0] ap_bram_15_dout0,
    input [S_AXIS_BRAM_15_WIDTH/8-1:0] ap_bram_15_we0,
    input ap_bram_15_en0,
    input [S_AXIS_BRAM_15_ADDR_WIDTH-1:0] ap_bram_15_addr1,
    input [S_AXIS_BRAM_15_WIDTH-1:0] ap_bram_15_din1,
    output [S_AXIS_BRAM_15_WIDTH-1:0] ap_bram_15_dout1,
    input [S_AXIS_BRAM_15_WIDTH/8-1:0] ap_bram_15_we1,
    input ap_bram_15_en1,
    //input AXI-Stream to FIFO interface 16
    input s_axis_bram_16_aclk,
    input s_axis_bram_16_aresetn,
    input s_axis_bram_16_tlast,
    input s_axis_bram_16_tvalid,
    input [S_AXIS_BRAM_16_DMWIDTH/8-1:0] s_axis_bram_16_tkeep,
    input [S_AXIS_BRAM_16_DMWIDTH/8-1:0] s_axis_bram_16_tstrb,
    input [S_AXIS_BRAM_16_DMWIDTH-1:0] s_axis_bram_16_tdata,
    output s_axis_bram_16_tready,
    input [S_AXIS_BRAM_16_ADDR_WIDTH-1:0] ap_bram_16_addr0,
    input [S_AXIS_BRAM_16_WIDTH-1:0] ap_bram_16_din0,
    output [S_AXIS_BRAM_16_WIDTH-1:0] ap_bram_16_dout0,
    input [S_AXIS_BRAM_16_WIDTH/8-1:0] ap_bram_16_we0,
    input ap_bram_16_en0,
    input [S_AXIS_BRAM_16_ADDR_WIDTH-1:0] ap_bram_16_addr1,
    input [S_AXIS_BRAM_16_WIDTH-1:0] ap_bram_16_din1,
    output [S_AXIS_BRAM_16_WIDTH-1:0] ap_bram_16_dout1,
    input [S_AXIS_BRAM_16_WIDTH/8-1:0] ap_bram_16_we1,
    input ap_bram_16_en1,
    //input AXI-Stream to FIFO interface 17
    input s_axis_bram_17_aclk,
    input s_axis_bram_17_aresetn,
    input s_axis_bram_17_tlast,
    input s_axis_bram_17_tvalid,
    input [S_AXIS_BRAM_17_DMWIDTH/8-1:0] s_axis_bram_17_tkeep,
    input [S_AXIS_BRAM_17_DMWIDTH/8-1:0] s_axis_bram_17_tstrb,
    input [S_AXIS_BRAM_17_DMWIDTH-1:0] s_axis_bram_17_tdata,
    output s_axis_bram_17_tready,
    input [S_AXIS_BRAM_17_ADDR_WIDTH-1:0] ap_bram_17_addr0,
    input [S_AXIS_BRAM_17_WIDTH-1:0] ap_bram_17_din0,
    output [S_AXIS_BRAM_17_WIDTH-1:0] ap_bram_17_dout0,
    input [S_AXIS_BRAM_17_WIDTH/8-1:0] ap_bram_17_we0,
    input ap_bram_17_en0,
    input [S_AXIS_BRAM_17_ADDR_WIDTH-1:0] ap_bram_17_addr1,
    input [S_AXIS_BRAM_17_WIDTH-1:0] ap_bram_17_din1,
    output [S_AXIS_BRAM_17_WIDTH-1:0] ap_bram_17_dout1,
    input [S_AXIS_BRAM_17_WIDTH/8-1:0] ap_bram_17_we1,
    input ap_bram_17_en1,
    //input AXI-Stream to FIFO interface 18
    input s_axis_bram_18_aclk,
    input s_axis_bram_18_aresetn,
    input s_axis_bram_18_tlast,
    input s_axis_bram_18_tvalid,
    input [S_AXIS_BRAM_18_DMWIDTH/8-1:0] s_axis_bram_18_tkeep,
    input [S_AXIS_BRAM_18_DMWIDTH/8-1:0] s_axis_bram_18_tstrb,
    input [S_AXIS_BRAM_18_DMWIDTH-1:0] s_axis_bram_18_tdata,
    output s_axis_bram_18_tready,
    input [S_AXIS_BRAM_18_ADDR_WIDTH-1:0] ap_bram_18_addr0,
    input [S_AXIS_BRAM_18_WIDTH-1:0] ap_bram_18_din0,
    output [S_AXIS_BRAM_18_WIDTH-1:0] ap_bram_18_dout0,
    input [S_AXIS_BRAM_18_WIDTH/8-1:0] ap_bram_18_we0,
    input ap_bram_18_en0,
    input [S_AXIS_BRAM_18_ADDR_WIDTH-1:0] ap_bram_18_addr1,
    input [S_AXIS_BRAM_18_WIDTH-1:0] ap_bram_18_din1,
    output [S_AXIS_BRAM_18_WIDTH-1:0] ap_bram_18_dout1,
    input [S_AXIS_BRAM_18_WIDTH/8-1:0] ap_bram_18_we1,
    input ap_bram_18_en1,
    //input AXI-Stream to FIFO interface 19
    input s_axis_bram_19_aclk,
    input s_axis_bram_19_aresetn,
    input s_axis_bram_19_tlast,
    input s_axis_bram_19_tvalid,
    input [S_AXIS_BRAM_19_DMWIDTH/8-1:0] s_axis_bram_19_tkeep,
    input [S_AXIS_BRAM_19_DMWIDTH/8-1:0] s_axis_bram_19_tstrb,
    input [S_AXIS_BRAM_19_DMWIDTH-1:0] s_axis_bram_19_tdata,
    output s_axis_bram_19_tready,
    input [S_AXIS_BRAM_19_ADDR_WIDTH-1:0] ap_bram_19_addr0,
    input [S_AXIS_BRAM_19_WIDTH-1:0] ap_bram_19_din0,
    output [S_AXIS_BRAM_19_WIDTH-1:0] ap_bram_19_dout0,
    input [S_AXIS_BRAM_19_WIDTH/8-1:0] ap_bram_19_we0,
    input ap_bram_19_en0,
    input [S_AXIS_BRAM_19_ADDR_WIDTH-1:0] ap_bram_19_addr1,
    input [S_AXIS_BRAM_19_WIDTH-1:0] ap_bram_19_din1,
    output [S_AXIS_BRAM_19_WIDTH-1:0] ap_bram_19_dout1,
    input [S_AXIS_BRAM_19_WIDTH/8-1:0] ap_bram_19_we1,
    input ap_bram_19_en1,
    //input AXI-Stream to FIFO interface 20
    input s_axis_bram_20_aclk,
    input s_axis_bram_20_aresetn,
    input s_axis_bram_20_tlast,
    input s_axis_bram_20_tvalid,
    input [S_AXIS_BRAM_20_DMWIDTH/8-1:0] s_axis_bram_20_tkeep,
    input [S_AXIS_BRAM_20_DMWIDTH/8-1:0] s_axis_bram_20_tstrb,
    input [S_AXIS_BRAM_20_DMWIDTH-1:0] s_axis_bram_20_tdata,
    output s_axis_bram_20_tready,
    input [S_AXIS_BRAM_20_ADDR_WIDTH-1:0] ap_bram_20_addr0,
    input [S_AXIS_BRAM_20_WIDTH-1:0] ap_bram_20_din0,
    output [S_AXIS_BRAM_20_WIDTH-1:0] ap_bram_20_dout0,
    input [S_AXIS_BRAM_20_WIDTH/8-1:0] ap_bram_20_we0,
    input ap_bram_20_en0,
    input [S_AXIS_BRAM_20_ADDR_WIDTH-1:0] ap_bram_20_addr1,
    input [S_AXIS_BRAM_20_WIDTH-1:0] ap_bram_20_din1,
    output [S_AXIS_BRAM_20_WIDTH-1:0] ap_bram_20_dout1,
    input [S_AXIS_BRAM_20_WIDTH/8-1:0] ap_bram_20_we1,
    input ap_bram_20_en1,
    //input AXI-Stream to FIFO interface 21
    input s_axis_bram_21_aclk,
    input s_axis_bram_21_aresetn,
    input s_axis_bram_21_tlast,
    input s_axis_bram_21_tvalid,
    input [S_AXIS_BRAM_21_DMWIDTH/8-1:0] s_axis_bram_21_tkeep,
    input [S_AXIS_BRAM_21_DMWIDTH/8-1:0] s_axis_bram_21_tstrb,
    input [S_AXIS_BRAM_21_DMWIDTH-1:0] s_axis_bram_21_tdata,
    output s_axis_bram_21_tready,
    input [S_AXIS_BRAM_21_ADDR_WIDTH-1:0] ap_bram_21_addr0,
    input [S_AXIS_BRAM_21_WIDTH-1:0] ap_bram_21_din0,
    output [S_AXIS_BRAM_21_WIDTH-1:0] ap_bram_21_dout0,
    input [S_AXIS_BRAM_21_WIDTH/8-1:0] ap_bram_21_we0,
    input ap_bram_21_en0,
    input [S_AXIS_BRAM_21_ADDR_WIDTH-1:0] ap_bram_21_addr1,
    input [S_AXIS_BRAM_21_WIDTH-1:0] ap_bram_21_din1,
    output [S_AXIS_BRAM_21_WIDTH-1:0] ap_bram_21_dout1,
    input [S_AXIS_BRAM_21_WIDTH/8-1:0] ap_bram_21_we1,
    input ap_bram_21_en1,
    //input AXI-Stream to FIFO interface 22
    input s_axis_bram_22_aclk,
    input s_axis_bram_22_aresetn,
    input s_axis_bram_22_tlast,
    input s_axis_bram_22_tvalid,
    input [S_AXIS_BRAM_22_DMWIDTH/8-1:0] s_axis_bram_22_tkeep,
    input [S_AXIS_BRAM_22_DMWIDTH/8-1:0] s_axis_bram_22_tstrb,
    input [S_AXIS_BRAM_22_DMWIDTH-1:0] s_axis_bram_22_tdata,
    output s_axis_bram_22_tready,
    input [S_AXIS_BRAM_22_ADDR_WIDTH-1:0] ap_bram_22_addr0,
    input [S_AXIS_BRAM_22_WIDTH-1:0] ap_bram_22_din0,
    output [S_AXIS_BRAM_22_WIDTH-1:0] ap_bram_22_dout0,
    input [S_AXIS_BRAM_22_WIDTH/8-1:0] ap_bram_22_we0,
    input ap_bram_22_en0,
    input [S_AXIS_BRAM_22_ADDR_WIDTH-1:0] ap_bram_22_addr1,
    input [S_AXIS_BRAM_22_WIDTH-1:0] ap_bram_22_din1,
    output [S_AXIS_BRAM_22_WIDTH-1:0] ap_bram_22_dout1,
    input [S_AXIS_BRAM_22_WIDTH/8-1:0] ap_bram_22_we1,
    input ap_bram_22_en1,
    //input AXI-Stream to FIFO interface 23
    input s_axis_bram_23_aclk,
    input s_axis_bram_23_aresetn,
    input s_axis_bram_23_tlast,
    input s_axis_bram_23_tvalid,
    input [S_AXIS_BRAM_23_DMWIDTH/8-1:0] s_axis_bram_23_tkeep,
    input [S_AXIS_BRAM_23_DMWIDTH/8-1:0] s_axis_bram_23_tstrb,
    input [S_AXIS_BRAM_23_DMWIDTH-1:0] s_axis_bram_23_tdata,
    output s_axis_bram_23_tready,
    input [S_AXIS_BRAM_23_ADDR_WIDTH-1:0] ap_bram_23_addr0,
    input [S_AXIS_BRAM_23_WIDTH-1:0] ap_bram_23_din0,
    output [S_AXIS_BRAM_23_WIDTH-1:0] ap_bram_23_dout0,
    input [S_AXIS_BRAM_23_WIDTH/8-1:0] ap_bram_23_we0,
    input ap_bram_23_en0,
    input [S_AXIS_BRAM_23_ADDR_WIDTH-1:0] ap_bram_23_addr1,
    input [S_AXIS_BRAM_23_WIDTH-1:0] ap_bram_23_din1,
    output [S_AXIS_BRAM_23_WIDTH-1:0] ap_bram_23_dout1,
    input [S_AXIS_BRAM_23_WIDTH/8-1:0] ap_bram_23_we1,
    input ap_bram_23_en1,
    //input AXI-Stream to FIFO interface 24
    input s_axis_bram_24_aclk,
    input s_axis_bram_24_aresetn,
    input s_axis_bram_24_tlast,
    input s_axis_bram_24_tvalid,
    input [S_AXIS_BRAM_24_DMWIDTH/8-1:0] s_axis_bram_24_tkeep,
    input [S_AXIS_BRAM_24_DMWIDTH/8-1:0] s_axis_bram_24_tstrb,
    input [S_AXIS_BRAM_24_DMWIDTH-1:0] s_axis_bram_24_tdata,
    output s_axis_bram_24_tready,
    input [S_AXIS_BRAM_24_ADDR_WIDTH-1:0] ap_bram_24_addr0,
    input [S_AXIS_BRAM_24_WIDTH-1:0] ap_bram_24_din0,
    output [S_AXIS_BRAM_24_WIDTH-1:0] ap_bram_24_dout0,
    input [S_AXIS_BRAM_24_WIDTH/8-1:0] ap_bram_24_we0,
    input ap_bram_24_en0,
    input [S_AXIS_BRAM_24_ADDR_WIDTH-1:0] ap_bram_24_addr1,
    input [S_AXIS_BRAM_24_WIDTH-1:0] ap_bram_24_din1,
    output [S_AXIS_BRAM_24_WIDTH-1:0] ap_bram_24_dout1,
    input [S_AXIS_BRAM_24_WIDTH/8-1:0] ap_bram_24_we1,
    input ap_bram_24_en1,
    //input AXI-Stream to FIFO interface 25
    input s_axis_bram_25_aclk,
    input s_axis_bram_25_aresetn,
    input s_axis_bram_25_tlast,
    input s_axis_bram_25_tvalid,
    input [S_AXIS_BRAM_25_DMWIDTH/8-1:0] s_axis_bram_25_tkeep,
    input [S_AXIS_BRAM_25_DMWIDTH/8-1:0] s_axis_bram_25_tstrb,
    input [S_AXIS_BRAM_25_DMWIDTH-1:0] s_axis_bram_25_tdata,
    output s_axis_bram_25_tready,
    input [S_AXIS_BRAM_25_ADDR_WIDTH-1:0] ap_bram_25_addr0,
    input [S_AXIS_BRAM_25_WIDTH-1:0] ap_bram_25_din0,
    output [S_AXIS_BRAM_25_WIDTH-1:0] ap_bram_25_dout0,
    input [S_AXIS_BRAM_25_WIDTH/8-1:0] ap_bram_25_we0,
    input ap_bram_25_en0,
    input [S_AXIS_BRAM_25_ADDR_WIDTH-1:0] ap_bram_25_addr1,
    input [S_AXIS_BRAM_25_WIDTH-1:0] ap_bram_25_din1,
    output [S_AXIS_BRAM_25_WIDTH-1:0] ap_bram_25_dout1,
    input [S_AXIS_BRAM_25_WIDTH/8-1:0] ap_bram_25_we1,
    input ap_bram_25_en1,
    //input AXI-Stream to FIFO interface 26
    input s_axis_bram_26_aclk,
    input s_axis_bram_26_aresetn,
    input s_axis_bram_26_tlast,
    input s_axis_bram_26_tvalid,
    input [S_AXIS_BRAM_26_DMWIDTH/8-1:0] s_axis_bram_26_tkeep,
    input [S_AXIS_BRAM_26_DMWIDTH/8-1:0] s_axis_bram_26_tstrb,
    input [S_AXIS_BRAM_26_DMWIDTH-1:0] s_axis_bram_26_tdata,
    output s_axis_bram_26_tready,
    input [S_AXIS_BRAM_26_ADDR_WIDTH-1:0] ap_bram_26_addr0,
    input [S_AXIS_BRAM_26_WIDTH-1:0] ap_bram_26_din0,
    output [S_AXIS_BRAM_26_WIDTH-1:0] ap_bram_26_dout0,
    input [S_AXIS_BRAM_26_WIDTH/8-1:0] ap_bram_26_we0,
    input ap_bram_26_en0,
    input [S_AXIS_BRAM_26_ADDR_WIDTH-1:0] ap_bram_26_addr1,
    input [S_AXIS_BRAM_26_WIDTH-1:0] ap_bram_26_din1,
    output [S_AXIS_BRAM_26_WIDTH-1:0] ap_bram_26_dout1,
    input [S_AXIS_BRAM_26_WIDTH/8-1:0] ap_bram_26_we1,
    input ap_bram_26_en1,
    //input AXI-Stream to FIFO interface 27
    input s_axis_bram_27_aclk,
    input s_axis_bram_27_aresetn,
    input s_axis_bram_27_tlast,
    input s_axis_bram_27_tvalid,
    input [S_AXIS_BRAM_27_DMWIDTH/8-1:0] s_axis_bram_27_tkeep,
    input [S_AXIS_BRAM_27_DMWIDTH/8-1:0] s_axis_bram_27_tstrb,
    input [S_AXIS_BRAM_27_DMWIDTH-1:0] s_axis_bram_27_tdata,
    output s_axis_bram_27_tready,
    input [S_AXIS_BRAM_27_ADDR_WIDTH-1:0] ap_bram_27_addr0,
    input [S_AXIS_BRAM_27_WIDTH-1:0] ap_bram_27_din0,
    output [S_AXIS_BRAM_27_WIDTH-1:0] ap_bram_27_dout0,
    input [S_AXIS_BRAM_27_WIDTH/8-1:0] ap_bram_27_we0,
    input ap_bram_27_en0,
    input [S_AXIS_BRAM_27_ADDR_WIDTH-1:0] ap_bram_27_addr1,
    input [S_AXIS_BRAM_27_WIDTH-1:0] ap_bram_27_din1,
    output [S_AXIS_BRAM_27_WIDTH-1:0] ap_bram_27_dout1,
    input [S_AXIS_BRAM_27_WIDTH/8-1:0] ap_bram_27_we1,
    input ap_bram_27_en1,
    //input AXI-Stream to FIFO interface 28
    input s_axis_bram_28_aclk,
    input s_axis_bram_28_aresetn,
    input s_axis_bram_28_tlast,
    input s_axis_bram_28_tvalid,
    input [S_AXIS_BRAM_28_DMWIDTH/8-1:0] s_axis_bram_28_tkeep,
    input [S_AXIS_BRAM_28_DMWIDTH/8-1:0] s_axis_bram_28_tstrb,
    input [S_AXIS_BRAM_28_DMWIDTH-1:0] s_axis_bram_28_tdata,
    output s_axis_bram_28_tready,
    input [S_AXIS_BRAM_28_ADDR_WIDTH-1:0] ap_bram_28_addr0,
    input [S_AXIS_BRAM_28_WIDTH-1:0] ap_bram_28_din0,
    output [S_AXIS_BRAM_28_WIDTH-1:0] ap_bram_28_dout0,
    input [S_AXIS_BRAM_28_WIDTH/8-1:0] ap_bram_28_we0,
    input ap_bram_28_en0,
    input [S_AXIS_BRAM_28_ADDR_WIDTH-1:0] ap_bram_28_addr1,
    input [S_AXIS_BRAM_28_WIDTH-1:0] ap_bram_28_din1,
    output [S_AXIS_BRAM_28_WIDTH-1:0] ap_bram_28_dout1,
    input [S_AXIS_BRAM_28_WIDTH/8-1:0] ap_bram_28_we1,
    input ap_bram_28_en1,
    //input AXI-Stream to FIFO interface 29
    input s_axis_bram_29_aclk,
    input s_axis_bram_29_aresetn,
    input s_axis_bram_29_tlast,
    input s_axis_bram_29_tvalid,
    input [S_AXIS_BRAM_29_DMWIDTH/8-1:0] s_axis_bram_29_tkeep,
    input [S_AXIS_BRAM_29_DMWIDTH/8-1:0] s_axis_bram_29_tstrb,
    input [S_AXIS_BRAM_29_DMWIDTH-1:0] s_axis_bram_29_tdata,
    output s_axis_bram_29_tready,
    input [S_AXIS_BRAM_29_ADDR_WIDTH-1:0] ap_bram_29_addr0,
    input [S_AXIS_BRAM_29_WIDTH-1:0] ap_bram_29_din0,
    output [S_AXIS_BRAM_29_WIDTH-1:0] ap_bram_29_dout0,
    input [S_AXIS_BRAM_29_WIDTH/8-1:0] ap_bram_29_we0,
    input ap_bram_29_en0,
    input [S_AXIS_BRAM_29_ADDR_WIDTH-1:0] ap_bram_29_addr1,
    input [S_AXIS_BRAM_29_WIDTH-1:0] ap_bram_29_din1,
    output [S_AXIS_BRAM_29_WIDTH-1:0] ap_bram_29_dout1,
    input [S_AXIS_BRAM_29_WIDTH/8-1:0] ap_bram_29_we1,
    input ap_bram_29_en1,
    //input AXI-Stream to FIFO interface 30
    input s_axis_bram_30_aclk,
    input s_axis_bram_30_aresetn,
    input s_axis_bram_30_tlast,
    input s_axis_bram_30_tvalid,
    input [S_AXIS_BRAM_30_DMWIDTH/8-1:0] s_axis_bram_30_tkeep,
    input [S_AXIS_BRAM_30_DMWIDTH/8-1:0] s_axis_bram_30_tstrb,
    input [S_AXIS_BRAM_30_DMWIDTH-1:0] s_axis_bram_30_tdata,
    output s_axis_bram_30_tready,
    input [S_AXIS_BRAM_30_ADDR_WIDTH-1:0] ap_bram_30_addr0,
    input [S_AXIS_BRAM_30_WIDTH-1:0] ap_bram_30_din0,
    output [S_AXIS_BRAM_30_WIDTH-1:0] ap_bram_30_dout0,
    input [S_AXIS_BRAM_30_WIDTH/8-1:0] ap_bram_30_we0,
    input ap_bram_30_en0,
    input [S_AXIS_BRAM_30_ADDR_WIDTH-1:0] ap_bram_30_addr1,
    input [S_AXIS_BRAM_30_WIDTH-1:0] ap_bram_30_din1,
    output [S_AXIS_BRAM_30_WIDTH-1:0] ap_bram_30_dout1,
    input [S_AXIS_BRAM_30_WIDTH/8-1:0] ap_bram_30_we1,
    input ap_bram_30_en1,
    //input AXI-Stream to FIFO interface 31
    input s_axis_bram_31_aclk,
    input s_axis_bram_31_aresetn,
    input s_axis_bram_31_tlast,
    input s_axis_bram_31_tvalid,
    input [S_AXIS_BRAM_31_DMWIDTH/8-1:0] s_axis_bram_31_tkeep,
    input [S_AXIS_BRAM_31_DMWIDTH/8-1:0] s_axis_bram_31_tstrb,
    input [S_AXIS_BRAM_31_DMWIDTH-1:0] s_axis_bram_31_tdata,
    output s_axis_bram_31_tready,
    input [S_AXIS_BRAM_31_ADDR_WIDTH-1:0] ap_bram_31_addr0,
    input [S_AXIS_BRAM_31_WIDTH-1:0] ap_bram_31_din0,
    output [S_AXIS_BRAM_31_WIDTH-1:0] ap_bram_31_dout0,
    input [S_AXIS_BRAM_31_WIDTH/8-1:0] ap_bram_31_we0,
    input ap_bram_31_en0,
    input [S_AXIS_BRAM_31_ADDR_WIDTH-1:0] ap_bram_31_addr1,
    input [S_AXIS_BRAM_31_WIDTH-1:0] ap_bram_31_din1,
    output [S_AXIS_BRAM_31_WIDTH-1:0] ap_bram_31_dout1,
    input [S_AXIS_BRAM_31_WIDTH/8-1:0] ap_bram_31_we1,
    input ap_bram_31_en1,
    //input AXI-Stream to FIFO interface 32
    input s_axis_bram_32_aclk,
    input s_axis_bram_32_aresetn,
    input s_axis_bram_32_tlast,
    input s_axis_bram_32_tvalid,
    input [S_AXIS_BRAM_32_DMWIDTH/8-1:0] s_axis_bram_32_tkeep,
    input [S_AXIS_BRAM_32_DMWIDTH/8-1:0] s_axis_bram_32_tstrb,
    input [S_AXIS_BRAM_32_DMWIDTH-1:0] s_axis_bram_32_tdata,
    output s_axis_bram_32_tready,
    input [S_AXIS_BRAM_32_ADDR_WIDTH-1:0] ap_bram_32_addr0,
    input [S_AXIS_BRAM_32_WIDTH-1:0] ap_bram_32_din0,
    output [S_AXIS_BRAM_32_WIDTH-1:0] ap_bram_32_dout0,
    input [S_AXIS_BRAM_32_WIDTH/8-1:0] ap_bram_32_we0,
    input ap_bram_32_en0,
    input [S_AXIS_BRAM_32_ADDR_WIDTH-1:0] ap_bram_32_addr1,
    input [S_AXIS_BRAM_32_WIDTH-1:0] ap_bram_32_din1,
    output [S_AXIS_BRAM_32_WIDTH-1:0] ap_bram_32_dout1,
    input [S_AXIS_BRAM_32_WIDTH/8-1:0] ap_bram_32_we1,
    input ap_bram_32_en1,
    //input AXI-Stream to FIFO interface 33
    input s_axis_bram_33_aclk,
    input s_axis_bram_33_aresetn,
    input s_axis_bram_33_tlast,
    input s_axis_bram_33_tvalid,
    input [S_AXIS_BRAM_33_DMWIDTH/8-1:0] s_axis_bram_33_tkeep,
    input [S_AXIS_BRAM_33_DMWIDTH/8-1:0] s_axis_bram_33_tstrb,
    input [S_AXIS_BRAM_33_DMWIDTH-1:0] s_axis_bram_33_tdata,
    output s_axis_bram_33_tready,
    input [S_AXIS_BRAM_33_ADDR_WIDTH-1:0] ap_bram_33_addr0,
    input [S_AXIS_BRAM_33_WIDTH-1:0] ap_bram_33_din0,
    output [S_AXIS_BRAM_33_WIDTH-1:0] ap_bram_33_dout0,
    input [S_AXIS_BRAM_33_WIDTH/8-1:0] ap_bram_33_we0,
    input ap_bram_33_en0,
    input [S_AXIS_BRAM_33_ADDR_WIDTH-1:0] ap_bram_33_addr1,
    input [S_AXIS_BRAM_33_WIDTH-1:0] ap_bram_33_din1,
    output [S_AXIS_BRAM_33_WIDTH-1:0] ap_bram_33_dout1,
    input [S_AXIS_BRAM_33_WIDTH/8-1:0] ap_bram_33_we1,
    input ap_bram_33_en1,
    //input AXI-Stream to FIFO interface 34
    input s_axis_bram_34_aclk,
    input s_axis_bram_34_aresetn,
    input s_axis_bram_34_tlast,
    input s_axis_bram_34_tvalid,
    input [S_AXIS_BRAM_34_DMWIDTH/8-1:0] s_axis_bram_34_tkeep,
    input [S_AXIS_BRAM_34_DMWIDTH/8-1:0] s_axis_bram_34_tstrb,
    input [S_AXIS_BRAM_34_DMWIDTH-1:0] s_axis_bram_34_tdata,
    output s_axis_bram_34_tready,
    input [S_AXIS_BRAM_34_ADDR_WIDTH-1:0] ap_bram_34_addr0,
    input [S_AXIS_BRAM_34_WIDTH-1:0] ap_bram_34_din0,
    output [S_AXIS_BRAM_34_WIDTH-1:0] ap_bram_34_dout0,
    input [S_AXIS_BRAM_34_WIDTH/8-1:0] ap_bram_34_we0,
    input ap_bram_34_en0,
    input [S_AXIS_BRAM_34_ADDR_WIDTH-1:0] ap_bram_34_addr1,
    input [S_AXIS_BRAM_34_WIDTH-1:0] ap_bram_34_din1,
    output [S_AXIS_BRAM_34_WIDTH-1:0] ap_bram_34_dout1,
    input [S_AXIS_BRAM_34_WIDTH/8-1:0] ap_bram_34_we1,
    input ap_bram_34_en1,
    //input AXI-Stream to FIFO interface 35
    input s_axis_bram_35_aclk,
    input s_axis_bram_35_aresetn,
    input s_axis_bram_35_tlast,
    input s_axis_bram_35_tvalid,
    input [S_AXIS_BRAM_35_DMWIDTH/8-1:0] s_axis_bram_35_tkeep,
    input [S_AXIS_BRAM_35_DMWIDTH/8-1:0] s_axis_bram_35_tstrb,
    input [S_AXIS_BRAM_35_DMWIDTH-1:0] s_axis_bram_35_tdata,
    output s_axis_bram_35_tready,
    input [S_AXIS_BRAM_35_ADDR_WIDTH-1:0] ap_bram_35_addr0,
    input [S_AXIS_BRAM_35_WIDTH-1:0] ap_bram_35_din0,
    output [S_AXIS_BRAM_35_WIDTH-1:0] ap_bram_35_dout0,
    input [S_AXIS_BRAM_35_WIDTH/8-1:0] ap_bram_35_we0,
    input ap_bram_35_en0,
    input [S_AXIS_BRAM_35_ADDR_WIDTH-1:0] ap_bram_35_addr1,
    input [S_AXIS_BRAM_35_WIDTH-1:0] ap_bram_35_din1,
    output [S_AXIS_BRAM_35_WIDTH-1:0] ap_bram_35_dout1,
    input [S_AXIS_BRAM_35_WIDTH/8-1:0] ap_bram_35_we1,
    input ap_bram_35_en1,
    //input AXI-Stream to FIFO interface 36
    input s_axis_bram_36_aclk,
    input s_axis_bram_36_aresetn,
    input s_axis_bram_36_tlast,
    input s_axis_bram_36_tvalid,
    input [S_AXIS_BRAM_36_DMWIDTH/8-1:0] s_axis_bram_36_tkeep,
    input [S_AXIS_BRAM_36_DMWIDTH/8-1:0] s_axis_bram_36_tstrb,
    input [S_AXIS_BRAM_36_DMWIDTH-1:0] s_axis_bram_36_tdata,
    output s_axis_bram_36_tready,
    input [S_AXIS_BRAM_36_ADDR_WIDTH-1:0] ap_bram_36_addr0,
    input [S_AXIS_BRAM_36_WIDTH-1:0] ap_bram_36_din0,
    output [S_AXIS_BRAM_36_WIDTH-1:0] ap_bram_36_dout0,
    input [S_AXIS_BRAM_36_WIDTH/8-1:0] ap_bram_36_we0,
    input ap_bram_36_en0,
    input [S_AXIS_BRAM_36_ADDR_WIDTH-1:0] ap_bram_36_addr1,
    input [S_AXIS_BRAM_36_WIDTH-1:0] ap_bram_36_din1,
    output [S_AXIS_BRAM_36_WIDTH-1:0] ap_bram_36_dout1,
    input [S_AXIS_BRAM_36_WIDTH/8-1:0] ap_bram_36_we1,
    input ap_bram_36_en1,
    //input AXI-Stream to FIFO interface 37
    input s_axis_bram_37_aclk,
    input s_axis_bram_37_aresetn,
    input s_axis_bram_37_tlast,
    input s_axis_bram_37_tvalid,
    input [S_AXIS_BRAM_37_DMWIDTH/8-1:0] s_axis_bram_37_tkeep,
    input [S_AXIS_BRAM_37_DMWIDTH/8-1:0] s_axis_bram_37_tstrb,
    input [S_AXIS_BRAM_37_DMWIDTH-1:0] s_axis_bram_37_tdata,
    output s_axis_bram_37_tready,
    input [S_AXIS_BRAM_37_ADDR_WIDTH-1:0] ap_bram_37_addr0,
    input [S_AXIS_BRAM_37_WIDTH-1:0] ap_bram_37_din0,
    output [S_AXIS_BRAM_37_WIDTH-1:0] ap_bram_37_dout0,
    input [S_AXIS_BRAM_37_WIDTH/8-1:0] ap_bram_37_we0,
    input ap_bram_37_en0,
    input [S_AXIS_BRAM_37_ADDR_WIDTH-1:0] ap_bram_37_addr1,
    input [S_AXIS_BRAM_37_WIDTH-1:0] ap_bram_37_din1,
    output [S_AXIS_BRAM_37_WIDTH-1:0] ap_bram_37_dout1,
    input [S_AXIS_BRAM_37_WIDTH/8-1:0] ap_bram_37_we1,
    input ap_bram_37_en1,
    //input AXI-Stream to FIFO interface 38
    input s_axis_bram_38_aclk,
    input s_axis_bram_38_aresetn,
    input s_axis_bram_38_tlast,
    input s_axis_bram_38_tvalid,
    input [S_AXIS_BRAM_38_DMWIDTH/8-1:0] s_axis_bram_38_tkeep,
    input [S_AXIS_BRAM_38_DMWIDTH/8-1:0] s_axis_bram_38_tstrb,
    input [S_AXIS_BRAM_38_DMWIDTH-1:0] s_axis_bram_38_tdata,
    output s_axis_bram_38_tready,
    input [S_AXIS_BRAM_38_ADDR_WIDTH-1:0] ap_bram_38_addr0,
    input [S_AXIS_BRAM_38_WIDTH-1:0] ap_bram_38_din0,
    output [S_AXIS_BRAM_38_WIDTH-1:0] ap_bram_38_dout0,
    input [S_AXIS_BRAM_38_WIDTH/8-1:0] ap_bram_38_we0,
    input ap_bram_38_en0,
    input [S_AXIS_BRAM_38_ADDR_WIDTH-1:0] ap_bram_38_addr1,
    input [S_AXIS_BRAM_38_WIDTH-1:0] ap_bram_38_din1,
    output [S_AXIS_BRAM_38_WIDTH-1:0] ap_bram_38_dout1,
    input [S_AXIS_BRAM_38_WIDTH/8-1:0] ap_bram_38_we1,
    input ap_bram_38_en1,
    //input AXI-Stream to FIFO interface 39
    input s_axis_bram_39_aclk,
    input s_axis_bram_39_aresetn,
    input s_axis_bram_39_tlast,
    input s_axis_bram_39_tvalid,
    input [S_AXIS_BRAM_39_DMWIDTH/8-1:0] s_axis_bram_39_tkeep,
    input [S_AXIS_BRAM_39_DMWIDTH/8-1:0] s_axis_bram_39_tstrb,
    input [S_AXIS_BRAM_39_DMWIDTH-1:0] s_axis_bram_39_tdata,
    output s_axis_bram_39_tready,
    input [S_AXIS_BRAM_39_ADDR_WIDTH-1:0] ap_bram_39_addr0,
    input [S_AXIS_BRAM_39_WIDTH-1:0] ap_bram_39_din0,
    output [S_AXIS_BRAM_39_WIDTH-1:0] ap_bram_39_dout0,
    input [S_AXIS_BRAM_39_WIDTH/8-1:0] ap_bram_39_we0,
    input ap_bram_39_en0,
    input [S_AXIS_BRAM_39_ADDR_WIDTH-1:0] ap_bram_39_addr1,
    input [S_AXIS_BRAM_39_WIDTH-1:0] ap_bram_39_din1,
    output [S_AXIS_BRAM_39_WIDTH-1:0] ap_bram_39_dout1,
    input [S_AXIS_BRAM_39_WIDTH/8-1:0] ap_bram_39_we1,
    input ap_bram_39_en1,
    //input AXI-Stream to FIFO interface 40
    input s_axis_bram_40_aclk,
    input s_axis_bram_40_aresetn,
    input s_axis_bram_40_tlast,
    input s_axis_bram_40_tvalid,
    input [S_AXIS_BRAM_40_DMWIDTH/8-1:0] s_axis_bram_40_tkeep,
    input [S_AXIS_BRAM_40_DMWIDTH/8-1:0] s_axis_bram_40_tstrb,
    input [S_AXIS_BRAM_40_DMWIDTH-1:0] s_axis_bram_40_tdata,
    output s_axis_bram_40_tready,
    input [S_AXIS_BRAM_40_ADDR_WIDTH-1:0] ap_bram_40_addr0,
    input [S_AXIS_BRAM_40_WIDTH-1:0] ap_bram_40_din0,
    output [S_AXIS_BRAM_40_WIDTH-1:0] ap_bram_40_dout0,
    input [S_AXIS_BRAM_40_WIDTH/8-1:0] ap_bram_40_we0,
    input ap_bram_40_en0,
    input [S_AXIS_BRAM_40_ADDR_WIDTH-1:0] ap_bram_40_addr1,
    input [S_AXIS_BRAM_40_WIDTH-1:0] ap_bram_40_din1,
    output [S_AXIS_BRAM_40_WIDTH-1:0] ap_bram_40_dout1,
    input [S_AXIS_BRAM_40_WIDTH/8-1:0] ap_bram_40_we1,
    input ap_bram_40_en1,
    //input AXI-Stream to FIFO interface 41
    input s_axis_bram_41_aclk,
    input s_axis_bram_41_aresetn,
    input s_axis_bram_41_tlast,
    input s_axis_bram_41_tvalid,
    input [S_AXIS_BRAM_41_DMWIDTH/8-1:0] s_axis_bram_41_tkeep,
    input [S_AXIS_BRAM_41_DMWIDTH/8-1:0] s_axis_bram_41_tstrb,
    input [S_AXIS_BRAM_41_DMWIDTH-1:0] s_axis_bram_41_tdata,
    output s_axis_bram_41_tready,
    input [S_AXIS_BRAM_41_ADDR_WIDTH-1:0] ap_bram_41_addr0,
    input [S_AXIS_BRAM_41_WIDTH-1:0] ap_bram_41_din0,
    output [S_AXIS_BRAM_41_WIDTH-1:0] ap_bram_41_dout0,
    input [S_AXIS_BRAM_41_WIDTH/8-1:0] ap_bram_41_we0,
    input ap_bram_41_en0,
    input [S_AXIS_BRAM_41_ADDR_WIDTH-1:0] ap_bram_41_addr1,
    input [S_AXIS_BRAM_41_WIDTH-1:0] ap_bram_41_din1,
    output [S_AXIS_BRAM_41_WIDTH-1:0] ap_bram_41_dout1,
    input [S_AXIS_BRAM_41_WIDTH/8-1:0] ap_bram_41_we1,
    input ap_bram_41_en1,
    //input AXI-Stream to FIFO interface 42
    input s_axis_bram_42_aclk,
    input s_axis_bram_42_aresetn,
    input s_axis_bram_42_tlast,
    input s_axis_bram_42_tvalid,
    input [S_AXIS_BRAM_42_DMWIDTH/8-1:0] s_axis_bram_42_tkeep,
    input [S_AXIS_BRAM_42_DMWIDTH/8-1:0] s_axis_bram_42_tstrb,
    input [S_AXIS_BRAM_42_DMWIDTH-1:0] s_axis_bram_42_tdata,
    output s_axis_bram_42_tready,
    input [S_AXIS_BRAM_42_ADDR_WIDTH-1:0] ap_bram_42_addr0,
    input [S_AXIS_BRAM_42_WIDTH-1:0] ap_bram_42_din0,
    output [S_AXIS_BRAM_42_WIDTH-1:0] ap_bram_42_dout0,
    input [S_AXIS_BRAM_42_WIDTH/8-1:0] ap_bram_42_we0,
    input ap_bram_42_en0,
    input [S_AXIS_BRAM_42_ADDR_WIDTH-1:0] ap_bram_42_addr1,
    input [S_AXIS_BRAM_42_WIDTH-1:0] ap_bram_42_din1,
    output [S_AXIS_BRAM_42_WIDTH-1:0] ap_bram_42_dout1,
    input [S_AXIS_BRAM_42_WIDTH/8-1:0] ap_bram_42_we1,
    input ap_bram_42_en1,
    //input AXI-Stream to FIFO interface 43
    input s_axis_bram_43_aclk,
    input s_axis_bram_43_aresetn,
    input s_axis_bram_43_tlast,
    input s_axis_bram_43_tvalid,
    input [S_AXIS_BRAM_43_DMWIDTH/8-1:0] s_axis_bram_43_tkeep,
    input [S_AXIS_BRAM_43_DMWIDTH/8-1:0] s_axis_bram_43_tstrb,
    input [S_AXIS_BRAM_43_DMWIDTH-1:0] s_axis_bram_43_tdata,
    output s_axis_bram_43_tready,
    input [S_AXIS_BRAM_43_ADDR_WIDTH-1:0] ap_bram_43_addr0,
    input [S_AXIS_BRAM_43_WIDTH-1:0] ap_bram_43_din0,
    output [S_AXIS_BRAM_43_WIDTH-1:0] ap_bram_43_dout0,
    input [S_AXIS_BRAM_43_WIDTH/8-1:0] ap_bram_43_we0,
    input ap_bram_43_en0,
    input [S_AXIS_BRAM_43_ADDR_WIDTH-1:0] ap_bram_43_addr1,
    input [S_AXIS_BRAM_43_WIDTH-1:0] ap_bram_43_din1,
    output [S_AXIS_BRAM_43_WIDTH-1:0] ap_bram_43_dout1,
    input [S_AXIS_BRAM_43_WIDTH/8-1:0] ap_bram_43_we1,
    input ap_bram_43_en1,
    //input AXI-Stream to FIFO interface 44
    input s_axis_bram_44_aclk,
    input s_axis_bram_44_aresetn,
    input s_axis_bram_44_tlast,
    input s_axis_bram_44_tvalid,
    input [S_AXIS_BRAM_44_DMWIDTH/8-1:0] s_axis_bram_44_tkeep,
    input [S_AXIS_BRAM_44_DMWIDTH/8-1:0] s_axis_bram_44_tstrb,
    input [S_AXIS_BRAM_44_DMWIDTH-1:0] s_axis_bram_44_tdata,
    output s_axis_bram_44_tready,
    input [S_AXIS_BRAM_44_ADDR_WIDTH-1:0] ap_bram_44_addr0,
    input [S_AXIS_BRAM_44_WIDTH-1:0] ap_bram_44_din0,
    output [S_AXIS_BRAM_44_WIDTH-1:0] ap_bram_44_dout0,
    input [S_AXIS_BRAM_44_WIDTH/8-1:0] ap_bram_44_we0,
    input ap_bram_44_en0,
    input [S_AXIS_BRAM_44_ADDR_WIDTH-1:0] ap_bram_44_addr1,
    input [S_AXIS_BRAM_44_WIDTH-1:0] ap_bram_44_din1,
    output [S_AXIS_BRAM_44_WIDTH-1:0] ap_bram_44_dout1,
    input [S_AXIS_BRAM_44_WIDTH/8-1:0] ap_bram_44_we1,
    input ap_bram_44_en1,
    //input AXI-Stream to FIFO interface 45
    input s_axis_bram_45_aclk,
    input s_axis_bram_45_aresetn,
    input s_axis_bram_45_tlast,
    input s_axis_bram_45_tvalid,
    input [S_AXIS_BRAM_45_DMWIDTH/8-1:0] s_axis_bram_45_tkeep,
    input [S_AXIS_BRAM_45_DMWIDTH/8-1:0] s_axis_bram_45_tstrb,
    input [S_AXIS_BRAM_45_DMWIDTH-1:0] s_axis_bram_45_tdata,
    output s_axis_bram_45_tready,
    input [S_AXIS_BRAM_45_ADDR_WIDTH-1:0] ap_bram_45_addr0,
    input [S_AXIS_BRAM_45_WIDTH-1:0] ap_bram_45_din0,
    output [S_AXIS_BRAM_45_WIDTH-1:0] ap_bram_45_dout0,
    input [S_AXIS_BRAM_45_WIDTH/8-1:0] ap_bram_45_we0,
    input ap_bram_45_en0,
    input [S_AXIS_BRAM_45_ADDR_WIDTH-1:0] ap_bram_45_addr1,
    input [S_AXIS_BRAM_45_WIDTH-1:0] ap_bram_45_din1,
    output [S_AXIS_BRAM_45_WIDTH-1:0] ap_bram_45_dout1,
    input [S_AXIS_BRAM_45_WIDTH/8-1:0] ap_bram_45_we1,
    input ap_bram_45_en1,
    //input AXI-Stream to FIFO interface 46
    input s_axis_bram_46_aclk,
    input s_axis_bram_46_aresetn,
    input s_axis_bram_46_tlast,
    input s_axis_bram_46_tvalid,
    input [S_AXIS_BRAM_46_DMWIDTH/8-1:0] s_axis_bram_46_tkeep,
    input [S_AXIS_BRAM_46_DMWIDTH/8-1:0] s_axis_bram_46_tstrb,
    input [S_AXIS_BRAM_46_DMWIDTH-1:0] s_axis_bram_46_tdata,
    output s_axis_bram_46_tready,
    input [S_AXIS_BRAM_46_ADDR_WIDTH-1:0] ap_bram_46_addr0,
    input [S_AXIS_BRAM_46_WIDTH-1:0] ap_bram_46_din0,
    output [S_AXIS_BRAM_46_WIDTH-1:0] ap_bram_46_dout0,
    input [S_AXIS_BRAM_46_WIDTH/8-1:0] ap_bram_46_we0,
    input ap_bram_46_en0,
    input [S_AXIS_BRAM_46_ADDR_WIDTH-1:0] ap_bram_46_addr1,
    input [S_AXIS_BRAM_46_WIDTH-1:0] ap_bram_46_din1,
    output [S_AXIS_BRAM_46_WIDTH-1:0] ap_bram_46_dout1,
    input [S_AXIS_BRAM_46_WIDTH/8-1:0] ap_bram_46_we1,
    input ap_bram_46_en1,
    //input AXI-Stream to FIFO interface 47
    input s_axis_bram_47_aclk,
    input s_axis_bram_47_aresetn,
    input s_axis_bram_47_tlast,
    input s_axis_bram_47_tvalid,
    input [S_AXIS_BRAM_47_DMWIDTH/8-1:0] s_axis_bram_47_tkeep,
    input [S_AXIS_BRAM_47_DMWIDTH/8-1:0] s_axis_bram_47_tstrb,
    input [S_AXIS_BRAM_47_DMWIDTH-1:0] s_axis_bram_47_tdata,
    output s_axis_bram_47_tready,
    input [S_AXIS_BRAM_47_ADDR_WIDTH-1:0] ap_bram_47_addr0,
    input [S_AXIS_BRAM_47_WIDTH-1:0] ap_bram_47_din0,
    output [S_AXIS_BRAM_47_WIDTH-1:0] ap_bram_47_dout0,
    input [S_AXIS_BRAM_47_WIDTH/8-1:0] ap_bram_47_we0,
    input ap_bram_47_en0,
    input [S_AXIS_BRAM_47_ADDR_WIDTH-1:0] ap_bram_47_addr1,
    input [S_AXIS_BRAM_47_WIDTH-1:0] ap_bram_47_din1,
    output [S_AXIS_BRAM_47_WIDTH-1:0] ap_bram_47_dout1,
    input [S_AXIS_BRAM_47_WIDTH/8-1:0] ap_bram_47_we1,
    input ap_bram_47_en1,
    //input AXI-Stream to FIFO interface 48
    input s_axis_bram_48_aclk,
    input s_axis_bram_48_aresetn,
    input s_axis_bram_48_tlast,
    input s_axis_bram_48_tvalid,
    input [S_AXIS_BRAM_48_DMWIDTH/8-1:0] s_axis_bram_48_tkeep,
    input [S_AXIS_BRAM_48_DMWIDTH/8-1:0] s_axis_bram_48_tstrb,
    input [S_AXIS_BRAM_48_DMWIDTH-1:0] s_axis_bram_48_tdata,
    output s_axis_bram_48_tready,
    input [S_AXIS_BRAM_48_ADDR_WIDTH-1:0] ap_bram_48_addr0,
    input [S_AXIS_BRAM_48_WIDTH-1:0] ap_bram_48_din0,
    output [S_AXIS_BRAM_48_WIDTH-1:0] ap_bram_48_dout0,
    input [S_AXIS_BRAM_48_WIDTH/8-1:0] ap_bram_48_we0,
    input ap_bram_48_en0,
    input [S_AXIS_BRAM_48_ADDR_WIDTH-1:0] ap_bram_48_addr1,
    input [S_AXIS_BRAM_48_WIDTH-1:0] ap_bram_48_din1,
    output [S_AXIS_BRAM_48_WIDTH-1:0] ap_bram_48_dout1,
    input [S_AXIS_BRAM_48_WIDTH/8-1:0] ap_bram_48_we1,
    input ap_bram_48_en1,
    //input AXI-Stream to FIFO interface 49
    input s_axis_bram_49_aclk,
    input s_axis_bram_49_aresetn,
    input s_axis_bram_49_tlast,
    input s_axis_bram_49_tvalid,
    input [S_AXIS_BRAM_49_DMWIDTH/8-1:0] s_axis_bram_49_tkeep,
    input [S_AXIS_BRAM_49_DMWIDTH/8-1:0] s_axis_bram_49_tstrb,
    input [S_AXIS_BRAM_49_DMWIDTH-1:0] s_axis_bram_49_tdata,
    output s_axis_bram_49_tready,
    input [S_AXIS_BRAM_49_ADDR_WIDTH-1:0] ap_bram_49_addr0,
    input [S_AXIS_BRAM_49_WIDTH-1:0] ap_bram_49_din0,
    output [S_AXIS_BRAM_49_WIDTH-1:0] ap_bram_49_dout0,
    input [S_AXIS_BRAM_49_WIDTH/8-1:0] ap_bram_49_we0,
    input ap_bram_49_en0,
    input [S_AXIS_BRAM_49_ADDR_WIDTH-1:0] ap_bram_49_addr1,
    input [S_AXIS_BRAM_49_WIDTH-1:0] ap_bram_49_din1,
    output [S_AXIS_BRAM_49_WIDTH-1:0] ap_bram_49_dout1,
    input [S_AXIS_BRAM_49_WIDTH/8-1:0] ap_bram_49_we1,
    input ap_bram_49_en1,
    //input AXI-Stream to FIFO interface 50
    input s_axis_bram_50_aclk,
    input s_axis_bram_50_aresetn,
    input s_axis_bram_50_tlast,
    input s_axis_bram_50_tvalid,
    input [S_AXIS_BRAM_50_DMWIDTH/8-1:0] s_axis_bram_50_tkeep,
    input [S_AXIS_BRAM_50_DMWIDTH/8-1:0] s_axis_bram_50_tstrb,
    input [S_AXIS_BRAM_50_DMWIDTH-1:0] s_axis_bram_50_tdata,
    output s_axis_bram_50_tready,
    input [S_AXIS_BRAM_50_ADDR_WIDTH-1:0] ap_bram_50_addr0,
    input [S_AXIS_BRAM_50_WIDTH-1:0] ap_bram_50_din0,
    output [S_AXIS_BRAM_50_WIDTH-1:0] ap_bram_50_dout0,
    input [S_AXIS_BRAM_50_WIDTH/8-1:0] ap_bram_50_we0,
    input ap_bram_50_en0,
    input [S_AXIS_BRAM_50_ADDR_WIDTH-1:0] ap_bram_50_addr1,
    input [S_AXIS_BRAM_50_WIDTH-1:0] ap_bram_50_din1,
    output [S_AXIS_BRAM_50_WIDTH-1:0] ap_bram_50_dout1,
    input [S_AXIS_BRAM_50_WIDTH/8-1:0] ap_bram_50_we1,
    input ap_bram_50_en1,
    //input AXI-Stream to FIFO interface 51
    input s_axis_bram_51_aclk,
    input s_axis_bram_51_aresetn,
    input s_axis_bram_51_tlast,
    input s_axis_bram_51_tvalid,
    input [S_AXIS_BRAM_51_DMWIDTH/8-1:0] s_axis_bram_51_tkeep,
    input [S_AXIS_BRAM_51_DMWIDTH/8-1:0] s_axis_bram_51_tstrb,
    input [S_AXIS_BRAM_51_DMWIDTH-1:0] s_axis_bram_51_tdata,
    output s_axis_bram_51_tready,
    input [S_AXIS_BRAM_51_ADDR_WIDTH-1:0] ap_bram_51_addr0,
    input [S_AXIS_BRAM_51_WIDTH-1:0] ap_bram_51_din0,
    output [S_AXIS_BRAM_51_WIDTH-1:0] ap_bram_51_dout0,
    input [S_AXIS_BRAM_51_WIDTH/8-1:0] ap_bram_51_we0,
    input ap_bram_51_en0,
    input [S_AXIS_BRAM_51_ADDR_WIDTH-1:0] ap_bram_51_addr1,
    input [S_AXIS_BRAM_51_WIDTH-1:0] ap_bram_51_din1,
    output [S_AXIS_BRAM_51_WIDTH-1:0] ap_bram_51_dout1,
    input [S_AXIS_BRAM_51_WIDTH/8-1:0] ap_bram_51_we1,
    input ap_bram_51_en1,
    //input AXI-Stream to FIFO interface 52
    input s_axis_bram_52_aclk,
    input s_axis_bram_52_aresetn,
    input s_axis_bram_52_tlast,
    input s_axis_bram_52_tvalid,
    input [S_AXIS_BRAM_52_DMWIDTH/8-1:0] s_axis_bram_52_tkeep,
    input [S_AXIS_BRAM_52_DMWIDTH/8-1:0] s_axis_bram_52_tstrb,
    input [S_AXIS_BRAM_52_DMWIDTH-1:0] s_axis_bram_52_tdata,
    output s_axis_bram_52_tready,
    input [S_AXIS_BRAM_52_ADDR_WIDTH-1:0] ap_bram_52_addr0,
    input [S_AXIS_BRAM_52_WIDTH-1:0] ap_bram_52_din0,
    output [S_AXIS_BRAM_52_WIDTH-1:0] ap_bram_52_dout0,
    input [S_AXIS_BRAM_52_WIDTH/8-1:0] ap_bram_52_we0,
    input ap_bram_52_en0,
    input [S_AXIS_BRAM_52_ADDR_WIDTH-1:0] ap_bram_52_addr1,
    input [S_AXIS_BRAM_52_WIDTH-1:0] ap_bram_52_din1,
    output [S_AXIS_BRAM_52_WIDTH-1:0] ap_bram_52_dout1,
    input [S_AXIS_BRAM_52_WIDTH/8-1:0] ap_bram_52_we1,
    input ap_bram_52_en1,
    //input AXI-Stream to FIFO interface 53
    input s_axis_bram_53_aclk,
    input s_axis_bram_53_aresetn,
    input s_axis_bram_53_tlast,
    input s_axis_bram_53_tvalid,
    input [S_AXIS_BRAM_53_DMWIDTH/8-1:0] s_axis_bram_53_tkeep,
    input [S_AXIS_BRAM_53_DMWIDTH/8-1:0] s_axis_bram_53_tstrb,
    input [S_AXIS_BRAM_53_DMWIDTH-1:0] s_axis_bram_53_tdata,
    output s_axis_bram_53_tready,
    input [S_AXIS_BRAM_53_ADDR_WIDTH-1:0] ap_bram_53_addr0,
    input [S_AXIS_BRAM_53_WIDTH-1:0] ap_bram_53_din0,
    output [S_AXIS_BRAM_53_WIDTH-1:0] ap_bram_53_dout0,
    input [S_AXIS_BRAM_53_WIDTH/8-1:0] ap_bram_53_we0,
    input ap_bram_53_en0,
    input [S_AXIS_BRAM_53_ADDR_WIDTH-1:0] ap_bram_53_addr1,
    input [S_AXIS_BRAM_53_WIDTH-1:0] ap_bram_53_din1,
    output [S_AXIS_BRAM_53_WIDTH-1:0] ap_bram_53_dout1,
    input [S_AXIS_BRAM_53_WIDTH/8-1:0] ap_bram_53_we1,
    input ap_bram_53_en1,
    //input AXI-Stream to FIFO interface 54
    input s_axis_bram_54_aclk,
    input s_axis_bram_54_aresetn,
    input s_axis_bram_54_tlast,
    input s_axis_bram_54_tvalid,
    input [S_AXIS_BRAM_54_DMWIDTH/8-1:0] s_axis_bram_54_tkeep,
    input [S_AXIS_BRAM_54_DMWIDTH/8-1:0] s_axis_bram_54_tstrb,
    input [S_AXIS_BRAM_54_DMWIDTH-1:0] s_axis_bram_54_tdata,
    output s_axis_bram_54_tready,
    input [S_AXIS_BRAM_54_ADDR_WIDTH-1:0] ap_bram_54_addr0,
    input [S_AXIS_BRAM_54_WIDTH-1:0] ap_bram_54_din0,
    output [S_AXIS_BRAM_54_WIDTH-1:0] ap_bram_54_dout0,
    input [S_AXIS_BRAM_54_WIDTH/8-1:0] ap_bram_54_we0,
    input ap_bram_54_en0,
    input [S_AXIS_BRAM_54_ADDR_WIDTH-1:0] ap_bram_54_addr1,
    input [S_AXIS_BRAM_54_WIDTH-1:0] ap_bram_54_din1,
    output [S_AXIS_BRAM_54_WIDTH-1:0] ap_bram_54_dout1,
    input [S_AXIS_BRAM_54_WIDTH/8-1:0] ap_bram_54_we1,
    input ap_bram_54_en1,
    //input AXI-Stream to FIFO interface 55
    input s_axis_bram_55_aclk,
    input s_axis_bram_55_aresetn,
    input s_axis_bram_55_tlast,
    input s_axis_bram_55_tvalid,
    input [S_AXIS_BRAM_55_DMWIDTH/8-1:0] s_axis_bram_55_tkeep,
    input [S_AXIS_BRAM_55_DMWIDTH/8-1:0] s_axis_bram_55_tstrb,
    input [S_AXIS_BRAM_55_DMWIDTH-1:0] s_axis_bram_55_tdata,
    output s_axis_bram_55_tready,
    input [S_AXIS_BRAM_55_ADDR_WIDTH-1:0] ap_bram_55_addr0,
    input [S_AXIS_BRAM_55_WIDTH-1:0] ap_bram_55_din0,
    output [S_AXIS_BRAM_55_WIDTH-1:0] ap_bram_55_dout0,
    input [S_AXIS_BRAM_55_WIDTH/8-1:0] ap_bram_55_we0,
    input ap_bram_55_en0,
    input [S_AXIS_BRAM_55_ADDR_WIDTH-1:0] ap_bram_55_addr1,
    input [S_AXIS_BRAM_55_WIDTH-1:0] ap_bram_55_din1,
    output [S_AXIS_BRAM_55_WIDTH-1:0] ap_bram_55_dout1,
    input [S_AXIS_BRAM_55_WIDTH/8-1:0] ap_bram_55_we1,
    input ap_bram_55_en1,
    //input AXI-Stream to FIFO interface 56
    input s_axis_bram_56_aclk,
    input s_axis_bram_56_aresetn,
    input s_axis_bram_56_tlast,
    input s_axis_bram_56_tvalid,
    input [S_AXIS_BRAM_56_DMWIDTH/8-1:0] s_axis_bram_56_tkeep,
    input [S_AXIS_BRAM_56_DMWIDTH/8-1:0] s_axis_bram_56_tstrb,
    input [S_AXIS_BRAM_56_DMWIDTH-1:0] s_axis_bram_56_tdata,
    output s_axis_bram_56_tready,
    input [S_AXIS_BRAM_56_ADDR_WIDTH-1:0] ap_bram_56_addr0,
    input [S_AXIS_BRAM_56_WIDTH-1:0] ap_bram_56_din0,
    output [S_AXIS_BRAM_56_WIDTH-1:0] ap_bram_56_dout0,
    input [S_AXIS_BRAM_56_WIDTH/8-1:0] ap_bram_56_we0,
    input ap_bram_56_en0,
    input [S_AXIS_BRAM_56_ADDR_WIDTH-1:0] ap_bram_56_addr1,
    input [S_AXIS_BRAM_56_WIDTH-1:0] ap_bram_56_din1,
    output [S_AXIS_BRAM_56_WIDTH-1:0] ap_bram_56_dout1,
    input [S_AXIS_BRAM_56_WIDTH/8-1:0] ap_bram_56_we1,
    input ap_bram_56_en1,
    //input AXI-Stream to FIFO interface 57
    input s_axis_bram_57_aclk,
    input s_axis_bram_57_aresetn,
    input s_axis_bram_57_tlast,
    input s_axis_bram_57_tvalid,
    input [S_AXIS_BRAM_57_DMWIDTH/8-1:0] s_axis_bram_57_tkeep,
    input [S_AXIS_BRAM_57_DMWIDTH/8-1:0] s_axis_bram_57_tstrb,
    input [S_AXIS_BRAM_57_DMWIDTH-1:0] s_axis_bram_57_tdata,
    output s_axis_bram_57_tready,
    input [S_AXIS_BRAM_57_ADDR_WIDTH-1:0] ap_bram_57_addr0,
    input [S_AXIS_BRAM_57_WIDTH-1:0] ap_bram_57_din0,
    output [S_AXIS_BRAM_57_WIDTH-1:0] ap_bram_57_dout0,
    input [S_AXIS_BRAM_57_WIDTH/8-1:0] ap_bram_57_we0,
    input ap_bram_57_en0,
    input [S_AXIS_BRAM_57_ADDR_WIDTH-1:0] ap_bram_57_addr1,
    input [S_AXIS_BRAM_57_WIDTH-1:0] ap_bram_57_din1,
    output [S_AXIS_BRAM_57_WIDTH-1:0] ap_bram_57_dout1,
    input [S_AXIS_BRAM_57_WIDTH/8-1:0] ap_bram_57_we1,
    input ap_bram_57_en1,
    //input AXI-Stream to FIFO interface 58
    input s_axis_bram_58_aclk,
    input s_axis_bram_58_aresetn,
    input s_axis_bram_58_tlast,
    input s_axis_bram_58_tvalid,
    input [S_AXIS_BRAM_58_DMWIDTH/8-1:0] s_axis_bram_58_tkeep,
    input [S_AXIS_BRAM_58_DMWIDTH/8-1:0] s_axis_bram_58_tstrb,
    input [S_AXIS_BRAM_58_DMWIDTH-1:0] s_axis_bram_58_tdata,
    output s_axis_bram_58_tready,
    input [S_AXIS_BRAM_58_ADDR_WIDTH-1:0] ap_bram_58_addr0,
    input [S_AXIS_BRAM_58_WIDTH-1:0] ap_bram_58_din0,
    output [S_AXIS_BRAM_58_WIDTH-1:0] ap_bram_58_dout0,
    input [S_AXIS_BRAM_58_WIDTH/8-1:0] ap_bram_58_we0,
    input ap_bram_58_en0,
    input [S_AXIS_BRAM_58_ADDR_WIDTH-1:0] ap_bram_58_addr1,
    input [S_AXIS_BRAM_58_WIDTH-1:0] ap_bram_58_din1,
    output [S_AXIS_BRAM_58_WIDTH-1:0] ap_bram_58_dout1,
    input [S_AXIS_BRAM_58_WIDTH/8-1:0] ap_bram_58_we1,
    input ap_bram_58_en1,
    //input AXI-Stream to FIFO interface 59
    input s_axis_bram_59_aclk,
    input s_axis_bram_59_aresetn,
    input s_axis_bram_59_tlast,
    input s_axis_bram_59_tvalid,
    input [S_AXIS_BRAM_59_DMWIDTH/8-1:0] s_axis_bram_59_tkeep,
    input [S_AXIS_BRAM_59_DMWIDTH/8-1:0] s_axis_bram_59_tstrb,
    input [S_AXIS_BRAM_59_DMWIDTH-1:0] s_axis_bram_59_tdata,
    output s_axis_bram_59_tready,
    input [S_AXIS_BRAM_59_ADDR_WIDTH-1:0] ap_bram_59_addr0,
    input [S_AXIS_BRAM_59_WIDTH-1:0] ap_bram_59_din0,
    output [S_AXIS_BRAM_59_WIDTH-1:0] ap_bram_59_dout0,
    input [S_AXIS_BRAM_59_WIDTH/8-1:0] ap_bram_59_we0,
    input ap_bram_59_en0,
    input [S_AXIS_BRAM_59_ADDR_WIDTH-1:0] ap_bram_59_addr1,
    input [S_AXIS_BRAM_59_WIDTH-1:0] ap_bram_59_din1,
    output [S_AXIS_BRAM_59_WIDTH-1:0] ap_bram_59_dout1,
    input [S_AXIS_BRAM_59_WIDTH/8-1:0] ap_bram_59_we1,
    input ap_bram_59_en1,
    //input AXI-Stream to FIFO interface 60
    input s_axis_bram_60_aclk,
    input s_axis_bram_60_aresetn,
    input s_axis_bram_60_tlast,
    input s_axis_bram_60_tvalid,
    input [S_AXIS_BRAM_60_DMWIDTH/8-1:0] s_axis_bram_60_tkeep,
    input [S_AXIS_BRAM_60_DMWIDTH/8-1:0] s_axis_bram_60_tstrb,
    input [S_AXIS_BRAM_60_DMWIDTH-1:0] s_axis_bram_60_tdata,
    output s_axis_bram_60_tready,
    input [S_AXIS_BRAM_60_ADDR_WIDTH-1:0] ap_bram_60_addr0,
    input [S_AXIS_BRAM_60_WIDTH-1:0] ap_bram_60_din0,
    output [S_AXIS_BRAM_60_WIDTH-1:0] ap_bram_60_dout0,
    input [S_AXIS_BRAM_60_WIDTH/8-1:0] ap_bram_60_we0,
    input ap_bram_60_en0,
    input [S_AXIS_BRAM_60_ADDR_WIDTH-1:0] ap_bram_60_addr1,
    input [S_AXIS_BRAM_60_WIDTH-1:0] ap_bram_60_din1,
    output [S_AXIS_BRAM_60_WIDTH-1:0] ap_bram_60_dout1,
    input [S_AXIS_BRAM_60_WIDTH/8-1:0] ap_bram_60_we1,
    input ap_bram_60_en1,
    //input AXI-Stream to FIFO interface 61
    input s_axis_bram_61_aclk,
    input s_axis_bram_61_aresetn,
    input s_axis_bram_61_tlast,
    input s_axis_bram_61_tvalid,
    input [S_AXIS_BRAM_61_DMWIDTH/8-1:0] s_axis_bram_61_tkeep,
    input [S_AXIS_BRAM_61_DMWIDTH/8-1:0] s_axis_bram_61_tstrb,
    input [S_AXIS_BRAM_61_DMWIDTH-1:0] s_axis_bram_61_tdata,
    output s_axis_bram_61_tready,
    input [S_AXIS_BRAM_61_ADDR_WIDTH-1:0] ap_bram_61_addr0,
    input [S_AXIS_BRAM_61_WIDTH-1:0] ap_bram_61_din0,
    output [S_AXIS_BRAM_61_WIDTH-1:0] ap_bram_61_dout0,
    input [S_AXIS_BRAM_61_WIDTH/8-1:0] ap_bram_61_we0,
    input ap_bram_61_en0,
    input [S_AXIS_BRAM_61_ADDR_WIDTH-1:0] ap_bram_61_addr1,
    input [S_AXIS_BRAM_61_WIDTH-1:0] ap_bram_61_din1,
    output [S_AXIS_BRAM_61_WIDTH-1:0] ap_bram_61_dout1,
    input [S_AXIS_BRAM_61_WIDTH/8-1:0] ap_bram_61_we1,
    input ap_bram_61_en1,
    //input AXI-Stream to FIFO interface 62
    input s_axis_bram_62_aclk,
    input s_axis_bram_62_aresetn,
    input s_axis_bram_62_tlast,
    input s_axis_bram_62_tvalid,
    input [S_AXIS_BRAM_62_DMWIDTH/8-1:0] s_axis_bram_62_tkeep,
    input [S_AXIS_BRAM_62_DMWIDTH/8-1:0] s_axis_bram_62_tstrb,
    input [S_AXIS_BRAM_62_DMWIDTH-1:0] s_axis_bram_62_tdata,
    output s_axis_bram_62_tready,
    input [S_AXIS_BRAM_62_ADDR_WIDTH-1:0] ap_bram_62_addr0,
    input [S_AXIS_BRAM_62_WIDTH-1:0] ap_bram_62_din0,
    output [S_AXIS_BRAM_62_WIDTH-1:0] ap_bram_62_dout0,
    input [S_AXIS_BRAM_62_WIDTH/8-1:0] ap_bram_62_we0,
    input ap_bram_62_en0,
    input [S_AXIS_BRAM_62_ADDR_WIDTH-1:0] ap_bram_62_addr1,
    input [S_AXIS_BRAM_62_WIDTH-1:0] ap_bram_62_din1,
    output [S_AXIS_BRAM_62_WIDTH-1:0] ap_bram_62_dout1,
    input [S_AXIS_BRAM_62_WIDTH/8-1:0] ap_bram_62_we1,
    input ap_bram_62_en1,
    //input AXI-Stream to FIFO interface 63
    input s_axis_bram_63_aclk,
    input s_axis_bram_63_aresetn,
    input s_axis_bram_63_tlast,
    input s_axis_bram_63_tvalid,
    input [S_AXIS_BRAM_63_DMWIDTH/8-1:0] s_axis_bram_63_tkeep,
    input [S_AXIS_BRAM_63_DMWIDTH/8-1:0] s_axis_bram_63_tstrb,
    input [S_AXIS_BRAM_63_DMWIDTH-1:0] s_axis_bram_63_tdata,
    output s_axis_bram_63_tready,
    input [S_AXIS_BRAM_63_ADDR_WIDTH-1:0] ap_bram_63_addr0,
    input [S_AXIS_BRAM_63_WIDTH-1:0] ap_bram_63_din0,
    output [S_AXIS_BRAM_63_WIDTH-1:0] ap_bram_63_dout0,
    input [S_AXIS_BRAM_63_WIDTH/8-1:0] ap_bram_63_we0,
    input ap_bram_63_en0,
    input [S_AXIS_BRAM_63_ADDR_WIDTH-1:0] ap_bram_63_addr1,
    input [S_AXIS_BRAM_63_WIDTH-1:0] ap_bram_63_din1,
    output [S_AXIS_BRAM_63_WIDTH-1:0] ap_bram_63_dout1,
    input [S_AXIS_BRAM_63_WIDTH/8-1:0] ap_bram_63_we1,
    input ap_bram_63_en1,
    //input AXI-Stream to FIFO interface 64
    input s_axis_bram_64_aclk,
    input s_axis_bram_64_aresetn,
    input s_axis_bram_64_tlast,
    input s_axis_bram_64_tvalid,
    input [S_AXIS_BRAM_64_DMWIDTH/8-1:0] s_axis_bram_64_tkeep,
    input [S_AXIS_BRAM_64_DMWIDTH/8-1:0] s_axis_bram_64_tstrb,
    input [S_AXIS_BRAM_64_DMWIDTH-1:0] s_axis_bram_64_tdata,
    output s_axis_bram_64_tready,
    input [S_AXIS_BRAM_64_ADDR_WIDTH-1:0] ap_bram_64_addr0,
    input [S_AXIS_BRAM_64_WIDTH-1:0] ap_bram_64_din0,
    output [S_AXIS_BRAM_64_WIDTH-1:0] ap_bram_64_dout0,
    input [S_AXIS_BRAM_64_WIDTH/8-1:0] ap_bram_64_we0,
    input ap_bram_64_en0,
    input [S_AXIS_BRAM_64_ADDR_WIDTH-1:0] ap_bram_64_addr1,
    input [S_AXIS_BRAM_64_WIDTH-1:0] ap_bram_64_din1,
    output [S_AXIS_BRAM_64_WIDTH-1:0] ap_bram_64_dout1,
    input [S_AXIS_BRAM_64_WIDTH/8-1:0] ap_bram_64_we1,
    input ap_bram_64_en1,
    //input AXI-Stream to FIFO interface 65
    input s_axis_bram_65_aclk,
    input s_axis_bram_65_aresetn,
    input s_axis_bram_65_tlast,
    input s_axis_bram_65_tvalid,
    input [S_AXIS_BRAM_65_DMWIDTH/8-1:0] s_axis_bram_65_tkeep,
    input [S_AXIS_BRAM_65_DMWIDTH/8-1:0] s_axis_bram_65_tstrb,
    input [S_AXIS_BRAM_65_DMWIDTH-1:0] s_axis_bram_65_tdata,
    output s_axis_bram_65_tready,
    input [S_AXIS_BRAM_65_ADDR_WIDTH-1:0] ap_bram_65_addr0,
    input [S_AXIS_BRAM_65_WIDTH-1:0] ap_bram_65_din0,
    output [S_AXIS_BRAM_65_WIDTH-1:0] ap_bram_65_dout0,
    input [S_AXIS_BRAM_65_WIDTH/8-1:0] ap_bram_65_we0,
    input ap_bram_65_en0,
    input [S_AXIS_BRAM_65_ADDR_WIDTH-1:0] ap_bram_65_addr1,
    input [S_AXIS_BRAM_65_WIDTH-1:0] ap_bram_65_din1,
    output [S_AXIS_BRAM_65_WIDTH-1:0] ap_bram_65_dout1,
    input [S_AXIS_BRAM_65_WIDTH/8-1:0] ap_bram_65_we1,
    input ap_bram_65_en1,
    //input AXI-Stream to FIFO interface 66
    input s_axis_bram_66_aclk,
    input s_axis_bram_66_aresetn,
    input s_axis_bram_66_tlast,
    input s_axis_bram_66_tvalid,
    input [S_AXIS_BRAM_66_DMWIDTH/8-1:0] s_axis_bram_66_tkeep,
    input [S_AXIS_BRAM_66_DMWIDTH/8-1:0] s_axis_bram_66_tstrb,
    input [S_AXIS_BRAM_66_DMWIDTH-1:0] s_axis_bram_66_tdata,
    output s_axis_bram_66_tready,
    input [S_AXIS_BRAM_66_ADDR_WIDTH-1:0] ap_bram_66_addr0,
    input [S_AXIS_BRAM_66_WIDTH-1:0] ap_bram_66_din0,
    output [S_AXIS_BRAM_66_WIDTH-1:0] ap_bram_66_dout0,
    input [S_AXIS_BRAM_66_WIDTH/8-1:0] ap_bram_66_we0,
    input ap_bram_66_en0,
    input [S_AXIS_BRAM_66_ADDR_WIDTH-1:0] ap_bram_66_addr1,
    input [S_AXIS_BRAM_66_WIDTH-1:0] ap_bram_66_din1,
    output [S_AXIS_BRAM_66_WIDTH-1:0] ap_bram_66_dout1,
    input [S_AXIS_BRAM_66_WIDTH/8-1:0] ap_bram_66_we1,
    input ap_bram_66_en1,
    //input AXI-Stream to FIFO interface 67
    input s_axis_bram_67_aclk,
    input s_axis_bram_67_aresetn,
    input s_axis_bram_67_tlast,
    input s_axis_bram_67_tvalid,
    input [S_AXIS_BRAM_67_DMWIDTH/8-1:0] s_axis_bram_67_tkeep,
    input [S_AXIS_BRAM_67_DMWIDTH/8-1:0] s_axis_bram_67_tstrb,
    input [S_AXIS_BRAM_67_DMWIDTH-1:0] s_axis_bram_67_tdata,
    output s_axis_bram_67_tready,
    input [S_AXIS_BRAM_67_ADDR_WIDTH-1:0] ap_bram_67_addr0,
    input [S_AXIS_BRAM_67_WIDTH-1:0] ap_bram_67_din0,
    output [S_AXIS_BRAM_67_WIDTH-1:0] ap_bram_67_dout0,
    input [S_AXIS_BRAM_67_WIDTH/8-1:0] ap_bram_67_we0,
    input ap_bram_67_en0,
    input [S_AXIS_BRAM_67_ADDR_WIDTH-1:0] ap_bram_67_addr1,
    input [S_AXIS_BRAM_67_WIDTH-1:0] ap_bram_67_din1,
    output [S_AXIS_BRAM_67_WIDTH-1:0] ap_bram_67_dout1,
    input [S_AXIS_BRAM_67_WIDTH/8-1:0] ap_bram_67_we1,
    input ap_bram_67_en1,
    //input AXI-Stream to FIFO interface 68
    input s_axis_bram_68_aclk,
    input s_axis_bram_68_aresetn,
    input s_axis_bram_68_tlast,
    input s_axis_bram_68_tvalid,
    input [S_AXIS_BRAM_68_DMWIDTH/8-1:0] s_axis_bram_68_tkeep,
    input [S_AXIS_BRAM_68_DMWIDTH/8-1:0] s_axis_bram_68_tstrb,
    input [S_AXIS_BRAM_68_DMWIDTH-1:0] s_axis_bram_68_tdata,
    output s_axis_bram_68_tready,
    input [S_AXIS_BRAM_68_ADDR_WIDTH-1:0] ap_bram_68_addr0,
    input [S_AXIS_BRAM_68_WIDTH-1:0] ap_bram_68_din0,
    output [S_AXIS_BRAM_68_WIDTH-1:0] ap_bram_68_dout0,
    input [S_AXIS_BRAM_68_WIDTH/8-1:0] ap_bram_68_we0,
    input ap_bram_68_en0,
    input [S_AXIS_BRAM_68_ADDR_WIDTH-1:0] ap_bram_68_addr1,
    input [S_AXIS_BRAM_68_WIDTH-1:0] ap_bram_68_din1,
    output [S_AXIS_BRAM_68_WIDTH-1:0] ap_bram_68_dout1,
    input [S_AXIS_BRAM_68_WIDTH/8-1:0] ap_bram_68_we1,
    input ap_bram_68_en1,
    //input AXI-Stream to FIFO interface 69
    input s_axis_bram_69_aclk,
    input s_axis_bram_69_aresetn,
    input s_axis_bram_69_tlast,
    input s_axis_bram_69_tvalid,
    input [S_AXIS_BRAM_69_DMWIDTH/8-1:0] s_axis_bram_69_tkeep,
    input [S_AXIS_BRAM_69_DMWIDTH/8-1:0] s_axis_bram_69_tstrb,
    input [S_AXIS_BRAM_69_DMWIDTH-1:0] s_axis_bram_69_tdata,
    output s_axis_bram_69_tready,
    input [S_AXIS_BRAM_69_ADDR_WIDTH-1:0] ap_bram_69_addr0,
    input [S_AXIS_BRAM_69_WIDTH-1:0] ap_bram_69_din0,
    output [S_AXIS_BRAM_69_WIDTH-1:0] ap_bram_69_dout0,
    input [S_AXIS_BRAM_69_WIDTH/8-1:0] ap_bram_69_we0,
    input ap_bram_69_en0,
    input [S_AXIS_BRAM_69_ADDR_WIDTH-1:0] ap_bram_69_addr1,
    input [S_AXIS_BRAM_69_WIDTH-1:0] ap_bram_69_din1,
    output [S_AXIS_BRAM_69_WIDTH-1:0] ap_bram_69_dout1,
    input [S_AXIS_BRAM_69_WIDTH/8-1:0] ap_bram_69_we1,
    input ap_bram_69_en1,
    //input AXI-Stream to FIFO interface 70
    input s_axis_bram_70_aclk,
    input s_axis_bram_70_aresetn,
    input s_axis_bram_70_tlast,
    input s_axis_bram_70_tvalid,
    input [S_AXIS_BRAM_70_DMWIDTH/8-1:0] s_axis_bram_70_tkeep,
    input [S_AXIS_BRAM_70_DMWIDTH/8-1:0] s_axis_bram_70_tstrb,
    input [S_AXIS_BRAM_70_DMWIDTH-1:0] s_axis_bram_70_tdata,
    output s_axis_bram_70_tready,
    input [S_AXIS_BRAM_70_ADDR_WIDTH-1:0] ap_bram_70_addr0,
    input [S_AXIS_BRAM_70_WIDTH-1:0] ap_bram_70_din0,
    output [S_AXIS_BRAM_70_WIDTH-1:0] ap_bram_70_dout0,
    input [S_AXIS_BRAM_70_WIDTH/8-1:0] ap_bram_70_we0,
    input ap_bram_70_en0,
    input [S_AXIS_BRAM_70_ADDR_WIDTH-1:0] ap_bram_70_addr1,
    input [S_AXIS_BRAM_70_WIDTH-1:0] ap_bram_70_din1,
    output [S_AXIS_BRAM_70_WIDTH-1:0] ap_bram_70_dout1,
    input [S_AXIS_BRAM_70_WIDTH/8-1:0] ap_bram_70_we1,
    input ap_bram_70_en1,
    //input AXI-Stream to FIFO interface 71
    input s_axis_bram_71_aclk,
    input s_axis_bram_71_aresetn,
    input s_axis_bram_71_tlast,
    input s_axis_bram_71_tvalid,
    input [S_AXIS_BRAM_71_DMWIDTH/8-1:0] s_axis_bram_71_tkeep,
    input [S_AXIS_BRAM_71_DMWIDTH/8-1:0] s_axis_bram_71_tstrb,
    input [S_AXIS_BRAM_71_DMWIDTH-1:0] s_axis_bram_71_tdata,
    output s_axis_bram_71_tready,
    input [S_AXIS_BRAM_71_ADDR_WIDTH-1:0] ap_bram_71_addr0,
    input [S_AXIS_BRAM_71_WIDTH-1:0] ap_bram_71_din0,
    output [S_AXIS_BRAM_71_WIDTH-1:0] ap_bram_71_dout0,
    input [S_AXIS_BRAM_71_WIDTH/8-1:0] ap_bram_71_we0,
    input ap_bram_71_en0,
    input [S_AXIS_BRAM_71_ADDR_WIDTH-1:0] ap_bram_71_addr1,
    input [S_AXIS_BRAM_71_WIDTH-1:0] ap_bram_71_din1,
    output [S_AXIS_BRAM_71_WIDTH-1:0] ap_bram_71_dout1,
    input [S_AXIS_BRAM_71_WIDTH/8-1:0] ap_bram_71_we1,
    input ap_bram_71_en1,
    //input AXI-Stream to FIFO interface 72
    input s_axis_bram_72_aclk,
    input s_axis_bram_72_aresetn,
    input s_axis_bram_72_tlast,
    input s_axis_bram_72_tvalid,
    input [S_AXIS_BRAM_72_DMWIDTH/8-1:0] s_axis_bram_72_tkeep,
    input [S_AXIS_BRAM_72_DMWIDTH/8-1:0] s_axis_bram_72_tstrb,
    input [S_AXIS_BRAM_72_DMWIDTH-1:0] s_axis_bram_72_tdata,
    output s_axis_bram_72_tready,
    input [S_AXIS_BRAM_72_ADDR_WIDTH-1:0] ap_bram_72_addr0,
    input [S_AXIS_BRAM_72_WIDTH-1:0] ap_bram_72_din0,
    output [S_AXIS_BRAM_72_WIDTH-1:0] ap_bram_72_dout0,
    input [S_AXIS_BRAM_72_WIDTH/8-1:0] ap_bram_72_we0,
    input ap_bram_72_en0,
    input [S_AXIS_BRAM_72_ADDR_WIDTH-1:0] ap_bram_72_addr1,
    input [S_AXIS_BRAM_72_WIDTH-1:0] ap_bram_72_din1,
    output [S_AXIS_BRAM_72_WIDTH-1:0] ap_bram_72_dout1,
    input [S_AXIS_BRAM_72_WIDTH/8-1:0] ap_bram_72_we1,
    input ap_bram_72_en1,
    //input AXI-Stream to FIFO interface 73
    input s_axis_bram_73_aclk,
    input s_axis_bram_73_aresetn,
    input s_axis_bram_73_tlast,
    input s_axis_bram_73_tvalid,
    input [S_AXIS_BRAM_73_DMWIDTH/8-1:0] s_axis_bram_73_tkeep,
    input [S_AXIS_BRAM_73_DMWIDTH/8-1:0] s_axis_bram_73_tstrb,
    input [S_AXIS_BRAM_73_DMWIDTH-1:0] s_axis_bram_73_tdata,
    output s_axis_bram_73_tready,
    input [S_AXIS_BRAM_73_ADDR_WIDTH-1:0] ap_bram_73_addr0,
    input [S_AXIS_BRAM_73_WIDTH-1:0] ap_bram_73_din0,
    output [S_AXIS_BRAM_73_WIDTH-1:0] ap_bram_73_dout0,
    input [S_AXIS_BRAM_73_WIDTH/8-1:0] ap_bram_73_we0,
    input ap_bram_73_en0,
    input [S_AXIS_BRAM_73_ADDR_WIDTH-1:0] ap_bram_73_addr1,
    input [S_AXIS_BRAM_73_WIDTH-1:0] ap_bram_73_din1,
    output [S_AXIS_BRAM_73_WIDTH-1:0] ap_bram_73_dout1,
    input [S_AXIS_BRAM_73_WIDTH/8-1:0] ap_bram_73_we1,
    input ap_bram_73_en1,
    //input AXI-Stream to FIFO interface 74
    input s_axis_bram_74_aclk,
    input s_axis_bram_74_aresetn,
    input s_axis_bram_74_tlast,
    input s_axis_bram_74_tvalid,
    input [S_AXIS_BRAM_74_DMWIDTH/8-1:0] s_axis_bram_74_tkeep,
    input [S_AXIS_BRAM_74_DMWIDTH/8-1:0] s_axis_bram_74_tstrb,
    input [S_AXIS_BRAM_74_DMWIDTH-1:0] s_axis_bram_74_tdata,
    output s_axis_bram_74_tready,
    input [S_AXIS_BRAM_74_ADDR_WIDTH-1:0] ap_bram_74_addr0,
    input [S_AXIS_BRAM_74_WIDTH-1:0] ap_bram_74_din0,
    output [S_AXIS_BRAM_74_WIDTH-1:0] ap_bram_74_dout0,
    input [S_AXIS_BRAM_74_WIDTH/8-1:0] ap_bram_74_we0,
    input ap_bram_74_en0,
    input [S_AXIS_BRAM_74_ADDR_WIDTH-1:0] ap_bram_74_addr1,
    input [S_AXIS_BRAM_74_WIDTH-1:0] ap_bram_74_din1,
    output [S_AXIS_BRAM_74_WIDTH-1:0] ap_bram_74_dout1,
    input [S_AXIS_BRAM_74_WIDTH/8-1:0] ap_bram_74_we1,
    input ap_bram_74_en1,
    //input AXI-Stream to FIFO interface 75
    input s_axis_bram_75_aclk,
    input s_axis_bram_75_aresetn,
    input s_axis_bram_75_tlast,
    input s_axis_bram_75_tvalid,
    input [S_AXIS_BRAM_75_DMWIDTH/8-1:0] s_axis_bram_75_tkeep,
    input [S_AXIS_BRAM_75_DMWIDTH/8-1:0] s_axis_bram_75_tstrb,
    input [S_AXIS_BRAM_75_DMWIDTH-1:0] s_axis_bram_75_tdata,
    output s_axis_bram_75_tready,
    input [S_AXIS_BRAM_75_ADDR_WIDTH-1:0] ap_bram_75_addr0,
    input [S_AXIS_BRAM_75_WIDTH-1:0] ap_bram_75_din0,
    output [S_AXIS_BRAM_75_WIDTH-1:0] ap_bram_75_dout0,
    input [S_AXIS_BRAM_75_WIDTH/8-1:0] ap_bram_75_we0,
    input ap_bram_75_en0,
    input [S_AXIS_BRAM_75_ADDR_WIDTH-1:0] ap_bram_75_addr1,
    input [S_AXIS_BRAM_75_WIDTH-1:0] ap_bram_75_din1,
    output [S_AXIS_BRAM_75_WIDTH-1:0] ap_bram_75_dout1,
    input [S_AXIS_BRAM_75_WIDTH/8-1:0] ap_bram_75_we1,
    input ap_bram_75_en1,
    //input AXI-Stream to FIFO interface 76
    input s_axis_bram_76_aclk,
    input s_axis_bram_76_aresetn,
    input s_axis_bram_76_tlast,
    input s_axis_bram_76_tvalid,
    input [S_AXIS_BRAM_76_DMWIDTH/8-1:0] s_axis_bram_76_tkeep,
    input [S_AXIS_BRAM_76_DMWIDTH/8-1:0] s_axis_bram_76_tstrb,
    input [S_AXIS_BRAM_76_DMWIDTH-1:0] s_axis_bram_76_tdata,
    output s_axis_bram_76_tready,
    input [S_AXIS_BRAM_76_ADDR_WIDTH-1:0] ap_bram_76_addr0,
    input [S_AXIS_BRAM_76_WIDTH-1:0] ap_bram_76_din0,
    output [S_AXIS_BRAM_76_WIDTH-1:0] ap_bram_76_dout0,
    input [S_AXIS_BRAM_76_WIDTH/8-1:0] ap_bram_76_we0,
    input ap_bram_76_en0,
    input [S_AXIS_BRAM_76_ADDR_WIDTH-1:0] ap_bram_76_addr1,
    input [S_AXIS_BRAM_76_WIDTH-1:0] ap_bram_76_din1,
    output [S_AXIS_BRAM_76_WIDTH-1:0] ap_bram_76_dout1,
    input [S_AXIS_BRAM_76_WIDTH/8-1:0] ap_bram_76_we1,
    input ap_bram_76_en1,
    //input AXI-Stream to FIFO interface 77
    input s_axis_bram_77_aclk,
    input s_axis_bram_77_aresetn,
    input s_axis_bram_77_tlast,
    input s_axis_bram_77_tvalid,
    input [S_AXIS_BRAM_77_DMWIDTH/8-1:0] s_axis_bram_77_tkeep,
    input [S_AXIS_BRAM_77_DMWIDTH/8-1:0] s_axis_bram_77_tstrb,
    input [S_AXIS_BRAM_77_DMWIDTH-1:0] s_axis_bram_77_tdata,
    output s_axis_bram_77_tready,
    input [S_AXIS_BRAM_77_ADDR_WIDTH-1:0] ap_bram_77_addr0,
    input [S_AXIS_BRAM_77_WIDTH-1:0] ap_bram_77_din0,
    output [S_AXIS_BRAM_77_WIDTH-1:0] ap_bram_77_dout0,
    input [S_AXIS_BRAM_77_WIDTH/8-1:0] ap_bram_77_we0,
    input ap_bram_77_en0,
    input [S_AXIS_BRAM_77_ADDR_WIDTH-1:0] ap_bram_77_addr1,
    input [S_AXIS_BRAM_77_WIDTH-1:0] ap_bram_77_din1,
    output [S_AXIS_BRAM_77_WIDTH-1:0] ap_bram_77_dout1,
    input [S_AXIS_BRAM_77_WIDTH/8-1:0] ap_bram_77_we1,
    input ap_bram_77_en1,
    //input AXI-Stream to FIFO interface 78
    input s_axis_bram_78_aclk,
    input s_axis_bram_78_aresetn,
    input s_axis_bram_78_tlast,
    input s_axis_bram_78_tvalid,
    input [S_AXIS_BRAM_78_DMWIDTH/8-1:0] s_axis_bram_78_tkeep,
    input [S_AXIS_BRAM_78_DMWIDTH/8-1:0] s_axis_bram_78_tstrb,
    input [S_AXIS_BRAM_78_DMWIDTH-1:0] s_axis_bram_78_tdata,
    output s_axis_bram_78_tready,
    input [S_AXIS_BRAM_78_ADDR_WIDTH-1:0] ap_bram_78_addr0,
    input [S_AXIS_BRAM_78_WIDTH-1:0] ap_bram_78_din0,
    output [S_AXIS_BRAM_78_WIDTH-1:0] ap_bram_78_dout0,
    input [S_AXIS_BRAM_78_WIDTH/8-1:0] ap_bram_78_we0,
    input ap_bram_78_en0,
    input [S_AXIS_BRAM_78_ADDR_WIDTH-1:0] ap_bram_78_addr1,
    input [S_AXIS_BRAM_78_WIDTH-1:0] ap_bram_78_din1,
    output [S_AXIS_BRAM_78_WIDTH-1:0] ap_bram_78_dout1,
    input [S_AXIS_BRAM_78_WIDTH/8-1:0] ap_bram_78_we1,
    input ap_bram_78_en1,
    //input AXI-Stream to FIFO interface 79
    input s_axis_bram_79_aclk,
    input s_axis_bram_79_aresetn,
    input s_axis_bram_79_tlast,
    input s_axis_bram_79_tvalid,
    input [S_AXIS_BRAM_79_DMWIDTH/8-1:0] s_axis_bram_79_tkeep,
    input [S_AXIS_BRAM_79_DMWIDTH/8-1:0] s_axis_bram_79_tstrb,
    input [S_AXIS_BRAM_79_DMWIDTH-1:0] s_axis_bram_79_tdata,
    output s_axis_bram_79_tready,
    input [S_AXIS_BRAM_79_ADDR_WIDTH-1:0] ap_bram_79_addr0,
    input [S_AXIS_BRAM_79_WIDTH-1:0] ap_bram_79_din0,
    output [S_AXIS_BRAM_79_WIDTH-1:0] ap_bram_79_dout0,
    input [S_AXIS_BRAM_79_WIDTH/8-1:0] ap_bram_79_we0,
    input ap_bram_79_en0,
    input [S_AXIS_BRAM_79_ADDR_WIDTH-1:0] ap_bram_79_addr1,
    input [S_AXIS_BRAM_79_WIDTH-1:0] ap_bram_79_din1,
    output [S_AXIS_BRAM_79_WIDTH-1:0] ap_bram_79_dout1,
    input [S_AXIS_BRAM_79_WIDTH/8-1:0] ap_bram_79_we1,
    input ap_bram_79_en1,
    //input AXI-Stream to FIFO interface 80
    input s_axis_bram_80_aclk,
    input s_axis_bram_80_aresetn,
    input s_axis_bram_80_tlast,
    input s_axis_bram_80_tvalid,
    input [S_AXIS_BRAM_80_DMWIDTH/8-1:0] s_axis_bram_80_tkeep,
    input [S_AXIS_BRAM_80_DMWIDTH/8-1:0] s_axis_bram_80_tstrb,
    input [S_AXIS_BRAM_80_DMWIDTH-1:0] s_axis_bram_80_tdata,
    output s_axis_bram_80_tready,
    input [S_AXIS_BRAM_80_ADDR_WIDTH-1:0] ap_bram_80_addr0,
    input [S_AXIS_BRAM_80_WIDTH-1:0] ap_bram_80_din0,
    output [S_AXIS_BRAM_80_WIDTH-1:0] ap_bram_80_dout0,
    input [S_AXIS_BRAM_80_WIDTH/8-1:0] ap_bram_80_we0,
    input ap_bram_80_en0,
    input [S_AXIS_BRAM_80_ADDR_WIDTH-1:0] ap_bram_80_addr1,
    input [S_AXIS_BRAM_80_WIDTH-1:0] ap_bram_80_din1,
    output [S_AXIS_BRAM_80_WIDTH-1:0] ap_bram_80_dout1,
    input [S_AXIS_BRAM_80_WIDTH/8-1:0] ap_bram_80_we1,
    input ap_bram_80_en1,
    //input AXI-Stream to FIFO interface 81
    input s_axis_bram_81_aclk,
    input s_axis_bram_81_aresetn,
    input s_axis_bram_81_tlast,
    input s_axis_bram_81_tvalid,
    input [S_AXIS_BRAM_81_DMWIDTH/8-1:0] s_axis_bram_81_tkeep,
    input [S_AXIS_BRAM_81_DMWIDTH/8-1:0] s_axis_bram_81_tstrb,
    input [S_AXIS_BRAM_81_DMWIDTH-1:0] s_axis_bram_81_tdata,
    output s_axis_bram_81_tready,
    input [S_AXIS_BRAM_81_ADDR_WIDTH-1:0] ap_bram_81_addr0,
    input [S_AXIS_BRAM_81_WIDTH-1:0] ap_bram_81_din0,
    output [S_AXIS_BRAM_81_WIDTH-1:0] ap_bram_81_dout0,
    input [S_AXIS_BRAM_81_WIDTH/8-1:0] ap_bram_81_we0,
    input ap_bram_81_en0,
    input [S_AXIS_BRAM_81_ADDR_WIDTH-1:0] ap_bram_81_addr1,
    input [S_AXIS_BRAM_81_WIDTH-1:0] ap_bram_81_din1,
    output [S_AXIS_BRAM_81_WIDTH-1:0] ap_bram_81_dout1,
    input [S_AXIS_BRAM_81_WIDTH/8-1:0] ap_bram_81_we1,
    input ap_bram_81_en1,
    //input AXI-Stream to FIFO interface 82
    input s_axis_bram_82_aclk,
    input s_axis_bram_82_aresetn,
    input s_axis_bram_82_tlast,
    input s_axis_bram_82_tvalid,
    input [S_AXIS_BRAM_82_DMWIDTH/8-1:0] s_axis_bram_82_tkeep,
    input [S_AXIS_BRAM_82_DMWIDTH/8-1:0] s_axis_bram_82_tstrb,
    input [S_AXIS_BRAM_82_DMWIDTH-1:0] s_axis_bram_82_tdata,
    output s_axis_bram_82_tready,
    input [S_AXIS_BRAM_82_ADDR_WIDTH-1:0] ap_bram_82_addr0,
    input [S_AXIS_BRAM_82_WIDTH-1:0] ap_bram_82_din0,
    output [S_AXIS_BRAM_82_WIDTH-1:0] ap_bram_82_dout0,
    input [S_AXIS_BRAM_82_WIDTH/8-1:0] ap_bram_82_we0,
    input ap_bram_82_en0,
    input [S_AXIS_BRAM_82_ADDR_WIDTH-1:0] ap_bram_82_addr1,
    input [S_AXIS_BRAM_82_WIDTH-1:0] ap_bram_82_din1,
    output [S_AXIS_BRAM_82_WIDTH-1:0] ap_bram_82_dout1,
    input [S_AXIS_BRAM_82_WIDTH/8-1:0] ap_bram_82_we1,
    input ap_bram_82_en1,
    //input AXI-Stream to FIFO interface 83
    input s_axis_bram_83_aclk,
    input s_axis_bram_83_aresetn,
    input s_axis_bram_83_tlast,
    input s_axis_bram_83_tvalid,
    input [S_AXIS_BRAM_83_DMWIDTH/8-1:0] s_axis_bram_83_tkeep,
    input [S_AXIS_BRAM_83_DMWIDTH/8-1:0] s_axis_bram_83_tstrb,
    input [S_AXIS_BRAM_83_DMWIDTH-1:0] s_axis_bram_83_tdata,
    output s_axis_bram_83_tready,
    input [S_AXIS_BRAM_83_ADDR_WIDTH-1:0] ap_bram_83_addr0,
    input [S_AXIS_BRAM_83_WIDTH-1:0] ap_bram_83_din0,
    output [S_AXIS_BRAM_83_WIDTH-1:0] ap_bram_83_dout0,
    input [S_AXIS_BRAM_83_WIDTH/8-1:0] ap_bram_83_we0,
    input ap_bram_83_en0,
    input [S_AXIS_BRAM_83_ADDR_WIDTH-1:0] ap_bram_83_addr1,
    input [S_AXIS_BRAM_83_WIDTH-1:0] ap_bram_83_din1,
    output [S_AXIS_BRAM_83_WIDTH-1:0] ap_bram_83_dout1,
    input [S_AXIS_BRAM_83_WIDTH/8-1:0] ap_bram_83_we1,
    input ap_bram_83_en1,
    //input AXI-Stream to FIFO interface 84
    input s_axis_bram_84_aclk,
    input s_axis_bram_84_aresetn,
    input s_axis_bram_84_tlast,
    input s_axis_bram_84_tvalid,
    input [S_AXIS_BRAM_84_DMWIDTH/8-1:0] s_axis_bram_84_tkeep,
    input [S_AXIS_BRAM_84_DMWIDTH/8-1:0] s_axis_bram_84_tstrb,
    input [S_AXIS_BRAM_84_DMWIDTH-1:0] s_axis_bram_84_tdata,
    output s_axis_bram_84_tready,
    input [S_AXIS_BRAM_84_ADDR_WIDTH-1:0] ap_bram_84_addr0,
    input [S_AXIS_BRAM_84_WIDTH-1:0] ap_bram_84_din0,
    output [S_AXIS_BRAM_84_WIDTH-1:0] ap_bram_84_dout0,
    input [S_AXIS_BRAM_84_WIDTH/8-1:0] ap_bram_84_we0,
    input ap_bram_84_en0,
    input [S_AXIS_BRAM_84_ADDR_WIDTH-1:0] ap_bram_84_addr1,
    input [S_AXIS_BRAM_84_WIDTH-1:0] ap_bram_84_din1,
    output [S_AXIS_BRAM_84_WIDTH-1:0] ap_bram_84_dout1,
    input [S_AXIS_BRAM_84_WIDTH/8-1:0] ap_bram_84_we1,
    input ap_bram_84_en1,
    //input AXI-Stream to FIFO interface 85
    input s_axis_bram_85_aclk,
    input s_axis_bram_85_aresetn,
    input s_axis_bram_85_tlast,
    input s_axis_bram_85_tvalid,
    input [S_AXIS_BRAM_85_DMWIDTH/8-1:0] s_axis_bram_85_tkeep,
    input [S_AXIS_BRAM_85_DMWIDTH/8-1:0] s_axis_bram_85_tstrb,
    input [S_AXIS_BRAM_85_DMWIDTH-1:0] s_axis_bram_85_tdata,
    output s_axis_bram_85_tready,
    input [S_AXIS_BRAM_85_ADDR_WIDTH-1:0] ap_bram_85_addr0,
    input [S_AXIS_BRAM_85_WIDTH-1:0] ap_bram_85_din0,
    output [S_AXIS_BRAM_85_WIDTH-1:0] ap_bram_85_dout0,
    input [S_AXIS_BRAM_85_WIDTH/8-1:0] ap_bram_85_we0,
    input ap_bram_85_en0,
    input [S_AXIS_BRAM_85_ADDR_WIDTH-1:0] ap_bram_85_addr1,
    input [S_AXIS_BRAM_85_WIDTH-1:0] ap_bram_85_din1,
    output [S_AXIS_BRAM_85_WIDTH-1:0] ap_bram_85_dout1,
    input [S_AXIS_BRAM_85_WIDTH/8-1:0] ap_bram_85_we1,
    input ap_bram_85_en1,
    //input AXI-Stream to FIFO interface 86
    input s_axis_bram_86_aclk,
    input s_axis_bram_86_aresetn,
    input s_axis_bram_86_tlast,
    input s_axis_bram_86_tvalid,
    input [S_AXIS_BRAM_86_DMWIDTH/8-1:0] s_axis_bram_86_tkeep,
    input [S_AXIS_BRAM_86_DMWIDTH/8-1:0] s_axis_bram_86_tstrb,
    input [S_AXIS_BRAM_86_DMWIDTH-1:0] s_axis_bram_86_tdata,
    output s_axis_bram_86_tready,
    input [S_AXIS_BRAM_86_ADDR_WIDTH-1:0] ap_bram_86_addr0,
    input [S_AXIS_BRAM_86_WIDTH-1:0] ap_bram_86_din0,
    output [S_AXIS_BRAM_86_WIDTH-1:0] ap_bram_86_dout0,
    input [S_AXIS_BRAM_86_WIDTH/8-1:0] ap_bram_86_we0,
    input ap_bram_86_en0,
    input [S_AXIS_BRAM_86_ADDR_WIDTH-1:0] ap_bram_86_addr1,
    input [S_AXIS_BRAM_86_WIDTH-1:0] ap_bram_86_din1,
    output [S_AXIS_BRAM_86_WIDTH-1:0] ap_bram_86_dout1,
    input [S_AXIS_BRAM_86_WIDTH/8-1:0] ap_bram_86_we1,
    input ap_bram_86_en1,
    //input AXI-Stream to FIFO interface 87
    input s_axis_bram_87_aclk,
    input s_axis_bram_87_aresetn,
    input s_axis_bram_87_tlast,
    input s_axis_bram_87_tvalid,
    input [S_AXIS_BRAM_87_DMWIDTH/8-1:0] s_axis_bram_87_tkeep,
    input [S_AXIS_BRAM_87_DMWIDTH/8-1:0] s_axis_bram_87_tstrb,
    input [S_AXIS_BRAM_87_DMWIDTH-1:0] s_axis_bram_87_tdata,
    output s_axis_bram_87_tready,
    input [S_AXIS_BRAM_87_ADDR_WIDTH-1:0] ap_bram_87_addr0,
    input [S_AXIS_BRAM_87_WIDTH-1:0] ap_bram_87_din0,
    output [S_AXIS_BRAM_87_WIDTH-1:0] ap_bram_87_dout0,
    input [S_AXIS_BRAM_87_WIDTH/8-1:0] ap_bram_87_we0,
    input ap_bram_87_en0,
    input [S_AXIS_BRAM_87_ADDR_WIDTH-1:0] ap_bram_87_addr1,
    input [S_AXIS_BRAM_87_WIDTH-1:0] ap_bram_87_din1,
    output [S_AXIS_BRAM_87_WIDTH-1:0] ap_bram_87_dout1,
    input [S_AXIS_BRAM_87_WIDTH/8-1:0] ap_bram_87_we1,
    input ap_bram_87_en1,
    //input AXI-Stream to FIFO interface 88
    input s_axis_bram_88_aclk,
    input s_axis_bram_88_aresetn,
    input s_axis_bram_88_tlast,
    input s_axis_bram_88_tvalid,
    input [S_AXIS_BRAM_88_DMWIDTH/8-1:0] s_axis_bram_88_tkeep,
    input [S_AXIS_BRAM_88_DMWIDTH/8-1:0] s_axis_bram_88_tstrb,
    input [S_AXIS_BRAM_88_DMWIDTH-1:0] s_axis_bram_88_tdata,
    output s_axis_bram_88_tready,
    input [S_AXIS_BRAM_88_ADDR_WIDTH-1:0] ap_bram_88_addr0,
    input [S_AXIS_BRAM_88_WIDTH-1:0] ap_bram_88_din0,
    output [S_AXIS_BRAM_88_WIDTH-1:0] ap_bram_88_dout0,
    input [S_AXIS_BRAM_88_WIDTH/8-1:0] ap_bram_88_we0,
    input ap_bram_88_en0,
    input [S_AXIS_BRAM_88_ADDR_WIDTH-1:0] ap_bram_88_addr1,
    input [S_AXIS_BRAM_88_WIDTH-1:0] ap_bram_88_din1,
    output [S_AXIS_BRAM_88_WIDTH-1:0] ap_bram_88_dout1,
    input [S_AXIS_BRAM_88_WIDTH/8-1:0] ap_bram_88_we1,
    input ap_bram_88_en1,
    //input AXI-Stream to FIFO interface 89
    input s_axis_bram_89_aclk,
    input s_axis_bram_89_aresetn,
    input s_axis_bram_89_tlast,
    input s_axis_bram_89_tvalid,
    input [S_AXIS_BRAM_89_DMWIDTH/8-1:0] s_axis_bram_89_tkeep,
    input [S_AXIS_BRAM_89_DMWIDTH/8-1:0] s_axis_bram_89_tstrb,
    input [S_AXIS_BRAM_89_DMWIDTH-1:0] s_axis_bram_89_tdata,
    output s_axis_bram_89_tready,
    input [S_AXIS_BRAM_89_ADDR_WIDTH-1:0] ap_bram_89_addr0,
    input [S_AXIS_BRAM_89_WIDTH-1:0] ap_bram_89_din0,
    output [S_AXIS_BRAM_89_WIDTH-1:0] ap_bram_89_dout0,
    input [S_AXIS_BRAM_89_WIDTH/8-1:0] ap_bram_89_we0,
    input ap_bram_89_en0,
    input [S_AXIS_BRAM_89_ADDR_WIDTH-1:0] ap_bram_89_addr1,
    input [S_AXIS_BRAM_89_WIDTH-1:0] ap_bram_89_din1,
    output [S_AXIS_BRAM_89_WIDTH-1:0] ap_bram_89_dout1,
    input [S_AXIS_BRAM_89_WIDTH/8-1:0] ap_bram_89_we1,
    input ap_bram_89_en1,
    //input AXI-Stream to FIFO interface 90
    input s_axis_bram_90_aclk,
    input s_axis_bram_90_aresetn,
    input s_axis_bram_90_tlast,
    input s_axis_bram_90_tvalid,
    input [S_AXIS_BRAM_90_DMWIDTH/8-1:0] s_axis_bram_90_tkeep,
    input [S_AXIS_BRAM_90_DMWIDTH/8-1:0] s_axis_bram_90_tstrb,
    input [S_AXIS_BRAM_90_DMWIDTH-1:0] s_axis_bram_90_tdata,
    output s_axis_bram_90_tready,
    input [S_AXIS_BRAM_90_ADDR_WIDTH-1:0] ap_bram_90_addr0,
    input [S_AXIS_BRAM_90_WIDTH-1:0] ap_bram_90_din0,
    output [S_AXIS_BRAM_90_WIDTH-1:0] ap_bram_90_dout0,
    input [S_AXIS_BRAM_90_WIDTH/8-1:0] ap_bram_90_we0,
    input ap_bram_90_en0,
    input [S_AXIS_BRAM_90_ADDR_WIDTH-1:0] ap_bram_90_addr1,
    input [S_AXIS_BRAM_90_WIDTH-1:0] ap_bram_90_din1,
    output [S_AXIS_BRAM_90_WIDTH-1:0] ap_bram_90_dout1,
    input [S_AXIS_BRAM_90_WIDTH/8-1:0] ap_bram_90_we1,
    input ap_bram_90_en1,
    //input AXI-Stream to FIFO interface 91
    input s_axis_bram_91_aclk,
    input s_axis_bram_91_aresetn,
    input s_axis_bram_91_tlast,
    input s_axis_bram_91_tvalid,
    input [S_AXIS_BRAM_91_DMWIDTH/8-1:0] s_axis_bram_91_tkeep,
    input [S_AXIS_BRAM_91_DMWIDTH/8-1:0] s_axis_bram_91_tstrb,
    input [S_AXIS_BRAM_91_DMWIDTH-1:0] s_axis_bram_91_tdata,
    output s_axis_bram_91_tready,
    input [S_AXIS_BRAM_91_ADDR_WIDTH-1:0] ap_bram_91_addr0,
    input [S_AXIS_BRAM_91_WIDTH-1:0] ap_bram_91_din0,
    output [S_AXIS_BRAM_91_WIDTH-1:0] ap_bram_91_dout0,
    input [S_AXIS_BRAM_91_WIDTH/8-1:0] ap_bram_91_we0,
    input ap_bram_91_en0,
    input [S_AXIS_BRAM_91_ADDR_WIDTH-1:0] ap_bram_91_addr1,
    input [S_AXIS_BRAM_91_WIDTH-1:0] ap_bram_91_din1,
    output [S_AXIS_BRAM_91_WIDTH-1:0] ap_bram_91_dout1,
    input [S_AXIS_BRAM_91_WIDTH/8-1:0] ap_bram_91_we1,
    input ap_bram_91_en1,
    //input AXI-Stream to FIFO interface 92
    input s_axis_bram_92_aclk,
    input s_axis_bram_92_aresetn,
    input s_axis_bram_92_tlast,
    input s_axis_bram_92_tvalid,
    input [S_AXIS_BRAM_92_DMWIDTH/8-1:0] s_axis_bram_92_tkeep,
    input [S_AXIS_BRAM_92_DMWIDTH/8-1:0] s_axis_bram_92_tstrb,
    input [S_AXIS_BRAM_92_DMWIDTH-1:0] s_axis_bram_92_tdata,
    output s_axis_bram_92_tready,
    input [S_AXIS_BRAM_92_ADDR_WIDTH-1:0] ap_bram_92_addr0,
    input [S_AXIS_BRAM_92_WIDTH-1:0] ap_bram_92_din0,
    output [S_AXIS_BRAM_92_WIDTH-1:0] ap_bram_92_dout0,
    input [S_AXIS_BRAM_92_WIDTH/8-1:0] ap_bram_92_we0,
    input ap_bram_92_en0,
    input [S_AXIS_BRAM_92_ADDR_WIDTH-1:0] ap_bram_92_addr1,
    input [S_AXIS_BRAM_92_WIDTH-1:0] ap_bram_92_din1,
    output [S_AXIS_BRAM_92_WIDTH-1:0] ap_bram_92_dout1,
    input [S_AXIS_BRAM_92_WIDTH/8-1:0] ap_bram_92_we1,
    input ap_bram_92_en1,
    //input AXI-Stream to FIFO interface 93
    input s_axis_bram_93_aclk,
    input s_axis_bram_93_aresetn,
    input s_axis_bram_93_tlast,
    input s_axis_bram_93_tvalid,
    input [S_AXIS_BRAM_93_DMWIDTH/8-1:0] s_axis_bram_93_tkeep,
    input [S_AXIS_BRAM_93_DMWIDTH/8-1:0] s_axis_bram_93_tstrb,
    input [S_AXIS_BRAM_93_DMWIDTH-1:0] s_axis_bram_93_tdata,
    output s_axis_bram_93_tready,
    input [S_AXIS_BRAM_93_ADDR_WIDTH-1:0] ap_bram_93_addr0,
    input [S_AXIS_BRAM_93_WIDTH-1:0] ap_bram_93_din0,
    output [S_AXIS_BRAM_93_WIDTH-1:0] ap_bram_93_dout0,
    input [S_AXIS_BRAM_93_WIDTH/8-1:0] ap_bram_93_we0,
    input ap_bram_93_en0,
    input [S_AXIS_BRAM_93_ADDR_WIDTH-1:0] ap_bram_93_addr1,
    input [S_AXIS_BRAM_93_WIDTH-1:0] ap_bram_93_din1,
    output [S_AXIS_BRAM_93_WIDTH-1:0] ap_bram_93_dout1,
    input [S_AXIS_BRAM_93_WIDTH/8-1:0] ap_bram_93_we1,
    input ap_bram_93_en1,
    //input AXI-Stream to FIFO interface 94
    input s_axis_bram_94_aclk,
    input s_axis_bram_94_aresetn,
    input s_axis_bram_94_tlast,
    input s_axis_bram_94_tvalid,
    input [S_AXIS_BRAM_94_DMWIDTH/8-1:0] s_axis_bram_94_tkeep,
    input [S_AXIS_BRAM_94_DMWIDTH/8-1:0] s_axis_bram_94_tstrb,
    input [S_AXIS_BRAM_94_DMWIDTH-1:0] s_axis_bram_94_tdata,
    output s_axis_bram_94_tready,
    input [S_AXIS_BRAM_94_ADDR_WIDTH-1:0] ap_bram_94_addr0,
    input [S_AXIS_BRAM_94_WIDTH-1:0] ap_bram_94_din0,
    output [S_AXIS_BRAM_94_WIDTH-1:0] ap_bram_94_dout0,
    input [S_AXIS_BRAM_94_WIDTH/8-1:0] ap_bram_94_we0,
    input ap_bram_94_en0,
    input [S_AXIS_BRAM_94_ADDR_WIDTH-1:0] ap_bram_94_addr1,
    input [S_AXIS_BRAM_94_WIDTH-1:0] ap_bram_94_din1,
    output [S_AXIS_BRAM_94_WIDTH-1:0] ap_bram_94_dout1,
    input [S_AXIS_BRAM_94_WIDTH/8-1:0] ap_bram_94_we1,
    input ap_bram_94_en1,
    //input AXI-Stream to FIFO interface 95
    input s_axis_bram_95_aclk,
    input s_axis_bram_95_aresetn,
    input s_axis_bram_95_tlast,
    input s_axis_bram_95_tvalid,
    input [S_AXIS_BRAM_95_DMWIDTH/8-1:0] s_axis_bram_95_tkeep,
    input [S_AXIS_BRAM_95_DMWIDTH/8-1:0] s_axis_bram_95_tstrb,
    input [S_AXIS_BRAM_95_DMWIDTH-1:0] s_axis_bram_95_tdata,
    output s_axis_bram_95_tready,
    input [S_AXIS_BRAM_95_ADDR_WIDTH-1:0] ap_bram_95_addr0,
    input [S_AXIS_BRAM_95_WIDTH-1:0] ap_bram_95_din0,
    output [S_AXIS_BRAM_95_WIDTH-1:0] ap_bram_95_dout0,
    input [S_AXIS_BRAM_95_WIDTH/8-1:0] ap_bram_95_we0,
    input ap_bram_95_en0,
    input [S_AXIS_BRAM_95_ADDR_WIDTH-1:0] ap_bram_95_addr1,
    input [S_AXIS_BRAM_95_WIDTH-1:0] ap_bram_95_din1,
    output [S_AXIS_BRAM_95_WIDTH-1:0] ap_bram_95_dout1,
    input [S_AXIS_BRAM_95_WIDTH/8-1:0] ap_bram_95_we1,
    input ap_bram_95_en1,
    //input AXI-Stream to FIFO interface 96
    input s_axis_bram_96_aclk,
    input s_axis_bram_96_aresetn,
    input s_axis_bram_96_tlast,
    input s_axis_bram_96_tvalid,
    input [S_AXIS_BRAM_96_DMWIDTH/8-1:0] s_axis_bram_96_tkeep,
    input [S_AXIS_BRAM_96_DMWIDTH/8-1:0] s_axis_bram_96_tstrb,
    input [S_AXIS_BRAM_96_DMWIDTH-1:0] s_axis_bram_96_tdata,
    output s_axis_bram_96_tready,
    input [S_AXIS_BRAM_96_ADDR_WIDTH-1:0] ap_bram_96_addr0,
    input [S_AXIS_BRAM_96_WIDTH-1:0] ap_bram_96_din0,
    output [S_AXIS_BRAM_96_WIDTH-1:0] ap_bram_96_dout0,
    input [S_AXIS_BRAM_96_WIDTH/8-1:0] ap_bram_96_we0,
    input ap_bram_96_en0,
    input [S_AXIS_BRAM_96_ADDR_WIDTH-1:0] ap_bram_96_addr1,
    input [S_AXIS_BRAM_96_WIDTH-1:0] ap_bram_96_din1,
    output [S_AXIS_BRAM_96_WIDTH-1:0] ap_bram_96_dout1,
    input [S_AXIS_BRAM_96_WIDTH/8-1:0] ap_bram_96_we1,
    input ap_bram_96_en1,
    //input AXI-Stream to FIFO interface 97
    input s_axis_bram_97_aclk,
    input s_axis_bram_97_aresetn,
    input s_axis_bram_97_tlast,
    input s_axis_bram_97_tvalid,
    input [S_AXIS_BRAM_97_DMWIDTH/8-1:0] s_axis_bram_97_tkeep,
    input [S_AXIS_BRAM_97_DMWIDTH/8-1:0] s_axis_bram_97_tstrb,
    input [S_AXIS_BRAM_97_DMWIDTH-1:0] s_axis_bram_97_tdata,
    output s_axis_bram_97_tready,
    input [S_AXIS_BRAM_97_ADDR_WIDTH-1:0] ap_bram_97_addr0,
    input [S_AXIS_BRAM_97_WIDTH-1:0] ap_bram_97_din0,
    output [S_AXIS_BRAM_97_WIDTH-1:0] ap_bram_97_dout0,
    input [S_AXIS_BRAM_97_WIDTH/8-1:0] ap_bram_97_we0,
    input ap_bram_97_en0,
    input [S_AXIS_BRAM_97_ADDR_WIDTH-1:0] ap_bram_97_addr1,
    input [S_AXIS_BRAM_97_WIDTH-1:0] ap_bram_97_din1,
    output [S_AXIS_BRAM_97_WIDTH-1:0] ap_bram_97_dout1,
    input [S_AXIS_BRAM_97_WIDTH/8-1:0] ap_bram_97_we1,
    input ap_bram_97_en1,
    //input AXI-Stream to FIFO interface 98
    input s_axis_bram_98_aclk,
    input s_axis_bram_98_aresetn,
    input s_axis_bram_98_tlast,
    input s_axis_bram_98_tvalid,
    input [S_AXIS_BRAM_98_DMWIDTH/8-1:0] s_axis_bram_98_tkeep,
    input [S_AXIS_BRAM_98_DMWIDTH/8-1:0] s_axis_bram_98_tstrb,
    input [S_AXIS_BRAM_98_DMWIDTH-1:0] s_axis_bram_98_tdata,
    output s_axis_bram_98_tready,
    input [S_AXIS_BRAM_98_ADDR_WIDTH-1:0] ap_bram_98_addr0,
    input [S_AXIS_BRAM_98_WIDTH-1:0] ap_bram_98_din0,
    output [S_AXIS_BRAM_98_WIDTH-1:0] ap_bram_98_dout0,
    input [S_AXIS_BRAM_98_WIDTH/8-1:0] ap_bram_98_we0,
    input ap_bram_98_en0,
    input [S_AXIS_BRAM_98_ADDR_WIDTH-1:0] ap_bram_98_addr1,
    input [S_AXIS_BRAM_98_WIDTH-1:0] ap_bram_98_din1,
    output [S_AXIS_BRAM_98_WIDTH-1:0] ap_bram_98_dout1,
    input [S_AXIS_BRAM_98_WIDTH/8-1:0] ap_bram_98_we1,
    input ap_bram_98_en1,
    //input AXI-Stream to FIFO interface 99
    input s_axis_bram_99_aclk,
    input s_axis_bram_99_aresetn,
    input s_axis_bram_99_tlast,
    input s_axis_bram_99_tvalid,
    input [S_AXIS_BRAM_99_DMWIDTH/8-1:0] s_axis_bram_99_tkeep,
    input [S_AXIS_BRAM_99_DMWIDTH/8-1:0] s_axis_bram_99_tstrb,
    input [S_AXIS_BRAM_99_DMWIDTH-1:0] s_axis_bram_99_tdata,
    output s_axis_bram_99_tready,
    input [S_AXIS_BRAM_99_ADDR_WIDTH-1:0] ap_bram_99_addr0,
    input [S_AXIS_BRAM_99_WIDTH-1:0] ap_bram_99_din0,
    output [S_AXIS_BRAM_99_WIDTH-1:0] ap_bram_99_dout0,
    input [S_AXIS_BRAM_99_WIDTH/8-1:0] ap_bram_99_we0,
    input ap_bram_99_en0,
    input [S_AXIS_BRAM_99_ADDR_WIDTH-1:0] ap_bram_99_addr1,
    input [S_AXIS_BRAM_99_WIDTH-1:0] ap_bram_99_din1,
    output [S_AXIS_BRAM_99_WIDTH-1:0] ap_bram_99_dout1,
    input [S_AXIS_BRAM_99_WIDTH/8-1:0] ap_bram_99_we1,
    input ap_bram_99_en1,
    //input AXI-Stream to FIFO interface 100
    input s_axis_bram_100_aclk,
    input s_axis_bram_100_aresetn,
    input s_axis_bram_100_tlast,
    input s_axis_bram_100_tvalid,
    input [S_AXIS_BRAM_100_DMWIDTH/8-1:0] s_axis_bram_100_tkeep,
    input [S_AXIS_BRAM_100_DMWIDTH/8-1:0] s_axis_bram_100_tstrb,
    input [S_AXIS_BRAM_100_DMWIDTH-1:0] s_axis_bram_100_tdata,
    output s_axis_bram_100_tready,
    input [S_AXIS_BRAM_100_ADDR_WIDTH-1:0] ap_bram_100_addr0,
    input [S_AXIS_BRAM_100_WIDTH-1:0] ap_bram_100_din0,
    output [S_AXIS_BRAM_100_WIDTH-1:0] ap_bram_100_dout0,
    input [S_AXIS_BRAM_100_WIDTH/8-1:0] ap_bram_100_we0,
    input ap_bram_100_en0,
    input [S_AXIS_BRAM_100_ADDR_WIDTH-1:0] ap_bram_100_addr1,
    input [S_AXIS_BRAM_100_WIDTH-1:0] ap_bram_100_din1,
    output [S_AXIS_BRAM_100_WIDTH-1:0] ap_bram_100_dout1,
    input [S_AXIS_BRAM_100_WIDTH/8-1:0] ap_bram_100_we1,
    input ap_bram_100_en1,
    //input AXI-Stream to FIFO interface 101
    input s_axis_bram_101_aclk,
    input s_axis_bram_101_aresetn,
    input s_axis_bram_101_tlast,
    input s_axis_bram_101_tvalid,
    input [S_AXIS_BRAM_101_DMWIDTH/8-1:0] s_axis_bram_101_tkeep,
    input [S_AXIS_BRAM_101_DMWIDTH/8-1:0] s_axis_bram_101_tstrb,
    input [S_AXIS_BRAM_101_DMWIDTH-1:0] s_axis_bram_101_tdata,
    output s_axis_bram_101_tready,
    input [S_AXIS_BRAM_101_ADDR_WIDTH-1:0] ap_bram_101_addr0,
    input [S_AXIS_BRAM_101_WIDTH-1:0] ap_bram_101_din0,
    output [S_AXIS_BRAM_101_WIDTH-1:0] ap_bram_101_dout0,
    input [S_AXIS_BRAM_101_WIDTH/8-1:0] ap_bram_101_we0,
    input ap_bram_101_en0,
    input [S_AXIS_BRAM_101_ADDR_WIDTH-1:0] ap_bram_101_addr1,
    input [S_AXIS_BRAM_101_WIDTH-1:0] ap_bram_101_din1,
    output [S_AXIS_BRAM_101_WIDTH-1:0] ap_bram_101_dout1,
    input [S_AXIS_BRAM_101_WIDTH/8-1:0] ap_bram_101_we1,
    input ap_bram_101_en1,
    //input AXI-Stream to FIFO interface 102
    input s_axis_bram_102_aclk,
    input s_axis_bram_102_aresetn,
    input s_axis_bram_102_tlast,
    input s_axis_bram_102_tvalid,
    input [S_AXIS_BRAM_102_DMWIDTH/8-1:0] s_axis_bram_102_tkeep,
    input [S_AXIS_BRAM_102_DMWIDTH/8-1:0] s_axis_bram_102_tstrb,
    input [S_AXIS_BRAM_102_DMWIDTH-1:0] s_axis_bram_102_tdata,
    output s_axis_bram_102_tready,
    input [S_AXIS_BRAM_102_ADDR_WIDTH-1:0] ap_bram_102_addr0,
    input [S_AXIS_BRAM_102_WIDTH-1:0] ap_bram_102_din0,
    output [S_AXIS_BRAM_102_WIDTH-1:0] ap_bram_102_dout0,
    input [S_AXIS_BRAM_102_WIDTH/8-1:0] ap_bram_102_we0,
    input ap_bram_102_en0,
    input [S_AXIS_BRAM_102_ADDR_WIDTH-1:0] ap_bram_102_addr1,
    input [S_AXIS_BRAM_102_WIDTH-1:0] ap_bram_102_din1,
    output [S_AXIS_BRAM_102_WIDTH-1:0] ap_bram_102_dout1,
    input [S_AXIS_BRAM_102_WIDTH/8-1:0] ap_bram_102_we1,
    input ap_bram_102_en1,
    //input AXI-Stream to FIFO interface 103
    input s_axis_bram_103_aclk,
    input s_axis_bram_103_aresetn,
    input s_axis_bram_103_tlast,
    input s_axis_bram_103_tvalid,
    input [S_AXIS_BRAM_103_DMWIDTH/8-1:0] s_axis_bram_103_tkeep,
    input [S_AXIS_BRAM_103_DMWIDTH/8-1:0] s_axis_bram_103_tstrb,
    input [S_AXIS_BRAM_103_DMWIDTH-1:0] s_axis_bram_103_tdata,
    output s_axis_bram_103_tready,
    input [S_AXIS_BRAM_103_ADDR_WIDTH-1:0] ap_bram_103_addr0,
    input [S_AXIS_BRAM_103_WIDTH-1:0] ap_bram_103_din0,
    output [S_AXIS_BRAM_103_WIDTH-1:0] ap_bram_103_dout0,
    input [S_AXIS_BRAM_103_WIDTH/8-1:0] ap_bram_103_we0,
    input ap_bram_103_en0,
    input [S_AXIS_BRAM_103_ADDR_WIDTH-1:0] ap_bram_103_addr1,
    input [S_AXIS_BRAM_103_WIDTH-1:0] ap_bram_103_din1,
    output [S_AXIS_BRAM_103_WIDTH-1:0] ap_bram_103_dout1,
    input [S_AXIS_BRAM_103_WIDTH/8-1:0] ap_bram_103_we1,
    input ap_bram_103_en1,
    //input AXI-Stream to FIFO interface 104
    input s_axis_bram_104_aclk,
    input s_axis_bram_104_aresetn,
    input s_axis_bram_104_tlast,
    input s_axis_bram_104_tvalid,
    input [S_AXIS_BRAM_104_DMWIDTH/8-1:0] s_axis_bram_104_tkeep,
    input [S_AXIS_BRAM_104_DMWIDTH/8-1:0] s_axis_bram_104_tstrb,
    input [S_AXIS_BRAM_104_DMWIDTH-1:0] s_axis_bram_104_tdata,
    output s_axis_bram_104_tready,
    input [S_AXIS_BRAM_104_ADDR_WIDTH-1:0] ap_bram_104_addr0,
    input [S_AXIS_BRAM_104_WIDTH-1:0] ap_bram_104_din0,
    output [S_AXIS_BRAM_104_WIDTH-1:0] ap_bram_104_dout0,
    input [S_AXIS_BRAM_104_WIDTH/8-1:0] ap_bram_104_we0,
    input ap_bram_104_en0,
    input [S_AXIS_BRAM_104_ADDR_WIDTH-1:0] ap_bram_104_addr1,
    input [S_AXIS_BRAM_104_WIDTH-1:0] ap_bram_104_din1,
    output [S_AXIS_BRAM_104_WIDTH-1:0] ap_bram_104_dout1,
    input [S_AXIS_BRAM_104_WIDTH/8-1:0] ap_bram_104_we1,
    input ap_bram_104_en1,
    //input AXI-Stream to FIFO interface 105
    input s_axis_bram_105_aclk,
    input s_axis_bram_105_aresetn,
    input s_axis_bram_105_tlast,
    input s_axis_bram_105_tvalid,
    input [S_AXIS_BRAM_105_DMWIDTH/8-1:0] s_axis_bram_105_tkeep,
    input [S_AXIS_BRAM_105_DMWIDTH/8-1:0] s_axis_bram_105_tstrb,
    input [S_AXIS_BRAM_105_DMWIDTH-1:0] s_axis_bram_105_tdata,
    output s_axis_bram_105_tready,
    input [S_AXIS_BRAM_105_ADDR_WIDTH-1:0] ap_bram_105_addr0,
    input [S_AXIS_BRAM_105_WIDTH-1:0] ap_bram_105_din0,
    output [S_AXIS_BRAM_105_WIDTH-1:0] ap_bram_105_dout0,
    input [S_AXIS_BRAM_105_WIDTH/8-1:0] ap_bram_105_we0,
    input ap_bram_105_en0,
    input [S_AXIS_BRAM_105_ADDR_WIDTH-1:0] ap_bram_105_addr1,
    input [S_AXIS_BRAM_105_WIDTH-1:0] ap_bram_105_din1,
    output [S_AXIS_BRAM_105_WIDTH-1:0] ap_bram_105_dout1,
    input [S_AXIS_BRAM_105_WIDTH/8-1:0] ap_bram_105_we1,
    input ap_bram_105_en1,
    //input AXI-Stream to FIFO interface 106
    input s_axis_bram_106_aclk,
    input s_axis_bram_106_aresetn,
    input s_axis_bram_106_tlast,
    input s_axis_bram_106_tvalid,
    input [S_AXIS_BRAM_106_DMWIDTH/8-1:0] s_axis_bram_106_tkeep,
    input [S_AXIS_BRAM_106_DMWIDTH/8-1:0] s_axis_bram_106_tstrb,
    input [S_AXIS_BRAM_106_DMWIDTH-1:0] s_axis_bram_106_tdata,
    output s_axis_bram_106_tready,
    input [S_AXIS_BRAM_106_ADDR_WIDTH-1:0] ap_bram_106_addr0,
    input [S_AXIS_BRAM_106_WIDTH-1:0] ap_bram_106_din0,
    output [S_AXIS_BRAM_106_WIDTH-1:0] ap_bram_106_dout0,
    input [S_AXIS_BRAM_106_WIDTH/8-1:0] ap_bram_106_we0,
    input ap_bram_106_en0,
    input [S_AXIS_BRAM_106_ADDR_WIDTH-1:0] ap_bram_106_addr1,
    input [S_AXIS_BRAM_106_WIDTH-1:0] ap_bram_106_din1,
    output [S_AXIS_BRAM_106_WIDTH-1:0] ap_bram_106_dout1,
    input [S_AXIS_BRAM_106_WIDTH/8-1:0] ap_bram_106_we1,
    input ap_bram_106_en1,
    //input AXI-Stream to FIFO interface 107
    input s_axis_bram_107_aclk,
    input s_axis_bram_107_aresetn,
    input s_axis_bram_107_tlast,
    input s_axis_bram_107_tvalid,
    input [S_AXIS_BRAM_107_DMWIDTH/8-1:0] s_axis_bram_107_tkeep,
    input [S_AXIS_BRAM_107_DMWIDTH/8-1:0] s_axis_bram_107_tstrb,
    input [S_AXIS_BRAM_107_DMWIDTH-1:0] s_axis_bram_107_tdata,
    output s_axis_bram_107_tready,
    input [S_AXIS_BRAM_107_ADDR_WIDTH-1:0] ap_bram_107_addr0,
    input [S_AXIS_BRAM_107_WIDTH-1:0] ap_bram_107_din0,
    output [S_AXIS_BRAM_107_WIDTH-1:0] ap_bram_107_dout0,
    input [S_AXIS_BRAM_107_WIDTH/8-1:0] ap_bram_107_we0,
    input ap_bram_107_en0,
    input [S_AXIS_BRAM_107_ADDR_WIDTH-1:0] ap_bram_107_addr1,
    input [S_AXIS_BRAM_107_WIDTH-1:0] ap_bram_107_din1,
    output [S_AXIS_BRAM_107_WIDTH-1:0] ap_bram_107_dout1,
    input [S_AXIS_BRAM_107_WIDTH/8-1:0] ap_bram_107_we1,
    input ap_bram_107_en1,
    //input AXI-Stream to FIFO interface 108
    input s_axis_bram_108_aclk,
    input s_axis_bram_108_aresetn,
    input s_axis_bram_108_tlast,
    input s_axis_bram_108_tvalid,
    input [S_AXIS_BRAM_108_DMWIDTH/8-1:0] s_axis_bram_108_tkeep,
    input [S_AXIS_BRAM_108_DMWIDTH/8-1:0] s_axis_bram_108_tstrb,
    input [S_AXIS_BRAM_108_DMWIDTH-1:0] s_axis_bram_108_tdata,
    output s_axis_bram_108_tready,
    input [S_AXIS_BRAM_108_ADDR_WIDTH-1:0] ap_bram_108_addr0,
    input [S_AXIS_BRAM_108_WIDTH-1:0] ap_bram_108_din0,
    output [S_AXIS_BRAM_108_WIDTH-1:0] ap_bram_108_dout0,
    input [S_AXIS_BRAM_108_WIDTH/8-1:0] ap_bram_108_we0,
    input ap_bram_108_en0,
    input [S_AXIS_BRAM_108_ADDR_WIDTH-1:0] ap_bram_108_addr1,
    input [S_AXIS_BRAM_108_WIDTH-1:0] ap_bram_108_din1,
    output [S_AXIS_BRAM_108_WIDTH-1:0] ap_bram_108_dout1,
    input [S_AXIS_BRAM_108_WIDTH/8-1:0] ap_bram_108_we1,
    input ap_bram_108_en1,
    //input AXI-Stream to FIFO interface 109
    input s_axis_bram_109_aclk,
    input s_axis_bram_109_aresetn,
    input s_axis_bram_109_tlast,
    input s_axis_bram_109_tvalid,
    input [S_AXIS_BRAM_109_DMWIDTH/8-1:0] s_axis_bram_109_tkeep,
    input [S_AXIS_BRAM_109_DMWIDTH/8-1:0] s_axis_bram_109_tstrb,
    input [S_AXIS_BRAM_109_DMWIDTH-1:0] s_axis_bram_109_tdata,
    output s_axis_bram_109_tready,
    input [S_AXIS_BRAM_109_ADDR_WIDTH-1:0] ap_bram_109_addr0,
    input [S_AXIS_BRAM_109_WIDTH-1:0] ap_bram_109_din0,
    output [S_AXIS_BRAM_109_WIDTH-1:0] ap_bram_109_dout0,
    input [S_AXIS_BRAM_109_WIDTH/8-1:0] ap_bram_109_we0,
    input ap_bram_109_en0,
    input [S_AXIS_BRAM_109_ADDR_WIDTH-1:0] ap_bram_109_addr1,
    input [S_AXIS_BRAM_109_WIDTH-1:0] ap_bram_109_din1,
    output [S_AXIS_BRAM_109_WIDTH-1:0] ap_bram_109_dout1,
    input [S_AXIS_BRAM_109_WIDTH/8-1:0] ap_bram_109_we1,
    input ap_bram_109_en1,
    //input AXI-Stream to FIFO interface 110
    input s_axis_bram_110_aclk,
    input s_axis_bram_110_aresetn,
    input s_axis_bram_110_tlast,
    input s_axis_bram_110_tvalid,
    input [S_AXIS_BRAM_110_DMWIDTH/8-1:0] s_axis_bram_110_tkeep,
    input [S_AXIS_BRAM_110_DMWIDTH/8-1:0] s_axis_bram_110_tstrb,
    input [S_AXIS_BRAM_110_DMWIDTH-1:0] s_axis_bram_110_tdata,
    output s_axis_bram_110_tready,
    input [S_AXIS_BRAM_110_ADDR_WIDTH-1:0] ap_bram_110_addr0,
    input [S_AXIS_BRAM_110_WIDTH-1:0] ap_bram_110_din0,
    output [S_AXIS_BRAM_110_WIDTH-1:0] ap_bram_110_dout0,
    input [S_AXIS_BRAM_110_WIDTH/8-1:0] ap_bram_110_we0,
    input ap_bram_110_en0,
    input [S_AXIS_BRAM_110_ADDR_WIDTH-1:0] ap_bram_110_addr1,
    input [S_AXIS_BRAM_110_WIDTH-1:0] ap_bram_110_din1,
    output [S_AXIS_BRAM_110_WIDTH-1:0] ap_bram_110_dout1,
    input [S_AXIS_BRAM_110_WIDTH/8-1:0] ap_bram_110_we1,
    input ap_bram_110_en1,
    //input AXI-Stream to FIFO interface 111
    input s_axis_bram_111_aclk,
    input s_axis_bram_111_aresetn,
    input s_axis_bram_111_tlast,
    input s_axis_bram_111_tvalid,
    input [S_AXIS_BRAM_111_DMWIDTH/8-1:0] s_axis_bram_111_tkeep,
    input [S_AXIS_BRAM_111_DMWIDTH/8-1:0] s_axis_bram_111_tstrb,
    input [S_AXIS_BRAM_111_DMWIDTH-1:0] s_axis_bram_111_tdata,
    output s_axis_bram_111_tready,
    input [S_AXIS_BRAM_111_ADDR_WIDTH-1:0] ap_bram_111_addr0,
    input [S_AXIS_BRAM_111_WIDTH-1:0] ap_bram_111_din0,
    output [S_AXIS_BRAM_111_WIDTH-1:0] ap_bram_111_dout0,
    input [S_AXIS_BRAM_111_WIDTH/8-1:0] ap_bram_111_we0,
    input ap_bram_111_en0,
    input [S_AXIS_BRAM_111_ADDR_WIDTH-1:0] ap_bram_111_addr1,
    input [S_AXIS_BRAM_111_WIDTH-1:0] ap_bram_111_din1,
    output [S_AXIS_BRAM_111_WIDTH-1:0] ap_bram_111_dout1,
    input [S_AXIS_BRAM_111_WIDTH/8-1:0] ap_bram_111_we1,
    input ap_bram_111_en1,
    //input AXI-Stream to FIFO interface 112
    input s_axis_bram_112_aclk,
    input s_axis_bram_112_aresetn,
    input s_axis_bram_112_tlast,
    input s_axis_bram_112_tvalid,
    input [S_AXIS_BRAM_112_DMWIDTH/8-1:0] s_axis_bram_112_tkeep,
    input [S_AXIS_BRAM_112_DMWIDTH/8-1:0] s_axis_bram_112_tstrb,
    input [S_AXIS_BRAM_112_DMWIDTH-1:0] s_axis_bram_112_tdata,
    output s_axis_bram_112_tready,
    input [S_AXIS_BRAM_112_ADDR_WIDTH-1:0] ap_bram_112_addr0,
    input [S_AXIS_BRAM_112_WIDTH-1:0] ap_bram_112_din0,
    output [S_AXIS_BRAM_112_WIDTH-1:0] ap_bram_112_dout0,
    input [S_AXIS_BRAM_112_WIDTH/8-1:0] ap_bram_112_we0,
    input ap_bram_112_en0,
    input [S_AXIS_BRAM_112_ADDR_WIDTH-1:0] ap_bram_112_addr1,
    input [S_AXIS_BRAM_112_WIDTH-1:0] ap_bram_112_din1,
    output [S_AXIS_BRAM_112_WIDTH-1:0] ap_bram_112_dout1,
    input [S_AXIS_BRAM_112_WIDTH/8-1:0] ap_bram_112_we1,
    input ap_bram_112_en1,
    //input AXI-Stream to FIFO interface 113
    input s_axis_bram_113_aclk,
    input s_axis_bram_113_aresetn,
    input s_axis_bram_113_tlast,
    input s_axis_bram_113_tvalid,
    input [S_AXIS_BRAM_113_DMWIDTH/8-1:0] s_axis_bram_113_tkeep,
    input [S_AXIS_BRAM_113_DMWIDTH/8-1:0] s_axis_bram_113_tstrb,
    input [S_AXIS_BRAM_113_DMWIDTH-1:0] s_axis_bram_113_tdata,
    output s_axis_bram_113_tready,
    input [S_AXIS_BRAM_113_ADDR_WIDTH-1:0] ap_bram_113_addr0,
    input [S_AXIS_BRAM_113_WIDTH-1:0] ap_bram_113_din0,
    output [S_AXIS_BRAM_113_WIDTH-1:0] ap_bram_113_dout0,
    input [S_AXIS_BRAM_113_WIDTH/8-1:0] ap_bram_113_we0,
    input ap_bram_113_en0,
    input [S_AXIS_BRAM_113_ADDR_WIDTH-1:0] ap_bram_113_addr1,
    input [S_AXIS_BRAM_113_WIDTH-1:0] ap_bram_113_din1,
    output [S_AXIS_BRAM_113_WIDTH-1:0] ap_bram_113_dout1,
    input [S_AXIS_BRAM_113_WIDTH/8-1:0] ap_bram_113_we1,
    input ap_bram_113_en1,
    //input AXI-Stream to FIFO interface 114
    input s_axis_bram_114_aclk,
    input s_axis_bram_114_aresetn,
    input s_axis_bram_114_tlast,
    input s_axis_bram_114_tvalid,
    input [S_AXIS_BRAM_114_DMWIDTH/8-1:0] s_axis_bram_114_tkeep,
    input [S_AXIS_BRAM_114_DMWIDTH/8-1:0] s_axis_bram_114_tstrb,
    input [S_AXIS_BRAM_114_DMWIDTH-1:0] s_axis_bram_114_tdata,
    output s_axis_bram_114_tready,
    input [S_AXIS_BRAM_114_ADDR_WIDTH-1:0] ap_bram_114_addr0,
    input [S_AXIS_BRAM_114_WIDTH-1:0] ap_bram_114_din0,
    output [S_AXIS_BRAM_114_WIDTH-1:0] ap_bram_114_dout0,
    input [S_AXIS_BRAM_114_WIDTH/8-1:0] ap_bram_114_we0,
    input ap_bram_114_en0,
    input [S_AXIS_BRAM_114_ADDR_WIDTH-1:0] ap_bram_114_addr1,
    input [S_AXIS_BRAM_114_WIDTH-1:0] ap_bram_114_din1,
    output [S_AXIS_BRAM_114_WIDTH-1:0] ap_bram_114_dout1,
    input [S_AXIS_BRAM_114_WIDTH/8-1:0] ap_bram_114_we1,
    input ap_bram_114_en1,
    //input AXI-Stream to FIFO interface 115
    input s_axis_bram_115_aclk,
    input s_axis_bram_115_aresetn,
    input s_axis_bram_115_tlast,
    input s_axis_bram_115_tvalid,
    input [S_AXIS_BRAM_115_DMWIDTH/8-1:0] s_axis_bram_115_tkeep,
    input [S_AXIS_BRAM_115_DMWIDTH/8-1:0] s_axis_bram_115_tstrb,
    input [S_AXIS_BRAM_115_DMWIDTH-1:0] s_axis_bram_115_tdata,
    output s_axis_bram_115_tready,
    input [S_AXIS_BRAM_115_ADDR_WIDTH-1:0] ap_bram_115_addr0,
    input [S_AXIS_BRAM_115_WIDTH-1:0] ap_bram_115_din0,
    output [S_AXIS_BRAM_115_WIDTH-1:0] ap_bram_115_dout0,
    input [S_AXIS_BRAM_115_WIDTH/8-1:0] ap_bram_115_we0,
    input ap_bram_115_en0,
    input [S_AXIS_BRAM_115_ADDR_WIDTH-1:0] ap_bram_115_addr1,
    input [S_AXIS_BRAM_115_WIDTH-1:0] ap_bram_115_din1,
    output [S_AXIS_BRAM_115_WIDTH-1:0] ap_bram_115_dout1,
    input [S_AXIS_BRAM_115_WIDTH/8-1:0] ap_bram_115_we1,
    input ap_bram_115_en1,
    //input AXI-Stream to FIFO interface 116
    input s_axis_bram_116_aclk,
    input s_axis_bram_116_aresetn,
    input s_axis_bram_116_tlast,
    input s_axis_bram_116_tvalid,
    input [S_AXIS_BRAM_116_DMWIDTH/8-1:0] s_axis_bram_116_tkeep,
    input [S_AXIS_BRAM_116_DMWIDTH/8-1:0] s_axis_bram_116_tstrb,
    input [S_AXIS_BRAM_116_DMWIDTH-1:0] s_axis_bram_116_tdata,
    output s_axis_bram_116_tready,
    input [S_AXIS_BRAM_116_ADDR_WIDTH-1:0] ap_bram_116_addr0,
    input [S_AXIS_BRAM_116_WIDTH-1:0] ap_bram_116_din0,
    output [S_AXIS_BRAM_116_WIDTH-1:0] ap_bram_116_dout0,
    input [S_AXIS_BRAM_116_WIDTH/8-1:0] ap_bram_116_we0,
    input ap_bram_116_en0,
    input [S_AXIS_BRAM_116_ADDR_WIDTH-1:0] ap_bram_116_addr1,
    input [S_AXIS_BRAM_116_WIDTH-1:0] ap_bram_116_din1,
    output [S_AXIS_BRAM_116_WIDTH-1:0] ap_bram_116_dout1,
    input [S_AXIS_BRAM_116_WIDTH/8-1:0] ap_bram_116_we1,
    input ap_bram_116_en1,
    //input AXI-Stream to FIFO interface 117
    input s_axis_bram_117_aclk,
    input s_axis_bram_117_aresetn,
    input s_axis_bram_117_tlast,
    input s_axis_bram_117_tvalid,
    input [S_AXIS_BRAM_117_DMWIDTH/8-1:0] s_axis_bram_117_tkeep,
    input [S_AXIS_BRAM_117_DMWIDTH/8-1:0] s_axis_bram_117_tstrb,
    input [S_AXIS_BRAM_117_DMWIDTH-1:0] s_axis_bram_117_tdata,
    output s_axis_bram_117_tready,
    input [S_AXIS_BRAM_117_ADDR_WIDTH-1:0] ap_bram_117_addr0,
    input [S_AXIS_BRAM_117_WIDTH-1:0] ap_bram_117_din0,
    output [S_AXIS_BRAM_117_WIDTH-1:0] ap_bram_117_dout0,
    input [S_AXIS_BRAM_117_WIDTH/8-1:0] ap_bram_117_we0,
    input ap_bram_117_en0,
    input [S_AXIS_BRAM_117_ADDR_WIDTH-1:0] ap_bram_117_addr1,
    input [S_AXIS_BRAM_117_WIDTH-1:0] ap_bram_117_din1,
    output [S_AXIS_BRAM_117_WIDTH-1:0] ap_bram_117_dout1,
    input [S_AXIS_BRAM_117_WIDTH/8-1:0] ap_bram_117_we1,
    input ap_bram_117_en1,
    //input AXI-Stream to FIFO interface 118
    input s_axis_bram_118_aclk,
    input s_axis_bram_118_aresetn,
    input s_axis_bram_118_tlast,
    input s_axis_bram_118_tvalid,
    input [S_AXIS_BRAM_118_DMWIDTH/8-1:0] s_axis_bram_118_tkeep,
    input [S_AXIS_BRAM_118_DMWIDTH/8-1:0] s_axis_bram_118_tstrb,
    input [S_AXIS_BRAM_118_DMWIDTH-1:0] s_axis_bram_118_tdata,
    output s_axis_bram_118_tready,
    input [S_AXIS_BRAM_118_ADDR_WIDTH-1:0] ap_bram_118_addr0,
    input [S_AXIS_BRAM_118_WIDTH-1:0] ap_bram_118_din0,
    output [S_AXIS_BRAM_118_WIDTH-1:0] ap_bram_118_dout0,
    input [S_AXIS_BRAM_118_WIDTH/8-1:0] ap_bram_118_we0,
    input ap_bram_118_en0,
    input [S_AXIS_BRAM_118_ADDR_WIDTH-1:0] ap_bram_118_addr1,
    input [S_AXIS_BRAM_118_WIDTH-1:0] ap_bram_118_din1,
    output [S_AXIS_BRAM_118_WIDTH-1:0] ap_bram_118_dout1,
    input [S_AXIS_BRAM_118_WIDTH/8-1:0] ap_bram_118_we1,
    input ap_bram_118_en1,
    //input AXI-Stream to FIFO interface 119
    input s_axis_bram_119_aclk,
    input s_axis_bram_119_aresetn,
    input s_axis_bram_119_tlast,
    input s_axis_bram_119_tvalid,
    input [S_AXIS_BRAM_119_DMWIDTH/8-1:0] s_axis_bram_119_tkeep,
    input [S_AXIS_BRAM_119_DMWIDTH/8-1:0] s_axis_bram_119_tstrb,
    input [S_AXIS_BRAM_119_DMWIDTH-1:0] s_axis_bram_119_tdata,
    output s_axis_bram_119_tready,
    input [S_AXIS_BRAM_119_ADDR_WIDTH-1:0] ap_bram_119_addr0,
    input [S_AXIS_BRAM_119_WIDTH-1:0] ap_bram_119_din0,
    output [S_AXIS_BRAM_119_WIDTH-1:0] ap_bram_119_dout0,
    input [S_AXIS_BRAM_119_WIDTH/8-1:0] ap_bram_119_we0,
    input ap_bram_119_en0,
    input [S_AXIS_BRAM_119_ADDR_WIDTH-1:0] ap_bram_119_addr1,
    input [S_AXIS_BRAM_119_WIDTH-1:0] ap_bram_119_din1,
    output [S_AXIS_BRAM_119_WIDTH-1:0] ap_bram_119_dout1,
    input [S_AXIS_BRAM_119_WIDTH/8-1:0] ap_bram_119_we1,
    input ap_bram_119_en1,
    //input AXI-Stream to FIFO interface 120
    input s_axis_bram_120_aclk,
    input s_axis_bram_120_aresetn,
    input s_axis_bram_120_tlast,
    input s_axis_bram_120_tvalid,
    input [S_AXIS_BRAM_120_DMWIDTH/8-1:0] s_axis_bram_120_tkeep,
    input [S_AXIS_BRAM_120_DMWIDTH/8-1:0] s_axis_bram_120_tstrb,
    input [S_AXIS_BRAM_120_DMWIDTH-1:0] s_axis_bram_120_tdata,
    output s_axis_bram_120_tready,
    input [S_AXIS_BRAM_120_ADDR_WIDTH-1:0] ap_bram_120_addr0,
    input [S_AXIS_BRAM_120_WIDTH-1:0] ap_bram_120_din0,
    output [S_AXIS_BRAM_120_WIDTH-1:0] ap_bram_120_dout0,
    input [S_AXIS_BRAM_120_WIDTH/8-1:0] ap_bram_120_we0,
    input ap_bram_120_en0,
    input [S_AXIS_BRAM_120_ADDR_WIDTH-1:0] ap_bram_120_addr1,
    input [S_AXIS_BRAM_120_WIDTH-1:0] ap_bram_120_din1,
    output [S_AXIS_BRAM_120_WIDTH-1:0] ap_bram_120_dout1,
    input [S_AXIS_BRAM_120_WIDTH/8-1:0] ap_bram_120_we1,
    input ap_bram_120_en1,
    //input AXI-Stream to FIFO interface 121
    input s_axis_bram_121_aclk,
    input s_axis_bram_121_aresetn,
    input s_axis_bram_121_tlast,
    input s_axis_bram_121_tvalid,
    input [S_AXIS_BRAM_121_DMWIDTH/8-1:0] s_axis_bram_121_tkeep,
    input [S_AXIS_BRAM_121_DMWIDTH/8-1:0] s_axis_bram_121_tstrb,
    input [S_AXIS_BRAM_121_DMWIDTH-1:0] s_axis_bram_121_tdata,
    output s_axis_bram_121_tready,
    input [S_AXIS_BRAM_121_ADDR_WIDTH-1:0] ap_bram_121_addr0,
    input [S_AXIS_BRAM_121_WIDTH-1:0] ap_bram_121_din0,
    output [S_AXIS_BRAM_121_WIDTH-1:0] ap_bram_121_dout0,
    input [S_AXIS_BRAM_121_WIDTH/8-1:0] ap_bram_121_we0,
    input ap_bram_121_en0,
    input [S_AXIS_BRAM_121_ADDR_WIDTH-1:0] ap_bram_121_addr1,
    input [S_AXIS_BRAM_121_WIDTH-1:0] ap_bram_121_din1,
    output [S_AXIS_BRAM_121_WIDTH-1:0] ap_bram_121_dout1,
    input [S_AXIS_BRAM_121_WIDTH/8-1:0] ap_bram_121_we1,
    input ap_bram_121_en1,
    //input AXI-Stream to FIFO interface 122
    input s_axis_bram_122_aclk,
    input s_axis_bram_122_aresetn,
    input s_axis_bram_122_tlast,
    input s_axis_bram_122_tvalid,
    input [S_AXIS_BRAM_122_DMWIDTH/8-1:0] s_axis_bram_122_tkeep,
    input [S_AXIS_BRAM_122_DMWIDTH/8-1:0] s_axis_bram_122_tstrb,
    input [S_AXIS_BRAM_122_DMWIDTH-1:0] s_axis_bram_122_tdata,
    output s_axis_bram_122_tready,
    input [S_AXIS_BRAM_122_ADDR_WIDTH-1:0] ap_bram_122_addr0,
    input [S_AXIS_BRAM_122_WIDTH-1:0] ap_bram_122_din0,
    output [S_AXIS_BRAM_122_WIDTH-1:0] ap_bram_122_dout0,
    input [S_AXIS_BRAM_122_WIDTH/8-1:0] ap_bram_122_we0,
    input ap_bram_122_en0,
    input [S_AXIS_BRAM_122_ADDR_WIDTH-1:0] ap_bram_122_addr1,
    input [S_AXIS_BRAM_122_WIDTH-1:0] ap_bram_122_din1,
    output [S_AXIS_BRAM_122_WIDTH-1:0] ap_bram_122_dout1,
    input [S_AXIS_BRAM_122_WIDTH/8-1:0] ap_bram_122_we1,
    input ap_bram_122_en1,
    //input AXI-Stream to FIFO interface 123
    input s_axis_bram_123_aclk,
    input s_axis_bram_123_aresetn,
    input s_axis_bram_123_tlast,
    input s_axis_bram_123_tvalid,
    input [S_AXIS_BRAM_123_DMWIDTH/8-1:0] s_axis_bram_123_tkeep,
    input [S_AXIS_BRAM_123_DMWIDTH/8-1:0] s_axis_bram_123_tstrb,
    input [S_AXIS_BRAM_123_DMWIDTH-1:0] s_axis_bram_123_tdata,
    output s_axis_bram_123_tready,
    input [S_AXIS_BRAM_123_ADDR_WIDTH-1:0] ap_bram_123_addr0,
    input [S_AXIS_BRAM_123_WIDTH-1:0] ap_bram_123_din0,
    output [S_AXIS_BRAM_123_WIDTH-1:0] ap_bram_123_dout0,
    input [S_AXIS_BRAM_123_WIDTH/8-1:0] ap_bram_123_we0,
    input ap_bram_123_en0,
    input [S_AXIS_BRAM_123_ADDR_WIDTH-1:0] ap_bram_123_addr1,
    input [S_AXIS_BRAM_123_WIDTH-1:0] ap_bram_123_din1,
    output [S_AXIS_BRAM_123_WIDTH-1:0] ap_bram_123_dout1,
    input [S_AXIS_BRAM_123_WIDTH/8-1:0] ap_bram_123_we1,
    input ap_bram_123_en1,
    //input AXI-Stream to FIFO interface 124
    input s_axis_bram_124_aclk,
    input s_axis_bram_124_aresetn,
    input s_axis_bram_124_tlast,
    input s_axis_bram_124_tvalid,
    input [S_AXIS_BRAM_124_DMWIDTH/8-1:0] s_axis_bram_124_tkeep,
    input [S_AXIS_BRAM_124_DMWIDTH/8-1:0] s_axis_bram_124_tstrb,
    input [S_AXIS_BRAM_124_DMWIDTH-1:0] s_axis_bram_124_tdata,
    output s_axis_bram_124_tready,
    input [S_AXIS_BRAM_124_ADDR_WIDTH-1:0] ap_bram_124_addr0,
    input [S_AXIS_BRAM_124_WIDTH-1:0] ap_bram_124_din0,
    output [S_AXIS_BRAM_124_WIDTH-1:0] ap_bram_124_dout0,
    input [S_AXIS_BRAM_124_WIDTH/8-1:0] ap_bram_124_we0,
    input ap_bram_124_en0,
    input [S_AXIS_BRAM_124_ADDR_WIDTH-1:0] ap_bram_124_addr1,
    input [S_AXIS_BRAM_124_WIDTH-1:0] ap_bram_124_din1,
    output [S_AXIS_BRAM_124_WIDTH-1:0] ap_bram_124_dout1,
    input [S_AXIS_BRAM_124_WIDTH/8-1:0] ap_bram_124_we1,
    input ap_bram_124_en1,
    //input AXI-Stream to FIFO interface 125
    input s_axis_bram_125_aclk,
    input s_axis_bram_125_aresetn,
    input s_axis_bram_125_tlast,
    input s_axis_bram_125_tvalid,
    input [S_AXIS_BRAM_125_DMWIDTH/8-1:0] s_axis_bram_125_tkeep,
    input [S_AXIS_BRAM_125_DMWIDTH/8-1:0] s_axis_bram_125_tstrb,
    input [S_AXIS_BRAM_125_DMWIDTH-1:0] s_axis_bram_125_tdata,
    output s_axis_bram_125_tready,
    input [S_AXIS_BRAM_125_ADDR_WIDTH-1:0] ap_bram_125_addr0,
    input [S_AXIS_BRAM_125_WIDTH-1:0] ap_bram_125_din0,
    output [S_AXIS_BRAM_125_WIDTH-1:0] ap_bram_125_dout0,
    input [S_AXIS_BRAM_125_WIDTH/8-1:0] ap_bram_125_we0,
    input ap_bram_125_en0,
    input [S_AXIS_BRAM_125_ADDR_WIDTH-1:0] ap_bram_125_addr1,
    input [S_AXIS_BRAM_125_WIDTH-1:0] ap_bram_125_din1,
    output [S_AXIS_BRAM_125_WIDTH-1:0] ap_bram_125_dout1,
    input [S_AXIS_BRAM_125_WIDTH/8-1:0] ap_bram_125_we1,
    input ap_bram_125_en1,
    //input AXI-Stream to FIFO interface 126
    input s_axis_bram_126_aclk,
    input s_axis_bram_126_aresetn,
    input s_axis_bram_126_tlast,
    input s_axis_bram_126_tvalid,
    input [S_AXIS_BRAM_126_DMWIDTH/8-1:0] s_axis_bram_126_tkeep,
    input [S_AXIS_BRAM_126_DMWIDTH/8-1:0] s_axis_bram_126_tstrb,
    input [S_AXIS_BRAM_126_DMWIDTH-1:0] s_axis_bram_126_tdata,
    output s_axis_bram_126_tready,
    input [S_AXIS_BRAM_126_ADDR_WIDTH-1:0] ap_bram_126_addr0,
    input [S_AXIS_BRAM_126_WIDTH-1:0] ap_bram_126_din0,
    output [S_AXIS_BRAM_126_WIDTH-1:0] ap_bram_126_dout0,
    input [S_AXIS_BRAM_126_WIDTH/8-1:0] ap_bram_126_we0,
    input ap_bram_126_en0,
    input [S_AXIS_BRAM_126_ADDR_WIDTH-1:0] ap_bram_126_addr1,
    input [S_AXIS_BRAM_126_WIDTH-1:0] ap_bram_126_din1,
    output [S_AXIS_BRAM_126_WIDTH-1:0] ap_bram_126_dout1,
    input [S_AXIS_BRAM_126_WIDTH/8-1:0] ap_bram_126_we1,
    input ap_bram_126_en1,
    //input AXI-Stream to FIFO interface 127
    input s_axis_bram_127_aclk,
    input s_axis_bram_127_aresetn,
    input s_axis_bram_127_tlast,
    input s_axis_bram_127_tvalid,
    input [S_AXIS_BRAM_127_DMWIDTH/8-1:0] s_axis_bram_127_tkeep,
    input [S_AXIS_BRAM_127_DMWIDTH/8-1:0] s_axis_bram_127_tstrb,
    input [S_AXIS_BRAM_127_DMWIDTH-1:0] s_axis_bram_127_tdata,
    output s_axis_bram_127_tready,
    input [S_AXIS_BRAM_127_ADDR_WIDTH-1:0] ap_bram_127_addr0,
    input [S_AXIS_BRAM_127_WIDTH-1:0] ap_bram_127_din0,
    output [S_AXIS_BRAM_127_WIDTH-1:0] ap_bram_127_dout0,
    input [S_AXIS_BRAM_127_WIDTH/8-1:0] ap_bram_127_we0,
    input ap_bram_127_en0,
    input [S_AXIS_BRAM_127_ADDR_WIDTH-1:0] ap_bram_127_addr1,
    input [S_AXIS_BRAM_127_WIDTH-1:0] ap_bram_127_din1,
    output [S_AXIS_BRAM_127_WIDTH-1:0] ap_bram_127_dout1,
    input [S_AXIS_BRAM_127_WIDTH/8-1:0] ap_bram_127_we1,
    input ap_bram_127_en1,
    //-----------------------------------------------------------
    //in-out AXI-Stream output interface 0
    input m_axis_bramio_0_aclk,
    input m_axis_bramio_0_aresetn,
    output m_axis_bramio_0_tlast,
    output m_axis_bramio_0_tvalid,  
    output [M_AXIS_BRAMIO_0_DMWIDTH/8-1:0] m_axis_bramio_0_tkeep,
    output [M_AXIS_BRAMIO_0_DMWIDTH/8-1:0] m_axis_bramio_0_tstrb,
    output [M_AXIS_BRAMIO_0_DMWIDTH-1:0] m_axis_bramio_0_tdata,
    input m_axis_bramio_0_tready,
    //in-out AXI-Stream output interface 1
    input m_axis_bramio_1_aclk,
    input m_axis_bramio_1_aresetn,
    output m_axis_bramio_1_tlast,
    output m_axis_bramio_1_tvalid,  
    output [M_AXIS_BRAMIO_1_DMWIDTH/8-1:0] m_axis_bramio_1_tkeep,
    output [M_AXIS_BRAMIO_1_DMWIDTH/8-1:0] m_axis_bramio_1_tstrb,
    output [M_AXIS_BRAMIO_1_DMWIDTH-1:0] m_axis_bramio_1_tdata,
    input m_axis_bramio_1_tready,
    //in-out AXI-Stream output interface 2
    input m_axis_bramio_2_aclk,
    input m_axis_bramio_2_aresetn,
    output m_axis_bramio_2_tlast,
    output m_axis_bramio_2_tvalid,  
    output [M_AXIS_BRAMIO_2_DMWIDTH/8-1:0] m_axis_bramio_2_tkeep,
    output [M_AXIS_BRAMIO_2_DMWIDTH/8-1:0] m_axis_bramio_2_tstrb,
    output [M_AXIS_BRAMIO_2_DMWIDTH-1:0] m_axis_bramio_2_tdata,
    input m_axis_bramio_2_tready,
    //in-out AXI-Stream output interface 3
    input m_axis_bramio_3_aclk,
    input m_axis_bramio_3_aresetn,
    output m_axis_bramio_3_tlast,
    output m_axis_bramio_3_tvalid,  
    output [M_AXIS_BRAMIO_3_DMWIDTH/8-1:0] m_axis_bramio_3_tkeep,
    output [M_AXIS_BRAMIO_3_DMWIDTH/8-1:0] m_axis_bramio_3_tstrb,
    output [M_AXIS_BRAMIO_3_DMWIDTH-1:0] m_axis_bramio_3_tdata,
    input m_axis_bramio_3_tready,
    //in-out AXI-Stream output interface 4
    input m_axis_bramio_4_aclk,
    input m_axis_bramio_4_aresetn,
    output m_axis_bramio_4_tlast,
    output m_axis_bramio_4_tvalid,  
    output [M_AXIS_BRAMIO_4_DMWIDTH/8-1:0] m_axis_bramio_4_tkeep,
    output [M_AXIS_BRAMIO_4_DMWIDTH/8-1:0] m_axis_bramio_4_tstrb,
    output [M_AXIS_BRAMIO_4_DMWIDTH-1:0] m_axis_bramio_4_tdata,
    input m_axis_bramio_4_tready,
    //in-out AXI-Stream output interface 5
    input m_axis_bramio_5_aclk,
    input m_axis_bramio_5_aresetn,
    output m_axis_bramio_5_tlast,
    output m_axis_bramio_5_tvalid,  
    output [M_AXIS_BRAMIO_5_DMWIDTH/8-1:0] m_axis_bramio_5_tkeep,
    output [M_AXIS_BRAMIO_5_DMWIDTH/8-1:0] m_axis_bramio_5_tstrb,
    output [M_AXIS_BRAMIO_5_DMWIDTH-1:0] m_axis_bramio_5_tdata,
    input m_axis_bramio_5_tready,
    //in-out AXI-Stream output interface 6
    input m_axis_bramio_6_aclk,
    input m_axis_bramio_6_aresetn,
    output m_axis_bramio_6_tlast,
    output m_axis_bramio_6_tvalid,  
    output [M_AXIS_BRAMIO_6_DMWIDTH/8-1:0] m_axis_bramio_6_tkeep,
    output [M_AXIS_BRAMIO_6_DMWIDTH/8-1:0] m_axis_bramio_6_tstrb,
    output [M_AXIS_BRAMIO_6_DMWIDTH-1:0] m_axis_bramio_6_tdata,
    input m_axis_bramio_6_tready,
    //in-out AXI-Stream output interface 7
    input m_axis_bramio_7_aclk,
    input m_axis_bramio_7_aresetn,
    output m_axis_bramio_7_tlast,
    output m_axis_bramio_7_tvalid,  
    output [M_AXIS_BRAMIO_7_DMWIDTH/8-1:0] m_axis_bramio_7_tkeep,
    output [M_AXIS_BRAMIO_7_DMWIDTH/8-1:0] m_axis_bramio_7_tstrb,
    output [M_AXIS_BRAMIO_7_DMWIDTH-1:0] m_axis_bramio_7_tdata,
    input m_axis_bramio_7_tready,
    //in-out AXI-Stream output interface 8
    input m_axis_bramio_8_aclk,
    input m_axis_bramio_8_aresetn,
    output m_axis_bramio_8_tlast,
    output m_axis_bramio_8_tvalid,  
    output [M_AXIS_BRAMIO_8_DMWIDTH/8-1:0] m_axis_bramio_8_tkeep,
    output [M_AXIS_BRAMIO_8_DMWIDTH/8-1:0] m_axis_bramio_8_tstrb,
    output [M_AXIS_BRAMIO_8_DMWIDTH-1:0] m_axis_bramio_8_tdata,
    input m_axis_bramio_8_tready,
    //in-out AXI-Stream output interface 9
    input m_axis_bramio_9_aclk,
    input m_axis_bramio_9_aresetn,
    output m_axis_bramio_9_tlast,
    output m_axis_bramio_9_tvalid,  
    output [M_AXIS_BRAMIO_9_DMWIDTH/8-1:0] m_axis_bramio_9_tkeep,
    output [M_AXIS_BRAMIO_9_DMWIDTH/8-1:0] m_axis_bramio_9_tstrb,
    output [M_AXIS_BRAMIO_9_DMWIDTH-1:0] m_axis_bramio_9_tdata,
    input m_axis_bramio_9_tready,
    //in-out AXI-Stream output interface 10
    input m_axis_bramio_10_aclk,
    input m_axis_bramio_10_aresetn,
    output m_axis_bramio_10_tlast,
    output m_axis_bramio_10_tvalid,  
    output [M_AXIS_BRAMIO_10_DMWIDTH/8-1:0] m_axis_bramio_10_tkeep,
    output [M_AXIS_BRAMIO_10_DMWIDTH/8-1:0] m_axis_bramio_10_tstrb,
    output [M_AXIS_BRAMIO_10_DMWIDTH-1:0] m_axis_bramio_10_tdata,
    input m_axis_bramio_10_tready,
    //in-out AXI-Stream output interface 11
    input m_axis_bramio_11_aclk,
    input m_axis_bramio_11_aresetn,
    output m_axis_bramio_11_tlast,
    output m_axis_bramio_11_tvalid,  
    output [M_AXIS_BRAMIO_11_DMWIDTH/8-1:0] m_axis_bramio_11_tkeep,
    output [M_AXIS_BRAMIO_11_DMWIDTH/8-1:0] m_axis_bramio_11_tstrb,
    output [M_AXIS_BRAMIO_11_DMWIDTH-1:0] m_axis_bramio_11_tdata,
    input m_axis_bramio_11_tready,
    //in-out AXI-Stream output interface 12
    input m_axis_bramio_12_aclk,
    input m_axis_bramio_12_aresetn,
    output m_axis_bramio_12_tlast,
    output m_axis_bramio_12_tvalid,  
    output [M_AXIS_BRAMIO_12_DMWIDTH/8-1:0] m_axis_bramio_12_tkeep,
    output [M_AXIS_BRAMIO_12_DMWIDTH/8-1:0] m_axis_bramio_12_tstrb,
    output [M_AXIS_BRAMIO_12_DMWIDTH-1:0] m_axis_bramio_12_tdata,
    input m_axis_bramio_12_tready,
    //in-out AXI-Stream output interface 13
    input m_axis_bramio_13_aclk,
    input m_axis_bramio_13_aresetn,
    output m_axis_bramio_13_tlast,
    output m_axis_bramio_13_tvalid,  
    output [M_AXIS_BRAMIO_13_DMWIDTH/8-1:0] m_axis_bramio_13_tkeep,
    output [M_AXIS_BRAMIO_13_DMWIDTH/8-1:0] m_axis_bramio_13_tstrb,
    output [M_AXIS_BRAMIO_13_DMWIDTH-1:0] m_axis_bramio_13_tdata,
    input m_axis_bramio_13_tready,
    //in-out AXI-Stream output interface 14
    input m_axis_bramio_14_aclk,
    input m_axis_bramio_14_aresetn,
    output m_axis_bramio_14_tlast,
    output m_axis_bramio_14_tvalid,  
    output [M_AXIS_BRAMIO_14_DMWIDTH/8-1:0] m_axis_bramio_14_tkeep,
    output [M_AXIS_BRAMIO_14_DMWIDTH/8-1:0] m_axis_bramio_14_tstrb,
    output [M_AXIS_BRAMIO_14_DMWIDTH-1:0] m_axis_bramio_14_tdata,
    input m_axis_bramio_14_tready,
    //in-out AXI-Stream output interface 15
    input m_axis_bramio_15_aclk,
    input m_axis_bramio_15_aresetn,
    output m_axis_bramio_15_tlast,
    output m_axis_bramio_15_tvalid,  
    output [M_AXIS_BRAMIO_15_DMWIDTH/8-1:0] m_axis_bramio_15_tkeep,
    output [M_AXIS_BRAMIO_15_DMWIDTH/8-1:0] m_axis_bramio_15_tstrb,
    output [M_AXIS_BRAMIO_15_DMWIDTH-1:0] m_axis_bramio_15_tdata,
    input m_axis_bramio_15_tready,
    //in-out AXI-Stream output interface 16
    input m_axis_bramio_16_aclk,
    input m_axis_bramio_16_aresetn,
    output m_axis_bramio_16_tlast,
    output m_axis_bramio_16_tvalid,  
    output [M_AXIS_BRAMIO_16_DMWIDTH/8-1:0] m_axis_bramio_16_tkeep,
    output [M_AXIS_BRAMIO_16_DMWIDTH/8-1:0] m_axis_bramio_16_tstrb,
    output [M_AXIS_BRAMIO_16_DMWIDTH-1:0] m_axis_bramio_16_tdata,
    input m_axis_bramio_16_tready,
    //in-out AXI-Stream output interface 17
    input m_axis_bramio_17_aclk,
    input m_axis_bramio_17_aresetn,
    output m_axis_bramio_17_tlast,
    output m_axis_bramio_17_tvalid,  
    output [M_AXIS_BRAMIO_17_DMWIDTH/8-1:0] m_axis_bramio_17_tkeep,
    output [M_AXIS_BRAMIO_17_DMWIDTH/8-1:0] m_axis_bramio_17_tstrb,
    output [M_AXIS_BRAMIO_17_DMWIDTH-1:0] m_axis_bramio_17_tdata,
    input m_axis_bramio_17_tready,
    //in-out AXI-Stream output interface 18
    input m_axis_bramio_18_aclk,
    input m_axis_bramio_18_aresetn,
    output m_axis_bramio_18_tlast,
    output m_axis_bramio_18_tvalid,  
    output [M_AXIS_BRAMIO_18_DMWIDTH/8-1:0] m_axis_bramio_18_tkeep,
    output [M_AXIS_BRAMIO_18_DMWIDTH/8-1:0] m_axis_bramio_18_tstrb,
    output [M_AXIS_BRAMIO_18_DMWIDTH-1:0] m_axis_bramio_18_tdata,
    input m_axis_bramio_18_tready,
    //in-out AXI-Stream output interface 19
    input m_axis_bramio_19_aclk,
    input m_axis_bramio_19_aresetn,
    output m_axis_bramio_19_tlast,
    output m_axis_bramio_19_tvalid,  
    output [M_AXIS_BRAMIO_19_DMWIDTH/8-1:0] m_axis_bramio_19_tkeep,
    output [M_AXIS_BRAMIO_19_DMWIDTH/8-1:0] m_axis_bramio_19_tstrb,
    output [M_AXIS_BRAMIO_19_DMWIDTH-1:0] m_axis_bramio_19_tdata,
    input m_axis_bramio_19_tready,
    //in-out AXI-Stream output interface 20
    input m_axis_bramio_20_aclk,
    input m_axis_bramio_20_aresetn,
    output m_axis_bramio_20_tlast,
    output m_axis_bramio_20_tvalid,  
    output [M_AXIS_BRAMIO_20_DMWIDTH/8-1:0] m_axis_bramio_20_tkeep,
    output [M_AXIS_BRAMIO_20_DMWIDTH/8-1:0] m_axis_bramio_20_tstrb,
    output [M_AXIS_BRAMIO_20_DMWIDTH-1:0] m_axis_bramio_20_tdata,
    input m_axis_bramio_20_tready,
    //in-out AXI-Stream output interface 21
    input m_axis_bramio_21_aclk,
    input m_axis_bramio_21_aresetn,
    output m_axis_bramio_21_tlast,
    output m_axis_bramio_21_tvalid,  
    output [M_AXIS_BRAMIO_21_DMWIDTH/8-1:0] m_axis_bramio_21_tkeep,
    output [M_AXIS_BRAMIO_21_DMWIDTH/8-1:0] m_axis_bramio_21_tstrb,
    output [M_AXIS_BRAMIO_21_DMWIDTH-1:0] m_axis_bramio_21_tdata,
    input m_axis_bramio_21_tready,
    //in-out AXI-Stream output interface 22
    input m_axis_bramio_22_aclk,
    input m_axis_bramio_22_aresetn,
    output m_axis_bramio_22_tlast,
    output m_axis_bramio_22_tvalid,  
    output [M_AXIS_BRAMIO_22_DMWIDTH/8-1:0] m_axis_bramio_22_tkeep,
    output [M_AXIS_BRAMIO_22_DMWIDTH/8-1:0] m_axis_bramio_22_tstrb,
    output [M_AXIS_BRAMIO_22_DMWIDTH-1:0] m_axis_bramio_22_tdata,
    input m_axis_bramio_22_tready,
    //in-out AXI-Stream output interface 23
    input m_axis_bramio_23_aclk,
    input m_axis_bramio_23_aresetn,
    output m_axis_bramio_23_tlast,
    output m_axis_bramio_23_tvalid,  
    output [M_AXIS_BRAMIO_23_DMWIDTH/8-1:0] m_axis_bramio_23_tkeep,
    output [M_AXIS_BRAMIO_23_DMWIDTH/8-1:0] m_axis_bramio_23_tstrb,
    output [M_AXIS_BRAMIO_23_DMWIDTH-1:0] m_axis_bramio_23_tdata,
    input m_axis_bramio_23_tready,
    //in-out AXI-Stream output interface 24
    input m_axis_bramio_24_aclk,
    input m_axis_bramio_24_aresetn,
    output m_axis_bramio_24_tlast,
    output m_axis_bramio_24_tvalid,  
    output [M_AXIS_BRAMIO_24_DMWIDTH/8-1:0] m_axis_bramio_24_tkeep,
    output [M_AXIS_BRAMIO_24_DMWIDTH/8-1:0] m_axis_bramio_24_tstrb,
    output [M_AXIS_BRAMIO_24_DMWIDTH-1:0] m_axis_bramio_24_tdata,
    input m_axis_bramio_24_tready,
    //in-out AXI-Stream output interface 25
    input m_axis_bramio_25_aclk,
    input m_axis_bramio_25_aresetn,
    output m_axis_bramio_25_tlast,
    output m_axis_bramio_25_tvalid,  
    output [M_AXIS_BRAMIO_25_DMWIDTH/8-1:0] m_axis_bramio_25_tkeep,
    output [M_AXIS_BRAMIO_25_DMWIDTH/8-1:0] m_axis_bramio_25_tstrb,
    output [M_AXIS_BRAMIO_25_DMWIDTH-1:0] m_axis_bramio_25_tdata,
    input m_axis_bramio_25_tready,
    //in-out AXI-Stream output interface 26
    input m_axis_bramio_26_aclk,
    input m_axis_bramio_26_aresetn,
    output m_axis_bramio_26_tlast,
    output m_axis_bramio_26_tvalid,  
    output [M_AXIS_BRAMIO_26_DMWIDTH/8-1:0] m_axis_bramio_26_tkeep,
    output [M_AXIS_BRAMIO_26_DMWIDTH/8-1:0] m_axis_bramio_26_tstrb,
    output [M_AXIS_BRAMIO_26_DMWIDTH-1:0] m_axis_bramio_26_tdata,
    input m_axis_bramio_26_tready,
    //in-out AXI-Stream output interface 27
    input m_axis_bramio_27_aclk,
    input m_axis_bramio_27_aresetn,
    output m_axis_bramio_27_tlast,
    output m_axis_bramio_27_tvalid,  
    output [M_AXIS_BRAMIO_27_DMWIDTH/8-1:0] m_axis_bramio_27_tkeep,
    output [M_AXIS_BRAMIO_27_DMWIDTH/8-1:0] m_axis_bramio_27_tstrb,
    output [M_AXIS_BRAMIO_27_DMWIDTH-1:0] m_axis_bramio_27_tdata,
    input m_axis_bramio_27_tready,
    //in-out AXI-Stream output interface 28
    input m_axis_bramio_28_aclk,
    input m_axis_bramio_28_aresetn,
    output m_axis_bramio_28_tlast,
    output m_axis_bramio_28_tvalid,  
    output [M_AXIS_BRAMIO_28_DMWIDTH/8-1:0] m_axis_bramio_28_tkeep,
    output [M_AXIS_BRAMIO_28_DMWIDTH/8-1:0] m_axis_bramio_28_tstrb,
    output [M_AXIS_BRAMIO_28_DMWIDTH-1:0] m_axis_bramio_28_tdata,
    input m_axis_bramio_28_tready,
    //in-out AXI-Stream output interface 29
    input m_axis_bramio_29_aclk,
    input m_axis_bramio_29_aresetn,
    output m_axis_bramio_29_tlast,
    output m_axis_bramio_29_tvalid,  
    output [M_AXIS_BRAMIO_29_DMWIDTH/8-1:0] m_axis_bramio_29_tkeep,
    output [M_AXIS_BRAMIO_29_DMWIDTH/8-1:0] m_axis_bramio_29_tstrb,
    output [M_AXIS_BRAMIO_29_DMWIDTH-1:0] m_axis_bramio_29_tdata,
    input m_axis_bramio_29_tready,
    //in-out AXI-Stream output interface 30
    input m_axis_bramio_30_aclk,
    input m_axis_bramio_30_aresetn,
    output m_axis_bramio_30_tlast,
    output m_axis_bramio_30_tvalid,  
    output [M_AXIS_BRAMIO_30_DMWIDTH/8-1:0] m_axis_bramio_30_tkeep,
    output [M_AXIS_BRAMIO_30_DMWIDTH/8-1:0] m_axis_bramio_30_tstrb,
    output [M_AXIS_BRAMIO_30_DMWIDTH-1:0] m_axis_bramio_30_tdata,
    input m_axis_bramio_30_tready,
    //in-out AXI-Stream output interface 31
    input m_axis_bramio_31_aclk,
    input m_axis_bramio_31_aresetn,
    output m_axis_bramio_31_tlast,
    output m_axis_bramio_31_tvalid,  
    output [M_AXIS_BRAMIO_31_DMWIDTH/8-1:0] m_axis_bramio_31_tkeep,
    output [M_AXIS_BRAMIO_31_DMWIDTH/8-1:0] m_axis_bramio_31_tstrb,
    output [M_AXIS_BRAMIO_31_DMWIDTH-1:0] m_axis_bramio_31_tdata,
    input m_axis_bramio_31_tready,
    //in-out AXI-Stream output interface 32
    input m_axis_bramio_32_aclk,
    input m_axis_bramio_32_aresetn,
    output m_axis_bramio_32_tlast,
    output m_axis_bramio_32_tvalid,  
    output [M_AXIS_BRAMIO_32_DMWIDTH/8-1:0] m_axis_bramio_32_tkeep,
    output [M_AXIS_BRAMIO_32_DMWIDTH/8-1:0] m_axis_bramio_32_tstrb,
    output [M_AXIS_BRAMIO_32_DMWIDTH-1:0] m_axis_bramio_32_tdata,
    input m_axis_bramio_32_tready,
    //in-out AXI-Stream output interface 33
    input m_axis_bramio_33_aclk,
    input m_axis_bramio_33_aresetn,
    output m_axis_bramio_33_tlast,
    output m_axis_bramio_33_tvalid,  
    output [M_AXIS_BRAMIO_33_DMWIDTH/8-1:0] m_axis_bramio_33_tkeep,
    output [M_AXIS_BRAMIO_33_DMWIDTH/8-1:0] m_axis_bramio_33_tstrb,
    output [M_AXIS_BRAMIO_33_DMWIDTH-1:0] m_axis_bramio_33_tdata,
    input m_axis_bramio_33_tready,
    //in-out AXI-Stream output interface 34
    input m_axis_bramio_34_aclk,
    input m_axis_bramio_34_aresetn,
    output m_axis_bramio_34_tlast,
    output m_axis_bramio_34_tvalid,  
    output [M_AXIS_BRAMIO_34_DMWIDTH/8-1:0] m_axis_bramio_34_tkeep,
    output [M_AXIS_BRAMIO_34_DMWIDTH/8-1:0] m_axis_bramio_34_tstrb,
    output [M_AXIS_BRAMIO_34_DMWIDTH-1:0] m_axis_bramio_34_tdata,
    input m_axis_bramio_34_tready,
    //in-out AXI-Stream output interface 35
    input m_axis_bramio_35_aclk,
    input m_axis_bramio_35_aresetn,
    output m_axis_bramio_35_tlast,
    output m_axis_bramio_35_tvalid,  
    output [M_AXIS_BRAMIO_35_DMWIDTH/8-1:0] m_axis_bramio_35_tkeep,
    output [M_AXIS_BRAMIO_35_DMWIDTH/8-1:0] m_axis_bramio_35_tstrb,
    output [M_AXIS_BRAMIO_35_DMWIDTH-1:0] m_axis_bramio_35_tdata,
    input m_axis_bramio_35_tready,
    //in-out AXI-Stream output interface 36
    input m_axis_bramio_36_aclk,
    input m_axis_bramio_36_aresetn,
    output m_axis_bramio_36_tlast,
    output m_axis_bramio_36_tvalid,  
    output [M_AXIS_BRAMIO_36_DMWIDTH/8-1:0] m_axis_bramio_36_tkeep,
    output [M_AXIS_BRAMIO_36_DMWIDTH/8-1:0] m_axis_bramio_36_tstrb,
    output [M_AXIS_BRAMIO_36_DMWIDTH-1:0] m_axis_bramio_36_tdata,
    input m_axis_bramio_36_tready,
    //in-out AXI-Stream output interface 37
    input m_axis_bramio_37_aclk,
    input m_axis_bramio_37_aresetn,
    output m_axis_bramio_37_tlast,
    output m_axis_bramio_37_tvalid,  
    output [M_AXIS_BRAMIO_37_DMWIDTH/8-1:0] m_axis_bramio_37_tkeep,
    output [M_AXIS_BRAMIO_37_DMWIDTH/8-1:0] m_axis_bramio_37_tstrb,
    output [M_AXIS_BRAMIO_37_DMWIDTH-1:0] m_axis_bramio_37_tdata,
    input m_axis_bramio_37_tready,
    //in-out AXI-Stream output interface 38
    input m_axis_bramio_38_aclk,
    input m_axis_bramio_38_aresetn,
    output m_axis_bramio_38_tlast,
    output m_axis_bramio_38_tvalid,  
    output [M_AXIS_BRAMIO_38_DMWIDTH/8-1:0] m_axis_bramio_38_tkeep,
    output [M_AXIS_BRAMIO_38_DMWIDTH/8-1:0] m_axis_bramio_38_tstrb,
    output [M_AXIS_BRAMIO_38_DMWIDTH-1:0] m_axis_bramio_38_tdata,
    input m_axis_bramio_38_tready,
    //in-out AXI-Stream output interface 39
    input m_axis_bramio_39_aclk,
    input m_axis_bramio_39_aresetn,
    output m_axis_bramio_39_tlast,
    output m_axis_bramio_39_tvalid,  
    output [M_AXIS_BRAMIO_39_DMWIDTH/8-1:0] m_axis_bramio_39_tkeep,
    output [M_AXIS_BRAMIO_39_DMWIDTH/8-1:0] m_axis_bramio_39_tstrb,
    output [M_AXIS_BRAMIO_39_DMWIDTH-1:0] m_axis_bramio_39_tdata,
    input m_axis_bramio_39_tready,
    //in-out AXI-Stream output interface 40
    input m_axis_bramio_40_aclk,
    input m_axis_bramio_40_aresetn,
    output m_axis_bramio_40_tlast,
    output m_axis_bramio_40_tvalid,  
    output [M_AXIS_BRAMIO_40_DMWIDTH/8-1:0] m_axis_bramio_40_tkeep,
    output [M_AXIS_BRAMIO_40_DMWIDTH/8-1:0] m_axis_bramio_40_tstrb,
    output [M_AXIS_BRAMIO_40_DMWIDTH-1:0] m_axis_bramio_40_tdata,
    input m_axis_bramio_40_tready,
    //in-out AXI-Stream output interface 41
    input m_axis_bramio_41_aclk,
    input m_axis_bramio_41_aresetn,
    output m_axis_bramio_41_tlast,
    output m_axis_bramio_41_tvalid,  
    output [M_AXIS_BRAMIO_41_DMWIDTH/8-1:0] m_axis_bramio_41_tkeep,
    output [M_AXIS_BRAMIO_41_DMWIDTH/8-1:0] m_axis_bramio_41_tstrb,
    output [M_AXIS_BRAMIO_41_DMWIDTH-1:0] m_axis_bramio_41_tdata,
    input m_axis_bramio_41_tready,
    //in-out AXI-Stream output interface 42
    input m_axis_bramio_42_aclk,
    input m_axis_bramio_42_aresetn,
    output m_axis_bramio_42_tlast,
    output m_axis_bramio_42_tvalid,  
    output [M_AXIS_BRAMIO_42_DMWIDTH/8-1:0] m_axis_bramio_42_tkeep,
    output [M_AXIS_BRAMIO_42_DMWIDTH/8-1:0] m_axis_bramio_42_tstrb,
    output [M_AXIS_BRAMIO_42_DMWIDTH-1:0] m_axis_bramio_42_tdata,
    input m_axis_bramio_42_tready,
    //in-out AXI-Stream output interface 43
    input m_axis_bramio_43_aclk,
    input m_axis_bramio_43_aresetn,
    output m_axis_bramio_43_tlast,
    output m_axis_bramio_43_tvalid,  
    output [M_AXIS_BRAMIO_43_DMWIDTH/8-1:0] m_axis_bramio_43_tkeep,
    output [M_AXIS_BRAMIO_43_DMWIDTH/8-1:0] m_axis_bramio_43_tstrb,
    output [M_AXIS_BRAMIO_43_DMWIDTH-1:0] m_axis_bramio_43_tdata,
    input m_axis_bramio_43_tready,
    //in-out AXI-Stream output interface 44
    input m_axis_bramio_44_aclk,
    input m_axis_bramio_44_aresetn,
    output m_axis_bramio_44_tlast,
    output m_axis_bramio_44_tvalid,  
    output [M_AXIS_BRAMIO_44_DMWIDTH/8-1:0] m_axis_bramio_44_tkeep,
    output [M_AXIS_BRAMIO_44_DMWIDTH/8-1:0] m_axis_bramio_44_tstrb,
    output [M_AXIS_BRAMIO_44_DMWIDTH-1:0] m_axis_bramio_44_tdata,
    input m_axis_bramio_44_tready,
    //in-out AXI-Stream output interface 45
    input m_axis_bramio_45_aclk,
    input m_axis_bramio_45_aresetn,
    output m_axis_bramio_45_tlast,
    output m_axis_bramio_45_tvalid,  
    output [M_AXIS_BRAMIO_45_DMWIDTH/8-1:0] m_axis_bramio_45_tkeep,
    output [M_AXIS_BRAMIO_45_DMWIDTH/8-1:0] m_axis_bramio_45_tstrb,
    output [M_AXIS_BRAMIO_45_DMWIDTH-1:0] m_axis_bramio_45_tdata,
    input m_axis_bramio_45_tready,
    //in-out AXI-Stream output interface 46
    input m_axis_bramio_46_aclk,
    input m_axis_bramio_46_aresetn,
    output m_axis_bramio_46_tlast,
    output m_axis_bramio_46_tvalid,  
    output [M_AXIS_BRAMIO_46_DMWIDTH/8-1:0] m_axis_bramio_46_tkeep,
    output [M_AXIS_BRAMIO_46_DMWIDTH/8-1:0] m_axis_bramio_46_tstrb,
    output [M_AXIS_BRAMIO_46_DMWIDTH-1:0] m_axis_bramio_46_tdata,
    input m_axis_bramio_46_tready,
    //in-out AXI-Stream output interface 47
    input m_axis_bramio_47_aclk,
    input m_axis_bramio_47_aresetn,
    output m_axis_bramio_47_tlast,
    output m_axis_bramio_47_tvalid,  
    output [M_AXIS_BRAMIO_47_DMWIDTH/8-1:0] m_axis_bramio_47_tkeep,
    output [M_AXIS_BRAMIO_47_DMWIDTH/8-1:0] m_axis_bramio_47_tstrb,
    output [M_AXIS_BRAMIO_47_DMWIDTH-1:0] m_axis_bramio_47_tdata,
    input m_axis_bramio_47_tready,
    //in-out AXI-Stream output interface 48
    input m_axis_bramio_48_aclk,
    input m_axis_bramio_48_aresetn,
    output m_axis_bramio_48_tlast,
    output m_axis_bramio_48_tvalid,  
    output [M_AXIS_BRAMIO_48_DMWIDTH/8-1:0] m_axis_bramio_48_tkeep,
    output [M_AXIS_BRAMIO_48_DMWIDTH/8-1:0] m_axis_bramio_48_tstrb,
    output [M_AXIS_BRAMIO_48_DMWIDTH-1:0] m_axis_bramio_48_tdata,
    input m_axis_bramio_48_tready,
    //in-out AXI-Stream output interface 49
    input m_axis_bramio_49_aclk,
    input m_axis_bramio_49_aresetn,
    output m_axis_bramio_49_tlast,
    output m_axis_bramio_49_tvalid,  
    output [M_AXIS_BRAMIO_49_DMWIDTH/8-1:0] m_axis_bramio_49_tkeep,
    output [M_AXIS_BRAMIO_49_DMWIDTH/8-1:0] m_axis_bramio_49_tstrb,
    output [M_AXIS_BRAMIO_49_DMWIDTH-1:0] m_axis_bramio_49_tdata,
    input m_axis_bramio_49_tready,
    //in-out AXI-Stream output interface 50
    input m_axis_bramio_50_aclk,
    input m_axis_bramio_50_aresetn,
    output m_axis_bramio_50_tlast,
    output m_axis_bramio_50_tvalid,  
    output [M_AXIS_BRAMIO_50_DMWIDTH/8-1:0] m_axis_bramio_50_tkeep,
    output [M_AXIS_BRAMIO_50_DMWIDTH/8-1:0] m_axis_bramio_50_tstrb,
    output [M_AXIS_BRAMIO_50_DMWIDTH-1:0] m_axis_bramio_50_tdata,
    input m_axis_bramio_50_tready,
    //in-out AXI-Stream output interface 51
    input m_axis_bramio_51_aclk,
    input m_axis_bramio_51_aresetn,
    output m_axis_bramio_51_tlast,
    output m_axis_bramio_51_tvalid,  
    output [M_AXIS_BRAMIO_51_DMWIDTH/8-1:0] m_axis_bramio_51_tkeep,
    output [M_AXIS_BRAMIO_51_DMWIDTH/8-1:0] m_axis_bramio_51_tstrb,
    output [M_AXIS_BRAMIO_51_DMWIDTH-1:0] m_axis_bramio_51_tdata,
    input m_axis_bramio_51_tready,
    //in-out AXI-Stream output interface 52
    input m_axis_bramio_52_aclk,
    input m_axis_bramio_52_aresetn,
    output m_axis_bramio_52_tlast,
    output m_axis_bramio_52_tvalid,  
    output [M_AXIS_BRAMIO_52_DMWIDTH/8-1:0] m_axis_bramio_52_tkeep,
    output [M_AXIS_BRAMIO_52_DMWIDTH/8-1:0] m_axis_bramio_52_tstrb,
    output [M_AXIS_BRAMIO_52_DMWIDTH-1:0] m_axis_bramio_52_tdata,
    input m_axis_bramio_52_tready,
    //in-out AXI-Stream output interface 53
    input m_axis_bramio_53_aclk,
    input m_axis_bramio_53_aresetn,
    output m_axis_bramio_53_tlast,
    output m_axis_bramio_53_tvalid,  
    output [M_AXIS_BRAMIO_53_DMWIDTH/8-1:0] m_axis_bramio_53_tkeep,
    output [M_AXIS_BRAMIO_53_DMWIDTH/8-1:0] m_axis_bramio_53_tstrb,
    output [M_AXIS_BRAMIO_53_DMWIDTH-1:0] m_axis_bramio_53_tdata,
    input m_axis_bramio_53_tready,
    //in-out AXI-Stream output interface 54
    input m_axis_bramio_54_aclk,
    input m_axis_bramio_54_aresetn,
    output m_axis_bramio_54_tlast,
    output m_axis_bramio_54_tvalid,  
    output [M_AXIS_BRAMIO_54_DMWIDTH/8-1:0] m_axis_bramio_54_tkeep,
    output [M_AXIS_BRAMIO_54_DMWIDTH/8-1:0] m_axis_bramio_54_tstrb,
    output [M_AXIS_BRAMIO_54_DMWIDTH-1:0] m_axis_bramio_54_tdata,
    input m_axis_bramio_54_tready,
    //in-out AXI-Stream output interface 55
    input m_axis_bramio_55_aclk,
    input m_axis_bramio_55_aresetn,
    output m_axis_bramio_55_tlast,
    output m_axis_bramio_55_tvalid,  
    output [M_AXIS_BRAMIO_55_DMWIDTH/8-1:0] m_axis_bramio_55_tkeep,
    output [M_AXIS_BRAMIO_55_DMWIDTH/8-1:0] m_axis_bramio_55_tstrb,
    output [M_AXIS_BRAMIO_55_DMWIDTH-1:0] m_axis_bramio_55_tdata,
    input m_axis_bramio_55_tready,
    //in-out AXI-Stream output interface 56
    input m_axis_bramio_56_aclk,
    input m_axis_bramio_56_aresetn,
    output m_axis_bramio_56_tlast,
    output m_axis_bramio_56_tvalid,  
    output [M_AXIS_BRAMIO_56_DMWIDTH/8-1:0] m_axis_bramio_56_tkeep,
    output [M_AXIS_BRAMIO_56_DMWIDTH/8-1:0] m_axis_bramio_56_tstrb,
    output [M_AXIS_BRAMIO_56_DMWIDTH-1:0] m_axis_bramio_56_tdata,
    input m_axis_bramio_56_tready,
    //in-out AXI-Stream output interface 57
    input m_axis_bramio_57_aclk,
    input m_axis_bramio_57_aresetn,
    output m_axis_bramio_57_tlast,
    output m_axis_bramio_57_tvalid,  
    output [M_AXIS_BRAMIO_57_DMWIDTH/8-1:0] m_axis_bramio_57_tkeep,
    output [M_AXIS_BRAMIO_57_DMWIDTH/8-1:0] m_axis_bramio_57_tstrb,
    output [M_AXIS_BRAMIO_57_DMWIDTH-1:0] m_axis_bramio_57_tdata,
    input m_axis_bramio_57_tready,
    //in-out AXI-Stream output interface 58
    input m_axis_bramio_58_aclk,
    input m_axis_bramio_58_aresetn,
    output m_axis_bramio_58_tlast,
    output m_axis_bramio_58_tvalid,  
    output [M_AXIS_BRAMIO_58_DMWIDTH/8-1:0] m_axis_bramio_58_tkeep,
    output [M_AXIS_BRAMIO_58_DMWIDTH/8-1:0] m_axis_bramio_58_tstrb,
    output [M_AXIS_BRAMIO_58_DMWIDTH-1:0] m_axis_bramio_58_tdata,
    input m_axis_bramio_58_tready,
    //in-out AXI-Stream output interface 59
    input m_axis_bramio_59_aclk,
    input m_axis_bramio_59_aresetn,
    output m_axis_bramio_59_tlast,
    output m_axis_bramio_59_tvalid,  
    output [M_AXIS_BRAMIO_59_DMWIDTH/8-1:0] m_axis_bramio_59_tkeep,
    output [M_AXIS_BRAMIO_59_DMWIDTH/8-1:0] m_axis_bramio_59_tstrb,
    output [M_AXIS_BRAMIO_59_DMWIDTH-1:0] m_axis_bramio_59_tdata,
    input m_axis_bramio_59_tready,
    //in-out AXI-Stream output interface 60
    input m_axis_bramio_60_aclk,
    input m_axis_bramio_60_aresetn,
    output m_axis_bramio_60_tlast,
    output m_axis_bramio_60_tvalid,  
    output [M_AXIS_BRAMIO_60_DMWIDTH/8-1:0] m_axis_bramio_60_tkeep,
    output [M_AXIS_BRAMIO_60_DMWIDTH/8-1:0] m_axis_bramio_60_tstrb,
    output [M_AXIS_BRAMIO_60_DMWIDTH-1:0] m_axis_bramio_60_tdata,
    input m_axis_bramio_60_tready,
    //in-out AXI-Stream output interface 61
    input m_axis_bramio_61_aclk,
    input m_axis_bramio_61_aresetn,
    output m_axis_bramio_61_tlast,
    output m_axis_bramio_61_tvalid,  
    output [M_AXIS_BRAMIO_61_DMWIDTH/8-1:0] m_axis_bramio_61_tkeep,
    output [M_AXIS_BRAMIO_61_DMWIDTH/8-1:0] m_axis_bramio_61_tstrb,
    output [M_AXIS_BRAMIO_61_DMWIDTH-1:0] m_axis_bramio_61_tdata,
    input m_axis_bramio_61_tready,
    //in-out AXI-Stream output interface 62
    input m_axis_bramio_62_aclk,
    input m_axis_bramio_62_aresetn,
    output m_axis_bramio_62_tlast,
    output m_axis_bramio_62_tvalid,  
    output [M_AXIS_BRAMIO_62_DMWIDTH/8-1:0] m_axis_bramio_62_tkeep,
    output [M_AXIS_BRAMIO_62_DMWIDTH/8-1:0] m_axis_bramio_62_tstrb,
    output [M_AXIS_BRAMIO_62_DMWIDTH-1:0] m_axis_bramio_62_tdata,
    input m_axis_bramio_62_tready,
    //in-out AXI-Stream output interface 63
    input m_axis_bramio_63_aclk,
    input m_axis_bramio_63_aresetn,
    output m_axis_bramio_63_tlast,
    output m_axis_bramio_63_tvalid,  
    output [M_AXIS_BRAMIO_63_DMWIDTH/8-1:0] m_axis_bramio_63_tkeep,
    output [M_AXIS_BRAMIO_63_DMWIDTH/8-1:0] m_axis_bramio_63_tstrb,
    output [M_AXIS_BRAMIO_63_DMWIDTH-1:0] m_axis_bramio_63_tdata,
    input m_axis_bramio_63_tready,
    //in-out AXI-Stream output interface 64
    input m_axis_bramio_64_aclk,
    input m_axis_bramio_64_aresetn,
    output m_axis_bramio_64_tlast,
    output m_axis_bramio_64_tvalid,  
    output [M_AXIS_BRAMIO_64_DMWIDTH/8-1:0] m_axis_bramio_64_tkeep,
    output [M_AXIS_BRAMIO_64_DMWIDTH/8-1:0] m_axis_bramio_64_tstrb,
    output [M_AXIS_BRAMIO_64_DMWIDTH-1:0] m_axis_bramio_64_tdata,
    input m_axis_bramio_64_tready,
    //in-out AXI-Stream output interface 65
    input m_axis_bramio_65_aclk,
    input m_axis_bramio_65_aresetn,
    output m_axis_bramio_65_tlast,
    output m_axis_bramio_65_tvalid,  
    output [M_AXIS_BRAMIO_65_DMWIDTH/8-1:0] m_axis_bramio_65_tkeep,
    output [M_AXIS_BRAMIO_65_DMWIDTH/8-1:0] m_axis_bramio_65_tstrb,
    output [M_AXIS_BRAMIO_65_DMWIDTH-1:0] m_axis_bramio_65_tdata,
    input m_axis_bramio_65_tready,
    //in-out AXI-Stream output interface 66
    input m_axis_bramio_66_aclk,
    input m_axis_bramio_66_aresetn,
    output m_axis_bramio_66_tlast,
    output m_axis_bramio_66_tvalid,  
    output [M_AXIS_BRAMIO_66_DMWIDTH/8-1:0] m_axis_bramio_66_tkeep,
    output [M_AXIS_BRAMIO_66_DMWIDTH/8-1:0] m_axis_bramio_66_tstrb,
    output [M_AXIS_BRAMIO_66_DMWIDTH-1:0] m_axis_bramio_66_tdata,
    input m_axis_bramio_66_tready,
    //in-out AXI-Stream output interface 67
    input m_axis_bramio_67_aclk,
    input m_axis_bramio_67_aresetn,
    output m_axis_bramio_67_tlast,
    output m_axis_bramio_67_tvalid,  
    output [M_AXIS_BRAMIO_67_DMWIDTH/8-1:0] m_axis_bramio_67_tkeep,
    output [M_AXIS_BRAMIO_67_DMWIDTH/8-1:0] m_axis_bramio_67_tstrb,
    output [M_AXIS_BRAMIO_67_DMWIDTH-1:0] m_axis_bramio_67_tdata,
    input m_axis_bramio_67_tready,
    //in-out AXI-Stream output interface 68
    input m_axis_bramio_68_aclk,
    input m_axis_bramio_68_aresetn,
    output m_axis_bramio_68_tlast,
    output m_axis_bramio_68_tvalid,  
    output [M_AXIS_BRAMIO_68_DMWIDTH/8-1:0] m_axis_bramio_68_tkeep,
    output [M_AXIS_BRAMIO_68_DMWIDTH/8-1:0] m_axis_bramio_68_tstrb,
    output [M_AXIS_BRAMIO_68_DMWIDTH-1:0] m_axis_bramio_68_tdata,
    input m_axis_bramio_68_tready,
    //in-out AXI-Stream output interface 69
    input m_axis_bramio_69_aclk,
    input m_axis_bramio_69_aresetn,
    output m_axis_bramio_69_tlast,
    output m_axis_bramio_69_tvalid,  
    output [M_AXIS_BRAMIO_69_DMWIDTH/8-1:0] m_axis_bramio_69_tkeep,
    output [M_AXIS_BRAMIO_69_DMWIDTH/8-1:0] m_axis_bramio_69_tstrb,
    output [M_AXIS_BRAMIO_69_DMWIDTH-1:0] m_axis_bramio_69_tdata,
    input m_axis_bramio_69_tready,
    //in-out AXI-Stream output interface 70
    input m_axis_bramio_70_aclk,
    input m_axis_bramio_70_aresetn,
    output m_axis_bramio_70_tlast,
    output m_axis_bramio_70_tvalid,  
    output [M_AXIS_BRAMIO_70_DMWIDTH/8-1:0] m_axis_bramio_70_tkeep,
    output [M_AXIS_BRAMIO_70_DMWIDTH/8-1:0] m_axis_bramio_70_tstrb,
    output [M_AXIS_BRAMIO_70_DMWIDTH-1:0] m_axis_bramio_70_tdata,
    input m_axis_bramio_70_tready,
    //in-out AXI-Stream output interface 71
    input m_axis_bramio_71_aclk,
    input m_axis_bramio_71_aresetn,
    output m_axis_bramio_71_tlast,
    output m_axis_bramio_71_tvalid,  
    output [M_AXIS_BRAMIO_71_DMWIDTH/8-1:0] m_axis_bramio_71_tkeep,
    output [M_AXIS_BRAMIO_71_DMWIDTH/8-1:0] m_axis_bramio_71_tstrb,
    output [M_AXIS_BRAMIO_71_DMWIDTH-1:0] m_axis_bramio_71_tdata,
    input m_axis_bramio_71_tready,
    //in-out AXI-Stream output interface 72
    input m_axis_bramio_72_aclk,
    input m_axis_bramio_72_aresetn,
    output m_axis_bramio_72_tlast,
    output m_axis_bramio_72_tvalid,  
    output [M_AXIS_BRAMIO_72_DMWIDTH/8-1:0] m_axis_bramio_72_tkeep,
    output [M_AXIS_BRAMIO_72_DMWIDTH/8-1:0] m_axis_bramio_72_tstrb,
    output [M_AXIS_BRAMIO_72_DMWIDTH-1:0] m_axis_bramio_72_tdata,
    input m_axis_bramio_72_tready,
    //in-out AXI-Stream output interface 73
    input m_axis_bramio_73_aclk,
    input m_axis_bramio_73_aresetn,
    output m_axis_bramio_73_tlast,
    output m_axis_bramio_73_tvalid,  
    output [M_AXIS_BRAMIO_73_DMWIDTH/8-1:0] m_axis_bramio_73_tkeep,
    output [M_AXIS_BRAMIO_73_DMWIDTH/8-1:0] m_axis_bramio_73_tstrb,
    output [M_AXIS_BRAMIO_73_DMWIDTH-1:0] m_axis_bramio_73_tdata,
    input m_axis_bramio_73_tready,
    //in-out AXI-Stream output interface 74
    input m_axis_bramio_74_aclk,
    input m_axis_bramio_74_aresetn,
    output m_axis_bramio_74_tlast,
    output m_axis_bramio_74_tvalid,  
    output [M_AXIS_BRAMIO_74_DMWIDTH/8-1:0] m_axis_bramio_74_tkeep,
    output [M_AXIS_BRAMIO_74_DMWIDTH/8-1:0] m_axis_bramio_74_tstrb,
    output [M_AXIS_BRAMIO_74_DMWIDTH-1:0] m_axis_bramio_74_tdata,
    input m_axis_bramio_74_tready,
    //in-out AXI-Stream output interface 75
    input m_axis_bramio_75_aclk,
    input m_axis_bramio_75_aresetn,
    output m_axis_bramio_75_tlast,
    output m_axis_bramio_75_tvalid,  
    output [M_AXIS_BRAMIO_75_DMWIDTH/8-1:0] m_axis_bramio_75_tkeep,
    output [M_AXIS_BRAMIO_75_DMWIDTH/8-1:0] m_axis_bramio_75_tstrb,
    output [M_AXIS_BRAMIO_75_DMWIDTH-1:0] m_axis_bramio_75_tdata,
    input m_axis_bramio_75_tready,
    //in-out AXI-Stream output interface 76
    input m_axis_bramio_76_aclk,
    input m_axis_bramio_76_aresetn,
    output m_axis_bramio_76_tlast,
    output m_axis_bramio_76_tvalid,  
    output [M_AXIS_BRAMIO_76_DMWIDTH/8-1:0] m_axis_bramio_76_tkeep,
    output [M_AXIS_BRAMIO_76_DMWIDTH/8-1:0] m_axis_bramio_76_tstrb,
    output [M_AXIS_BRAMIO_76_DMWIDTH-1:0] m_axis_bramio_76_tdata,
    input m_axis_bramio_76_tready,
    //in-out AXI-Stream output interface 77
    input m_axis_bramio_77_aclk,
    input m_axis_bramio_77_aresetn,
    output m_axis_bramio_77_tlast,
    output m_axis_bramio_77_tvalid,  
    output [M_AXIS_BRAMIO_77_DMWIDTH/8-1:0] m_axis_bramio_77_tkeep,
    output [M_AXIS_BRAMIO_77_DMWIDTH/8-1:0] m_axis_bramio_77_tstrb,
    output [M_AXIS_BRAMIO_77_DMWIDTH-1:0] m_axis_bramio_77_tdata,
    input m_axis_bramio_77_tready,
    //in-out AXI-Stream output interface 78
    input m_axis_bramio_78_aclk,
    input m_axis_bramio_78_aresetn,
    output m_axis_bramio_78_tlast,
    output m_axis_bramio_78_tvalid,  
    output [M_AXIS_BRAMIO_78_DMWIDTH/8-1:0] m_axis_bramio_78_tkeep,
    output [M_AXIS_BRAMIO_78_DMWIDTH/8-1:0] m_axis_bramio_78_tstrb,
    output [M_AXIS_BRAMIO_78_DMWIDTH-1:0] m_axis_bramio_78_tdata,
    input m_axis_bramio_78_tready,
    //in-out AXI-Stream output interface 79
    input m_axis_bramio_79_aclk,
    input m_axis_bramio_79_aresetn,
    output m_axis_bramio_79_tlast,
    output m_axis_bramio_79_tvalid,  
    output [M_AXIS_BRAMIO_79_DMWIDTH/8-1:0] m_axis_bramio_79_tkeep,
    output [M_AXIS_BRAMIO_79_DMWIDTH/8-1:0] m_axis_bramio_79_tstrb,
    output [M_AXIS_BRAMIO_79_DMWIDTH-1:0] m_axis_bramio_79_tdata,
    input m_axis_bramio_79_tready,
    //in-out AXI-Stream output interface 80
    input m_axis_bramio_80_aclk,
    input m_axis_bramio_80_aresetn,
    output m_axis_bramio_80_tlast,
    output m_axis_bramio_80_tvalid,  
    output [M_AXIS_BRAMIO_80_DMWIDTH/8-1:0] m_axis_bramio_80_tkeep,
    output [M_AXIS_BRAMIO_80_DMWIDTH/8-1:0] m_axis_bramio_80_tstrb,
    output [M_AXIS_BRAMIO_80_DMWIDTH-1:0] m_axis_bramio_80_tdata,
    input m_axis_bramio_80_tready,
    //in-out AXI-Stream output interface 81
    input m_axis_bramio_81_aclk,
    input m_axis_bramio_81_aresetn,
    output m_axis_bramio_81_tlast,
    output m_axis_bramio_81_tvalid,  
    output [M_AXIS_BRAMIO_81_DMWIDTH/8-1:0] m_axis_bramio_81_tkeep,
    output [M_AXIS_BRAMIO_81_DMWIDTH/8-1:0] m_axis_bramio_81_tstrb,
    output [M_AXIS_BRAMIO_81_DMWIDTH-1:0] m_axis_bramio_81_tdata,
    input m_axis_bramio_81_tready,
    //in-out AXI-Stream output interface 82
    input m_axis_bramio_82_aclk,
    input m_axis_bramio_82_aresetn,
    output m_axis_bramio_82_tlast,
    output m_axis_bramio_82_tvalid,  
    output [M_AXIS_BRAMIO_82_DMWIDTH/8-1:0] m_axis_bramio_82_tkeep,
    output [M_AXIS_BRAMIO_82_DMWIDTH/8-1:0] m_axis_bramio_82_tstrb,
    output [M_AXIS_BRAMIO_82_DMWIDTH-1:0] m_axis_bramio_82_tdata,
    input m_axis_bramio_82_tready,
    //in-out AXI-Stream output interface 83
    input m_axis_bramio_83_aclk,
    input m_axis_bramio_83_aresetn,
    output m_axis_bramio_83_tlast,
    output m_axis_bramio_83_tvalid,  
    output [M_AXIS_BRAMIO_83_DMWIDTH/8-1:0] m_axis_bramio_83_tkeep,
    output [M_AXIS_BRAMIO_83_DMWIDTH/8-1:0] m_axis_bramio_83_tstrb,
    output [M_AXIS_BRAMIO_83_DMWIDTH-1:0] m_axis_bramio_83_tdata,
    input m_axis_bramio_83_tready,
    //in-out AXI-Stream output interface 84
    input m_axis_bramio_84_aclk,
    input m_axis_bramio_84_aresetn,
    output m_axis_bramio_84_tlast,
    output m_axis_bramio_84_tvalid,  
    output [M_AXIS_BRAMIO_84_DMWIDTH/8-1:0] m_axis_bramio_84_tkeep,
    output [M_AXIS_BRAMIO_84_DMWIDTH/8-1:0] m_axis_bramio_84_tstrb,
    output [M_AXIS_BRAMIO_84_DMWIDTH-1:0] m_axis_bramio_84_tdata,
    input m_axis_bramio_84_tready,
    //in-out AXI-Stream output interface 85
    input m_axis_bramio_85_aclk,
    input m_axis_bramio_85_aresetn,
    output m_axis_bramio_85_tlast,
    output m_axis_bramio_85_tvalid,  
    output [M_AXIS_BRAMIO_85_DMWIDTH/8-1:0] m_axis_bramio_85_tkeep,
    output [M_AXIS_BRAMIO_85_DMWIDTH/8-1:0] m_axis_bramio_85_tstrb,
    output [M_AXIS_BRAMIO_85_DMWIDTH-1:0] m_axis_bramio_85_tdata,
    input m_axis_bramio_85_tready,
    //in-out AXI-Stream output interface 86
    input m_axis_bramio_86_aclk,
    input m_axis_bramio_86_aresetn,
    output m_axis_bramio_86_tlast,
    output m_axis_bramio_86_tvalid,  
    output [M_AXIS_BRAMIO_86_DMWIDTH/8-1:0] m_axis_bramio_86_tkeep,
    output [M_AXIS_BRAMIO_86_DMWIDTH/8-1:0] m_axis_bramio_86_tstrb,
    output [M_AXIS_BRAMIO_86_DMWIDTH-1:0] m_axis_bramio_86_tdata,
    input m_axis_bramio_86_tready,
    //in-out AXI-Stream output interface 87
    input m_axis_bramio_87_aclk,
    input m_axis_bramio_87_aresetn,
    output m_axis_bramio_87_tlast,
    output m_axis_bramio_87_tvalid,  
    output [M_AXIS_BRAMIO_87_DMWIDTH/8-1:0] m_axis_bramio_87_tkeep,
    output [M_AXIS_BRAMIO_87_DMWIDTH/8-1:0] m_axis_bramio_87_tstrb,
    output [M_AXIS_BRAMIO_87_DMWIDTH-1:0] m_axis_bramio_87_tdata,
    input m_axis_bramio_87_tready,
    //in-out AXI-Stream output interface 88
    input m_axis_bramio_88_aclk,
    input m_axis_bramio_88_aresetn,
    output m_axis_bramio_88_tlast,
    output m_axis_bramio_88_tvalid,  
    output [M_AXIS_BRAMIO_88_DMWIDTH/8-1:0] m_axis_bramio_88_tkeep,
    output [M_AXIS_BRAMIO_88_DMWIDTH/8-1:0] m_axis_bramio_88_tstrb,
    output [M_AXIS_BRAMIO_88_DMWIDTH-1:0] m_axis_bramio_88_tdata,
    input m_axis_bramio_88_tready,
    //in-out AXI-Stream output interface 89
    input m_axis_bramio_89_aclk,
    input m_axis_bramio_89_aresetn,
    output m_axis_bramio_89_tlast,
    output m_axis_bramio_89_tvalid,  
    output [M_AXIS_BRAMIO_89_DMWIDTH/8-1:0] m_axis_bramio_89_tkeep,
    output [M_AXIS_BRAMIO_89_DMWIDTH/8-1:0] m_axis_bramio_89_tstrb,
    output [M_AXIS_BRAMIO_89_DMWIDTH-1:0] m_axis_bramio_89_tdata,
    input m_axis_bramio_89_tready,
    //in-out AXI-Stream output interface 90
    input m_axis_bramio_90_aclk,
    input m_axis_bramio_90_aresetn,
    output m_axis_bramio_90_tlast,
    output m_axis_bramio_90_tvalid,  
    output [M_AXIS_BRAMIO_90_DMWIDTH/8-1:0] m_axis_bramio_90_tkeep,
    output [M_AXIS_BRAMIO_90_DMWIDTH/8-1:0] m_axis_bramio_90_tstrb,
    output [M_AXIS_BRAMIO_90_DMWIDTH-1:0] m_axis_bramio_90_tdata,
    input m_axis_bramio_90_tready,
    //in-out AXI-Stream output interface 91
    input m_axis_bramio_91_aclk,
    input m_axis_bramio_91_aresetn,
    output m_axis_bramio_91_tlast,
    output m_axis_bramio_91_tvalid,  
    output [M_AXIS_BRAMIO_91_DMWIDTH/8-1:0] m_axis_bramio_91_tkeep,
    output [M_AXIS_BRAMIO_91_DMWIDTH/8-1:0] m_axis_bramio_91_tstrb,
    output [M_AXIS_BRAMIO_91_DMWIDTH-1:0] m_axis_bramio_91_tdata,
    input m_axis_bramio_91_tready,
    //in-out AXI-Stream output interface 92
    input m_axis_bramio_92_aclk,
    input m_axis_bramio_92_aresetn,
    output m_axis_bramio_92_tlast,
    output m_axis_bramio_92_tvalid,  
    output [M_AXIS_BRAMIO_92_DMWIDTH/8-1:0] m_axis_bramio_92_tkeep,
    output [M_AXIS_BRAMIO_92_DMWIDTH/8-1:0] m_axis_bramio_92_tstrb,
    output [M_AXIS_BRAMIO_92_DMWIDTH-1:0] m_axis_bramio_92_tdata,
    input m_axis_bramio_92_tready,
    //in-out AXI-Stream output interface 93
    input m_axis_bramio_93_aclk,
    input m_axis_bramio_93_aresetn,
    output m_axis_bramio_93_tlast,
    output m_axis_bramio_93_tvalid,  
    output [M_AXIS_BRAMIO_93_DMWIDTH/8-1:0] m_axis_bramio_93_tkeep,
    output [M_AXIS_BRAMIO_93_DMWIDTH/8-1:0] m_axis_bramio_93_tstrb,
    output [M_AXIS_BRAMIO_93_DMWIDTH-1:0] m_axis_bramio_93_tdata,
    input m_axis_bramio_93_tready,
    //in-out AXI-Stream output interface 94
    input m_axis_bramio_94_aclk,
    input m_axis_bramio_94_aresetn,
    output m_axis_bramio_94_tlast,
    output m_axis_bramio_94_tvalid,  
    output [M_AXIS_BRAMIO_94_DMWIDTH/8-1:0] m_axis_bramio_94_tkeep,
    output [M_AXIS_BRAMIO_94_DMWIDTH/8-1:0] m_axis_bramio_94_tstrb,
    output [M_AXIS_BRAMIO_94_DMWIDTH-1:0] m_axis_bramio_94_tdata,
    input m_axis_bramio_94_tready,
    //in-out AXI-Stream output interface 95
    input m_axis_bramio_95_aclk,
    input m_axis_bramio_95_aresetn,
    output m_axis_bramio_95_tlast,
    output m_axis_bramio_95_tvalid,  
    output [M_AXIS_BRAMIO_95_DMWIDTH/8-1:0] m_axis_bramio_95_tkeep,
    output [M_AXIS_BRAMIO_95_DMWIDTH/8-1:0] m_axis_bramio_95_tstrb,
    output [M_AXIS_BRAMIO_95_DMWIDTH-1:0] m_axis_bramio_95_tdata,
    input m_axis_bramio_95_tready,
    //in-out AXI-Stream output interface 96
    input m_axis_bramio_96_aclk,
    input m_axis_bramio_96_aresetn,
    output m_axis_bramio_96_tlast,
    output m_axis_bramio_96_tvalid,  
    output [M_AXIS_BRAMIO_96_DMWIDTH/8-1:0] m_axis_bramio_96_tkeep,
    output [M_AXIS_BRAMIO_96_DMWIDTH/8-1:0] m_axis_bramio_96_tstrb,
    output [M_AXIS_BRAMIO_96_DMWIDTH-1:0] m_axis_bramio_96_tdata,
    input m_axis_bramio_96_tready,
    //in-out AXI-Stream output interface 97
    input m_axis_bramio_97_aclk,
    input m_axis_bramio_97_aresetn,
    output m_axis_bramio_97_tlast,
    output m_axis_bramio_97_tvalid,  
    output [M_AXIS_BRAMIO_97_DMWIDTH/8-1:0] m_axis_bramio_97_tkeep,
    output [M_AXIS_BRAMIO_97_DMWIDTH/8-1:0] m_axis_bramio_97_tstrb,
    output [M_AXIS_BRAMIO_97_DMWIDTH-1:0] m_axis_bramio_97_tdata,
    input m_axis_bramio_97_tready,
    //in-out AXI-Stream output interface 98
    input m_axis_bramio_98_aclk,
    input m_axis_bramio_98_aresetn,
    output m_axis_bramio_98_tlast,
    output m_axis_bramio_98_tvalid,  
    output [M_AXIS_BRAMIO_98_DMWIDTH/8-1:0] m_axis_bramio_98_tkeep,
    output [M_AXIS_BRAMIO_98_DMWIDTH/8-1:0] m_axis_bramio_98_tstrb,
    output [M_AXIS_BRAMIO_98_DMWIDTH-1:0] m_axis_bramio_98_tdata,
    input m_axis_bramio_98_tready,
    //in-out AXI-Stream output interface 99
    input m_axis_bramio_99_aclk,
    input m_axis_bramio_99_aresetn,
    output m_axis_bramio_99_tlast,
    output m_axis_bramio_99_tvalid,  
    output [M_AXIS_BRAMIO_99_DMWIDTH/8-1:0] m_axis_bramio_99_tkeep,
    output [M_AXIS_BRAMIO_99_DMWIDTH/8-1:0] m_axis_bramio_99_tstrb,
    output [M_AXIS_BRAMIO_99_DMWIDTH-1:0] m_axis_bramio_99_tdata,
    input m_axis_bramio_99_tready,
    //in-out AXI-Stream output interface 100
    input m_axis_bramio_100_aclk,
    input m_axis_bramio_100_aresetn,
    output m_axis_bramio_100_tlast,
    output m_axis_bramio_100_tvalid,  
    output [M_AXIS_BRAMIO_100_DMWIDTH/8-1:0] m_axis_bramio_100_tkeep,
    output [M_AXIS_BRAMIO_100_DMWIDTH/8-1:0] m_axis_bramio_100_tstrb,
    output [M_AXIS_BRAMIO_100_DMWIDTH-1:0] m_axis_bramio_100_tdata,
    input m_axis_bramio_100_tready,
    //in-out AXI-Stream output interface 101
    input m_axis_bramio_101_aclk,
    input m_axis_bramio_101_aresetn,
    output m_axis_bramio_101_tlast,
    output m_axis_bramio_101_tvalid,  
    output [M_AXIS_BRAMIO_101_DMWIDTH/8-1:0] m_axis_bramio_101_tkeep,
    output [M_AXIS_BRAMIO_101_DMWIDTH/8-1:0] m_axis_bramio_101_tstrb,
    output [M_AXIS_BRAMIO_101_DMWIDTH-1:0] m_axis_bramio_101_tdata,
    input m_axis_bramio_101_tready,
    //in-out AXI-Stream output interface 102
    input m_axis_bramio_102_aclk,
    input m_axis_bramio_102_aresetn,
    output m_axis_bramio_102_tlast,
    output m_axis_bramio_102_tvalid,  
    output [M_AXIS_BRAMIO_102_DMWIDTH/8-1:0] m_axis_bramio_102_tkeep,
    output [M_AXIS_BRAMIO_102_DMWIDTH/8-1:0] m_axis_bramio_102_tstrb,
    output [M_AXIS_BRAMIO_102_DMWIDTH-1:0] m_axis_bramio_102_tdata,
    input m_axis_bramio_102_tready,
    //in-out AXI-Stream output interface 103
    input m_axis_bramio_103_aclk,
    input m_axis_bramio_103_aresetn,
    output m_axis_bramio_103_tlast,
    output m_axis_bramio_103_tvalid,  
    output [M_AXIS_BRAMIO_103_DMWIDTH/8-1:0] m_axis_bramio_103_tkeep,
    output [M_AXIS_BRAMIO_103_DMWIDTH/8-1:0] m_axis_bramio_103_tstrb,
    output [M_AXIS_BRAMIO_103_DMWIDTH-1:0] m_axis_bramio_103_tdata,
    input m_axis_bramio_103_tready,
    //in-out AXI-Stream output interface 104
    input m_axis_bramio_104_aclk,
    input m_axis_bramio_104_aresetn,
    output m_axis_bramio_104_tlast,
    output m_axis_bramio_104_tvalid,  
    output [M_AXIS_BRAMIO_104_DMWIDTH/8-1:0] m_axis_bramio_104_tkeep,
    output [M_AXIS_BRAMIO_104_DMWIDTH/8-1:0] m_axis_bramio_104_tstrb,
    output [M_AXIS_BRAMIO_104_DMWIDTH-1:0] m_axis_bramio_104_tdata,
    input m_axis_bramio_104_tready,
    //in-out AXI-Stream output interface 105
    input m_axis_bramio_105_aclk,
    input m_axis_bramio_105_aresetn,
    output m_axis_bramio_105_tlast,
    output m_axis_bramio_105_tvalid,  
    output [M_AXIS_BRAMIO_105_DMWIDTH/8-1:0] m_axis_bramio_105_tkeep,
    output [M_AXIS_BRAMIO_105_DMWIDTH/8-1:0] m_axis_bramio_105_tstrb,
    output [M_AXIS_BRAMIO_105_DMWIDTH-1:0] m_axis_bramio_105_tdata,
    input m_axis_bramio_105_tready,
    //in-out AXI-Stream output interface 106
    input m_axis_bramio_106_aclk,
    input m_axis_bramio_106_aresetn,
    output m_axis_bramio_106_tlast,
    output m_axis_bramio_106_tvalid,  
    output [M_AXIS_BRAMIO_106_DMWIDTH/8-1:0] m_axis_bramio_106_tkeep,
    output [M_AXIS_BRAMIO_106_DMWIDTH/8-1:0] m_axis_bramio_106_tstrb,
    output [M_AXIS_BRAMIO_106_DMWIDTH-1:0] m_axis_bramio_106_tdata,
    input m_axis_bramio_106_tready,
    //in-out AXI-Stream output interface 107
    input m_axis_bramio_107_aclk,
    input m_axis_bramio_107_aresetn,
    output m_axis_bramio_107_tlast,
    output m_axis_bramio_107_tvalid,  
    output [M_AXIS_BRAMIO_107_DMWIDTH/8-1:0] m_axis_bramio_107_tkeep,
    output [M_AXIS_BRAMIO_107_DMWIDTH/8-1:0] m_axis_bramio_107_tstrb,
    output [M_AXIS_BRAMIO_107_DMWIDTH-1:0] m_axis_bramio_107_tdata,
    input m_axis_bramio_107_tready,
    //in-out AXI-Stream output interface 108
    input m_axis_bramio_108_aclk,
    input m_axis_bramio_108_aresetn,
    output m_axis_bramio_108_tlast,
    output m_axis_bramio_108_tvalid,  
    output [M_AXIS_BRAMIO_108_DMWIDTH/8-1:0] m_axis_bramio_108_tkeep,
    output [M_AXIS_BRAMIO_108_DMWIDTH/8-1:0] m_axis_bramio_108_tstrb,
    output [M_AXIS_BRAMIO_108_DMWIDTH-1:0] m_axis_bramio_108_tdata,
    input m_axis_bramio_108_tready,
    //in-out AXI-Stream output interface 109
    input m_axis_bramio_109_aclk,
    input m_axis_bramio_109_aresetn,
    output m_axis_bramio_109_tlast,
    output m_axis_bramio_109_tvalid,  
    output [M_AXIS_BRAMIO_109_DMWIDTH/8-1:0] m_axis_bramio_109_tkeep,
    output [M_AXIS_BRAMIO_109_DMWIDTH/8-1:0] m_axis_bramio_109_tstrb,
    output [M_AXIS_BRAMIO_109_DMWIDTH-1:0] m_axis_bramio_109_tdata,
    input m_axis_bramio_109_tready,
    //in-out AXI-Stream output interface 110
    input m_axis_bramio_110_aclk,
    input m_axis_bramio_110_aresetn,
    output m_axis_bramio_110_tlast,
    output m_axis_bramio_110_tvalid,  
    output [M_AXIS_BRAMIO_110_DMWIDTH/8-1:0] m_axis_bramio_110_tkeep,
    output [M_AXIS_BRAMIO_110_DMWIDTH/8-1:0] m_axis_bramio_110_tstrb,
    output [M_AXIS_BRAMIO_110_DMWIDTH-1:0] m_axis_bramio_110_tdata,
    input m_axis_bramio_110_tready,
    //in-out AXI-Stream output interface 111
    input m_axis_bramio_111_aclk,
    input m_axis_bramio_111_aresetn,
    output m_axis_bramio_111_tlast,
    output m_axis_bramio_111_tvalid,  
    output [M_AXIS_BRAMIO_111_DMWIDTH/8-1:0] m_axis_bramio_111_tkeep,
    output [M_AXIS_BRAMIO_111_DMWIDTH/8-1:0] m_axis_bramio_111_tstrb,
    output [M_AXIS_BRAMIO_111_DMWIDTH-1:0] m_axis_bramio_111_tdata,
    input m_axis_bramio_111_tready,
    //in-out AXI-Stream output interface 112
    input m_axis_bramio_112_aclk,
    input m_axis_bramio_112_aresetn,
    output m_axis_bramio_112_tlast,
    output m_axis_bramio_112_tvalid,  
    output [M_AXIS_BRAMIO_112_DMWIDTH/8-1:0] m_axis_bramio_112_tkeep,
    output [M_AXIS_BRAMIO_112_DMWIDTH/8-1:0] m_axis_bramio_112_tstrb,
    output [M_AXIS_BRAMIO_112_DMWIDTH-1:0] m_axis_bramio_112_tdata,
    input m_axis_bramio_112_tready,
    //in-out AXI-Stream output interface 113
    input m_axis_bramio_113_aclk,
    input m_axis_bramio_113_aresetn,
    output m_axis_bramio_113_tlast,
    output m_axis_bramio_113_tvalid,  
    output [M_AXIS_BRAMIO_113_DMWIDTH/8-1:0] m_axis_bramio_113_tkeep,
    output [M_AXIS_BRAMIO_113_DMWIDTH/8-1:0] m_axis_bramio_113_tstrb,
    output [M_AXIS_BRAMIO_113_DMWIDTH-1:0] m_axis_bramio_113_tdata,
    input m_axis_bramio_113_tready,
    //in-out AXI-Stream output interface 114
    input m_axis_bramio_114_aclk,
    input m_axis_bramio_114_aresetn,
    output m_axis_bramio_114_tlast,
    output m_axis_bramio_114_tvalid,  
    output [M_AXIS_BRAMIO_114_DMWIDTH/8-1:0] m_axis_bramio_114_tkeep,
    output [M_AXIS_BRAMIO_114_DMWIDTH/8-1:0] m_axis_bramio_114_tstrb,
    output [M_AXIS_BRAMIO_114_DMWIDTH-1:0] m_axis_bramio_114_tdata,
    input m_axis_bramio_114_tready,
    //in-out AXI-Stream output interface 115
    input m_axis_bramio_115_aclk,
    input m_axis_bramio_115_aresetn,
    output m_axis_bramio_115_tlast,
    output m_axis_bramio_115_tvalid,  
    output [M_AXIS_BRAMIO_115_DMWIDTH/8-1:0] m_axis_bramio_115_tkeep,
    output [M_AXIS_BRAMIO_115_DMWIDTH/8-1:0] m_axis_bramio_115_tstrb,
    output [M_AXIS_BRAMIO_115_DMWIDTH-1:0] m_axis_bramio_115_tdata,
    input m_axis_bramio_115_tready,
    //in-out AXI-Stream output interface 116
    input m_axis_bramio_116_aclk,
    input m_axis_bramio_116_aresetn,
    output m_axis_bramio_116_tlast,
    output m_axis_bramio_116_tvalid,  
    output [M_AXIS_BRAMIO_116_DMWIDTH/8-1:0] m_axis_bramio_116_tkeep,
    output [M_AXIS_BRAMIO_116_DMWIDTH/8-1:0] m_axis_bramio_116_tstrb,
    output [M_AXIS_BRAMIO_116_DMWIDTH-1:0] m_axis_bramio_116_tdata,
    input m_axis_bramio_116_tready,
    //in-out AXI-Stream output interface 117
    input m_axis_bramio_117_aclk,
    input m_axis_bramio_117_aresetn,
    output m_axis_bramio_117_tlast,
    output m_axis_bramio_117_tvalid,  
    output [M_AXIS_BRAMIO_117_DMWIDTH/8-1:0] m_axis_bramio_117_tkeep,
    output [M_AXIS_BRAMIO_117_DMWIDTH/8-1:0] m_axis_bramio_117_tstrb,
    output [M_AXIS_BRAMIO_117_DMWIDTH-1:0] m_axis_bramio_117_tdata,
    input m_axis_bramio_117_tready,
    //in-out AXI-Stream output interface 118
    input m_axis_bramio_118_aclk,
    input m_axis_bramio_118_aresetn,
    output m_axis_bramio_118_tlast,
    output m_axis_bramio_118_tvalid,  
    output [M_AXIS_BRAMIO_118_DMWIDTH/8-1:0] m_axis_bramio_118_tkeep,
    output [M_AXIS_BRAMIO_118_DMWIDTH/8-1:0] m_axis_bramio_118_tstrb,
    output [M_AXIS_BRAMIO_118_DMWIDTH-1:0] m_axis_bramio_118_tdata,
    input m_axis_bramio_118_tready,
    //in-out AXI-Stream output interface 119
    input m_axis_bramio_119_aclk,
    input m_axis_bramio_119_aresetn,
    output m_axis_bramio_119_tlast,
    output m_axis_bramio_119_tvalid,  
    output [M_AXIS_BRAMIO_119_DMWIDTH/8-1:0] m_axis_bramio_119_tkeep,
    output [M_AXIS_BRAMIO_119_DMWIDTH/8-1:0] m_axis_bramio_119_tstrb,
    output [M_AXIS_BRAMIO_119_DMWIDTH-1:0] m_axis_bramio_119_tdata,
    input m_axis_bramio_119_tready,
    //in-out AXI-Stream output interface 120
    input m_axis_bramio_120_aclk,
    input m_axis_bramio_120_aresetn,
    output m_axis_bramio_120_tlast,
    output m_axis_bramio_120_tvalid,  
    output [M_AXIS_BRAMIO_120_DMWIDTH/8-1:0] m_axis_bramio_120_tkeep,
    output [M_AXIS_BRAMIO_120_DMWIDTH/8-1:0] m_axis_bramio_120_tstrb,
    output [M_AXIS_BRAMIO_120_DMWIDTH-1:0] m_axis_bramio_120_tdata,
    input m_axis_bramio_120_tready,
    //in-out AXI-Stream output interface 121
    input m_axis_bramio_121_aclk,
    input m_axis_bramio_121_aresetn,
    output m_axis_bramio_121_tlast,
    output m_axis_bramio_121_tvalid,  
    output [M_AXIS_BRAMIO_121_DMWIDTH/8-1:0] m_axis_bramio_121_tkeep,
    output [M_AXIS_BRAMIO_121_DMWIDTH/8-1:0] m_axis_bramio_121_tstrb,
    output [M_AXIS_BRAMIO_121_DMWIDTH-1:0] m_axis_bramio_121_tdata,
    input m_axis_bramio_121_tready,
    //in-out AXI-Stream output interface 122
    input m_axis_bramio_122_aclk,
    input m_axis_bramio_122_aresetn,
    output m_axis_bramio_122_tlast,
    output m_axis_bramio_122_tvalid,  
    output [M_AXIS_BRAMIO_122_DMWIDTH/8-1:0] m_axis_bramio_122_tkeep,
    output [M_AXIS_BRAMIO_122_DMWIDTH/8-1:0] m_axis_bramio_122_tstrb,
    output [M_AXIS_BRAMIO_122_DMWIDTH-1:0] m_axis_bramio_122_tdata,
    input m_axis_bramio_122_tready,
    //in-out AXI-Stream output interface 123
    input m_axis_bramio_123_aclk,
    input m_axis_bramio_123_aresetn,
    output m_axis_bramio_123_tlast,
    output m_axis_bramio_123_tvalid,  
    output [M_AXIS_BRAMIO_123_DMWIDTH/8-1:0] m_axis_bramio_123_tkeep,
    output [M_AXIS_BRAMIO_123_DMWIDTH/8-1:0] m_axis_bramio_123_tstrb,
    output [M_AXIS_BRAMIO_123_DMWIDTH-1:0] m_axis_bramio_123_tdata,
    input m_axis_bramio_123_tready,
    //in-out AXI-Stream output interface 124
    input m_axis_bramio_124_aclk,
    input m_axis_bramio_124_aresetn,
    output m_axis_bramio_124_tlast,
    output m_axis_bramio_124_tvalid,  
    output [M_AXIS_BRAMIO_124_DMWIDTH/8-1:0] m_axis_bramio_124_tkeep,
    output [M_AXIS_BRAMIO_124_DMWIDTH/8-1:0] m_axis_bramio_124_tstrb,
    output [M_AXIS_BRAMIO_124_DMWIDTH-1:0] m_axis_bramio_124_tdata,
    input m_axis_bramio_124_tready,
    //in-out AXI-Stream output interface 125
    input m_axis_bramio_125_aclk,
    input m_axis_bramio_125_aresetn,
    output m_axis_bramio_125_tlast,
    output m_axis_bramio_125_tvalid,  
    output [M_AXIS_BRAMIO_125_DMWIDTH/8-1:0] m_axis_bramio_125_tkeep,
    output [M_AXIS_BRAMIO_125_DMWIDTH/8-1:0] m_axis_bramio_125_tstrb,
    output [M_AXIS_BRAMIO_125_DMWIDTH-1:0] m_axis_bramio_125_tdata,
    input m_axis_bramio_125_tready,
    //in-out AXI-Stream output interface 126
    input m_axis_bramio_126_aclk,
    input m_axis_bramio_126_aresetn,
    output m_axis_bramio_126_tlast,
    output m_axis_bramio_126_tvalid,  
    output [M_AXIS_BRAMIO_126_DMWIDTH/8-1:0] m_axis_bramio_126_tkeep,
    output [M_AXIS_BRAMIO_126_DMWIDTH/8-1:0] m_axis_bramio_126_tstrb,
    output [M_AXIS_BRAMIO_126_DMWIDTH-1:0] m_axis_bramio_126_tdata,
    input m_axis_bramio_126_tready,
    //in-out AXI-Stream output interface 127
    input m_axis_bramio_127_aclk,
    input m_axis_bramio_127_aresetn,
    output m_axis_bramio_127_tlast,
    output m_axis_bramio_127_tvalid,  
    output [M_AXIS_BRAMIO_127_DMWIDTH/8-1:0] m_axis_bramio_127_tkeep,
    output [M_AXIS_BRAMIO_127_DMWIDTH/8-1:0] m_axis_bramio_127_tstrb,
    output [M_AXIS_BRAMIO_127_DMWIDTH-1:0] m_axis_bramio_127_tdata,
    input m_axis_bramio_127_tready
    );
    

    localparam C_MAX_INPUT_BRAMs = 128;
    localparam C_MAX_BRAM_PORTs = 2;
    localparam C_MAX_BIT_WIDTH = 1024;
    localparam [(C_MAX_INPUT_BRAMs*32)-1:0] C_INBRAM_BIT_ARRAY = {S_AXIS_BRAM_127_WIDTH,S_AXIS_BRAM_126_WIDTH,S_AXIS_BRAM_125_WIDTH,S_AXIS_BRAM_124_WIDTH,S_AXIS_BRAM_123_WIDTH,S_AXIS_BRAM_122_WIDTH,S_AXIS_BRAM_121_WIDTH,S_AXIS_BRAM_120_WIDTH,S_AXIS_BRAM_119_WIDTH,S_AXIS_BRAM_118_WIDTH,S_AXIS_BRAM_117_WIDTH,S_AXIS_BRAM_116_WIDTH,S_AXIS_BRAM_115_WIDTH,S_AXIS_BRAM_114_WIDTH,S_AXIS_BRAM_113_WIDTH,S_AXIS_BRAM_112_WIDTH,S_AXIS_BRAM_111_WIDTH,S_AXIS_BRAM_110_WIDTH,S_AXIS_BRAM_109_WIDTH,S_AXIS_BRAM_108_WIDTH,S_AXIS_BRAM_107_WIDTH,S_AXIS_BRAM_106_WIDTH,S_AXIS_BRAM_105_WIDTH,S_AXIS_BRAM_104_WIDTH,S_AXIS_BRAM_103_WIDTH,S_AXIS_BRAM_102_WIDTH,S_AXIS_BRAM_101_WIDTH,S_AXIS_BRAM_100_WIDTH,S_AXIS_BRAM_99_WIDTH,S_AXIS_BRAM_98_WIDTH,S_AXIS_BRAM_97_WIDTH,S_AXIS_BRAM_96_WIDTH,S_AXIS_BRAM_95_WIDTH,S_AXIS_BRAM_94_WIDTH,S_AXIS_BRAM_93_WIDTH,S_AXIS_BRAM_92_WIDTH,S_AXIS_BRAM_91_WIDTH,S_AXIS_BRAM_90_WIDTH,S_AXIS_BRAM_89_WIDTH,S_AXIS_BRAM_88_WIDTH,S_AXIS_BRAM_87_WIDTH,S_AXIS_BRAM_86_WIDTH,S_AXIS_BRAM_85_WIDTH,S_AXIS_BRAM_84_WIDTH,S_AXIS_BRAM_83_WIDTH,S_AXIS_BRAM_82_WIDTH,S_AXIS_BRAM_81_WIDTH,S_AXIS_BRAM_80_WIDTH,S_AXIS_BRAM_79_WIDTH,S_AXIS_BRAM_78_WIDTH,S_AXIS_BRAM_77_WIDTH,S_AXIS_BRAM_76_WIDTH,S_AXIS_BRAM_75_WIDTH,S_AXIS_BRAM_74_WIDTH,S_AXIS_BRAM_73_WIDTH,S_AXIS_BRAM_72_WIDTH,S_AXIS_BRAM_71_WIDTH,S_AXIS_BRAM_70_WIDTH,S_AXIS_BRAM_69_WIDTH,S_AXIS_BRAM_68_WIDTH,S_AXIS_BRAM_67_WIDTH,S_AXIS_BRAM_66_WIDTH,S_AXIS_BRAM_65_WIDTH,S_AXIS_BRAM_64_WIDTH,S_AXIS_BRAM_63_WIDTH,S_AXIS_BRAM_62_WIDTH,S_AXIS_BRAM_61_WIDTH,S_AXIS_BRAM_60_WIDTH,S_AXIS_BRAM_59_WIDTH,S_AXIS_BRAM_58_WIDTH,S_AXIS_BRAM_57_WIDTH,S_AXIS_BRAM_56_WIDTH,S_AXIS_BRAM_55_WIDTH,S_AXIS_BRAM_54_WIDTH,S_AXIS_BRAM_53_WIDTH,S_AXIS_BRAM_52_WIDTH,S_AXIS_BRAM_51_WIDTH,S_AXIS_BRAM_50_WIDTH,S_AXIS_BRAM_49_WIDTH,S_AXIS_BRAM_48_WIDTH,S_AXIS_BRAM_47_WIDTH,S_AXIS_BRAM_46_WIDTH,S_AXIS_BRAM_45_WIDTH,S_AXIS_BRAM_44_WIDTH,S_AXIS_BRAM_43_WIDTH,S_AXIS_BRAM_42_WIDTH,S_AXIS_BRAM_41_WIDTH,S_AXIS_BRAM_40_WIDTH,S_AXIS_BRAM_39_WIDTH,S_AXIS_BRAM_38_WIDTH,S_AXIS_BRAM_37_WIDTH,S_AXIS_BRAM_36_WIDTH,S_AXIS_BRAM_35_WIDTH,S_AXIS_BRAM_34_WIDTH,S_AXIS_BRAM_33_WIDTH,S_AXIS_BRAM_32_WIDTH,S_AXIS_BRAM_31_WIDTH,S_AXIS_BRAM_30_WIDTH,S_AXIS_BRAM_29_WIDTH,S_AXIS_BRAM_28_WIDTH,S_AXIS_BRAM_27_WIDTH,S_AXIS_BRAM_26_WIDTH,S_AXIS_BRAM_25_WIDTH,S_AXIS_BRAM_24_WIDTH,S_AXIS_BRAM_23_WIDTH,S_AXIS_BRAM_22_WIDTH,S_AXIS_BRAM_21_WIDTH,S_AXIS_BRAM_20_WIDTH,S_AXIS_BRAM_19_WIDTH,S_AXIS_BRAM_18_WIDTH,S_AXIS_BRAM_17_WIDTH,S_AXIS_BRAM_16_WIDTH,S_AXIS_BRAM_15_WIDTH,S_AXIS_BRAM_14_WIDTH,S_AXIS_BRAM_13_WIDTH,S_AXIS_BRAM_12_WIDTH,S_AXIS_BRAM_11_WIDTH,S_AXIS_BRAM_10_WIDTH,S_AXIS_BRAM_9_WIDTH,S_AXIS_BRAM_8_WIDTH,S_AXIS_BRAM_7_WIDTH,S_AXIS_BRAM_6_WIDTH,S_AXIS_BRAM_5_WIDTH,S_AXIS_BRAM_4_WIDTH,S_AXIS_BRAM_3_WIDTH,S_AXIS_BRAM_2_WIDTH,S_AXIS_BRAM_1_WIDTH,S_AXIS_BRAM_0_WIDTH};
    localparam [(C_MAX_INPUT_BRAMs*32)-1:0] C_DEPTH_BIT_ARRAY = {S_AXIS_BRAM_127_DEPTH,S_AXIS_BRAM_126_DEPTH,S_AXIS_BRAM_125_DEPTH,S_AXIS_BRAM_124_DEPTH,S_AXIS_BRAM_123_DEPTH,S_AXIS_BRAM_122_DEPTH,S_AXIS_BRAM_121_DEPTH,S_AXIS_BRAM_120_DEPTH,S_AXIS_BRAM_119_DEPTH,S_AXIS_BRAM_118_DEPTH,S_AXIS_BRAM_117_DEPTH,S_AXIS_BRAM_116_DEPTH,S_AXIS_BRAM_115_DEPTH,S_AXIS_BRAM_114_DEPTH,S_AXIS_BRAM_113_DEPTH,S_AXIS_BRAM_112_DEPTH,S_AXIS_BRAM_111_DEPTH,S_AXIS_BRAM_110_DEPTH,S_AXIS_BRAM_109_DEPTH,S_AXIS_BRAM_108_DEPTH,S_AXIS_BRAM_107_DEPTH,S_AXIS_BRAM_106_DEPTH,S_AXIS_BRAM_105_DEPTH,S_AXIS_BRAM_104_DEPTH,S_AXIS_BRAM_103_DEPTH,S_AXIS_BRAM_102_DEPTH,S_AXIS_BRAM_101_DEPTH,S_AXIS_BRAM_100_DEPTH,S_AXIS_BRAM_99_DEPTH,S_AXIS_BRAM_98_DEPTH,S_AXIS_BRAM_97_DEPTH,S_AXIS_BRAM_96_DEPTH,S_AXIS_BRAM_95_DEPTH,S_AXIS_BRAM_94_DEPTH,S_AXIS_BRAM_93_DEPTH,S_AXIS_BRAM_92_DEPTH,S_AXIS_BRAM_91_DEPTH,S_AXIS_BRAM_90_DEPTH,S_AXIS_BRAM_89_DEPTH,S_AXIS_BRAM_88_DEPTH,S_AXIS_BRAM_87_DEPTH,S_AXIS_BRAM_86_DEPTH,S_AXIS_BRAM_85_DEPTH,S_AXIS_BRAM_84_DEPTH,S_AXIS_BRAM_83_DEPTH,S_AXIS_BRAM_82_DEPTH,S_AXIS_BRAM_81_DEPTH,S_AXIS_BRAM_80_DEPTH,S_AXIS_BRAM_79_DEPTH,S_AXIS_BRAM_78_DEPTH,S_AXIS_BRAM_77_DEPTH,S_AXIS_BRAM_76_DEPTH,S_AXIS_BRAM_75_DEPTH,S_AXIS_BRAM_74_DEPTH,S_AXIS_BRAM_73_DEPTH,S_AXIS_BRAM_72_DEPTH,S_AXIS_BRAM_71_DEPTH,S_AXIS_BRAM_70_DEPTH,S_AXIS_BRAM_69_DEPTH,S_AXIS_BRAM_68_DEPTH,S_AXIS_BRAM_67_DEPTH,S_AXIS_BRAM_66_DEPTH,S_AXIS_BRAM_65_DEPTH,S_AXIS_BRAM_64_DEPTH,S_AXIS_BRAM_63_DEPTH,S_AXIS_BRAM_62_DEPTH,S_AXIS_BRAM_61_DEPTH,S_AXIS_BRAM_60_DEPTH,S_AXIS_BRAM_59_DEPTH,S_AXIS_BRAM_58_DEPTH,S_AXIS_BRAM_57_DEPTH,S_AXIS_BRAM_56_DEPTH,S_AXIS_BRAM_55_DEPTH,S_AXIS_BRAM_54_DEPTH,S_AXIS_BRAM_53_DEPTH,S_AXIS_BRAM_52_DEPTH,S_AXIS_BRAM_51_DEPTH,S_AXIS_BRAM_50_DEPTH,S_AXIS_BRAM_49_DEPTH,S_AXIS_BRAM_48_DEPTH,S_AXIS_BRAM_47_DEPTH,S_AXIS_BRAM_46_DEPTH,S_AXIS_BRAM_45_DEPTH,S_AXIS_BRAM_44_DEPTH,S_AXIS_BRAM_43_DEPTH,S_AXIS_BRAM_42_DEPTH,S_AXIS_BRAM_41_DEPTH,S_AXIS_BRAM_40_DEPTH,S_AXIS_BRAM_39_DEPTH,S_AXIS_BRAM_38_DEPTH,S_AXIS_BRAM_37_DEPTH,S_AXIS_BRAM_36_DEPTH,S_AXIS_BRAM_35_DEPTH,S_AXIS_BRAM_34_DEPTH,S_AXIS_BRAM_33_DEPTH,S_AXIS_BRAM_32_DEPTH,S_AXIS_BRAM_31_DEPTH,S_AXIS_BRAM_30_DEPTH,S_AXIS_BRAM_29_DEPTH,S_AXIS_BRAM_28_DEPTH,S_AXIS_BRAM_27_DEPTH,S_AXIS_BRAM_26_DEPTH,S_AXIS_BRAM_25_DEPTH,S_AXIS_BRAM_24_DEPTH,S_AXIS_BRAM_23_DEPTH,S_AXIS_BRAM_22_DEPTH,S_AXIS_BRAM_21_DEPTH,S_AXIS_BRAM_20_DEPTH,S_AXIS_BRAM_19_DEPTH,S_AXIS_BRAM_18_DEPTH,S_AXIS_BRAM_17_DEPTH,S_AXIS_BRAM_16_DEPTH,S_AXIS_BRAM_15_DEPTH,S_AXIS_BRAM_14_DEPTH,S_AXIS_BRAM_13_DEPTH,S_AXIS_BRAM_12_DEPTH,S_AXIS_BRAM_11_DEPTH,S_AXIS_BRAM_10_DEPTH,S_AXIS_BRAM_9_DEPTH,S_AXIS_BRAM_8_DEPTH,S_AXIS_BRAM_7_DEPTH,S_AXIS_BRAM_6_DEPTH,S_AXIS_BRAM_5_DEPTH,S_AXIS_BRAM_4_DEPTH,S_AXIS_BRAM_3_DEPTH,S_AXIS_BRAM_2_DEPTH,S_AXIS_BRAM_1_DEPTH,S_AXIS_BRAM_0_DEPTH};
    localparam [(C_MAX_INPUT_BRAMs*32)-1:0] C_DMWIDTH_BIT_ARRAY = {S_AXIS_BRAM_127_DMWIDTH,S_AXIS_BRAM_126_DMWIDTH,S_AXIS_BRAM_125_DMWIDTH,S_AXIS_BRAM_124_DMWIDTH,S_AXIS_BRAM_123_DMWIDTH,S_AXIS_BRAM_122_DMWIDTH,S_AXIS_BRAM_121_DMWIDTH,S_AXIS_BRAM_120_DMWIDTH,S_AXIS_BRAM_119_DMWIDTH,S_AXIS_BRAM_118_DMWIDTH,S_AXIS_BRAM_117_DMWIDTH,S_AXIS_BRAM_116_DMWIDTH,S_AXIS_BRAM_115_DMWIDTH,S_AXIS_BRAM_114_DMWIDTH,S_AXIS_BRAM_113_DMWIDTH,S_AXIS_BRAM_112_DMWIDTH,S_AXIS_BRAM_111_DMWIDTH,S_AXIS_BRAM_110_DMWIDTH,S_AXIS_BRAM_109_DMWIDTH,S_AXIS_BRAM_108_DMWIDTH,S_AXIS_BRAM_107_DMWIDTH,S_AXIS_BRAM_106_DMWIDTH,S_AXIS_BRAM_105_DMWIDTH,S_AXIS_BRAM_104_DMWIDTH,S_AXIS_BRAM_103_DMWIDTH,S_AXIS_BRAM_102_DMWIDTH,S_AXIS_BRAM_101_DMWIDTH,S_AXIS_BRAM_100_DMWIDTH,S_AXIS_BRAM_99_DMWIDTH,S_AXIS_BRAM_98_DMWIDTH,S_AXIS_BRAM_97_DMWIDTH,S_AXIS_BRAM_96_DMWIDTH,S_AXIS_BRAM_95_DMWIDTH,S_AXIS_BRAM_94_DMWIDTH,S_AXIS_BRAM_93_DMWIDTH,S_AXIS_BRAM_92_DMWIDTH,S_AXIS_BRAM_91_DMWIDTH,S_AXIS_BRAM_90_DMWIDTH,S_AXIS_BRAM_89_DMWIDTH,S_AXIS_BRAM_88_DMWIDTH,S_AXIS_BRAM_87_DMWIDTH,S_AXIS_BRAM_86_DMWIDTH,S_AXIS_BRAM_85_DMWIDTH,S_AXIS_BRAM_84_DMWIDTH,S_AXIS_BRAM_83_DMWIDTH,S_AXIS_BRAM_82_DMWIDTH,S_AXIS_BRAM_81_DMWIDTH,S_AXIS_BRAM_80_DMWIDTH,S_AXIS_BRAM_79_DMWIDTH,S_AXIS_BRAM_78_DMWIDTH,S_AXIS_BRAM_77_DMWIDTH,S_AXIS_BRAM_76_DMWIDTH,S_AXIS_BRAM_75_DMWIDTH,S_AXIS_BRAM_74_DMWIDTH,S_AXIS_BRAM_73_DMWIDTH,S_AXIS_BRAM_72_DMWIDTH,S_AXIS_BRAM_71_DMWIDTH,S_AXIS_BRAM_70_DMWIDTH,S_AXIS_BRAM_69_DMWIDTH,S_AXIS_BRAM_68_DMWIDTH,S_AXIS_BRAM_67_DMWIDTH,S_AXIS_BRAM_66_DMWIDTH,S_AXIS_BRAM_65_DMWIDTH,S_AXIS_BRAM_64_DMWIDTH,S_AXIS_BRAM_63_DMWIDTH,S_AXIS_BRAM_62_DMWIDTH,S_AXIS_BRAM_61_DMWIDTH,S_AXIS_BRAM_60_DMWIDTH,S_AXIS_BRAM_59_DMWIDTH,S_AXIS_BRAM_58_DMWIDTH,S_AXIS_BRAM_57_DMWIDTH,S_AXIS_BRAM_56_DMWIDTH,S_AXIS_BRAM_55_DMWIDTH,S_AXIS_BRAM_54_DMWIDTH,S_AXIS_BRAM_53_DMWIDTH,S_AXIS_BRAM_52_DMWIDTH,S_AXIS_BRAM_51_DMWIDTH,S_AXIS_BRAM_50_DMWIDTH,S_AXIS_BRAM_49_DMWIDTH,S_AXIS_BRAM_48_DMWIDTH,S_AXIS_BRAM_47_DMWIDTH,S_AXIS_BRAM_46_DMWIDTH,S_AXIS_BRAM_45_DMWIDTH,S_AXIS_BRAM_44_DMWIDTH,S_AXIS_BRAM_43_DMWIDTH,S_AXIS_BRAM_42_DMWIDTH,S_AXIS_BRAM_41_DMWIDTH,S_AXIS_BRAM_40_DMWIDTH,S_AXIS_BRAM_39_DMWIDTH,S_AXIS_BRAM_38_DMWIDTH,S_AXIS_BRAM_37_DMWIDTH,S_AXIS_BRAM_36_DMWIDTH,S_AXIS_BRAM_35_DMWIDTH,S_AXIS_BRAM_34_DMWIDTH,S_AXIS_BRAM_33_DMWIDTH,S_AXIS_BRAM_32_DMWIDTH,S_AXIS_BRAM_31_DMWIDTH,S_AXIS_BRAM_30_DMWIDTH,S_AXIS_BRAM_29_DMWIDTH,S_AXIS_BRAM_28_DMWIDTH,S_AXIS_BRAM_27_DMWIDTH,S_AXIS_BRAM_26_DMWIDTH,S_AXIS_BRAM_25_DMWIDTH,S_AXIS_BRAM_24_DMWIDTH,S_AXIS_BRAM_23_DMWIDTH,S_AXIS_BRAM_22_DMWIDTH,S_AXIS_BRAM_21_DMWIDTH,S_AXIS_BRAM_20_DMWIDTH,S_AXIS_BRAM_19_DMWIDTH,S_AXIS_BRAM_18_DMWIDTH,S_AXIS_BRAM_17_DMWIDTH,S_AXIS_BRAM_16_DMWIDTH,S_AXIS_BRAM_15_DMWIDTH,S_AXIS_BRAM_14_DMWIDTH,S_AXIS_BRAM_13_DMWIDTH,S_AXIS_BRAM_12_DMWIDTH,S_AXIS_BRAM_11_DMWIDTH,S_AXIS_BRAM_10_DMWIDTH,S_AXIS_BRAM_9_DMWIDTH,S_AXIS_BRAM_8_DMWIDTH,S_AXIS_BRAM_7_DMWIDTH,S_AXIS_BRAM_6_DMWIDTH,S_AXIS_BRAM_5_DMWIDTH,S_AXIS_BRAM_4_DMWIDTH,S_AXIS_BRAM_3_DMWIDTH,S_AXIS_BRAM_2_DMWIDTH,S_AXIS_BRAM_1_DMWIDTH,S_AXIS_BRAM_0_DMWIDTH};
    localparam [(C_MAX_INPUT_BRAMs*32)-1:0] C_IN_ASYNC_BIT_ARRAY = {S_AXIS_BRAM_127_IS_ASYNC,S_AXIS_BRAM_126_IS_ASYNC,S_AXIS_BRAM_125_IS_ASYNC,S_AXIS_BRAM_124_IS_ASYNC,S_AXIS_BRAM_123_IS_ASYNC,S_AXIS_BRAM_122_IS_ASYNC,S_AXIS_BRAM_121_IS_ASYNC,S_AXIS_BRAM_120_IS_ASYNC,S_AXIS_BRAM_119_IS_ASYNC,S_AXIS_BRAM_118_IS_ASYNC,S_AXIS_BRAM_117_IS_ASYNC,S_AXIS_BRAM_116_IS_ASYNC,S_AXIS_BRAM_115_IS_ASYNC,S_AXIS_BRAM_114_IS_ASYNC,S_AXIS_BRAM_113_IS_ASYNC,S_AXIS_BRAM_112_IS_ASYNC,S_AXIS_BRAM_111_IS_ASYNC,S_AXIS_BRAM_110_IS_ASYNC,S_AXIS_BRAM_109_IS_ASYNC,S_AXIS_BRAM_108_IS_ASYNC,S_AXIS_BRAM_107_IS_ASYNC,S_AXIS_BRAM_106_IS_ASYNC,S_AXIS_BRAM_105_IS_ASYNC,S_AXIS_BRAM_104_IS_ASYNC,S_AXIS_BRAM_103_IS_ASYNC,S_AXIS_BRAM_102_IS_ASYNC,S_AXIS_BRAM_101_IS_ASYNC,S_AXIS_BRAM_100_IS_ASYNC,S_AXIS_BRAM_99_IS_ASYNC,S_AXIS_BRAM_98_IS_ASYNC,S_AXIS_BRAM_97_IS_ASYNC,S_AXIS_BRAM_96_IS_ASYNC,S_AXIS_BRAM_95_IS_ASYNC,S_AXIS_BRAM_94_IS_ASYNC,S_AXIS_BRAM_93_IS_ASYNC,S_AXIS_BRAM_92_IS_ASYNC,S_AXIS_BRAM_91_IS_ASYNC,S_AXIS_BRAM_90_IS_ASYNC,S_AXIS_BRAM_89_IS_ASYNC,S_AXIS_BRAM_88_IS_ASYNC,S_AXIS_BRAM_87_IS_ASYNC,S_AXIS_BRAM_86_IS_ASYNC,S_AXIS_BRAM_85_IS_ASYNC,S_AXIS_BRAM_84_IS_ASYNC,S_AXIS_BRAM_83_IS_ASYNC,S_AXIS_BRAM_82_IS_ASYNC,S_AXIS_BRAM_81_IS_ASYNC,S_AXIS_BRAM_80_IS_ASYNC,S_AXIS_BRAM_79_IS_ASYNC,S_AXIS_BRAM_78_IS_ASYNC,S_AXIS_BRAM_77_IS_ASYNC,S_AXIS_BRAM_76_IS_ASYNC,S_AXIS_BRAM_75_IS_ASYNC,S_AXIS_BRAM_74_IS_ASYNC,S_AXIS_BRAM_73_IS_ASYNC,S_AXIS_BRAM_72_IS_ASYNC,S_AXIS_BRAM_71_IS_ASYNC,S_AXIS_BRAM_70_IS_ASYNC,S_AXIS_BRAM_69_IS_ASYNC,S_AXIS_BRAM_68_IS_ASYNC,S_AXIS_BRAM_67_IS_ASYNC,S_AXIS_BRAM_66_IS_ASYNC,S_AXIS_BRAM_65_IS_ASYNC,S_AXIS_BRAM_64_IS_ASYNC,S_AXIS_BRAM_63_IS_ASYNC,S_AXIS_BRAM_62_IS_ASYNC,S_AXIS_BRAM_61_IS_ASYNC,S_AXIS_BRAM_60_IS_ASYNC,S_AXIS_BRAM_59_IS_ASYNC,S_AXIS_BRAM_58_IS_ASYNC,S_AXIS_BRAM_57_IS_ASYNC,S_AXIS_BRAM_56_IS_ASYNC,S_AXIS_BRAM_55_IS_ASYNC,S_AXIS_BRAM_54_IS_ASYNC,S_AXIS_BRAM_53_IS_ASYNC,S_AXIS_BRAM_52_IS_ASYNC,S_AXIS_BRAM_51_IS_ASYNC,S_AXIS_BRAM_50_IS_ASYNC,S_AXIS_BRAM_49_IS_ASYNC,S_AXIS_BRAM_48_IS_ASYNC,S_AXIS_BRAM_47_IS_ASYNC,S_AXIS_BRAM_46_IS_ASYNC,S_AXIS_BRAM_45_IS_ASYNC,S_AXIS_BRAM_44_IS_ASYNC,S_AXIS_BRAM_43_IS_ASYNC,S_AXIS_BRAM_42_IS_ASYNC,S_AXIS_BRAM_41_IS_ASYNC,S_AXIS_BRAM_40_IS_ASYNC,S_AXIS_BRAM_39_IS_ASYNC,S_AXIS_BRAM_38_IS_ASYNC,S_AXIS_BRAM_37_IS_ASYNC,S_AXIS_BRAM_36_IS_ASYNC,S_AXIS_BRAM_35_IS_ASYNC,S_AXIS_BRAM_34_IS_ASYNC,S_AXIS_BRAM_33_IS_ASYNC,S_AXIS_BRAM_32_IS_ASYNC,S_AXIS_BRAM_31_IS_ASYNC,S_AXIS_BRAM_30_IS_ASYNC,S_AXIS_BRAM_29_IS_ASYNC,S_AXIS_BRAM_28_IS_ASYNC,S_AXIS_BRAM_27_IS_ASYNC,S_AXIS_BRAM_26_IS_ASYNC,S_AXIS_BRAM_25_IS_ASYNC,S_AXIS_BRAM_24_IS_ASYNC,S_AXIS_BRAM_23_IS_ASYNC,S_AXIS_BRAM_22_IS_ASYNC,S_AXIS_BRAM_21_IS_ASYNC,S_AXIS_BRAM_20_IS_ASYNC,S_AXIS_BRAM_19_IS_ASYNC,S_AXIS_BRAM_18_IS_ASYNC,S_AXIS_BRAM_17_IS_ASYNC,S_AXIS_BRAM_16_IS_ASYNC,S_AXIS_BRAM_15_IS_ASYNC,S_AXIS_BRAM_14_IS_ASYNC,S_AXIS_BRAM_13_IS_ASYNC,S_AXIS_BRAM_12_IS_ASYNC,S_AXIS_BRAM_11_IS_ASYNC,S_AXIS_BRAM_10_IS_ASYNC,S_AXIS_BRAM_9_IS_ASYNC,S_AXIS_BRAM_8_IS_ASYNC,S_AXIS_BRAM_7_IS_ASYNC,S_AXIS_BRAM_6_IS_ASYNC,S_AXIS_BRAM_5_IS_ASYNC,S_AXIS_BRAM_4_IS_ASYNC,S_AXIS_BRAM_3_IS_ASYNC,S_AXIS_BRAM_2_IS_ASYNC,S_AXIS_BRAM_1_IS_ASYNC,S_AXIS_BRAM_0_IS_ASYNC};
    localparam [(C_MAX_INPUT_BRAMs*32)-1:0] C_OUT_ASYNC_BIT_ARRAY = {M_AXIS_BRAMIO_127_IS_ASYNC,M_AXIS_BRAMIO_126_IS_ASYNC,M_AXIS_BRAMIO_125_IS_ASYNC,M_AXIS_BRAMIO_124_IS_ASYNC,M_AXIS_BRAMIO_123_IS_ASYNC,M_AXIS_BRAMIO_122_IS_ASYNC,M_AXIS_BRAMIO_121_IS_ASYNC,M_AXIS_BRAMIO_120_IS_ASYNC,M_AXIS_BRAMIO_119_IS_ASYNC,M_AXIS_BRAMIO_118_IS_ASYNC,M_AXIS_BRAMIO_117_IS_ASYNC,M_AXIS_BRAMIO_116_IS_ASYNC,M_AXIS_BRAMIO_115_IS_ASYNC,M_AXIS_BRAMIO_114_IS_ASYNC,M_AXIS_BRAMIO_113_IS_ASYNC,M_AXIS_BRAMIO_112_IS_ASYNC,M_AXIS_BRAMIO_111_IS_ASYNC,M_AXIS_BRAMIO_110_IS_ASYNC,M_AXIS_BRAMIO_109_IS_ASYNC,M_AXIS_BRAMIO_108_IS_ASYNC,M_AXIS_BRAMIO_107_IS_ASYNC,M_AXIS_BRAMIO_106_IS_ASYNC,M_AXIS_BRAMIO_105_IS_ASYNC,M_AXIS_BRAMIO_104_IS_ASYNC,M_AXIS_BRAMIO_103_IS_ASYNC,M_AXIS_BRAMIO_102_IS_ASYNC,M_AXIS_BRAMIO_101_IS_ASYNC,M_AXIS_BRAMIO_100_IS_ASYNC,M_AXIS_BRAMIO_99_IS_ASYNC,M_AXIS_BRAMIO_98_IS_ASYNC,M_AXIS_BRAMIO_97_IS_ASYNC,M_AXIS_BRAMIO_96_IS_ASYNC,M_AXIS_BRAMIO_95_IS_ASYNC,M_AXIS_BRAMIO_94_IS_ASYNC,M_AXIS_BRAMIO_93_IS_ASYNC,M_AXIS_BRAMIO_92_IS_ASYNC,M_AXIS_BRAMIO_91_IS_ASYNC,M_AXIS_BRAMIO_90_IS_ASYNC,M_AXIS_BRAMIO_89_IS_ASYNC,M_AXIS_BRAMIO_88_IS_ASYNC,M_AXIS_BRAMIO_87_IS_ASYNC,M_AXIS_BRAMIO_86_IS_ASYNC,M_AXIS_BRAMIO_85_IS_ASYNC,M_AXIS_BRAMIO_84_IS_ASYNC,M_AXIS_BRAMIO_83_IS_ASYNC,M_AXIS_BRAMIO_82_IS_ASYNC,M_AXIS_BRAMIO_81_IS_ASYNC,M_AXIS_BRAMIO_80_IS_ASYNC,M_AXIS_BRAMIO_79_IS_ASYNC,M_AXIS_BRAMIO_78_IS_ASYNC,M_AXIS_BRAMIO_77_IS_ASYNC,M_AXIS_BRAMIO_76_IS_ASYNC,M_AXIS_BRAMIO_75_IS_ASYNC,M_AXIS_BRAMIO_74_IS_ASYNC,M_AXIS_BRAMIO_73_IS_ASYNC,M_AXIS_BRAMIO_72_IS_ASYNC,M_AXIS_BRAMIO_71_IS_ASYNC,M_AXIS_BRAMIO_70_IS_ASYNC,M_AXIS_BRAMIO_69_IS_ASYNC,M_AXIS_BRAMIO_68_IS_ASYNC,M_AXIS_BRAMIO_67_IS_ASYNC,M_AXIS_BRAMIO_66_IS_ASYNC,M_AXIS_BRAMIO_65_IS_ASYNC,M_AXIS_BRAMIO_64_IS_ASYNC,M_AXIS_BRAMIO_63_IS_ASYNC,M_AXIS_BRAMIO_62_IS_ASYNC,M_AXIS_BRAMIO_61_IS_ASYNC,M_AXIS_BRAMIO_60_IS_ASYNC,M_AXIS_BRAMIO_59_IS_ASYNC,M_AXIS_BRAMIO_58_IS_ASYNC,M_AXIS_BRAMIO_57_IS_ASYNC,M_AXIS_BRAMIO_56_IS_ASYNC,M_AXIS_BRAMIO_55_IS_ASYNC,M_AXIS_BRAMIO_54_IS_ASYNC,M_AXIS_BRAMIO_53_IS_ASYNC,M_AXIS_BRAMIO_52_IS_ASYNC,M_AXIS_BRAMIO_51_IS_ASYNC,M_AXIS_BRAMIO_50_IS_ASYNC,M_AXIS_BRAMIO_49_IS_ASYNC,M_AXIS_BRAMIO_48_IS_ASYNC,M_AXIS_BRAMIO_47_IS_ASYNC,M_AXIS_BRAMIO_46_IS_ASYNC,M_AXIS_BRAMIO_45_IS_ASYNC,M_AXIS_BRAMIO_44_IS_ASYNC,M_AXIS_BRAMIO_43_IS_ASYNC,M_AXIS_BRAMIO_42_IS_ASYNC,M_AXIS_BRAMIO_41_IS_ASYNC,M_AXIS_BRAMIO_40_IS_ASYNC,M_AXIS_BRAMIO_39_IS_ASYNC,M_AXIS_BRAMIO_38_IS_ASYNC,M_AXIS_BRAMIO_37_IS_ASYNC,M_AXIS_BRAMIO_36_IS_ASYNC,M_AXIS_BRAMIO_35_IS_ASYNC,M_AXIS_BRAMIO_34_IS_ASYNC,M_AXIS_BRAMIO_33_IS_ASYNC,M_AXIS_BRAMIO_32_IS_ASYNC,M_AXIS_BRAMIO_31_IS_ASYNC,M_AXIS_BRAMIO_30_IS_ASYNC,M_AXIS_BRAMIO_29_IS_ASYNC,M_AXIS_BRAMIO_28_IS_ASYNC,M_AXIS_BRAMIO_27_IS_ASYNC,M_AXIS_BRAMIO_26_IS_ASYNC,M_AXIS_BRAMIO_25_IS_ASYNC,M_AXIS_BRAMIO_24_IS_ASYNC,M_AXIS_BRAMIO_23_IS_ASYNC,M_AXIS_BRAMIO_22_IS_ASYNC,M_AXIS_BRAMIO_21_IS_ASYNC,M_AXIS_BRAMIO_20_IS_ASYNC,M_AXIS_BRAMIO_19_IS_ASYNC,M_AXIS_BRAMIO_18_IS_ASYNC,M_AXIS_BRAMIO_17_IS_ASYNC,M_AXIS_BRAMIO_16_IS_ASYNC,M_AXIS_BRAMIO_15_IS_ASYNC,M_AXIS_BRAMIO_14_IS_ASYNC,M_AXIS_BRAMIO_13_IS_ASYNC,M_AXIS_BRAMIO_12_IS_ASYNC,M_AXIS_BRAMIO_11_IS_ASYNC,M_AXIS_BRAMIO_10_IS_ASYNC,M_AXIS_BRAMIO_9_IS_ASYNC,M_AXIS_BRAMIO_8_IS_ASYNC,M_AXIS_BRAMIO_7_IS_ASYNC,M_AXIS_BRAMIO_6_IS_ASYNC,M_AXIS_BRAMIO_5_IS_ASYNC,M_AXIS_BRAMIO_4_IS_ASYNC,M_AXIS_BRAMIO_3_IS_ASYNC,M_AXIS_BRAMIO_2_IS_ASYNC,M_AXIS_BRAMIO_1_IS_ASYNC,M_AXIS_BRAMIO_0_IS_ASYNC};
    localparam [C_MAX_INPUT_BRAMs-1:0] C_INOUT_BIT_ARRAY = {S_AXIS_BRAM_127_IS_INOUT,S_AXIS_BRAM_126_IS_INOUT,S_AXIS_BRAM_125_IS_INOUT,S_AXIS_BRAM_124_IS_INOUT,S_AXIS_BRAM_123_IS_INOUT,S_AXIS_BRAM_122_IS_INOUT,S_AXIS_BRAM_121_IS_INOUT,S_AXIS_BRAM_120_IS_INOUT,S_AXIS_BRAM_119_IS_INOUT,S_AXIS_BRAM_118_IS_INOUT,S_AXIS_BRAM_117_IS_INOUT,S_AXIS_BRAM_116_IS_INOUT,S_AXIS_BRAM_115_IS_INOUT,S_AXIS_BRAM_114_IS_INOUT,S_AXIS_BRAM_113_IS_INOUT,S_AXIS_BRAM_112_IS_INOUT,S_AXIS_BRAM_111_IS_INOUT,S_AXIS_BRAM_110_IS_INOUT,S_AXIS_BRAM_109_IS_INOUT,S_AXIS_BRAM_108_IS_INOUT,S_AXIS_BRAM_107_IS_INOUT,S_AXIS_BRAM_106_IS_INOUT,S_AXIS_BRAM_105_IS_INOUT,S_AXIS_BRAM_104_IS_INOUT,S_AXIS_BRAM_103_IS_INOUT,S_AXIS_BRAM_102_IS_INOUT,S_AXIS_BRAM_101_IS_INOUT,S_AXIS_BRAM_100_IS_INOUT,S_AXIS_BRAM_99_IS_INOUT,S_AXIS_BRAM_98_IS_INOUT,S_AXIS_BRAM_97_IS_INOUT,S_AXIS_BRAM_96_IS_INOUT,S_AXIS_BRAM_95_IS_INOUT,S_AXIS_BRAM_94_IS_INOUT,S_AXIS_BRAM_93_IS_INOUT,S_AXIS_BRAM_92_IS_INOUT,S_AXIS_BRAM_91_IS_INOUT,S_AXIS_BRAM_90_IS_INOUT,S_AXIS_BRAM_89_IS_INOUT,S_AXIS_BRAM_88_IS_INOUT,S_AXIS_BRAM_87_IS_INOUT,S_AXIS_BRAM_86_IS_INOUT,S_AXIS_BRAM_85_IS_INOUT,S_AXIS_BRAM_84_IS_INOUT,S_AXIS_BRAM_83_IS_INOUT,S_AXIS_BRAM_82_IS_INOUT,S_AXIS_BRAM_81_IS_INOUT,S_AXIS_BRAM_80_IS_INOUT,S_AXIS_BRAM_79_IS_INOUT,S_AXIS_BRAM_78_IS_INOUT,S_AXIS_BRAM_77_IS_INOUT,S_AXIS_BRAM_76_IS_INOUT,S_AXIS_BRAM_75_IS_INOUT,S_AXIS_BRAM_74_IS_INOUT,S_AXIS_BRAM_73_IS_INOUT,S_AXIS_BRAM_72_IS_INOUT,S_AXIS_BRAM_71_IS_INOUT,S_AXIS_BRAM_70_IS_INOUT,S_AXIS_BRAM_69_IS_INOUT,S_AXIS_BRAM_68_IS_INOUT,S_AXIS_BRAM_67_IS_INOUT,S_AXIS_BRAM_66_IS_INOUT,S_AXIS_BRAM_65_IS_INOUT,S_AXIS_BRAM_64_IS_INOUT,S_AXIS_BRAM_63_IS_INOUT,S_AXIS_BRAM_62_IS_INOUT,S_AXIS_BRAM_61_IS_INOUT,S_AXIS_BRAM_60_IS_INOUT,S_AXIS_BRAM_59_IS_INOUT,S_AXIS_BRAM_58_IS_INOUT,S_AXIS_BRAM_57_IS_INOUT,S_AXIS_BRAM_56_IS_INOUT,S_AXIS_BRAM_55_IS_INOUT,S_AXIS_BRAM_54_IS_INOUT,S_AXIS_BRAM_53_IS_INOUT,S_AXIS_BRAM_52_IS_INOUT,S_AXIS_BRAM_51_IS_INOUT,S_AXIS_BRAM_50_IS_INOUT,S_AXIS_BRAM_49_IS_INOUT,S_AXIS_BRAM_48_IS_INOUT,S_AXIS_BRAM_47_IS_INOUT,S_AXIS_BRAM_46_IS_INOUT,S_AXIS_BRAM_45_IS_INOUT,S_AXIS_BRAM_44_IS_INOUT,S_AXIS_BRAM_43_IS_INOUT,S_AXIS_BRAM_42_IS_INOUT,S_AXIS_BRAM_41_IS_INOUT,S_AXIS_BRAM_40_IS_INOUT,S_AXIS_BRAM_39_IS_INOUT,S_AXIS_BRAM_38_IS_INOUT,S_AXIS_BRAM_37_IS_INOUT,S_AXIS_BRAM_36_IS_INOUT,S_AXIS_BRAM_35_IS_INOUT,S_AXIS_BRAM_34_IS_INOUT,S_AXIS_BRAM_33_IS_INOUT,S_AXIS_BRAM_32_IS_INOUT,S_AXIS_BRAM_31_IS_INOUT,S_AXIS_BRAM_30_IS_INOUT,S_AXIS_BRAM_29_IS_INOUT,S_AXIS_BRAM_28_IS_INOUT,S_AXIS_BRAM_27_IS_INOUT,S_AXIS_BRAM_26_IS_INOUT,S_AXIS_BRAM_25_IS_INOUT,S_AXIS_BRAM_24_IS_INOUT,S_AXIS_BRAM_23_IS_INOUT,S_AXIS_BRAM_22_IS_INOUT,S_AXIS_BRAM_21_IS_INOUT,S_AXIS_BRAM_20_IS_INOUT,S_AXIS_BRAM_19_IS_INOUT,S_AXIS_BRAM_18_IS_INOUT,S_AXIS_BRAM_17_IS_INOUT,S_AXIS_BRAM_16_IS_INOUT,S_AXIS_BRAM_15_IS_INOUT,S_AXIS_BRAM_14_IS_INOUT,S_AXIS_BRAM_13_IS_INOUT,S_AXIS_BRAM_12_IS_INOUT,S_AXIS_BRAM_11_IS_INOUT,S_AXIS_BRAM_10_IS_INOUT,S_AXIS_BRAM_9_IS_INOUT,S_AXIS_BRAM_8_IS_INOUT,S_AXIS_BRAM_7_IS_INOUT,S_AXIS_BRAM_6_IS_INOUT,S_AXIS_BRAM_5_IS_INOUT,S_AXIS_BRAM_4_IS_INOUT,S_AXIS_BRAM_3_IS_INOUT,S_AXIS_BRAM_2_IS_INOUT,S_AXIS_BRAM_1_IS_INOUT,S_AXIS_BRAM_0_IS_INOUT};
    localparam [C_MAX_INPUT_BRAMs*32-1:0] C_ADDR_BIT_ARRAY = {S_AXIS_BRAM_127_ADDR_WIDTH,S_AXIS_BRAM_126_ADDR_WIDTH,S_AXIS_BRAM_125_ADDR_WIDTH,S_AXIS_BRAM_124_ADDR_WIDTH,S_AXIS_BRAM_123_ADDR_WIDTH,S_AXIS_BRAM_122_ADDR_WIDTH,S_AXIS_BRAM_121_ADDR_WIDTH,S_AXIS_BRAM_120_ADDR_WIDTH,S_AXIS_BRAM_119_ADDR_WIDTH,S_AXIS_BRAM_118_ADDR_WIDTH,S_AXIS_BRAM_117_ADDR_WIDTH,S_AXIS_BRAM_116_ADDR_WIDTH,S_AXIS_BRAM_115_ADDR_WIDTH,S_AXIS_BRAM_114_ADDR_WIDTH,S_AXIS_BRAM_113_ADDR_WIDTH,S_AXIS_BRAM_112_ADDR_WIDTH,S_AXIS_BRAM_111_ADDR_WIDTH,S_AXIS_BRAM_110_ADDR_WIDTH,S_AXIS_BRAM_109_ADDR_WIDTH,S_AXIS_BRAM_108_ADDR_WIDTH,S_AXIS_BRAM_107_ADDR_WIDTH,S_AXIS_BRAM_106_ADDR_WIDTH,S_AXIS_BRAM_105_ADDR_WIDTH,S_AXIS_BRAM_104_ADDR_WIDTH,S_AXIS_BRAM_103_ADDR_WIDTH,S_AXIS_BRAM_102_ADDR_WIDTH,S_AXIS_BRAM_101_ADDR_WIDTH,S_AXIS_BRAM_100_ADDR_WIDTH,S_AXIS_BRAM_99_ADDR_WIDTH,S_AXIS_BRAM_98_ADDR_WIDTH,S_AXIS_BRAM_97_ADDR_WIDTH,S_AXIS_BRAM_96_ADDR_WIDTH,S_AXIS_BRAM_95_ADDR_WIDTH,S_AXIS_BRAM_94_ADDR_WIDTH,S_AXIS_BRAM_93_ADDR_WIDTH,S_AXIS_BRAM_92_ADDR_WIDTH,S_AXIS_BRAM_91_ADDR_WIDTH,S_AXIS_BRAM_90_ADDR_WIDTH,S_AXIS_BRAM_89_ADDR_WIDTH,S_AXIS_BRAM_88_ADDR_WIDTH,S_AXIS_BRAM_87_ADDR_WIDTH,S_AXIS_BRAM_86_ADDR_WIDTH,S_AXIS_BRAM_85_ADDR_WIDTH,S_AXIS_BRAM_84_ADDR_WIDTH,S_AXIS_BRAM_83_ADDR_WIDTH,S_AXIS_BRAM_82_ADDR_WIDTH,S_AXIS_BRAM_81_ADDR_WIDTH,S_AXIS_BRAM_80_ADDR_WIDTH,S_AXIS_BRAM_79_ADDR_WIDTH,S_AXIS_BRAM_78_ADDR_WIDTH,S_AXIS_BRAM_77_ADDR_WIDTH,S_AXIS_BRAM_76_ADDR_WIDTH,S_AXIS_BRAM_75_ADDR_WIDTH,S_AXIS_BRAM_74_ADDR_WIDTH,S_AXIS_BRAM_73_ADDR_WIDTH,S_AXIS_BRAM_72_ADDR_WIDTH,S_AXIS_BRAM_71_ADDR_WIDTH,S_AXIS_BRAM_70_ADDR_WIDTH,S_AXIS_BRAM_69_ADDR_WIDTH,S_AXIS_BRAM_68_ADDR_WIDTH,S_AXIS_BRAM_67_ADDR_WIDTH,S_AXIS_BRAM_66_ADDR_WIDTH,S_AXIS_BRAM_65_ADDR_WIDTH,S_AXIS_BRAM_64_ADDR_WIDTH,S_AXIS_BRAM_63_ADDR_WIDTH,S_AXIS_BRAM_62_ADDR_WIDTH,S_AXIS_BRAM_61_ADDR_WIDTH,S_AXIS_BRAM_60_ADDR_WIDTH,S_AXIS_BRAM_59_ADDR_WIDTH,S_AXIS_BRAM_58_ADDR_WIDTH,S_AXIS_BRAM_57_ADDR_WIDTH,S_AXIS_BRAM_56_ADDR_WIDTH,S_AXIS_BRAM_55_ADDR_WIDTH,S_AXIS_BRAM_54_ADDR_WIDTH,S_AXIS_BRAM_53_ADDR_WIDTH,S_AXIS_BRAM_52_ADDR_WIDTH,S_AXIS_BRAM_51_ADDR_WIDTH,S_AXIS_BRAM_50_ADDR_WIDTH,S_AXIS_BRAM_49_ADDR_WIDTH,S_AXIS_BRAM_48_ADDR_WIDTH,S_AXIS_BRAM_47_ADDR_WIDTH,S_AXIS_BRAM_46_ADDR_WIDTH,S_AXIS_BRAM_45_ADDR_WIDTH,S_AXIS_BRAM_44_ADDR_WIDTH,S_AXIS_BRAM_43_ADDR_WIDTH,S_AXIS_BRAM_42_ADDR_WIDTH,S_AXIS_BRAM_41_ADDR_WIDTH,S_AXIS_BRAM_40_ADDR_WIDTH,S_AXIS_BRAM_39_ADDR_WIDTH,S_AXIS_BRAM_38_ADDR_WIDTH,S_AXIS_BRAM_37_ADDR_WIDTH,S_AXIS_BRAM_36_ADDR_WIDTH,S_AXIS_BRAM_35_ADDR_WIDTH,S_AXIS_BRAM_34_ADDR_WIDTH,S_AXIS_BRAM_33_ADDR_WIDTH,S_AXIS_BRAM_32_ADDR_WIDTH,S_AXIS_BRAM_31_ADDR_WIDTH,S_AXIS_BRAM_30_ADDR_WIDTH,S_AXIS_BRAM_29_ADDR_WIDTH,S_AXIS_BRAM_28_ADDR_WIDTH,S_AXIS_BRAM_27_ADDR_WIDTH,S_AXIS_BRAM_26_ADDR_WIDTH,S_AXIS_BRAM_25_ADDR_WIDTH,S_AXIS_BRAM_24_ADDR_WIDTH,S_AXIS_BRAM_23_ADDR_WIDTH,S_AXIS_BRAM_22_ADDR_WIDTH,S_AXIS_BRAM_21_ADDR_WIDTH,S_AXIS_BRAM_20_ADDR_WIDTH,S_AXIS_BRAM_19_ADDR_WIDTH,S_AXIS_BRAM_18_ADDR_WIDTH,S_AXIS_BRAM_17_ADDR_WIDTH,S_AXIS_BRAM_16_ADDR_WIDTH,S_AXIS_BRAM_15_ADDR_WIDTH,S_AXIS_BRAM_14_ADDR_WIDTH,S_AXIS_BRAM_13_ADDR_WIDTH,S_AXIS_BRAM_12_ADDR_WIDTH,S_AXIS_BRAM_11_ADDR_WIDTH,S_AXIS_BRAM_10_ADDR_WIDTH,S_AXIS_BRAM_9_ADDR_WIDTH,S_AXIS_BRAM_8_ADDR_WIDTH,S_AXIS_BRAM_7_ADDR_WIDTH,S_AXIS_BRAM_6_ADDR_WIDTH,S_AXIS_BRAM_5_ADDR_WIDTH,S_AXIS_BRAM_4_ADDR_WIDTH,S_AXIS_BRAM_3_ADDR_WIDTH,S_AXIS_BRAM_2_ADDR_WIDTH,S_AXIS_BRAM_1_ADDR_WIDTH,S_AXIS_BRAM_0_ADDR_WIDTH};
    localparam [(C_MAX_INPUT_BRAMs*32)-1:0] C_MB_DEPTH_BIT_ARRAY = {S_AXIS_BRAM_127_MB_DEPTH,S_AXIS_BRAM_126_MB_DEPTH,S_AXIS_BRAM_125_MB_DEPTH,S_AXIS_BRAM_124_MB_DEPTH,S_AXIS_BRAM_123_MB_DEPTH,S_AXIS_BRAM_122_MB_DEPTH,S_AXIS_BRAM_121_MB_DEPTH,S_AXIS_BRAM_120_MB_DEPTH,S_AXIS_BRAM_119_MB_DEPTH,S_AXIS_BRAM_118_MB_DEPTH,S_AXIS_BRAM_117_MB_DEPTH,S_AXIS_BRAM_116_MB_DEPTH,S_AXIS_BRAM_115_MB_DEPTH,S_AXIS_BRAM_114_MB_DEPTH,S_AXIS_BRAM_113_MB_DEPTH,S_AXIS_BRAM_112_MB_DEPTH,S_AXIS_BRAM_111_MB_DEPTH,S_AXIS_BRAM_110_MB_DEPTH,S_AXIS_BRAM_109_MB_DEPTH,S_AXIS_BRAM_108_MB_DEPTH,S_AXIS_BRAM_107_MB_DEPTH,S_AXIS_BRAM_106_MB_DEPTH,S_AXIS_BRAM_105_MB_DEPTH,S_AXIS_BRAM_104_MB_DEPTH,S_AXIS_BRAM_103_MB_DEPTH,S_AXIS_BRAM_102_MB_DEPTH,S_AXIS_BRAM_101_MB_DEPTH,S_AXIS_BRAM_100_MB_DEPTH,S_AXIS_BRAM_99_MB_DEPTH,S_AXIS_BRAM_98_MB_DEPTH,S_AXIS_BRAM_97_MB_DEPTH,S_AXIS_BRAM_96_MB_DEPTH,S_AXIS_BRAM_95_MB_DEPTH,S_AXIS_BRAM_94_MB_DEPTH,S_AXIS_BRAM_93_MB_DEPTH,S_AXIS_BRAM_92_MB_DEPTH,S_AXIS_BRAM_91_MB_DEPTH,S_AXIS_BRAM_90_MB_DEPTH,S_AXIS_BRAM_89_MB_DEPTH,S_AXIS_BRAM_88_MB_DEPTH,S_AXIS_BRAM_87_MB_DEPTH,S_AXIS_BRAM_86_MB_DEPTH,S_AXIS_BRAM_85_MB_DEPTH,S_AXIS_BRAM_84_MB_DEPTH,S_AXIS_BRAM_83_MB_DEPTH,S_AXIS_BRAM_82_MB_DEPTH,S_AXIS_BRAM_81_MB_DEPTH,S_AXIS_BRAM_80_MB_DEPTH,S_AXIS_BRAM_79_MB_DEPTH,S_AXIS_BRAM_78_MB_DEPTH,S_AXIS_BRAM_77_MB_DEPTH,S_AXIS_BRAM_76_MB_DEPTH,S_AXIS_BRAM_75_MB_DEPTH,S_AXIS_BRAM_74_MB_DEPTH,S_AXIS_BRAM_73_MB_DEPTH,S_AXIS_BRAM_72_MB_DEPTH,S_AXIS_BRAM_71_MB_DEPTH,S_AXIS_BRAM_70_MB_DEPTH,S_AXIS_BRAM_69_MB_DEPTH,S_AXIS_BRAM_68_MB_DEPTH,S_AXIS_BRAM_67_MB_DEPTH,S_AXIS_BRAM_66_MB_DEPTH,S_AXIS_BRAM_65_MB_DEPTH,S_AXIS_BRAM_64_MB_DEPTH,S_AXIS_BRAM_63_MB_DEPTH,S_AXIS_BRAM_62_MB_DEPTH,S_AXIS_BRAM_61_MB_DEPTH,S_AXIS_BRAM_60_MB_DEPTH,S_AXIS_BRAM_59_MB_DEPTH,S_AXIS_BRAM_58_MB_DEPTH,S_AXIS_BRAM_57_MB_DEPTH,S_AXIS_BRAM_56_MB_DEPTH,S_AXIS_BRAM_55_MB_DEPTH,S_AXIS_BRAM_54_MB_DEPTH,S_AXIS_BRAM_53_MB_DEPTH,S_AXIS_BRAM_52_MB_DEPTH,S_AXIS_BRAM_51_MB_DEPTH,S_AXIS_BRAM_50_MB_DEPTH,S_AXIS_BRAM_49_MB_DEPTH,S_AXIS_BRAM_48_MB_DEPTH,S_AXIS_BRAM_47_MB_DEPTH,S_AXIS_BRAM_46_MB_DEPTH,S_AXIS_BRAM_45_MB_DEPTH,S_AXIS_BRAM_44_MB_DEPTH,S_AXIS_BRAM_43_MB_DEPTH,S_AXIS_BRAM_42_MB_DEPTH,S_AXIS_BRAM_41_MB_DEPTH,S_AXIS_BRAM_40_MB_DEPTH,S_AXIS_BRAM_39_MB_DEPTH,S_AXIS_BRAM_38_MB_DEPTH,S_AXIS_BRAM_37_MB_DEPTH,S_AXIS_BRAM_36_MB_DEPTH,S_AXIS_BRAM_35_MB_DEPTH,S_AXIS_BRAM_34_MB_DEPTH,S_AXIS_BRAM_33_MB_DEPTH,S_AXIS_BRAM_32_MB_DEPTH,S_AXIS_BRAM_31_MB_DEPTH,S_AXIS_BRAM_30_MB_DEPTH,S_AXIS_BRAM_29_MB_DEPTH,S_AXIS_BRAM_28_MB_DEPTH,S_AXIS_BRAM_27_MB_DEPTH,S_AXIS_BRAM_26_MB_DEPTH,S_AXIS_BRAM_25_MB_DEPTH,S_AXIS_BRAM_24_MB_DEPTH,S_AXIS_BRAM_23_MB_DEPTH,S_AXIS_BRAM_22_MB_DEPTH,S_AXIS_BRAM_21_MB_DEPTH,S_AXIS_BRAM_20_MB_DEPTH,S_AXIS_BRAM_19_MB_DEPTH,S_AXIS_BRAM_18_MB_DEPTH,S_AXIS_BRAM_17_MB_DEPTH,S_AXIS_BRAM_16_MB_DEPTH,S_AXIS_BRAM_15_MB_DEPTH,S_AXIS_BRAM_14_MB_DEPTH,S_AXIS_BRAM_13_MB_DEPTH,S_AXIS_BRAM_12_MB_DEPTH,S_AXIS_BRAM_11_MB_DEPTH,S_AXIS_BRAM_10_MB_DEPTH,S_AXIS_BRAM_9_MB_DEPTH,S_AXIS_BRAM_8_MB_DEPTH,S_AXIS_BRAM_7_MB_DEPTH,S_AXIS_BRAM_6_MB_DEPTH,S_AXIS_BRAM_5_MB_DEPTH,S_AXIS_BRAM_4_MB_DEPTH,S_AXIS_BRAM_3_MB_DEPTH,S_AXIS_BRAM_2_MB_DEPTH,S_AXIS_BRAM_1_MB_DEPTH,S_AXIS_BRAM_0_MB_DEPTH};
    localparam [(C_MAX_INPUT_BRAMs*32)-1:0] C_PORTS_BIT_ARRAY = {S_AXIS_BRAM_127_PORTS,S_AXIS_BRAM_126_PORTS,S_AXIS_BRAM_125_PORTS,S_AXIS_BRAM_124_PORTS,S_AXIS_BRAM_123_PORTS,S_AXIS_BRAM_122_PORTS,S_AXIS_BRAM_121_PORTS,S_AXIS_BRAM_120_PORTS,S_AXIS_BRAM_119_PORTS,S_AXIS_BRAM_118_PORTS,S_AXIS_BRAM_117_PORTS,S_AXIS_BRAM_116_PORTS,S_AXIS_BRAM_115_PORTS,S_AXIS_BRAM_114_PORTS,S_AXIS_BRAM_113_PORTS,S_AXIS_BRAM_112_PORTS,S_AXIS_BRAM_111_PORTS,S_AXIS_BRAM_110_PORTS,S_AXIS_BRAM_109_PORTS,S_AXIS_BRAM_108_PORTS,S_AXIS_BRAM_107_PORTS,S_AXIS_BRAM_106_PORTS,S_AXIS_BRAM_105_PORTS,S_AXIS_BRAM_104_PORTS,S_AXIS_BRAM_103_PORTS,S_AXIS_BRAM_102_PORTS,S_AXIS_BRAM_101_PORTS,S_AXIS_BRAM_100_PORTS,S_AXIS_BRAM_99_PORTS,S_AXIS_BRAM_98_PORTS,S_AXIS_BRAM_97_PORTS,S_AXIS_BRAM_96_PORTS,S_AXIS_BRAM_95_PORTS,S_AXIS_BRAM_94_PORTS,S_AXIS_BRAM_93_PORTS,S_AXIS_BRAM_92_PORTS,S_AXIS_BRAM_91_PORTS,S_AXIS_BRAM_90_PORTS,S_AXIS_BRAM_89_PORTS,S_AXIS_BRAM_88_PORTS,S_AXIS_BRAM_87_PORTS,S_AXIS_BRAM_86_PORTS,S_AXIS_BRAM_85_PORTS,S_AXIS_BRAM_84_PORTS,S_AXIS_BRAM_83_PORTS,S_AXIS_BRAM_82_PORTS,S_AXIS_BRAM_81_PORTS,S_AXIS_BRAM_80_PORTS,S_AXIS_BRAM_79_PORTS,S_AXIS_BRAM_78_PORTS,S_AXIS_BRAM_77_PORTS,S_AXIS_BRAM_76_PORTS,S_AXIS_BRAM_75_PORTS,S_AXIS_BRAM_74_PORTS,S_AXIS_BRAM_73_PORTS,S_AXIS_BRAM_72_PORTS,S_AXIS_BRAM_71_PORTS,S_AXIS_BRAM_70_PORTS,S_AXIS_BRAM_69_PORTS,S_AXIS_BRAM_68_PORTS,S_AXIS_BRAM_67_PORTS,S_AXIS_BRAM_66_PORTS,S_AXIS_BRAM_65_PORTS,S_AXIS_BRAM_64_PORTS,S_AXIS_BRAM_63_PORTS,S_AXIS_BRAM_62_PORTS,S_AXIS_BRAM_61_PORTS,S_AXIS_BRAM_60_PORTS,S_AXIS_BRAM_59_PORTS,S_AXIS_BRAM_58_PORTS,S_AXIS_BRAM_57_PORTS,S_AXIS_BRAM_56_PORTS,S_AXIS_BRAM_55_PORTS,S_AXIS_BRAM_54_PORTS,S_AXIS_BRAM_53_PORTS,S_AXIS_BRAM_52_PORTS,S_AXIS_BRAM_51_PORTS,S_AXIS_BRAM_50_PORTS,S_AXIS_BRAM_49_PORTS,S_AXIS_BRAM_48_PORTS,S_AXIS_BRAM_47_PORTS,S_AXIS_BRAM_46_PORTS,S_AXIS_BRAM_45_PORTS,S_AXIS_BRAM_44_PORTS,S_AXIS_BRAM_43_PORTS,S_AXIS_BRAM_42_PORTS,S_AXIS_BRAM_41_PORTS,S_AXIS_BRAM_40_PORTS,S_AXIS_BRAM_39_PORTS,S_AXIS_BRAM_38_PORTS,S_AXIS_BRAM_37_PORTS,S_AXIS_BRAM_36_PORTS,S_AXIS_BRAM_35_PORTS,S_AXIS_BRAM_34_PORTS,S_AXIS_BRAM_33_PORTS,S_AXIS_BRAM_32_PORTS,S_AXIS_BRAM_31_PORTS,S_AXIS_BRAM_30_PORTS,S_AXIS_BRAM_29_PORTS,S_AXIS_BRAM_28_PORTS,S_AXIS_BRAM_27_PORTS,S_AXIS_BRAM_26_PORTS,S_AXIS_BRAM_25_PORTS,S_AXIS_BRAM_24_PORTS,S_AXIS_BRAM_23_PORTS,S_AXIS_BRAM_22_PORTS,S_AXIS_BRAM_21_PORTS,S_AXIS_BRAM_20_PORTS,S_AXIS_BRAM_19_PORTS,S_AXIS_BRAM_18_PORTS,S_AXIS_BRAM_17_PORTS,S_AXIS_BRAM_16_PORTS,S_AXIS_BRAM_15_PORTS,S_AXIS_BRAM_14_PORTS,S_AXIS_BRAM_13_PORTS,S_AXIS_BRAM_12_PORTS,S_AXIS_BRAM_11_PORTS,S_AXIS_BRAM_10_PORTS,S_AXIS_BRAM_9_PORTS,S_AXIS_BRAM_8_PORTS,S_AXIS_BRAM_7_PORTS,S_AXIS_BRAM_6_PORTS,S_AXIS_BRAM_5_PORTS,S_AXIS_BRAM_4_PORTS,S_AXIS_BRAM_3_PORTS,S_AXIS_BRAM_2_PORTS,S_AXIS_BRAM_1_PORTS,S_AXIS_BRAM_0_PORTS};
    
    wire [C_NUM_INPUT_BRAMs-1:0] in_clk;
    wire [C_NUM_INPUT_BRAMs-1:0] in_rst;
    wire [C_NUM_INPUT_BRAMs-1:0] out_clk;
    wire [C_NUM_INPUT_BRAMs-1:0] out_rst;
    
    wire [C_NUM_INPUT_BRAMs-1:0] tlast;
    wire [C_NUM_INPUT_BRAMs-1:0] tvalid;
    wire [C_MAX_BIT_WIDTH/8-1:0] tkeep [C_NUM_INPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH/8-1:0] tstrb [C_NUM_INPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0]   tdata [C_NUM_INPUT_BRAMs-1:0];
    wire [C_NUM_INPUT_BRAMs-1:0] tready;
    
    wire [C_NUM_INPUT_BRAMs-1:0] dwconv0_tlast;
    wire [C_NUM_INPUT_BRAMs-1:0] dwconv0_tvalid;
    wire [C_MAX_BIT_WIDTH-1:0] dwconv0_tdata [C_NUM_INPUT_BRAMs-1:0];
    wire [C_NUM_INPUT_BRAMs-1:0] dwconv0_tready;
    
    wire [C_NUM_INPUT_BRAMs-1:0] dwconv1_tlast;
    wire [C_NUM_INPUT_BRAMs-1:0] dwconv1_tvalid;
    wire [C_MAX_BIT_WIDTH-1:0] dwconv1_tdata [C_NUM_INPUT_BRAMs-1:0];
    wire [C_NUM_INPUT_BRAMs-1:0] dwconv1_tready;
    wire [C_MAX_BIT_WIDTH/8-1:0] dwconv1_tkeep [C_NUM_INPUT_BRAMs-1:0];
    wire [C_MAX_BIT_WIDTH/8-1:0] dwconv1_tstrb [C_NUM_INPUT_BRAMs-1:0];
    
    wire [C_NUM_INPUT_BRAMs-1:0] buf0_tlast;
    wire [C_NUM_INPUT_BRAMs-1:0] buf0_tvalid;
    wire [C_MAX_BIT_WIDTH-1:0] buf0_tdata [C_NUM_INPUT_BRAMs-1:0];
    wire [C_NUM_INPUT_BRAMs-1:0] buf0_tready;

    wire [C_NUM_INPUT_BRAMs-1:0] buf1_tlast;
    wire [C_NUM_INPUT_BRAMs-1:0] buf1_tvalid;
    wire [C_MAX_BIT_WIDTH-1:0] buf1_tdata [C_NUM_INPUT_BRAMs-1:0];
    wire [C_NUM_INPUT_BRAMs-1:0] buf1_tready;

    wire [C_NUM_INPUT_BRAMs-1:0] out_tlast;
    wire [C_NUM_INPUT_BRAMs-1:0] out_tvalid;
    wire [C_MAX_BIT_WIDTH-1:0] out_tdata [C_NUM_INPUT_BRAMs-1:0];
    wire [C_NUM_INPUT_BRAMs-1:0] out_tready;
    
    wire [C_MAX_BIT_WIDTH-1:0] bram_addr [C_NUM_INPUT_BRAMs-1:0][C_MAX_BRAM_PORTs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0] bram_din [C_NUM_INPUT_BRAMs-1:0][C_MAX_BRAM_PORTs-1:0];
    wire [C_MAX_BIT_WIDTH-1:0] bram_dout [C_NUM_INPUT_BRAMs-1:0][C_MAX_BRAM_PORTs-1:0];
    wire [C_MAX_BIT_WIDTH/8-1:0] bram_we [C_NUM_INPUT_BRAMs-1:0][C_MAX_BRAM_PORTs-1:0];
    wire bram_en [C_NUM_INPUT_BRAMs-1:0][C_MAX_BRAM_PORTs-1:0];
    
    //assign inputs to buses, and buses to outputs
    generate
        if(C_NUM_INPUT_BRAMs > 0) begin
            assign in_clk[0] = s_axis_bram_0_aclk;
            assign in_rst[0] = s_axis_bram_0_aresetn;
            assign tlast[0] = s_axis_bram_0_tlast;
            assign tvalid[0] = s_axis_bram_0_tvalid;
            assign tkeep[0][S_AXIS_BRAM_0_DMWIDTH/8-1:0] = s_axis_bram_0_tkeep;
            assign tstrb[0][S_AXIS_BRAM_0_DMWIDTH/8-1:0] = s_axis_bram_0_tstrb;
            assign tdata[0][S_AXIS_BRAM_0_DMWIDTH-1:0] = s_axis_bram_0_tdata;
            assign s_axis_bram_0_tready = tready[0];
            
            assign bram_addr[0][0][S_AXIS_BRAM_0_ADDR_WIDTH-1:0] = ap_bram_0_addr0;
            assign bram_din[0][0][S_AXIS_BRAM_0_WIDTH-1:0] = ap_bram_0_din0;
            assign ap_bram_0_dout0 = bram_dout[0][0][S_AXIS_BRAM_0_WIDTH-1:0];
            assign bram_we[0][0][S_AXIS_BRAM_0_WIDTH/8-1:0] = ap_bram_0_we0;
            assign bram_en[0][0] = ap_bram_0_en0;
            assign bram_addr[0][1][S_AXIS_BRAM_0_ADDR_WIDTH-1:0] = ap_bram_0_addr1;
            assign bram_din[0][1][S_AXIS_BRAM_0_WIDTH-1:0] = ap_bram_0_din1;
            assign ap_bram_0_dout1 = bram_dout[0][1][S_AXIS_BRAM_0_WIDTH-1:0];
            assign bram_we[0][1][S_AXIS_BRAM_0_WIDTH/8-1:0] = ap_bram_0_we1;
            assign bram_en[0][1] = ap_bram_0_en1;
            
            assign out_clk[0] = m_axis_bramio_0_aclk;
            assign out_rst[0] = m_axis_bramio_0_aresetn;
            assign dwconv1_tready[0] = m_axis_bramio_0_tready;
            assign m_axis_bramio_0_tlast = dwconv1_tlast[0];
            assign m_axis_bramio_0_tvalid = dwconv1_tvalid[0];
            assign m_axis_bramio_0_tkeep = dwconv1_tkeep[0][M_AXIS_BRAMIO_0_DMWIDTH/8-1:0];
            assign m_axis_bramio_0_tstrb = dwconv1_tstrb[0][M_AXIS_BRAMIO_0_DMWIDTH/8-1:0];
            assign m_axis_bramio_0_tdata = dwconv1_tdata[0][M_AXIS_BRAMIO_0_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 1) begin
            assign in_clk[1] = s_axis_bram_1_aclk;
            assign in_rst[1] = s_axis_bram_1_aresetn;
            assign tlast[1] = s_axis_bram_1_tlast;
            assign tvalid[1] = s_axis_bram_1_tvalid;
            assign tkeep[1][S_AXIS_BRAM_1_DMWIDTH/8-1:0] = s_axis_bram_1_tkeep;
            assign tstrb[1][S_AXIS_BRAM_1_DMWIDTH/8-1:0] = s_axis_bram_1_tstrb;
            assign tdata[1][S_AXIS_BRAM_1_DMWIDTH-1:0] = s_axis_bram_1_tdata;
            assign s_axis_bram_1_tready = tready[1];
            
            assign bram_addr[1][0][S_AXIS_BRAM_1_ADDR_WIDTH-1:0] = ap_bram_1_addr0;
            assign bram_din[1][0][S_AXIS_BRAM_1_WIDTH-1:0] = ap_bram_1_din0;
            assign ap_bram_1_dout0 = bram_dout[1][0][S_AXIS_BRAM_1_WIDTH-1:0];
            assign bram_we[1][0][S_AXIS_BRAM_1_WIDTH/8-1:0] = ap_bram_1_we0;
            assign bram_en[1][0] = ap_bram_1_en0;
            assign bram_addr[1][1][S_AXIS_BRAM_1_ADDR_WIDTH-1:0] = ap_bram_1_addr1;
            assign bram_din[1][1][S_AXIS_BRAM_1_WIDTH-1:0] = ap_bram_1_din1;
            assign ap_bram_1_dout1 = bram_dout[1][1][S_AXIS_BRAM_1_WIDTH-1:0];
            assign bram_we[1][1][S_AXIS_BRAM_1_WIDTH/8-1:0] = ap_bram_1_we1;
            assign bram_en[1][1] = ap_bram_1_en1;
            
            assign out_clk[1] = m_axis_bramio_1_aclk;
            assign out_rst[1] = m_axis_bramio_1_aresetn;
            assign dwconv1_tready[1] = m_axis_bramio_1_tready;
            assign m_axis_bramio_1_tlast = dwconv1_tlast[1];
            assign m_axis_bramio_1_tvalid = dwconv1_tvalid[1];
            assign m_axis_bramio_1_tkeep = dwconv1_tkeep[1][M_AXIS_BRAMIO_1_DMWIDTH/8-1:0];
            assign m_axis_bramio_1_tstrb = dwconv1_tstrb[1][M_AXIS_BRAMIO_1_DMWIDTH/8-1:0];
            assign m_axis_bramio_1_tdata = dwconv1_tdata[1][M_AXIS_BRAMIO_1_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 2) begin
            assign in_clk[2] = s_axis_bram_2_aclk;
            assign in_rst[2] = s_axis_bram_2_aresetn;
            assign tlast[2] = s_axis_bram_2_tlast;
            assign tvalid[2] = s_axis_bram_2_tvalid;
            assign tkeep[2][S_AXIS_BRAM_2_DMWIDTH/8-1:0] = s_axis_bram_2_tkeep;
            assign tstrb[2][S_AXIS_BRAM_2_DMWIDTH/8-1:0] = s_axis_bram_2_tstrb;
            assign tdata[2][S_AXIS_BRAM_2_DMWIDTH-1:0] = s_axis_bram_2_tdata;
            assign s_axis_bram_2_tready = tready[2];
            
            assign bram_addr[2][0][S_AXIS_BRAM_2_ADDR_WIDTH-1:0] = ap_bram_2_addr0;
            assign bram_din[2][0][S_AXIS_BRAM_2_WIDTH-1:0] = ap_bram_2_din0;
            assign ap_bram_2_dout0 = bram_dout[2][0][S_AXIS_BRAM_2_WIDTH-1:0];
            assign bram_we[2][0][S_AXIS_BRAM_2_WIDTH/8-1:0] = ap_bram_2_we0;
            assign bram_en[2][0] = ap_bram_2_en0;
            assign bram_addr[2][1][S_AXIS_BRAM_2_ADDR_WIDTH-1:0] = ap_bram_2_addr1;
            assign bram_din[2][1][S_AXIS_BRAM_2_WIDTH-1:0] = ap_bram_2_din1;
            assign ap_bram_2_dout1 = bram_dout[2][1][S_AXIS_BRAM_2_WIDTH-1:0];
            assign bram_we[2][1][S_AXIS_BRAM_2_WIDTH/8-1:0] = ap_bram_2_we1;
            assign bram_en[2][1] = ap_bram_2_en1;
            
            assign out_clk[2] = m_axis_bramio_2_aclk;
            assign out_rst[2] = m_axis_bramio_2_aresetn;
            assign dwconv1_tready[2] = m_axis_bramio_2_tready;
            assign m_axis_bramio_2_tlast = dwconv1_tlast[2];
            assign m_axis_bramio_2_tvalid = dwconv1_tvalid[2];
            assign m_axis_bramio_2_tkeep = dwconv1_tkeep[2][M_AXIS_BRAMIO_2_DMWIDTH/8-1:0];
            assign m_axis_bramio_2_tstrb = dwconv1_tstrb[2][M_AXIS_BRAMIO_2_DMWIDTH/8-1:0];
            assign m_axis_bramio_2_tdata = dwconv1_tdata[2][M_AXIS_BRAMIO_2_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 3) begin
            assign in_clk[3] = s_axis_bram_3_aclk;
            assign in_rst[3] = s_axis_bram_3_aresetn;
            assign tlast[3] = s_axis_bram_3_tlast;
            assign tvalid[3] = s_axis_bram_3_tvalid;
            assign tkeep[3][S_AXIS_BRAM_3_DMWIDTH/8-1:0] = s_axis_bram_3_tkeep;
            assign tstrb[3][S_AXIS_BRAM_3_DMWIDTH/8-1:0] = s_axis_bram_3_tstrb;
            assign tdata[3][S_AXIS_BRAM_3_DMWIDTH-1:0] = s_axis_bram_3_tdata;
            assign s_axis_bram_3_tready = tready[3];
            
            assign bram_addr[3][0][S_AXIS_BRAM_3_ADDR_WIDTH-1:0] = ap_bram_3_addr0;
            assign bram_din[3][0][S_AXIS_BRAM_3_WIDTH-1:0] = ap_bram_3_din0;
            assign ap_bram_3_dout0 = bram_dout[3][0][S_AXIS_BRAM_3_WIDTH-1:0];
            assign bram_we[3][0][S_AXIS_BRAM_3_WIDTH/8-1:0] = ap_bram_3_we0;
            assign bram_en[3][0] = ap_bram_3_en0;
            assign bram_addr[3][1][S_AXIS_BRAM_3_ADDR_WIDTH-1:0] = ap_bram_3_addr1;
            assign bram_din[3][1][S_AXIS_BRAM_3_WIDTH-1:0] = ap_bram_3_din1;
            assign ap_bram_3_dout1 = bram_dout[3][1][S_AXIS_BRAM_3_WIDTH-1:0];
            assign bram_we[3][1][S_AXIS_BRAM_3_WIDTH/8-1:0] = ap_bram_3_we1;
            assign bram_en[3][1] = ap_bram_3_en1;
            
            assign out_clk[3] = m_axis_bramio_3_aclk;
            assign out_rst[3] = m_axis_bramio_3_aresetn;
            assign dwconv1_tready[3] = m_axis_bramio_3_tready;
            assign m_axis_bramio_3_tlast = dwconv1_tlast[3];
            assign m_axis_bramio_3_tvalid = dwconv1_tvalid[3];
            assign m_axis_bramio_3_tkeep = dwconv1_tkeep[3][M_AXIS_BRAMIO_3_DMWIDTH/8-1:0];
            assign m_axis_bramio_3_tstrb = dwconv1_tstrb[3][M_AXIS_BRAMIO_3_DMWIDTH/8-1:0];
            assign m_axis_bramio_3_tdata = dwconv1_tdata[3][M_AXIS_BRAMIO_3_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 4) begin
            assign in_clk[4] = s_axis_bram_4_aclk;
            assign in_rst[4] = s_axis_bram_4_aresetn;
            assign tlast[4] = s_axis_bram_4_tlast;
            assign tvalid[4] = s_axis_bram_4_tvalid;
            assign tkeep[4][S_AXIS_BRAM_4_DMWIDTH/8-1:0] = s_axis_bram_4_tkeep;
            assign tstrb[4][S_AXIS_BRAM_4_DMWIDTH/8-1:0] = s_axis_bram_4_tstrb;
            assign tdata[4][S_AXIS_BRAM_4_DMWIDTH-1:0] = s_axis_bram_4_tdata;
            assign s_axis_bram_4_tready = tready[4];
            
            assign bram_addr[4][0][S_AXIS_BRAM_4_ADDR_WIDTH-1:0] = ap_bram_4_addr0;
            assign bram_din[4][0][S_AXIS_BRAM_4_WIDTH-1:0] = ap_bram_4_din0;
            assign ap_bram_4_dout0 = bram_dout[4][0][S_AXIS_BRAM_4_WIDTH-1:0];
            assign bram_we[4][0][S_AXIS_BRAM_4_WIDTH/8-1:0] = ap_bram_4_we0;
            assign bram_en[4][0] = ap_bram_4_en0;
            assign bram_addr[4][1][S_AXIS_BRAM_4_ADDR_WIDTH-1:0] = ap_bram_4_addr1;
            assign bram_din[4][1][S_AXIS_BRAM_4_WIDTH-1:0] = ap_bram_4_din1;
            assign ap_bram_4_dout1 = bram_dout[4][1][S_AXIS_BRAM_4_WIDTH-1:0];
            assign bram_we[4][1][S_AXIS_BRAM_4_WIDTH/8-1:0] = ap_bram_4_we1;
            assign bram_en[4][1] = ap_bram_4_en1;
            
            assign out_clk[4] = m_axis_bramio_4_aclk;
            assign out_rst[4] = m_axis_bramio_4_aresetn;
            assign dwconv1_tready[4] = m_axis_bramio_4_tready;
            assign m_axis_bramio_4_tlast = dwconv1_tlast[4];
            assign m_axis_bramio_4_tvalid = dwconv1_tvalid[4];
            assign m_axis_bramio_4_tkeep = dwconv1_tkeep[4][M_AXIS_BRAMIO_4_DMWIDTH/8-1:0];
            assign m_axis_bramio_4_tstrb = dwconv1_tstrb[4][M_AXIS_BRAMIO_4_DMWIDTH/8-1:0];
            assign m_axis_bramio_4_tdata = dwconv1_tdata[4][M_AXIS_BRAMIO_4_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 5) begin
            assign in_clk[5] = s_axis_bram_5_aclk;
            assign in_rst[5] = s_axis_bram_5_aresetn;
            assign tlast[5] = s_axis_bram_5_tlast;
            assign tvalid[5] = s_axis_bram_5_tvalid;
            assign tkeep[5][S_AXIS_BRAM_5_DMWIDTH/8-1:0] = s_axis_bram_5_tkeep;
            assign tstrb[5][S_AXIS_BRAM_5_DMWIDTH/8-1:0] = s_axis_bram_5_tstrb;
            assign tdata[5][S_AXIS_BRAM_5_DMWIDTH-1:0] = s_axis_bram_5_tdata;
            assign s_axis_bram_5_tready = tready[5];
            
            assign bram_addr[5][0][S_AXIS_BRAM_5_ADDR_WIDTH-1:0] = ap_bram_5_addr0;
            assign bram_din[5][0][S_AXIS_BRAM_5_WIDTH-1:0] = ap_bram_5_din0;
            assign ap_bram_5_dout0 = bram_dout[5][0][S_AXIS_BRAM_5_WIDTH-1:0];
            assign bram_we[5][0][S_AXIS_BRAM_5_WIDTH/8-1:0] = ap_bram_5_we0;
            assign bram_en[5][0] = ap_bram_5_en0;
            assign bram_addr[5][1][S_AXIS_BRAM_5_ADDR_WIDTH-1:0] = ap_bram_5_addr1;
            assign bram_din[5][1][S_AXIS_BRAM_5_WIDTH-1:0] = ap_bram_5_din1;
            assign ap_bram_5_dout1 = bram_dout[5][1][S_AXIS_BRAM_5_WIDTH-1:0];
            assign bram_we[5][1][S_AXIS_BRAM_5_WIDTH/8-1:0] = ap_bram_5_we1;
            assign bram_en[5][1] = ap_bram_5_en1;
            
            assign out_clk[5] = m_axis_bramio_5_aclk;
            assign out_rst[5] = m_axis_bramio_5_aresetn;
            assign dwconv1_tready[5] = m_axis_bramio_5_tready;
            assign m_axis_bramio_5_tlast = dwconv1_tlast[5];
            assign m_axis_bramio_5_tvalid = dwconv1_tvalid[5];
            assign m_axis_bramio_5_tkeep = dwconv1_tkeep[5][M_AXIS_BRAMIO_5_DMWIDTH/8-1:0];
            assign m_axis_bramio_5_tstrb = dwconv1_tstrb[5][M_AXIS_BRAMIO_5_DMWIDTH/8-1:0];
            assign m_axis_bramio_5_tdata = dwconv1_tdata[5][M_AXIS_BRAMIO_5_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 6) begin
            assign in_clk[6] = s_axis_bram_6_aclk;
            assign in_rst[6] = s_axis_bram_6_aresetn;
            assign tlast[6] = s_axis_bram_6_tlast;
            assign tvalid[6] = s_axis_bram_6_tvalid;
            assign tkeep[6][S_AXIS_BRAM_6_DMWIDTH/8-1:0] = s_axis_bram_6_tkeep;
            assign tstrb[6][S_AXIS_BRAM_6_DMWIDTH/8-1:0] = s_axis_bram_6_tstrb;
            assign tdata[6][S_AXIS_BRAM_6_DMWIDTH-1:0] = s_axis_bram_6_tdata;
            assign s_axis_bram_6_tready = tready[6];
            
            assign bram_addr[6][0][S_AXIS_BRAM_6_ADDR_WIDTH-1:0] = ap_bram_6_addr0;
            assign bram_din[6][0][S_AXIS_BRAM_6_WIDTH-1:0] = ap_bram_6_din0;
            assign ap_bram_6_dout0 = bram_dout[6][0][S_AXIS_BRAM_6_WIDTH-1:0];
            assign bram_we[6][0][S_AXIS_BRAM_6_WIDTH/8-1:0] = ap_bram_6_we0;
            assign bram_en[6][0] = ap_bram_6_en0;
            assign bram_addr[6][1][S_AXIS_BRAM_6_ADDR_WIDTH-1:0] = ap_bram_6_addr1;
            assign bram_din[6][1][S_AXIS_BRAM_6_WIDTH-1:0] = ap_bram_6_din1;
            assign ap_bram_6_dout1 = bram_dout[6][1][S_AXIS_BRAM_6_WIDTH-1:0];
            assign bram_we[6][1][S_AXIS_BRAM_6_WIDTH/8-1:0] = ap_bram_6_we1;
            assign bram_en[6][1] = ap_bram_6_en1;
            
            assign out_clk[6] = m_axis_bramio_6_aclk;
            assign out_rst[6] = m_axis_bramio_6_aresetn;
            assign dwconv1_tready[6] = m_axis_bramio_6_tready;
            assign m_axis_bramio_6_tlast = dwconv1_tlast[6];
            assign m_axis_bramio_6_tvalid = dwconv1_tvalid[6];
            assign m_axis_bramio_6_tkeep = dwconv1_tkeep[6][M_AXIS_BRAMIO_6_DMWIDTH/8-1:0];
            assign m_axis_bramio_6_tstrb = dwconv1_tstrb[6][M_AXIS_BRAMIO_6_DMWIDTH/8-1:0];
            assign m_axis_bramio_6_tdata = dwconv1_tdata[6][M_AXIS_BRAMIO_6_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 7) begin
            assign in_clk[7] = s_axis_bram_7_aclk;
            assign in_rst[7] = s_axis_bram_7_aresetn;
            assign tlast[7] = s_axis_bram_7_tlast;
            assign tvalid[7] = s_axis_bram_7_tvalid;
            assign tkeep[7][S_AXIS_BRAM_7_DMWIDTH/8-1:0] = s_axis_bram_7_tkeep;
            assign tstrb[7][S_AXIS_BRAM_7_DMWIDTH/8-1:0] = s_axis_bram_7_tstrb;
            assign tdata[7][S_AXIS_BRAM_7_DMWIDTH-1:0] = s_axis_bram_7_tdata;
            assign s_axis_bram_7_tready = tready[7];
            
            assign bram_addr[7][0][S_AXIS_BRAM_7_ADDR_WIDTH-1:0] = ap_bram_7_addr0;
            assign bram_din[7][0][S_AXIS_BRAM_7_WIDTH-1:0] = ap_bram_7_din0;
            assign ap_bram_7_dout0 = bram_dout[7][0][S_AXIS_BRAM_7_WIDTH-1:0];
            assign bram_we[7][0][S_AXIS_BRAM_7_WIDTH/8-1:0] = ap_bram_7_we0;
            assign bram_en[7][0] = ap_bram_7_en0;
            assign bram_addr[7][1][S_AXIS_BRAM_7_ADDR_WIDTH-1:0] = ap_bram_7_addr1;
            assign bram_din[7][1][S_AXIS_BRAM_7_WIDTH-1:0] = ap_bram_7_din1;
            assign ap_bram_7_dout1 = bram_dout[7][1][S_AXIS_BRAM_7_WIDTH-1:0];
            assign bram_we[7][1][S_AXIS_BRAM_7_WIDTH/8-1:0] = ap_bram_7_we1;
            assign bram_en[7][1] = ap_bram_7_en1;
            
            assign out_clk[7] = m_axis_bramio_7_aclk;
            assign out_rst[7] = m_axis_bramio_7_aresetn;
            assign dwconv1_tready[7] = m_axis_bramio_7_tready;
            assign m_axis_bramio_7_tlast = dwconv1_tlast[7];
            assign m_axis_bramio_7_tvalid = dwconv1_tvalid[7];
            assign m_axis_bramio_7_tkeep = dwconv1_tkeep[7][M_AXIS_BRAMIO_7_DMWIDTH/8-1:0];
            assign m_axis_bramio_7_tstrb = dwconv1_tstrb[7][M_AXIS_BRAMIO_7_DMWIDTH/8-1:0];
            assign m_axis_bramio_7_tdata = dwconv1_tdata[7][M_AXIS_BRAMIO_7_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 8) begin
            assign in_clk[8] = s_axis_bram_8_aclk;
            assign in_rst[8] = s_axis_bram_8_aresetn;
            assign tlast[8] = s_axis_bram_8_tlast;
            assign tvalid[8] = s_axis_bram_8_tvalid;
            assign tkeep[8][S_AXIS_BRAM_8_DMWIDTH/8-1:0] = s_axis_bram_8_tkeep;
            assign tstrb[8][S_AXIS_BRAM_8_DMWIDTH/8-1:0] = s_axis_bram_8_tstrb;
            assign tdata[8][S_AXIS_BRAM_8_DMWIDTH-1:0] = s_axis_bram_8_tdata;
            assign s_axis_bram_8_tready = tready[8];
            
            assign bram_addr[8][0][S_AXIS_BRAM_8_ADDR_WIDTH-1:0] = ap_bram_8_addr0;
            assign bram_din[8][0][S_AXIS_BRAM_8_WIDTH-1:0] = ap_bram_8_din0;
            assign ap_bram_8_dout0 = bram_dout[8][0][S_AXIS_BRAM_8_WIDTH-1:0];
            assign bram_we[8][0][S_AXIS_BRAM_8_WIDTH/8-1:0] = ap_bram_8_we0;
            assign bram_en[8][0] = ap_bram_8_en0;
            assign bram_addr[8][1][S_AXIS_BRAM_8_ADDR_WIDTH-1:0] = ap_bram_8_addr1;
            assign bram_din[8][1][S_AXIS_BRAM_8_WIDTH-1:0] = ap_bram_8_din1;
            assign ap_bram_8_dout1 = bram_dout[8][1][S_AXIS_BRAM_8_WIDTH-1:0];
            assign bram_we[8][1][S_AXIS_BRAM_8_WIDTH/8-1:0] = ap_bram_8_we1;
            assign bram_en[8][1] = ap_bram_8_en1;
            
            assign out_clk[8] = m_axis_bramio_8_aclk;
            assign out_rst[8] = m_axis_bramio_8_aresetn;
            assign dwconv1_tready[8] = m_axis_bramio_8_tready;
            assign m_axis_bramio_8_tlast = dwconv1_tlast[8];
            assign m_axis_bramio_8_tvalid = dwconv1_tvalid[8];
            assign m_axis_bramio_8_tkeep = dwconv1_tkeep[8][M_AXIS_BRAMIO_8_DMWIDTH/8-1:0];
            assign m_axis_bramio_8_tstrb = dwconv1_tstrb[8][M_AXIS_BRAMIO_8_DMWIDTH/8-1:0];
            assign m_axis_bramio_8_tdata = dwconv1_tdata[8][M_AXIS_BRAMIO_8_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 9) begin
            assign in_clk[9] = s_axis_bram_9_aclk;
            assign in_rst[9] = s_axis_bram_9_aresetn;
            assign tlast[9] = s_axis_bram_9_tlast;
            assign tvalid[9] = s_axis_bram_9_tvalid;
            assign tkeep[9][S_AXIS_BRAM_9_DMWIDTH/8-1:0] = s_axis_bram_9_tkeep;
            assign tstrb[9][S_AXIS_BRAM_9_DMWIDTH/8-1:0] = s_axis_bram_9_tstrb;
            assign tdata[9][S_AXIS_BRAM_9_DMWIDTH-1:0] = s_axis_bram_9_tdata;
            assign s_axis_bram_9_tready = tready[9];
            
            assign bram_addr[9][0][S_AXIS_BRAM_9_ADDR_WIDTH-1:0] = ap_bram_9_addr0;
            assign bram_din[9][0][S_AXIS_BRAM_9_WIDTH-1:0] = ap_bram_9_din0;
            assign ap_bram_9_dout0 = bram_dout[9][0][S_AXIS_BRAM_9_WIDTH-1:0];
            assign bram_we[9][0][S_AXIS_BRAM_9_WIDTH/8-1:0] = ap_bram_9_we0;
            assign bram_en[9][0] = ap_bram_9_en0;
            assign bram_addr[9][1][S_AXIS_BRAM_9_ADDR_WIDTH-1:0] = ap_bram_9_addr1;
            assign bram_din[9][1][S_AXIS_BRAM_9_WIDTH-1:0] = ap_bram_9_din1;
            assign ap_bram_9_dout1 = bram_dout[9][1][S_AXIS_BRAM_9_WIDTH-1:0];
            assign bram_we[9][1][S_AXIS_BRAM_9_WIDTH/8-1:0] = ap_bram_9_we1;
            assign bram_en[9][1] = ap_bram_9_en1;
            
            assign out_clk[9] = m_axis_bramio_9_aclk;
            assign out_rst[9] = m_axis_bramio_9_aresetn;
            assign dwconv1_tready[9] = m_axis_bramio_9_tready;
            assign m_axis_bramio_9_tlast = dwconv1_tlast[9];
            assign m_axis_bramio_9_tvalid = dwconv1_tvalid[9];
            assign m_axis_bramio_9_tkeep = dwconv1_tkeep[9][M_AXIS_BRAMIO_9_DMWIDTH/8-1:0];
            assign m_axis_bramio_9_tstrb = dwconv1_tstrb[9][M_AXIS_BRAMIO_9_DMWIDTH/8-1:0];
            assign m_axis_bramio_9_tdata = dwconv1_tdata[9][M_AXIS_BRAMIO_9_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 10) begin
            assign in_clk[10] = s_axis_bram_10_aclk;
            assign in_rst[10] = s_axis_bram_10_aresetn;
            assign tlast[10] = s_axis_bram_10_tlast;
            assign tvalid[10] = s_axis_bram_10_tvalid;
            assign tkeep[10][S_AXIS_BRAM_10_DMWIDTH/8-1:0] = s_axis_bram_10_tkeep;
            assign tstrb[10][S_AXIS_BRAM_10_DMWIDTH/8-1:0] = s_axis_bram_10_tstrb;
            assign tdata[10][S_AXIS_BRAM_10_DMWIDTH-1:0] = s_axis_bram_10_tdata;
            assign s_axis_bram_10_tready = tready[10];
            
            assign bram_addr[10][0][S_AXIS_BRAM_10_ADDR_WIDTH-1:0] = ap_bram_10_addr0;
            assign bram_din[10][0][S_AXIS_BRAM_10_WIDTH-1:0] = ap_bram_10_din0;
            assign ap_bram_10_dout0 = bram_dout[10][0][S_AXIS_BRAM_10_WIDTH-1:0];
            assign bram_we[10][0][S_AXIS_BRAM_10_WIDTH/8-1:0] = ap_bram_10_we0;
            assign bram_en[10][0] = ap_bram_10_en0;
            assign bram_addr[10][1][S_AXIS_BRAM_10_ADDR_WIDTH-1:0] = ap_bram_10_addr1;
            assign bram_din[10][1][S_AXIS_BRAM_10_WIDTH-1:0] = ap_bram_10_din1;
            assign ap_bram_10_dout1 = bram_dout[10][1][S_AXIS_BRAM_10_WIDTH-1:0];
            assign bram_we[10][1][S_AXIS_BRAM_10_WIDTH/8-1:0] = ap_bram_10_we1;
            assign bram_en[10][1] = ap_bram_10_en1;
            
            assign out_clk[10] = m_axis_bramio_10_aclk;
            assign out_rst[10] = m_axis_bramio_10_aresetn;
            assign dwconv1_tready[10] = m_axis_bramio_10_tready;
            assign m_axis_bramio_10_tlast = dwconv1_tlast[10];
            assign m_axis_bramio_10_tvalid = dwconv1_tvalid[10];
            assign m_axis_bramio_10_tkeep = dwconv1_tkeep[10][M_AXIS_BRAMIO_10_DMWIDTH/8-1:0];
            assign m_axis_bramio_10_tstrb = dwconv1_tstrb[10][M_AXIS_BRAMIO_10_DMWIDTH/8-1:0];
            assign m_axis_bramio_10_tdata = dwconv1_tdata[10][M_AXIS_BRAMIO_10_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 11) begin
            assign in_clk[11] = s_axis_bram_11_aclk;
            assign in_rst[11] = s_axis_bram_11_aresetn;
            assign tlast[11] = s_axis_bram_11_tlast;
            assign tvalid[11] = s_axis_bram_11_tvalid;
            assign tkeep[11][S_AXIS_BRAM_11_DMWIDTH/8-1:0] = s_axis_bram_11_tkeep;
            assign tstrb[11][S_AXIS_BRAM_11_DMWIDTH/8-1:0] = s_axis_bram_11_tstrb;
            assign tdata[11][S_AXIS_BRAM_11_DMWIDTH-1:0] = s_axis_bram_11_tdata;
            assign s_axis_bram_11_tready = tready[11];
            
            assign bram_addr[11][0][S_AXIS_BRAM_11_ADDR_WIDTH-1:0] = ap_bram_11_addr0;
            assign bram_din[11][0][S_AXIS_BRAM_11_WIDTH-1:0] = ap_bram_11_din0;
            assign ap_bram_11_dout0 = bram_dout[11][0][S_AXIS_BRAM_11_WIDTH-1:0];
            assign bram_we[11][0][S_AXIS_BRAM_11_WIDTH/8-1:0] = ap_bram_11_we0;
            assign bram_en[11][0] = ap_bram_11_en0;
            assign bram_addr[11][1][S_AXIS_BRAM_11_ADDR_WIDTH-1:0] = ap_bram_11_addr1;
            assign bram_din[11][1][S_AXIS_BRAM_11_WIDTH-1:0] = ap_bram_11_din1;
            assign ap_bram_11_dout1 = bram_dout[11][1][S_AXIS_BRAM_11_WIDTH-1:0];
            assign bram_we[11][1][S_AXIS_BRAM_11_WIDTH/8-1:0] = ap_bram_11_we1;
            assign bram_en[11][1] = ap_bram_11_en1;
            
            assign out_clk[11] = m_axis_bramio_11_aclk;
            assign out_rst[11] = m_axis_bramio_11_aresetn;
            assign dwconv1_tready[11] = m_axis_bramio_11_tready;
            assign m_axis_bramio_11_tlast = dwconv1_tlast[11];
            assign m_axis_bramio_11_tvalid = dwconv1_tvalid[11];
            assign m_axis_bramio_11_tkeep = dwconv1_tkeep[11][M_AXIS_BRAMIO_11_DMWIDTH/8-1:0];
            assign m_axis_bramio_11_tstrb = dwconv1_tstrb[11][M_AXIS_BRAMIO_11_DMWIDTH/8-1:0];
            assign m_axis_bramio_11_tdata = dwconv1_tdata[11][M_AXIS_BRAMIO_11_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 12) begin
            assign in_clk[12] = s_axis_bram_12_aclk;
            assign in_rst[12] = s_axis_bram_12_aresetn;
            assign tlast[12] = s_axis_bram_12_tlast;
            assign tvalid[12] = s_axis_bram_12_tvalid;
            assign tkeep[12][S_AXIS_BRAM_12_DMWIDTH/8-1:0] = s_axis_bram_12_tkeep;
            assign tstrb[12][S_AXIS_BRAM_12_DMWIDTH/8-1:0] = s_axis_bram_12_tstrb;
            assign tdata[12][S_AXIS_BRAM_12_DMWIDTH-1:0] = s_axis_bram_12_tdata;
            assign s_axis_bram_12_tready = tready[12];
            
            assign bram_addr[12][0][S_AXIS_BRAM_12_ADDR_WIDTH-1:0] = ap_bram_12_addr0;
            assign bram_din[12][0][S_AXIS_BRAM_12_WIDTH-1:0] = ap_bram_12_din0;
            assign ap_bram_12_dout0 = bram_dout[12][0][S_AXIS_BRAM_12_WIDTH-1:0];
            assign bram_we[12][0][S_AXIS_BRAM_12_WIDTH/8-1:0] = ap_bram_12_we0;
            assign bram_en[12][0] = ap_bram_12_en0;
            assign bram_addr[12][1][S_AXIS_BRAM_12_ADDR_WIDTH-1:0] = ap_bram_12_addr1;
            assign bram_din[12][1][S_AXIS_BRAM_12_WIDTH-1:0] = ap_bram_12_din1;
            assign ap_bram_12_dout1 = bram_dout[12][1][S_AXIS_BRAM_12_WIDTH-1:0];
            assign bram_we[12][1][S_AXIS_BRAM_12_WIDTH/8-1:0] = ap_bram_12_we1;
            assign bram_en[12][1] = ap_bram_12_en1;
            
            assign out_clk[12] = m_axis_bramio_12_aclk;
            assign out_rst[12] = m_axis_bramio_12_aresetn;
            assign dwconv1_tready[12] = m_axis_bramio_12_tready;
            assign m_axis_bramio_12_tlast = dwconv1_tlast[12];
            assign m_axis_bramio_12_tvalid = dwconv1_tvalid[12];
            assign m_axis_bramio_12_tkeep = dwconv1_tkeep[12][M_AXIS_BRAMIO_12_DMWIDTH/8-1:0];
            assign m_axis_bramio_12_tstrb = dwconv1_tstrb[12][M_AXIS_BRAMIO_12_DMWIDTH/8-1:0];
            assign m_axis_bramio_12_tdata = dwconv1_tdata[12][M_AXIS_BRAMIO_12_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 13) begin
            assign in_clk[13] = s_axis_bram_13_aclk;
            assign in_rst[13] = s_axis_bram_13_aresetn;
            assign tlast[13] = s_axis_bram_13_tlast;
            assign tvalid[13] = s_axis_bram_13_tvalid;
            assign tkeep[13][S_AXIS_BRAM_13_DMWIDTH/8-1:0] = s_axis_bram_13_tkeep;
            assign tstrb[13][S_AXIS_BRAM_13_DMWIDTH/8-1:0] = s_axis_bram_13_tstrb;
            assign tdata[13][S_AXIS_BRAM_13_DMWIDTH-1:0] = s_axis_bram_13_tdata;
            assign s_axis_bram_13_tready = tready[13];
            
            assign bram_addr[13][0][S_AXIS_BRAM_13_ADDR_WIDTH-1:0] = ap_bram_13_addr0;
            assign bram_din[13][0][S_AXIS_BRAM_13_WIDTH-1:0] = ap_bram_13_din0;
            assign ap_bram_13_dout0 = bram_dout[13][0][S_AXIS_BRAM_13_WIDTH-1:0];
            assign bram_we[13][0][S_AXIS_BRAM_13_WIDTH/8-1:0] = ap_bram_13_we0;
            assign bram_en[13][0] = ap_bram_13_en0;
            assign bram_addr[13][1][S_AXIS_BRAM_13_ADDR_WIDTH-1:0] = ap_bram_13_addr1;
            assign bram_din[13][1][S_AXIS_BRAM_13_WIDTH-1:0] = ap_bram_13_din1;
            assign ap_bram_13_dout1 = bram_dout[13][1][S_AXIS_BRAM_13_WIDTH-1:0];
            assign bram_we[13][1][S_AXIS_BRAM_13_WIDTH/8-1:0] = ap_bram_13_we1;
            assign bram_en[13][1] = ap_bram_13_en1;
            
            assign out_clk[13] = m_axis_bramio_13_aclk;
            assign out_rst[13] = m_axis_bramio_13_aresetn;
            assign dwconv1_tready[13] = m_axis_bramio_13_tready;
            assign m_axis_bramio_13_tlast = dwconv1_tlast[13];
            assign m_axis_bramio_13_tvalid = dwconv1_tvalid[13];
            assign m_axis_bramio_13_tkeep = dwconv1_tkeep[13][M_AXIS_BRAMIO_13_DMWIDTH/8-1:0];
            assign m_axis_bramio_13_tstrb = dwconv1_tstrb[13][M_AXIS_BRAMIO_13_DMWIDTH/8-1:0];
            assign m_axis_bramio_13_tdata = dwconv1_tdata[13][M_AXIS_BRAMIO_13_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 14) begin
            assign in_clk[14] = s_axis_bram_14_aclk;
            assign in_rst[14] = s_axis_bram_14_aresetn;
            assign tlast[14] = s_axis_bram_14_tlast;
            assign tvalid[14] = s_axis_bram_14_tvalid;
            assign tkeep[14][S_AXIS_BRAM_14_DMWIDTH/8-1:0] = s_axis_bram_14_tkeep;
            assign tstrb[14][S_AXIS_BRAM_14_DMWIDTH/8-1:0] = s_axis_bram_14_tstrb;
            assign tdata[14][S_AXIS_BRAM_14_DMWIDTH-1:0] = s_axis_bram_14_tdata;
            assign s_axis_bram_14_tready = tready[14];
            
            assign bram_addr[14][0][S_AXIS_BRAM_14_ADDR_WIDTH-1:0] = ap_bram_14_addr0;
            assign bram_din[14][0][S_AXIS_BRAM_14_WIDTH-1:0] = ap_bram_14_din0;
            assign ap_bram_14_dout0 = bram_dout[14][0][S_AXIS_BRAM_14_WIDTH-1:0];
            assign bram_we[14][0][S_AXIS_BRAM_14_WIDTH/8-1:0] = ap_bram_14_we0;
            assign bram_en[14][0] = ap_bram_14_en0;
            assign bram_addr[14][1][S_AXIS_BRAM_14_ADDR_WIDTH-1:0] = ap_bram_14_addr1;
            assign bram_din[14][1][S_AXIS_BRAM_14_WIDTH-1:0] = ap_bram_14_din1;
            assign ap_bram_14_dout1 = bram_dout[14][1][S_AXIS_BRAM_14_WIDTH-1:0];
            assign bram_we[14][1][S_AXIS_BRAM_14_WIDTH/8-1:0] = ap_bram_14_we1;
            assign bram_en[14][1] = ap_bram_14_en1;
            
            assign out_clk[14] = m_axis_bramio_14_aclk;
            assign out_rst[14] = m_axis_bramio_14_aresetn;
            assign dwconv1_tready[14] = m_axis_bramio_14_tready;
            assign m_axis_bramio_14_tlast = dwconv1_tlast[14];
            assign m_axis_bramio_14_tvalid = dwconv1_tvalid[14];
            assign m_axis_bramio_14_tkeep = dwconv1_tkeep[14][M_AXIS_BRAMIO_14_DMWIDTH/8-1:0];
            assign m_axis_bramio_14_tstrb = dwconv1_tstrb[14][M_AXIS_BRAMIO_14_DMWIDTH/8-1:0];
            assign m_axis_bramio_14_tdata = dwconv1_tdata[14][M_AXIS_BRAMIO_14_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 15) begin
            assign in_clk[15] = s_axis_bram_15_aclk;
            assign in_rst[15] = s_axis_bram_15_aresetn;
            assign tlast[15] = s_axis_bram_15_tlast;
            assign tvalid[15] = s_axis_bram_15_tvalid;
            assign tkeep[15][S_AXIS_BRAM_15_DMWIDTH/8-1:0] = s_axis_bram_15_tkeep;
            assign tstrb[15][S_AXIS_BRAM_15_DMWIDTH/8-1:0] = s_axis_bram_15_tstrb;
            assign tdata[15][S_AXIS_BRAM_15_DMWIDTH-1:0] = s_axis_bram_15_tdata;
            assign s_axis_bram_15_tready = tready[15];
            
            assign bram_addr[15][0][S_AXIS_BRAM_15_ADDR_WIDTH-1:0] = ap_bram_15_addr0;
            assign bram_din[15][0][S_AXIS_BRAM_15_WIDTH-1:0] = ap_bram_15_din0;
            assign ap_bram_15_dout0 = bram_dout[15][0][S_AXIS_BRAM_15_WIDTH-1:0];
            assign bram_we[15][0][S_AXIS_BRAM_15_WIDTH/8-1:0] = ap_bram_15_we0;
            assign bram_en[15][0] = ap_bram_15_en0;
            assign bram_addr[15][1][S_AXIS_BRAM_15_ADDR_WIDTH-1:0] = ap_bram_15_addr1;
            assign bram_din[15][1][S_AXIS_BRAM_15_WIDTH-1:0] = ap_bram_15_din1;
            assign ap_bram_15_dout1 = bram_dout[15][1][S_AXIS_BRAM_15_WIDTH-1:0];
            assign bram_we[15][1][S_AXIS_BRAM_15_WIDTH/8-1:0] = ap_bram_15_we1;
            assign bram_en[15][1] = ap_bram_15_en1;
            
            assign out_clk[15] = m_axis_bramio_15_aclk;
            assign out_rst[15] = m_axis_bramio_15_aresetn;
            assign dwconv1_tready[15] = m_axis_bramio_15_tready;
            assign m_axis_bramio_15_tlast = dwconv1_tlast[15];
            assign m_axis_bramio_15_tvalid = dwconv1_tvalid[15];
            assign m_axis_bramio_15_tkeep = dwconv1_tkeep[15][M_AXIS_BRAMIO_15_DMWIDTH/8-1:0];
            assign m_axis_bramio_15_tstrb = dwconv1_tstrb[15][M_AXIS_BRAMIO_15_DMWIDTH/8-1:0];
            assign m_axis_bramio_15_tdata = dwconv1_tdata[15][M_AXIS_BRAMIO_15_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 16) begin
            assign in_clk[16] = s_axis_bram_16_aclk;
            assign in_rst[16] = s_axis_bram_16_aresetn;
            assign tlast[16] = s_axis_bram_16_tlast;
            assign tvalid[16] = s_axis_bram_16_tvalid;
            assign tkeep[16][S_AXIS_BRAM_16_DMWIDTH/8-1:0] = s_axis_bram_16_tkeep;
            assign tstrb[16][S_AXIS_BRAM_16_DMWIDTH/8-1:0] = s_axis_bram_16_tstrb;
            assign tdata[16][S_AXIS_BRAM_16_DMWIDTH-1:0] = s_axis_bram_16_tdata;
            assign s_axis_bram_16_tready = tready[16];
            
            assign bram_addr[16][0][S_AXIS_BRAM_16_ADDR_WIDTH-1:0] = ap_bram_16_addr0;
            assign bram_din[16][0][S_AXIS_BRAM_16_WIDTH-1:0] = ap_bram_16_din0;
            assign ap_bram_16_dout0 = bram_dout[16][0][S_AXIS_BRAM_16_WIDTH-1:0];
            assign bram_we[16][0][S_AXIS_BRAM_16_WIDTH/8-1:0] = ap_bram_16_we0;
            assign bram_en[16][0] = ap_bram_16_en0;
            assign bram_addr[16][1][S_AXIS_BRAM_16_ADDR_WIDTH-1:0] = ap_bram_16_addr1;
            assign bram_din[16][1][S_AXIS_BRAM_16_WIDTH-1:0] = ap_bram_16_din1;
            assign ap_bram_16_dout1 = bram_dout[16][1][S_AXIS_BRAM_16_WIDTH-1:0];
            assign bram_we[16][1][S_AXIS_BRAM_16_WIDTH/8-1:0] = ap_bram_16_we1;
            assign bram_en[16][1] = ap_bram_16_en1;
            
            assign out_clk[16] = m_axis_bramio_16_aclk;
            assign out_rst[16] = m_axis_bramio_16_aresetn;
            assign dwconv1_tready[16] = m_axis_bramio_16_tready;
            assign m_axis_bramio_16_tlast = dwconv1_tlast[16];
            assign m_axis_bramio_16_tvalid = dwconv1_tvalid[16];
            assign m_axis_bramio_16_tkeep = dwconv1_tkeep[16][M_AXIS_BRAMIO_16_DMWIDTH/8-1:0];
            assign m_axis_bramio_16_tstrb = dwconv1_tstrb[16][M_AXIS_BRAMIO_16_DMWIDTH/8-1:0];
            assign m_axis_bramio_16_tdata = dwconv1_tdata[16][M_AXIS_BRAMIO_16_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 17) begin
            assign in_clk[17] = s_axis_bram_17_aclk;
            assign in_rst[17] = s_axis_bram_17_aresetn;
            assign tlast[17] = s_axis_bram_17_tlast;
            assign tvalid[17] = s_axis_bram_17_tvalid;
            assign tkeep[17][S_AXIS_BRAM_17_DMWIDTH/8-1:0] = s_axis_bram_17_tkeep;
            assign tstrb[17][S_AXIS_BRAM_17_DMWIDTH/8-1:0] = s_axis_bram_17_tstrb;
            assign tdata[17][S_AXIS_BRAM_17_DMWIDTH-1:0] = s_axis_bram_17_tdata;
            assign s_axis_bram_17_tready = tready[17];
            
            assign bram_addr[17][0][S_AXIS_BRAM_17_ADDR_WIDTH-1:0] = ap_bram_17_addr0;
            assign bram_din[17][0][S_AXIS_BRAM_17_WIDTH-1:0] = ap_bram_17_din0;
            assign ap_bram_17_dout0 = bram_dout[17][0][S_AXIS_BRAM_17_WIDTH-1:0];
            assign bram_we[17][0][S_AXIS_BRAM_17_WIDTH/8-1:0] = ap_bram_17_we0;
            assign bram_en[17][0] = ap_bram_17_en0;
            assign bram_addr[17][1][S_AXIS_BRAM_17_ADDR_WIDTH-1:0] = ap_bram_17_addr1;
            assign bram_din[17][1][S_AXIS_BRAM_17_WIDTH-1:0] = ap_bram_17_din1;
            assign ap_bram_17_dout1 = bram_dout[17][1][S_AXIS_BRAM_17_WIDTH-1:0];
            assign bram_we[17][1][S_AXIS_BRAM_17_WIDTH/8-1:0] = ap_bram_17_we1;
            assign bram_en[17][1] = ap_bram_17_en1;
            
            assign out_clk[17] = m_axis_bramio_17_aclk;
            assign out_rst[17] = m_axis_bramio_17_aresetn;
            assign dwconv1_tready[17] = m_axis_bramio_17_tready;
            assign m_axis_bramio_17_tlast = dwconv1_tlast[17];
            assign m_axis_bramio_17_tvalid = dwconv1_tvalid[17];
            assign m_axis_bramio_17_tkeep = dwconv1_tkeep[17][M_AXIS_BRAMIO_17_DMWIDTH/8-1:0];
            assign m_axis_bramio_17_tstrb = dwconv1_tstrb[17][M_AXIS_BRAMIO_17_DMWIDTH/8-1:0];
            assign m_axis_bramio_17_tdata = dwconv1_tdata[17][M_AXIS_BRAMIO_17_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 18) begin
            assign in_clk[18] = s_axis_bram_18_aclk;
            assign in_rst[18] = s_axis_bram_18_aresetn;
            assign tlast[18] = s_axis_bram_18_tlast;
            assign tvalid[18] = s_axis_bram_18_tvalid;
            assign tkeep[18][S_AXIS_BRAM_18_DMWIDTH/8-1:0] = s_axis_bram_18_tkeep;
            assign tstrb[18][S_AXIS_BRAM_18_DMWIDTH/8-1:0] = s_axis_bram_18_tstrb;
            assign tdata[18][S_AXIS_BRAM_18_DMWIDTH-1:0] = s_axis_bram_18_tdata;
            assign s_axis_bram_18_tready = tready[18];
            
            assign bram_addr[18][0][S_AXIS_BRAM_18_ADDR_WIDTH-1:0] = ap_bram_18_addr0;
            assign bram_din[18][0][S_AXIS_BRAM_18_WIDTH-1:0] = ap_bram_18_din0;
            assign ap_bram_18_dout0 = bram_dout[18][0][S_AXIS_BRAM_18_WIDTH-1:0];
            assign bram_we[18][0][S_AXIS_BRAM_18_WIDTH/8-1:0] = ap_bram_18_we0;
            assign bram_en[18][0] = ap_bram_18_en0;
            assign bram_addr[18][1][S_AXIS_BRAM_18_ADDR_WIDTH-1:0] = ap_bram_18_addr1;
            assign bram_din[18][1][S_AXIS_BRAM_18_WIDTH-1:0] = ap_bram_18_din1;
            assign ap_bram_18_dout1 = bram_dout[18][1][S_AXIS_BRAM_18_WIDTH-1:0];
            assign bram_we[18][1][S_AXIS_BRAM_18_WIDTH/8-1:0] = ap_bram_18_we1;
            assign bram_en[18][1] = ap_bram_18_en1;
            
            assign out_clk[18] = m_axis_bramio_18_aclk;
            assign out_rst[18] = m_axis_bramio_18_aresetn;
            assign dwconv1_tready[18] = m_axis_bramio_18_tready;
            assign m_axis_bramio_18_tlast = dwconv1_tlast[18];
            assign m_axis_bramio_18_tvalid = dwconv1_tvalid[18];
            assign m_axis_bramio_18_tkeep = dwconv1_tkeep[18][M_AXIS_BRAMIO_18_DMWIDTH/8-1:0];
            assign m_axis_bramio_18_tstrb = dwconv1_tstrb[18][M_AXIS_BRAMIO_18_DMWIDTH/8-1:0];
            assign m_axis_bramio_18_tdata = dwconv1_tdata[18][M_AXIS_BRAMIO_18_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 19) begin
            assign in_clk[19] = s_axis_bram_19_aclk;
            assign in_rst[19] = s_axis_bram_19_aresetn;
            assign tlast[19] = s_axis_bram_19_tlast;
            assign tvalid[19] = s_axis_bram_19_tvalid;
            assign tkeep[19][S_AXIS_BRAM_19_DMWIDTH/8-1:0] = s_axis_bram_19_tkeep;
            assign tstrb[19][S_AXIS_BRAM_19_DMWIDTH/8-1:0] = s_axis_bram_19_tstrb;
            assign tdata[19][S_AXIS_BRAM_19_DMWIDTH-1:0] = s_axis_bram_19_tdata;
            assign s_axis_bram_19_tready = tready[19];
            
            assign bram_addr[19][0][S_AXIS_BRAM_19_ADDR_WIDTH-1:0] = ap_bram_19_addr0;
            assign bram_din[19][0][S_AXIS_BRAM_19_WIDTH-1:0] = ap_bram_19_din0;
            assign ap_bram_19_dout0 = bram_dout[19][0][S_AXIS_BRAM_19_WIDTH-1:0];
            assign bram_we[19][0][S_AXIS_BRAM_19_WIDTH/8-1:0] = ap_bram_19_we0;
            assign bram_en[19][0] = ap_bram_19_en0;
            assign bram_addr[19][1][S_AXIS_BRAM_19_ADDR_WIDTH-1:0] = ap_bram_19_addr1;
            assign bram_din[19][1][S_AXIS_BRAM_19_WIDTH-1:0] = ap_bram_19_din1;
            assign ap_bram_19_dout1 = bram_dout[19][1][S_AXIS_BRAM_19_WIDTH-1:0];
            assign bram_we[19][1][S_AXIS_BRAM_19_WIDTH/8-1:0] = ap_bram_19_we1;
            assign bram_en[19][1] = ap_bram_19_en1;
            
            assign out_clk[19] = m_axis_bramio_19_aclk;
            assign out_rst[19] = m_axis_bramio_19_aresetn;
            assign dwconv1_tready[19] = m_axis_bramio_19_tready;
            assign m_axis_bramio_19_tlast = dwconv1_tlast[19];
            assign m_axis_bramio_19_tvalid = dwconv1_tvalid[19];
            assign m_axis_bramio_19_tkeep = dwconv1_tkeep[19][M_AXIS_BRAMIO_19_DMWIDTH/8-1:0];
            assign m_axis_bramio_19_tstrb = dwconv1_tstrb[19][M_AXIS_BRAMIO_19_DMWIDTH/8-1:0];
            assign m_axis_bramio_19_tdata = dwconv1_tdata[19][M_AXIS_BRAMIO_19_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 20) begin
            assign in_clk[20] = s_axis_bram_20_aclk;
            assign in_rst[20] = s_axis_bram_20_aresetn;
            assign tlast[20] = s_axis_bram_20_tlast;
            assign tvalid[20] = s_axis_bram_20_tvalid;
            assign tkeep[20][S_AXIS_BRAM_20_DMWIDTH/8-1:0] = s_axis_bram_20_tkeep;
            assign tstrb[20][S_AXIS_BRAM_20_DMWIDTH/8-1:0] = s_axis_bram_20_tstrb;
            assign tdata[20][S_AXIS_BRAM_20_DMWIDTH-1:0] = s_axis_bram_20_tdata;
            assign s_axis_bram_20_tready = tready[20];
            
            assign bram_addr[20][0][S_AXIS_BRAM_20_ADDR_WIDTH-1:0] = ap_bram_20_addr0;
            assign bram_din[20][0][S_AXIS_BRAM_20_WIDTH-1:0] = ap_bram_20_din0;
            assign ap_bram_20_dout0 = bram_dout[20][0][S_AXIS_BRAM_20_WIDTH-1:0];
            assign bram_we[20][0][S_AXIS_BRAM_20_WIDTH/8-1:0] = ap_bram_20_we0;
            assign bram_en[20][0] = ap_bram_20_en0;
            assign bram_addr[20][1][S_AXIS_BRAM_20_ADDR_WIDTH-1:0] = ap_bram_20_addr1;
            assign bram_din[20][1][S_AXIS_BRAM_20_WIDTH-1:0] = ap_bram_20_din1;
            assign ap_bram_20_dout1 = bram_dout[20][1][S_AXIS_BRAM_20_WIDTH-1:0];
            assign bram_we[20][1][S_AXIS_BRAM_20_WIDTH/8-1:0] = ap_bram_20_we1;
            assign bram_en[20][1] = ap_bram_20_en1;
            
            assign out_clk[20] = m_axis_bramio_20_aclk;
            assign out_rst[20] = m_axis_bramio_20_aresetn;
            assign dwconv1_tready[20] = m_axis_bramio_20_tready;
            assign m_axis_bramio_20_tlast = dwconv1_tlast[20];
            assign m_axis_bramio_20_tvalid = dwconv1_tvalid[20];
            assign m_axis_bramio_20_tkeep = dwconv1_tkeep[20][M_AXIS_BRAMIO_20_DMWIDTH/8-1:0];
            assign m_axis_bramio_20_tstrb = dwconv1_tstrb[20][M_AXIS_BRAMIO_20_DMWIDTH/8-1:0];
            assign m_axis_bramio_20_tdata = dwconv1_tdata[20][M_AXIS_BRAMIO_20_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 21) begin
            assign in_clk[21] = s_axis_bram_21_aclk;
            assign in_rst[21] = s_axis_bram_21_aresetn;
            assign tlast[21] = s_axis_bram_21_tlast;
            assign tvalid[21] = s_axis_bram_21_tvalid;
            assign tkeep[21][S_AXIS_BRAM_21_DMWIDTH/8-1:0] = s_axis_bram_21_tkeep;
            assign tstrb[21][S_AXIS_BRAM_21_DMWIDTH/8-1:0] = s_axis_bram_21_tstrb;
            assign tdata[21][S_AXIS_BRAM_21_DMWIDTH-1:0] = s_axis_bram_21_tdata;
            assign s_axis_bram_21_tready = tready[21];
            
            assign bram_addr[21][0][S_AXIS_BRAM_21_ADDR_WIDTH-1:0] = ap_bram_21_addr0;
            assign bram_din[21][0][S_AXIS_BRAM_21_WIDTH-1:0] = ap_bram_21_din0;
            assign ap_bram_21_dout0 = bram_dout[21][0][S_AXIS_BRAM_21_WIDTH-1:0];
            assign bram_we[21][0][S_AXIS_BRAM_21_WIDTH/8-1:0] = ap_bram_21_we0;
            assign bram_en[21][0] = ap_bram_21_en0;
            assign bram_addr[21][1][S_AXIS_BRAM_21_ADDR_WIDTH-1:0] = ap_bram_21_addr1;
            assign bram_din[21][1][S_AXIS_BRAM_21_WIDTH-1:0] = ap_bram_21_din1;
            assign ap_bram_21_dout1 = bram_dout[21][1][S_AXIS_BRAM_21_WIDTH-1:0];
            assign bram_we[21][1][S_AXIS_BRAM_21_WIDTH/8-1:0] = ap_bram_21_we1;
            assign bram_en[21][1] = ap_bram_21_en1;
            
            assign out_clk[21] = m_axis_bramio_21_aclk;
            assign out_rst[21] = m_axis_bramio_21_aresetn;
            assign dwconv1_tready[21] = m_axis_bramio_21_tready;
            assign m_axis_bramio_21_tlast = dwconv1_tlast[21];
            assign m_axis_bramio_21_tvalid = dwconv1_tvalid[21];
            assign m_axis_bramio_21_tkeep = dwconv1_tkeep[21][M_AXIS_BRAMIO_21_DMWIDTH/8-1:0];
            assign m_axis_bramio_21_tstrb = dwconv1_tstrb[21][M_AXIS_BRAMIO_21_DMWIDTH/8-1:0];
            assign m_axis_bramio_21_tdata = dwconv1_tdata[21][M_AXIS_BRAMIO_21_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 22) begin
            assign in_clk[22] = s_axis_bram_22_aclk;
            assign in_rst[22] = s_axis_bram_22_aresetn;
            assign tlast[22] = s_axis_bram_22_tlast;
            assign tvalid[22] = s_axis_bram_22_tvalid;
            assign tkeep[22][S_AXIS_BRAM_22_DMWIDTH/8-1:0] = s_axis_bram_22_tkeep;
            assign tstrb[22][S_AXIS_BRAM_22_DMWIDTH/8-1:0] = s_axis_bram_22_tstrb;
            assign tdata[22][S_AXIS_BRAM_22_DMWIDTH-1:0] = s_axis_bram_22_tdata;
            assign s_axis_bram_22_tready = tready[22];
            
            assign bram_addr[22][0][S_AXIS_BRAM_22_ADDR_WIDTH-1:0] = ap_bram_22_addr0;
            assign bram_din[22][0][S_AXIS_BRAM_22_WIDTH-1:0] = ap_bram_22_din0;
            assign ap_bram_22_dout0 = bram_dout[22][0][S_AXIS_BRAM_22_WIDTH-1:0];
            assign bram_we[22][0][S_AXIS_BRAM_22_WIDTH/8-1:0] = ap_bram_22_we0;
            assign bram_en[22][0] = ap_bram_22_en0;
            assign bram_addr[22][1][S_AXIS_BRAM_22_ADDR_WIDTH-1:0] = ap_bram_22_addr1;
            assign bram_din[22][1][S_AXIS_BRAM_22_WIDTH-1:0] = ap_bram_22_din1;
            assign ap_bram_22_dout1 = bram_dout[22][1][S_AXIS_BRAM_22_WIDTH-1:0];
            assign bram_we[22][1][S_AXIS_BRAM_22_WIDTH/8-1:0] = ap_bram_22_we1;
            assign bram_en[22][1] = ap_bram_22_en1;
            
            assign out_clk[22] = m_axis_bramio_22_aclk;
            assign out_rst[22] = m_axis_bramio_22_aresetn;
            assign dwconv1_tready[22] = m_axis_bramio_22_tready;
            assign m_axis_bramio_22_tlast = dwconv1_tlast[22];
            assign m_axis_bramio_22_tvalid = dwconv1_tvalid[22];
            assign m_axis_bramio_22_tkeep = dwconv1_tkeep[22][M_AXIS_BRAMIO_22_DMWIDTH/8-1:0];
            assign m_axis_bramio_22_tstrb = dwconv1_tstrb[22][M_AXIS_BRAMIO_22_DMWIDTH/8-1:0];
            assign m_axis_bramio_22_tdata = dwconv1_tdata[22][M_AXIS_BRAMIO_22_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 23) begin
            assign in_clk[23] = s_axis_bram_23_aclk;
            assign in_rst[23] = s_axis_bram_23_aresetn;
            assign tlast[23] = s_axis_bram_23_tlast;
            assign tvalid[23] = s_axis_bram_23_tvalid;
            assign tkeep[23][S_AXIS_BRAM_23_DMWIDTH/8-1:0] = s_axis_bram_23_tkeep;
            assign tstrb[23][S_AXIS_BRAM_23_DMWIDTH/8-1:0] = s_axis_bram_23_tstrb;
            assign tdata[23][S_AXIS_BRAM_23_DMWIDTH-1:0] = s_axis_bram_23_tdata;
            assign s_axis_bram_23_tready = tready[23];
            
            assign bram_addr[23][0][S_AXIS_BRAM_23_ADDR_WIDTH-1:0] = ap_bram_23_addr0;
            assign bram_din[23][0][S_AXIS_BRAM_23_WIDTH-1:0] = ap_bram_23_din0;
            assign ap_bram_23_dout0 = bram_dout[23][0][S_AXIS_BRAM_23_WIDTH-1:0];
            assign bram_we[23][0][S_AXIS_BRAM_23_WIDTH/8-1:0] = ap_bram_23_we0;
            assign bram_en[23][0] = ap_bram_23_en0;
            assign bram_addr[23][1][S_AXIS_BRAM_23_ADDR_WIDTH-1:0] = ap_bram_23_addr1;
            assign bram_din[23][1][S_AXIS_BRAM_23_WIDTH-1:0] = ap_bram_23_din1;
            assign ap_bram_23_dout1 = bram_dout[23][1][S_AXIS_BRAM_23_WIDTH-1:0];
            assign bram_we[23][1][S_AXIS_BRAM_23_WIDTH/8-1:0] = ap_bram_23_we1;
            assign bram_en[23][1] = ap_bram_23_en1;
            
            assign out_clk[23] = m_axis_bramio_23_aclk;
            assign out_rst[23] = m_axis_bramio_23_aresetn;
            assign dwconv1_tready[23] = m_axis_bramio_23_tready;
            assign m_axis_bramio_23_tlast = dwconv1_tlast[23];
            assign m_axis_bramio_23_tvalid = dwconv1_tvalid[23];
            assign m_axis_bramio_23_tkeep = dwconv1_tkeep[23][M_AXIS_BRAMIO_23_DMWIDTH/8-1:0];
            assign m_axis_bramio_23_tstrb = dwconv1_tstrb[23][M_AXIS_BRAMIO_23_DMWIDTH/8-1:0];
            assign m_axis_bramio_23_tdata = dwconv1_tdata[23][M_AXIS_BRAMIO_23_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 24) begin
            assign in_clk[24] = s_axis_bram_24_aclk;
            assign in_rst[24] = s_axis_bram_24_aresetn;
            assign tlast[24] = s_axis_bram_24_tlast;
            assign tvalid[24] = s_axis_bram_24_tvalid;
            assign tkeep[24][S_AXIS_BRAM_24_DMWIDTH/8-1:0] = s_axis_bram_24_tkeep;
            assign tstrb[24][S_AXIS_BRAM_24_DMWIDTH/8-1:0] = s_axis_bram_24_tstrb;
            assign tdata[24][S_AXIS_BRAM_24_DMWIDTH-1:0] = s_axis_bram_24_tdata;
            assign s_axis_bram_24_tready = tready[24];
            
            assign bram_addr[24][0][S_AXIS_BRAM_24_ADDR_WIDTH-1:0] = ap_bram_24_addr0;
            assign bram_din[24][0][S_AXIS_BRAM_24_WIDTH-1:0] = ap_bram_24_din0;
            assign ap_bram_24_dout0 = bram_dout[24][0][S_AXIS_BRAM_24_WIDTH-1:0];
            assign bram_we[24][0][S_AXIS_BRAM_24_WIDTH/8-1:0] = ap_bram_24_we0;
            assign bram_en[24][0] = ap_bram_24_en0;
            assign bram_addr[24][1][S_AXIS_BRAM_24_ADDR_WIDTH-1:0] = ap_bram_24_addr1;
            assign bram_din[24][1][S_AXIS_BRAM_24_WIDTH-1:0] = ap_bram_24_din1;
            assign ap_bram_24_dout1 = bram_dout[24][1][S_AXIS_BRAM_24_WIDTH-1:0];
            assign bram_we[24][1][S_AXIS_BRAM_24_WIDTH/8-1:0] = ap_bram_24_we1;
            assign bram_en[24][1] = ap_bram_24_en1;
            
            assign out_clk[24] = m_axis_bramio_24_aclk;
            assign out_rst[24] = m_axis_bramio_24_aresetn;
            assign dwconv1_tready[24] = m_axis_bramio_24_tready;
            assign m_axis_bramio_24_tlast = dwconv1_tlast[24];
            assign m_axis_bramio_24_tvalid = dwconv1_tvalid[24];
            assign m_axis_bramio_24_tkeep = dwconv1_tkeep[24][M_AXIS_BRAMIO_24_DMWIDTH/8-1:0];
            assign m_axis_bramio_24_tstrb = dwconv1_tstrb[24][M_AXIS_BRAMIO_24_DMWIDTH/8-1:0];
            assign m_axis_bramio_24_tdata = dwconv1_tdata[24][M_AXIS_BRAMIO_24_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 25) begin
            assign in_clk[25] = s_axis_bram_25_aclk;
            assign in_rst[25] = s_axis_bram_25_aresetn;
            assign tlast[25] = s_axis_bram_25_tlast;
            assign tvalid[25] = s_axis_bram_25_tvalid;
            assign tkeep[25][S_AXIS_BRAM_25_DMWIDTH/8-1:0] = s_axis_bram_25_tkeep;
            assign tstrb[25][S_AXIS_BRAM_25_DMWIDTH/8-1:0] = s_axis_bram_25_tstrb;
            assign tdata[25][S_AXIS_BRAM_25_DMWIDTH-1:0] = s_axis_bram_25_tdata;
            assign s_axis_bram_25_tready = tready[25];
            
            assign bram_addr[25][0][S_AXIS_BRAM_25_ADDR_WIDTH-1:0] = ap_bram_25_addr0;
            assign bram_din[25][0][S_AXIS_BRAM_25_WIDTH-1:0] = ap_bram_25_din0;
            assign ap_bram_25_dout0 = bram_dout[25][0][S_AXIS_BRAM_25_WIDTH-1:0];
            assign bram_we[25][0][S_AXIS_BRAM_25_WIDTH/8-1:0] = ap_bram_25_we0;
            assign bram_en[25][0] = ap_bram_25_en0;
            assign bram_addr[25][1][S_AXIS_BRAM_25_ADDR_WIDTH-1:0] = ap_bram_25_addr1;
            assign bram_din[25][1][S_AXIS_BRAM_25_WIDTH-1:0] = ap_bram_25_din1;
            assign ap_bram_25_dout1 = bram_dout[25][1][S_AXIS_BRAM_25_WIDTH-1:0];
            assign bram_we[25][1][S_AXIS_BRAM_25_WIDTH/8-1:0] = ap_bram_25_we1;
            assign bram_en[25][1] = ap_bram_25_en1;
            
            assign out_clk[25] = m_axis_bramio_25_aclk;
            assign out_rst[25] = m_axis_bramio_25_aresetn;
            assign dwconv1_tready[25] = m_axis_bramio_25_tready;
            assign m_axis_bramio_25_tlast = dwconv1_tlast[25];
            assign m_axis_bramio_25_tvalid = dwconv1_tvalid[25];
            assign m_axis_bramio_25_tkeep = dwconv1_tkeep[25][M_AXIS_BRAMIO_25_DMWIDTH/8-1:0];
            assign m_axis_bramio_25_tstrb = dwconv1_tstrb[25][M_AXIS_BRAMIO_25_DMWIDTH/8-1:0];
            assign m_axis_bramio_25_tdata = dwconv1_tdata[25][M_AXIS_BRAMIO_25_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 26) begin
            assign in_clk[26] = s_axis_bram_26_aclk;
            assign in_rst[26] = s_axis_bram_26_aresetn;
            assign tlast[26] = s_axis_bram_26_tlast;
            assign tvalid[26] = s_axis_bram_26_tvalid;
            assign tkeep[26][S_AXIS_BRAM_26_DMWIDTH/8-1:0] = s_axis_bram_26_tkeep;
            assign tstrb[26][S_AXIS_BRAM_26_DMWIDTH/8-1:0] = s_axis_bram_26_tstrb;
            assign tdata[26][S_AXIS_BRAM_26_DMWIDTH-1:0] = s_axis_bram_26_tdata;
            assign s_axis_bram_26_tready = tready[26];
            
            assign bram_addr[26][0][S_AXIS_BRAM_26_ADDR_WIDTH-1:0] = ap_bram_26_addr0;
            assign bram_din[26][0][S_AXIS_BRAM_26_WIDTH-1:0] = ap_bram_26_din0;
            assign ap_bram_26_dout0 = bram_dout[26][0][S_AXIS_BRAM_26_WIDTH-1:0];
            assign bram_we[26][0][S_AXIS_BRAM_26_WIDTH/8-1:0] = ap_bram_26_we0;
            assign bram_en[26][0] = ap_bram_26_en0;
            assign bram_addr[26][1][S_AXIS_BRAM_26_ADDR_WIDTH-1:0] = ap_bram_26_addr1;
            assign bram_din[26][1][S_AXIS_BRAM_26_WIDTH-1:0] = ap_bram_26_din1;
            assign ap_bram_26_dout1 = bram_dout[26][1][S_AXIS_BRAM_26_WIDTH-1:0];
            assign bram_we[26][1][S_AXIS_BRAM_26_WIDTH/8-1:0] = ap_bram_26_we1;
            assign bram_en[26][1] = ap_bram_26_en1;
            
            assign out_clk[26] = m_axis_bramio_26_aclk;
            assign out_rst[26] = m_axis_bramio_26_aresetn;
            assign dwconv1_tready[26] = m_axis_bramio_26_tready;
            assign m_axis_bramio_26_tlast = dwconv1_tlast[26];
            assign m_axis_bramio_26_tvalid = dwconv1_tvalid[26];
            assign m_axis_bramio_26_tkeep = dwconv1_tkeep[26][M_AXIS_BRAMIO_26_DMWIDTH/8-1:0];
            assign m_axis_bramio_26_tstrb = dwconv1_tstrb[26][M_AXIS_BRAMIO_26_DMWIDTH/8-1:0];
            assign m_axis_bramio_26_tdata = dwconv1_tdata[26][M_AXIS_BRAMIO_26_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 27) begin
            assign in_clk[27] = s_axis_bram_27_aclk;
            assign in_rst[27] = s_axis_bram_27_aresetn;
            assign tlast[27] = s_axis_bram_27_tlast;
            assign tvalid[27] = s_axis_bram_27_tvalid;
            assign tkeep[27][S_AXIS_BRAM_27_DMWIDTH/8-1:0] = s_axis_bram_27_tkeep;
            assign tstrb[27][S_AXIS_BRAM_27_DMWIDTH/8-1:0] = s_axis_bram_27_tstrb;
            assign tdata[27][S_AXIS_BRAM_27_DMWIDTH-1:0] = s_axis_bram_27_tdata;
            assign s_axis_bram_27_tready = tready[27];
            
            assign bram_addr[27][0][S_AXIS_BRAM_27_ADDR_WIDTH-1:0] = ap_bram_27_addr0;
            assign bram_din[27][0][S_AXIS_BRAM_27_WIDTH-1:0] = ap_bram_27_din0;
            assign ap_bram_27_dout0 = bram_dout[27][0][S_AXIS_BRAM_27_WIDTH-1:0];
            assign bram_we[27][0][S_AXIS_BRAM_27_WIDTH/8-1:0] = ap_bram_27_we0;
            assign bram_en[27][0] = ap_bram_27_en0;
            assign bram_addr[27][1][S_AXIS_BRAM_27_ADDR_WIDTH-1:0] = ap_bram_27_addr1;
            assign bram_din[27][1][S_AXIS_BRAM_27_WIDTH-1:0] = ap_bram_27_din1;
            assign ap_bram_27_dout1 = bram_dout[27][1][S_AXIS_BRAM_27_WIDTH-1:0];
            assign bram_we[27][1][S_AXIS_BRAM_27_WIDTH/8-1:0] = ap_bram_27_we1;
            assign bram_en[27][1] = ap_bram_27_en1;
            
            assign out_clk[27] = m_axis_bramio_27_aclk;
            assign out_rst[27] = m_axis_bramio_27_aresetn;
            assign dwconv1_tready[27] = m_axis_bramio_27_tready;
            assign m_axis_bramio_27_tlast = dwconv1_tlast[27];
            assign m_axis_bramio_27_tvalid = dwconv1_tvalid[27];
            assign m_axis_bramio_27_tkeep = dwconv1_tkeep[27][M_AXIS_BRAMIO_27_DMWIDTH/8-1:0];
            assign m_axis_bramio_27_tstrb = dwconv1_tstrb[27][M_AXIS_BRAMIO_27_DMWIDTH/8-1:0];
            assign m_axis_bramio_27_tdata = dwconv1_tdata[27][M_AXIS_BRAMIO_27_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 28) begin
            assign in_clk[28] = s_axis_bram_28_aclk;
            assign in_rst[28] = s_axis_bram_28_aresetn;
            assign tlast[28] = s_axis_bram_28_tlast;
            assign tvalid[28] = s_axis_bram_28_tvalid;
            assign tkeep[28][S_AXIS_BRAM_28_DMWIDTH/8-1:0] = s_axis_bram_28_tkeep;
            assign tstrb[28][S_AXIS_BRAM_28_DMWIDTH/8-1:0] = s_axis_bram_28_tstrb;
            assign tdata[28][S_AXIS_BRAM_28_DMWIDTH-1:0] = s_axis_bram_28_tdata;
            assign s_axis_bram_28_tready = tready[28];
            
            assign bram_addr[28][0][S_AXIS_BRAM_28_ADDR_WIDTH-1:0] = ap_bram_28_addr0;
            assign bram_din[28][0][S_AXIS_BRAM_28_WIDTH-1:0] = ap_bram_28_din0;
            assign ap_bram_28_dout0 = bram_dout[28][0][S_AXIS_BRAM_28_WIDTH-1:0];
            assign bram_we[28][0][S_AXIS_BRAM_28_WIDTH/8-1:0] = ap_bram_28_we0;
            assign bram_en[28][0] = ap_bram_28_en0;
            assign bram_addr[28][1][S_AXIS_BRAM_28_ADDR_WIDTH-1:0] = ap_bram_28_addr1;
            assign bram_din[28][1][S_AXIS_BRAM_28_WIDTH-1:0] = ap_bram_28_din1;
            assign ap_bram_28_dout1 = bram_dout[28][1][S_AXIS_BRAM_28_WIDTH-1:0];
            assign bram_we[28][1][S_AXIS_BRAM_28_WIDTH/8-1:0] = ap_bram_28_we1;
            assign bram_en[28][1] = ap_bram_28_en1;
            
            assign out_clk[28] = m_axis_bramio_28_aclk;
            assign out_rst[28] = m_axis_bramio_28_aresetn;
            assign dwconv1_tready[28] = m_axis_bramio_28_tready;
            assign m_axis_bramio_28_tlast = dwconv1_tlast[28];
            assign m_axis_bramio_28_tvalid = dwconv1_tvalid[28];
            assign m_axis_bramio_28_tkeep = dwconv1_tkeep[28][M_AXIS_BRAMIO_28_DMWIDTH/8-1:0];
            assign m_axis_bramio_28_tstrb = dwconv1_tstrb[28][M_AXIS_BRAMIO_28_DMWIDTH/8-1:0];
            assign m_axis_bramio_28_tdata = dwconv1_tdata[28][M_AXIS_BRAMIO_28_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 29) begin
            assign in_clk[29] = s_axis_bram_29_aclk;
            assign in_rst[29] = s_axis_bram_29_aresetn;
            assign tlast[29] = s_axis_bram_29_tlast;
            assign tvalid[29] = s_axis_bram_29_tvalid;
            assign tkeep[29][S_AXIS_BRAM_29_DMWIDTH/8-1:0] = s_axis_bram_29_tkeep;
            assign tstrb[29][S_AXIS_BRAM_29_DMWIDTH/8-1:0] = s_axis_bram_29_tstrb;
            assign tdata[29][S_AXIS_BRAM_29_DMWIDTH-1:0] = s_axis_bram_29_tdata;
            assign s_axis_bram_29_tready = tready[29];
            
            assign bram_addr[29][0][S_AXIS_BRAM_29_ADDR_WIDTH-1:0] = ap_bram_29_addr0;
            assign bram_din[29][0][S_AXIS_BRAM_29_WIDTH-1:0] = ap_bram_29_din0;
            assign ap_bram_29_dout0 = bram_dout[29][0][S_AXIS_BRAM_29_WIDTH-1:0];
            assign bram_we[29][0][S_AXIS_BRAM_29_WIDTH/8-1:0] = ap_bram_29_we0;
            assign bram_en[29][0] = ap_bram_29_en0;
            assign bram_addr[29][1][S_AXIS_BRAM_29_ADDR_WIDTH-1:0] = ap_bram_29_addr1;
            assign bram_din[29][1][S_AXIS_BRAM_29_WIDTH-1:0] = ap_bram_29_din1;
            assign ap_bram_29_dout1 = bram_dout[29][1][S_AXIS_BRAM_29_WIDTH-1:0];
            assign bram_we[29][1][S_AXIS_BRAM_29_WIDTH/8-1:0] = ap_bram_29_we1;
            assign bram_en[29][1] = ap_bram_29_en1;
            
            assign out_clk[29] = m_axis_bramio_29_aclk;
            assign out_rst[29] = m_axis_bramio_29_aresetn;
            assign dwconv1_tready[29] = m_axis_bramio_29_tready;
            assign m_axis_bramio_29_tlast = dwconv1_tlast[29];
            assign m_axis_bramio_29_tvalid = dwconv1_tvalid[29];
            assign m_axis_bramio_29_tkeep = dwconv1_tkeep[29][M_AXIS_BRAMIO_29_DMWIDTH/8-1:0];
            assign m_axis_bramio_29_tstrb = dwconv1_tstrb[29][M_AXIS_BRAMIO_29_DMWIDTH/8-1:0];
            assign m_axis_bramio_29_tdata = dwconv1_tdata[29][M_AXIS_BRAMIO_29_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 30) begin
            assign in_clk[30] = s_axis_bram_30_aclk;
            assign in_rst[30] = s_axis_bram_30_aresetn;
            assign tlast[30] = s_axis_bram_30_tlast;
            assign tvalid[30] = s_axis_bram_30_tvalid;
            assign tkeep[30][S_AXIS_BRAM_30_DMWIDTH/8-1:0] = s_axis_bram_30_tkeep;
            assign tstrb[30][S_AXIS_BRAM_30_DMWIDTH/8-1:0] = s_axis_bram_30_tstrb;
            assign tdata[30][S_AXIS_BRAM_30_DMWIDTH-1:0] = s_axis_bram_30_tdata;
            assign s_axis_bram_30_tready = tready[30];
            
            assign bram_addr[30][0][S_AXIS_BRAM_30_ADDR_WIDTH-1:0] = ap_bram_30_addr0;
            assign bram_din[30][0][S_AXIS_BRAM_30_WIDTH-1:0] = ap_bram_30_din0;
            assign ap_bram_30_dout0 = bram_dout[30][0][S_AXIS_BRAM_30_WIDTH-1:0];
            assign bram_we[30][0][S_AXIS_BRAM_30_WIDTH/8-1:0] = ap_bram_30_we0;
            assign bram_en[30][0] = ap_bram_30_en0;
            assign bram_addr[30][1][S_AXIS_BRAM_30_ADDR_WIDTH-1:0] = ap_bram_30_addr1;
            assign bram_din[30][1][S_AXIS_BRAM_30_WIDTH-1:0] = ap_bram_30_din1;
            assign ap_bram_30_dout1 = bram_dout[30][1][S_AXIS_BRAM_30_WIDTH-1:0];
            assign bram_we[30][1][S_AXIS_BRAM_30_WIDTH/8-1:0] = ap_bram_30_we1;
            assign bram_en[30][1] = ap_bram_30_en1;
            
            assign out_clk[30] = m_axis_bramio_30_aclk;
            assign out_rst[30] = m_axis_bramio_30_aresetn;
            assign dwconv1_tready[30] = m_axis_bramio_30_tready;
            assign m_axis_bramio_30_tlast = dwconv1_tlast[30];
            assign m_axis_bramio_30_tvalid = dwconv1_tvalid[30];
            assign m_axis_bramio_30_tkeep = dwconv1_tkeep[30][M_AXIS_BRAMIO_30_DMWIDTH/8-1:0];
            assign m_axis_bramio_30_tstrb = dwconv1_tstrb[30][M_AXIS_BRAMIO_30_DMWIDTH/8-1:0];
            assign m_axis_bramio_30_tdata = dwconv1_tdata[30][M_AXIS_BRAMIO_30_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 31) begin
            assign in_clk[31] = s_axis_bram_31_aclk;
            assign in_rst[31] = s_axis_bram_31_aresetn;
            assign tlast[31] = s_axis_bram_31_tlast;
            assign tvalid[31] = s_axis_bram_31_tvalid;
            assign tkeep[31][S_AXIS_BRAM_31_DMWIDTH/8-1:0] = s_axis_bram_31_tkeep;
            assign tstrb[31][S_AXIS_BRAM_31_DMWIDTH/8-1:0] = s_axis_bram_31_tstrb;
            assign tdata[31][S_AXIS_BRAM_31_DMWIDTH-1:0] = s_axis_bram_31_tdata;
            assign s_axis_bram_31_tready = tready[31];
            
            assign bram_addr[31][0][S_AXIS_BRAM_31_ADDR_WIDTH-1:0] = ap_bram_31_addr0;
            assign bram_din[31][0][S_AXIS_BRAM_31_WIDTH-1:0] = ap_bram_31_din0;
            assign ap_bram_31_dout0 = bram_dout[31][0][S_AXIS_BRAM_31_WIDTH-1:0];
            assign bram_we[31][0][S_AXIS_BRAM_31_WIDTH/8-1:0] = ap_bram_31_we0;
            assign bram_en[31][0] = ap_bram_31_en0;
            assign bram_addr[31][1][S_AXIS_BRAM_31_ADDR_WIDTH-1:0] = ap_bram_31_addr1;
            assign bram_din[31][1][S_AXIS_BRAM_31_WIDTH-1:0] = ap_bram_31_din1;
            assign ap_bram_31_dout1 = bram_dout[31][1][S_AXIS_BRAM_31_WIDTH-1:0];
            assign bram_we[31][1][S_AXIS_BRAM_31_WIDTH/8-1:0] = ap_bram_31_we1;
            assign bram_en[31][1] = ap_bram_31_en1;
            
            assign out_clk[31] = m_axis_bramio_31_aclk;
            assign out_rst[31] = m_axis_bramio_31_aresetn;
            assign dwconv1_tready[31] = m_axis_bramio_31_tready;
            assign m_axis_bramio_31_tlast = dwconv1_tlast[31];
            assign m_axis_bramio_31_tvalid = dwconv1_tvalid[31];
            assign m_axis_bramio_31_tkeep = dwconv1_tkeep[31][M_AXIS_BRAMIO_31_DMWIDTH/8-1:0];
            assign m_axis_bramio_31_tstrb = dwconv1_tstrb[31][M_AXIS_BRAMIO_31_DMWIDTH/8-1:0];
            assign m_axis_bramio_31_tdata = dwconv1_tdata[31][M_AXIS_BRAMIO_31_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 32) begin
            assign in_clk[32] = s_axis_bram_32_aclk;
            assign in_rst[32] = s_axis_bram_32_aresetn;
            assign tlast[32] = s_axis_bram_32_tlast;
            assign tvalid[32] = s_axis_bram_32_tvalid;
            assign tkeep[32][S_AXIS_BRAM_32_DMWIDTH/8-1:0] = s_axis_bram_32_tkeep;
            assign tstrb[32][S_AXIS_BRAM_32_DMWIDTH/8-1:0] = s_axis_bram_32_tstrb;
            assign tdata[32][S_AXIS_BRAM_32_DMWIDTH-1:0] = s_axis_bram_32_tdata;
            assign s_axis_bram_32_tready = tready[32];
            
            assign bram_addr[32][0][S_AXIS_BRAM_32_ADDR_WIDTH-1:0] = ap_bram_32_addr0;
            assign bram_din[32][0][S_AXIS_BRAM_32_WIDTH-1:0] = ap_bram_32_din0;
            assign ap_bram_32_dout0 = bram_dout[32][0][S_AXIS_BRAM_32_WIDTH-1:0];
            assign bram_we[32][0][S_AXIS_BRAM_32_WIDTH/8-1:0] = ap_bram_32_we0;
            assign bram_en[32][0] = ap_bram_32_en0;
            assign bram_addr[32][1][S_AXIS_BRAM_32_ADDR_WIDTH-1:0] = ap_bram_32_addr1;
            assign bram_din[32][1][S_AXIS_BRAM_32_WIDTH-1:0] = ap_bram_32_din1;
            assign ap_bram_32_dout1 = bram_dout[32][1][S_AXIS_BRAM_32_WIDTH-1:0];
            assign bram_we[32][1][S_AXIS_BRAM_32_WIDTH/8-1:0] = ap_bram_32_we1;
            assign bram_en[32][1] = ap_bram_32_en1;
            
            assign out_clk[32] = m_axis_bramio_32_aclk;
            assign out_rst[32] = m_axis_bramio_32_aresetn;
            assign dwconv1_tready[32] = m_axis_bramio_32_tready;
            assign m_axis_bramio_32_tlast = dwconv1_tlast[32];
            assign m_axis_bramio_32_tvalid = dwconv1_tvalid[32];
            assign m_axis_bramio_32_tkeep = dwconv1_tkeep[32][M_AXIS_BRAMIO_32_DMWIDTH/8-1:0];
            assign m_axis_bramio_32_tstrb = dwconv1_tstrb[32][M_AXIS_BRAMIO_32_DMWIDTH/8-1:0];
            assign m_axis_bramio_32_tdata = dwconv1_tdata[32][M_AXIS_BRAMIO_32_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 33) begin
            assign in_clk[33] = s_axis_bram_33_aclk;
            assign in_rst[33] = s_axis_bram_33_aresetn;
            assign tlast[33] = s_axis_bram_33_tlast;
            assign tvalid[33] = s_axis_bram_33_tvalid;
            assign tkeep[33][S_AXIS_BRAM_33_DMWIDTH/8-1:0] = s_axis_bram_33_tkeep;
            assign tstrb[33][S_AXIS_BRAM_33_DMWIDTH/8-1:0] = s_axis_bram_33_tstrb;
            assign tdata[33][S_AXIS_BRAM_33_DMWIDTH-1:0] = s_axis_bram_33_tdata;
            assign s_axis_bram_33_tready = tready[33];
            
            assign bram_addr[33][0][S_AXIS_BRAM_33_ADDR_WIDTH-1:0] = ap_bram_33_addr0;
            assign bram_din[33][0][S_AXIS_BRAM_33_WIDTH-1:0] = ap_bram_33_din0;
            assign ap_bram_33_dout0 = bram_dout[33][0][S_AXIS_BRAM_33_WIDTH-1:0];
            assign bram_we[33][0][S_AXIS_BRAM_33_WIDTH/8-1:0] = ap_bram_33_we0;
            assign bram_en[33][0] = ap_bram_33_en0;
            assign bram_addr[33][1][S_AXIS_BRAM_33_ADDR_WIDTH-1:0] = ap_bram_33_addr1;
            assign bram_din[33][1][S_AXIS_BRAM_33_WIDTH-1:0] = ap_bram_33_din1;
            assign ap_bram_33_dout1 = bram_dout[33][1][S_AXIS_BRAM_33_WIDTH-1:0];
            assign bram_we[33][1][S_AXIS_BRAM_33_WIDTH/8-1:0] = ap_bram_33_we1;
            assign bram_en[33][1] = ap_bram_33_en1;
            
            assign out_clk[33] = m_axis_bramio_33_aclk;
            assign out_rst[33] = m_axis_bramio_33_aresetn;
            assign dwconv1_tready[33] = m_axis_bramio_33_tready;
            assign m_axis_bramio_33_tlast = dwconv1_tlast[33];
            assign m_axis_bramio_33_tvalid = dwconv1_tvalid[33];
            assign m_axis_bramio_33_tkeep = dwconv1_tkeep[33][M_AXIS_BRAMIO_33_DMWIDTH/8-1:0];
            assign m_axis_bramio_33_tstrb = dwconv1_tstrb[33][M_AXIS_BRAMIO_33_DMWIDTH/8-1:0];
            assign m_axis_bramio_33_tdata = dwconv1_tdata[33][M_AXIS_BRAMIO_33_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 34) begin
            assign in_clk[34] = s_axis_bram_34_aclk;
            assign in_rst[34] = s_axis_bram_34_aresetn;
            assign tlast[34] = s_axis_bram_34_tlast;
            assign tvalid[34] = s_axis_bram_34_tvalid;
            assign tkeep[34][S_AXIS_BRAM_34_DMWIDTH/8-1:0] = s_axis_bram_34_tkeep;
            assign tstrb[34][S_AXIS_BRAM_34_DMWIDTH/8-1:0] = s_axis_bram_34_tstrb;
            assign tdata[34][S_AXIS_BRAM_34_DMWIDTH-1:0] = s_axis_bram_34_tdata;
            assign s_axis_bram_34_tready = tready[34];
            
            assign bram_addr[34][0][S_AXIS_BRAM_34_ADDR_WIDTH-1:0] = ap_bram_34_addr0;
            assign bram_din[34][0][S_AXIS_BRAM_34_WIDTH-1:0] = ap_bram_34_din0;
            assign ap_bram_34_dout0 = bram_dout[34][0][S_AXIS_BRAM_34_WIDTH-1:0];
            assign bram_we[34][0][S_AXIS_BRAM_34_WIDTH/8-1:0] = ap_bram_34_we0;
            assign bram_en[34][0] = ap_bram_34_en0;
            assign bram_addr[34][1][S_AXIS_BRAM_34_ADDR_WIDTH-1:0] = ap_bram_34_addr1;
            assign bram_din[34][1][S_AXIS_BRAM_34_WIDTH-1:0] = ap_bram_34_din1;
            assign ap_bram_34_dout1 = bram_dout[34][1][S_AXIS_BRAM_34_WIDTH-1:0];
            assign bram_we[34][1][S_AXIS_BRAM_34_WIDTH/8-1:0] = ap_bram_34_we1;
            assign bram_en[34][1] = ap_bram_34_en1;
            
            assign out_clk[34] = m_axis_bramio_34_aclk;
            assign out_rst[34] = m_axis_bramio_34_aresetn;
            assign dwconv1_tready[34] = m_axis_bramio_34_tready;
            assign m_axis_bramio_34_tlast = dwconv1_tlast[34];
            assign m_axis_bramio_34_tvalid = dwconv1_tvalid[34];
            assign m_axis_bramio_34_tkeep = dwconv1_tkeep[34][M_AXIS_BRAMIO_34_DMWIDTH/8-1:0];
            assign m_axis_bramio_34_tstrb = dwconv1_tstrb[34][M_AXIS_BRAMIO_34_DMWIDTH/8-1:0];
            assign m_axis_bramio_34_tdata = dwconv1_tdata[34][M_AXIS_BRAMIO_34_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 35) begin
            assign in_clk[35] = s_axis_bram_35_aclk;
            assign in_rst[35] = s_axis_bram_35_aresetn;
            assign tlast[35] = s_axis_bram_35_tlast;
            assign tvalid[35] = s_axis_bram_35_tvalid;
            assign tkeep[35][S_AXIS_BRAM_35_DMWIDTH/8-1:0] = s_axis_bram_35_tkeep;
            assign tstrb[35][S_AXIS_BRAM_35_DMWIDTH/8-1:0] = s_axis_bram_35_tstrb;
            assign tdata[35][S_AXIS_BRAM_35_DMWIDTH-1:0] = s_axis_bram_35_tdata;
            assign s_axis_bram_35_tready = tready[35];
            
            assign bram_addr[35][0][S_AXIS_BRAM_35_ADDR_WIDTH-1:0] = ap_bram_35_addr0;
            assign bram_din[35][0][S_AXIS_BRAM_35_WIDTH-1:0] = ap_bram_35_din0;
            assign ap_bram_35_dout0 = bram_dout[35][0][S_AXIS_BRAM_35_WIDTH-1:0];
            assign bram_we[35][0][S_AXIS_BRAM_35_WIDTH/8-1:0] = ap_bram_35_we0;
            assign bram_en[35][0] = ap_bram_35_en0;
            assign bram_addr[35][1][S_AXIS_BRAM_35_ADDR_WIDTH-1:0] = ap_bram_35_addr1;
            assign bram_din[35][1][S_AXIS_BRAM_35_WIDTH-1:0] = ap_bram_35_din1;
            assign ap_bram_35_dout1 = bram_dout[35][1][S_AXIS_BRAM_35_WIDTH-1:0];
            assign bram_we[35][1][S_AXIS_BRAM_35_WIDTH/8-1:0] = ap_bram_35_we1;
            assign bram_en[35][1] = ap_bram_35_en1;
            
            assign out_clk[35] = m_axis_bramio_35_aclk;
            assign out_rst[35] = m_axis_bramio_35_aresetn;
            assign dwconv1_tready[35] = m_axis_bramio_35_tready;
            assign m_axis_bramio_35_tlast = dwconv1_tlast[35];
            assign m_axis_bramio_35_tvalid = dwconv1_tvalid[35];
            assign m_axis_bramio_35_tkeep = dwconv1_tkeep[35][M_AXIS_BRAMIO_35_DMWIDTH/8-1:0];
            assign m_axis_bramio_35_tstrb = dwconv1_tstrb[35][M_AXIS_BRAMIO_35_DMWIDTH/8-1:0];
            assign m_axis_bramio_35_tdata = dwconv1_tdata[35][M_AXIS_BRAMIO_35_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 36) begin
            assign in_clk[36] = s_axis_bram_36_aclk;
            assign in_rst[36] = s_axis_bram_36_aresetn;
            assign tlast[36] = s_axis_bram_36_tlast;
            assign tvalid[36] = s_axis_bram_36_tvalid;
            assign tkeep[36][S_AXIS_BRAM_36_DMWIDTH/8-1:0] = s_axis_bram_36_tkeep;
            assign tstrb[36][S_AXIS_BRAM_36_DMWIDTH/8-1:0] = s_axis_bram_36_tstrb;
            assign tdata[36][S_AXIS_BRAM_36_DMWIDTH-1:0] = s_axis_bram_36_tdata;
            assign s_axis_bram_36_tready = tready[36];
            
            assign bram_addr[36][0][S_AXIS_BRAM_36_ADDR_WIDTH-1:0] = ap_bram_36_addr0;
            assign bram_din[36][0][S_AXIS_BRAM_36_WIDTH-1:0] = ap_bram_36_din0;
            assign ap_bram_36_dout0 = bram_dout[36][0][S_AXIS_BRAM_36_WIDTH-1:0];
            assign bram_we[36][0][S_AXIS_BRAM_36_WIDTH/8-1:0] = ap_bram_36_we0;
            assign bram_en[36][0] = ap_bram_36_en0;
            assign bram_addr[36][1][S_AXIS_BRAM_36_ADDR_WIDTH-1:0] = ap_bram_36_addr1;
            assign bram_din[36][1][S_AXIS_BRAM_36_WIDTH-1:0] = ap_bram_36_din1;
            assign ap_bram_36_dout1 = bram_dout[36][1][S_AXIS_BRAM_36_WIDTH-1:0];
            assign bram_we[36][1][S_AXIS_BRAM_36_WIDTH/8-1:0] = ap_bram_36_we1;
            assign bram_en[36][1] = ap_bram_36_en1;
            
            assign out_clk[36] = m_axis_bramio_36_aclk;
            assign out_rst[36] = m_axis_bramio_36_aresetn;
            assign dwconv1_tready[36] = m_axis_bramio_36_tready;
            assign m_axis_bramio_36_tlast = dwconv1_tlast[36];
            assign m_axis_bramio_36_tvalid = dwconv1_tvalid[36];
            assign m_axis_bramio_36_tkeep = dwconv1_tkeep[36][M_AXIS_BRAMIO_36_DMWIDTH/8-1:0];
            assign m_axis_bramio_36_tstrb = dwconv1_tstrb[36][M_AXIS_BRAMIO_36_DMWIDTH/8-1:0];
            assign m_axis_bramio_36_tdata = dwconv1_tdata[36][M_AXIS_BRAMIO_36_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 37) begin
            assign in_clk[37] = s_axis_bram_37_aclk;
            assign in_rst[37] = s_axis_bram_37_aresetn;
            assign tlast[37] = s_axis_bram_37_tlast;
            assign tvalid[37] = s_axis_bram_37_tvalid;
            assign tkeep[37][S_AXIS_BRAM_37_DMWIDTH/8-1:0] = s_axis_bram_37_tkeep;
            assign tstrb[37][S_AXIS_BRAM_37_DMWIDTH/8-1:0] = s_axis_bram_37_tstrb;
            assign tdata[37][S_AXIS_BRAM_37_DMWIDTH-1:0] = s_axis_bram_37_tdata;
            assign s_axis_bram_37_tready = tready[37];
            
            assign bram_addr[37][0][S_AXIS_BRAM_37_ADDR_WIDTH-1:0] = ap_bram_37_addr0;
            assign bram_din[37][0][S_AXIS_BRAM_37_WIDTH-1:0] = ap_bram_37_din0;
            assign ap_bram_37_dout0 = bram_dout[37][0][S_AXIS_BRAM_37_WIDTH-1:0];
            assign bram_we[37][0][S_AXIS_BRAM_37_WIDTH/8-1:0] = ap_bram_37_we0;
            assign bram_en[37][0] = ap_bram_37_en0;
            assign bram_addr[37][1][S_AXIS_BRAM_37_ADDR_WIDTH-1:0] = ap_bram_37_addr1;
            assign bram_din[37][1][S_AXIS_BRAM_37_WIDTH-1:0] = ap_bram_37_din1;
            assign ap_bram_37_dout1 = bram_dout[37][1][S_AXIS_BRAM_37_WIDTH-1:0];
            assign bram_we[37][1][S_AXIS_BRAM_37_WIDTH/8-1:0] = ap_bram_37_we1;
            assign bram_en[37][1] = ap_bram_37_en1;
            
            assign out_clk[37] = m_axis_bramio_37_aclk;
            assign out_rst[37] = m_axis_bramio_37_aresetn;
            assign dwconv1_tready[37] = m_axis_bramio_37_tready;
            assign m_axis_bramio_37_tlast = dwconv1_tlast[37];
            assign m_axis_bramio_37_tvalid = dwconv1_tvalid[37];
            assign m_axis_bramio_37_tkeep = dwconv1_tkeep[37][M_AXIS_BRAMIO_37_DMWIDTH/8-1:0];
            assign m_axis_bramio_37_tstrb = dwconv1_tstrb[37][M_AXIS_BRAMIO_37_DMWIDTH/8-1:0];
            assign m_axis_bramio_37_tdata = dwconv1_tdata[37][M_AXIS_BRAMIO_37_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 38) begin
            assign in_clk[38] = s_axis_bram_38_aclk;
            assign in_rst[38] = s_axis_bram_38_aresetn;
            assign tlast[38] = s_axis_bram_38_tlast;
            assign tvalid[38] = s_axis_bram_38_tvalid;
            assign tkeep[38][S_AXIS_BRAM_38_DMWIDTH/8-1:0] = s_axis_bram_38_tkeep;
            assign tstrb[38][S_AXIS_BRAM_38_DMWIDTH/8-1:0] = s_axis_bram_38_tstrb;
            assign tdata[38][S_AXIS_BRAM_38_DMWIDTH-1:0] = s_axis_bram_38_tdata;
            assign s_axis_bram_38_tready = tready[38];
            
            assign bram_addr[38][0][S_AXIS_BRAM_38_ADDR_WIDTH-1:0] = ap_bram_38_addr0;
            assign bram_din[38][0][S_AXIS_BRAM_38_WIDTH-1:0] = ap_bram_38_din0;
            assign ap_bram_38_dout0 = bram_dout[38][0][S_AXIS_BRAM_38_WIDTH-1:0];
            assign bram_we[38][0][S_AXIS_BRAM_38_WIDTH/8-1:0] = ap_bram_38_we0;
            assign bram_en[38][0] = ap_bram_38_en0;
            assign bram_addr[38][1][S_AXIS_BRAM_38_ADDR_WIDTH-1:0] = ap_bram_38_addr1;
            assign bram_din[38][1][S_AXIS_BRAM_38_WIDTH-1:0] = ap_bram_38_din1;
            assign ap_bram_38_dout1 = bram_dout[38][1][S_AXIS_BRAM_38_WIDTH-1:0];
            assign bram_we[38][1][S_AXIS_BRAM_38_WIDTH/8-1:0] = ap_bram_38_we1;
            assign bram_en[38][1] = ap_bram_38_en1;
            
            assign out_clk[38] = m_axis_bramio_38_aclk;
            assign out_rst[38] = m_axis_bramio_38_aresetn;
            assign dwconv1_tready[38] = m_axis_bramio_38_tready;
            assign m_axis_bramio_38_tlast = dwconv1_tlast[38];
            assign m_axis_bramio_38_tvalid = dwconv1_tvalid[38];
            assign m_axis_bramio_38_tkeep = dwconv1_tkeep[38][M_AXIS_BRAMIO_38_DMWIDTH/8-1:0];
            assign m_axis_bramio_38_tstrb = dwconv1_tstrb[38][M_AXIS_BRAMIO_38_DMWIDTH/8-1:0];
            assign m_axis_bramio_38_tdata = dwconv1_tdata[38][M_AXIS_BRAMIO_38_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 39) begin
            assign in_clk[39] = s_axis_bram_39_aclk;
            assign in_rst[39] = s_axis_bram_39_aresetn;
            assign tlast[39] = s_axis_bram_39_tlast;
            assign tvalid[39] = s_axis_bram_39_tvalid;
            assign tkeep[39][S_AXIS_BRAM_39_DMWIDTH/8-1:0] = s_axis_bram_39_tkeep;
            assign tstrb[39][S_AXIS_BRAM_39_DMWIDTH/8-1:0] = s_axis_bram_39_tstrb;
            assign tdata[39][S_AXIS_BRAM_39_DMWIDTH-1:0] = s_axis_bram_39_tdata;
            assign s_axis_bram_39_tready = tready[39];
            
            assign bram_addr[39][0][S_AXIS_BRAM_39_ADDR_WIDTH-1:0] = ap_bram_39_addr0;
            assign bram_din[39][0][S_AXIS_BRAM_39_WIDTH-1:0] = ap_bram_39_din0;
            assign ap_bram_39_dout0 = bram_dout[39][0][S_AXIS_BRAM_39_WIDTH-1:0];
            assign bram_we[39][0][S_AXIS_BRAM_39_WIDTH/8-1:0] = ap_bram_39_we0;
            assign bram_en[39][0] = ap_bram_39_en0;
            assign bram_addr[39][1][S_AXIS_BRAM_39_ADDR_WIDTH-1:0] = ap_bram_39_addr1;
            assign bram_din[39][1][S_AXIS_BRAM_39_WIDTH-1:0] = ap_bram_39_din1;
            assign ap_bram_39_dout1 = bram_dout[39][1][S_AXIS_BRAM_39_WIDTH-1:0];
            assign bram_we[39][1][S_AXIS_BRAM_39_WIDTH/8-1:0] = ap_bram_39_we1;
            assign bram_en[39][1] = ap_bram_39_en1;
            
            assign out_clk[39] = m_axis_bramio_39_aclk;
            assign out_rst[39] = m_axis_bramio_39_aresetn;
            assign dwconv1_tready[39] = m_axis_bramio_39_tready;
            assign m_axis_bramio_39_tlast = dwconv1_tlast[39];
            assign m_axis_bramio_39_tvalid = dwconv1_tvalid[39];
            assign m_axis_bramio_39_tkeep = dwconv1_tkeep[39][M_AXIS_BRAMIO_39_DMWIDTH/8-1:0];
            assign m_axis_bramio_39_tstrb = dwconv1_tstrb[39][M_AXIS_BRAMIO_39_DMWIDTH/8-1:0];
            assign m_axis_bramio_39_tdata = dwconv1_tdata[39][M_AXIS_BRAMIO_39_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 40) begin
            assign in_clk[40] = s_axis_bram_40_aclk;
            assign in_rst[40] = s_axis_bram_40_aresetn;
            assign tlast[40] = s_axis_bram_40_tlast;
            assign tvalid[40] = s_axis_bram_40_tvalid;
            assign tkeep[40][S_AXIS_BRAM_40_DMWIDTH/8-1:0] = s_axis_bram_40_tkeep;
            assign tstrb[40][S_AXIS_BRAM_40_DMWIDTH/8-1:0] = s_axis_bram_40_tstrb;
            assign tdata[40][S_AXIS_BRAM_40_DMWIDTH-1:0] = s_axis_bram_40_tdata;
            assign s_axis_bram_40_tready = tready[40];
            
            assign bram_addr[40][0][S_AXIS_BRAM_40_ADDR_WIDTH-1:0] = ap_bram_40_addr0;
            assign bram_din[40][0][S_AXIS_BRAM_40_WIDTH-1:0] = ap_bram_40_din0;
            assign ap_bram_40_dout0 = bram_dout[40][0][S_AXIS_BRAM_40_WIDTH-1:0];
            assign bram_we[40][0][S_AXIS_BRAM_40_WIDTH/8-1:0] = ap_bram_40_we0;
            assign bram_en[40][0] = ap_bram_40_en0;
            assign bram_addr[40][1][S_AXIS_BRAM_40_ADDR_WIDTH-1:0] = ap_bram_40_addr1;
            assign bram_din[40][1][S_AXIS_BRAM_40_WIDTH-1:0] = ap_bram_40_din1;
            assign ap_bram_40_dout1 = bram_dout[40][1][S_AXIS_BRAM_40_WIDTH-1:0];
            assign bram_we[40][1][S_AXIS_BRAM_40_WIDTH/8-1:0] = ap_bram_40_we1;
            assign bram_en[40][1] = ap_bram_40_en1;
            
            assign out_clk[40] = m_axis_bramio_40_aclk;
            assign out_rst[40] = m_axis_bramio_40_aresetn;
            assign dwconv1_tready[40] = m_axis_bramio_40_tready;
            assign m_axis_bramio_40_tlast = dwconv1_tlast[40];
            assign m_axis_bramio_40_tvalid = dwconv1_tvalid[40];
            assign m_axis_bramio_40_tkeep = dwconv1_tkeep[40][M_AXIS_BRAMIO_40_DMWIDTH/8-1:0];
            assign m_axis_bramio_40_tstrb = dwconv1_tstrb[40][M_AXIS_BRAMIO_40_DMWIDTH/8-1:0];
            assign m_axis_bramio_40_tdata = dwconv1_tdata[40][M_AXIS_BRAMIO_40_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 41) begin
            assign in_clk[41] = s_axis_bram_41_aclk;
            assign in_rst[41] = s_axis_bram_41_aresetn;
            assign tlast[41] = s_axis_bram_41_tlast;
            assign tvalid[41] = s_axis_bram_41_tvalid;
            assign tkeep[41][S_AXIS_BRAM_41_DMWIDTH/8-1:0] = s_axis_bram_41_tkeep;
            assign tstrb[41][S_AXIS_BRAM_41_DMWIDTH/8-1:0] = s_axis_bram_41_tstrb;
            assign tdata[41][S_AXIS_BRAM_41_DMWIDTH-1:0] = s_axis_bram_41_tdata;
            assign s_axis_bram_41_tready = tready[41];
            
            assign bram_addr[41][0][S_AXIS_BRAM_41_ADDR_WIDTH-1:0] = ap_bram_41_addr0;
            assign bram_din[41][0][S_AXIS_BRAM_41_WIDTH-1:0] = ap_bram_41_din0;
            assign ap_bram_41_dout0 = bram_dout[41][0][S_AXIS_BRAM_41_WIDTH-1:0];
            assign bram_we[41][0][S_AXIS_BRAM_41_WIDTH/8-1:0] = ap_bram_41_we0;
            assign bram_en[41][0] = ap_bram_41_en0;
            assign bram_addr[41][1][S_AXIS_BRAM_41_ADDR_WIDTH-1:0] = ap_bram_41_addr1;
            assign bram_din[41][1][S_AXIS_BRAM_41_WIDTH-1:0] = ap_bram_41_din1;
            assign ap_bram_41_dout1 = bram_dout[41][1][S_AXIS_BRAM_41_WIDTH-1:0];
            assign bram_we[41][1][S_AXIS_BRAM_41_WIDTH/8-1:0] = ap_bram_41_we1;
            assign bram_en[41][1] = ap_bram_41_en1;
            
            assign out_clk[41] = m_axis_bramio_41_aclk;
            assign out_rst[41] = m_axis_bramio_41_aresetn;
            assign dwconv1_tready[41] = m_axis_bramio_41_tready;
            assign m_axis_bramio_41_tlast = dwconv1_tlast[41];
            assign m_axis_bramio_41_tvalid = dwconv1_tvalid[41];
            assign m_axis_bramio_41_tkeep = dwconv1_tkeep[41][M_AXIS_BRAMIO_41_DMWIDTH/8-1:0];
            assign m_axis_bramio_41_tstrb = dwconv1_tstrb[41][M_AXIS_BRAMIO_41_DMWIDTH/8-1:0];
            assign m_axis_bramio_41_tdata = dwconv1_tdata[41][M_AXIS_BRAMIO_41_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 42) begin
            assign in_clk[42] = s_axis_bram_42_aclk;
            assign in_rst[42] = s_axis_bram_42_aresetn;
            assign tlast[42] = s_axis_bram_42_tlast;
            assign tvalid[42] = s_axis_bram_42_tvalid;
            assign tkeep[42][S_AXIS_BRAM_42_DMWIDTH/8-1:0] = s_axis_bram_42_tkeep;
            assign tstrb[42][S_AXIS_BRAM_42_DMWIDTH/8-1:0] = s_axis_bram_42_tstrb;
            assign tdata[42][S_AXIS_BRAM_42_DMWIDTH-1:0] = s_axis_bram_42_tdata;
            assign s_axis_bram_42_tready = tready[42];
            
            assign bram_addr[42][0][S_AXIS_BRAM_42_ADDR_WIDTH-1:0] = ap_bram_42_addr0;
            assign bram_din[42][0][S_AXIS_BRAM_42_WIDTH-1:0] = ap_bram_42_din0;
            assign ap_bram_42_dout0 = bram_dout[42][0][S_AXIS_BRAM_42_WIDTH-1:0];
            assign bram_we[42][0][S_AXIS_BRAM_42_WIDTH/8-1:0] = ap_bram_42_we0;
            assign bram_en[42][0] = ap_bram_42_en0;
            assign bram_addr[42][1][S_AXIS_BRAM_42_ADDR_WIDTH-1:0] = ap_bram_42_addr1;
            assign bram_din[42][1][S_AXIS_BRAM_42_WIDTH-1:0] = ap_bram_42_din1;
            assign ap_bram_42_dout1 = bram_dout[42][1][S_AXIS_BRAM_42_WIDTH-1:0];
            assign bram_we[42][1][S_AXIS_BRAM_42_WIDTH/8-1:0] = ap_bram_42_we1;
            assign bram_en[42][1] = ap_bram_42_en1;
            
            assign out_clk[42] = m_axis_bramio_42_aclk;
            assign out_rst[42] = m_axis_bramio_42_aresetn;
            assign dwconv1_tready[42] = m_axis_bramio_42_tready;
            assign m_axis_bramio_42_tlast = dwconv1_tlast[42];
            assign m_axis_bramio_42_tvalid = dwconv1_tvalid[42];
            assign m_axis_bramio_42_tkeep = dwconv1_tkeep[42][M_AXIS_BRAMIO_42_DMWIDTH/8-1:0];
            assign m_axis_bramio_42_tstrb = dwconv1_tstrb[42][M_AXIS_BRAMIO_42_DMWIDTH/8-1:0];
            assign m_axis_bramio_42_tdata = dwconv1_tdata[42][M_AXIS_BRAMIO_42_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 43) begin
            assign in_clk[43] = s_axis_bram_43_aclk;
            assign in_rst[43] = s_axis_bram_43_aresetn;
            assign tlast[43] = s_axis_bram_43_tlast;
            assign tvalid[43] = s_axis_bram_43_tvalid;
            assign tkeep[43][S_AXIS_BRAM_43_DMWIDTH/8-1:0] = s_axis_bram_43_tkeep;
            assign tstrb[43][S_AXIS_BRAM_43_DMWIDTH/8-1:0] = s_axis_bram_43_tstrb;
            assign tdata[43][S_AXIS_BRAM_43_DMWIDTH-1:0] = s_axis_bram_43_tdata;
            assign s_axis_bram_43_tready = tready[43];
            
            assign bram_addr[43][0][S_AXIS_BRAM_43_ADDR_WIDTH-1:0] = ap_bram_43_addr0;
            assign bram_din[43][0][S_AXIS_BRAM_43_WIDTH-1:0] = ap_bram_43_din0;
            assign ap_bram_43_dout0 = bram_dout[43][0][S_AXIS_BRAM_43_WIDTH-1:0];
            assign bram_we[43][0][S_AXIS_BRAM_43_WIDTH/8-1:0] = ap_bram_43_we0;
            assign bram_en[43][0] = ap_bram_43_en0;
            assign bram_addr[43][1][S_AXIS_BRAM_43_ADDR_WIDTH-1:0] = ap_bram_43_addr1;
            assign bram_din[43][1][S_AXIS_BRAM_43_WIDTH-1:0] = ap_bram_43_din1;
            assign ap_bram_43_dout1 = bram_dout[43][1][S_AXIS_BRAM_43_WIDTH-1:0];
            assign bram_we[43][1][S_AXIS_BRAM_43_WIDTH/8-1:0] = ap_bram_43_we1;
            assign bram_en[43][1] = ap_bram_43_en1;
            
            assign out_clk[43] = m_axis_bramio_43_aclk;
            assign out_rst[43] = m_axis_bramio_43_aresetn;
            assign dwconv1_tready[43] = m_axis_bramio_43_tready;
            assign m_axis_bramio_43_tlast = dwconv1_tlast[43];
            assign m_axis_bramio_43_tvalid = dwconv1_tvalid[43];
            assign m_axis_bramio_43_tkeep = dwconv1_tkeep[43][M_AXIS_BRAMIO_43_DMWIDTH/8-1:0];
            assign m_axis_bramio_43_tstrb = dwconv1_tstrb[43][M_AXIS_BRAMIO_43_DMWIDTH/8-1:0];
            assign m_axis_bramio_43_tdata = dwconv1_tdata[43][M_AXIS_BRAMIO_43_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 44) begin
            assign in_clk[44] = s_axis_bram_44_aclk;
            assign in_rst[44] = s_axis_bram_44_aresetn;
            assign tlast[44] = s_axis_bram_44_tlast;
            assign tvalid[44] = s_axis_bram_44_tvalid;
            assign tkeep[44][S_AXIS_BRAM_44_DMWIDTH/8-1:0] = s_axis_bram_44_tkeep;
            assign tstrb[44][S_AXIS_BRAM_44_DMWIDTH/8-1:0] = s_axis_bram_44_tstrb;
            assign tdata[44][S_AXIS_BRAM_44_DMWIDTH-1:0] = s_axis_bram_44_tdata;
            assign s_axis_bram_44_tready = tready[44];
            
            assign bram_addr[44][0][S_AXIS_BRAM_44_ADDR_WIDTH-1:0] = ap_bram_44_addr0;
            assign bram_din[44][0][S_AXIS_BRAM_44_WIDTH-1:0] = ap_bram_44_din0;
            assign ap_bram_44_dout0 = bram_dout[44][0][S_AXIS_BRAM_44_WIDTH-1:0];
            assign bram_we[44][0][S_AXIS_BRAM_44_WIDTH/8-1:0] = ap_bram_44_we0;
            assign bram_en[44][0] = ap_bram_44_en0;
            assign bram_addr[44][1][S_AXIS_BRAM_44_ADDR_WIDTH-1:0] = ap_bram_44_addr1;
            assign bram_din[44][1][S_AXIS_BRAM_44_WIDTH-1:0] = ap_bram_44_din1;
            assign ap_bram_44_dout1 = bram_dout[44][1][S_AXIS_BRAM_44_WIDTH-1:0];
            assign bram_we[44][1][S_AXIS_BRAM_44_WIDTH/8-1:0] = ap_bram_44_we1;
            assign bram_en[44][1] = ap_bram_44_en1;
            
            assign out_clk[44] = m_axis_bramio_44_aclk;
            assign out_rst[44] = m_axis_bramio_44_aresetn;
            assign dwconv1_tready[44] = m_axis_bramio_44_tready;
            assign m_axis_bramio_44_tlast = dwconv1_tlast[44];
            assign m_axis_bramio_44_tvalid = dwconv1_tvalid[44];
            assign m_axis_bramio_44_tkeep = dwconv1_tkeep[44][M_AXIS_BRAMIO_44_DMWIDTH/8-1:0];
            assign m_axis_bramio_44_tstrb = dwconv1_tstrb[44][M_AXIS_BRAMIO_44_DMWIDTH/8-1:0];
            assign m_axis_bramio_44_tdata = dwconv1_tdata[44][M_AXIS_BRAMIO_44_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 45) begin
            assign in_clk[45] = s_axis_bram_45_aclk;
            assign in_rst[45] = s_axis_bram_45_aresetn;
            assign tlast[45] = s_axis_bram_45_tlast;
            assign tvalid[45] = s_axis_bram_45_tvalid;
            assign tkeep[45][S_AXIS_BRAM_45_DMWIDTH/8-1:0] = s_axis_bram_45_tkeep;
            assign tstrb[45][S_AXIS_BRAM_45_DMWIDTH/8-1:0] = s_axis_bram_45_tstrb;
            assign tdata[45][S_AXIS_BRAM_45_DMWIDTH-1:0] = s_axis_bram_45_tdata;
            assign s_axis_bram_45_tready = tready[45];
            
            assign bram_addr[45][0][S_AXIS_BRAM_45_ADDR_WIDTH-1:0] = ap_bram_45_addr0;
            assign bram_din[45][0][S_AXIS_BRAM_45_WIDTH-1:0] = ap_bram_45_din0;
            assign ap_bram_45_dout0 = bram_dout[45][0][S_AXIS_BRAM_45_WIDTH-1:0];
            assign bram_we[45][0][S_AXIS_BRAM_45_WIDTH/8-1:0] = ap_bram_45_we0;
            assign bram_en[45][0] = ap_bram_45_en0;
            assign bram_addr[45][1][S_AXIS_BRAM_45_ADDR_WIDTH-1:0] = ap_bram_45_addr1;
            assign bram_din[45][1][S_AXIS_BRAM_45_WIDTH-1:0] = ap_bram_45_din1;
            assign ap_bram_45_dout1 = bram_dout[45][1][S_AXIS_BRAM_45_WIDTH-1:0];
            assign bram_we[45][1][S_AXIS_BRAM_45_WIDTH/8-1:0] = ap_bram_45_we1;
            assign bram_en[45][1] = ap_bram_45_en1;
            
            assign out_clk[45] = m_axis_bramio_45_aclk;
            assign out_rst[45] = m_axis_bramio_45_aresetn;
            assign dwconv1_tready[45] = m_axis_bramio_45_tready;
            assign m_axis_bramio_45_tlast = dwconv1_tlast[45];
            assign m_axis_bramio_45_tvalid = dwconv1_tvalid[45];
            assign m_axis_bramio_45_tkeep = dwconv1_tkeep[45][M_AXIS_BRAMIO_45_DMWIDTH/8-1:0];
            assign m_axis_bramio_45_tstrb = dwconv1_tstrb[45][M_AXIS_BRAMIO_45_DMWIDTH/8-1:0];
            assign m_axis_bramio_45_tdata = dwconv1_tdata[45][M_AXIS_BRAMIO_45_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 46) begin
            assign in_clk[46] = s_axis_bram_46_aclk;
            assign in_rst[46] = s_axis_bram_46_aresetn;
            assign tlast[46] = s_axis_bram_46_tlast;
            assign tvalid[46] = s_axis_bram_46_tvalid;
            assign tkeep[46][S_AXIS_BRAM_46_DMWIDTH/8-1:0] = s_axis_bram_46_tkeep;
            assign tstrb[46][S_AXIS_BRAM_46_DMWIDTH/8-1:0] = s_axis_bram_46_tstrb;
            assign tdata[46][S_AXIS_BRAM_46_DMWIDTH-1:0] = s_axis_bram_46_tdata;
            assign s_axis_bram_46_tready = tready[46];
            
            assign bram_addr[46][0][S_AXIS_BRAM_46_ADDR_WIDTH-1:0] = ap_bram_46_addr0;
            assign bram_din[46][0][S_AXIS_BRAM_46_WIDTH-1:0] = ap_bram_46_din0;
            assign ap_bram_46_dout0 = bram_dout[46][0][S_AXIS_BRAM_46_WIDTH-1:0];
            assign bram_we[46][0][S_AXIS_BRAM_46_WIDTH/8-1:0] = ap_bram_46_we0;
            assign bram_en[46][0] = ap_bram_46_en0;
            assign bram_addr[46][1][S_AXIS_BRAM_46_ADDR_WIDTH-1:0] = ap_bram_46_addr1;
            assign bram_din[46][1][S_AXIS_BRAM_46_WIDTH-1:0] = ap_bram_46_din1;
            assign ap_bram_46_dout1 = bram_dout[46][1][S_AXIS_BRAM_46_WIDTH-1:0];
            assign bram_we[46][1][S_AXIS_BRAM_46_WIDTH/8-1:0] = ap_bram_46_we1;
            assign bram_en[46][1] = ap_bram_46_en1;
            
            assign out_clk[46] = m_axis_bramio_46_aclk;
            assign out_rst[46] = m_axis_bramio_46_aresetn;
            assign dwconv1_tready[46] = m_axis_bramio_46_tready;
            assign m_axis_bramio_46_tlast = dwconv1_tlast[46];
            assign m_axis_bramio_46_tvalid = dwconv1_tvalid[46];
            assign m_axis_bramio_46_tkeep = dwconv1_tkeep[46][M_AXIS_BRAMIO_46_DMWIDTH/8-1:0];
            assign m_axis_bramio_46_tstrb = dwconv1_tstrb[46][M_AXIS_BRAMIO_46_DMWIDTH/8-1:0];
            assign m_axis_bramio_46_tdata = dwconv1_tdata[46][M_AXIS_BRAMIO_46_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 47) begin
            assign in_clk[47] = s_axis_bram_47_aclk;
            assign in_rst[47] = s_axis_bram_47_aresetn;
            assign tlast[47] = s_axis_bram_47_tlast;
            assign tvalid[47] = s_axis_bram_47_tvalid;
            assign tkeep[47][S_AXIS_BRAM_47_DMWIDTH/8-1:0] = s_axis_bram_47_tkeep;
            assign tstrb[47][S_AXIS_BRAM_47_DMWIDTH/8-1:0] = s_axis_bram_47_tstrb;
            assign tdata[47][S_AXIS_BRAM_47_DMWIDTH-1:0] = s_axis_bram_47_tdata;
            assign s_axis_bram_47_tready = tready[47];
            
            assign bram_addr[47][0][S_AXIS_BRAM_47_ADDR_WIDTH-1:0] = ap_bram_47_addr0;
            assign bram_din[47][0][S_AXIS_BRAM_47_WIDTH-1:0] = ap_bram_47_din0;
            assign ap_bram_47_dout0 = bram_dout[47][0][S_AXIS_BRAM_47_WIDTH-1:0];
            assign bram_we[47][0][S_AXIS_BRAM_47_WIDTH/8-1:0] = ap_bram_47_we0;
            assign bram_en[47][0] = ap_bram_47_en0;
            assign bram_addr[47][1][S_AXIS_BRAM_47_ADDR_WIDTH-1:0] = ap_bram_47_addr1;
            assign bram_din[47][1][S_AXIS_BRAM_47_WIDTH-1:0] = ap_bram_47_din1;
            assign ap_bram_47_dout1 = bram_dout[47][1][S_AXIS_BRAM_47_WIDTH-1:0];
            assign bram_we[47][1][S_AXIS_BRAM_47_WIDTH/8-1:0] = ap_bram_47_we1;
            assign bram_en[47][1] = ap_bram_47_en1;
            
            assign out_clk[47] = m_axis_bramio_47_aclk;
            assign out_rst[47] = m_axis_bramio_47_aresetn;
            assign dwconv1_tready[47] = m_axis_bramio_47_tready;
            assign m_axis_bramio_47_tlast = dwconv1_tlast[47];
            assign m_axis_bramio_47_tvalid = dwconv1_tvalid[47];
            assign m_axis_bramio_47_tkeep = dwconv1_tkeep[47][M_AXIS_BRAMIO_47_DMWIDTH/8-1:0];
            assign m_axis_bramio_47_tstrb = dwconv1_tstrb[47][M_AXIS_BRAMIO_47_DMWIDTH/8-1:0];
            assign m_axis_bramio_47_tdata = dwconv1_tdata[47][M_AXIS_BRAMIO_47_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 48) begin
            assign in_clk[48] = s_axis_bram_48_aclk;
            assign in_rst[48] = s_axis_bram_48_aresetn;
            assign tlast[48] = s_axis_bram_48_tlast;
            assign tvalid[48] = s_axis_bram_48_tvalid;
            assign tkeep[48][S_AXIS_BRAM_48_DMWIDTH/8-1:0] = s_axis_bram_48_tkeep;
            assign tstrb[48][S_AXIS_BRAM_48_DMWIDTH/8-1:0] = s_axis_bram_48_tstrb;
            assign tdata[48][S_AXIS_BRAM_48_DMWIDTH-1:0] = s_axis_bram_48_tdata;
            assign s_axis_bram_48_tready = tready[48];
            
            assign bram_addr[48][0][S_AXIS_BRAM_48_ADDR_WIDTH-1:0] = ap_bram_48_addr0;
            assign bram_din[48][0][S_AXIS_BRAM_48_WIDTH-1:0] = ap_bram_48_din0;
            assign ap_bram_48_dout0 = bram_dout[48][0][S_AXIS_BRAM_48_WIDTH-1:0];
            assign bram_we[48][0][S_AXIS_BRAM_48_WIDTH/8-1:0] = ap_bram_48_we0;
            assign bram_en[48][0] = ap_bram_48_en0;
            assign bram_addr[48][1][S_AXIS_BRAM_48_ADDR_WIDTH-1:0] = ap_bram_48_addr1;
            assign bram_din[48][1][S_AXIS_BRAM_48_WIDTH-1:0] = ap_bram_48_din1;
            assign ap_bram_48_dout1 = bram_dout[48][1][S_AXIS_BRAM_48_WIDTH-1:0];
            assign bram_we[48][1][S_AXIS_BRAM_48_WIDTH/8-1:0] = ap_bram_48_we1;
            assign bram_en[48][1] = ap_bram_48_en1;
            
            assign out_clk[48] = m_axis_bramio_48_aclk;
            assign out_rst[48] = m_axis_bramio_48_aresetn;
            assign dwconv1_tready[48] = m_axis_bramio_48_tready;
            assign m_axis_bramio_48_tlast = dwconv1_tlast[48];
            assign m_axis_bramio_48_tvalid = dwconv1_tvalid[48];
            assign m_axis_bramio_48_tkeep = dwconv1_tkeep[48][M_AXIS_BRAMIO_48_DMWIDTH/8-1:0];
            assign m_axis_bramio_48_tstrb = dwconv1_tstrb[48][M_AXIS_BRAMIO_48_DMWIDTH/8-1:0];
            assign m_axis_bramio_48_tdata = dwconv1_tdata[48][M_AXIS_BRAMIO_48_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 49) begin
            assign in_clk[49] = s_axis_bram_49_aclk;
            assign in_rst[49] = s_axis_bram_49_aresetn;
            assign tlast[49] = s_axis_bram_49_tlast;
            assign tvalid[49] = s_axis_bram_49_tvalid;
            assign tkeep[49][S_AXIS_BRAM_49_DMWIDTH/8-1:0] = s_axis_bram_49_tkeep;
            assign tstrb[49][S_AXIS_BRAM_49_DMWIDTH/8-1:0] = s_axis_bram_49_tstrb;
            assign tdata[49][S_AXIS_BRAM_49_DMWIDTH-1:0] = s_axis_bram_49_tdata;
            assign s_axis_bram_49_tready = tready[49];
            
            assign bram_addr[49][0][S_AXIS_BRAM_49_ADDR_WIDTH-1:0] = ap_bram_49_addr0;
            assign bram_din[49][0][S_AXIS_BRAM_49_WIDTH-1:0] = ap_bram_49_din0;
            assign ap_bram_49_dout0 = bram_dout[49][0][S_AXIS_BRAM_49_WIDTH-1:0];
            assign bram_we[49][0][S_AXIS_BRAM_49_WIDTH/8-1:0] = ap_bram_49_we0;
            assign bram_en[49][0] = ap_bram_49_en0;
            assign bram_addr[49][1][S_AXIS_BRAM_49_ADDR_WIDTH-1:0] = ap_bram_49_addr1;
            assign bram_din[49][1][S_AXIS_BRAM_49_WIDTH-1:0] = ap_bram_49_din1;
            assign ap_bram_49_dout1 = bram_dout[49][1][S_AXIS_BRAM_49_WIDTH-1:0];
            assign bram_we[49][1][S_AXIS_BRAM_49_WIDTH/8-1:0] = ap_bram_49_we1;
            assign bram_en[49][1] = ap_bram_49_en1;
            
            assign out_clk[49] = m_axis_bramio_49_aclk;
            assign out_rst[49] = m_axis_bramio_49_aresetn;
            assign dwconv1_tready[49] = m_axis_bramio_49_tready;
            assign m_axis_bramio_49_tlast = dwconv1_tlast[49];
            assign m_axis_bramio_49_tvalid = dwconv1_tvalid[49];
            assign m_axis_bramio_49_tkeep = dwconv1_tkeep[49][M_AXIS_BRAMIO_49_DMWIDTH/8-1:0];
            assign m_axis_bramio_49_tstrb = dwconv1_tstrb[49][M_AXIS_BRAMIO_49_DMWIDTH/8-1:0];
            assign m_axis_bramio_49_tdata = dwconv1_tdata[49][M_AXIS_BRAMIO_49_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 50) begin
            assign in_clk[50] = s_axis_bram_50_aclk;
            assign in_rst[50] = s_axis_bram_50_aresetn;
            assign tlast[50] = s_axis_bram_50_tlast;
            assign tvalid[50] = s_axis_bram_50_tvalid;
            assign tkeep[50][S_AXIS_BRAM_50_DMWIDTH/8-1:0] = s_axis_bram_50_tkeep;
            assign tstrb[50][S_AXIS_BRAM_50_DMWIDTH/8-1:0] = s_axis_bram_50_tstrb;
            assign tdata[50][S_AXIS_BRAM_50_DMWIDTH-1:0] = s_axis_bram_50_tdata;
            assign s_axis_bram_50_tready = tready[50];
            
            assign bram_addr[50][0][S_AXIS_BRAM_50_ADDR_WIDTH-1:0] = ap_bram_50_addr0;
            assign bram_din[50][0][S_AXIS_BRAM_50_WIDTH-1:0] = ap_bram_50_din0;
            assign ap_bram_50_dout0 = bram_dout[50][0][S_AXIS_BRAM_50_WIDTH-1:0];
            assign bram_we[50][0][S_AXIS_BRAM_50_WIDTH/8-1:0] = ap_bram_50_we0;
            assign bram_en[50][0] = ap_bram_50_en0;
            assign bram_addr[50][1][S_AXIS_BRAM_50_ADDR_WIDTH-1:0] = ap_bram_50_addr1;
            assign bram_din[50][1][S_AXIS_BRAM_50_WIDTH-1:0] = ap_bram_50_din1;
            assign ap_bram_50_dout1 = bram_dout[50][1][S_AXIS_BRAM_50_WIDTH-1:0];
            assign bram_we[50][1][S_AXIS_BRAM_50_WIDTH/8-1:0] = ap_bram_50_we1;
            assign bram_en[50][1] = ap_bram_50_en1;
            
            assign out_clk[50] = m_axis_bramio_50_aclk;
            assign out_rst[50] = m_axis_bramio_50_aresetn;
            assign dwconv1_tready[50] = m_axis_bramio_50_tready;
            assign m_axis_bramio_50_tlast = dwconv1_tlast[50];
            assign m_axis_bramio_50_tvalid = dwconv1_tvalid[50];
            assign m_axis_bramio_50_tkeep = dwconv1_tkeep[50][M_AXIS_BRAMIO_50_DMWIDTH/8-1:0];
            assign m_axis_bramio_50_tstrb = dwconv1_tstrb[50][M_AXIS_BRAMIO_50_DMWIDTH/8-1:0];
            assign m_axis_bramio_50_tdata = dwconv1_tdata[50][M_AXIS_BRAMIO_50_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 51) begin
            assign in_clk[51] = s_axis_bram_51_aclk;
            assign in_rst[51] = s_axis_bram_51_aresetn;
            assign tlast[51] = s_axis_bram_51_tlast;
            assign tvalid[51] = s_axis_bram_51_tvalid;
            assign tkeep[51][S_AXIS_BRAM_51_DMWIDTH/8-1:0] = s_axis_bram_51_tkeep;
            assign tstrb[51][S_AXIS_BRAM_51_DMWIDTH/8-1:0] = s_axis_bram_51_tstrb;
            assign tdata[51][S_AXIS_BRAM_51_DMWIDTH-1:0] = s_axis_bram_51_tdata;
            assign s_axis_bram_51_tready = tready[51];
            
            assign bram_addr[51][0][S_AXIS_BRAM_51_ADDR_WIDTH-1:0] = ap_bram_51_addr0;
            assign bram_din[51][0][S_AXIS_BRAM_51_WIDTH-1:0] = ap_bram_51_din0;
            assign ap_bram_51_dout0 = bram_dout[51][0][S_AXIS_BRAM_51_WIDTH-1:0];
            assign bram_we[51][0][S_AXIS_BRAM_51_WIDTH/8-1:0] = ap_bram_51_we0;
            assign bram_en[51][0] = ap_bram_51_en0;
            assign bram_addr[51][1][S_AXIS_BRAM_51_ADDR_WIDTH-1:0] = ap_bram_51_addr1;
            assign bram_din[51][1][S_AXIS_BRAM_51_WIDTH-1:0] = ap_bram_51_din1;
            assign ap_bram_51_dout1 = bram_dout[51][1][S_AXIS_BRAM_51_WIDTH-1:0];
            assign bram_we[51][1][S_AXIS_BRAM_51_WIDTH/8-1:0] = ap_bram_51_we1;
            assign bram_en[51][1] = ap_bram_51_en1;
            
            assign out_clk[51] = m_axis_bramio_51_aclk;
            assign out_rst[51] = m_axis_bramio_51_aresetn;
            assign dwconv1_tready[51] = m_axis_bramio_51_tready;
            assign m_axis_bramio_51_tlast = dwconv1_tlast[51];
            assign m_axis_bramio_51_tvalid = dwconv1_tvalid[51];
            assign m_axis_bramio_51_tkeep = dwconv1_tkeep[51][M_AXIS_BRAMIO_51_DMWIDTH/8-1:0];
            assign m_axis_bramio_51_tstrb = dwconv1_tstrb[51][M_AXIS_BRAMIO_51_DMWIDTH/8-1:0];
            assign m_axis_bramio_51_tdata = dwconv1_tdata[51][M_AXIS_BRAMIO_51_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 52) begin
            assign in_clk[52] = s_axis_bram_52_aclk;
            assign in_rst[52] = s_axis_bram_52_aresetn;
            assign tlast[52] = s_axis_bram_52_tlast;
            assign tvalid[52] = s_axis_bram_52_tvalid;
            assign tkeep[52][S_AXIS_BRAM_52_DMWIDTH/8-1:0] = s_axis_bram_52_tkeep;
            assign tstrb[52][S_AXIS_BRAM_52_DMWIDTH/8-1:0] = s_axis_bram_52_tstrb;
            assign tdata[52][S_AXIS_BRAM_52_DMWIDTH-1:0] = s_axis_bram_52_tdata;
            assign s_axis_bram_52_tready = tready[52];
            
            assign bram_addr[52][0][S_AXIS_BRAM_52_ADDR_WIDTH-1:0] = ap_bram_52_addr0;
            assign bram_din[52][0][S_AXIS_BRAM_52_WIDTH-1:0] = ap_bram_52_din0;
            assign ap_bram_52_dout0 = bram_dout[52][0][S_AXIS_BRAM_52_WIDTH-1:0];
            assign bram_we[52][0][S_AXIS_BRAM_52_WIDTH/8-1:0] = ap_bram_52_we0;
            assign bram_en[52][0] = ap_bram_52_en0;
            assign bram_addr[52][1][S_AXIS_BRAM_52_ADDR_WIDTH-1:0] = ap_bram_52_addr1;
            assign bram_din[52][1][S_AXIS_BRAM_52_WIDTH-1:0] = ap_bram_52_din1;
            assign ap_bram_52_dout1 = bram_dout[52][1][S_AXIS_BRAM_52_WIDTH-1:0];
            assign bram_we[52][1][S_AXIS_BRAM_52_WIDTH/8-1:0] = ap_bram_52_we1;
            assign bram_en[52][1] = ap_bram_52_en1;
            
            assign out_clk[52] = m_axis_bramio_52_aclk;
            assign out_rst[52] = m_axis_bramio_52_aresetn;
            assign dwconv1_tready[52] = m_axis_bramio_52_tready;
            assign m_axis_bramio_52_tlast = dwconv1_tlast[52];
            assign m_axis_bramio_52_tvalid = dwconv1_tvalid[52];
            assign m_axis_bramio_52_tkeep = dwconv1_tkeep[52][M_AXIS_BRAMIO_52_DMWIDTH/8-1:0];
            assign m_axis_bramio_52_tstrb = dwconv1_tstrb[52][M_AXIS_BRAMIO_52_DMWIDTH/8-1:0];
            assign m_axis_bramio_52_tdata = dwconv1_tdata[52][M_AXIS_BRAMIO_52_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 53) begin
            assign in_clk[53] = s_axis_bram_53_aclk;
            assign in_rst[53] = s_axis_bram_53_aresetn;
            assign tlast[53] = s_axis_bram_53_tlast;
            assign tvalid[53] = s_axis_bram_53_tvalid;
            assign tkeep[53][S_AXIS_BRAM_53_DMWIDTH/8-1:0] = s_axis_bram_53_tkeep;
            assign tstrb[53][S_AXIS_BRAM_53_DMWIDTH/8-1:0] = s_axis_bram_53_tstrb;
            assign tdata[53][S_AXIS_BRAM_53_DMWIDTH-1:0] = s_axis_bram_53_tdata;
            assign s_axis_bram_53_tready = tready[53];
            
            assign bram_addr[53][0][S_AXIS_BRAM_53_ADDR_WIDTH-1:0] = ap_bram_53_addr0;
            assign bram_din[53][0][S_AXIS_BRAM_53_WIDTH-1:0] = ap_bram_53_din0;
            assign ap_bram_53_dout0 = bram_dout[53][0][S_AXIS_BRAM_53_WIDTH-1:0];
            assign bram_we[53][0][S_AXIS_BRAM_53_WIDTH/8-1:0] = ap_bram_53_we0;
            assign bram_en[53][0] = ap_bram_53_en0;
            assign bram_addr[53][1][S_AXIS_BRAM_53_ADDR_WIDTH-1:0] = ap_bram_53_addr1;
            assign bram_din[53][1][S_AXIS_BRAM_53_WIDTH-1:0] = ap_bram_53_din1;
            assign ap_bram_53_dout1 = bram_dout[53][1][S_AXIS_BRAM_53_WIDTH-1:0];
            assign bram_we[53][1][S_AXIS_BRAM_53_WIDTH/8-1:0] = ap_bram_53_we1;
            assign bram_en[53][1] = ap_bram_53_en1;
            
            assign out_clk[53] = m_axis_bramio_53_aclk;
            assign out_rst[53] = m_axis_bramio_53_aresetn;
            assign dwconv1_tready[53] = m_axis_bramio_53_tready;
            assign m_axis_bramio_53_tlast = dwconv1_tlast[53];
            assign m_axis_bramio_53_tvalid = dwconv1_tvalid[53];
            assign m_axis_bramio_53_tkeep = dwconv1_tkeep[53][M_AXIS_BRAMIO_53_DMWIDTH/8-1:0];
            assign m_axis_bramio_53_tstrb = dwconv1_tstrb[53][M_AXIS_BRAMIO_53_DMWIDTH/8-1:0];
            assign m_axis_bramio_53_tdata = dwconv1_tdata[53][M_AXIS_BRAMIO_53_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 54) begin
            assign in_clk[54] = s_axis_bram_54_aclk;
            assign in_rst[54] = s_axis_bram_54_aresetn;
            assign tlast[54] = s_axis_bram_54_tlast;
            assign tvalid[54] = s_axis_bram_54_tvalid;
            assign tkeep[54][S_AXIS_BRAM_54_DMWIDTH/8-1:0] = s_axis_bram_54_tkeep;
            assign tstrb[54][S_AXIS_BRAM_54_DMWIDTH/8-1:0] = s_axis_bram_54_tstrb;
            assign tdata[54][S_AXIS_BRAM_54_DMWIDTH-1:0] = s_axis_bram_54_tdata;
            assign s_axis_bram_54_tready = tready[54];
            
            assign bram_addr[54][0][S_AXIS_BRAM_54_ADDR_WIDTH-1:0] = ap_bram_54_addr0;
            assign bram_din[54][0][S_AXIS_BRAM_54_WIDTH-1:0] = ap_bram_54_din0;
            assign ap_bram_54_dout0 = bram_dout[54][0][S_AXIS_BRAM_54_WIDTH-1:0];
            assign bram_we[54][0][S_AXIS_BRAM_54_WIDTH/8-1:0] = ap_bram_54_we0;
            assign bram_en[54][0] = ap_bram_54_en0;
            assign bram_addr[54][1][S_AXIS_BRAM_54_ADDR_WIDTH-1:0] = ap_bram_54_addr1;
            assign bram_din[54][1][S_AXIS_BRAM_54_WIDTH-1:0] = ap_bram_54_din1;
            assign ap_bram_54_dout1 = bram_dout[54][1][S_AXIS_BRAM_54_WIDTH-1:0];
            assign bram_we[54][1][S_AXIS_BRAM_54_WIDTH/8-1:0] = ap_bram_54_we1;
            assign bram_en[54][1] = ap_bram_54_en1;
            
            assign out_clk[54] = m_axis_bramio_54_aclk;
            assign out_rst[54] = m_axis_bramio_54_aresetn;
            assign dwconv1_tready[54] = m_axis_bramio_54_tready;
            assign m_axis_bramio_54_tlast = dwconv1_tlast[54];
            assign m_axis_bramio_54_tvalid = dwconv1_tvalid[54];
            assign m_axis_bramio_54_tkeep = dwconv1_tkeep[54][M_AXIS_BRAMIO_54_DMWIDTH/8-1:0];
            assign m_axis_bramio_54_tstrb = dwconv1_tstrb[54][M_AXIS_BRAMIO_54_DMWIDTH/8-1:0];
            assign m_axis_bramio_54_tdata = dwconv1_tdata[54][M_AXIS_BRAMIO_54_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 55) begin
            assign in_clk[55] = s_axis_bram_55_aclk;
            assign in_rst[55] = s_axis_bram_55_aresetn;
            assign tlast[55] = s_axis_bram_55_tlast;
            assign tvalid[55] = s_axis_bram_55_tvalid;
            assign tkeep[55][S_AXIS_BRAM_55_DMWIDTH/8-1:0] = s_axis_bram_55_tkeep;
            assign tstrb[55][S_AXIS_BRAM_55_DMWIDTH/8-1:0] = s_axis_bram_55_tstrb;
            assign tdata[55][S_AXIS_BRAM_55_DMWIDTH-1:0] = s_axis_bram_55_tdata;
            assign s_axis_bram_55_tready = tready[55];
            
            assign bram_addr[55][0][S_AXIS_BRAM_55_ADDR_WIDTH-1:0] = ap_bram_55_addr0;
            assign bram_din[55][0][S_AXIS_BRAM_55_WIDTH-1:0] = ap_bram_55_din0;
            assign ap_bram_55_dout0 = bram_dout[55][0][S_AXIS_BRAM_55_WIDTH-1:0];
            assign bram_we[55][0][S_AXIS_BRAM_55_WIDTH/8-1:0] = ap_bram_55_we0;
            assign bram_en[55][0] = ap_bram_55_en0;
            assign bram_addr[55][1][S_AXIS_BRAM_55_ADDR_WIDTH-1:0] = ap_bram_55_addr1;
            assign bram_din[55][1][S_AXIS_BRAM_55_WIDTH-1:0] = ap_bram_55_din1;
            assign ap_bram_55_dout1 = bram_dout[55][1][S_AXIS_BRAM_55_WIDTH-1:0];
            assign bram_we[55][1][S_AXIS_BRAM_55_WIDTH/8-1:0] = ap_bram_55_we1;
            assign bram_en[55][1] = ap_bram_55_en1;
            
            assign out_clk[55] = m_axis_bramio_55_aclk;
            assign out_rst[55] = m_axis_bramio_55_aresetn;
            assign dwconv1_tready[55] = m_axis_bramio_55_tready;
            assign m_axis_bramio_55_tlast = dwconv1_tlast[55];
            assign m_axis_bramio_55_tvalid = dwconv1_tvalid[55];
            assign m_axis_bramio_55_tkeep = dwconv1_tkeep[55][M_AXIS_BRAMIO_55_DMWIDTH/8-1:0];
            assign m_axis_bramio_55_tstrb = dwconv1_tstrb[55][M_AXIS_BRAMIO_55_DMWIDTH/8-1:0];
            assign m_axis_bramio_55_tdata = dwconv1_tdata[55][M_AXIS_BRAMIO_55_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 56) begin
            assign in_clk[56] = s_axis_bram_56_aclk;
            assign in_rst[56] = s_axis_bram_56_aresetn;
            assign tlast[56] = s_axis_bram_56_tlast;
            assign tvalid[56] = s_axis_bram_56_tvalid;
            assign tkeep[56][S_AXIS_BRAM_56_DMWIDTH/8-1:0] = s_axis_bram_56_tkeep;
            assign tstrb[56][S_AXIS_BRAM_56_DMWIDTH/8-1:0] = s_axis_bram_56_tstrb;
            assign tdata[56][S_AXIS_BRAM_56_DMWIDTH-1:0] = s_axis_bram_56_tdata;
            assign s_axis_bram_56_tready = tready[56];
            
            assign bram_addr[56][0][S_AXIS_BRAM_56_ADDR_WIDTH-1:0] = ap_bram_56_addr0;
            assign bram_din[56][0][S_AXIS_BRAM_56_WIDTH-1:0] = ap_bram_56_din0;
            assign ap_bram_56_dout0 = bram_dout[56][0][S_AXIS_BRAM_56_WIDTH-1:0];
            assign bram_we[56][0][S_AXIS_BRAM_56_WIDTH/8-1:0] = ap_bram_56_we0;
            assign bram_en[56][0] = ap_bram_56_en0;
            assign bram_addr[56][1][S_AXIS_BRAM_56_ADDR_WIDTH-1:0] = ap_bram_56_addr1;
            assign bram_din[56][1][S_AXIS_BRAM_56_WIDTH-1:0] = ap_bram_56_din1;
            assign ap_bram_56_dout1 = bram_dout[56][1][S_AXIS_BRAM_56_WIDTH-1:0];
            assign bram_we[56][1][S_AXIS_BRAM_56_WIDTH/8-1:0] = ap_bram_56_we1;
            assign bram_en[56][1] = ap_bram_56_en1;
            
            assign out_clk[56] = m_axis_bramio_56_aclk;
            assign out_rst[56] = m_axis_bramio_56_aresetn;
            assign dwconv1_tready[56] = m_axis_bramio_56_tready;
            assign m_axis_bramio_56_tlast = dwconv1_tlast[56];
            assign m_axis_bramio_56_tvalid = dwconv1_tvalid[56];
            assign m_axis_bramio_56_tkeep = dwconv1_tkeep[56][M_AXIS_BRAMIO_56_DMWIDTH/8-1:0];
            assign m_axis_bramio_56_tstrb = dwconv1_tstrb[56][M_AXIS_BRAMIO_56_DMWIDTH/8-1:0];
            assign m_axis_bramio_56_tdata = dwconv1_tdata[56][M_AXIS_BRAMIO_56_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 57) begin
            assign in_clk[57] = s_axis_bram_57_aclk;
            assign in_rst[57] = s_axis_bram_57_aresetn;
            assign tlast[57] = s_axis_bram_57_tlast;
            assign tvalid[57] = s_axis_bram_57_tvalid;
            assign tkeep[57][S_AXIS_BRAM_57_DMWIDTH/8-1:0] = s_axis_bram_57_tkeep;
            assign tstrb[57][S_AXIS_BRAM_57_DMWIDTH/8-1:0] = s_axis_bram_57_tstrb;
            assign tdata[57][S_AXIS_BRAM_57_DMWIDTH-1:0] = s_axis_bram_57_tdata;
            assign s_axis_bram_57_tready = tready[57];
            
            assign bram_addr[57][0][S_AXIS_BRAM_57_ADDR_WIDTH-1:0] = ap_bram_57_addr0;
            assign bram_din[57][0][S_AXIS_BRAM_57_WIDTH-1:0] = ap_bram_57_din0;
            assign ap_bram_57_dout0 = bram_dout[57][0][S_AXIS_BRAM_57_WIDTH-1:0];
            assign bram_we[57][0][S_AXIS_BRAM_57_WIDTH/8-1:0] = ap_bram_57_we0;
            assign bram_en[57][0] = ap_bram_57_en0;
            assign bram_addr[57][1][S_AXIS_BRAM_57_ADDR_WIDTH-1:0] = ap_bram_57_addr1;
            assign bram_din[57][1][S_AXIS_BRAM_57_WIDTH-1:0] = ap_bram_57_din1;
            assign ap_bram_57_dout1 = bram_dout[57][1][S_AXIS_BRAM_57_WIDTH-1:0];
            assign bram_we[57][1][S_AXIS_BRAM_57_WIDTH/8-1:0] = ap_bram_57_we1;
            assign bram_en[57][1] = ap_bram_57_en1;
            
            assign out_clk[57] = m_axis_bramio_57_aclk;
            assign out_rst[57] = m_axis_bramio_57_aresetn;
            assign dwconv1_tready[57] = m_axis_bramio_57_tready;
            assign m_axis_bramio_57_tlast = dwconv1_tlast[57];
            assign m_axis_bramio_57_tvalid = dwconv1_tvalid[57];
            assign m_axis_bramio_57_tkeep = dwconv1_tkeep[57][M_AXIS_BRAMIO_57_DMWIDTH/8-1:0];
            assign m_axis_bramio_57_tstrb = dwconv1_tstrb[57][M_AXIS_BRAMIO_57_DMWIDTH/8-1:0];
            assign m_axis_bramio_57_tdata = dwconv1_tdata[57][M_AXIS_BRAMIO_57_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 58) begin
            assign in_clk[58] = s_axis_bram_58_aclk;
            assign in_rst[58] = s_axis_bram_58_aresetn;
            assign tlast[58] = s_axis_bram_58_tlast;
            assign tvalid[58] = s_axis_bram_58_tvalid;
            assign tkeep[58][S_AXIS_BRAM_58_DMWIDTH/8-1:0] = s_axis_bram_58_tkeep;
            assign tstrb[58][S_AXIS_BRAM_58_DMWIDTH/8-1:0] = s_axis_bram_58_tstrb;
            assign tdata[58][S_AXIS_BRAM_58_DMWIDTH-1:0] = s_axis_bram_58_tdata;
            assign s_axis_bram_58_tready = tready[58];
            
            assign bram_addr[58][0][S_AXIS_BRAM_58_ADDR_WIDTH-1:0] = ap_bram_58_addr0;
            assign bram_din[58][0][S_AXIS_BRAM_58_WIDTH-1:0] = ap_bram_58_din0;
            assign ap_bram_58_dout0 = bram_dout[58][0][S_AXIS_BRAM_58_WIDTH-1:0];
            assign bram_we[58][0][S_AXIS_BRAM_58_WIDTH/8-1:0] = ap_bram_58_we0;
            assign bram_en[58][0] = ap_bram_58_en0;
            assign bram_addr[58][1][S_AXIS_BRAM_58_ADDR_WIDTH-1:0] = ap_bram_58_addr1;
            assign bram_din[58][1][S_AXIS_BRAM_58_WIDTH-1:0] = ap_bram_58_din1;
            assign ap_bram_58_dout1 = bram_dout[58][1][S_AXIS_BRAM_58_WIDTH-1:0];
            assign bram_we[58][1][S_AXIS_BRAM_58_WIDTH/8-1:0] = ap_bram_58_we1;
            assign bram_en[58][1] = ap_bram_58_en1;
            
            assign out_clk[58] = m_axis_bramio_58_aclk;
            assign out_rst[58] = m_axis_bramio_58_aresetn;
            assign dwconv1_tready[58] = m_axis_bramio_58_tready;
            assign m_axis_bramio_58_tlast = dwconv1_tlast[58];
            assign m_axis_bramio_58_tvalid = dwconv1_tvalid[58];
            assign m_axis_bramio_58_tkeep = dwconv1_tkeep[58][M_AXIS_BRAMIO_58_DMWIDTH/8-1:0];
            assign m_axis_bramio_58_tstrb = dwconv1_tstrb[58][M_AXIS_BRAMIO_58_DMWIDTH/8-1:0];
            assign m_axis_bramio_58_tdata = dwconv1_tdata[58][M_AXIS_BRAMIO_58_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 59) begin
            assign in_clk[59] = s_axis_bram_59_aclk;
            assign in_rst[59] = s_axis_bram_59_aresetn;
            assign tlast[59] = s_axis_bram_59_tlast;
            assign tvalid[59] = s_axis_bram_59_tvalid;
            assign tkeep[59][S_AXIS_BRAM_59_DMWIDTH/8-1:0] = s_axis_bram_59_tkeep;
            assign tstrb[59][S_AXIS_BRAM_59_DMWIDTH/8-1:0] = s_axis_bram_59_tstrb;
            assign tdata[59][S_AXIS_BRAM_59_DMWIDTH-1:0] = s_axis_bram_59_tdata;
            assign s_axis_bram_59_tready = tready[59];
            
            assign bram_addr[59][0][S_AXIS_BRAM_59_ADDR_WIDTH-1:0] = ap_bram_59_addr0;
            assign bram_din[59][0][S_AXIS_BRAM_59_WIDTH-1:0] = ap_bram_59_din0;
            assign ap_bram_59_dout0 = bram_dout[59][0][S_AXIS_BRAM_59_WIDTH-1:0];
            assign bram_we[59][0][S_AXIS_BRAM_59_WIDTH/8-1:0] = ap_bram_59_we0;
            assign bram_en[59][0] = ap_bram_59_en0;
            assign bram_addr[59][1][S_AXIS_BRAM_59_ADDR_WIDTH-1:0] = ap_bram_59_addr1;
            assign bram_din[59][1][S_AXIS_BRAM_59_WIDTH-1:0] = ap_bram_59_din1;
            assign ap_bram_59_dout1 = bram_dout[59][1][S_AXIS_BRAM_59_WIDTH-1:0];
            assign bram_we[59][1][S_AXIS_BRAM_59_WIDTH/8-1:0] = ap_bram_59_we1;
            assign bram_en[59][1] = ap_bram_59_en1;
            
            assign out_clk[59] = m_axis_bramio_59_aclk;
            assign out_rst[59] = m_axis_bramio_59_aresetn;
            assign dwconv1_tready[59] = m_axis_bramio_59_tready;
            assign m_axis_bramio_59_tlast = dwconv1_tlast[59];
            assign m_axis_bramio_59_tvalid = dwconv1_tvalid[59];
            assign m_axis_bramio_59_tkeep = dwconv1_tkeep[59][M_AXIS_BRAMIO_59_DMWIDTH/8-1:0];
            assign m_axis_bramio_59_tstrb = dwconv1_tstrb[59][M_AXIS_BRAMIO_59_DMWIDTH/8-1:0];
            assign m_axis_bramio_59_tdata = dwconv1_tdata[59][M_AXIS_BRAMIO_59_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 60) begin
            assign in_clk[60] = s_axis_bram_60_aclk;
            assign in_rst[60] = s_axis_bram_60_aresetn;
            assign tlast[60] = s_axis_bram_60_tlast;
            assign tvalid[60] = s_axis_bram_60_tvalid;
            assign tkeep[60][S_AXIS_BRAM_60_DMWIDTH/8-1:0] = s_axis_bram_60_tkeep;
            assign tstrb[60][S_AXIS_BRAM_60_DMWIDTH/8-1:0] = s_axis_bram_60_tstrb;
            assign tdata[60][S_AXIS_BRAM_60_DMWIDTH-1:0] = s_axis_bram_60_tdata;
            assign s_axis_bram_60_tready = tready[60];
            
            assign bram_addr[60][0][S_AXIS_BRAM_60_ADDR_WIDTH-1:0] = ap_bram_60_addr0;
            assign bram_din[60][0][S_AXIS_BRAM_60_WIDTH-1:0] = ap_bram_60_din0;
            assign ap_bram_60_dout0 = bram_dout[60][0][S_AXIS_BRAM_60_WIDTH-1:0];
            assign bram_we[60][0][S_AXIS_BRAM_60_WIDTH/8-1:0] = ap_bram_60_we0;
            assign bram_en[60][0] = ap_bram_60_en0;
            assign bram_addr[60][1][S_AXIS_BRAM_60_ADDR_WIDTH-1:0] = ap_bram_60_addr1;
            assign bram_din[60][1][S_AXIS_BRAM_60_WIDTH-1:0] = ap_bram_60_din1;
            assign ap_bram_60_dout1 = bram_dout[60][1][S_AXIS_BRAM_60_WIDTH-1:0];
            assign bram_we[60][1][S_AXIS_BRAM_60_WIDTH/8-1:0] = ap_bram_60_we1;
            assign bram_en[60][1] = ap_bram_60_en1;
            
            assign out_clk[60] = m_axis_bramio_60_aclk;
            assign out_rst[60] = m_axis_bramio_60_aresetn;
            assign dwconv1_tready[60] = m_axis_bramio_60_tready;
            assign m_axis_bramio_60_tlast = dwconv1_tlast[60];
            assign m_axis_bramio_60_tvalid = dwconv1_tvalid[60];
            assign m_axis_bramio_60_tkeep = dwconv1_tkeep[60][M_AXIS_BRAMIO_60_DMWIDTH/8-1:0];
            assign m_axis_bramio_60_tstrb = dwconv1_tstrb[60][M_AXIS_BRAMIO_60_DMWIDTH/8-1:0];
            assign m_axis_bramio_60_tdata = dwconv1_tdata[60][M_AXIS_BRAMIO_60_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 61) begin
            assign in_clk[61] = s_axis_bram_61_aclk;
            assign in_rst[61] = s_axis_bram_61_aresetn;
            assign tlast[61] = s_axis_bram_61_tlast;
            assign tvalid[61] = s_axis_bram_61_tvalid;
            assign tkeep[61][S_AXIS_BRAM_61_DMWIDTH/8-1:0] = s_axis_bram_61_tkeep;
            assign tstrb[61][S_AXIS_BRAM_61_DMWIDTH/8-1:0] = s_axis_bram_61_tstrb;
            assign tdata[61][S_AXIS_BRAM_61_DMWIDTH-1:0] = s_axis_bram_61_tdata;
            assign s_axis_bram_61_tready = tready[61];
            
            assign bram_addr[61][0][S_AXIS_BRAM_61_ADDR_WIDTH-1:0] = ap_bram_61_addr0;
            assign bram_din[61][0][S_AXIS_BRAM_61_WIDTH-1:0] = ap_bram_61_din0;
            assign ap_bram_61_dout0 = bram_dout[61][0][S_AXIS_BRAM_61_WIDTH-1:0];
            assign bram_we[61][0][S_AXIS_BRAM_61_WIDTH/8-1:0] = ap_bram_61_we0;
            assign bram_en[61][0] = ap_bram_61_en0;
            assign bram_addr[61][1][S_AXIS_BRAM_61_ADDR_WIDTH-1:0] = ap_bram_61_addr1;
            assign bram_din[61][1][S_AXIS_BRAM_61_WIDTH-1:0] = ap_bram_61_din1;
            assign ap_bram_61_dout1 = bram_dout[61][1][S_AXIS_BRAM_61_WIDTH-1:0];
            assign bram_we[61][1][S_AXIS_BRAM_61_WIDTH/8-1:0] = ap_bram_61_we1;
            assign bram_en[61][1] = ap_bram_61_en1;
            
            assign out_clk[61] = m_axis_bramio_61_aclk;
            assign out_rst[61] = m_axis_bramio_61_aresetn;
            assign dwconv1_tready[61] = m_axis_bramio_61_tready;
            assign m_axis_bramio_61_tlast = dwconv1_tlast[61];
            assign m_axis_bramio_61_tvalid = dwconv1_tvalid[61];
            assign m_axis_bramio_61_tkeep = dwconv1_tkeep[61][M_AXIS_BRAMIO_61_DMWIDTH/8-1:0];
            assign m_axis_bramio_61_tstrb = dwconv1_tstrb[61][M_AXIS_BRAMIO_61_DMWIDTH/8-1:0];
            assign m_axis_bramio_61_tdata = dwconv1_tdata[61][M_AXIS_BRAMIO_61_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 62) begin
            assign in_clk[62] = s_axis_bram_62_aclk;
            assign in_rst[62] = s_axis_bram_62_aresetn;
            assign tlast[62] = s_axis_bram_62_tlast;
            assign tvalid[62] = s_axis_bram_62_tvalid;
            assign tkeep[62][S_AXIS_BRAM_62_DMWIDTH/8-1:0] = s_axis_bram_62_tkeep;
            assign tstrb[62][S_AXIS_BRAM_62_DMWIDTH/8-1:0] = s_axis_bram_62_tstrb;
            assign tdata[62][S_AXIS_BRAM_62_DMWIDTH-1:0] = s_axis_bram_62_tdata;
            assign s_axis_bram_62_tready = tready[62];
            
            assign bram_addr[62][0][S_AXIS_BRAM_62_ADDR_WIDTH-1:0] = ap_bram_62_addr0;
            assign bram_din[62][0][S_AXIS_BRAM_62_WIDTH-1:0] = ap_bram_62_din0;
            assign ap_bram_62_dout0 = bram_dout[62][0][S_AXIS_BRAM_62_WIDTH-1:0];
            assign bram_we[62][0][S_AXIS_BRAM_62_WIDTH/8-1:0] = ap_bram_62_we0;
            assign bram_en[62][0] = ap_bram_62_en0;
            assign bram_addr[62][1][S_AXIS_BRAM_62_ADDR_WIDTH-1:0] = ap_bram_62_addr1;
            assign bram_din[62][1][S_AXIS_BRAM_62_WIDTH-1:0] = ap_bram_62_din1;
            assign ap_bram_62_dout1 = bram_dout[62][1][S_AXIS_BRAM_62_WIDTH-1:0];
            assign bram_we[62][1][S_AXIS_BRAM_62_WIDTH/8-1:0] = ap_bram_62_we1;
            assign bram_en[62][1] = ap_bram_62_en1;
            
            assign out_clk[62] = m_axis_bramio_62_aclk;
            assign out_rst[62] = m_axis_bramio_62_aresetn;
            assign dwconv1_tready[62] = m_axis_bramio_62_tready;
            assign m_axis_bramio_62_tlast = dwconv1_tlast[62];
            assign m_axis_bramio_62_tvalid = dwconv1_tvalid[62];
            assign m_axis_bramio_62_tkeep = dwconv1_tkeep[62][M_AXIS_BRAMIO_62_DMWIDTH/8-1:0];
            assign m_axis_bramio_62_tstrb = dwconv1_tstrb[62][M_AXIS_BRAMIO_62_DMWIDTH/8-1:0];
            assign m_axis_bramio_62_tdata = dwconv1_tdata[62][M_AXIS_BRAMIO_62_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 63) begin
            assign in_clk[63] = s_axis_bram_63_aclk;
            assign in_rst[63] = s_axis_bram_63_aresetn;
            assign tlast[63] = s_axis_bram_63_tlast;
            assign tvalid[63] = s_axis_bram_63_tvalid;
            assign tkeep[63][S_AXIS_BRAM_63_DMWIDTH/8-1:0] = s_axis_bram_63_tkeep;
            assign tstrb[63][S_AXIS_BRAM_63_DMWIDTH/8-1:0] = s_axis_bram_63_tstrb;
            assign tdata[63][S_AXIS_BRAM_63_DMWIDTH-1:0] = s_axis_bram_63_tdata;
            assign s_axis_bram_63_tready = tready[63];
            
            assign bram_addr[63][0][S_AXIS_BRAM_63_ADDR_WIDTH-1:0] = ap_bram_63_addr0;
            assign bram_din[63][0][S_AXIS_BRAM_63_WIDTH-1:0] = ap_bram_63_din0;
            assign ap_bram_63_dout0 = bram_dout[63][0][S_AXIS_BRAM_63_WIDTH-1:0];
            assign bram_we[63][0][S_AXIS_BRAM_63_WIDTH/8-1:0] = ap_bram_63_we0;
            assign bram_en[63][0] = ap_bram_63_en0;
            assign bram_addr[63][1][S_AXIS_BRAM_63_ADDR_WIDTH-1:0] = ap_bram_63_addr1;
            assign bram_din[63][1][S_AXIS_BRAM_63_WIDTH-1:0] = ap_bram_63_din1;
            assign ap_bram_63_dout1 = bram_dout[63][1][S_AXIS_BRAM_63_WIDTH-1:0];
            assign bram_we[63][1][S_AXIS_BRAM_63_WIDTH/8-1:0] = ap_bram_63_we1;
            assign bram_en[63][1] = ap_bram_63_en1;
            
            assign out_clk[63] = m_axis_bramio_63_aclk;
            assign out_rst[63] = m_axis_bramio_63_aresetn;
            assign dwconv1_tready[63] = m_axis_bramio_63_tready;
            assign m_axis_bramio_63_tlast = dwconv1_tlast[63];
            assign m_axis_bramio_63_tvalid = dwconv1_tvalid[63];
            assign m_axis_bramio_63_tkeep = dwconv1_tkeep[63][M_AXIS_BRAMIO_63_DMWIDTH/8-1:0];
            assign m_axis_bramio_63_tstrb = dwconv1_tstrb[63][M_AXIS_BRAMIO_63_DMWIDTH/8-1:0];
            assign m_axis_bramio_63_tdata = dwconv1_tdata[63][M_AXIS_BRAMIO_63_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 64) begin
            assign in_clk[64] = s_axis_bram_64_aclk;
            assign in_rst[64] = s_axis_bram_64_aresetn;
            assign tlast[64] = s_axis_bram_64_tlast;
            assign tvalid[64] = s_axis_bram_64_tvalid;
            assign tkeep[64][S_AXIS_BRAM_64_DMWIDTH/8-1:0] = s_axis_bram_64_tkeep;
            assign tstrb[64][S_AXIS_BRAM_64_DMWIDTH/8-1:0] = s_axis_bram_64_tstrb;
            assign tdata[64][S_AXIS_BRAM_64_DMWIDTH-1:0] = s_axis_bram_64_tdata;
            assign s_axis_bram_64_tready = tready[64];
            
            assign bram_addr[64][0][S_AXIS_BRAM_64_ADDR_WIDTH-1:0] = ap_bram_64_addr0;
            assign bram_din[64][0][S_AXIS_BRAM_64_WIDTH-1:0] = ap_bram_64_din0;
            assign ap_bram_64_dout0 = bram_dout[64][0][S_AXIS_BRAM_64_WIDTH-1:0];
            assign bram_we[64][0][S_AXIS_BRAM_64_WIDTH/8-1:0] = ap_bram_64_we0;
            assign bram_en[64][0] = ap_bram_64_en0;
            assign bram_addr[64][1][S_AXIS_BRAM_64_ADDR_WIDTH-1:0] = ap_bram_64_addr1;
            assign bram_din[64][1][S_AXIS_BRAM_64_WIDTH-1:0] = ap_bram_64_din1;
            assign ap_bram_64_dout1 = bram_dout[64][1][S_AXIS_BRAM_64_WIDTH-1:0];
            assign bram_we[64][1][S_AXIS_BRAM_64_WIDTH/8-1:0] = ap_bram_64_we1;
            assign bram_en[64][1] = ap_bram_64_en1;
            
            assign out_clk[64] = m_axis_bramio_64_aclk;
            assign out_rst[64] = m_axis_bramio_64_aresetn;
            assign dwconv1_tready[64] = m_axis_bramio_64_tready;
            assign m_axis_bramio_64_tlast = dwconv1_tlast[64];
            assign m_axis_bramio_64_tvalid = dwconv1_tvalid[64];
            assign m_axis_bramio_64_tkeep = dwconv1_tkeep[64][M_AXIS_BRAMIO_64_DMWIDTH/8-1:0];
            assign m_axis_bramio_64_tstrb = dwconv1_tstrb[64][M_AXIS_BRAMIO_64_DMWIDTH/8-1:0];
            assign m_axis_bramio_64_tdata = dwconv1_tdata[64][M_AXIS_BRAMIO_64_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 65) begin
            assign in_clk[65] = s_axis_bram_65_aclk;
            assign in_rst[65] = s_axis_bram_65_aresetn;
            assign tlast[65] = s_axis_bram_65_tlast;
            assign tvalid[65] = s_axis_bram_65_tvalid;
            assign tkeep[65][S_AXIS_BRAM_65_DMWIDTH/8-1:0] = s_axis_bram_65_tkeep;
            assign tstrb[65][S_AXIS_BRAM_65_DMWIDTH/8-1:0] = s_axis_bram_65_tstrb;
            assign tdata[65][S_AXIS_BRAM_65_DMWIDTH-1:0] = s_axis_bram_65_tdata;
            assign s_axis_bram_65_tready = tready[65];
            
            assign bram_addr[65][0][S_AXIS_BRAM_65_ADDR_WIDTH-1:0] = ap_bram_65_addr0;
            assign bram_din[65][0][S_AXIS_BRAM_65_WIDTH-1:0] = ap_bram_65_din0;
            assign ap_bram_65_dout0 = bram_dout[65][0][S_AXIS_BRAM_65_WIDTH-1:0];
            assign bram_we[65][0][S_AXIS_BRAM_65_WIDTH/8-1:0] = ap_bram_65_we0;
            assign bram_en[65][0] = ap_bram_65_en0;
            assign bram_addr[65][1][S_AXIS_BRAM_65_ADDR_WIDTH-1:0] = ap_bram_65_addr1;
            assign bram_din[65][1][S_AXIS_BRAM_65_WIDTH-1:0] = ap_bram_65_din1;
            assign ap_bram_65_dout1 = bram_dout[65][1][S_AXIS_BRAM_65_WIDTH-1:0];
            assign bram_we[65][1][S_AXIS_BRAM_65_WIDTH/8-1:0] = ap_bram_65_we1;
            assign bram_en[65][1] = ap_bram_65_en1;
            
            assign out_clk[65] = m_axis_bramio_65_aclk;
            assign out_rst[65] = m_axis_bramio_65_aresetn;
            assign dwconv1_tready[65] = m_axis_bramio_65_tready;
            assign m_axis_bramio_65_tlast = dwconv1_tlast[65];
            assign m_axis_bramio_65_tvalid = dwconv1_tvalid[65];
            assign m_axis_bramio_65_tkeep = dwconv1_tkeep[65][M_AXIS_BRAMIO_65_DMWIDTH/8-1:0];
            assign m_axis_bramio_65_tstrb = dwconv1_tstrb[65][M_AXIS_BRAMIO_65_DMWIDTH/8-1:0];
            assign m_axis_bramio_65_tdata = dwconv1_tdata[65][M_AXIS_BRAMIO_65_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 66) begin
            assign in_clk[66] = s_axis_bram_66_aclk;
            assign in_rst[66] = s_axis_bram_66_aresetn;
            assign tlast[66] = s_axis_bram_66_tlast;
            assign tvalid[66] = s_axis_bram_66_tvalid;
            assign tkeep[66][S_AXIS_BRAM_66_DMWIDTH/8-1:0] = s_axis_bram_66_tkeep;
            assign tstrb[66][S_AXIS_BRAM_66_DMWIDTH/8-1:0] = s_axis_bram_66_tstrb;
            assign tdata[66][S_AXIS_BRAM_66_DMWIDTH-1:0] = s_axis_bram_66_tdata;
            assign s_axis_bram_66_tready = tready[66];
            
            assign bram_addr[66][0][S_AXIS_BRAM_66_ADDR_WIDTH-1:0] = ap_bram_66_addr0;
            assign bram_din[66][0][S_AXIS_BRAM_66_WIDTH-1:0] = ap_bram_66_din0;
            assign ap_bram_66_dout0 = bram_dout[66][0][S_AXIS_BRAM_66_WIDTH-1:0];
            assign bram_we[66][0][S_AXIS_BRAM_66_WIDTH/8-1:0] = ap_bram_66_we0;
            assign bram_en[66][0] = ap_bram_66_en0;
            assign bram_addr[66][1][S_AXIS_BRAM_66_ADDR_WIDTH-1:0] = ap_bram_66_addr1;
            assign bram_din[66][1][S_AXIS_BRAM_66_WIDTH-1:0] = ap_bram_66_din1;
            assign ap_bram_66_dout1 = bram_dout[66][1][S_AXIS_BRAM_66_WIDTH-1:0];
            assign bram_we[66][1][S_AXIS_BRAM_66_WIDTH/8-1:0] = ap_bram_66_we1;
            assign bram_en[66][1] = ap_bram_66_en1;
            
            assign out_clk[66] = m_axis_bramio_66_aclk;
            assign out_rst[66] = m_axis_bramio_66_aresetn;
            assign dwconv1_tready[66] = m_axis_bramio_66_tready;
            assign m_axis_bramio_66_tlast = dwconv1_tlast[66];
            assign m_axis_bramio_66_tvalid = dwconv1_tvalid[66];
            assign m_axis_bramio_66_tkeep = dwconv1_tkeep[66][M_AXIS_BRAMIO_66_DMWIDTH/8-1:0];
            assign m_axis_bramio_66_tstrb = dwconv1_tstrb[66][M_AXIS_BRAMIO_66_DMWIDTH/8-1:0];
            assign m_axis_bramio_66_tdata = dwconv1_tdata[66][M_AXIS_BRAMIO_66_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 67) begin
            assign in_clk[67] = s_axis_bram_67_aclk;
            assign in_rst[67] = s_axis_bram_67_aresetn;
            assign tlast[67] = s_axis_bram_67_tlast;
            assign tvalid[67] = s_axis_bram_67_tvalid;
            assign tkeep[67][S_AXIS_BRAM_67_DMWIDTH/8-1:0] = s_axis_bram_67_tkeep;
            assign tstrb[67][S_AXIS_BRAM_67_DMWIDTH/8-1:0] = s_axis_bram_67_tstrb;
            assign tdata[67][S_AXIS_BRAM_67_DMWIDTH-1:0] = s_axis_bram_67_tdata;
            assign s_axis_bram_67_tready = tready[67];
            
            assign bram_addr[67][0][S_AXIS_BRAM_67_ADDR_WIDTH-1:0] = ap_bram_67_addr0;
            assign bram_din[67][0][S_AXIS_BRAM_67_WIDTH-1:0] = ap_bram_67_din0;
            assign ap_bram_67_dout0 = bram_dout[67][0][S_AXIS_BRAM_67_WIDTH-1:0];
            assign bram_we[67][0][S_AXIS_BRAM_67_WIDTH/8-1:0] = ap_bram_67_we0;
            assign bram_en[67][0] = ap_bram_67_en0;
            assign bram_addr[67][1][S_AXIS_BRAM_67_ADDR_WIDTH-1:0] = ap_bram_67_addr1;
            assign bram_din[67][1][S_AXIS_BRAM_67_WIDTH-1:0] = ap_bram_67_din1;
            assign ap_bram_67_dout1 = bram_dout[67][1][S_AXIS_BRAM_67_WIDTH-1:0];
            assign bram_we[67][1][S_AXIS_BRAM_67_WIDTH/8-1:0] = ap_bram_67_we1;
            assign bram_en[67][1] = ap_bram_67_en1;
            
            assign out_clk[67] = m_axis_bramio_67_aclk;
            assign out_rst[67] = m_axis_bramio_67_aresetn;
            assign dwconv1_tready[67] = m_axis_bramio_67_tready;
            assign m_axis_bramio_67_tlast = dwconv1_tlast[67];
            assign m_axis_bramio_67_tvalid = dwconv1_tvalid[67];
            assign m_axis_bramio_67_tkeep = dwconv1_tkeep[67][M_AXIS_BRAMIO_67_DMWIDTH/8-1:0];
            assign m_axis_bramio_67_tstrb = dwconv1_tstrb[67][M_AXIS_BRAMIO_67_DMWIDTH/8-1:0];
            assign m_axis_bramio_67_tdata = dwconv1_tdata[67][M_AXIS_BRAMIO_67_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 68) begin
            assign in_clk[68] = s_axis_bram_68_aclk;
            assign in_rst[68] = s_axis_bram_68_aresetn;
            assign tlast[68] = s_axis_bram_68_tlast;
            assign tvalid[68] = s_axis_bram_68_tvalid;
            assign tkeep[68][S_AXIS_BRAM_68_DMWIDTH/8-1:0] = s_axis_bram_68_tkeep;
            assign tstrb[68][S_AXIS_BRAM_68_DMWIDTH/8-1:0] = s_axis_bram_68_tstrb;
            assign tdata[68][S_AXIS_BRAM_68_DMWIDTH-1:0] = s_axis_bram_68_tdata;
            assign s_axis_bram_68_tready = tready[68];
            
            assign bram_addr[68][0][S_AXIS_BRAM_68_ADDR_WIDTH-1:0] = ap_bram_68_addr0;
            assign bram_din[68][0][S_AXIS_BRAM_68_WIDTH-1:0] = ap_bram_68_din0;
            assign ap_bram_68_dout0 = bram_dout[68][0][S_AXIS_BRAM_68_WIDTH-1:0];
            assign bram_we[68][0][S_AXIS_BRAM_68_WIDTH/8-1:0] = ap_bram_68_we0;
            assign bram_en[68][0] = ap_bram_68_en0;
            assign bram_addr[68][1][S_AXIS_BRAM_68_ADDR_WIDTH-1:0] = ap_bram_68_addr1;
            assign bram_din[68][1][S_AXIS_BRAM_68_WIDTH-1:0] = ap_bram_68_din1;
            assign ap_bram_68_dout1 = bram_dout[68][1][S_AXIS_BRAM_68_WIDTH-1:0];
            assign bram_we[68][1][S_AXIS_BRAM_68_WIDTH/8-1:0] = ap_bram_68_we1;
            assign bram_en[68][1] = ap_bram_68_en1;
            
            assign out_clk[68] = m_axis_bramio_68_aclk;
            assign out_rst[68] = m_axis_bramio_68_aresetn;
            assign dwconv1_tready[68] = m_axis_bramio_68_tready;
            assign m_axis_bramio_68_tlast = dwconv1_tlast[68];
            assign m_axis_bramio_68_tvalid = dwconv1_tvalid[68];
            assign m_axis_bramio_68_tkeep = dwconv1_tkeep[68][M_AXIS_BRAMIO_68_DMWIDTH/8-1:0];
            assign m_axis_bramio_68_tstrb = dwconv1_tstrb[68][M_AXIS_BRAMIO_68_DMWIDTH/8-1:0];
            assign m_axis_bramio_68_tdata = dwconv1_tdata[68][M_AXIS_BRAMIO_68_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 69) begin
            assign in_clk[69] = s_axis_bram_69_aclk;
            assign in_rst[69] = s_axis_bram_69_aresetn;
            assign tlast[69] = s_axis_bram_69_tlast;
            assign tvalid[69] = s_axis_bram_69_tvalid;
            assign tkeep[69][S_AXIS_BRAM_69_DMWIDTH/8-1:0] = s_axis_bram_69_tkeep;
            assign tstrb[69][S_AXIS_BRAM_69_DMWIDTH/8-1:0] = s_axis_bram_69_tstrb;
            assign tdata[69][S_AXIS_BRAM_69_DMWIDTH-1:0] = s_axis_bram_69_tdata;
            assign s_axis_bram_69_tready = tready[69];
            
            assign bram_addr[69][0][S_AXIS_BRAM_69_ADDR_WIDTH-1:0] = ap_bram_69_addr0;
            assign bram_din[69][0][S_AXIS_BRAM_69_WIDTH-1:0] = ap_bram_69_din0;
            assign ap_bram_69_dout0 = bram_dout[69][0][S_AXIS_BRAM_69_WIDTH-1:0];
            assign bram_we[69][0][S_AXIS_BRAM_69_WIDTH/8-1:0] = ap_bram_69_we0;
            assign bram_en[69][0] = ap_bram_69_en0;
            assign bram_addr[69][1][S_AXIS_BRAM_69_ADDR_WIDTH-1:0] = ap_bram_69_addr1;
            assign bram_din[69][1][S_AXIS_BRAM_69_WIDTH-1:0] = ap_bram_69_din1;
            assign ap_bram_69_dout1 = bram_dout[69][1][S_AXIS_BRAM_69_WIDTH-1:0];
            assign bram_we[69][1][S_AXIS_BRAM_69_WIDTH/8-1:0] = ap_bram_69_we1;
            assign bram_en[69][1] = ap_bram_69_en1;
            
            assign out_clk[69] = m_axis_bramio_69_aclk;
            assign out_rst[69] = m_axis_bramio_69_aresetn;
            assign dwconv1_tready[69] = m_axis_bramio_69_tready;
            assign m_axis_bramio_69_tlast = dwconv1_tlast[69];
            assign m_axis_bramio_69_tvalid = dwconv1_tvalid[69];
            assign m_axis_bramio_69_tkeep = dwconv1_tkeep[69][M_AXIS_BRAMIO_69_DMWIDTH/8-1:0];
            assign m_axis_bramio_69_tstrb = dwconv1_tstrb[69][M_AXIS_BRAMIO_69_DMWIDTH/8-1:0];
            assign m_axis_bramio_69_tdata = dwconv1_tdata[69][M_AXIS_BRAMIO_69_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 70) begin
            assign in_clk[70] = s_axis_bram_70_aclk;
            assign in_rst[70] = s_axis_bram_70_aresetn;
            assign tlast[70] = s_axis_bram_70_tlast;
            assign tvalid[70] = s_axis_bram_70_tvalid;
            assign tkeep[70][S_AXIS_BRAM_70_DMWIDTH/8-1:0] = s_axis_bram_70_tkeep;
            assign tstrb[70][S_AXIS_BRAM_70_DMWIDTH/8-1:0] = s_axis_bram_70_tstrb;
            assign tdata[70][S_AXIS_BRAM_70_DMWIDTH-1:0] = s_axis_bram_70_tdata;
            assign s_axis_bram_70_tready = tready[70];
            
            assign bram_addr[70][0][S_AXIS_BRAM_70_ADDR_WIDTH-1:0] = ap_bram_70_addr0;
            assign bram_din[70][0][S_AXIS_BRAM_70_WIDTH-1:0] = ap_bram_70_din0;
            assign ap_bram_70_dout0 = bram_dout[70][0][S_AXIS_BRAM_70_WIDTH-1:0];
            assign bram_we[70][0][S_AXIS_BRAM_70_WIDTH/8-1:0] = ap_bram_70_we0;
            assign bram_en[70][0] = ap_bram_70_en0;
            assign bram_addr[70][1][S_AXIS_BRAM_70_ADDR_WIDTH-1:0] = ap_bram_70_addr1;
            assign bram_din[70][1][S_AXIS_BRAM_70_WIDTH-1:0] = ap_bram_70_din1;
            assign ap_bram_70_dout1 = bram_dout[70][1][S_AXIS_BRAM_70_WIDTH-1:0];
            assign bram_we[70][1][S_AXIS_BRAM_70_WIDTH/8-1:0] = ap_bram_70_we1;
            assign bram_en[70][1] = ap_bram_70_en1;
            
            assign out_clk[70] = m_axis_bramio_70_aclk;
            assign out_rst[70] = m_axis_bramio_70_aresetn;
            assign dwconv1_tready[70] = m_axis_bramio_70_tready;
            assign m_axis_bramio_70_tlast = dwconv1_tlast[70];
            assign m_axis_bramio_70_tvalid = dwconv1_tvalid[70];
            assign m_axis_bramio_70_tkeep = dwconv1_tkeep[70][M_AXIS_BRAMIO_70_DMWIDTH/8-1:0];
            assign m_axis_bramio_70_tstrb = dwconv1_tstrb[70][M_AXIS_BRAMIO_70_DMWIDTH/8-1:0];
            assign m_axis_bramio_70_tdata = dwconv1_tdata[70][M_AXIS_BRAMIO_70_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 71) begin
            assign in_clk[71] = s_axis_bram_71_aclk;
            assign in_rst[71] = s_axis_bram_71_aresetn;
            assign tlast[71] = s_axis_bram_71_tlast;
            assign tvalid[71] = s_axis_bram_71_tvalid;
            assign tkeep[71][S_AXIS_BRAM_71_DMWIDTH/8-1:0] = s_axis_bram_71_tkeep;
            assign tstrb[71][S_AXIS_BRAM_71_DMWIDTH/8-1:0] = s_axis_bram_71_tstrb;
            assign tdata[71][S_AXIS_BRAM_71_DMWIDTH-1:0] = s_axis_bram_71_tdata;
            assign s_axis_bram_71_tready = tready[71];
            
            assign bram_addr[71][0][S_AXIS_BRAM_71_ADDR_WIDTH-1:0] = ap_bram_71_addr0;
            assign bram_din[71][0][S_AXIS_BRAM_71_WIDTH-1:0] = ap_bram_71_din0;
            assign ap_bram_71_dout0 = bram_dout[71][0][S_AXIS_BRAM_71_WIDTH-1:0];
            assign bram_we[71][0][S_AXIS_BRAM_71_WIDTH/8-1:0] = ap_bram_71_we0;
            assign bram_en[71][0] = ap_bram_71_en0;
            assign bram_addr[71][1][S_AXIS_BRAM_71_ADDR_WIDTH-1:0] = ap_bram_71_addr1;
            assign bram_din[71][1][S_AXIS_BRAM_71_WIDTH-1:0] = ap_bram_71_din1;
            assign ap_bram_71_dout1 = bram_dout[71][1][S_AXIS_BRAM_71_WIDTH-1:0];
            assign bram_we[71][1][S_AXIS_BRAM_71_WIDTH/8-1:0] = ap_bram_71_we1;
            assign bram_en[71][1] = ap_bram_71_en1;
            
            assign out_clk[71] = m_axis_bramio_71_aclk;
            assign out_rst[71] = m_axis_bramio_71_aresetn;
            assign dwconv1_tready[71] = m_axis_bramio_71_tready;
            assign m_axis_bramio_71_tlast = dwconv1_tlast[71];
            assign m_axis_bramio_71_tvalid = dwconv1_tvalid[71];
            assign m_axis_bramio_71_tkeep = dwconv1_tkeep[71][M_AXIS_BRAMIO_71_DMWIDTH/8-1:0];
            assign m_axis_bramio_71_tstrb = dwconv1_tstrb[71][M_AXIS_BRAMIO_71_DMWIDTH/8-1:0];
            assign m_axis_bramio_71_tdata = dwconv1_tdata[71][M_AXIS_BRAMIO_71_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 72) begin
            assign in_clk[72] = s_axis_bram_72_aclk;
            assign in_rst[72] = s_axis_bram_72_aresetn;
            assign tlast[72] = s_axis_bram_72_tlast;
            assign tvalid[72] = s_axis_bram_72_tvalid;
            assign tkeep[72][S_AXIS_BRAM_72_DMWIDTH/8-1:0] = s_axis_bram_72_tkeep;
            assign tstrb[72][S_AXIS_BRAM_72_DMWIDTH/8-1:0] = s_axis_bram_72_tstrb;
            assign tdata[72][S_AXIS_BRAM_72_DMWIDTH-1:0] = s_axis_bram_72_tdata;
            assign s_axis_bram_72_tready = tready[72];
            
            assign bram_addr[72][0][S_AXIS_BRAM_72_ADDR_WIDTH-1:0] = ap_bram_72_addr0;
            assign bram_din[72][0][S_AXIS_BRAM_72_WIDTH-1:0] = ap_bram_72_din0;
            assign ap_bram_72_dout0 = bram_dout[72][0][S_AXIS_BRAM_72_WIDTH-1:0];
            assign bram_we[72][0][S_AXIS_BRAM_72_WIDTH/8-1:0] = ap_bram_72_we0;
            assign bram_en[72][0] = ap_bram_72_en0;
            assign bram_addr[72][1][S_AXIS_BRAM_72_ADDR_WIDTH-1:0] = ap_bram_72_addr1;
            assign bram_din[72][1][S_AXIS_BRAM_72_WIDTH-1:0] = ap_bram_72_din1;
            assign ap_bram_72_dout1 = bram_dout[72][1][S_AXIS_BRAM_72_WIDTH-1:0];
            assign bram_we[72][1][S_AXIS_BRAM_72_WIDTH/8-1:0] = ap_bram_72_we1;
            assign bram_en[72][1] = ap_bram_72_en1;
            
            assign out_clk[72] = m_axis_bramio_72_aclk;
            assign out_rst[72] = m_axis_bramio_72_aresetn;
            assign dwconv1_tready[72] = m_axis_bramio_72_tready;
            assign m_axis_bramio_72_tlast = dwconv1_tlast[72];
            assign m_axis_bramio_72_tvalid = dwconv1_tvalid[72];
            assign m_axis_bramio_72_tkeep = dwconv1_tkeep[72][M_AXIS_BRAMIO_72_DMWIDTH/8-1:0];
            assign m_axis_bramio_72_tstrb = dwconv1_tstrb[72][M_AXIS_BRAMIO_72_DMWIDTH/8-1:0];
            assign m_axis_bramio_72_tdata = dwconv1_tdata[72][M_AXIS_BRAMIO_72_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 73) begin
            assign in_clk[73] = s_axis_bram_73_aclk;
            assign in_rst[73] = s_axis_bram_73_aresetn;
            assign tlast[73] = s_axis_bram_73_tlast;
            assign tvalid[73] = s_axis_bram_73_tvalid;
            assign tkeep[73][S_AXIS_BRAM_73_DMWIDTH/8-1:0] = s_axis_bram_73_tkeep;
            assign tstrb[73][S_AXIS_BRAM_73_DMWIDTH/8-1:0] = s_axis_bram_73_tstrb;
            assign tdata[73][S_AXIS_BRAM_73_DMWIDTH-1:0] = s_axis_bram_73_tdata;
            assign s_axis_bram_73_tready = tready[73];
            
            assign bram_addr[73][0][S_AXIS_BRAM_73_ADDR_WIDTH-1:0] = ap_bram_73_addr0;
            assign bram_din[73][0][S_AXIS_BRAM_73_WIDTH-1:0] = ap_bram_73_din0;
            assign ap_bram_73_dout0 = bram_dout[73][0][S_AXIS_BRAM_73_WIDTH-1:0];
            assign bram_we[73][0][S_AXIS_BRAM_73_WIDTH/8-1:0] = ap_bram_73_we0;
            assign bram_en[73][0] = ap_bram_73_en0;
            assign bram_addr[73][1][S_AXIS_BRAM_73_ADDR_WIDTH-1:0] = ap_bram_73_addr1;
            assign bram_din[73][1][S_AXIS_BRAM_73_WIDTH-1:0] = ap_bram_73_din1;
            assign ap_bram_73_dout1 = bram_dout[73][1][S_AXIS_BRAM_73_WIDTH-1:0];
            assign bram_we[73][1][S_AXIS_BRAM_73_WIDTH/8-1:0] = ap_bram_73_we1;
            assign bram_en[73][1] = ap_bram_73_en1;
            
            assign out_clk[73] = m_axis_bramio_73_aclk;
            assign out_rst[73] = m_axis_bramio_73_aresetn;
            assign dwconv1_tready[73] = m_axis_bramio_73_tready;
            assign m_axis_bramio_73_tlast = dwconv1_tlast[73];
            assign m_axis_bramio_73_tvalid = dwconv1_tvalid[73];
            assign m_axis_bramio_73_tkeep = dwconv1_tkeep[73][M_AXIS_BRAMIO_73_DMWIDTH/8-1:0];
            assign m_axis_bramio_73_tstrb = dwconv1_tstrb[73][M_AXIS_BRAMIO_73_DMWIDTH/8-1:0];
            assign m_axis_bramio_73_tdata = dwconv1_tdata[73][M_AXIS_BRAMIO_73_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 74) begin
            assign in_clk[74] = s_axis_bram_74_aclk;
            assign in_rst[74] = s_axis_bram_74_aresetn;
            assign tlast[74] = s_axis_bram_74_tlast;
            assign tvalid[74] = s_axis_bram_74_tvalid;
            assign tkeep[74][S_AXIS_BRAM_74_DMWIDTH/8-1:0] = s_axis_bram_74_tkeep;
            assign tstrb[74][S_AXIS_BRAM_74_DMWIDTH/8-1:0] = s_axis_bram_74_tstrb;
            assign tdata[74][S_AXIS_BRAM_74_DMWIDTH-1:0] = s_axis_bram_74_tdata;
            assign s_axis_bram_74_tready = tready[74];
            
            assign bram_addr[74][0][S_AXIS_BRAM_74_ADDR_WIDTH-1:0] = ap_bram_74_addr0;
            assign bram_din[74][0][S_AXIS_BRAM_74_WIDTH-1:0] = ap_bram_74_din0;
            assign ap_bram_74_dout0 = bram_dout[74][0][S_AXIS_BRAM_74_WIDTH-1:0];
            assign bram_we[74][0][S_AXIS_BRAM_74_WIDTH/8-1:0] = ap_bram_74_we0;
            assign bram_en[74][0] = ap_bram_74_en0;
            assign bram_addr[74][1][S_AXIS_BRAM_74_ADDR_WIDTH-1:0] = ap_bram_74_addr1;
            assign bram_din[74][1][S_AXIS_BRAM_74_WIDTH-1:0] = ap_bram_74_din1;
            assign ap_bram_74_dout1 = bram_dout[74][1][S_AXIS_BRAM_74_WIDTH-1:0];
            assign bram_we[74][1][S_AXIS_BRAM_74_WIDTH/8-1:0] = ap_bram_74_we1;
            assign bram_en[74][1] = ap_bram_74_en1;
            
            assign out_clk[74] = m_axis_bramio_74_aclk;
            assign out_rst[74] = m_axis_bramio_74_aresetn;
            assign dwconv1_tready[74] = m_axis_bramio_74_tready;
            assign m_axis_bramio_74_tlast = dwconv1_tlast[74];
            assign m_axis_bramio_74_tvalid = dwconv1_tvalid[74];
            assign m_axis_bramio_74_tkeep = dwconv1_tkeep[74][M_AXIS_BRAMIO_74_DMWIDTH/8-1:0];
            assign m_axis_bramio_74_tstrb = dwconv1_tstrb[74][M_AXIS_BRAMIO_74_DMWIDTH/8-1:0];
            assign m_axis_bramio_74_tdata = dwconv1_tdata[74][M_AXIS_BRAMIO_74_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 75) begin
            assign in_clk[75] = s_axis_bram_75_aclk;
            assign in_rst[75] = s_axis_bram_75_aresetn;
            assign tlast[75] = s_axis_bram_75_tlast;
            assign tvalid[75] = s_axis_bram_75_tvalid;
            assign tkeep[75][S_AXIS_BRAM_75_DMWIDTH/8-1:0] = s_axis_bram_75_tkeep;
            assign tstrb[75][S_AXIS_BRAM_75_DMWIDTH/8-1:0] = s_axis_bram_75_tstrb;
            assign tdata[75][S_AXIS_BRAM_75_DMWIDTH-1:0] = s_axis_bram_75_tdata;
            assign s_axis_bram_75_tready = tready[75];
            
            assign bram_addr[75][0][S_AXIS_BRAM_75_ADDR_WIDTH-1:0] = ap_bram_75_addr0;
            assign bram_din[75][0][S_AXIS_BRAM_75_WIDTH-1:0] = ap_bram_75_din0;
            assign ap_bram_75_dout0 = bram_dout[75][0][S_AXIS_BRAM_75_WIDTH-1:0];
            assign bram_we[75][0][S_AXIS_BRAM_75_WIDTH/8-1:0] = ap_bram_75_we0;
            assign bram_en[75][0] = ap_bram_75_en0;
            assign bram_addr[75][1][S_AXIS_BRAM_75_ADDR_WIDTH-1:0] = ap_bram_75_addr1;
            assign bram_din[75][1][S_AXIS_BRAM_75_WIDTH-1:0] = ap_bram_75_din1;
            assign ap_bram_75_dout1 = bram_dout[75][1][S_AXIS_BRAM_75_WIDTH-1:0];
            assign bram_we[75][1][S_AXIS_BRAM_75_WIDTH/8-1:0] = ap_bram_75_we1;
            assign bram_en[75][1] = ap_bram_75_en1;
            
            assign out_clk[75] = m_axis_bramio_75_aclk;
            assign out_rst[75] = m_axis_bramio_75_aresetn;
            assign dwconv1_tready[75] = m_axis_bramio_75_tready;
            assign m_axis_bramio_75_tlast = dwconv1_tlast[75];
            assign m_axis_bramio_75_tvalid = dwconv1_tvalid[75];
            assign m_axis_bramio_75_tkeep = dwconv1_tkeep[75][M_AXIS_BRAMIO_75_DMWIDTH/8-1:0];
            assign m_axis_bramio_75_tstrb = dwconv1_tstrb[75][M_AXIS_BRAMIO_75_DMWIDTH/8-1:0];
            assign m_axis_bramio_75_tdata = dwconv1_tdata[75][M_AXIS_BRAMIO_75_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 76) begin
            assign in_clk[76] = s_axis_bram_76_aclk;
            assign in_rst[76] = s_axis_bram_76_aresetn;
            assign tlast[76] = s_axis_bram_76_tlast;
            assign tvalid[76] = s_axis_bram_76_tvalid;
            assign tkeep[76][S_AXIS_BRAM_76_DMWIDTH/8-1:0] = s_axis_bram_76_tkeep;
            assign tstrb[76][S_AXIS_BRAM_76_DMWIDTH/8-1:0] = s_axis_bram_76_tstrb;
            assign tdata[76][S_AXIS_BRAM_76_DMWIDTH-1:0] = s_axis_bram_76_tdata;
            assign s_axis_bram_76_tready = tready[76];
            
            assign bram_addr[76][0][S_AXIS_BRAM_76_ADDR_WIDTH-1:0] = ap_bram_76_addr0;
            assign bram_din[76][0][S_AXIS_BRAM_76_WIDTH-1:0] = ap_bram_76_din0;
            assign ap_bram_76_dout0 = bram_dout[76][0][S_AXIS_BRAM_76_WIDTH-1:0];
            assign bram_we[76][0][S_AXIS_BRAM_76_WIDTH/8-1:0] = ap_bram_76_we0;
            assign bram_en[76][0] = ap_bram_76_en0;
            assign bram_addr[76][1][S_AXIS_BRAM_76_ADDR_WIDTH-1:0] = ap_bram_76_addr1;
            assign bram_din[76][1][S_AXIS_BRAM_76_WIDTH-1:0] = ap_bram_76_din1;
            assign ap_bram_76_dout1 = bram_dout[76][1][S_AXIS_BRAM_76_WIDTH-1:0];
            assign bram_we[76][1][S_AXIS_BRAM_76_WIDTH/8-1:0] = ap_bram_76_we1;
            assign bram_en[76][1] = ap_bram_76_en1;
            
            assign out_clk[76] = m_axis_bramio_76_aclk;
            assign out_rst[76] = m_axis_bramio_76_aresetn;
            assign dwconv1_tready[76] = m_axis_bramio_76_tready;
            assign m_axis_bramio_76_tlast = dwconv1_tlast[76];
            assign m_axis_bramio_76_tvalid = dwconv1_tvalid[76];
            assign m_axis_bramio_76_tkeep = dwconv1_tkeep[76][M_AXIS_BRAMIO_76_DMWIDTH/8-1:0];
            assign m_axis_bramio_76_tstrb = dwconv1_tstrb[76][M_AXIS_BRAMIO_76_DMWIDTH/8-1:0];
            assign m_axis_bramio_76_tdata = dwconv1_tdata[76][M_AXIS_BRAMIO_76_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 77) begin
            assign in_clk[77] = s_axis_bram_77_aclk;
            assign in_rst[77] = s_axis_bram_77_aresetn;
            assign tlast[77] = s_axis_bram_77_tlast;
            assign tvalid[77] = s_axis_bram_77_tvalid;
            assign tkeep[77][S_AXIS_BRAM_77_DMWIDTH/8-1:0] = s_axis_bram_77_tkeep;
            assign tstrb[77][S_AXIS_BRAM_77_DMWIDTH/8-1:0] = s_axis_bram_77_tstrb;
            assign tdata[77][S_AXIS_BRAM_77_DMWIDTH-1:0] = s_axis_bram_77_tdata;
            assign s_axis_bram_77_tready = tready[77];
            
            assign bram_addr[77][0][S_AXIS_BRAM_77_ADDR_WIDTH-1:0] = ap_bram_77_addr0;
            assign bram_din[77][0][S_AXIS_BRAM_77_WIDTH-1:0] = ap_bram_77_din0;
            assign ap_bram_77_dout0 = bram_dout[77][0][S_AXIS_BRAM_77_WIDTH-1:0];
            assign bram_we[77][0][S_AXIS_BRAM_77_WIDTH/8-1:0] = ap_bram_77_we0;
            assign bram_en[77][0] = ap_bram_77_en0;
            assign bram_addr[77][1][S_AXIS_BRAM_77_ADDR_WIDTH-1:0] = ap_bram_77_addr1;
            assign bram_din[77][1][S_AXIS_BRAM_77_WIDTH-1:0] = ap_bram_77_din1;
            assign ap_bram_77_dout1 = bram_dout[77][1][S_AXIS_BRAM_77_WIDTH-1:0];
            assign bram_we[77][1][S_AXIS_BRAM_77_WIDTH/8-1:0] = ap_bram_77_we1;
            assign bram_en[77][1] = ap_bram_77_en1;
            
            assign out_clk[77] = m_axis_bramio_77_aclk;
            assign out_rst[77] = m_axis_bramio_77_aresetn;
            assign dwconv1_tready[77] = m_axis_bramio_77_tready;
            assign m_axis_bramio_77_tlast = dwconv1_tlast[77];
            assign m_axis_bramio_77_tvalid = dwconv1_tvalid[77];
            assign m_axis_bramio_77_tkeep = dwconv1_tkeep[77][M_AXIS_BRAMIO_77_DMWIDTH/8-1:0];
            assign m_axis_bramio_77_tstrb = dwconv1_tstrb[77][M_AXIS_BRAMIO_77_DMWIDTH/8-1:0];
            assign m_axis_bramio_77_tdata = dwconv1_tdata[77][M_AXIS_BRAMIO_77_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 78) begin
            assign in_clk[78] = s_axis_bram_78_aclk;
            assign in_rst[78] = s_axis_bram_78_aresetn;
            assign tlast[78] = s_axis_bram_78_tlast;
            assign tvalid[78] = s_axis_bram_78_tvalid;
            assign tkeep[78][S_AXIS_BRAM_78_DMWIDTH/8-1:0] = s_axis_bram_78_tkeep;
            assign tstrb[78][S_AXIS_BRAM_78_DMWIDTH/8-1:0] = s_axis_bram_78_tstrb;
            assign tdata[78][S_AXIS_BRAM_78_DMWIDTH-1:0] = s_axis_bram_78_tdata;
            assign s_axis_bram_78_tready = tready[78];
            
            assign bram_addr[78][0][S_AXIS_BRAM_78_ADDR_WIDTH-1:0] = ap_bram_78_addr0;
            assign bram_din[78][0][S_AXIS_BRAM_78_WIDTH-1:0] = ap_bram_78_din0;
            assign ap_bram_78_dout0 = bram_dout[78][0][S_AXIS_BRAM_78_WIDTH-1:0];
            assign bram_we[78][0][S_AXIS_BRAM_78_WIDTH/8-1:0] = ap_bram_78_we0;
            assign bram_en[78][0] = ap_bram_78_en0;
            assign bram_addr[78][1][S_AXIS_BRAM_78_ADDR_WIDTH-1:0] = ap_bram_78_addr1;
            assign bram_din[78][1][S_AXIS_BRAM_78_WIDTH-1:0] = ap_bram_78_din1;
            assign ap_bram_78_dout1 = bram_dout[78][1][S_AXIS_BRAM_78_WIDTH-1:0];
            assign bram_we[78][1][S_AXIS_BRAM_78_WIDTH/8-1:0] = ap_bram_78_we1;
            assign bram_en[78][1] = ap_bram_78_en1;
            
            assign out_clk[78] = m_axis_bramio_78_aclk;
            assign out_rst[78] = m_axis_bramio_78_aresetn;
            assign dwconv1_tready[78] = m_axis_bramio_78_tready;
            assign m_axis_bramio_78_tlast = dwconv1_tlast[78];
            assign m_axis_bramio_78_tvalid = dwconv1_tvalid[78];
            assign m_axis_bramio_78_tkeep = dwconv1_tkeep[78][M_AXIS_BRAMIO_78_DMWIDTH/8-1:0];
            assign m_axis_bramio_78_tstrb = dwconv1_tstrb[78][M_AXIS_BRAMIO_78_DMWIDTH/8-1:0];
            assign m_axis_bramio_78_tdata = dwconv1_tdata[78][M_AXIS_BRAMIO_78_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 79) begin
            assign in_clk[79] = s_axis_bram_79_aclk;
            assign in_rst[79] = s_axis_bram_79_aresetn;
            assign tlast[79] = s_axis_bram_79_tlast;
            assign tvalid[79] = s_axis_bram_79_tvalid;
            assign tkeep[79][S_AXIS_BRAM_79_DMWIDTH/8-1:0] = s_axis_bram_79_tkeep;
            assign tstrb[79][S_AXIS_BRAM_79_DMWIDTH/8-1:0] = s_axis_bram_79_tstrb;
            assign tdata[79][S_AXIS_BRAM_79_DMWIDTH-1:0] = s_axis_bram_79_tdata;
            assign s_axis_bram_79_tready = tready[79];
            
            assign bram_addr[79][0][S_AXIS_BRAM_79_ADDR_WIDTH-1:0] = ap_bram_79_addr0;
            assign bram_din[79][0][S_AXIS_BRAM_79_WIDTH-1:0] = ap_bram_79_din0;
            assign ap_bram_79_dout0 = bram_dout[79][0][S_AXIS_BRAM_79_WIDTH-1:0];
            assign bram_we[79][0][S_AXIS_BRAM_79_WIDTH/8-1:0] = ap_bram_79_we0;
            assign bram_en[79][0] = ap_bram_79_en0;
            assign bram_addr[79][1][S_AXIS_BRAM_79_ADDR_WIDTH-1:0] = ap_bram_79_addr1;
            assign bram_din[79][1][S_AXIS_BRAM_79_WIDTH-1:0] = ap_bram_79_din1;
            assign ap_bram_79_dout1 = bram_dout[79][1][S_AXIS_BRAM_79_WIDTH-1:0];
            assign bram_we[79][1][S_AXIS_BRAM_79_WIDTH/8-1:0] = ap_bram_79_we1;
            assign bram_en[79][1] = ap_bram_79_en1;
            
            assign out_clk[79] = m_axis_bramio_79_aclk;
            assign out_rst[79] = m_axis_bramio_79_aresetn;
            assign dwconv1_tready[79] = m_axis_bramio_79_tready;
            assign m_axis_bramio_79_tlast = dwconv1_tlast[79];
            assign m_axis_bramio_79_tvalid = dwconv1_tvalid[79];
            assign m_axis_bramio_79_tkeep = dwconv1_tkeep[79][M_AXIS_BRAMIO_79_DMWIDTH/8-1:0];
            assign m_axis_bramio_79_tstrb = dwconv1_tstrb[79][M_AXIS_BRAMIO_79_DMWIDTH/8-1:0];
            assign m_axis_bramio_79_tdata = dwconv1_tdata[79][M_AXIS_BRAMIO_79_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 80) begin
            assign in_clk[80] = s_axis_bram_80_aclk;
            assign in_rst[80] = s_axis_bram_80_aresetn;
            assign tlast[80] = s_axis_bram_80_tlast;
            assign tvalid[80] = s_axis_bram_80_tvalid;
            assign tkeep[80][S_AXIS_BRAM_80_DMWIDTH/8-1:0] = s_axis_bram_80_tkeep;
            assign tstrb[80][S_AXIS_BRAM_80_DMWIDTH/8-1:0] = s_axis_bram_80_tstrb;
            assign tdata[80][S_AXIS_BRAM_80_DMWIDTH-1:0] = s_axis_bram_80_tdata;
            assign s_axis_bram_80_tready = tready[80];
            
            assign bram_addr[80][0][S_AXIS_BRAM_80_ADDR_WIDTH-1:0] = ap_bram_80_addr0;
            assign bram_din[80][0][S_AXIS_BRAM_80_WIDTH-1:0] = ap_bram_80_din0;
            assign ap_bram_80_dout0 = bram_dout[80][0][S_AXIS_BRAM_80_WIDTH-1:0];
            assign bram_we[80][0][S_AXIS_BRAM_80_WIDTH/8-1:0] = ap_bram_80_we0;
            assign bram_en[80][0] = ap_bram_80_en0;
            assign bram_addr[80][1][S_AXIS_BRAM_80_ADDR_WIDTH-1:0] = ap_bram_80_addr1;
            assign bram_din[80][1][S_AXIS_BRAM_80_WIDTH-1:0] = ap_bram_80_din1;
            assign ap_bram_80_dout1 = bram_dout[80][1][S_AXIS_BRAM_80_WIDTH-1:0];
            assign bram_we[80][1][S_AXIS_BRAM_80_WIDTH/8-1:0] = ap_bram_80_we1;
            assign bram_en[80][1] = ap_bram_80_en1;
            
            assign out_clk[80] = m_axis_bramio_80_aclk;
            assign out_rst[80] = m_axis_bramio_80_aresetn;
            assign dwconv1_tready[80] = m_axis_bramio_80_tready;
            assign m_axis_bramio_80_tlast = dwconv1_tlast[80];
            assign m_axis_bramio_80_tvalid = dwconv1_tvalid[80];
            assign m_axis_bramio_80_tkeep = dwconv1_tkeep[80][M_AXIS_BRAMIO_80_DMWIDTH/8-1:0];
            assign m_axis_bramio_80_tstrb = dwconv1_tstrb[80][M_AXIS_BRAMIO_80_DMWIDTH/8-1:0];
            assign m_axis_bramio_80_tdata = dwconv1_tdata[80][M_AXIS_BRAMIO_80_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 81) begin
            assign in_clk[81] = s_axis_bram_81_aclk;
            assign in_rst[81] = s_axis_bram_81_aresetn;
            assign tlast[81] = s_axis_bram_81_tlast;
            assign tvalid[81] = s_axis_bram_81_tvalid;
            assign tkeep[81][S_AXIS_BRAM_81_DMWIDTH/8-1:0] = s_axis_bram_81_tkeep;
            assign tstrb[81][S_AXIS_BRAM_81_DMWIDTH/8-1:0] = s_axis_bram_81_tstrb;
            assign tdata[81][S_AXIS_BRAM_81_DMWIDTH-1:0] = s_axis_bram_81_tdata;
            assign s_axis_bram_81_tready = tready[81];
            
            assign bram_addr[81][0][S_AXIS_BRAM_81_ADDR_WIDTH-1:0] = ap_bram_81_addr0;
            assign bram_din[81][0][S_AXIS_BRAM_81_WIDTH-1:0] = ap_bram_81_din0;
            assign ap_bram_81_dout0 = bram_dout[81][0][S_AXIS_BRAM_81_WIDTH-1:0];
            assign bram_we[81][0][S_AXIS_BRAM_81_WIDTH/8-1:0] = ap_bram_81_we0;
            assign bram_en[81][0] = ap_bram_81_en0;
            assign bram_addr[81][1][S_AXIS_BRAM_81_ADDR_WIDTH-1:0] = ap_bram_81_addr1;
            assign bram_din[81][1][S_AXIS_BRAM_81_WIDTH-1:0] = ap_bram_81_din1;
            assign ap_bram_81_dout1 = bram_dout[81][1][S_AXIS_BRAM_81_WIDTH-1:0];
            assign bram_we[81][1][S_AXIS_BRAM_81_WIDTH/8-1:0] = ap_bram_81_we1;
            assign bram_en[81][1] = ap_bram_81_en1;
            
            assign out_clk[81] = m_axis_bramio_81_aclk;
            assign out_rst[81] = m_axis_bramio_81_aresetn;
            assign dwconv1_tready[81] = m_axis_bramio_81_tready;
            assign m_axis_bramio_81_tlast = dwconv1_tlast[81];
            assign m_axis_bramio_81_tvalid = dwconv1_tvalid[81];
            assign m_axis_bramio_81_tkeep = dwconv1_tkeep[81][M_AXIS_BRAMIO_81_DMWIDTH/8-1:0];
            assign m_axis_bramio_81_tstrb = dwconv1_tstrb[81][M_AXIS_BRAMIO_81_DMWIDTH/8-1:0];
            assign m_axis_bramio_81_tdata = dwconv1_tdata[81][M_AXIS_BRAMIO_81_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 82) begin
            assign in_clk[82] = s_axis_bram_82_aclk;
            assign in_rst[82] = s_axis_bram_82_aresetn;
            assign tlast[82] = s_axis_bram_82_tlast;
            assign tvalid[82] = s_axis_bram_82_tvalid;
            assign tkeep[82][S_AXIS_BRAM_82_DMWIDTH/8-1:0] = s_axis_bram_82_tkeep;
            assign tstrb[82][S_AXIS_BRAM_82_DMWIDTH/8-1:0] = s_axis_bram_82_tstrb;
            assign tdata[82][S_AXIS_BRAM_82_DMWIDTH-1:0] = s_axis_bram_82_tdata;
            assign s_axis_bram_82_tready = tready[82];
            
            assign bram_addr[82][0][S_AXIS_BRAM_82_ADDR_WIDTH-1:0] = ap_bram_82_addr0;
            assign bram_din[82][0][S_AXIS_BRAM_82_WIDTH-1:0] = ap_bram_82_din0;
            assign ap_bram_82_dout0 = bram_dout[82][0][S_AXIS_BRAM_82_WIDTH-1:0];
            assign bram_we[82][0][S_AXIS_BRAM_82_WIDTH/8-1:0] = ap_bram_82_we0;
            assign bram_en[82][0] = ap_bram_82_en0;
            assign bram_addr[82][1][S_AXIS_BRAM_82_ADDR_WIDTH-1:0] = ap_bram_82_addr1;
            assign bram_din[82][1][S_AXIS_BRAM_82_WIDTH-1:0] = ap_bram_82_din1;
            assign ap_bram_82_dout1 = bram_dout[82][1][S_AXIS_BRAM_82_WIDTH-1:0];
            assign bram_we[82][1][S_AXIS_BRAM_82_WIDTH/8-1:0] = ap_bram_82_we1;
            assign bram_en[82][1] = ap_bram_82_en1;
            
            assign out_clk[82] = m_axis_bramio_82_aclk;
            assign out_rst[82] = m_axis_bramio_82_aresetn;
            assign dwconv1_tready[82] = m_axis_bramio_82_tready;
            assign m_axis_bramio_82_tlast = dwconv1_tlast[82];
            assign m_axis_bramio_82_tvalid = dwconv1_tvalid[82];
            assign m_axis_bramio_82_tkeep = dwconv1_tkeep[82][M_AXIS_BRAMIO_82_DMWIDTH/8-1:0];
            assign m_axis_bramio_82_tstrb = dwconv1_tstrb[82][M_AXIS_BRAMIO_82_DMWIDTH/8-1:0];
            assign m_axis_bramio_82_tdata = dwconv1_tdata[82][M_AXIS_BRAMIO_82_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 83) begin
            assign in_clk[83] = s_axis_bram_83_aclk;
            assign in_rst[83] = s_axis_bram_83_aresetn;
            assign tlast[83] = s_axis_bram_83_tlast;
            assign tvalid[83] = s_axis_bram_83_tvalid;
            assign tkeep[83][S_AXIS_BRAM_83_DMWIDTH/8-1:0] = s_axis_bram_83_tkeep;
            assign tstrb[83][S_AXIS_BRAM_83_DMWIDTH/8-1:0] = s_axis_bram_83_tstrb;
            assign tdata[83][S_AXIS_BRAM_83_DMWIDTH-1:0] = s_axis_bram_83_tdata;
            assign s_axis_bram_83_tready = tready[83];
            
            assign bram_addr[83][0][S_AXIS_BRAM_83_ADDR_WIDTH-1:0] = ap_bram_83_addr0;
            assign bram_din[83][0][S_AXIS_BRAM_83_WIDTH-1:0] = ap_bram_83_din0;
            assign ap_bram_83_dout0 = bram_dout[83][0][S_AXIS_BRAM_83_WIDTH-1:0];
            assign bram_we[83][0][S_AXIS_BRAM_83_WIDTH/8-1:0] = ap_bram_83_we0;
            assign bram_en[83][0] = ap_bram_83_en0;
            assign bram_addr[83][1][S_AXIS_BRAM_83_ADDR_WIDTH-1:0] = ap_bram_83_addr1;
            assign bram_din[83][1][S_AXIS_BRAM_83_WIDTH-1:0] = ap_bram_83_din1;
            assign ap_bram_83_dout1 = bram_dout[83][1][S_AXIS_BRAM_83_WIDTH-1:0];
            assign bram_we[83][1][S_AXIS_BRAM_83_WIDTH/8-1:0] = ap_bram_83_we1;
            assign bram_en[83][1] = ap_bram_83_en1;
            
            assign out_clk[83] = m_axis_bramio_83_aclk;
            assign out_rst[83] = m_axis_bramio_83_aresetn;
            assign dwconv1_tready[83] = m_axis_bramio_83_tready;
            assign m_axis_bramio_83_tlast = dwconv1_tlast[83];
            assign m_axis_bramio_83_tvalid = dwconv1_tvalid[83];
            assign m_axis_bramio_83_tkeep = dwconv1_tkeep[83][M_AXIS_BRAMIO_83_DMWIDTH/8-1:0];
            assign m_axis_bramio_83_tstrb = dwconv1_tstrb[83][M_AXIS_BRAMIO_83_DMWIDTH/8-1:0];
            assign m_axis_bramio_83_tdata = dwconv1_tdata[83][M_AXIS_BRAMIO_83_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 84) begin
            assign in_clk[84] = s_axis_bram_84_aclk;
            assign in_rst[84] = s_axis_bram_84_aresetn;
            assign tlast[84] = s_axis_bram_84_tlast;
            assign tvalid[84] = s_axis_bram_84_tvalid;
            assign tkeep[84][S_AXIS_BRAM_84_DMWIDTH/8-1:0] = s_axis_bram_84_tkeep;
            assign tstrb[84][S_AXIS_BRAM_84_DMWIDTH/8-1:0] = s_axis_bram_84_tstrb;
            assign tdata[84][S_AXIS_BRAM_84_DMWIDTH-1:0] = s_axis_bram_84_tdata;
            assign s_axis_bram_84_tready = tready[84];
            
            assign bram_addr[84][0][S_AXIS_BRAM_84_ADDR_WIDTH-1:0] = ap_bram_84_addr0;
            assign bram_din[84][0][S_AXIS_BRAM_84_WIDTH-1:0] = ap_bram_84_din0;
            assign ap_bram_84_dout0 = bram_dout[84][0][S_AXIS_BRAM_84_WIDTH-1:0];
            assign bram_we[84][0][S_AXIS_BRAM_84_WIDTH/8-1:0] = ap_bram_84_we0;
            assign bram_en[84][0] = ap_bram_84_en0;
            assign bram_addr[84][1][S_AXIS_BRAM_84_ADDR_WIDTH-1:0] = ap_bram_84_addr1;
            assign bram_din[84][1][S_AXIS_BRAM_84_WIDTH-1:0] = ap_bram_84_din1;
            assign ap_bram_84_dout1 = bram_dout[84][1][S_AXIS_BRAM_84_WIDTH-1:0];
            assign bram_we[84][1][S_AXIS_BRAM_84_WIDTH/8-1:0] = ap_bram_84_we1;
            assign bram_en[84][1] = ap_bram_84_en1;
            
            assign out_clk[84] = m_axis_bramio_84_aclk;
            assign out_rst[84] = m_axis_bramio_84_aresetn;
            assign dwconv1_tready[84] = m_axis_bramio_84_tready;
            assign m_axis_bramio_84_tlast = dwconv1_tlast[84];
            assign m_axis_bramio_84_tvalid = dwconv1_tvalid[84];
            assign m_axis_bramio_84_tkeep = dwconv1_tkeep[84][M_AXIS_BRAMIO_84_DMWIDTH/8-1:0];
            assign m_axis_bramio_84_tstrb = dwconv1_tstrb[84][M_AXIS_BRAMIO_84_DMWIDTH/8-1:0];
            assign m_axis_bramio_84_tdata = dwconv1_tdata[84][M_AXIS_BRAMIO_84_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 85) begin
            assign in_clk[85] = s_axis_bram_85_aclk;
            assign in_rst[85] = s_axis_bram_85_aresetn;
            assign tlast[85] = s_axis_bram_85_tlast;
            assign tvalid[85] = s_axis_bram_85_tvalid;
            assign tkeep[85][S_AXIS_BRAM_85_DMWIDTH/8-1:0] = s_axis_bram_85_tkeep;
            assign tstrb[85][S_AXIS_BRAM_85_DMWIDTH/8-1:0] = s_axis_bram_85_tstrb;
            assign tdata[85][S_AXIS_BRAM_85_DMWIDTH-1:0] = s_axis_bram_85_tdata;
            assign s_axis_bram_85_tready = tready[85];
            
            assign bram_addr[85][0][S_AXIS_BRAM_85_ADDR_WIDTH-1:0] = ap_bram_85_addr0;
            assign bram_din[85][0][S_AXIS_BRAM_85_WIDTH-1:0] = ap_bram_85_din0;
            assign ap_bram_85_dout0 = bram_dout[85][0][S_AXIS_BRAM_85_WIDTH-1:0];
            assign bram_we[85][0][S_AXIS_BRAM_85_WIDTH/8-1:0] = ap_bram_85_we0;
            assign bram_en[85][0] = ap_bram_85_en0;
            assign bram_addr[85][1][S_AXIS_BRAM_85_ADDR_WIDTH-1:0] = ap_bram_85_addr1;
            assign bram_din[85][1][S_AXIS_BRAM_85_WIDTH-1:0] = ap_bram_85_din1;
            assign ap_bram_85_dout1 = bram_dout[85][1][S_AXIS_BRAM_85_WIDTH-1:0];
            assign bram_we[85][1][S_AXIS_BRAM_85_WIDTH/8-1:0] = ap_bram_85_we1;
            assign bram_en[85][1] = ap_bram_85_en1;
            
            assign out_clk[85] = m_axis_bramio_85_aclk;
            assign out_rst[85] = m_axis_bramio_85_aresetn;
            assign dwconv1_tready[85] = m_axis_bramio_85_tready;
            assign m_axis_bramio_85_tlast = dwconv1_tlast[85];
            assign m_axis_bramio_85_tvalid = dwconv1_tvalid[85];
            assign m_axis_bramio_85_tkeep = dwconv1_tkeep[85][M_AXIS_BRAMIO_85_DMWIDTH/8-1:0];
            assign m_axis_bramio_85_tstrb = dwconv1_tstrb[85][M_AXIS_BRAMIO_85_DMWIDTH/8-1:0];
            assign m_axis_bramio_85_tdata = dwconv1_tdata[85][M_AXIS_BRAMIO_85_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 86) begin
            assign in_clk[86] = s_axis_bram_86_aclk;
            assign in_rst[86] = s_axis_bram_86_aresetn;
            assign tlast[86] = s_axis_bram_86_tlast;
            assign tvalid[86] = s_axis_bram_86_tvalid;
            assign tkeep[86][S_AXIS_BRAM_86_DMWIDTH/8-1:0] = s_axis_bram_86_tkeep;
            assign tstrb[86][S_AXIS_BRAM_86_DMWIDTH/8-1:0] = s_axis_bram_86_tstrb;
            assign tdata[86][S_AXIS_BRAM_86_DMWIDTH-1:0] = s_axis_bram_86_tdata;
            assign s_axis_bram_86_tready = tready[86];
            
            assign bram_addr[86][0][S_AXIS_BRAM_86_ADDR_WIDTH-1:0] = ap_bram_86_addr0;
            assign bram_din[86][0][S_AXIS_BRAM_86_WIDTH-1:0] = ap_bram_86_din0;
            assign ap_bram_86_dout0 = bram_dout[86][0][S_AXIS_BRAM_86_WIDTH-1:0];
            assign bram_we[86][0][S_AXIS_BRAM_86_WIDTH/8-1:0] = ap_bram_86_we0;
            assign bram_en[86][0] = ap_bram_86_en0;
            assign bram_addr[86][1][S_AXIS_BRAM_86_ADDR_WIDTH-1:0] = ap_bram_86_addr1;
            assign bram_din[86][1][S_AXIS_BRAM_86_WIDTH-1:0] = ap_bram_86_din1;
            assign ap_bram_86_dout1 = bram_dout[86][1][S_AXIS_BRAM_86_WIDTH-1:0];
            assign bram_we[86][1][S_AXIS_BRAM_86_WIDTH/8-1:0] = ap_bram_86_we1;
            assign bram_en[86][1] = ap_bram_86_en1;
            
            assign out_clk[86] = m_axis_bramio_86_aclk;
            assign out_rst[86] = m_axis_bramio_86_aresetn;
            assign dwconv1_tready[86] = m_axis_bramio_86_tready;
            assign m_axis_bramio_86_tlast = dwconv1_tlast[86];
            assign m_axis_bramio_86_tvalid = dwconv1_tvalid[86];
            assign m_axis_bramio_86_tkeep = dwconv1_tkeep[86][M_AXIS_BRAMIO_86_DMWIDTH/8-1:0];
            assign m_axis_bramio_86_tstrb = dwconv1_tstrb[86][M_AXIS_BRAMIO_86_DMWIDTH/8-1:0];
            assign m_axis_bramio_86_tdata = dwconv1_tdata[86][M_AXIS_BRAMIO_86_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 87) begin
            assign in_clk[87] = s_axis_bram_87_aclk;
            assign in_rst[87] = s_axis_bram_87_aresetn;
            assign tlast[87] = s_axis_bram_87_tlast;
            assign tvalid[87] = s_axis_bram_87_tvalid;
            assign tkeep[87][S_AXIS_BRAM_87_DMWIDTH/8-1:0] = s_axis_bram_87_tkeep;
            assign tstrb[87][S_AXIS_BRAM_87_DMWIDTH/8-1:0] = s_axis_bram_87_tstrb;
            assign tdata[87][S_AXIS_BRAM_87_DMWIDTH-1:0] = s_axis_bram_87_tdata;
            assign s_axis_bram_87_tready = tready[87];
            
            assign bram_addr[87][0][S_AXIS_BRAM_87_ADDR_WIDTH-1:0] = ap_bram_87_addr0;
            assign bram_din[87][0][S_AXIS_BRAM_87_WIDTH-1:0] = ap_bram_87_din0;
            assign ap_bram_87_dout0 = bram_dout[87][0][S_AXIS_BRAM_87_WIDTH-1:0];
            assign bram_we[87][0][S_AXIS_BRAM_87_WIDTH/8-1:0] = ap_bram_87_we0;
            assign bram_en[87][0] = ap_bram_87_en0;
            assign bram_addr[87][1][S_AXIS_BRAM_87_ADDR_WIDTH-1:0] = ap_bram_87_addr1;
            assign bram_din[87][1][S_AXIS_BRAM_87_WIDTH-1:0] = ap_bram_87_din1;
            assign ap_bram_87_dout1 = bram_dout[87][1][S_AXIS_BRAM_87_WIDTH-1:0];
            assign bram_we[87][1][S_AXIS_BRAM_87_WIDTH/8-1:0] = ap_bram_87_we1;
            assign bram_en[87][1] = ap_bram_87_en1;
            
            assign out_clk[87] = m_axis_bramio_87_aclk;
            assign out_rst[87] = m_axis_bramio_87_aresetn;
            assign dwconv1_tready[87] = m_axis_bramio_87_tready;
            assign m_axis_bramio_87_tlast = dwconv1_tlast[87];
            assign m_axis_bramio_87_tvalid = dwconv1_tvalid[87];
            assign m_axis_bramio_87_tkeep = dwconv1_tkeep[87][M_AXIS_BRAMIO_87_DMWIDTH/8-1:0];
            assign m_axis_bramio_87_tstrb = dwconv1_tstrb[87][M_AXIS_BRAMIO_87_DMWIDTH/8-1:0];
            assign m_axis_bramio_87_tdata = dwconv1_tdata[87][M_AXIS_BRAMIO_87_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 88) begin
            assign in_clk[88] = s_axis_bram_88_aclk;
            assign in_rst[88] = s_axis_bram_88_aresetn;
            assign tlast[88] = s_axis_bram_88_tlast;
            assign tvalid[88] = s_axis_bram_88_tvalid;
            assign tkeep[88][S_AXIS_BRAM_88_DMWIDTH/8-1:0] = s_axis_bram_88_tkeep;
            assign tstrb[88][S_AXIS_BRAM_88_DMWIDTH/8-1:0] = s_axis_bram_88_tstrb;
            assign tdata[88][S_AXIS_BRAM_88_DMWIDTH-1:0] = s_axis_bram_88_tdata;
            assign s_axis_bram_88_tready = tready[88];
            
            assign bram_addr[88][0][S_AXIS_BRAM_88_ADDR_WIDTH-1:0] = ap_bram_88_addr0;
            assign bram_din[88][0][S_AXIS_BRAM_88_WIDTH-1:0] = ap_bram_88_din0;
            assign ap_bram_88_dout0 = bram_dout[88][0][S_AXIS_BRAM_88_WIDTH-1:0];
            assign bram_we[88][0][S_AXIS_BRAM_88_WIDTH/8-1:0] = ap_bram_88_we0;
            assign bram_en[88][0] = ap_bram_88_en0;
            assign bram_addr[88][1][S_AXIS_BRAM_88_ADDR_WIDTH-1:0] = ap_bram_88_addr1;
            assign bram_din[88][1][S_AXIS_BRAM_88_WIDTH-1:0] = ap_bram_88_din1;
            assign ap_bram_88_dout1 = bram_dout[88][1][S_AXIS_BRAM_88_WIDTH-1:0];
            assign bram_we[88][1][S_AXIS_BRAM_88_WIDTH/8-1:0] = ap_bram_88_we1;
            assign bram_en[88][1] = ap_bram_88_en1;
            
            assign out_clk[88] = m_axis_bramio_88_aclk;
            assign out_rst[88] = m_axis_bramio_88_aresetn;
            assign dwconv1_tready[88] = m_axis_bramio_88_tready;
            assign m_axis_bramio_88_tlast = dwconv1_tlast[88];
            assign m_axis_bramio_88_tvalid = dwconv1_tvalid[88];
            assign m_axis_bramio_88_tkeep = dwconv1_tkeep[88][M_AXIS_BRAMIO_88_DMWIDTH/8-1:0];
            assign m_axis_bramio_88_tstrb = dwconv1_tstrb[88][M_AXIS_BRAMIO_88_DMWIDTH/8-1:0];
            assign m_axis_bramio_88_tdata = dwconv1_tdata[88][M_AXIS_BRAMIO_88_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 89) begin
            assign in_clk[89] = s_axis_bram_89_aclk;
            assign in_rst[89] = s_axis_bram_89_aresetn;
            assign tlast[89] = s_axis_bram_89_tlast;
            assign tvalid[89] = s_axis_bram_89_tvalid;
            assign tkeep[89][S_AXIS_BRAM_89_DMWIDTH/8-1:0] = s_axis_bram_89_tkeep;
            assign tstrb[89][S_AXIS_BRAM_89_DMWIDTH/8-1:0] = s_axis_bram_89_tstrb;
            assign tdata[89][S_AXIS_BRAM_89_DMWIDTH-1:0] = s_axis_bram_89_tdata;
            assign s_axis_bram_89_tready = tready[89];
            
            assign bram_addr[89][0][S_AXIS_BRAM_89_ADDR_WIDTH-1:0] = ap_bram_89_addr0;
            assign bram_din[89][0][S_AXIS_BRAM_89_WIDTH-1:0] = ap_bram_89_din0;
            assign ap_bram_89_dout0 = bram_dout[89][0][S_AXIS_BRAM_89_WIDTH-1:0];
            assign bram_we[89][0][S_AXIS_BRAM_89_WIDTH/8-1:0] = ap_bram_89_we0;
            assign bram_en[89][0] = ap_bram_89_en0;
            assign bram_addr[89][1][S_AXIS_BRAM_89_ADDR_WIDTH-1:0] = ap_bram_89_addr1;
            assign bram_din[89][1][S_AXIS_BRAM_89_WIDTH-1:0] = ap_bram_89_din1;
            assign ap_bram_89_dout1 = bram_dout[89][1][S_AXIS_BRAM_89_WIDTH-1:0];
            assign bram_we[89][1][S_AXIS_BRAM_89_WIDTH/8-1:0] = ap_bram_89_we1;
            assign bram_en[89][1] = ap_bram_89_en1;
            
            assign out_clk[89] = m_axis_bramio_89_aclk;
            assign out_rst[89] = m_axis_bramio_89_aresetn;
            assign dwconv1_tready[89] = m_axis_bramio_89_tready;
            assign m_axis_bramio_89_tlast = dwconv1_tlast[89];
            assign m_axis_bramio_89_tvalid = dwconv1_tvalid[89];
            assign m_axis_bramio_89_tkeep = dwconv1_tkeep[89][M_AXIS_BRAMIO_89_DMWIDTH/8-1:0];
            assign m_axis_bramio_89_tstrb = dwconv1_tstrb[89][M_AXIS_BRAMIO_89_DMWIDTH/8-1:0];
            assign m_axis_bramio_89_tdata = dwconv1_tdata[89][M_AXIS_BRAMIO_89_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 90) begin
            assign in_clk[90] = s_axis_bram_90_aclk;
            assign in_rst[90] = s_axis_bram_90_aresetn;
            assign tlast[90] = s_axis_bram_90_tlast;
            assign tvalid[90] = s_axis_bram_90_tvalid;
            assign tkeep[90][S_AXIS_BRAM_90_DMWIDTH/8-1:0] = s_axis_bram_90_tkeep;
            assign tstrb[90][S_AXIS_BRAM_90_DMWIDTH/8-1:0] = s_axis_bram_90_tstrb;
            assign tdata[90][S_AXIS_BRAM_90_DMWIDTH-1:0] = s_axis_bram_90_tdata;
            assign s_axis_bram_90_tready = tready[90];
            
            assign bram_addr[90][0][S_AXIS_BRAM_90_ADDR_WIDTH-1:0] = ap_bram_90_addr0;
            assign bram_din[90][0][S_AXIS_BRAM_90_WIDTH-1:0] = ap_bram_90_din0;
            assign ap_bram_90_dout0 = bram_dout[90][0][S_AXIS_BRAM_90_WIDTH-1:0];
            assign bram_we[90][0][S_AXIS_BRAM_90_WIDTH/8-1:0] = ap_bram_90_we0;
            assign bram_en[90][0] = ap_bram_90_en0;
            assign bram_addr[90][1][S_AXIS_BRAM_90_ADDR_WIDTH-1:0] = ap_bram_90_addr1;
            assign bram_din[90][1][S_AXIS_BRAM_90_WIDTH-1:0] = ap_bram_90_din1;
            assign ap_bram_90_dout1 = bram_dout[90][1][S_AXIS_BRAM_90_WIDTH-1:0];
            assign bram_we[90][1][S_AXIS_BRAM_90_WIDTH/8-1:0] = ap_bram_90_we1;
            assign bram_en[90][1] = ap_bram_90_en1;
            
            assign out_clk[90] = m_axis_bramio_90_aclk;
            assign out_rst[90] = m_axis_bramio_90_aresetn;
            assign dwconv1_tready[90] = m_axis_bramio_90_tready;
            assign m_axis_bramio_90_tlast = dwconv1_tlast[90];
            assign m_axis_bramio_90_tvalid = dwconv1_tvalid[90];
            assign m_axis_bramio_90_tkeep = dwconv1_tkeep[90][M_AXIS_BRAMIO_90_DMWIDTH/8-1:0];
            assign m_axis_bramio_90_tstrb = dwconv1_tstrb[90][M_AXIS_BRAMIO_90_DMWIDTH/8-1:0];
            assign m_axis_bramio_90_tdata = dwconv1_tdata[90][M_AXIS_BRAMIO_90_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 91) begin
            assign in_clk[91] = s_axis_bram_91_aclk;
            assign in_rst[91] = s_axis_bram_91_aresetn;
            assign tlast[91] = s_axis_bram_91_tlast;
            assign tvalid[91] = s_axis_bram_91_tvalid;
            assign tkeep[91][S_AXIS_BRAM_91_DMWIDTH/8-1:0] = s_axis_bram_91_tkeep;
            assign tstrb[91][S_AXIS_BRAM_91_DMWIDTH/8-1:0] = s_axis_bram_91_tstrb;
            assign tdata[91][S_AXIS_BRAM_91_DMWIDTH-1:0] = s_axis_bram_91_tdata;
            assign s_axis_bram_91_tready = tready[91];
            
            assign bram_addr[91][0][S_AXIS_BRAM_91_ADDR_WIDTH-1:0] = ap_bram_91_addr0;
            assign bram_din[91][0][S_AXIS_BRAM_91_WIDTH-1:0] = ap_bram_91_din0;
            assign ap_bram_91_dout0 = bram_dout[91][0][S_AXIS_BRAM_91_WIDTH-1:0];
            assign bram_we[91][0][S_AXIS_BRAM_91_WIDTH/8-1:0] = ap_bram_91_we0;
            assign bram_en[91][0] = ap_bram_91_en0;
            assign bram_addr[91][1][S_AXIS_BRAM_91_ADDR_WIDTH-1:0] = ap_bram_91_addr1;
            assign bram_din[91][1][S_AXIS_BRAM_91_WIDTH-1:0] = ap_bram_91_din1;
            assign ap_bram_91_dout1 = bram_dout[91][1][S_AXIS_BRAM_91_WIDTH-1:0];
            assign bram_we[91][1][S_AXIS_BRAM_91_WIDTH/8-1:0] = ap_bram_91_we1;
            assign bram_en[91][1] = ap_bram_91_en1;
            
            assign out_clk[91] = m_axis_bramio_91_aclk;
            assign out_rst[91] = m_axis_bramio_91_aresetn;
            assign dwconv1_tready[91] = m_axis_bramio_91_tready;
            assign m_axis_bramio_91_tlast = dwconv1_tlast[91];
            assign m_axis_bramio_91_tvalid = dwconv1_tvalid[91];
            assign m_axis_bramio_91_tkeep = dwconv1_tkeep[91][M_AXIS_BRAMIO_91_DMWIDTH/8-1:0];
            assign m_axis_bramio_91_tstrb = dwconv1_tstrb[91][M_AXIS_BRAMIO_91_DMWIDTH/8-1:0];
            assign m_axis_bramio_91_tdata = dwconv1_tdata[91][M_AXIS_BRAMIO_91_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 92) begin
            assign in_clk[92] = s_axis_bram_92_aclk;
            assign in_rst[92] = s_axis_bram_92_aresetn;
            assign tlast[92] = s_axis_bram_92_tlast;
            assign tvalid[92] = s_axis_bram_92_tvalid;
            assign tkeep[92][S_AXIS_BRAM_92_DMWIDTH/8-1:0] = s_axis_bram_92_tkeep;
            assign tstrb[92][S_AXIS_BRAM_92_DMWIDTH/8-1:0] = s_axis_bram_92_tstrb;
            assign tdata[92][S_AXIS_BRAM_92_DMWIDTH-1:0] = s_axis_bram_92_tdata;
            assign s_axis_bram_92_tready = tready[92];
            
            assign bram_addr[92][0][S_AXIS_BRAM_92_ADDR_WIDTH-1:0] = ap_bram_92_addr0;
            assign bram_din[92][0][S_AXIS_BRAM_92_WIDTH-1:0] = ap_bram_92_din0;
            assign ap_bram_92_dout0 = bram_dout[92][0][S_AXIS_BRAM_92_WIDTH-1:0];
            assign bram_we[92][0][S_AXIS_BRAM_92_WIDTH/8-1:0] = ap_bram_92_we0;
            assign bram_en[92][0] = ap_bram_92_en0;
            assign bram_addr[92][1][S_AXIS_BRAM_92_ADDR_WIDTH-1:0] = ap_bram_92_addr1;
            assign bram_din[92][1][S_AXIS_BRAM_92_WIDTH-1:0] = ap_bram_92_din1;
            assign ap_bram_92_dout1 = bram_dout[92][1][S_AXIS_BRAM_92_WIDTH-1:0];
            assign bram_we[92][1][S_AXIS_BRAM_92_WIDTH/8-1:0] = ap_bram_92_we1;
            assign bram_en[92][1] = ap_bram_92_en1;
            
            assign out_clk[92] = m_axis_bramio_92_aclk;
            assign out_rst[92] = m_axis_bramio_92_aresetn;
            assign dwconv1_tready[92] = m_axis_bramio_92_tready;
            assign m_axis_bramio_92_tlast = dwconv1_tlast[92];
            assign m_axis_bramio_92_tvalid = dwconv1_tvalid[92];
            assign m_axis_bramio_92_tkeep = dwconv1_tkeep[92][M_AXIS_BRAMIO_92_DMWIDTH/8-1:0];
            assign m_axis_bramio_92_tstrb = dwconv1_tstrb[92][M_AXIS_BRAMIO_92_DMWIDTH/8-1:0];
            assign m_axis_bramio_92_tdata = dwconv1_tdata[92][M_AXIS_BRAMIO_92_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 93) begin
            assign in_clk[93] = s_axis_bram_93_aclk;
            assign in_rst[93] = s_axis_bram_93_aresetn;
            assign tlast[93] = s_axis_bram_93_tlast;
            assign tvalid[93] = s_axis_bram_93_tvalid;
            assign tkeep[93][S_AXIS_BRAM_93_DMWIDTH/8-1:0] = s_axis_bram_93_tkeep;
            assign tstrb[93][S_AXIS_BRAM_93_DMWIDTH/8-1:0] = s_axis_bram_93_tstrb;
            assign tdata[93][S_AXIS_BRAM_93_DMWIDTH-1:0] = s_axis_bram_93_tdata;
            assign s_axis_bram_93_tready = tready[93];
            
            assign bram_addr[93][0][S_AXIS_BRAM_93_ADDR_WIDTH-1:0] = ap_bram_93_addr0;
            assign bram_din[93][0][S_AXIS_BRAM_93_WIDTH-1:0] = ap_bram_93_din0;
            assign ap_bram_93_dout0 = bram_dout[93][0][S_AXIS_BRAM_93_WIDTH-1:0];
            assign bram_we[93][0][S_AXIS_BRAM_93_WIDTH/8-1:0] = ap_bram_93_we0;
            assign bram_en[93][0] = ap_bram_93_en0;
            assign bram_addr[93][1][S_AXIS_BRAM_93_ADDR_WIDTH-1:0] = ap_bram_93_addr1;
            assign bram_din[93][1][S_AXIS_BRAM_93_WIDTH-1:0] = ap_bram_93_din1;
            assign ap_bram_93_dout1 = bram_dout[93][1][S_AXIS_BRAM_93_WIDTH-1:0];
            assign bram_we[93][1][S_AXIS_BRAM_93_WIDTH/8-1:0] = ap_bram_93_we1;
            assign bram_en[93][1] = ap_bram_93_en1;
            
            assign out_clk[93] = m_axis_bramio_93_aclk;
            assign out_rst[93] = m_axis_bramio_93_aresetn;
            assign dwconv1_tready[93] = m_axis_bramio_93_tready;
            assign m_axis_bramio_93_tlast = dwconv1_tlast[93];
            assign m_axis_bramio_93_tvalid = dwconv1_tvalid[93];
            assign m_axis_bramio_93_tkeep = dwconv1_tkeep[93][M_AXIS_BRAMIO_93_DMWIDTH/8-1:0];
            assign m_axis_bramio_93_tstrb = dwconv1_tstrb[93][M_AXIS_BRAMIO_93_DMWIDTH/8-1:0];
            assign m_axis_bramio_93_tdata = dwconv1_tdata[93][M_AXIS_BRAMIO_93_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 94) begin
            assign in_clk[94] = s_axis_bram_94_aclk;
            assign in_rst[94] = s_axis_bram_94_aresetn;
            assign tlast[94] = s_axis_bram_94_tlast;
            assign tvalid[94] = s_axis_bram_94_tvalid;
            assign tkeep[94][S_AXIS_BRAM_94_DMWIDTH/8-1:0] = s_axis_bram_94_tkeep;
            assign tstrb[94][S_AXIS_BRAM_94_DMWIDTH/8-1:0] = s_axis_bram_94_tstrb;
            assign tdata[94][S_AXIS_BRAM_94_DMWIDTH-1:0] = s_axis_bram_94_tdata;
            assign s_axis_bram_94_tready = tready[94];
            
            assign bram_addr[94][0][S_AXIS_BRAM_94_ADDR_WIDTH-1:0] = ap_bram_94_addr0;
            assign bram_din[94][0][S_AXIS_BRAM_94_WIDTH-1:0] = ap_bram_94_din0;
            assign ap_bram_94_dout0 = bram_dout[94][0][S_AXIS_BRAM_94_WIDTH-1:0];
            assign bram_we[94][0][S_AXIS_BRAM_94_WIDTH/8-1:0] = ap_bram_94_we0;
            assign bram_en[94][0] = ap_bram_94_en0;
            assign bram_addr[94][1][S_AXIS_BRAM_94_ADDR_WIDTH-1:0] = ap_bram_94_addr1;
            assign bram_din[94][1][S_AXIS_BRAM_94_WIDTH-1:0] = ap_bram_94_din1;
            assign ap_bram_94_dout1 = bram_dout[94][1][S_AXIS_BRAM_94_WIDTH-1:0];
            assign bram_we[94][1][S_AXIS_BRAM_94_WIDTH/8-1:0] = ap_bram_94_we1;
            assign bram_en[94][1] = ap_bram_94_en1;
            
            assign out_clk[94] = m_axis_bramio_94_aclk;
            assign out_rst[94] = m_axis_bramio_94_aresetn;
            assign dwconv1_tready[94] = m_axis_bramio_94_tready;
            assign m_axis_bramio_94_tlast = dwconv1_tlast[94];
            assign m_axis_bramio_94_tvalid = dwconv1_tvalid[94];
            assign m_axis_bramio_94_tkeep = dwconv1_tkeep[94][M_AXIS_BRAMIO_94_DMWIDTH/8-1:0];
            assign m_axis_bramio_94_tstrb = dwconv1_tstrb[94][M_AXIS_BRAMIO_94_DMWIDTH/8-1:0];
            assign m_axis_bramio_94_tdata = dwconv1_tdata[94][M_AXIS_BRAMIO_94_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 95) begin
            assign in_clk[95] = s_axis_bram_95_aclk;
            assign in_rst[95] = s_axis_bram_95_aresetn;
            assign tlast[95] = s_axis_bram_95_tlast;
            assign tvalid[95] = s_axis_bram_95_tvalid;
            assign tkeep[95][S_AXIS_BRAM_95_DMWIDTH/8-1:0] = s_axis_bram_95_tkeep;
            assign tstrb[95][S_AXIS_BRAM_95_DMWIDTH/8-1:0] = s_axis_bram_95_tstrb;
            assign tdata[95][S_AXIS_BRAM_95_DMWIDTH-1:0] = s_axis_bram_95_tdata;
            assign s_axis_bram_95_tready = tready[95];
            
            assign bram_addr[95][0][S_AXIS_BRAM_95_ADDR_WIDTH-1:0] = ap_bram_95_addr0;
            assign bram_din[95][0][S_AXIS_BRAM_95_WIDTH-1:0] = ap_bram_95_din0;
            assign ap_bram_95_dout0 = bram_dout[95][0][S_AXIS_BRAM_95_WIDTH-1:0];
            assign bram_we[95][0][S_AXIS_BRAM_95_WIDTH/8-1:0] = ap_bram_95_we0;
            assign bram_en[95][0] = ap_bram_95_en0;
            assign bram_addr[95][1][S_AXIS_BRAM_95_ADDR_WIDTH-1:0] = ap_bram_95_addr1;
            assign bram_din[95][1][S_AXIS_BRAM_95_WIDTH-1:0] = ap_bram_95_din1;
            assign ap_bram_95_dout1 = bram_dout[95][1][S_AXIS_BRAM_95_WIDTH-1:0];
            assign bram_we[95][1][S_AXIS_BRAM_95_WIDTH/8-1:0] = ap_bram_95_we1;
            assign bram_en[95][1] = ap_bram_95_en1;
            
            assign out_clk[95] = m_axis_bramio_95_aclk;
            assign out_rst[95] = m_axis_bramio_95_aresetn;
            assign dwconv1_tready[95] = m_axis_bramio_95_tready;
            assign m_axis_bramio_95_tlast = dwconv1_tlast[95];
            assign m_axis_bramio_95_tvalid = dwconv1_tvalid[95];
            assign m_axis_bramio_95_tkeep = dwconv1_tkeep[95][M_AXIS_BRAMIO_95_DMWIDTH/8-1:0];
            assign m_axis_bramio_95_tstrb = dwconv1_tstrb[95][M_AXIS_BRAMIO_95_DMWIDTH/8-1:0];
            assign m_axis_bramio_95_tdata = dwconv1_tdata[95][M_AXIS_BRAMIO_95_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 96) begin
            assign in_clk[96] = s_axis_bram_96_aclk;
            assign in_rst[96] = s_axis_bram_96_aresetn;
            assign tlast[96] = s_axis_bram_96_tlast;
            assign tvalid[96] = s_axis_bram_96_tvalid;
            assign tkeep[96][S_AXIS_BRAM_96_DMWIDTH/8-1:0] = s_axis_bram_96_tkeep;
            assign tstrb[96][S_AXIS_BRAM_96_DMWIDTH/8-1:0] = s_axis_bram_96_tstrb;
            assign tdata[96][S_AXIS_BRAM_96_DMWIDTH-1:0] = s_axis_bram_96_tdata;
            assign s_axis_bram_96_tready = tready[96];
            
            assign bram_addr[96][0][S_AXIS_BRAM_96_ADDR_WIDTH-1:0] = ap_bram_96_addr0;
            assign bram_din[96][0][S_AXIS_BRAM_96_WIDTH-1:0] = ap_bram_96_din0;
            assign ap_bram_96_dout0 = bram_dout[96][0][S_AXIS_BRAM_96_WIDTH-1:0];
            assign bram_we[96][0][S_AXIS_BRAM_96_WIDTH/8-1:0] = ap_bram_96_we0;
            assign bram_en[96][0] = ap_bram_96_en0;
            assign bram_addr[96][1][S_AXIS_BRAM_96_ADDR_WIDTH-1:0] = ap_bram_96_addr1;
            assign bram_din[96][1][S_AXIS_BRAM_96_WIDTH-1:0] = ap_bram_96_din1;
            assign ap_bram_96_dout1 = bram_dout[96][1][S_AXIS_BRAM_96_WIDTH-1:0];
            assign bram_we[96][1][S_AXIS_BRAM_96_WIDTH/8-1:0] = ap_bram_96_we1;
            assign bram_en[96][1] = ap_bram_96_en1;
            
            assign out_clk[96] = m_axis_bramio_96_aclk;
            assign out_rst[96] = m_axis_bramio_96_aresetn;
            assign dwconv1_tready[96] = m_axis_bramio_96_tready;
            assign m_axis_bramio_96_tlast = dwconv1_tlast[96];
            assign m_axis_bramio_96_tvalid = dwconv1_tvalid[96];
            assign m_axis_bramio_96_tkeep = dwconv1_tkeep[96][M_AXIS_BRAMIO_96_DMWIDTH/8-1:0];
            assign m_axis_bramio_96_tstrb = dwconv1_tstrb[96][M_AXIS_BRAMIO_96_DMWIDTH/8-1:0];
            assign m_axis_bramio_96_tdata = dwconv1_tdata[96][M_AXIS_BRAMIO_96_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 97) begin
            assign in_clk[97] = s_axis_bram_97_aclk;
            assign in_rst[97] = s_axis_bram_97_aresetn;
            assign tlast[97] = s_axis_bram_97_tlast;
            assign tvalid[97] = s_axis_bram_97_tvalid;
            assign tkeep[97][S_AXIS_BRAM_97_DMWIDTH/8-1:0] = s_axis_bram_97_tkeep;
            assign tstrb[97][S_AXIS_BRAM_97_DMWIDTH/8-1:0] = s_axis_bram_97_tstrb;
            assign tdata[97][S_AXIS_BRAM_97_DMWIDTH-1:0] = s_axis_bram_97_tdata;
            assign s_axis_bram_97_tready = tready[97];
            
            assign bram_addr[97][0][S_AXIS_BRAM_97_ADDR_WIDTH-1:0] = ap_bram_97_addr0;
            assign bram_din[97][0][S_AXIS_BRAM_97_WIDTH-1:0] = ap_bram_97_din0;
            assign ap_bram_97_dout0 = bram_dout[97][0][S_AXIS_BRAM_97_WIDTH-1:0];
            assign bram_we[97][0][S_AXIS_BRAM_97_WIDTH/8-1:0] = ap_bram_97_we0;
            assign bram_en[97][0] = ap_bram_97_en0;
            assign bram_addr[97][1][S_AXIS_BRAM_97_ADDR_WIDTH-1:0] = ap_bram_97_addr1;
            assign bram_din[97][1][S_AXIS_BRAM_97_WIDTH-1:0] = ap_bram_97_din1;
            assign ap_bram_97_dout1 = bram_dout[97][1][S_AXIS_BRAM_97_WIDTH-1:0];
            assign bram_we[97][1][S_AXIS_BRAM_97_WIDTH/8-1:0] = ap_bram_97_we1;
            assign bram_en[97][1] = ap_bram_97_en1;
            
            assign out_clk[97] = m_axis_bramio_97_aclk;
            assign out_rst[97] = m_axis_bramio_97_aresetn;
            assign dwconv1_tready[97] = m_axis_bramio_97_tready;
            assign m_axis_bramio_97_tlast = dwconv1_tlast[97];
            assign m_axis_bramio_97_tvalid = dwconv1_tvalid[97];
            assign m_axis_bramio_97_tkeep = dwconv1_tkeep[97][M_AXIS_BRAMIO_97_DMWIDTH/8-1:0];
            assign m_axis_bramio_97_tstrb = dwconv1_tstrb[97][M_AXIS_BRAMIO_97_DMWIDTH/8-1:0];
            assign m_axis_bramio_97_tdata = dwconv1_tdata[97][M_AXIS_BRAMIO_97_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 98) begin
            assign in_clk[98] = s_axis_bram_98_aclk;
            assign in_rst[98] = s_axis_bram_98_aresetn;
            assign tlast[98] = s_axis_bram_98_tlast;
            assign tvalid[98] = s_axis_bram_98_tvalid;
            assign tkeep[98][S_AXIS_BRAM_98_DMWIDTH/8-1:0] = s_axis_bram_98_tkeep;
            assign tstrb[98][S_AXIS_BRAM_98_DMWIDTH/8-1:0] = s_axis_bram_98_tstrb;
            assign tdata[98][S_AXIS_BRAM_98_DMWIDTH-1:0] = s_axis_bram_98_tdata;
            assign s_axis_bram_98_tready = tready[98];
            
            assign bram_addr[98][0][S_AXIS_BRAM_98_ADDR_WIDTH-1:0] = ap_bram_98_addr0;
            assign bram_din[98][0][S_AXIS_BRAM_98_WIDTH-1:0] = ap_bram_98_din0;
            assign ap_bram_98_dout0 = bram_dout[98][0][S_AXIS_BRAM_98_WIDTH-1:0];
            assign bram_we[98][0][S_AXIS_BRAM_98_WIDTH/8-1:0] = ap_bram_98_we0;
            assign bram_en[98][0] = ap_bram_98_en0;
            assign bram_addr[98][1][S_AXIS_BRAM_98_ADDR_WIDTH-1:0] = ap_bram_98_addr1;
            assign bram_din[98][1][S_AXIS_BRAM_98_WIDTH-1:0] = ap_bram_98_din1;
            assign ap_bram_98_dout1 = bram_dout[98][1][S_AXIS_BRAM_98_WIDTH-1:0];
            assign bram_we[98][1][S_AXIS_BRAM_98_WIDTH/8-1:0] = ap_bram_98_we1;
            assign bram_en[98][1] = ap_bram_98_en1;
            
            assign out_clk[98] = m_axis_bramio_98_aclk;
            assign out_rst[98] = m_axis_bramio_98_aresetn;
            assign dwconv1_tready[98] = m_axis_bramio_98_tready;
            assign m_axis_bramio_98_tlast = dwconv1_tlast[98];
            assign m_axis_bramio_98_tvalid = dwconv1_tvalid[98];
            assign m_axis_bramio_98_tkeep = dwconv1_tkeep[98][M_AXIS_BRAMIO_98_DMWIDTH/8-1:0];
            assign m_axis_bramio_98_tstrb = dwconv1_tstrb[98][M_AXIS_BRAMIO_98_DMWIDTH/8-1:0];
            assign m_axis_bramio_98_tdata = dwconv1_tdata[98][M_AXIS_BRAMIO_98_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 99) begin
            assign in_clk[99] = s_axis_bram_99_aclk;
            assign in_rst[99] = s_axis_bram_99_aresetn;
            assign tlast[99] = s_axis_bram_99_tlast;
            assign tvalid[99] = s_axis_bram_99_tvalid;
            assign tkeep[99][S_AXIS_BRAM_99_DMWIDTH/8-1:0] = s_axis_bram_99_tkeep;
            assign tstrb[99][S_AXIS_BRAM_99_DMWIDTH/8-1:0] = s_axis_bram_99_tstrb;
            assign tdata[99][S_AXIS_BRAM_99_DMWIDTH-1:0] = s_axis_bram_99_tdata;
            assign s_axis_bram_99_tready = tready[99];
            
            assign bram_addr[99][0][S_AXIS_BRAM_99_ADDR_WIDTH-1:0] = ap_bram_99_addr0;
            assign bram_din[99][0][S_AXIS_BRAM_99_WIDTH-1:0] = ap_bram_99_din0;
            assign ap_bram_99_dout0 = bram_dout[99][0][S_AXIS_BRAM_99_WIDTH-1:0];
            assign bram_we[99][0][S_AXIS_BRAM_99_WIDTH/8-1:0] = ap_bram_99_we0;
            assign bram_en[99][0] = ap_bram_99_en0;
            assign bram_addr[99][1][S_AXIS_BRAM_99_ADDR_WIDTH-1:0] = ap_bram_99_addr1;
            assign bram_din[99][1][S_AXIS_BRAM_99_WIDTH-1:0] = ap_bram_99_din1;
            assign ap_bram_99_dout1 = bram_dout[99][1][S_AXIS_BRAM_99_WIDTH-1:0];
            assign bram_we[99][1][S_AXIS_BRAM_99_WIDTH/8-1:0] = ap_bram_99_we1;
            assign bram_en[99][1] = ap_bram_99_en1;
            
            assign out_clk[99] = m_axis_bramio_99_aclk;
            assign out_rst[99] = m_axis_bramio_99_aresetn;
            assign dwconv1_tready[99] = m_axis_bramio_99_tready;
            assign m_axis_bramio_99_tlast = dwconv1_tlast[99];
            assign m_axis_bramio_99_tvalid = dwconv1_tvalid[99];
            assign m_axis_bramio_99_tkeep = dwconv1_tkeep[99][M_AXIS_BRAMIO_99_DMWIDTH/8-1:0];
            assign m_axis_bramio_99_tstrb = dwconv1_tstrb[99][M_AXIS_BRAMIO_99_DMWIDTH/8-1:0];
            assign m_axis_bramio_99_tdata = dwconv1_tdata[99][M_AXIS_BRAMIO_99_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 100) begin
            assign in_clk[100] = s_axis_bram_100_aclk;
            assign in_rst[100] = s_axis_bram_100_aresetn;
            assign tlast[100] = s_axis_bram_100_tlast;
            assign tvalid[100] = s_axis_bram_100_tvalid;
            assign tkeep[100][S_AXIS_BRAM_100_DMWIDTH/8-1:0] = s_axis_bram_100_tkeep;
            assign tstrb[100][S_AXIS_BRAM_100_DMWIDTH/8-1:0] = s_axis_bram_100_tstrb;
            assign tdata[100][S_AXIS_BRAM_100_DMWIDTH-1:0] = s_axis_bram_100_tdata;
            assign s_axis_bram_100_tready = tready[100];
            
            assign bram_addr[100][0][S_AXIS_BRAM_100_ADDR_WIDTH-1:0] = ap_bram_100_addr0;
            assign bram_din[100][0][S_AXIS_BRAM_100_WIDTH-1:0] = ap_bram_100_din0;
            assign ap_bram_100_dout0 = bram_dout[100][0][S_AXIS_BRAM_100_WIDTH-1:0];
            assign bram_we[100][0][S_AXIS_BRAM_100_WIDTH/8-1:0] = ap_bram_100_we0;
            assign bram_en[100][0] = ap_bram_100_en0;
            assign bram_addr[100][1][S_AXIS_BRAM_100_ADDR_WIDTH-1:0] = ap_bram_100_addr1;
            assign bram_din[100][1][S_AXIS_BRAM_100_WIDTH-1:0] = ap_bram_100_din1;
            assign ap_bram_100_dout1 = bram_dout[100][1][S_AXIS_BRAM_100_WIDTH-1:0];
            assign bram_we[100][1][S_AXIS_BRAM_100_WIDTH/8-1:0] = ap_bram_100_we1;
            assign bram_en[100][1] = ap_bram_100_en1;
            
            assign out_clk[100] = m_axis_bramio_100_aclk;
            assign out_rst[100] = m_axis_bramio_100_aresetn;
            assign dwconv1_tready[100] = m_axis_bramio_100_tready;
            assign m_axis_bramio_100_tlast = dwconv1_tlast[100];
            assign m_axis_bramio_100_tvalid = dwconv1_tvalid[100];
            assign m_axis_bramio_100_tkeep = dwconv1_tkeep[100][M_AXIS_BRAMIO_100_DMWIDTH/8-1:0];
            assign m_axis_bramio_100_tstrb = dwconv1_tstrb[100][M_AXIS_BRAMIO_100_DMWIDTH/8-1:0];
            assign m_axis_bramio_100_tdata = dwconv1_tdata[100][M_AXIS_BRAMIO_100_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 101) begin
            assign in_clk[101] = s_axis_bram_101_aclk;
            assign in_rst[101] = s_axis_bram_101_aresetn;
            assign tlast[101] = s_axis_bram_101_tlast;
            assign tvalid[101] = s_axis_bram_101_tvalid;
            assign tkeep[101][S_AXIS_BRAM_101_DMWIDTH/8-1:0] = s_axis_bram_101_tkeep;
            assign tstrb[101][S_AXIS_BRAM_101_DMWIDTH/8-1:0] = s_axis_bram_101_tstrb;
            assign tdata[101][S_AXIS_BRAM_101_DMWIDTH-1:0] = s_axis_bram_101_tdata;
            assign s_axis_bram_101_tready = tready[101];
            
            assign bram_addr[101][0][S_AXIS_BRAM_101_ADDR_WIDTH-1:0] = ap_bram_101_addr0;
            assign bram_din[101][0][S_AXIS_BRAM_101_WIDTH-1:0] = ap_bram_101_din0;
            assign ap_bram_101_dout0 = bram_dout[101][0][S_AXIS_BRAM_101_WIDTH-1:0];
            assign bram_we[101][0][S_AXIS_BRAM_101_WIDTH/8-1:0] = ap_bram_101_we0;
            assign bram_en[101][0] = ap_bram_101_en0;
            assign bram_addr[101][1][S_AXIS_BRAM_101_ADDR_WIDTH-1:0] = ap_bram_101_addr1;
            assign bram_din[101][1][S_AXIS_BRAM_101_WIDTH-1:0] = ap_bram_101_din1;
            assign ap_bram_101_dout1 = bram_dout[101][1][S_AXIS_BRAM_101_WIDTH-1:0];
            assign bram_we[101][1][S_AXIS_BRAM_101_WIDTH/8-1:0] = ap_bram_101_we1;
            assign bram_en[101][1] = ap_bram_101_en1;
            
            assign out_clk[101] = m_axis_bramio_101_aclk;
            assign out_rst[101] = m_axis_bramio_101_aresetn;
            assign dwconv1_tready[101] = m_axis_bramio_101_tready;
            assign m_axis_bramio_101_tlast = dwconv1_tlast[101];
            assign m_axis_bramio_101_tvalid = dwconv1_tvalid[101];
            assign m_axis_bramio_101_tkeep = dwconv1_tkeep[101][M_AXIS_BRAMIO_101_DMWIDTH/8-1:0];
            assign m_axis_bramio_101_tstrb = dwconv1_tstrb[101][M_AXIS_BRAMIO_101_DMWIDTH/8-1:0];
            assign m_axis_bramio_101_tdata = dwconv1_tdata[101][M_AXIS_BRAMIO_101_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 102) begin
            assign in_clk[102] = s_axis_bram_102_aclk;
            assign in_rst[102] = s_axis_bram_102_aresetn;
            assign tlast[102] = s_axis_bram_102_tlast;
            assign tvalid[102] = s_axis_bram_102_tvalid;
            assign tkeep[102][S_AXIS_BRAM_102_DMWIDTH/8-1:0] = s_axis_bram_102_tkeep;
            assign tstrb[102][S_AXIS_BRAM_102_DMWIDTH/8-1:0] = s_axis_bram_102_tstrb;
            assign tdata[102][S_AXIS_BRAM_102_DMWIDTH-1:0] = s_axis_bram_102_tdata;
            assign s_axis_bram_102_tready = tready[102];
            
            assign bram_addr[102][0][S_AXIS_BRAM_102_ADDR_WIDTH-1:0] = ap_bram_102_addr0;
            assign bram_din[102][0][S_AXIS_BRAM_102_WIDTH-1:0] = ap_bram_102_din0;
            assign ap_bram_102_dout0 = bram_dout[102][0][S_AXIS_BRAM_102_WIDTH-1:0];
            assign bram_we[102][0][S_AXIS_BRAM_102_WIDTH/8-1:0] = ap_bram_102_we0;
            assign bram_en[102][0] = ap_bram_102_en0;
            assign bram_addr[102][1][S_AXIS_BRAM_102_ADDR_WIDTH-1:0] = ap_bram_102_addr1;
            assign bram_din[102][1][S_AXIS_BRAM_102_WIDTH-1:0] = ap_bram_102_din1;
            assign ap_bram_102_dout1 = bram_dout[102][1][S_AXIS_BRAM_102_WIDTH-1:0];
            assign bram_we[102][1][S_AXIS_BRAM_102_WIDTH/8-1:0] = ap_bram_102_we1;
            assign bram_en[102][1] = ap_bram_102_en1;
            
            assign out_clk[102] = m_axis_bramio_102_aclk;
            assign out_rst[102] = m_axis_bramio_102_aresetn;
            assign dwconv1_tready[102] = m_axis_bramio_102_tready;
            assign m_axis_bramio_102_tlast = dwconv1_tlast[102];
            assign m_axis_bramio_102_tvalid = dwconv1_tvalid[102];
            assign m_axis_bramio_102_tkeep = dwconv1_tkeep[102][M_AXIS_BRAMIO_102_DMWIDTH/8-1:0];
            assign m_axis_bramio_102_tstrb = dwconv1_tstrb[102][M_AXIS_BRAMIO_102_DMWIDTH/8-1:0];
            assign m_axis_bramio_102_tdata = dwconv1_tdata[102][M_AXIS_BRAMIO_102_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 103) begin
            assign in_clk[103] = s_axis_bram_103_aclk;
            assign in_rst[103] = s_axis_bram_103_aresetn;
            assign tlast[103] = s_axis_bram_103_tlast;
            assign tvalid[103] = s_axis_bram_103_tvalid;
            assign tkeep[103][S_AXIS_BRAM_103_DMWIDTH/8-1:0] = s_axis_bram_103_tkeep;
            assign tstrb[103][S_AXIS_BRAM_103_DMWIDTH/8-1:0] = s_axis_bram_103_tstrb;
            assign tdata[103][S_AXIS_BRAM_103_DMWIDTH-1:0] = s_axis_bram_103_tdata;
            assign s_axis_bram_103_tready = tready[103];
            
            assign bram_addr[103][0][S_AXIS_BRAM_103_ADDR_WIDTH-1:0] = ap_bram_103_addr0;
            assign bram_din[103][0][S_AXIS_BRAM_103_WIDTH-1:0] = ap_bram_103_din0;
            assign ap_bram_103_dout0 = bram_dout[103][0][S_AXIS_BRAM_103_WIDTH-1:0];
            assign bram_we[103][0][S_AXIS_BRAM_103_WIDTH/8-1:0] = ap_bram_103_we0;
            assign bram_en[103][0] = ap_bram_103_en0;
            assign bram_addr[103][1][S_AXIS_BRAM_103_ADDR_WIDTH-1:0] = ap_bram_103_addr1;
            assign bram_din[103][1][S_AXIS_BRAM_103_WIDTH-1:0] = ap_bram_103_din1;
            assign ap_bram_103_dout1 = bram_dout[103][1][S_AXIS_BRAM_103_WIDTH-1:0];
            assign bram_we[103][1][S_AXIS_BRAM_103_WIDTH/8-1:0] = ap_bram_103_we1;
            assign bram_en[103][1] = ap_bram_103_en1;
            
            assign out_clk[103] = m_axis_bramio_103_aclk;
            assign out_rst[103] = m_axis_bramio_103_aresetn;
            assign dwconv1_tready[103] = m_axis_bramio_103_tready;
            assign m_axis_bramio_103_tlast = dwconv1_tlast[103];
            assign m_axis_bramio_103_tvalid = dwconv1_tvalid[103];
            assign m_axis_bramio_103_tkeep = dwconv1_tkeep[103][M_AXIS_BRAMIO_103_DMWIDTH/8-1:0];
            assign m_axis_bramio_103_tstrb = dwconv1_tstrb[103][M_AXIS_BRAMIO_103_DMWIDTH/8-1:0];
            assign m_axis_bramio_103_tdata = dwconv1_tdata[103][M_AXIS_BRAMIO_103_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 104) begin
            assign in_clk[104] = s_axis_bram_104_aclk;
            assign in_rst[104] = s_axis_bram_104_aresetn;
            assign tlast[104] = s_axis_bram_104_tlast;
            assign tvalid[104] = s_axis_bram_104_tvalid;
            assign tkeep[104][S_AXIS_BRAM_104_DMWIDTH/8-1:0] = s_axis_bram_104_tkeep;
            assign tstrb[104][S_AXIS_BRAM_104_DMWIDTH/8-1:0] = s_axis_bram_104_tstrb;
            assign tdata[104][S_AXIS_BRAM_104_DMWIDTH-1:0] = s_axis_bram_104_tdata;
            assign s_axis_bram_104_tready = tready[104];
            
            assign bram_addr[104][0][S_AXIS_BRAM_104_ADDR_WIDTH-1:0] = ap_bram_104_addr0;
            assign bram_din[104][0][S_AXIS_BRAM_104_WIDTH-1:0] = ap_bram_104_din0;
            assign ap_bram_104_dout0 = bram_dout[104][0][S_AXIS_BRAM_104_WIDTH-1:0];
            assign bram_we[104][0][S_AXIS_BRAM_104_WIDTH/8-1:0] = ap_bram_104_we0;
            assign bram_en[104][0] = ap_bram_104_en0;
            assign bram_addr[104][1][S_AXIS_BRAM_104_ADDR_WIDTH-1:0] = ap_bram_104_addr1;
            assign bram_din[104][1][S_AXIS_BRAM_104_WIDTH-1:0] = ap_bram_104_din1;
            assign ap_bram_104_dout1 = bram_dout[104][1][S_AXIS_BRAM_104_WIDTH-1:0];
            assign bram_we[104][1][S_AXIS_BRAM_104_WIDTH/8-1:0] = ap_bram_104_we1;
            assign bram_en[104][1] = ap_bram_104_en1;
            
            assign out_clk[104] = m_axis_bramio_104_aclk;
            assign out_rst[104] = m_axis_bramio_104_aresetn;
            assign dwconv1_tready[104] = m_axis_bramio_104_tready;
            assign m_axis_bramio_104_tlast = dwconv1_tlast[104];
            assign m_axis_bramio_104_tvalid = dwconv1_tvalid[104];
            assign m_axis_bramio_104_tkeep = dwconv1_tkeep[104][M_AXIS_BRAMIO_104_DMWIDTH/8-1:0];
            assign m_axis_bramio_104_tstrb = dwconv1_tstrb[104][M_AXIS_BRAMIO_104_DMWIDTH/8-1:0];
            assign m_axis_bramio_104_tdata = dwconv1_tdata[104][M_AXIS_BRAMIO_104_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 105) begin
            assign in_clk[105] = s_axis_bram_105_aclk;
            assign in_rst[105] = s_axis_bram_105_aresetn;
            assign tlast[105] = s_axis_bram_105_tlast;
            assign tvalid[105] = s_axis_bram_105_tvalid;
            assign tkeep[105][S_AXIS_BRAM_105_DMWIDTH/8-1:0] = s_axis_bram_105_tkeep;
            assign tstrb[105][S_AXIS_BRAM_105_DMWIDTH/8-1:0] = s_axis_bram_105_tstrb;
            assign tdata[105][S_AXIS_BRAM_105_DMWIDTH-1:0] = s_axis_bram_105_tdata;
            assign s_axis_bram_105_tready = tready[105];
            
            assign bram_addr[105][0][S_AXIS_BRAM_105_ADDR_WIDTH-1:0] = ap_bram_105_addr0;
            assign bram_din[105][0][S_AXIS_BRAM_105_WIDTH-1:0] = ap_bram_105_din0;
            assign ap_bram_105_dout0 = bram_dout[105][0][S_AXIS_BRAM_105_WIDTH-1:0];
            assign bram_we[105][0][S_AXIS_BRAM_105_WIDTH/8-1:0] = ap_bram_105_we0;
            assign bram_en[105][0] = ap_bram_105_en0;
            assign bram_addr[105][1][S_AXIS_BRAM_105_ADDR_WIDTH-1:0] = ap_bram_105_addr1;
            assign bram_din[105][1][S_AXIS_BRAM_105_WIDTH-1:0] = ap_bram_105_din1;
            assign ap_bram_105_dout1 = bram_dout[105][1][S_AXIS_BRAM_105_WIDTH-1:0];
            assign bram_we[105][1][S_AXIS_BRAM_105_WIDTH/8-1:0] = ap_bram_105_we1;
            assign bram_en[105][1] = ap_bram_105_en1;
            
            assign out_clk[105] = m_axis_bramio_105_aclk;
            assign out_rst[105] = m_axis_bramio_105_aresetn;
            assign dwconv1_tready[105] = m_axis_bramio_105_tready;
            assign m_axis_bramio_105_tlast = dwconv1_tlast[105];
            assign m_axis_bramio_105_tvalid = dwconv1_tvalid[105];
            assign m_axis_bramio_105_tkeep = dwconv1_tkeep[105][M_AXIS_BRAMIO_105_DMWIDTH/8-1:0];
            assign m_axis_bramio_105_tstrb = dwconv1_tstrb[105][M_AXIS_BRAMIO_105_DMWIDTH/8-1:0];
            assign m_axis_bramio_105_tdata = dwconv1_tdata[105][M_AXIS_BRAMIO_105_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 106) begin
            assign in_clk[106] = s_axis_bram_106_aclk;
            assign in_rst[106] = s_axis_bram_106_aresetn;
            assign tlast[106] = s_axis_bram_106_tlast;
            assign tvalid[106] = s_axis_bram_106_tvalid;
            assign tkeep[106][S_AXIS_BRAM_106_DMWIDTH/8-1:0] = s_axis_bram_106_tkeep;
            assign tstrb[106][S_AXIS_BRAM_106_DMWIDTH/8-1:0] = s_axis_bram_106_tstrb;
            assign tdata[106][S_AXIS_BRAM_106_DMWIDTH-1:0] = s_axis_bram_106_tdata;
            assign s_axis_bram_106_tready = tready[106];
            
            assign bram_addr[106][0][S_AXIS_BRAM_106_ADDR_WIDTH-1:0] = ap_bram_106_addr0;
            assign bram_din[106][0][S_AXIS_BRAM_106_WIDTH-1:0] = ap_bram_106_din0;
            assign ap_bram_106_dout0 = bram_dout[106][0][S_AXIS_BRAM_106_WIDTH-1:0];
            assign bram_we[106][0][S_AXIS_BRAM_106_WIDTH/8-1:0] = ap_bram_106_we0;
            assign bram_en[106][0] = ap_bram_106_en0;
            assign bram_addr[106][1][S_AXIS_BRAM_106_ADDR_WIDTH-1:0] = ap_bram_106_addr1;
            assign bram_din[106][1][S_AXIS_BRAM_106_WIDTH-1:0] = ap_bram_106_din1;
            assign ap_bram_106_dout1 = bram_dout[106][1][S_AXIS_BRAM_106_WIDTH-1:0];
            assign bram_we[106][1][S_AXIS_BRAM_106_WIDTH/8-1:0] = ap_bram_106_we1;
            assign bram_en[106][1] = ap_bram_106_en1;
            
            assign out_clk[106] = m_axis_bramio_106_aclk;
            assign out_rst[106] = m_axis_bramio_106_aresetn;
            assign dwconv1_tready[106] = m_axis_bramio_106_tready;
            assign m_axis_bramio_106_tlast = dwconv1_tlast[106];
            assign m_axis_bramio_106_tvalid = dwconv1_tvalid[106];
            assign m_axis_bramio_106_tkeep = dwconv1_tkeep[106][M_AXIS_BRAMIO_106_DMWIDTH/8-1:0];
            assign m_axis_bramio_106_tstrb = dwconv1_tstrb[106][M_AXIS_BRAMIO_106_DMWIDTH/8-1:0];
            assign m_axis_bramio_106_tdata = dwconv1_tdata[106][M_AXIS_BRAMIO_106_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 107) begin
            assign in_clk[107] = s_axis_bram_107_aclk;
            assign in_rst[107] = s_axis_bram_107_aresetn;
            assign tlast[107] = s_axis_bram_107_tlast;
            assign tvalid[107] = s_axis_bram_107_tvalid;
            assign tkeep[107][S_AXIS_BRAM_107_DMWIDTH/8-1:0] = s_axis_bram_107_tkeep;
            assign tstrb[107][S_AXIS_BRAM_107_DMWIDTH/8-1:0] = s_axis_bram_107_tstrb;
            assign tdata[107][S_AXIS_BRAM_107_DMWIDTH-1:0] = s_axis_bram_107_tdata;
            assign s_axis_bram_107_tready = tready[107];
            
            assign bram_addr[107][0][S_AXIS_BRAM_107_ADDR_WIDTH-1:0] = ap_bram_107_addr0;
            assign bram_din[107][0][S_AXIS_BRAM_107_WIDTH-1:0] = ap_bram_107_din0;
            assign ap_bram_107_dout0 = bram_dout[107][0][S_AXIS_BRAM_107_WIDTH-1:0];
            assign bram_we[107][0][S_AXIS_BRAM_107_WIDTH/8-1:0] = ap_bram_107_we0;
            assign bram_en[107][0] = ap_bram_107_en0;
            assign bram_addr[107][1][S_AXIS_BRAM_107_ADDR_WIDTH-1:0] = ap_bram_107_addr1;
            assign bram_din[107][1][S_AXIS_BRAM_107_WIDTH-1:0] = ap_bram_107_din1;
            assign ap_bram_107_dout1 = bram_dout[107][1][S_AXIS_BRAM_107_WIDTH-1:0];
            assign bram_we[107][1][S_AXIS_BRAM_107_WIDTH/8-1:0] = ap_bram_107_we1;
            assign bram_en[107][1] = ap_bram_107_en1;
            
            assign out_clk[107] = m_axis_bramio_107_aclk;
            assign out_rst[107] = m_axis_bramio_107_aresetn;
            assign dwconv1_tready[107] = m_axis_bramio_107_tready;
            assign m_axis_bramio_107_tlast = dwconv1_tlast[107];
            assign m_axis_bramio_107_tvalid = dwconv1_tvalid[107];
            assign m_axis_bramio_107_tkeep = dwconv1_tkeep[107][M_AXIS_BRAMIO_107_DMWIDTH/8-1:0];
            assign m_axis_bramio_107_tstrb = dwconv1_tstrb[107][M_AXIS_BRAMIO_107_DMWIDTH/8-1:0];
            assign m_axis_bramio_107_tdata = dwconv1_tdata[107][M_AXIS_BRAMIO_107_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 108) begin
            assign in_clk[108] = s_axis_bram_108_aclk;
            assign in_rst[108] = s_axis_bram_108_aresetn;
            assign tlast[108] = s_axis_bram_108_tlast;
            assign tvalid[108] = s_axis_bram_108_tvalid;
            assign tkeep[108][S_AXIS_BRAM_108_DMWIDTH/8-1:0] = s_axis_bram_108_tkeep;
            assign tstrb[108][S_AXIS_BRAM_108_DMWIDTH/8-1:0] = s_axis_bram_108_tstrb;
            assign tdata[108][S_AXIS_BRAM_108_DMWIDTH-1:0] = s_axis_bram_108_tdata;
            assign s_axis_bram_108_tready = tready[108];
            
            assign bram_addr[108][0][S_AXIS_BRAM_108_ADDR_WIDTH-1:0] = ap_bram_108_addr0;
            assign bram_din[108][0][S_AXIS_BRAM_108_WIDTH-1:0] = ap_bram_108_din0;
            assign ap_bram_108_dout0 = bram_dout[108][0][S_AXIS_BRAM_108_WIDTH-1:0];
            assign bram_we[108][0][S_AXIS_BRAM_108_WIDTH/8-1:0] = ap_bram_108_we0;
            assign bram_en[108][0] = ap_bram_108_en0;
            assign bram_addr[108][1][S_AXIS_BRAM_108_ADDR_WIDTH-1:0] = ap_bram_108_addr1;
            assign bram_din[108][1][S_AXIS_BRAM_108_WIDTH-1:0] = ap_bram_108_din1;
            assign ap_bram_108_dout1 = bram_dout[108][1][S_AXIS_BRAM_108_WIDTH-1:0];
            assign bram_we[108][1][S_AXIS_BRAM_108_WIDTH/8-1:0] = ap_bram_108_we1;
            assign bram_en[108][1] = ap_bram_108_en1;
            
            assign out_clk[108] = m_axis_bramio_108_aclk;
            assign out_rst[108] = m_axis_bramio_108_aresetn;
            assign dwconv1_tready[108] = m_axis_bramio_108_tready;
            assign m_axis_bramio_108_tlast = dwconv1_tlast[108];
            assign m_axis_bramio_108_tvalid = dwconv1_tvalid[108];
            assign m_axis_bramio_108_tkeep = dwconv1_tkeep[108][M_AXIS_BRAMIO_108_DMWIDTH/8-1:0];
            assign m_axis_bramio_108_tstrb = dwconv1_tstrb[108][M_AXIS_BRAMIO_108_DMWIDTH/8-1:0];
            assign m_axis_bramio_108_tdata = dwconv1_tdata[108][M_AXIS_BRAMIO_108_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 109) begin
            assign in_clk[109] = s_axis_bram_109_aclk;
            assign in_rst[109] = s_axis_bram_109_aresetn;
            assign tlast[109] = s_axis_bram_109_tlast;
            assign tvalid[109] = s_axis_bram_109_tvalid;
            assign tkeep[109][S_AXIS_BRAM_109_DMWIDTH/8-1:0] = s_axis_bram_109_tkeep;
            assign tstrb[109][S_AXIS_BRAM_109_DMWIDTH/8-1:0] = s_axis_bram_109_tstrb;
            assign tdata[109][S_AXIS_BRAM_109_DMWIDTH-1:0] = s_axis_bram_109_tdata;
            assign s_axis_bram_109_tready = tready[109];
            
            assign bram_addr[109][0][S_AXIS_BRAM_109_ADDR_WIDTH-1:0] = ap_bram_109_addr0;
            assign bram_din[109][0][S_AXIS_BRAM_109_WIDTH-1:0] = ap_bram_109_din0;
            assign ap_bram_109_dout0 = bram_dout[109][0][S_AXIS_BRAM_109_WIDTH-1:0];
            assign bram_we[109][0][S_AXIS_BRAM_109_WIDTH/8-1:0] = ap_bram_109_we0;
            assign bram_en[109][0] = ap_bram_109_en0;
            assign bram_addr[109][1][S_AXIS_BRAM_109_ADDR_WIDTH-1:0] = ap_bram_109_addr1;
            assign bram_din[109][1][S_AXIS_BRAM_109_WIDTH-1:0] = ap_bram_109_din1;
            assign ap_bram_109_dout1 = bram_dout[109][1][S_AXIS_BRAM_109_WIDTH-1:0];
            assign bram_we[109][1][S_AXIS_BRAM_109_WIDTH/8-1:0] = ap_bram_109_we1;
            assign bram_en[109][1] = ap_bram_109_en1;
            
            assign out_clk[109] = m_axis_bramio_109_aclk;
            assign out_rst[109] = m_axis_bramio_109_aresetn;
            assign dwconv1_tready[109] = m_axis_bramio_109_tready;
            assign m_axis_bramio_109_tlast = dwconv1_tlast[109];
            assign m_axis_bramio_109_tvalid = dwconv1_tvalid[109];
            assign m_axis_bramio_109_tkeep = dwconv1_tkeep[109][M_AXIS_BRAMIO_109_DMWIDTH/8-1:0];
            assign m_axis_bramio_109_tstrb = dwconv1_tstrb[109][M_AXIS_BRAMIO_109_DMWIDTH/8-1:0];
            assign m_axis_bramio_109_tdata = dwconv1_tdata[109][M_AXIS_BRAMIO_109_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 110) begin
            assign in_clk[110] = s_axis_bram_110_aclk;
            assign in_rst[110] = s_axis_bram_110_aresetn;
            assign tlast[110] = s_axis_bram_110_tlast;
            assign tvalid[110] = s_axis_bram_110_tvalid;
            assign tkeep[110][S_AXIS_BRAM_110_DMWIDTH/8-1:0] = s_axis_bram_110_tkeep;
            assign tstrb[110][S_AXIS_BRAM_110_DMWIDTH/8-1:0] = s_axis_bram_110_tstrb;
            assign tdata[110][S_AXIS_BRAM_110_DMWIDTH-1:0] = s_axis_bram_110_tdata;
            assign s_axis_bram_110_tready = tready[110];
            
            assign bram_addr[110][0][S_AXIS_BRAM_110_ADDR_WIDTH-1:0] = ap_bram_110_addr0;
            assign bram_din[110][0][S_AXIS_BRAM_110_WIDTH-1:0] = ap_bram_110_din0;
            assign ap_bram_110_dout0 = bram_dout[110][0][S_AXIS_BRAM_110_WIDTH-1:0];
            assign bram_we[110][0][S_AXIS_BRAM_110_WIDTH/8-1:0] = ap_bram_110_we0;
            assign bram_en[110][0] = ap_bram_110_en0;
            assign bram_addr[110][1][S_AXIS_BRAM_110_ADDR_WIDTH-1:0] = ap_bram_110_addr1;
            assign bram_din[110][1][S_AXIS_BRAM_110_WIDTH-1:0] = ap_bram_110_din1;
            assign ap_bram_110_dout1 = bram_dout[110][1][S_AXIS_BRAM_110_WIDTH-1:0];
            assign bram_we[110][1][S_AXIS_BRAM_110_WIDTH/8-1:0] = ap_bram_110_we1;
            assign bram_en[110][1] = ap_bram_110_en1;
            
            assign out_clk[110] = m_axis_bramio_110_aclk;
            assign out_rst[110] = m_axis_bramio_110_aresetn;
            assign dwconv1_tready[110] = m_axis_bramio_110_tready;
            assign m_axis_bramio_110_tlast = dwconv1_tlast[110];
            assign m_axis_bramio_110_tvalid = dwconv1_tvalid[110];
            assign m_axis_bramio_110_tkeep = dwconv1_tkeep[110][M_AXIS_BRAMIO_110_DMWIDTH/8-1:0];
            assign m_axis_bramio_110_tstrb = dwconv1_tstrb[110][M_AXIS_BRAMIO_110_DMWIDTH/8-1:0];
            assign m_axis_bramio_110_tdata = dwconv1_tdata[110][M_AXIS_BRAMIO_110_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 111) begin
            assign in_clk[111] = s_axis_bram_111_aclk;
            assign in_rst[111] = s_axis_bram_111_aresetn;
            assign tlast[111] = s_axis_bram_111_tlast;
            assign tvalid[111] = s_axis_bram_111_tvalid;
            assign tkeep[111][S_AXIS_BRAM_111_DMWIDTH/8-1:0] = s_axis_bram_111_tkeep;
            assign tstrb[111][S_AXIS_BRAM_111_DMWIDTH/8-1:0] = s_axis_bram_111_tstrb;
            assign tdata[111][S_AXIS_BRAM_111_DMWIDTH-1:0] = s_axis_bram_111_tdata;
            assign s_axis_bram_111_tready = tready[111];
            
            assign bram_addr[111][0][S_AXIS_BRAM_111_ADDR_WIDTH-1:0] = ap_bram_111_addr0;
            assign bram_din[111][0][S_AXIS_BRAM_111_WIDTH-1:0] = ap_bram_111_din0;
            assign ap_bram_111_dout0 = bram_dout[111][0][S_AXIS_BRAM_111_WIDTH-1:0];
            assign bram_we[111][0][S_AXIS_BRAM_111_WIDTH/8-1:0] = ap_bram_111_we0;
            assign bram_en[111][0] = ap_bram_111_en0;
            assign bram_addr[111][1][S_AXIS_BRAM_111_ADDR_WIDTH-1:0] = ap_bram_111_addr1;
            assign bram_din[111][1][S_AXIS_BRAM_111_WIDTH-1:0] = ap_bram_111_din1;
            assign ap_bram_111_dout1 = bram_dout[111][1][S_AXIS_BRAM_111_WIDTH-1:0];
            assign bram_we[111][1][S_AXIS_BRAM_111_WIDTH/8-1:0] = ap_bram_111_we1;
            assign bram_en[111][1] = ap_bram_111_en1;
            
            assign out_clk[111] = m_axis_bramio_111_aclk;
            assign out_rst[111] = m_axis_bramio_111_aresetn;
            assign dwconv1_tready[111] = m_axis_bramio_111_tready;
            assign m_axis_bramio_111_tlast = dwconv1_tlast[111];
            assign m_axis_bramio_111_tvalid = dwconv1_tvalid[111];
            assign m_axis_bramio_111_tkeep = dwconv1_tkeep[111][M_AXIS_BRAMIO_111_DMWIDTH/8-1:0];
            assign m_axis_bramio_111_tstrb = dwconv1_tstrb[111][M_AXIS_BRAMIO_111_DMWIDTH/8-1:0];
            assign m_axis_bramio_111_tdata = dwconv1_tdata[111][M_AXIS_BRAMIO_111_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 112) begin
            assign in_clk[112] = s_axis_bram_112_aclk;
            assign in_rst[112] = s_axis_bram_112_aresetn;
            assign tlast[112] = s_axis_bram_112_tlast;
            assign tvalid[112] = s_axis_bram_112_tvalid;
            assign tkeep[112][S_AXIS_BRAM_112_DMWIDTH/8-1:0] = s_axis_bram_112_tkeep;
            assign tstrb[112][S_AXIS_BRAM_112_DMWIDTH/8-1:0] = s_axis_bram_112_tstrb;
            assign tdata[112][S_AXIS_BRAM_112_DMWIDTH-1:0] = s_axis_bram_112_tdata;
            assign s_axis_bram_112_tready = tready[112];
            
            assign bram_addr[112][0][S_AXIS_BRAM_112_ADDR_WIDTH-1:0] = ap_bram_112_addr0;
            assign bram_din[112][0][S_AXIS_BRAM_112_WIDTH-1:0] = ap_bram_112_din0;
            assign ap_bram_112_dout0 = bram_dout[112][0][S_AXIS_BRAM_112_WIDTH-1:0];
            assign bram_we[112][0][S_AXIS_BRAM_112_WIDTH/8-1:0] = ap_bram_112_we0;
            assign bram_en[112][0] = ap_bram_112_en0;
            assign bram_addr[112][1][S_AXIS_BRAM_112_ADDR_WIDTH-1:0] = ap_bram_112_addr1;
            assign bram_din[112][1][S_AXIS_BRAM_112_WIDTH-1:0] = ap_bram_112_din1;
            assign ap_bram_112_dout1 = bram_dout[112][1][S_AXIS_BRAM_112_WIDTH-1:0];
            assign bram_we[112][1][S_AXIS_BRAM_112_WIDTH/8-1:0] = ap_bram_112_we1;
            assign bram_en[112][1] = ap_bram_112_en1;
            
            assign out_clk[112] = m_axis_bramio_112_aclk;
            assign out_rst[112] = m_axis_bramio_112_aresetn;
            assign dwconv1_tready[112] = m_axis_bramio_112_tready;
            assign m_axis_bramio_112_tlast = dwconv1_tlast[112];
            assign m_axis_bramio_112_tvalid = dwconv1_tvalid[112];
            assign m_axis_bramio_112_tkeep = dwconv1_tkeep[112][M_AXIS_BRAMIO_112_DMWIDTH/8-1:0];
            assign m_axis_bramio_112_tstrb = dwconv1_tstrb[112][M_AXIS_BRAMIO_112_DMWIDTH/8-1:0];
            assign m_axis_bramio_112_tdata = dwconv1_tdata[112][M_AXIS_BRAMIO_112_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 113) begin
            assign in_clk[113] = s_axis_bram_113_aclk;
            assign in_rst[113] = s_axis_bram_113_aresetn;
            assign tlast[113] = s_axis_bram_113_tlast;
            assign tvalid[113] = s_axis_bram_113_tvalid;
            assign tkeep[113][S_AXIS_BRAM_113_DMWIDTH/8-1:0] = s_axis_bram_113_tkeep;
            assign tstrb[113][S_AXIS_BRAM_113_DMWIDTH/8-1:0] = s_axis_bram_113_tstrb;
            assign tdata[113][S_AXIS_BRAM_113_DMWIDTH-1:0] = s_axis_bram_113_tdata;
            assign s_axis_bram_113_tready = tready[113];
            
            assign bram_addr[113][0][S_AXIS_BRAM_113_ADDR_WIDTH-1:0] = ap_bram_113_addr0;
            assign bram_din[113][0][S_AXIS_BRAM_113_WIDTH-1:0] = ap_bram_113_din0;
            assign ap_bram_113_dout0 = bram_dout[113][0][S_AXIS_BRAM_113_WIDTH-1:0];
            assign bram_we[113][0][S_AXIS_BRAM_113_WIDTH/8-1:0] = ap_bram_113_we0;
            assign bram_en[113][0] = ap_bram_113_en0;
            assign bram_addr[113][1][S_AXIS_BRAM_113_ADDR_WIDTH-1:0] = ap_bram_113_addr1;
            assign bram_din[113][1][S_AXIS_BRAM_113_WIDTH-1:0] = ap_bram_113_din1;
            assign ap_bram_113_dout1 = bram_dout[113][1][S_AXIS_BRAM_113_WIDTH-1:0];
            assign bram_we[113][1][S_AXIS_BRAM_113_WIDTH/8-1:0] = ap_bram_113_we1;
            assign bram_en[113][1] = ap_bram_113_en1;
            
            assign out_clk[113] = m_axis_bramio_113_aclk;
            assign out_rst[113] = m_axis_bramio_113_aresetn;
            assign dwconv1_tready[113] = m_axis_bramio_113_tready;
            assign m_axis_bramio_113_tlast = dwconv1_tlast[113];
            assign m_axis_bramio_113_tvalid = dwconv1_tvalid[113];
            assign m_axis_bramio_113_tkeep = dwconv1_tkeep[113][M_AXIS_BRAMIO_113_DMWIDTH/8-1:0];
            assign m_axis_bramio_113_tstrb = dwconv1_tstrb[113][M_AXIS_BRAMIO_113_DMWIDTH/8-1:0];
            assign m_axis_bramio_113_tdata = dwconv1_tdata[113][M_AXIS_BRAMIO_113_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 114) begin
            assign in_clk[114] = s_axis_bram_114_aclk;
            assign in_rst[114] = s_axis_bram_114_aresetn;
            assign tlast[114] = s_axis_bram_114_tlast;
            assign tvalid[114] = s_axis_bram_114_tvalid;
            assign tkeep[114][S_AXIS_BRAM_114_DMWIDTH/8-1:0] = s_axis_bram_114_tkeep;
            assign tstrb[114][S_AXIS_BRAM_114_DMWIDTH/8-1:0] = s_axis_bram_114_tstrb;
            assign tdata[114][S_AXIS_BRAM_114_DMWIDTH-1:0] = s_axis_bram_114_tdata;
            assign s_axis_bram_114_tready = tready[114];
            
            assign bram_addr[114][0][S_AXIS_BRAM_114_ADDR_WIDTH-1:0] = ap_bram_114_addr0;
            assign bram_din[114][0][S_AXIS_BRAM_114_WIDTH-1:0] = ap_bram_114_din0;
            assign ap_bram_114_dout0 = bram_dout[114][0][S_AXIS_BRAM_114_WIDTH-1:0];
            assign bram_we[114][0][S_AXIS_BRAM_114_WIDTH/8-1:0] = ap_bram_114_we0;
            assign bram_en[114][0] = ap_bram_114_en0;
            assign bram_addr[114][1][S_AXIS_BRAM_114_ADDR_WIDTH-1:0] = ap_bram_114_addr1;
            assign bram_din[114][1][S_AXIS_BRAM_114_WIDTH-1:0] = ap_bram_114_din1;
            assign ap_bram_114_dout1 = bram_dout[114][1][S_AXIS_BRAM_114_WIDTH-1:0];
            assign bram_we[114][1][S_AXIS_BRAM_114_WIDTH/8-1:0] = ap_bram_114_we1;
            assign bram_en[114][1] = ap_bram_114_en1;
            
            assign out_clk[114] = m_axis_bramio_114_aclk;
            assign out_rst[114] = m_axis_bramio_114_aresetn;
            assign dwconv1_tready[114] = m_axis_bramio_114_tready;
            assign m_axis_bramio_114_tlast = dwconv1_tlast[114];
            assign m_axis_bramio_114_tvalid = dwconv1_tvalid[114];
            assign m_axis_bramio_114_tkeep = dwconv1_tkeep[114][M_AXIS_BRAMIO_114_DMWIDTH/8-1:0];
            assign m_axis_bramio_114_tstrb = dwconv1_tstrb[114][M_AXIS_BRAMIO_114_DMWIDTH/8-1:0];
            assign m_axis_bramio_114_tdata = dwconv1_tdata[114][M_AXIS_BRAMIO_114_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 115) begin
            assign in_clk[115] = s_axis_bram_115_aclk;
            assign in_rst[115] = s_axis_bram_115_aresetn;
            assign tlast[115] = s_axis_bram_115_tlast;
            assign tvalid[115] = s_axis_bram_115_tvalid;
            assign tkeep[115][S_AXIS_BRAM_115_DMWIDTH/8-1:0] = s_axis_bram_115_tkeep;
            assign tstrb[115][S_AXIS_BRAM_115_DMWIDTH/8-1:0] = s_axis_bram_115_tstrb;
            assign tdata[115][S_AXIS_BRAM_115_DMWIDTH-1:0] = s_axis_bram_115_tdata;
            assign s_axis_bram_115_tready = tready[115];
            
            assign bram_addr[115][0][S_AXIS_BRAM_115_ADDR_WIDTH-1:0] = ap_bram_115_addr0;
            assign bram_din[115][0][S_AXIS_BRAM_115_WIDTH-1:0] = ap_bram_115_din0;
            assign ap_bram_115_dout0 = bram_dout[115][0][S_AXIS_BRAM_115_WIDTH-1:0];
            assign bram_we[115][0][S_AXIS_BRAM_115_WIDTH/8-1:0] = ap_bram_115_we0;
            assign bram_en[115][0] = ap_bram_115_en0;
            assign bram_addr[115][1][S_AXIS_BRAM_115_ADDR_WIDTH-1:0] = ap_bram_115_addr1;
            assign bram_din[115][1][S_AXIS_BRAM_115_WIDTH-1:0] = ap_bram_115_din1;
            assign ap_bram_115_dout1 = bram_dout[115][1][S_AXIS_BRAM_115_WIDTH-1:0];
            assign bram_we[115][1][S_AXIS_BRAM_115_WIDTH/8-1:0] = ap_bram_115_we1;
            assign bram_en[115][1] = ap_bram_115_en1;
            
            assign out_clk[115] = m_axis_bramio_115_aclk;
            assign out_rst[115] = m_axis_bramio_115_aresetn;
            assign dwconv1_tready[115] = m_axis_bramio_115_tready;
            assign m_axis_bramio_115_tlast = dwconv1_tlast[115];
            assign m_axis_bramio_115_tvalid = dwconv1_tvalid[115];
            assign m_axis_bramio_115_tkeep = dwconv1_tkeep[115][M_AXIS_BRAMIO_115_DMWIDTH/8-1:0];
            assign m_axis_bramio_115_tstrb = dwconv1_tstrb[115][M_AXIS_BRAMIO_115_DMWIDTH/8-1:0];
            assign m_axis_bramio_115_tdata = dwconv1_tdata[115][M_AXIS_BRAMIO_115_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 116) begin
            assign in_clk[116] = s_axis_bram_116_aclk;
            assign in_rst[116] = s_axis_bram_116_aresetn;
            assign tlast[116] = s_axis_bram_116_tlast;
            assign tvalid[116] = s_axis_bram_116_tvalid;
            assign tkeep[116][S_AXIS_BRAM_116_DMWIDTH/8-1:0] = s_axis_bram_116_tkeep;
            assign tstrb[116][S_AXIS_BRAM_116_DMWIDTH/8-1:0] = s_axis_bram_116_tstrb;
            assign tdata[116][S_AXIS_BRAM_116_DMWIDTH-1:0] = s_axis_bram_116_tdata;
            assign s_axis_bram_116_tready = tready[116];
            
            assign bram_addr[116][0][S_AXIS_BRAM_116_ADDR_WIDTH-1:0] = ap_bram_116_addr0;
            assign bram_din[116][0][S_AXIS_BRAM_116_WIDTH-1:0] = ap_bram_116_din0;
            assign ap_bram_116_dout0 = bram_dout[116][0][S_AXIS_BRAM_116_WIDTH-1:0];
            assign bram_we[116][0][S_AXIS_BRAM_116_WIDTH/8-1:0] = ap_bram_116_we0;
            assign bram_en[116][0] = ap_bram_116_en0;
            assign bram_addr[116][1][S_AXIS_BRAM_116_ADDR_WIDTH-1:0] = ap_bram_116_addr1;
            assign bram_din[116][1][S_AXIS_BRAM_116_WIDTH-1:0] = ap_bram_116_din1;
            assign ap_bram_116_dout1 = bram_dout[116][1][S_AXIS_BRAM_116_WIDTH-1:0];
            assign bram_we[116][1][S_AXIS_BRAM_116_WIDTH/8-1:0] = ap_bram_116_we1;
            assign bram_en[116][1] = ap_bram_116_en1;
            
            assign out_clk[116] = m_axis_bramio_116_aclk;
            assign out_rst[116] = m_axis_bramio_116_aresetn;
            assign dwconv1_tready[116] = m_axis_bramio_116_tready;
            assign m_axis_bramio_116_tlast = dwconv1_tlast[116];
            assign m_axis_bramio_116_tvalid = dwconv1_tvalid[116];
            assign m_axis_bramio_116_tkeep = dwconv1_tkeep[116][M_AXIS_BRAMIO_116_DMWIDTH/8-1:0];
            assign m_axis_bramio_116_tstrb = dwconv1_tstrb[116][M_AXIS_BRAMIO_116_DMWIDTH/8-1:0];
            assign m_axis_bramio_116_tdata = dwconv1_tdata[116][M_AXIS_BRAMIO_116_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 117) begin
            assign in_clk[117] = s_axis_bram_117_aclk;
            assign in_rst[117] = s_axis_bram_117_aresetn;
            assign tlast[117] = s_axis_bram_117_tlast;
            assign tvalid[117] = s_axis_bram_117_tvalid;
            assign tkeep[117][S_AXIS_BRAM_117_DMWIDTH/8-1:0] = s_axis_bram_117_tkeep;
            assign tstrb[117][S_AXIS_BRAM_117_DMWIDTH/8-1:0] = s_axis_bram_117_tstrb;
            assign tdata[117][S_AXIS_BRAM_117_DMWIDTH-1:0] = s_axis_bram_117_tdata;
            assign s_axis_bram_117_tready = tready[117];
            
            assign bram_addr[117][0][S_AXIS_BRAM_117_ADDR_WIDTH-1:0] = ap_bram_117_addr0;
            assign bram_din[117][0][S_AXIS_BRAM_117_WIDTH-1:0] = ap_bram_117_din0;
            assign ap_bram_117_dout0 = bram_dout[117][0][S_AXIS_BRAM_117_WIDTH-1:0];
            assign bram_we[117][0][S_AXIS_BRAM_117_WIDTH/8-1:0] = ap_bram_117_we0;
            assign bram_en[117][0] = ap_bram_117_en0;
            assign bram_addr[117][1][S_AXIS_BRAM_117_ADDR_WIDTH-1:0] = ap_bram_117_addr1;
            assign bram_din[117][1][S_AXIS_BRAM_117_WIDTH-1:0] = ap_bram_117_din1;
            assign ap_bram_117_dout1 = bram_dout[117][1][S_AXIS_BRAM_117_WIDTH-1:0];
            assign bram_we[117][1][S_AXIS_BRAM_117_WIDTH/8-1:0] = ap_bram_117_we1;
            assign bram_en[117][1] = ap_bram_117_en1;
            
            assign out_clk[117] = m_axis_bramio_117_aclk;
            assign out_rst[117] = m_axis_bramio_117_aresetn;
            assign dwconv1_tready[117] = m_axis_bramio_117_tready;
            assign m_axis_bramio_117_tlast = dwconv1_tlast[117];
            assign m_axis_bramio_117_tvalid = dwconv1_tvalid[117];
            assign m_axis_bramio_117_tkeep = dwconv1_tkeep[117][M_AXIS_BRAMIO_117_DMWIDTH/8-1:0];
            assign m_axis_bramio_117_tstrb = dwconv1_tstrb[117][M_AXIS_BRAMIO_117_DMWIDTH/8-1:0];
            assign m_axis_bramio_117_tdata = dwconv1_tdata[117][M_AXIS_BRAMIO_117_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 118) begin
            assign in_clk[118] = s_axis_bram_118_aclk;
            assign in_rst[118] = s_axis_bram_118_aresetn;
            assign tlast[118] = s_axis_bram_118_tlast;
            assign tvalid[118] = s_axis_bram_118_tvalid;
            assign tkeep[118][S_AXIS_BRAM_118_DMWIDTH/8-1:0] = s_axis_bram_118_tkeep;
            assign tstrb[118][S_AXIS_BRAM_118_DMWIDTH/8-1:0] = s_axis_bram_118_tstrb;
            assign tdata[118][S_AXIS_BRAM_118_DMWIDTH-1:0] = s_axis_bram_118_tdata;
            assign s_axis_bram_118_tready = tready[118];
            
            assign bram_addr[118][0][S_AXIS_BRAM_118_ADDR_WIDTH-1:0] = ap_bram_118_addr0;
            assign bram_din[118][0][S_AXIS_BRAM_118_WIDTH-1:0] = ap_bram_118_din0;
            assign ap_bram_118_dout0 = bram_dout[118][0][S_AXIS_BRAM_118_WIDTH-1:0];
            assign bram_we[118][0][S_AXIS_BRAM_118_WIDTH/8-1:0] = ap_bram_118_we0;
            assign bram_en[118][0] = ap_bram_118_en0;
            assign bram_addr[118][1][S_AXIS_BRAM_118_ADDR_WIDTH-1:0] = ap_bram_118_addr1;
            assign bram_din[118][1][S_AXIS_BRAM_118_WIDTH-1:0] = ap_bram_118_din1;
            assign ap_bram_118_dout1 = bram_dout[118][1][S_AXIS_BRAM_118_WIDTH-1:0];
            assign bram_we[118][1][S_AXIS_BRAM_118_WIDTH/8-1:0] = ap_bram_118_we1;
            assign bram_en[118][1] = ap_bram_118_en1;
            
            assign out_clk[118] = m_axis_bramio_118_aclk;
            assign out_rst[118] = m_axis_bramio_118_aresetn;
            assign dwconv1_tready[118] = m_axis_bramio_118_tready;
            assign m_axis_bramio_118_tlast = dwconv1_tlast[118];
            assign m_axis_bramio_118_tvalid = dwconv1_tvalid[118];
            assign m_axis_bramio_118_tkeep = dwconv1_tkeep[118][M_AXIS_BRAMIO_118_DMWIDTH/8-1:0];
            assign m_axis_bramio_118_tstrb = dwconv1_tstrb[118][M_AXIS_BRAMIO_118_DMWIDTH/8-1:0];
            assign m_axis_bramio_118_tdata = dwconv1_tdata[118][M_AXIS_BRAMIO_118_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 119) begin
            assign in_clk[119] = s_axis_bram_119_aclk;
            assign in_rst[119] = s_axis_bram_119_aresetn;
            assign tlast[119] = s_axis_bram_119_tlast;
            assign tvalid[119] = s_axis_bram_119_tvalid;
            assign tkeep[119][S_AXIS_BRAM_119_DMWIDTH/8-1:0] = s_axis_bram_119_tkeep;
            assign tstrb[119][S_AXIS_BRAM_119_DMWIDTH/8-1:0] = s_axis_bram_119_tstrb;
            assign tdata[119][S_AXIS_BRAM_119_DMWIDTH-1:0] = s_axis_bram_119_tdata;
            assign s_axis_bram_119_tready = tready[119];
            
            assign bram_addr[119][0][S_AXIS_BRAM_119_ADDR_WIDTH-1:0] = ap_bram_119_addr0;
            assign bram_din[119][0][S_AXIS_BRAM_119_WIDTH-1:0] = ap_bram_119_din0;
            assign ap_bram_119_dout0 = bram_dout[119][0][S_AXIS_BRAM_119_WIDTH-1:0];
            assign bram_we[119][0][S_AXIS_BRAM_119_WIDTH/8-1:0] = ap_bram_119_we0;
            assign bram_en[119][0] = ap_bram_119_en0;
            assign bram_addr[119][1][S_AXIS_BRAM_119_ADDR_WIDTH-1:0] = ap_bram_119_addr1;
            assign bram_din[119][1][S_AXIS_BRAM_119_WIDTH-1:0] = ap_bram_119_din1;
            assign ap_bram_119_dout1 = bram_dout[119][1][S_AXIS_BRAM_119_WIDTH-1:0];
            assign bram_we[119][1][S_AXIS_BRAM_119_WIDTH/8-1:0] = ap_bram_119_we1;
            assign bram_en[119][1] = ap_bram_119_en1;
            
            assign out_clk[119] = m_axis_bramio_119_aclk;
            assign out_rst[119] = m_axis_bramio_119_aresetn;
            assign dwconv1_tready[119] = m_axis_bramio_119_tready;
            assign m_axis_bramio_119_tlast = dwconv1_tlast[119];
            assign m_axis_bramio_119_tvalid = dwconv1_tvalid[119];
            assign m_axis_bramio_119_tkeep = dwconv1_tkeep[119][M_AXIS_BRAMIO_119_DMWIDTH/8-1:0];
            assign m_axis_bramio_119_tstrb = dwconv1_tstrb[119][M_AXIS_BRAMIO_119_DMWIDTH/8-1:0];
            assign m_axis_bramio_119_tdata = dwconv1_tdata[119][M_AXIS_BRAMIO_119_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 120) begin
            assign in_clk[120] = s_axis_bram_120_aclk;
            assign in_rst[120] = s_axis_bram_120_aresetn;
            assign tlast[120] = s_axis_bram_120_tlast;
            assign tvalid[120] = s_axis_bram_120_tvalid;
            assign tkeep[120][S_AXIS_BRAM_120_DMWIDTH/8-1:0] = s_axis_bram_120_tkeep;
            assign tstrb[120][S_AXIS_BRAM_120_DMWIDTH/8-1:0] = s_axis_bram_120_tstrb;
            assign tdata[120][S_AXIS_BRAM_120_DMWIDTH-1:0] = s_axis_bram_120_tdata;
            assign s_axis_bram_120_tready = tready[120];
            
            assign bram_addr[120][0][S_AXIS_BRAM_120_ADDR_WIDTH-1:0] = ap_bram_120_addr0;
            assign bram_din[120][0][S_AXIS_BRAM_120_WIDTH-1:0] = ap_bram_120_din0;
            assign ap_bram_120_dout0 = bram_dout[120][0][S_AXIS_BRAM_120_WIDTH-1:0];
            assign bram_we[120][0][S_AXIS_BRAM_120_WIDTH/8-1:0] = ap_bram_120_we0;
            assign bram_en[120][0] = ap_bram_120_en0;
            assign bram_addr[120][1][S_AXIS_BRAM_120_ADDR_WIDTH-1:0] = ap_bram_120_addr1;
            assign bram_din[120][1][S_AXIS_BRAM_120_WIDTH-1:0] = ap_bram_120_din1;
            assign ap_bram_120_dout1 = bram_dout[120][1][S_AXIS_BRAM_120_WIDTH-1:0];
            assign bram_we[120][1][S_AXIS_BRAM_120_WIDTH/8-1:0] = ap_bram_120_we1;
            assign bram_en[120][1] = ap_bram_120_en1;
            
            assign out_clk[120] = m_axis_bramio_120_aclk;
            assign out_rst[120] = m_axis_bramio_120_aresetn;
            assign dwconv1_tready[120] = m_axis_bramio_120_tready;
            assign m_axis_bramio_120_tlast = dwconv1_tlast[120];
            assign m_axis_bramio_120_tvalid = dwconv1_tvalid[120];
            assign m_axis_bramio_120_tkeep = dwconv1_tkeep[120][M_AXIS_BRAMIO_120_DMWIDTH/8-1:0];
            assign m_axis_bramio_120_tstrb = dwconv1_tstrb[120][M_AXIS_BRAMIO_120_DMWIDTH/8-1:0];
            assign m_axis_bramio_120_tdata = dwconv1_tdata[120][M_AXIS_BRAMIO_120_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 121) begin
            assign in_clk[121] = s_axis_bram_121_aclk;
            assign in_rst[121] = s_axis_bram_121_aresetn;
            assign tlast[121] = s_axis_bram_121_tlast;
            assign tvalid[121] = s_axis_bram_121_tvalid;
            assign tkeep[121][S_AXIS_BRAM_121_DMWIDTH/8-1:0] = s_axis_bram_121_tkeep;
            assign tstrb[121][S_AXIS_BRAM_121_DMWIDTH/8-1:0] = s_axis_bram_121_tstrb;
            assign tdata[121][S_AXIS_BRAM_121_DMWIDTH-1:0] = s_axis_bram_121_tdata;
            assign s_axis_bram_121_tready = tready[121];
            
            assign bram_addr[121][0][S_AXIS_BRAM_121_ADDR_WIDTH-1:0] = ap_bram_121_addr0;
            assign bram_din[121][0][S_AXIS_BRAM_121_WIDTH-1:0] = ap_bram_121_din0;
            assign ap_bram_121_dout0 = bram_dout[121][0][S_AXIS_BRAM_121_WIDTH-1:0];
            assign bram_we[121][0][S_AXIS_BRAM_121_WIDTH/8-1:0] = ap_bram_121_we0;
            assign bram_en[121][0] = ap_bram_121_en0;
            assign bram_addr[121][1][S_AXIS_BRAM_121_ADDR_WIDTH-1:0] = ap_bram_121_addr1;
            assign bram_din[121][1][S_AXIS_BRAM_121_WIDTH-1:0] = ap_bram_121_din1;
            assign ap_bram_121_dout1 = bram_dout[121][1][S_AXIS_BRAM_121_WIDTH-1:0];
            assign bram_we[121][1][S_AXIS_BRAM_121_WIDTH/8-1:0] = ap_bram_121_we1;
            assign bram_en[121][1] = ap_bram_121_en1;
            
            assign out_clk[121] = m_axis_bramio_121_aclk;
            assign out_rst[121] = m_axis_bramio_121_aresetn;
            assign dwconv1_tready[121] = m_axis_bramio_121_tready;
            assign m_axis_bramio_121_tlast = dwconv1_tlast[121];
            assign m_axis_bramio_121_tvalid = dwconv1_tvalid[121];
            assign m_axis_bramio_121_tkeep = dwconv1_tkeep[121][M_AXIS_BRAMIO_121_DMWIDTH/8-1:0];
            assign m_axis_bramio_121_tstrb = dwconv1_tstrb[121][M_AXIS_BRAMIO_121_DMWIDTH/8-1:0];
            assign m_axis_bramio_121_tdata = dwconv1_tdata[121][M_AXIS_BRAMIO_121_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 122) begin
            assign in_clk[122] = s_axis_bram_122_aclk;
            assign in_rst[122] = s_axis_bram_122_aresetn;
            assign tlast[122] = s_axis_bram_122_tlast;
            assign tvalid[122] = s_axis_bram_122_tvalid;
            assign tkeep[122][S_AXIS_BRAM_122_DMWIDTH/8-1:0] = s_axis_bram_122_tkeep;
            assign tstrb[122][S_AXIS_BRAM_122_DMWIDTH/8-1:0] = s_axis_bram_122_tstrb;
            assign tdata[122][S_AXIS_BRAM_122_DMWIDTH-1:0] = s_axis_bram_122_tdata;
            assign s_axis_bram_122_tready = tready[122];
            
            assign bram_addr[122][0][S_AXIS_BRAM_122_ADDR_WIDTH-1:0] = ap_bram_122_addr0;
            assign bram_din[122][0][S_AXIS_BRAM_122_WIDTH-1:0] = ap_bram_122_din0;
            assign ap_bram_122_dout0 = bram_dout[122][0][S_AXIS_BRAM_122_WIDTH-1:0];
            assign bram_we[122][0][S_AXIS_BRAM_122_WIDTH/8-1:0] = ap_bram_122_we0;
            assign bram_en[122][0] = ap_bram_122_en0;
            assign bram_addr[122][1][S_AXIS_BRAM_122_ADDR_WIDTH-1:0] = ap_bram_122_addr1;
            assign bram_din[122][1][S_AXIS_BRAM_122_WIDTH-1:0] = ap_bram_122_din1;
            assign ap_bram_122_dout1 = bram_dout[122][1][S_AXIS_BRAM_122_WIDTH-1:0];
            assign bram_we[122][1][S_AXIS_BRAM_122_WIDTH/8-1:0] = ap_bram_122_we1;
            assign bram_en[122][1] = ap_bram_122_en1;
            
            assign out_clk[122] = m_axis_bramio_122_aclk;
            assign out_rst[122] = m_axis_bramio_122_aresetn;
            assign dwconv1_tready[122] = m_axis_bramio_122_tready;
            assign m_axis_bramio_122_tlast = dwconv1_tlast[122];
            assign m_axis_bramio_122_tvalid = dwconv1_tvalid[122];
            assign m_axis_bramio_122_tkeep = dwconv1_tkeep[122][M_AXIS_BRAMIO_122_DMWIDTH/8-1:0];
            assign m_axis_bramio_122_tstrb = dwconv1_tstrb[122][M_AXIS_BRAMIO_122_DMWIDTH/8-1:0];
            assign m_axis_bramio_122_tdata = dwconv1_tdata[122][M_AXIS_BRAMIO_122_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 123) begin
            assign in_clk[123] = s_axis_bram_123_aclk;
            assign in_rst[123] = s_axis_bram_123_aresetn;
            assign tlast[123] = s_axis_bram_123_tlast;
            assign tvalid[123] = s_axis_bram_123_tvalid;
            assign tkeep[123][S_AXIS_BRAM_123_DMWIDTH/8-1:0] = s_axis_bram_123_tkeep;
            assign tstrb[123][S_AXIS_BRAM_123_DMWIDTH/8-1:0] = s_axis_bram_123_tstrb;
            assign tdata[123][S_AXIS_BRAM_123_DMWIDTH-1:0] = s_axis_bram_123_tdata;
            assign s_axis_bram_123_tready = tready[123];
            
            assign bram_addr[123][0][S_AXIS_BRAM_123_ADDR_WIDTH-1:0] = ap_bram_123_addr0;
            assign bram_din[123][0][S_AXIS_BRAM_123_WIDTH-1:0] = ap_bram_123_din0;
            assign ap_bram_123_dout0 = bram_dout[123][0][S_AXIS_BRAM_123_WIDTH-1:0];
            assign bram_we[123][0][S_AXIS_BRAM_123_WIDTH/8-1:0] = ap_bram_123_we0;
            assign bram_en[123][0] = ap_bram_123_en0;
            assign bram_addr[123][1][S_AXIS_BRAM_123_ADDR_WIDTH-1:0] = ap_bram_123_addr1;
            assign bram_din[123][1][S_AXIS_BRAM_123_WIDTH-1:0] = ap_bram_123_din1;
            assign ap_bram_123_dout1 = bram_dout[123][1][S_AXIS_BRAM_123_WIDTH-1:0];
            assign bram_we[123][1][S_AXIS_BRAM_123_WIDTH/8-1:0] = ap_bram_123_we1;
            assign bram_en[123][1] = ap_bram_123_en1;
            
            assign out_clk[123] = m_axis_bramio_123_aclk;
            assign out_rst[123] = m_axis_bramio_123_aresetn;
            assign dwconv1_tready[123] = m_axis_bramio_123_tready;
            assign m_axis_bramio_123_tlast = dwconv1_tlast[123];
            assign m_axis_bramio_123_tvalid = dwconv1_tvalid[123];
            assign m_axis_bramio_123_tkeep = dwconv1_tkeep[123][M_AXIS_BRAMIO_123_DMWIDTH/8-1:0];
            assign m_axis_bramio_123_tstrb = dwconv1_tstrb[123][M_AXIS_BRAMIO_123_DMWIDTH/8-1:0];
            assign m_axis_bramio_123_tdata = dwconv1_tdata[123][M_AXIS_BRAMIO_123_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 124) begin
            assign in_clk[124] = s_axis_bram_124_aclk;
            assign in_rst[124] = s_axis_bram_124_aresetn;
            assign tlast[124] = s_axis_bram_124_tlast;
            assign tvalid[124] = s_axis_bram_124_tvalid;
            assign tkeep[124][S_AXIS_BRAM_124_DMWIDTH/8-1:0] = s_axis_bram_124_tkeep;
            assign tstrb[124][S_AXIS_BRAM_124_DMWIDTH/8-1:0] = s_axis_bram_124_tstrb;
            assign tdata[124][S_AXIS_BRAM_124_DMWIDTH-1:0] = s_axis_bram_124_tdata;
            assign s_axis_bram_124_tready = tready[124];
            
            assign bram_addr[124][0][S_AXIS_BRAM_124_ADDR_WIDTH-1:0] = ap_bram_124_addr0;
            assign bram_din[124][0][S_AXIS_BRAM_124_WIDTH-1:0] = ap_bram_124_din0;
            assign ap_bram_124_dout0 = bram_dout[124][0][S_AXIS_BRAM_124_WIDTH-1:0];
            assign bram_we[124][0][S_AXIS_BRAM_124_WIDTH/8-1:0] = ap_bram_124_we0;
            assign bram_en[124][0] = ap_bram_124_en0;
            assign bram_addr[124][1][S_AXIS_BRAM_124_ADDR_WIDTH-1:0] = ap_bram_124_addr1;
            assign bram_din[124][1][S_AXIS_BRAM_124_WIDTH-1:0] = ap_bram_124_din1;
            assign ap_bram_124_dout1 = bram_dout[124][1][S_AXIS_BRAM_124_WIDTH-1:0];
            assign bram_we[124][1][S_AXIS_BRAM_124_WIDTH/8-1:0] = ap_bram_124_we1;
            assign bram_en[124][1] = ap_bram_124_en1;
            
            assign out_clk[124] = m_axis_bramio_124_aclk;
            assign out_rst[124] = m_axis_bramio_124_aresetn;
            assign dwconv1_tready[124] = m_axis_bramio_124_tready;
            assign m_axis_bramio_124_tlast = dwconv1_tlast[124];
            assign m_axis_bramio_124_tvalid = dwconv1_tvalid[124];
            assign m_axis_bramio_124_tkeep = dwconv1_tkeep[124][M_AXIS_BRAMIO_124_DMWIDTH/8-1:0];
            assign m_axis_bramio_124_tstrb = dwconv1_tstrb[124][M_AXIS_BRAMIO_124_DMWIDTH/8-1:0];
            assign m_axis_bramio_124_tdata = dwconv1_tdata[124][M_AXIS_BRAMIO_124_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 125) begin
            assign in_clk[125] = s_axis_bram_125_aclk;
            assign in_rst[125] = s_axis_bram_125_aresetn;
            assign tlast[125] = s_axis_bram_125_tlast;
            assign tvalid[125] = s_axis_bram_125_tvalid;
            assign tkeep[125][S_AXIS_BRAM_125_DMWIDTH/8-1:0] = s_axis_bram_125_tkeep;
            assign tstrb[125][S_AXIS_BRAM_125_DMWIDTH/8-1:0] = s_axis_bram_125_tstrb;
            assign tdata[125][S_AXIS_BRAM_125_DMWIDTH-1:0] = s_axis_bram_125_tdata;
            assign s_axis_bram_125_tready = tready[125];
            
            assign bram_addr[125][0][S_AXIS_BRAM_125_ADDR_WIDTH-1:0] = ap_bram_125_addr0;
            assign bram_din[125][0][S_AXIS_BRAM_125_WIDTH-1:0] = ap_bram_125_din0;
            assign ap_bram_125_dout0 = bram_dout[125][0][S_AXIS_BRAM_125_WIDTH-1:0];
            assign bram_we[125][0][S_AXIS_BRAM_125_WIDTH/8-1:0] = ap_bram_125_we0;
            assign bram_en[125][0] = ap_bram_125_en0;
            assign bram_addr[125][1][S_AXIS_BRAM_125_ADDR_WIDTH-1:0] = ap_bram_125_addr1;
            assign bram_din[125][1][S_AXIS_BRAM_125_WIDTH-1:0] = ap_bram_125_din1;
            assign ap_bram_125_dout1 = bram_dout[125][1][S_AXIS_BRAM_125_WIDTH-1:0];
            assign bram_we[125][1][S_AXIS_BRAM_125_WIDTH/8-1:0] = ap_bram_125_we1;
            assign bram_en[125][1] = ap_bram_125_en1;
            
            assign out_clk[125] = m_axis_bramio_125_aclk;
            assign out_rst[125] = m_axis_bramio_125_aresetn;
            assign dwconv1_tready[125] = m_axis_bramio_125_tready;
            assign m_axis_bramio_125_tlast = dwconv1_tlast[125];
            assign m_axis_bramio_125_tvalid = dwconv1_tvalid[125];
            assign m_axis_bramio_125_tkeep = dwconv1_tkeep[125][M_AXIS_BRAMIO_125_DMWIDTH/8-1:0];
            assign m_axis_bramio_125_tstrb = dwconv1_tstrb[125][M_AXIS_BRAMIO_125_DMWIDTH/8-1:0];
            assign m_axis_bramio_125_tdata = dwconv1_tdata[125][M_AXIS_BRAMIO_125_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 126) begin
            assign in_clk[126] = s_axis_bram_126_aclk;
            assign in_rst[126] = s_axis_bram_126_aresetn;
            assign tlast[126] = s_axis_bram_126_tlast;
            assign tvalid[126] = s_axis_bram_126_tvalid;
            assign tkeep[126][S_AXIS_BRAM_126_DMWIDTH/8-1:0] = s_axis_bram_126_tkeep;
            assign tstrb[126][S_AXIS_BRAM_126_DMWIDTH/8-1:0] = s_axis_bram_126_tstrb;
            assign tdata[126][S_AXIS_BRAM_126_DMWIDTH-1:0] = s_axis_bram_126_tdata;
            assign s_axis_bram_126_tready = tready[126];
            
            assign bram_addr[126][0][S_AXIS_BRAM_126_ADDR_WIDTH-1:0] = ap_bram_126_addr0;
            assign bram_din[126][0][S_AXIS_BRAM_126_WIDTH-1:0] = ap_bram_126_din0;
            assign ap_bram_126_dout0 = bram_dout[126][0][S_AXIS_BRAM_126_WIDTH-1:0];
            assign bram_we[126][0][S_AXIS_BRAM_126_WIDTH/8-1:0] = ap_bram_126_we0;
            assign bram_en[126][0] = ap_bram_126_en0;
            assign bram_addr[126][1][S_AXIS_BRAM_126_ADDR_WIDTH-1:0] = ap_bram_126_addr1;
            assign bram_din[126][1][S_AXIS_BRAM_126_WIDTH-1:0] = ap_bram_126_din1;
            assign ap_bram_126_dout1 = bram_dout[126][1][S_AXIS_BRAM_126_WIDTH-1:0];
            assign bram_we[126][1][S_AXIS_BRAM_126_WIDTH/8-1:0] = ap_bram_126_we1;
            assign bram_en[126][1] = ap_bram_126_en1;
            
            assign out_clk[126] = m_axis_bramio_126_aclk;
            assign out_rst[126] = m_axis_bramio_126_aresetn;
            assign dwconv1_tready[126] = m_axis_bramio_126_tready;
            assign m_axis_bramio_126_tlast = dwconv1_tlast[126];
            assign m_axis_bramio_126_tvalid = dwconv1_tvalid[126];
            assign m_axis_bramio_126_tkeep = dwconv1_tkeep[126][M_AXIS_BRAMIO_126_DMWIDTH/8-1:0];
            assign m_axis_bramio_126_tstrb = dwconv1_tstrb[126][M_AXIS_BRAMIO_126_DMWIDTH/8-1:0];
            assign m_axis_bramio_126_tdata = dwconv1_tdata[126][M_AXIS_BRAMIO_126_DMWIDTH-1:0];
        end
        if(C_NUM_INPUT_BRAMs > 127) begin
            assign in_clk[127] = s_axis_bram_127_aclk;
            assign in_rst[127] = s_axis_bram_127_aresetn;
            assign tlast[127] = s_axis_bram_127_tlast;
            assign tvalid[127] = s_axis_bram_127_tvalid;
            assign tkeep[127][S_AXIS_BRAM_127_DMWIDTH/8-1:0] = s_axis_bram_127_tkeep;
            assign tstrb[127][S_AXIS_BRAM_127_DMWIDTH/8-1:0] = s_axis_bram_127_tstrb;
            assign tdata[127][S_AXIS_BRAM_127_DMWIDTH-1:0] = s_axis_bram_127_tdata;
            assign s_axis_bram_127_tready = tready[127];
            
            assign bram_addr[127][0][S_AXIS_BRAM_127_ADDR_WIDTH-1:0] = ap_bram_127_addr0;
            assign bram_din[127][0][S_AXIS_BRAM_127_WIDTH-1:0] = ap_bram_127_din0;
            assign ap_bram_127_dout0 = bram_dout[127][0][S_AXIS_BRAM_127_WIDTH-1:0];
            assign bram_we[127][0][S_AXIS_BRAM_127_WIDTH/8-1:0] = ap_bram_127_we0;
            assign bram_en[127][0] = ap_bram_127_en0;
            assign bram_addr[127][1][S_AXIS_BRAM_127_ADDR_WIDTH-1:0] = ap_bram_127_addr1;
            assign bram_din[127][1][S_AXIS_BRAM_127_WIDTH-1:0] = ap_bram_127_din1;
            assign ap_bram_127_dout1 = bram_dout[127][1][S_AXIS_BRAM_127_WIDTH-1:0];
            assign bram_we[127][1][S_AXIS_BRAM_127_WIDTH/8-1:0] = ap_bram_127_we1;
            assign bram_en[127][1] = ap_bram_127_en1;
            
            assign out_clk[127] = m_axis_bramio_127_aclk;
            assign out_rst[127] = m_axis_bramio_127_aresetn;
            assign dwconv1_tready[127] = m_axis_bramio_127_tready;
            assign m_axis_bramio_127_tlast = dwconv1_tlast[127];
            assign m_axis_bramio_127_tvalid = dwconv1_tvalid[127];
            assign m_axis_bramio_127_tkeep = dwconv1_tkeep[127][M_AXIS_BRAMIO_127_DMWIDTH/8-1:0];
            assign m_axis_bramio_127_tstrb = dwconv1_tstrb[127][M_AXIS_BRAMIO_127_DMWIDTH/8-1:0];
            assign m_axis_bramio_127_tdata = dwconv1_tdata[127][M_AXIS_BRAMIO_127_DMWIDTH-1:0];
        end
    endgenerate
    
    //instantiate the axis2fifo modules
    genvar idx;
    generate
        for(idx=0; idx<C_NUM_INPUT_BRAMs; idx=idx+1) begin: IN_FIFO_GEN
            //check if data width converter is needed
            if(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx] != C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]) begin
                 axis_dwidth_converter_v1_1_9_axis_dwidth_converter #(
                    .C_S_AXIS_TDATA_WIDTH(C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                    .C_M_AXIS_TDATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                    .C_AXIS_TID_WIDTH(1),
                    .C_AXIS_TDEST_WIDTH(1),
                    .C_S_AXIS_TUSER_WIDTH(1),
                    .C_M_AXIS_TUSER_WIDTH(1),
                    .C_AXIS_SIGNAL_SET(32'h1F)  //Enabled: TLAST, TKEEP, TSTRB, TDATA, TREADY
                ) data_width_conv_0i (
                    .aclk(in_clk[idx]),
                    .aresetn(in_rst[idx]),
                    .aclken(1'b1),
                    .s_axis_tvalid(tvalid[idx]),
                    .s_axis_tready(tready[idx]),
                    .s_axis_tdata(tdata[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                    .s_axis_tstrb(tstrb[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                    .s_axis_tkeep(tkeep[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                    .s_axis_tlast(tlast[idx]),
//                    .s_axis_tid(),
//                    .s_axis_tdest(),
//                    .s_axis_tuser(),
                    .m_axis_tvalid(dwconv0_tvalid[idx]),
                    .m_axis_tready(dwconv0_tready[idx]),
                    .m_axis_tdata(dwconv0_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
//                    .m_axis_tstrb(),
//                    .m_axis_tkeep(),
                    .m_axis_tlast(dwconv0_tlast[idx])
//                    .m_axis_tid(),
//                    .m_axis_tdest(),
//                    .m_axis_tuser()
                );
                
                if( C_INOUT_BIT_ARRAY[idx] ) begin
                    axis_dwidth_converter_v1_1_9_axis_dwidth_converter #(
                        .C_S_AXIS_TDATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                        .C_M_AXIS_TDATA_WIDTH(C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                        .C_AXIS_TID_WIDTH(1),
                        .C_AXIS_TDEST_WIDTH(1),
                        .C_S_AXIS_TUSER_WIDTH(1),
                        .C_M_AXIS_TUSER_WIDTH(1),
                        .C_AXIS_SIGNAL_SET(32'h1F)  //Enabled: TLAST, TKEEP, TSTRB, TDATA, TREADY
                    ) data_width_conv_1i (
                        .aclk(out_clk[idx]),
                        .aresetn(out_rst[idx]),
                        .aclken(1'b1),
                        .s_axis_tvalid(buf1_tvalid[idx]),
                        .s_axis_tready(buf1_tready[idx]),
                        .s_axis_tdata(buf1_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                        .s_axis_tstrb({C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}}),
                        .s_axis_tkeep({C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}}),
                        .s_axis_tlast(buf1_tlast[idx]),
                        .m_axis_tvalid(dwconv1_tvalid[idx]),
                        .m_axis_tready(dwconv1_tready[idx]),
                        .m_axis_tdata(dwconv1_tdata[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                        .m_axis_tstrb(dwconv1_tkeep[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                        .m_axis_tkeep(dwconv1_tstrb[idx][C_DMWIDTH_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                        .m_axis_tlast(dwconv1_tlast[idx])
                    );
                end
            end
            else begin
                //if no buffering, wire the input signals straight through
                assign dwconv0_tlast[idx] = tlast[idx];
                assign dwconv0_tvalid[idx] = tvalid[idx];
                assign tready[idx] = dwconv0_tready[idx];   //output
                assign dwconv0_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0] = tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0];

                assign dwconv1_tlast[idx] = buf1_tlast[idx];
                assign dwconv1_tvalid[idx] = buf1_tvalid[idx];
                assign buf1_tready[idx] = dwconv1_tready[idx];   //input
                assign dwconv1_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0] = buf1_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0];
                assign dwconv1_tkeep[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0] = {C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}};
                assign dwconv1_tstrb[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0] = {C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}};
            end
            
            if( C_IN_ASYNC_BIT_ARRAY[idx] == 0 ) begin
                //use fifo
                axis_fifo #(
                    .C_DATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                    .C_DATA_DEPTH(16),
                    .C_IS_ASYNC(C_IN_ASYNC_BIT_ARRAY[32*(idx+1)-1:32*idx])
                ) axis_fifo0_i (
                    .aresetn(in_rst[idx]),
                    .inclk(in_clk[idx]), 
                    .in_tdata(dwconv0_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                    .in_tlast(dwconv0_tlast[idx]),  
                    .in_tvalid(dwconv0_tvalid[idx]),
                    .in_tready(dwconv0_tready[idx]),
                    .outclk(acc_clk), 
                    .out_tdata(buf0_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                    .out_tready(buf0_tready[idx]),
                    .out_tvalid(buf0_tvalid[idx]),
                    .out_tlast(buf0_tlast[idx])
                );
            end
            else begin
                //if not, wire the input signals straight through
                assign buf0_tlast[idx] = dwconv0_tlast[idx];
                assign buf0_tvalid[idx] = dwconv0_tvalid[idx];
                assign dwconv0_tready[idx] = buf0_tready[idx];   //output
                assign buf0_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0] = dwconv0_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0];
            end
            
            if( C_INOUT_BIT_ARRAY[idx] ) begin
                if( C_OUT_ASYNC_BIT_ARRAY[idx] == 0 ) begin
                    axis_fifo #(
                        .C_DATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                        .C_DATA_DEPTH(16),
                        .C_IS_ASYNC(C_OUT_ASYNC_BIT_ARRAY[32*(idx+1)-1:32*idx])
                    ) axis_fifo1_i (
                        .aresetn(acc_aresetn),
                        .inclk(acc_clk),
                        .in_tdata(out_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                        .in_tlast(out_tlast[idx]),  
                        .in_tvalid(out_tvalid[idx]),
                        .in_tready(out_tready[idx]),
                        .outclk(out_clk[idx]), 
                        .out_tdata(buf1_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                        .out_tready(buf1_tready[idx]),
                        .out_tvalid(buf1_tvalid[idx]),
                        .out_tlast(buf1_tlast[idx])
                    );
                end
                else begin
                    //if not, wire the input signals straight through
                    assign buf1_tlast[idx] = out_tlast[idx];
                    assign buf1_tvalid[idx] = out_tvalid[idx];
                    assign out_tready[idx] = buf1_tready[idx];   //output
                    assign buf1_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0] = out_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0];
                end
            end
            
            axis2bram #( 
                .C_S_AXIS_DATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_M_AXIS_DATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_BRAM_DATA_DEPTH(C_DEPTH_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_BRAM_DATA_WIDTH(C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_IS_INOUT(C_INOUT_BIT_ARRAY[idx:idx]),
                .C_MB_DEPTH(C_MB_DEPTH_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_BRAM_ADDR_WIDTH(C_ADDR_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .C_NUM_PORTS(C_PORTS_BIT_ARRAY[32*(idx+1)-1:32*idx])
            ) axis2bram_i (
                .ACC_CLK(acc_clk),
                .ARESETN(acc_aresetn),
                .CTRL_ACC_START(acc_start),
                .CTRL_ACC_DONE(acc_done),
                .CTRL_INREADY(in_bram_ready[idx]),
                .CTRL_OUTREADY(inout_bram_ready[idx]),
                //.AXI Stream interface
                .S_AXIS_TLAST(buf0_tlast[idx]),
                .S_AXIS_TVALID(buf0_tvalid[idx]),
                .S_AXIS_TDATA(buf0_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .S_AXIS_TREADY(buf0_tready[idx]),
                //.AXI Stream interface
                .M_AXIS_TLAST(out_tlast[idx]),
                .M_AXIS_TVALID(out_tvalid[idx]),
                .M_AXIS_TDATA(out_tdata[idx][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .M_AXIS_TREADY(out_tready[idx]),
                //ACC BRAM IF-0
                .bram0_addr(bram_addr[idx][0][C_ADDR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram0_din(bram_din[idx][0][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram0_dout(bram_dout[idx][0][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram0_we(bram_we[idx][0][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                .bram0_en(bram_en[idx][0]),
                //ACC BRAM IF-1
                .bram1_addr(bram_addr[idx][1][C_ADDR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram1_din(bram_din[idx][1][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram1_dout(bram_dout[idx][1][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .bram1_we(bram_we[idx][1][C_INBRAM_BIT_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                .bram1_en(bram_en[idx][1])
            );
        end
    endgenerate
endmodule
