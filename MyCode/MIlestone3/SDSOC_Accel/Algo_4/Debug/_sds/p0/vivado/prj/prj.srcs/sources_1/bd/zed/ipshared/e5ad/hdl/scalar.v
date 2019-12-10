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

module scalar #(
    parameter C_NUM_INSCALARS = 0,
    parameter C_NUM_OUTSCALARS = 0,
    parameter C_FIFO_DEPTH = 16,
    parameter C_HAS_RETURN = 0,
    
    parameter [31:0] C_INSCALAR_0_BITS = 32,
    parameter [31:0] C_INSCALAR_1_BITS = 32,
    parameter [31:0] C_INSCALAR_2_BITS = 32,
    parameter [31:0] C_INSCALAR_3_BITS = 32,
    parameter [31:0] C_INSCALAR_4_BITS = 32,
    parameter [31:0] C_INSCALAR_5_BITS = 32,
    parameter [31:0] C_INSCALAR_6_BITS = 32,
    parameter [31:0] C_INSCALAR_7_BITS = 32,
    parameter [31:0] C_INSCALAR_8_BITS = 32,
    parameter [31:0] C_INSCALAR_9_BITS = 32,
    parameter [31:0] C_INSCALAR_10_BITS = 32,
    parameter [31:0] C_INSCALAR_11_BITS = 32,
    parameter [31:0] C_INSCALAR_12_BITS = 32,
    parameter [31:0] C_INSCALAR_13_BITS = 32,
    parameter [31:0] C_INSCALAR_14_BITS = 32,
    parameter [31:0] C_INSCALAR_15_BITS = 32,
    parameter [31:0] C_INSCALAR_16_BITS = 32,
    parameter [31:0] C_INSCALAR_17_BITS = 32,
    parameter [31:0] C_INSCALAR_18_BITS = 32,
    parameter [31:0] C_INSCALAR_19_BITS = 32,
    parameter [31:0] C_INSCALAR_20_BITS = 32,
    parameter [31:0] C_INSCALAR_21_BITS = 32,
    parameter [31:0] C_INSCALAR_22_BITS = 32,
    parameter [31:0] C_INSCALAR_23_BITS = 32,
    parameter [31:0] C_INSCALAR_24_BITS = 32,
    parameter [31:0] C_INSCALAR_25_BITS = 32,
    parameter [31:0] C_INSCALAR_26_BITS = 32,
    parameter [31:0] C_INSCALAR_27_BITS = 32,
    parameter [31:0] C_INSCALAR_28_BITS = 32,
    parameter [31:0] C_INSCALAR_29_BITS = 32,
    parameter [31:0] C_INSCALAR_30_BITS = 32,
    parameter [31:0] C_INSCALAR_31_BITS = 32,
    parameter [31:0] C_INSCALAR_32_BITS = 32,
    parameter [31:0] C_INSCALAR_33_BITS = 32,
    parameter [31:0] C_INSCALAR_34_BITS = 32,
    parameter [31:0] C_INSCALAR_35_BITS = 32,
    parameter [31:0] C_INSCALAR_36_BITS = 32,
    parameter [31:0] C_INSCALAR_37_BITS = 32,
    parameter [31:0] C_INSCALAR_38_BITS = 32,
    parameter [31:0] C_INSCALAR_39_BITS = 32,
    parameter [31:0] C_INSCALAR_40_BITS = 32,
    parameter [31:0] C_INSCALAR_41_BITS = 32,
    parameter [31:0] C_INSCALAR_42_BITS = 32,
    parameter [31:0] C_INSCALAR_43_BITS = 32,
    parameter [31:0] C_INSCALAR_44_BITS = 32,
    parameter [31:0] C_INSCALAR_45_BITS = 32,
    parameter [31:0] C_INSCALAR_46_BITS = 32,
    parameter [31:0] C_INSCALAR_47_BITS = 32,
    parameter [31:0] C_INSCALAR_48_BITS = 32,
    parameter [31:0] C_INSCALAR_49_BITS = 32,
    parameter [31:0] C_INSCALAR_50_BITS = 32,
    parameter [31:0] C_INSCALAR_51_BITS = 32,
    parameter [31:0] C_INSCALAR_52_BITS = 32,
    parameter [31:0] C_INSCALAR_53_BITS = 32,
    parameter [31:0] C_INSCALAR_54_BITS = 32,
    parameter [31:0] C_INSCALAR_55_BITS = 32,
    parameter [31:0] C_INSCALAR_56_BITS = 32,
    parameter [31:0] C_INSCALAR_57_BITS = 32,
    parameter [31:0] C_INSCALAR_58_BITS = 32,
    parameter [31:0] C_INSCALAR_59_BITS = 32,
    parameter [31:0] C_INSCALAR_60_BITS = 32,
    parameter [31:0] C_INSCALAR_61_BITS = 32,
    parameter [31:0] C_INSCALAR_62_BITS = 32,
    parameter [31:0] C_INSCALAR_63_BITS = 32,
    parameter [31:0] C_INSCALAR_64_BITS = 32,
    parameter [31:0] C_INSCALAR_65_BITS = 32,
    parameter [31:0] C_INSCALAR_66_BITS = 32,
    parameter [31:0] C_INSCALAR_67_BITS = 32,
    parameter [31:0] C_INSCALAR_68_BITS = 32,
    parameter [31:0] C_INSCALAR_69_BITS = 32,
    parameter [31:0] C_INSCALAR_70_BITS = 32,
    parameter [31:0] C_INSCALAR_71_BITS = 32,
    parameter [31:0] C_INSCALAR_72_BITS = 32,
    parameter [31:0] C_INSCALAR_73_BITS = 32,
    parameter [31:0] C_INSCALAR_74_BITS = 32,
    parameter [31:0] C_INSCALAR_75_BITS = 32,
    parameter [31:0] C_INSCALAR_76_BITS = 32,
    parameter [31:0] C_INSCALAR_77_BITS = 32,
    parameter [31:0] C_INSCALAR_78_BITS = 32,
    parameter [31:0] C_INSCALAR_79_BITS = 32,
    parameter [31:0] C_INSCALAR_80_BITS = 32,
    parameter [31:0] C_INSCALAR_81_BITS = 32,
    parameter [31:0] C_INSCALAR_82_BITS = 32,
    parameter [31:0] C_INSCALAR_83_BITS = 32,
    parameter [31:0] C_INSCALAR_84_BITS = 32,
    parameter [31:0] C_INSCALAR_85_BITS = 32,
    parameter [31:0] C_INSCALAR_86_BITS = 32,
    parameter [31:0] C_INSCALAR_87_BITS = 32,
    parameter [31:0] C_INSCALAR_88_BITS = 32,
    parameter [31:0] C_INSCALAR_89_BITS = 32,
    parameter [31:0] C_INSCALAR_90_BITS = 32,
    parameter [31:0] C_INSCALAR_91_BITS = 32,
    parameter [31:0] C_INSCALAR_92_BITS = 32,
    parameter [31:0] C_INSCALAR_93_BITS = 32,
    parameter [31:0] C_INSCALAR_94_BITS = 32,
    parameter [31:0] C_INSCALAR_95_BITS = 32,
    parameter [31:0] C_INSCALAR_96_BITS = 32,
    parameter [31:0] C_INSCALAR_97_BITS = 32,
    parameter [31:0] C_INSCALAR_98_BITS = 32,
    parameter [31:0] C_INSCALAR_99_BITS = 32,
    parameter [31:0] C_INSCALAR_100_BITS = 32,
    parameter [31:0] C_INSCALAR_101_BITS = 32,
    parameter [31:0] C_INSCALAR_102_BITS = 32,
    parameter [31:0] C_INSCALAR_103_BITS = 32,
    parameter [31:0] C_INSCALAR_104_BITS = 32,
    parameter [31:0] C_INSCALAR_105_BITS = 32,
    parameter [31:0] C_INSCALAR_106_BITS = 32,
    parameter [31:0] C_INSCALAR_107_BITS = 32,
    parameter [31:0] C_INSCALAR_108_BITS = 32,
    parameter [31:0] C_INSCALAR_109_BITS = 32,
    parameter [31:0] C_INSCALAR_110_BITS = 32,
    parameter [31:0] C_INSCALAR_111_BITS = 32,
    parameter [31:0] C_INSCALAR_112_BITS = 32,
    parameter [31:0] C_INSCALAR_113_BITS = 32,
    parameter [31:0] C_INSCALAR_114_BITS = 32,
    parameter [31:0] C_INSCALAR_115_BITS = 32,
    parameter [31:0] C_INSCALAR_116_BITS = 32,
    parameter [31:0] C_INSCALAR_117_BITS = 32,
    parameter [31:0] C_INSCALAR_118_BITS = 32,
    parameter [31:0] C_INSCALAR_119_BITS = 32,
    parameter [31:0] C_INSCALAR_120_BITS = 32,
    parameter [31:0] C_INSCALAR_121_BITS = 32,
    parameter [31:0] C_INSCALAR_122_BITS = 32,
    parameter [31:0] C_INSCALAR_123_BITS = 32,
    parameter [31:0] C_INSCALAR_124_BITS = 32,
    parameter [31:0] C_INSCALAR_125_BITS = 32,
    parameter [31:0] C_INSCALAR_126_BITS = 32,
    parameter [31:0] C_INSCALAR_127_BITS = 32,
    parameter [31:0] S_AXIS_SCALAR_0_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_1_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_2_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_3_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_4_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_5_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_6_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_7_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_8_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_9_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_10_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_11_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_12_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_13_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_14_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_15_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_16_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_17_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_18_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_19_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_20_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_21_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_22_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_23_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_24_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_25_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_26_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_27_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_28_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_29_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_30_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_31_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_32_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_33_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_34_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_35_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_36_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_37_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_38_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_39_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_40_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_41_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_42_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_43_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_44_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_45_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_46_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_47_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_48_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_49_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_50_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_51_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_52_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_53_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_54_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_55_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_56_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_57_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_58_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_59_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_60_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_61_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_62_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_63_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_64_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_65_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_66_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_67_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_68_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_69_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_70_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_71_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_72_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_73_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_74_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_75_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_76_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_77_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_78_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_79_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_80_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_81_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_82_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_83_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_84_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_85_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_86_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_87_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_88_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_89_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_90_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_91_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_92_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_93_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_94_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_95_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_96_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_97_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_98_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_99_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_100_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_101_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_102_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_103_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_104_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_105_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_106_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_107_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_108_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_109_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_110_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_111_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_112_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_113_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_114_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_115_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_116_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_117_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_118_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_119_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_120_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_121_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_122_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_123_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_124_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_125_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_126_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_127_IS_DIRECT = 0,
    parameter [31:0] S_AXIS_SCALAR_0_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_1_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_2_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_3_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_4_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_5_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_6_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_7_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_8_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_9_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_10_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_11_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_12_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_13_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_14_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_15_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_16_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_17_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_18_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_19_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_20_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_21_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_22_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_23_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_24_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_25_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_26_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_27_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_28_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_29_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_30_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_31_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_32_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_33_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_34_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_35_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_36_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_37_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_38_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_39_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_40_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_41_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_42_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_43_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_44_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_45_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_46_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_47_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_48_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_49_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_50_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_51_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_52_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_53_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_54_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_55_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_56_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_57_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_58_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_59_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_60_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_61_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_62_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_63_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_64_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_65_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_66_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_67_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_68_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_69_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_70_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_71_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_72_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_73_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_74_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_75_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_76_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_77_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_78_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_79_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_80_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_81_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_82_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_83_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_84_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_85_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_86_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_87_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_88_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_89_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_90_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_91_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_92_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_93_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_94_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_95_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_96_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_97_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_98_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_99_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_100_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_101_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_102_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_103_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_104_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_105_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_106_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_107_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_108_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_109_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_110_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_111_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_112_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_113_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_114_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_115_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_116_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_117_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_118_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_119_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_120_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_121_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_122_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_123_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_124_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_125_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_126_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_127_DIRECT_DMWIDTH = 32,
    parameter [31:0] S_AXIS_SCALAR_0_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_1_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_2_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_3_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_4_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_5_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_6_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_7_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_8_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_9_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_10_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_11_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_12_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_13_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_14_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_15_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_16_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_17_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_18_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_19_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_20_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_21_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_22_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_23_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_24_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_25_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_26_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_27_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_28_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_29_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_30_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_31_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_32_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_33_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_34_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_35_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_36_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_37_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_38_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_39_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_40_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_41_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_42_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_43_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_44_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_45_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_46_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_47_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_48_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_49_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_50_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_51_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_52_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_53_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_54_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_55_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_56_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_57_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_58_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_59_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_60_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_61_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_62_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_63_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_64_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_65_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_66_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_67_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_68_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_69_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_70_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_71_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_72_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_73_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_74_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_75_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_76_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_77_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_78_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_79_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_80_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_81_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_82_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_83_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_84_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_85_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_86_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_87_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_88_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_89_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_90_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_91_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_92_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_93_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_94_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_95_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_96_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_97_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_98_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_99_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_100_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_101_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_102_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_103_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_104_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_105_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_106_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_107_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_108_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_109_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_110_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_111_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_112_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_113_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_114_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_115_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_116_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_117_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_118_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_119_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_120_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_121_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_122_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_123_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_124_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_125_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_126_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_127_DIRECT_IS_ASYNC = 1,
    parameter [31:0] S_AXIS_SCALAR_0_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_1_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_2_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_3_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_4_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_5_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_6_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_7_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_8_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_9_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_10_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_11_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_12_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_13_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_14_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_15_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_16_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_17_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_18_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_19_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_20_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_21_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_22_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_23_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_24_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_25_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_26_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_27_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_28_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_29_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_30_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_31_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_32_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_33_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_34_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_35_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_36_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_37_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_38_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_39_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_40_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_41_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_42_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_43_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_44_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_45_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_46_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_47_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_48_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_49_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_50_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_51_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_52_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_53_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_54_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_55_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_56_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_57_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_58_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_59_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_60_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_61_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_62_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_63_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_64_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_65_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_66_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_67_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_68_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_69_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_70_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_71_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_72_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_73_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_74_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_75_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_76_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_77_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_78_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_79_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_80_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_81_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_82_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_83_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_84_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_85_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_86_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_87_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_88_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_89_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_90_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_91_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_92_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_93_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_94_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_95_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_96_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_97_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_98_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_99_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_100_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_101_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_102_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_103_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_104_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_105_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_106_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_107_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_108_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_109_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_110_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_111_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_112_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_113_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_114_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_115_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_116_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_117_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_118_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_119_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_120_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_121_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_122_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_123_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_124_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_125_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_126_DIRECT_DEPTH = 16,
    parameter [31:0] S_AXIS_SCALAR_127_DIRECT_DEPTH = 16,
    
    parameter [31:0]  C_OUTSCALAR_0_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_1_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_2_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_3_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_4_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_5_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_6_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_7_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_8_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_9_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_10_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_11_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_12_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_13_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_14_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_15_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_16_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_17_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_18_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_19_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_20_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_21_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_22_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_23_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_24_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_25_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_26_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_27_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_28_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_29_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_30_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_31_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_32_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_33_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_34_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_35_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_36_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_37_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_38_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_39_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_40_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_41_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_42_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_43_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_44_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_45_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_46_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_47_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_48_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_49_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_50_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_51_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_52_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_53_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_54_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_55_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_56_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_57_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_58_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_59_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_60_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_61_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_62_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_63_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_64_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_65_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_66_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_67_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_68_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_69_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_70_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_71_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_72_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_73_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_74_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_75_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_76_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_77_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_78_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_79_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_80_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_81_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_82_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_83_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_84_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_85_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_86_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_87_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_88_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_89_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_90_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_91_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_92_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_93_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_94_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_95_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_96_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_97_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_98_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_99_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_100_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_101_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_102_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_103_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_104_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_105_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_106_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_107_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_108_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_109_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_110_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_111_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_112_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_113_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_114_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_115_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_116_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_117_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_118_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_119_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_120_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_121_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_122_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_123_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_124_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_125_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_126_BITS = 32,
    parameter [31:0]  C_OUTSCALAR_127_BITS = 32,
    parameter [31:0]  M_AXIS_SCALAR_0_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_1_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_2_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_3_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_4_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_5_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_6_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_7_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_8_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_9_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_10_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_11_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_12_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_13_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_14_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_15_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_16_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_17_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_18_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_19_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_20_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_21_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_22_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_23_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_24_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_25_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_26_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_27_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_28_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_29_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_30_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_31_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_32_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_33_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_34_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_35_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_36_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_37_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_38_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_39_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_40_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_41_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_42_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_43_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_44_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_45_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_46_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_47_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_48_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_49_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_50_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_51_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_52_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_53_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_54_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_55_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_56_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_57_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_58_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_59_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_60_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_61_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_62_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_63_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_64_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_65_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_66_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_67_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_68_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_69_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_70_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_71_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_72_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_73_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_74_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_75_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_76_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_77_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_78_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_79_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_80_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_81_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_82_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_83_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_84_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_85_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_86_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_87_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_88_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_89_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_90_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_91_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_92_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_93_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_94_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_95_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_96_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_97_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_98_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_99_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_100_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_101_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_102_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_103_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_104_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_105_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_106_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_107_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_108_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_109_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_110_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_111_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_112_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_113_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_114_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_115_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_116_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_117_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_118_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_119_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_120_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_121_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_122_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_123_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_124_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_125_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_126_IS_DIRECT = 0,
    parameter [31:0]  M_AXIS_SCALAR_127_IS_DIRECT = 0,
    parameter [31:0] M_AXIS_SCALAR_0_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_1_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_2_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_3_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_4_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_5_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_6_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_7_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_8_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_9_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_10_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_11_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_12_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_13_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_14_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_15_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_16_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_17_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_18_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_19_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_20_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_21_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_22_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_23_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_24_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_25_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_26_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_27_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_28_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_29_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_30_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_31_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_32_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_33_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_34_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_35_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_36_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_37_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_38_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_39_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_40_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_41_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_42_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_43_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_44_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_45_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_46_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_47_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_48_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_49_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_50_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_51_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_52_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_53_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_54_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_55_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_56_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_57_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_58_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_59_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_60_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_61_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_62_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_63_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_64_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_65_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_66_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_67_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_68_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_69_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_70_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_71_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_72_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_73_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_74_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_75_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_76_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_77_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_78_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_79_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_80_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_81_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_82_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_83_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_84_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_85_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_86_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_87_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_88_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_89_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_90_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_91_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_92_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_93_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_94_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_95_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_96_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_97_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_98_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_99_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_100_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_101_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_102_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_103_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_104_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_105_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_106_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_107_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_108_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_109_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_110_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_111_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_112_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_113_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_114_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_115_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_116_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_117_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_118_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_119_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_120_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_121_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_122_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_123_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_124_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_125_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_126_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_127_DIRECT_DMWIDTH = 32,
    parameter [31:0] M_AXIS_SCALAR_0_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_1_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_2_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_3_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_4_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_5_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_6_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_7_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_8_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_9_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_10_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_11_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_12_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_13_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_14_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_15_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_16_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_17_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_18_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_19_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_20_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_21_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_22_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_23_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_24_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_25_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_26_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_27_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_28_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_29_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_30_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_31_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_32_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_33_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_34_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_35_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_36_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_37_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_38_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_39_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_40_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_41_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_42_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_43_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_44_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_45_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_46_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_47_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_48_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_49_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_50_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_51_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_52_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_53_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_54_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_55_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_56_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_57_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_58_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_59_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_60_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_61_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_62_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_63_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_64_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_65_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_66_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_67_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_68_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_69_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_70_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_71_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_72_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_73_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_74_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_75_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_76_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_77_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_78_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_79_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_80_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_81_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_82_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_83_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_84_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_85_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_86_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_87_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_88_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_89_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_90_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_91_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_92_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_93_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_94_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_95_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_96_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_97_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_98_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_99_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_100_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_101_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_102_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_103_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_104_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_105_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_106_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_107_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_108_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_109_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_110_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_111_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_112_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_113_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_114_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_115_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_116_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_117_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_118_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_119_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_120_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_121_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_122_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_123_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_124_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_125_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_126_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_127_DIRECT_IS_ASYNC = 1,
    parameter [31:0] M_AXIS_SCALAR_0_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_1_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_2_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_3_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_4_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_5_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_6_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_7_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_8_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_9_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_10_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_11_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_12_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_13_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_14_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_15_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_16_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_17_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_18_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_19_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_20_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_21_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_22_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_23_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_24_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_25_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_26_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_27_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_28_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_29_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_30_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_31_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_32_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_33_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_34_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_35_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_36_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_37_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_38_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_39_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_40_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_41_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_42_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_43_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_44_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_45_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_46_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_47_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_48_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_49_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_50_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_51_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_52_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_53_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_54_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_55_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_56_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_57_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_58_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_59_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_60_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_61_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_62_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_63_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_64_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_65_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_66_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_67_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_68_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_69_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_70_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_71_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_72_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_73_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_74_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_75_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_76_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_77_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_78_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_79_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_80_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_81_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_82_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_83_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_84_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_85_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_86_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_87_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_88_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_89_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_90_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_91_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_92_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_93_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_94_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_95_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_96_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_97_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_98_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_99_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_100_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_101_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_102_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_103_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_104_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_105_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_106_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_107_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_108_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_109_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_110_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_111_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_112_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_113_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_114_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_115_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_116_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_117_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_118_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_119_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_120_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_121_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_122_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_123_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_124_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_125_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_126_DIRECT_DEPTH = 16,
    parameter [31:0] M_AXIS_SCALAR_127_DIRECT_DEPTH = 16
 ) (
    input clk,
    input acc_clk,
    //control interface
    input [31:0] scalar_read_addr,
    input scalar_re,
    output [31:0] scalar_dout,
    input scalar_we,
    input [31:0] scalar_write_addr,
    input [31:0] scalar_din,
    input outscalar_capture,
    input [C_NUM_INSCALARS-1:0] inscalar_next,
    output [C_NUM_INSCALARS-1:0] inscalar_fifo_empty,
    output [C_NUM_INSCALARS-1:0] inscalar_fifo_full,
    output [C_NUM_OUTSCALARS-1:0] outscalar_fifo_empty,
    output [C_NUM_OUTSCALARS-1:0] outscalar_fifo_full,
    output [C_NUM_OUTSCALARS-1:0] outscalar_null_empty,
    output [C_NUM_OUTSCALARS-1:0] outscalar_null_dout,
    input [C_NUM_OUTSCALARS-1:0] outscalar_null_read,
    //input scalar ports
    output [C_INSCALAR_0_BITS-1:0] inscalar0,
    output [C_INSCALAR_1_BITS-1:0] inscalar1,
    output [C_INSCALAR_2_BITS-1:0] inscalar2,
    output [C_INSCALAR_3_BITS-1:0] inscalar3,
    output [C_INSCALAR_4_BITS-1:0] inscalar4,
    output [C_INSCALAR_5_BITS-1:0] inscalar5,
    output [C_INSCALAR_6_BITS-1:0] inscalar6,
    output [C_INSCALAR_7_BITS-1:0] inscalar7,
    output [C_INSCALAR_8_BITS-1:0] inscalar8,
    output [C_INSCALAR_9_BITS-1:0] inscalar9,
    output [C_INSCALAR_10_BITS-1:0] inscalar10,
    output [C_INSCALAR_11_BITS-1:0] inscalar11,
    output [C_INSCALAR_12_BITS-1:0] inscalar12,
    output [C_INSCALAR_13_BITS-1:0] inscalar13,
    output [C_INSCALAR_14_BITS-1:0] inscalar14,
    output [C_INSCALAR_15_BITS-1:0] inscalar15,
    output [C_INSCALAR_16_BITS-1:0] inscalar16,
    output [C_INSCALAR_17_BITS-1:0] inscalar17,
    output [C_INSCALAR_18_BITS-1:0] inscalar18,
    output [C_INSCALAR_19_BITS-1:0] inscalar19,
    output [C_INSCALAR_20_BITS-1:0] inscalar20,
    output [C_INSCALAR_21_BITS-1:0] inscalar21,
    output [C_INSCALAR_22_BITS-1:0] inscalar22,
    output [C_INSCALAR_23_BITS-1:0] inscalar23,
    output [C_INSCALAR_24_BITS-1:0] inscalar24,
    output [C_INSCALAR_25_BITS-1:0] inscalar25,
    output [C_INSCALAR_26_BITS-1:0] inscalar26,
    output [C_INSCALAR_27_BITS-1:0] inscalar27,
    output [C_INSCALAR_28_BITS-1:0] inscalar28,
    output [C_INSCALAR_29_BITS-1:0] inscalar29,
    output [C_INSCALAR_30_BITS-1:0] inscalar30,
    output [C_INSCALAR_31_BITS-1:0] inscalar31,
    output [C_INSCALAR_32_BITS-1:0] inscalar32,
    output [C_INSCALAR_33_BITS-1:0] inscalar33,
    output [C_INSCALAR_34_BITS-1:0] inscalar34,
    output [C_INSCALAR_35_BITS-1:0] inscalar35,
    output [C_INSCALAR_36_BITS-1:0] inscalar36,
    output [C_INSCALAR_37_BITS-1:0] inscalar37,
    output [C_INSCALAR_38_BITS-1:0] inscalar38,
    output [C_INSCALAR_39_BITS-1:0] inscalar39,
    output [C_INSCALAR_40_BITS-1:0] inscalar40,
    output [C_INSCALAR_41_BITS-1:0] inscalar41,
    output [C_INSCALAR_42_BITS-1:0] inscalar42,
    output [C_INSCALAR_43_BITS-1:0] inscalar43,
    output [C_INSCALAR_44_BITS-1:0] inscalar44,
    output [C_INSCALAR_45_BITS-1:0] inscalar45,
    output [C_INSCALAR_46_BITS-1:0] inscalar46,
    output [C_INSCALAR_47_BITS-1:0] inscalar47,
    output [C_INSCALAR_48_BITS-1:0] inscalar48,
    output [C_INSCALAR_49_BITS-1:0] inscalar49,
    output [C_INSCALAR_50_BITS-1:0] inscalar50,
    output [C_INSCALAR_51_BITS-1:0] inscalar51,
    output [C_INSCALAR_52_BITS-1:0] inscalar52,
    output [C_INSCALAR_53_BITS-1:0] inscalar53,
    output [C_INSCALAR_54_BITS-1:0] inscalar54,
    output [C_INSCALAR_55_BITS-1:0] inscalar55,
    output [C_INSCALAR_56_BITS-1:0] inscalar56,
    output [C_INSCALAR_57_BITS-1:0] inscalar57,
    output [C_INSCALAR_58_BITS-1:0] inscalar58,
    output [C_INSCALAR_59_BITS-1:0] inscalar59,
    output [C_INSCALAR_60_BITS-1:0] inscalar60,
    output [C_INSCALAR_61_BITS-1:0] inscalar61,
    output [C_INSCALAR_62_BITS-1:0] inscalar62,
    output [C_INSCALAR_63_BITS-1:0] inscalar63,
    output [C_INSCALAR_64_BITS-1:0] inscalar64,
    output [C_INSCALAR_65_BITS-1:0] inscalar65,
    output [C_INSCALAR_66_BITS-1:0] inscalar66,
    output [C_INSCALAR_67_BITS-1:0] inscalar67,
    output [C_INSCALAR_68_BITS-1:0] inscalar68,
    output [C_INSCALAR_69_BITS-1:0] inscalar69,
    output [C_INSCALAR_70_BITS-1:0] inscalar70,
    output [C_INSCALAR_71_BITS-1:0] inscalar71,
    output [C_INSCALAR_72_BITS-1:0] inscalar72,
    output [C_INSCALAR_73_BITS-1:0] inscalar73,
    output [C_INSCALAR_74_BITS-1:0] inscalar74,
    output [C_INSCALAR_75_BITS-1:0] inscalar75,
    output [C_INSCALAR_76_BITS-1:0] inscalar76,
    output [C_INSCALAR_77_BITS-1:0] inscalar77,
    output [C_INSCALAR_78_BITS-1:0] inscalar78,
    output [C_INSCALAR_79_BITS-1:0] inscalar79,
    output [C_INSCALAR_80_BITS-1:0] inscalar80,
    output [C_INSCALAR_81_BITS-1:0] inscalar81,
    output [C_INSCALAR_82_BITS-1:0] inscalar82,
    output [C_INSCALAR_83_BITS-1:0] inscalar83,
    output [C_INSCALAR_84_BITS-1:0] inscalar84,
    output [C_INSCALAR_85_BITS-1:0] inscalar85,
    output [C_INSCALAR_86_BITS-1:0] inscalar86,
    output [C_INSCALAR_87_BITS-1:0] inscalar87,
    output [C_INSCALAR_88_BITS-1:0] inscalar88,
    output [C_INSCALAR_89_BITS-1:0] inscalar89,
    output [C_INSCALAR_90_BITS-1:0] inscalar90,
    output [C_INSCALAR_91_BITS-1:0] inscalar91,
    output [C_INSCALAR_92_BITS-1:0] inscalar92,
    output [C_INSCALAR_93_BITS-1:0] inscalar93,
    output [C_INSCALAR_94_BITS-1:0] inscalar94,
    output [C_INSCALAR_95_BITS-1:0] inscalar95,
    output [C_INSCALAR_96_BITS-1:0] inscalar96,
    output [C_INSCALAR_97_BITS-1:0] inscalar97,
    output [C_INSCALAR_98_BITS-1:0] inscalar98,
    output [C_INSCALAR_99_BITS-1:0] inscalar99,
    output [C_INSCALAR_100_BITS-1:0] inscalar100,
    output [C_INSCALAR_101_BITS-1:0] inscalar101,
    output [C_INSCALAR_102_BITS-1:0] inscalar102,
    output [C_INSCALAR_103_BITS-1:0] inscalar103,
    output [C_INSCALAR_104_BITS-1:0] inscalar104,
    output [C_INSCALAR_105_BITS-1:0] inscalar105,
    output [C_INSCALAR_106_BITS-1:0] inscalar106,
    output [C_INSCALAR_107_BITS-1:0] inscalar107,
    output [C_INSCALAR_108_BITS-1:0] inscalar108,
    output [C_INSCALAR_109_BITS-1:0] inscalar109,
    output [C_INSCALAR_110_BITS-1:0] inscalar110,
    output [C_INSCALAR_111_BITS-1:0] inscalar111,
    output [C_INSCALAR_112_BITS-1:0] inscalar112,
    output [C_INSCALAR_113_BITS-1:0] inscalar113,
    output [C_INSCALAR_114_BITS-1:0] inscalar114,
    output [C_INSCALAR_115_BITS-1:0] inscalar115,
    output [C_INSCALAR_116_BITS-1:0] inscalar116,
    output [C_INSCALAR_117_BITS-1:0] inscalar117,
    output [C_INSCALAR_118_BITS-1:0] inscalar118,
    output [C_INSCALAR_119_BITS-1:0] inscalar119,
    output [C_INSCALAR_120_BITS-1:0] inscalar120,
    output [C_INSCALAR_121_BITS-1:0] inscalar121,
    output [C_INSCALAR_122_BITS-1:0] inscalar122,
    output [C_INSCALAR_123_BITS-1:0] inscalar123,
    output [C_INSCALAR_124_BITS-1:0] inscalar124,
    output [C_INSCALAR_125_BITS-1:0] inscalar125,
    output [C_INSCALAR_126_BITS-1:0] inscalar126,
    output [C_INSCALAR_127_BITS-1:0] inscalar127,
    //input scalar direct AXIS interfaces
    //input AXI-Stream to Scalar interface 0
    input s_axis_scalar_0_aclk,
    input s_axis_scalar_0_aresetn,
    input s_axis_scalar_0_tlast,
    input s_axis_scalar_0_tvalid,
    input [S_AXIS_SCALAR_0_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_0_tkeep,
    input [S_AXIS_SCALAR_0_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_0_tstrb,
    input [S_AXIS_SCALAR_0_DIRECT_DMWIDTH-1:0] s_axis_scalar_0_tdata,
    output s_axis_scalar_0_tready,
    //input AXI-Stream to Scalar interface 1
    input s_axis_scalar_1_aclk,
    input s_axis_scalar_1_aresetn,
    input s_axis_scalar_1_tlast,
    input s_axis_scalar_1_tvalid,
    input [S_AXIS_SCALAR_1_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_1_tkeep,
    input [S_AXIS_SCALAR_1_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_1_tstrb,
    input [S_AXIS_SCALAR_1_DIRECT_DMWIDTH-1:0] s_axis_scalar_1_tdata,
    output s_axis_scalar_1_tready,
    //input AXI-Stream to Scalar interface 2
    input s_axis_scalar_2_aclk,
    input s_axis_scalar_2_aresetn,
    input s_axis_scalar_2_tlast,
    input s_axis_scalar_2_tvalid,
    input [S_AXIS_SCALAR_2_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_2_tkeep,
    input [S_AXIS_SCALAR_2_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_2_tstrb,
    input [S_AXIS_SCALAR_2_DIRECT_DMWIDTH-1:0] s_axis_scalar_2_tdata,
    output s_axis_scalar_2_tready,
    //input AXI-Stream to Scalar interface 3
    input s_axis_scalar_3_aclk,
    input s_axis_scalar_3_aresetn,
    input s_axis_scalar_3_tlast,
    input s_axis_scalar_3_tvalid,
    input [S_AXIS_SCALAR_3_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_3_tkeep,
    input [S_AXIS_SCALAR_3_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_3_tstrb,
    input [S_AXIS_SCALAR_3_DIRECT_DMWIDTH-1:0] s_axis_scalar_3_tdata,
    output s_axis_scalar_3_tready,
    //input AXI-Stream to Scalar interface 4
    input s_axis_scalar_4_aclk,
    input s_axis_scalar_4_aresetn,
    input s_axis_scalar_4_tlast,
    input s_axis_scalar_4_tvalid,
    input [S_AXIS_SCALAR_4_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_4_tkeep,
    input [S_AXIS_SCALAR_4_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_4_tstrb,
    input [S_AXIS_SCALAR_4_DIRECT_DMWIDTH-1:0] s_axis_scalar_4_tdata,
    output s_axis_scalar_4_tready,
    //input AXI-Stream to Scalar interface 5
    input s_axis_scalar_5_aclk,
    input s_axis_scalar_5_aresetn,
    input s_axis_scalar_5_tlast,
    input s_axis_scalar_5_tvalid,
    input [S_AXIS_SCALAR_5_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_5_tkeep,
    input [S_AXIS_SCALAR_5_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_5_tstrb,
    input [S_AXIS_SCALAR_5_DIRECT_DMWIDTH-1:0] s_axis_scalar_5_tdata,
    output s_axis_scalar_5_tready,
    //input AXI-Stream to Scalar interface 6
    input s_axis_scalar_6_aclk,
    input s_axis_scalar_6_aresetn,
    input s_axis_scalar_6_tlast,
    input s_axis_scalar_6_tvalid,
    input [S_AXIS_SCALAR_6_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_6_tkeep,
    input [S_AXIS_SCALAR_6_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_6_tstrb,
    input [S_AXIS_SCALAR_6_DIRECT_DMWIDTH-1:0] s_axis_scalar_6_tdata,
    output s_axis_scalar_6_tready,
    //input AXI-Stream to Scalar interface 7
    input s_axis_scalar_7_aclk,
    input s_axis_scalar_7_aresetn,
    input s_axis_scalar_7_tlast,
    input s_axis_scalar_7_tvalid,
    input [S_AXIS_SCALAR_7_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_7_tkeep,
    input [S_AXIS_SCALAR_7_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_7_tstrb,
    input [S_AXIS_SCALAR_7_DIRECT_DMWIDTH-1:0] s_axis_scalar_7_tdata,
    output s_axis_scalar_7_tready,
    //input AXI-Stream to Scalar interface 8
    input s_axis_scalar_8_aclk,
    input s_axis_scalar_8_aresetn,
    input s_axis_scalar_8_tlast,
    input s_axis_scalar_8_tvalid,
    input [S_AXIS_SCALAR_8_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_8_tkeep,
    input [S_AXIS_SCALAR_8_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_8_tstrb,
    input [S_AXIS_SCALAR_8_DIRECT_DMWIDTH-1:0] s_axis_scalar_8_tdata,
    output s_axis_scalar_8_tready,
    //input AXI-Stream to Scalar interface 9
    input s_axis_scalar_9_aclk,
    input s_axis_scalar_9_aresetn,
    input s_axis_scalar_9_tlast,
    input s_axis_scalar_9_tvalid,
    input [S_AXIS_SCALAR_9_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_9_tkeep,
    input [S_AXIS_SCALAR_9_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_9_tstrb,
    input [S_AXIS_SCALAR_9_DIRECT_DMWIDTH-1:0] s_axis_scalar_9_tdata,
    output s_axis_scalar_9_tready,
    //input AXI-Stream to Scalar interface 10
    input s_axis_scalar_10_aclk,
    input s_axis_scalar_10_aresetn,
    input s_axis_scalar_10_tlast,
    input s_axis_scalar_10_tvalid,
    input [S_AXIS_SCALAR_10_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_10_tkeep,
    input [S_AXIS_SCALAR_10_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_10_tstrb,
    input [S_AXIS_SCALAR_10_DIRECT_DMWIDTH-1:0] s_axis_scalar_10_tdata,
    output s_axis_scalar_10_tready,
    //input AXI-Stream to Scalar interface 11
    input s_axis_scalar_11_aclk,
    input s_axis_scalar_11_aresetn,
    input s_axis_scalar_11_tlast,
    input s_axis_scalar_11_tvalid,
    input [S_AXIS_SCALAR_11_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_11_tkeep,
    input [S_AXIS_SCALAR_11_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_11_tstrb,
    input [S_AXIS_SCALAR_11_DIRECT_DMWIDTH-1:0] s_axis_scalar_11_tdata,
    output s_axis_scalar_11_tready,
    //input AXI-Stream to Scalar interface 12
    input s_axis_scalar_12_aclk,
    input s_axis_scalar_12_aresetn,
    input s_axis_scalar_12_tlast,
    input s_axis_scalar_12_tvalid,
    input [S_AXIS_SCALAR_12_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_12_tkeep,
    input [S_AXIS_SCALAR_12_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_12_tstrb,
    input [S_AXIS_SCALAR_12_DIRECT_DMWIDTH-1:0] s_axis_scalar_12_tdata,
    output s_axis_scalar_12_tready,
    //input AXI-Stream to Scalar interface 13
    input s_axis_scalar_13_aclk,
    input s_axis_scalar_13_aresetn,
    input s_axis_scalar_13_tlast,
    input s_axis_scalar_13_tvalid,
    input [S_AXIS_SCALAR_13_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_13_tkeep,
    input [S_AXIS_SCALAR_13_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_13_tstrb,
    input [S_AXIS_SCALAR_13_DIRECT_DMWIDTH-1:0] s_axis_scalar_13_tdata,
    output s_axis_scalar_13_tready,
    //input AXI-Stream to Scalar interface 14
    input s_axis_scalar_14_aclk,
    input s_axis_scalar_14_aresetn,
    input s_axis_scalar_14_tlast,
    input s_axis_scalar_14_tvalid,
    input [S_AXIS_SCALAR_14_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_14_tkeep,
    input [S_AXIS_SCALAR_14_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_14_tstrb,
    input [S_AXIS_SCALAR_14_DIRECT_DMWIDTH-1:0] s_axis_scalar_14_tdata,
    output s_axis_scalar_14_tready,
    //input AXI-Stream to Scalar interface 15
    input s_axis_scalar_15_aclk,
    input s_axis_scalar_15_aresetn,
    input s_axis_scalar_15_tlast,
    input s_axis_scalar_15_tvalid,
    input [S_AXIS_SCALAR_15_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_15_tkeep,
    input [S_AXIS_SCALAR_15_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_15_tstrb,
    input [S_AXIS_SCALAR_15_DIRECT_DMWIDTH-1:0] s_axis_scalar_15_tdata,
    output s_axis_scalar_15_tready,
    //input AXI-Stream to Scalar interface 16
    input s_axis_scalar_16_aclk,
    input s_axis_scalar_16_aresetn,
    input s_axis_scalar_16_tlast,
    input s_axis_scalar_16_tvalid,
    input [S_AXIS_SCALAR_16_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_16_tkeep,
    input [S_AXIS_SCALAR_16_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_16_tstrb,
    input [S_AXIS_SCALAR_16_DIRECT_DMWIDTH-1:0] s_axis_scalar_16_tdata,
    output s_axis_scalar_16_tready,
    //input AXI-Stream to Scalar interface 17
    input s_axis_scalar_17_aclk,
    input s_axis_scalar_17_aresetn,
    input s_axis_scalar_17_tlast,
    input s_axis_scalar_17_tvalid,
    input [S_AXIS_SCALAR_17_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_17_tkeep,
    input [S_AXIS_SCALAR_17_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_17_tstrb,
    input [S_AXIS_SCALAR_17_DIRECT_DMWIDTH-1:0] s_axis_scalar_17_tdata,
    output s_axis_scalar_17_tready,
    //input AXI-Stream to Scalar interface 18
    input s_axis_scalar_18_aclk,
    input s_axis_scalar_18_aresetn,
    input s_axis_scalar_18_tlast,
    input s_axis_scalar_18_tvalid,
    input [S_AXIS_SCALAR_18_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_18_tkeep,
    input [S_AXIS_SCALAR_18_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_18_tstrb,
    input [S_AXIS_SCALAR_18_DIRECT_DMWIDTH-1:0] s_axis_scalar_18_tdata,
    output s_axis_scalar_18_tready,
    //input AXI-Stream to Scalar interface 19
    input s_axis_scalar_19_aclk,
    input s_axis_scalar_19_aresetn,
    input s_axis_scalar_19_tlast,
    input s_axis_scalar_19_tvalid,
    input [S_AXIS_SCALAR_19_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_19_tkeep,
    input [S_AXIS_SCALAR_19_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_19_tstrb,
    input [S_AXIS_SCALAR_19_DIRECT_DMWIDTH-1:0] s_axis_scalar_19_tdata,
    output s_axis_scalar_19_tready,
    //input AXI-Stream to Scalar interface 20
    input s_axis_scalar_20_aclk,
    input s_axis_scalar_20_aresetn,
    input s_axis_scalar_20_tlast,
    input s_axis_scalar_20_tvalid,
    input [S_AXIS_SCALAR_20_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_20_tkeep,
    input [S_AXIS_SCALAR_20_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_20_tstrb,
    input [S_AXIS_SCALAR_20_DIRECT_DMWIDTH-1:0] s_axis_scalar_20_tdata,
    output s_axis_scalar_20_tready,
    //input AXI-Stream to Scalar interface 21
    input s_axis_scalar_21_aclk,
    input s_axis_scalar_21_aresetn,
    input s_axis_scalar_21_tlast,
    input s_axis_scalar_21_tvalid,
    input [S_AXIS_SCALAR_21_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_21_tkeep,
    input [S_AXIS_SCALAR_21_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_21_tstrb,
    input [S_AXIS_SCALAR_21_DIRECT_DMWIDTH-1:0] s_axis_scalar_21_tdata,
    output s_axis_scalar_21_tready,
    //input AXI-Stream to Scalar interface 22
    input s_axis_scalar_22_aclk,
    input s_axis_scalar_22_aresetn,
    input s_axis_scalar_22_tlast,
    input s_axis_scalar_22_tvalid,
    input [S_AXIS_SCALAR_22_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_22_tkeep,
    input [S_AXIS_SCALAR_22_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_22_tstrb,
    input [S_AXIS_SCALAR_22_DIRECT_DMWIDTH-1:0] s_axis_scalar_22_tdata,
    output s_axis_scalar_22_tready,
    //input AXI-Stream to Scalar interface 23
    input s_axis_scalar_23_aclk,
    input s_axis_scalar_23_aresetn,
    input s_axis_scalar_23_tlast,
    input s_axis_scalar_23_tvalid,
    input [S_AXIS_SCALAR_23_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_23_tkeep,
    input [S_AXIS_SCALAR_23_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_23_tstrb,
    input [S_AXIS_SCALAR_23_DIRECT_DMWIDTH-1:0] s_axis_scalar_23_tdata,
    output s_axis_scalar_23_tready,
    //input AXI-Stream to Scalar interface 24
    input s_axis_scalar_24_aclk,
    input s_axis_scalar_24_aresetn,
    input s_axis_scalar_24_tlast,
    input s_axis_scalar_24_tvalid,
    input [S_AXIS_SCALAR_24_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_24_tkeep,
    input [S_AXIS_SCALAR_24_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_24_tstrb,
    input [S_AXIS_SCALAR_24_DIRECT_DMWIDTH-1:0] s_axis_scalar_24_tdata,
    output s_axis_scalar_24_tready,
    //input AXI-Stream to Scalar interface 25
    input s_axis_scalar_25_aclk,
    input s_axis_scalar_25_aresetn,
    input s_axis_scalar_25_tlast,
    input s_axis_scalar_25_tvalid,
    input [S_AXIS_SCALAR_25_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_25_tkeep,
    input [S_AXIS_SCALAR_25_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_25_tstrb,
    input [S_AXIS_SCALAR_25_DIRECT_DMWIDTH-1:0] s_axis_scalar_25_tdata,
    output s_axis_scalar_25_tready,
    //input AXI-Stream to Scalar interface 26
    input s_axis_scalar_26_aclk,
    input s_axis_scalar_26_aresetn,
    input s_axis_scalar_26_tlast,
    input s_axis_scalar_26_tvalid,
    input [S_AXIS_SCALAR_26_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_26_tkeep,
    input [S_AXIS_SCALAR_26_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_26_tstrb,
    input [S_AXIS_SCALAR_26_DIRECT_DMWIDTH-1:0] s_axis_scalar_26_tdata,
    output s_axis_scalar_26_tready,
    //input AXI-Stream to Scalar interface 27
    input s_axis_scalar_27_aclk,
    input s_axis_scalar_27_aresetn,
    input s_axis_scalar_27_tlast,
    input s_axis_scalar_27_tvalid,
    input [S_AXIS_SCALAR_27_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_27_tkeep,
    input [S_AXIS_SCALAR_27_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_27_tstrb,
    input [S_AXIS_SCALAR_27_DIRECT_DMWIDTH-1:0] s_axis_scalar_27_tdata,
    output s_axis_scalar_27_tready,
    //input AXI-Stream to Scalar interface 28
    input s_axis_scalar_28_aclk,
    input s_axis_scalar_28_aresetn,
    input s_axis_scalar_28_tlast,
    input s_axis_scalar_28_tvalid,
    input [S_AXIS_SCALAR_28_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_28_tkeep,
    input [S_AXIS_SCALAR_28_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_28_tstrb,
    input [S_AXIS_SCALAR_28_DIRECT_DMWIDTH-1:0] s_axis_scalar_28_tdata,
    output s_axis_scalar_28_tready,
    //input AXI-Stream to Scalar interface 29
    input s_axis_scalar_29_aclk,
    input s_axis_scalar_29_aresetn,
    input s_axis_scalar_29_tlast,
    input s_axis_scalar_29_tvalid,
    input [S_AXIS_SCALAR_29_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_29_tkeep,
    input [S_AXIS_SCALAR_29_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_29_tstrb,
    input [S_AXIS_SCALAR_29_DIRECT_DMWIDTH-1:0] s_axis_scalar_29_tdata,
    output s_axis_scalar_29_tready,
    //input AXI-Stream to Scalar interface 30
    input s_axis_scalar_30_aclk,
    input s_axis_scalar_30_aresetn,
    input s_axis_scalar_30_tlast,
    input s_axis_scalar_30_tvalid,
    input [S_AXIS_SCALAR_30_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_30_tkeep,
    input [S_AXIS_SCALAR_30_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_30_tstrb,
    input [S_AXIS_SCALAR_30_DIRECT_DMWIDTH-1:0] s_axis_scalar_30_tdata,
    output s_axis_scalar_30_tready,
    //input AXI-Stream to Scalar interface 31
    input s_axis_scalar_31_aclk,
    input s_axis_scalar_31_aresetn,
    input s_axis_scalar_31_tlast,
    input s_axis_scalar_31_tvalid,
    input [S_AXIS_SCALAR_31_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_31_tkeep,
    input [S_AXIS_SCALAR_31_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_31_tstrb,
    input [S_AXIS_SCALAR_31_DIRECT_DMWIDTH-1:0] s_axis_scalar_31_tdata,
    output s_axis_scalar_31_tready,
    //input AXI-Stream to Scalar interface 32
    input s_axis_scalar_32_aclk,
    input s_axis_scalar_32_aresetn,
    input s_axis_scalar_32_tlast,
    input s_axis_scalar_32_tvalid,
    input [S_AXIS_SCALAR_32_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_32_tkeep,
    input [S_AXIS_SCALAR_32_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_32_tstrb,
    input [S_AXIS_SCALAR_32_DIRECT_DMWIDTH-1:0] s_axis_scalar_32_tdata,
    output s_axis_scalar_32_tready,
    //input AXI-Stream to Scalar interface 33
    input s_axis_scalar_33_aclk,
    input s_axis_scalar_33_aresetn,
    input s_axis_scalar_33_tlast,
    input s_axis_scalar_33_tvalid,
    input [S_AXIS_SCALAR_33_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_33_tkeep,
    input [S_AXIS_SCALAR_33_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_33_tstrb,
    input [S_AXIS_SCALAR_33_DIRECT_DMWIDTH-1:0] s_axis_scalar_33_tdata,
    output s_axis_scalar_33_tready,
    //input AXI-Stream to Scalar interface 34
    input s_axis_scalar_34_aclk,
    input s_axis_scalar_34_aresetn,
    input s_axis_scalar_34_tlast,
    input s_axis_scalar_34_tvalid,
    input [S_AXIS_SCALAR_34_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_34_tkeep,
    input [S_AXIS_SCALAR_34_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_34_tstrb,
    input [S_AXIS_SCALAR_34_DIRECT_DMWIDTH-1:0] s_axis_scalar_34_tdata,
    output s_axis_scalar_34_tready,
    //input AXI-Stream to Scalar interface 35
    input s_axis_scalar_35_aclk,
    input s_axis_scalar_35_aresetn,
    input s_axis_scalar_35_tlast,
    input s_axis_scalar_35_tvalid,
    input [S_AXIS_SCALAR_35_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_35_tkeep,
    input [S_AXIS_SCALAR_35_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_35_tstrb,
    input [S_AXIS_SCALAR_35_DIRECT_DMWIDTH-1:0] s_axis_scalar_35_tdata,
    output s_axis_scalar_35_tready,
    //input AXI-Stream to Scalar interface 36
    input s_axis_scalar_36_aclk,
    input s_axis_scalar_36_aresetn,
    input s_axis_scalar_36_tlast,
    input s_axis_scalar_36_tvalid,
    input [S_AXIS_SCALAR_36_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_36_tkeep,
    input [S_AXIS_SCALAR_36_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_36_tstrb,
    input [S_AXIS_SCALAR_36_DIRECT_DMWIDTH-1:0] s_axis_scalar_36_tdata,
    output s_axis_scalar_36_tready,
    //input AXI-Stream to Scalar interface 37
    input s_axis_scalar_37_aclk,
    input s_axis_scalar_37_aresetn,
    input s_axis_scalar_37_tlast,
    input s_axis_scalar_37_tvalid,
    input [S_AXIS_SCALAR_37_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_37_tkeep,
    input [S_AXIS_SCALAR_37_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_37_tstrb,
    input [S_AXIS_SCALAR_37_DIRECT_DMWIDTH-1:0] s_axis_scalar_37_tdata,
    output s_axis_scalar_37_tready,
    //input AXI-Stream to Scalar interface 38
    input s_axis_scalar_38_aclk,
    input s_axis_scalar_38_aresetn,
    input s_axis_scalar_38_tlast,
    input s_axis_scalar_38_tvalid,
    input [S_AXIS_SCALAR_38_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_38_tkeep,
    input [S_AXIS_SCALAR_38_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_38_tstrb,
    input [S_AXIS_SCALAR_38_DIRECT_DMWIDTH-1:0] s_axis_scalar_38_tdata,
    output s_axis_scalar_38_tready,
    //input AXI-Stream to Scalar interface 39
    input s_axis_scalar_39_aclk,
    input s_axis_scalar_39_aresetn,
    input s_axis_scalar_39_tlast,
    input s_axis_scalar_39_tvalid,
    input [S_AXIS_SCALAR_39_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_39_tkeep,
    input [S_AXIS_SCALAR_39_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_39_tstrb,
    input [S_AXIS_SCALAR_39_DIRECT_DMWIDTH-1:0] s_axis_scalar_39_tdata,
    output s_axis_scalar_39_tready,
    //input AXI-Stream to Scalar interface 40
    input s_axis_scalar_40_aclk,
    input s_axis_scalar_40_aresetn,
    input s_axis_scalar_40_tlast,
    input s_axis_scalar_40_tvalid,
    input [S_AXIS_SCALAR_40_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_40_tkeep,
    input [S_AXIS_SCALAR_40_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_40_tstrb,
    input [S_AXIS_SCALAR_40_DIRECT_DMWIDTH-1:0] s_axis_scalar_40_tdata,
    output s_axis_scalar_40_tready,
    //input AXI-Stream to Scalar interface 41
    input s_axis_scalar_41_aclk,
    input s_axis_scalar_41_aresetn,
    input s_axis_scalar_41_tlast,
    input s_axis_scalar_41_tvalid,
    input [S_AXIS_SCALAR_41_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_41_tkeep,
    input [S_AXIS_SCALAR_41_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_41_tstrb,
    input [S_AXIS_SCALAR_41_DIRECT_DMWIDTH-1:0] s_axis_scalar_41_tdata,
    output s_axis_scalar_41_tready,
    //input AXI-Stream to Scalar interface 42
    input s_axis_scalar_42_aclk,
    input s_axis_scalar_42_aresetn,
    input s_axis_scalar_42_tlast,
    input s_axis_scalar_42_tvalid,
    input [S_AXIS_SCALAR_42_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_42_tkeep,
    input [S_AXIS_SCALAR_42_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_42_tstrb,
    input [S_AXIS_SCALAR_42_DIRECT_DMWIDTH-1:0] s_axis_scalar_42_tdata,
    output s_axis_scalar_42_tready,
    //input AXI-Stream to Scalar interface 43
    input s_axis_scalar_43_aclk,
    input s_axis_scalar_43_aresetn,
    input s_axis_scalar_43_tlast,
    input s_axis_scalar_43_tvalid,
    input [S_AXIS_SCALAR_43_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_43_tkeep,
    input [S_AXIS_SCALAR_43_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_43_tstrb,
    input [S_AXIS_SCALAR_43_DIRECT_DMWIDTH-1:0] s_axis_scalar_43_tdata,
    output s_axis_scalar_43_tready,
    //input AXI-Stream to Scalar interface 44
    input s_axis_scalar_44_aclk,
    input s_axis_scalar_44_aresetn,
    input s_axis_scalar_44_tlast,
    input s_axis_scalar_44_tvalid,
    input [S_AXIS_SCALAR_44_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_44_tkeep,
    input [S_AXIS_SCALAR_44_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_44_tstrb,
    input [S_AXIS_SCALAR_44_DIRECT_DMWIDTH-1:0] s_axis_scalar_44_tdata,
    output s_axis_scalar_44_tready,
    //input AXI-Stream to Scalar interface 45
    input s_axis_scalar_45_aclk,
    input s_axis_scalar_45_aresetn,
    input s_axis_scalar_45_tlast,
    input s_axis_scalar_45_tvalid,
    input [S_AXIS_SCALAR_45_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_45_tkeep,
    input [S_AXIS_SCALAR_45_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_45_tstrb,
    input [S_AXIS_SCALAR_45_DIRECT_DMWIDTH-1:0] s_axis_scalar_45_tdata,
    output s_axis_scalar_45_tready,
    //input AXI-Stream to Scalar interface 46
    input s_axis_scalar_46_aclk,
    input s_axis_scalar_46_aresetn,
    input s_axis_scalar_46_tlast,
    input s_axis_scalar_46_tvalid,
    input [S_AXIS_SCALAR_46_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_46_tkeep,
    input [S_AXIS_SCALAR_46_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_46_tstrb,
    input [S_AXIS_SCALAR_46_DIRECT_DMWIDTH-1:0] s_axis_scalar_46_tdata,
    output s_axis_scalar_46_tready,
    //input AXI-Stream to Scalar interface 47
    input s_axis_scalar_47_aclk,
    input s_axis_scalar_47_aresetn,
    input s_axis_scalar_47_tlast,
    input s_axis_scalar_47_tvalid,
    input [S_AXIS_SCALAR_47_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_47_tkeep,
    input [S_AXIS_SCALAR_47_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_47_tstrb,
    input [S_AXIS_SCALAR_47_DIRECT_DMWIDTH-1:0] s_axis_scalar_47_tdata,
    output s_axis_scalar_47_tready,
    //input AXI-Stream to Scalar interface 48
    input s_axis_scalar_48_aclk,
    input s_axis_scalar_48_aresetn,
    input s_axis_scalar_48_tlast,
    input s_axis_scalar_48_tvalid,
    input [S_AXIS_SCALAR_48_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_48_tkeep,
    input [S_AXIS_SCALAR_48_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_48_tstrb,
    input [S_AXIS_SCALAR_48_DIRECT_DMWIDTH-1:0] s_axis_scalar_48_tdata,
    output s_axis_scalar_48_tready,
    //input AXI-Stream to Scalar interface 49
    input s_axis_scalar_49_aclk,
    input s_axis_scalar_49_aresetn,
    input s_axis_scalar_49_tlast,
    input s_axis_scalar_49_tvalid,
    input [S_AXIS_SCALAR_49_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_49_tkeep,
    input [S_AXIS_SCALAR_49_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_49_tstrb,
    input [S_AXIS_SCALAR_49_DIRECT_DMWIDTH-1:0] s_axis_scalar_49_tdata,
    output s_axis_scalar_49_tready,
    //input AXI-Stream to Scalar interface 50
    input s_axis_scalar_50_aclk,
    input s_axis_scalar_50_aresetn,
    input s_axis_scalar_50_tlast,
    input s_axis_scalar_50_tvalid,
    input [S_AXIS_SCALAR_50_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_50_tkeep,
    input [S_AXIS_SCALAR_50_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_50_tstrb,
    input [S_AXIS_SCALAR_50_DIRECT_DMWIDTH-1:0] s_axis_scalar_50_tdata,
    output s_axis_scalar_50_tready,
    //input AXI-Stream to Scalar interface 51
    input s_axis_scalar_51_aclk,
    input s_axis_scalar_51_aresetn,
    input s_axis_scalar_51_tlast,
    input s_axis_scalar_51_tvalid,
    input [S_AXIS_SCALAR_51_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_51_tkeep,
    input [S_AXIS_SCALAR_51_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_51_tstrb,
    input [S_AXIS_SCALAR_51_DIRECT_DMWIDTH-1:0] s_axis_scalar_51_tdata,
    output s_axis_scalar_51_tready,
    //input AXI-Stream to Scalar interface 52
    input s_axis_scalar_52_aclk,
    input s_axis_scalar_52_aresetn,
    input s_axis_scalar_52_tlast,
    input s_axis_scalar_52_tvalid,
    input [S_AXIS_SCALAR_52_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_52_tkeep,
    input [S_AXIS_SCALAR_52_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_52_tstrb,
    input [S_AXIS_SCALAR_52_DIRECT_DMWIDTH-1:0] s_axis_scalar_52_tdata,
    output s_axis_scalar_52_tready,
    //input AXI-Stream to Scalar interface 53
    input s_axis_scalar_53_aclk,
    input s_axis_scalar_53_aresetn,
    input s_axis_scalar_53_tlast,
    input s_axis_scalar_53_tvalid,
    input [S_AXIS_SCALAR_53_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_53_tkeep,
    input [S_AXIS_SCALAR_53_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_53_tstrb,
    input [S_AXIS_SCALAR_53_DIRECT_DMWIDTH-1:0] s_axis_scalar_53_tdata,
    output s_axis_scalar_53_tready,
    //input AXI-Stream to Scalar interface 54
    input s_axis_scalar_54_aclk,
    input s_axis_scalar_54_aresetn,
    input s_axis_scalar_54_tlast,
    input s_axis_scalar_54_tvalid,
    input [S_AXIS_SCALAR_54_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_54_tkeep,
    input [S_AXIS_SCALAR_54_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_54_tstrb,
    input [S_AXIS_SCALAR_54_DIRECT_DMWIDTH-1:0] s_axis_scalar_54_tdata,
    output s_axis_scalar_54_tready,
    //input AXI-Stream to Scalar interface 55
    input s_axis_scalar_55_aclk,
    input s_axis_scalar_55_aresetn,
    input s_axis_scalar_55_tlast,
    input s_axis_scalar_55_tvalid,
    input [S_AXIS_SCALAR_55_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_55_tkeep,
    input [S_AXIS_SCALAR_55_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_55_tstrb,
    input [S_AXIS_SCALAR_55_DIRECT_DMWIDTH-1:0] s_axis_scalar_55_tdata,
    output s_axis_scalar_55_tready,
    //input AXI-Stream to Scalar interface 56
    input s_axis_scalar_56_aclk,
    input s_axis_scalar_56_aresetn,
    input s_axis_scalar_56_tlast,
    input s_axis_scalar_56_tvalid,
    input [S_AXIS_SCALAR_56_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_56_tkeep,
    input [S_AXIS_SCALAR_56_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_56_tstrb,
    input [S_AXIS_SCALAR_56_DIRECT_DMWIDTH-1:0] s_axis_scalar_56_tdata,
    output s_axis_scalar_56_tready,
    //input AXI-Stream to Scalar interface 57
    input s_axis_scalar_57_aclk,
    input s_axis_scalar_57_aresetn,
    input s_axis_scalar_57_tlast,
    input s_axis_scalar_57_tvalid,
    input [S_AXIS_SCALAR_57_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_57_tkeep,
    input [S_AXIS_SCALAR_57_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_57_tstrb,
    input [S_AXIS_SCALAR_57_DIRECT_DMWIDTH-1:0] s_axis_scalar_57_tdata,
    output s_axis_scalar_57_tready,
    //input AXI-Stream to Scalar interface 58
    input s_axis_scalar_58_aclk,
    input s_axis_scalar_58_aresetn,
    input s_axis_scalar_58_tlast,
    input s_axis_scalar_58_tvalid,
    input [S_AXIS_SCALAR_58_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_58_tkeep,
    input [S_AXIS_SCALAR_58_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_58_tstrb,
    input [S_AXIS_SCALAR_58_DIRECT_DMWIDTH-1:0] s_axis_scalar_58_tdata,
    output s_axis_scalar_58_tready,
    //input AXI-Stream to Scalar interface 59
    input s_axis_scalar_59_aclk,
    input s_axis_scalar_59_aresetn,
    input s_axis_scalar_59_tlast,
    input s_axis_scalar_59_tvalid,
    input [S_AXIS_SCALAR_59_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_59_tkeep,
    input [S_AXIS_SCALAR_59_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_59_tstrb,
    input [S_AXIS_SCALAR_59_DIRECT_DMWIDTH-1:0] s_axis_scalar_59_tdata,
    output s_axis_scalar_59_tready,
    //input AXI-Stream to Scalar interface 60
    input s_axis_scalar_60_aclk,
    input s_axis_scalar_60_aresetn,
    input s_axis_scalar_60_tlast,
    input s_axis_scalar_60_tvalid,
    input [S_AXIS_SCALAR_60_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_60_tkeep,
    input [S_AXIS_SCALAR_60_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_60_tstrb,
    input [S_AXIS_SCALAR_60_DIRECT_DMWIDTH-1:0] s_axis_scalar_60_tdata,
    output s_axis_scalar_60_tready,
    //input AXI-Stream to Scalar interface 61
    input s_axis_scalar_61_aclk,
    input s_axis_scalar_61_aresetn,
    input s_axis_scalar_61_tlast,
    input s_axis_scalar_61_tvalid,
    input [S_AXIS_SCALAR_61_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_61_tkeep,
    input [S_AXIS_SCALAR_61_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_61_tstrb,
    input [S_AXIS_SCALAR_61_DIRECT_DMWIDTH-1:0] s_axis_scalar_61_tdata,
    output s_axis_scalar_61_tready,
    //input AXI-Stream to Scalar interface 62
    input s_axis_scalar_62_aclk,
    input s_axis_scalar_62_aresetn,
    input s_axis_scalar_62_tlast,
    input s_axis_scalar_62_tvalid,
    input [S_AXIS_SCALAR_62_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_62_tkeep,
    input [S_AXIS_SCALAR_62_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_62_tstrb,
    input [S_AXIS_SCALAR_62_DIRECT_DMWIDTH-1:0] s_axis_scalar_62_tdata,
    output s_axis_scalar_62_tready,
    //input AXI-Stream to Scalar interface 63
    input s_axis_scalar_63_aclk,
    input s_axis_scalar_63_aresetn,
    input s_axis_scalar_63_tlast,
    input s_axis_scalar_63_tvalid,
    input [S_AXIS_SCALAR_63_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_63_tkeep,
    input [S_AXIS_SCALAR_63_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_63_tstrb,
    input [S_AXIS_SCALAR_63_DIRECT_DMWIDTH-1:0] s_axis_scalar_63_tdata,
    output s_axis_scalar_63_tready,
    //input AXI-Stream to Scalar interface 64
    input s_axis_scalar_64_aclk,
    input s_axis_scalar_64_aresetn,
    input s_axis_scalar_64_tlast,
    input s_axis_scalar_64_tvalid,
    input [S_AXIS_SCALAR_64_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_64_tkeep,
    input [S_AXIS_SCALAR_64_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_64_tstrb,
    input [S_AXIS_SCALAR_64_DIRECT_DMWIDTH-1:0] s_axis_scalar_64_tdata,
    output s_axis_scalar_64_tready,
    //input AXI-Stream to Scalar interface 65
    input s_axis_scalar_65_aclk,
    input s_axis_scalar_65_aresetn,
    input s_axis_scalar_65_tlast,
    input s_axis_scalar_65_tvalid,
    input [S_AXIS_SCALAR_65_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_65_tkeep,
    input [S_AXIS_SCALAR_65_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_65_tstrb,
    input [S_AXIS_SCALAR_65_DIRECT_DMWIDTH-1:0] s_axis_scalar_65_tdata,
    output s_axis_scalar_65_tready,
    //input AXI-Stream to Scalar interface 66
    input s_axis_scalar_66_aclk,
    input s_axis_scalar_66_aresetn,
    input s_axis_scalar_66_tlast,
    input s_axis_scalar_66_tvalid,
    input [S_AXIS_SCALAR_66_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_66_tkeep,
    input [S_AXIS_SCALAR_66_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_66_tstrb,
    input [S_AXIS_SCALAR_66_DIRECT_DMWIDTH-1:0] s_axis_scalar_66_tdata,
    output s_axis_scalar_66_tready,
    //input AXI-Stream to Scalar interface 67
    input s_axis_scalar_67_aclk,
    input s_axis_scalar_67_aresetn,
    input s_axis_scalar_67_tlast,
    input s_axis_scalar_67_tvalid,
    input [S_AXIS_SCALAR_67_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_67_tkeep,
    input [S_AXIS_SCALAR_67_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_67_tstrb,
    input [S_AXIS_SCALAR_67_DIRECT_DMWIDTH-1:0] s_axis_scalar_67_tdata,
    output s_axis_scalar_67_tready,
    //input AXI-Stream to Scalar interface 68
    input s_axis_scalar_68_aclk,
    input s_axis_scalar_68_aresetn,
    input s_axis_scalar_68_tlast,
    input s_axis_scalar_68_tvalid,
    input [S_AXIS_SCALAR_68_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_68_tkeep,
    input [S_AXIS_SCALAR_68_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_68_tstrb,
    input [S_AXIS_SCALAR_68_DIRECT_DMWIDTH-1:0] s_axis_scalar_68_tdata,
    output s_axis_scalar_68_tready,
    //input AXI-Stream to Scalar interface 69
    input s_axis_scalar_69_aclk,
    input s_axis_scalar_69_aresetn,
    input s_axis_scalar_69_tlast,
    input s_axis_scalar_69_tvalid,
    input [S_AXIS_SCALAR_69_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_69_tkeep,
    input [S_AXIS_SCALAR_69_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_69_tstrb,
    input [S_AXIS_SCALAR_69_DIRECT_DMWIDTH-1:0] s_axis_scalar_69_tdata,
    output s_axis_scalar_69_tready,
    //input AXI-Stream to Scalar interface 70
    input s_axis_scalar_70_aclk,
    input s_axis_scalar_70_aresetn,
    input s_axis_scalar_70_tlast,
    input s_axis_scalar_70_tvalid,
    input [S_AXIS_SCALAR_70_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_70_tkeep,
    input [S_AXIS_SCALAR_70_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_70_tstrb,
    input [S_AXIS_SCALAR_70_DIRECT_DMWIDTH-1:0] s_axis_scalar_70_tdata,
    output s_axis_scalar_70_tready,
    //input AXI-Stream to Scalar interface 71
    input s_axis_scalar_71_aclk,
    input s_axis_scalar_71_aresetn,
    input s_axis_scalar_71_tlast,
    input s_axis_scalar_71_tvalid,
    input [S_AXIS_SCALAR_71_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_71_tkeep,
    input [S_AXIS_SCALAR_71_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_71_tstrb,
    input [S_AXIS_SCALAR_71_DIRECT_DMWIDTH-1:0] s_axis_scalar_71_tdata,
    output s_axis_scalar_71_tready,
    //input AXI-Stream to Scalar interface 72
    input s_axis_scalar_72_aclk,
    input s_axis_scalar_72_aresetn,
    input s_axis_scalar_72_tlast,
    input s_axis_scalar_72_tvalid,
    input [S_AXIS_SCALAR_72_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_72_tkeep,
    input [S_AXIS_SCALAR_72_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_72_tstrb,
    input [S_AXIS_SCALAR_72_DIRECT_DMWIDTH-1:0] s_axis_scalar_72_tdata,
    output s_axis_scalar_72_tready,
    //input AXI-Stream to Scalar interface 73
    input s_axis_scalar_73_aclk,
    input s_axis_scalar_73_aresetn,
    input s_axis_scalar_73_tlast,
    input s_axis_scalar_73_tvalid,
    input [S_AXIS_SCALAR_73_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_73_tkeep,
    input [S_AXIS_SCALAR_73_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_73_tstrb,
    input [S_AXIS_SCALAR_73_DIRECT_DMWIDTH-1:0] s_axis_scalar_73_tdata,
    output s_axis_scalar_73_tready,
    //input AXI-Stream to Scalar interface 74
    input s_axis_scalar_74_aclk,
    input s_axis_scalar_74_aresetn,
    input s_axis_scalar_74_tlast,
    input s_axis_scalar_74_tvalid,
    input [S_AXIS_SCALAR_74_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_74_tkeep,
    input [S_AXIS_SCALAR_74_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_74_tstrb,
    input [S_AXIS_SCALAR_74_DIRECT_DMWIDTH-1:0] s_axis_scalar_74_tdata,
    output s_axis_scalar_74_tready,
    //input AXI-Stream to Scalar interface 75
    input s_axis_scalar_75_aclk,
    input s_axis_scalar_75_aresetn,
    input s_axis_scalar_75_tlast,
    input s_axis_scalar_75_tvalid,
    input [S_AXIS_SCALAR_75_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_75_tkeep,
    input [S_AXIS_SCALAR_75_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_75_tstrb,
    input [S_AXIS_SCALAR_75_DIRECT_DMWIDTH-1:0] s_axis_scalar_75_tdata,
    output s_axis_scalar_75_tready,
    //input AXI-Stream to Scalar interface 76
    input s_axis_scalar_76_aclk,
    input s_axis_scalar_76_aresetn,
    input s_axis_scalar_76_tlast,
    input s_axis_scalar_76_tvalid,
    input [S_AXIS_SCALAR_76_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_76_tkeep,
    input [S_AXIS_SCALAR_76_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_76_tstrb,
    input [S_AXIS_SCALAR_76_DIRECT_DMWIDTH-1:0] s_axis_scalar_76_tdata,
    output s_axis_scalar_76_tready,
    //input AXI-Stream to Scalar interface 77
    input s_axis_scalar_77_aclk,
    input s_axis_scalar_77_aresetn,
    input s_axis_scalar_77_tlast,
    input s_axis_scalar_77_tvalid,
    input [S_AXIS_SCALAR_77_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_77_tkeep,
    input [S_AXIS_SCALAR_77_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_77_tstrb,
    input [S_AXIS_SCALAR_77_DIRECT_DMWIDTH-1:0] s_axis_scalar_77_tdata,
    output s_axis_scalar_77_tready,
    //input AXI-Stream to Scalar interface 78
    input s_axis_scalar_78_aclk,
    input s_axis_scalar_78_aresetn,
    input s_axis_scalar_78_tlast,
    input s_axis_scalar_78_tvalid,
    input [S_AXIS_SCALAR_78_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_78_tkeep,
    input [S_AXIS_SCALAR_78_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_78_tstrb,
    input [S_AXIS_SCALAR_78_DIRECT_DMWIDTH-1:0] s_axis_scalar_78_tdata,
    output s_axis_scalar_78_tready,
    //input AXI-Stream to Scalar interface 79
    input s_axis_scalar_79_aclk,
    input s_axis_scalar_79_aresetn,
    input s_axis_scalar_79_tlast,
    input s_axis_scalar_79_tvalid,
    input [S_AXIS_SCALAR_79_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_79_tkeep,
    input [S_AXIS_SCALAR_79_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_79_tstrb,
    input [S_AXIS_SCALAR_79_DIRECT_DMWIDTH-1:0] s_axis_scalar_79_tdata,
    output s_axis_scalar_79_tready,
    //input AXI-Stream to Scalar interface 80
    input s_axis_scalar_80_aclk,
    input s_axis_scalar_80_aresetn,
    input s_axis_scalar_80_tlast,
    input s_axis_scalar_80_tvalid,
    input [S_AXIS_SCALAR_80_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_80_tkeep,
    input [S_AXIS_SCALAR_80_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_80_tstrb,
    input [S_AXIS_SCALAR_80_DIRECT_DMWIDTH-1:0] s_axis_scalar_80_tdata,
    output s_axis_scalar_80_tready,
    //input AXI-Stream to Scalar interface 81
    input s_axis_scalar_81_aclk,
    input s_axis_scalar_81_aresetn,
    input s_axis_scalar_81_tlast,
    input s_axis_scalar_81_tvalid,
    input [S_AXIS_SCALAR_81_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_81_tkeep,
    input [S_AXIS_SCALAR_81_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_81_tstrb,
    input [S_AXIS_SCALAR_81_DIRECT_DMWIDTH-1:0] s_axis_scalar_81_tdata,
    output s_axis_scalar_81_tready,
    //input AXI-Stream to Scalar interface 82
    input s_axis_scalar_82_aclk,
    input s_axis_scalar_82_aresetn,
    input s_axis_scalar_82_tlast,
    input s_axis_scalar_82_tvalid,
    input [S_AXIS_SCALAR_82_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_82_tkeep,
    input [S_AXIS_SCALAR_82_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_82_tstrb,
    input [S_AXIS_SCALAR_82_DIRECT_DMWIDTH-1:0] s_axis_scalar_82_tdata,
    output s_axis_scalar_82_tready,
    //input AXI-Stream to Scalar interface 83
    input s_axis_scalar_83_aclk,
    input s_axis_scalar_83_aresetn,
    input s_axis_scalar_83_tlast,
    input s_axis_scalar_83_tvalid,
    input [S_AXIS_SCALAR_83_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_83_tkeep,
    input [S_AXIS_SCALAR_83_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_83_tstrb,
    input [S_AXIS_SCALAR_83_DIRECT_DMWIDTH-1:0] s_axis_scalar_83_tdata,
    output s_axis_scalar_83_tready,
    //input AXI-Stream to Scalar interface 84
    input s_axis_scalar_84_aclk,
    input s_axis_scalar_84_aresetn,
    input s_axis_scalar_84_tlast,
    input s_axis_scalar_84_tvalid,
    input [S_AXIS_SCALAR_84_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_84_tkeep,
    input [S_AXIS_SCALAR_84_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_84_tstrb,
    input [S_AXIS_SCALAR_84_DIRECT_DMWIDTH-1:0] s_axis_scalar_84_tdata,
    output s_axis_scalar_84_tready,
    //input AXI-Stream to Scalar interface 85
    input s_axis_scalar_85_aclk,
    input s_axis_scalar_85_aresetn,
    input s_axis_scalar_85_tlast,
    input s_axis_scalar_85_tvalid,
    input [S_AXIS_SCALAR_85_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_85_tkeep,
    input [S_AXIS_SCALAR_85_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_85_tstrb,
    input [S_AXIS_SCALAR_85_DIRECT_DMWIDTH-1:0] s_axis_scalar_85_tdata,
    output s_axis_scalar_85_tready,
    //input AXI-Stream to Scalar interface 86
    input s_axis_scalar_86_aclk,
    input s_axis_scalar_86_aresetn,
    input s_axis_scalar_86_tlast,
    input s_axis_scalar_86_tvalid,
    input [S_AXIS_SCALAR_86_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_86_tkeep,
    input [S_AXIS_SCALAR_86_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_86_tstrb,
    input [S_AXIS_SCALAR_86_DIRECT_DMWIDTH-1:0] s_axis_scalar_86_tdata,
    output s_axis_scalar_86_tready,
    //input AXI-Stream to Scalar interface 87
    input s_axis_scalar_87_aclk,
    input s_axis_scalar_87_aresetn,
    input s_axis_scalar_87_tlast,
    input s_axis_scalar_87_tvalid,
    input [S_AXIS_SCALAR_87_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_87_tkeep,
    input [S_AXIS_SCALAR_87_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_87_tstrb,
    input [S_AXIS_SCALAR_87_DIRECT_DMWIDTH-1:0] s_axis_scalar_87_tdata,
    output s_axis_scalar_87_tready,
    //input AXI-Stream to Scalar interface 88
    input s_axis_scalar_88_aclk,
    input s_axis_scalar_88_aresetn,
    input s_axis_scalar_88_tlast,
    input s_axis_scalar_88_tvalid,
    input [S_AXIS_SCALAR_88_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_88_tkeep,
    input [S_AXIS_SCALAR_88_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_88_tstrb,
    input [S_AXIS_SCALAR_88_DIRECT_DMWIDTH-1:0] s_axis_scalar_88_tdata,
    output s_axis_scalar_88_tready,
    //input AXI-Stream to Scalar interface 89
    input s_axis_scalar_89_aclk,
    input s_axis_scalar_89_aresetn,
    input s_axis_scalar_89_tlast,
    input s_axis_scalar_89_tvalid,
    input [S_AXIS_SCALAR_89_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_89_tkeep,
    input [S_AXIS_SCALAR_89_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_89_tstrb,
    input [S_AXIS_SCALAR_89_DIRECT_DMWIDTH-1:0] s_axis_scalar_89_tdata,
    output s_axis_scalar_89_tready,
    //input AXI-Stream to Scalar interface 90
    input s_axis_scalar_90_aclk,
    input s_axis_scalar_90_aresetn,
    input s_axis_scalar_90_tlast,
    input s_axis_scalar_90_tvalid,
    input [S_AXIS_SCALAR_90_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_90_tkeep,
    input [S_AXIS_SCALAR_90_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_90_tstrb,
    input [S_AXIS_SCALAR_90_DIRECT_DMWIDTH-1:0] s_axis_scalar_90_tdata,
    output s_axis_scalar_90_tready,
    //input AXI-Stream to Scalar interface 91
    input s_axis_scalar_91_aclk,
    input s_axis_scalar_91_aresetn,
    input s_axis_scalar_91_tlast,
    input s_axis_scalar_91_tvalid,
    input [S_AXIS_SCALAR_91_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_91_tkeep,
    input [S_AXIS_SCALAR_91_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_91_tstrb,
    input [S_AXIS_SCALAR_91_DIRECT_DMWIDTH-1:0] s_axis_scalar_91_tdata,
    output s_axis_scalar_91_tready,
    //input AXI-Stream to Scalar interface 92
    input s_axis_scalar_92_aclk,
    input s_axis_scalar_92_aresetn,
    input s_axis_scalar_92_tlast,
    input s_axis_scalar_92_tvalid,
    input [S_AXIS_SCALAR_92_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_92_tkeep,
    input [S_AXIS_SCALAR_92_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_92_tstrb,
    input [S_AXIS_SCALAR_92_DIRECT_DMWIDTH-1:0] s_axis_scalar_92_tdata,
    output s_axis_scalar_92_tready,
    //input AXI-Stream to Scalar interface 93
    input s_axis_scalar_93_aclk,
    input s_axis_scalar_93_aresetn,
    input s_axis_scalar_93_tlast,
    input s_axis_scalar_93_tvalid,
    input [S_AXIS_SCALAR_93_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_93_tkeep,
    input [S_AXIS_SCALAR_93_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_93_tstrb,
    input [S_AXIS_SCALAR_93_DIRECT_DMWIDTH-1:0] s_axis_scalar_93_tdata,
    output s_axis_scalar_93_tready,
    //input AXI-Stream to Scalar interface 94
    input s_axis_scalar_94_aclk,
    input s_axis_scalar_94_aresetn,
    input s_axis_scalar_94_tlast,
    input s_axis_scalar_94_tvalid,
    input [S_AXIS_SCALAR_94_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_94_tkeep,
    input [S_AXIS_SCALAR_94_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_94_tstrb,
    input [S_AXIS_SCALAR_94_DIRECT_DMWIDTH-1:0] s_axis_scalar_94_tdata,
    output s_axis_scalar_94_tready,
    //input AXI-Stream to Scalar interface 95
    input s_axis_scalar_95_aclk,
    input s_axis_scalar_95_aresetn,
    input s_axis_scalar_95_tlast,
    input s_axis_scalar_95_tvalid,
    input [S_AXIS_SCALAR_95_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_95_tkeep,
    input [S_AXIS_SCALAR_95_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_95_tstrb,
    input [S_AXIS_SCALAR_95_DIRECT_DMWIDTH-1:0] s_axis_scalar_95_tdata,
    output s_axis_scalar_95_tready,
    //input AXI-Stream to Scalar interface 96
    input s_axis_scalar_96_aclk,
    input s_axis_scalar_96_aresetn,
    input s_axis_scalar_96_tlast,
    input s_axis_scalar_96_tvalid,
    input [S_AXIS_SCALAR_96_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_96_tkeep,
    input [S_AXIS_SCALAR_96_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_96_tstrb,
    input [S_AXIS_SCALAR_96_DIRECT_DMWIDTH-1:0] s_axis_scalar_96_tdata,
    output s_axis_scalar_96_tready,
    //input AXI-Stream to Scalar interface 97
    input s_axis_scalar_97_aclk,
    input s_axis_scalar_97_aresetn,
    input s_axis_scalar_97_tlast,
    input s_axis_scalar_97_tvalid,
    input [S_AXIS_SCALAR_97_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_97_tkeep,
    input [S_AXIS_SCALAR_97_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_97_tstrb,
    input [S_AXIS_SCALAR_97_DIRECT_DMWIDTH-1:0] s_axis_scalar_97_tdata,
    output s_axis_scalar_97_tready,
    //input AXI-Stream to Scalar interface 98
    input s_axis_scalar_98_aclk,
    input s_axis_scalar_98_aresetn,
    input s_axis_scalar_98_tlast,
    input s_axis_scalar_98_tvalid,
    input [S_AXIS_SCALAR_98_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_98_tkeep,
    input [S_AXIS_SCALAR_98_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_98_tstrb,
    input [S_AXIS_SCALAR_98_DIRECT_DMWIDTH-1:0] s_axis_scalar_98_tdata,
    output s_axis_scalar_98_tready,
    //input AXI-Stream to Scalar interface 99
    input s_axis_scalar_99_aclk,
    input s_axis_scalar_99_aresetn,
    input s_axis_scalar_99_tlast,
    input s_axis_scalar_99_tvalid,
    input [S_AXIS_SCALAR_99_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_99_tkeep,
    input [S_AXIS_SCALAR_99_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_99_tstrb,
    input [S_AXIS_SCALAR_99_DIRECT_DMWIDTH-1:0] s_axis_scalar_99_tdata,
    output s_axis_scalar_99_tready,
    //input AXI-Stream to Scalar interface 100
    input s_axis_scalar_100_aclk,
    input s_axis_scalar_100_aresetn,
    input s_axis_scalar_100_tlast,
    input s_axis_scalar_100_tvalid,
    input [S_AXIS_SCALAR_100_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_100_tkeep,
    input [S_AXIS_SCALAR_100_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_100_tstrb,
    input [S_AXIS_SCALAR_100_DIRECT_DMWIDTH-1:0] s_axis_scalar_100_tdata,
    output s_axis_scalar_100_tready,
    //input AXI-Stream to Scalar interface 101
    input s_axis_scalar_101_aclk,
    input s_axis_scalar_101_aresetn,
    input s_axis_scalar_101_tlast,
    input s_axis_scalar_101_tvalid,
    input [S_AXIS_SCALAR_101_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_101_tkeep,
    input [S_AXIS_SCALAR_101_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_101_tstrb,
    input [S_AXIS_SCALAR_101_DIRECT_DMWIDTH-1:0] s_axis_scalar_101_tdata,
    output s_axis_scalar_101_tready,
    //input AXI-Stream to Scalar interface 102
    input s_axis_scalar_102_aclk,
    input s_axis_scalar_102_aresetn,
    input s_axis_scalar_102_tlast,
    input s_axis_scalar_102_tvalid,
    input [S_AXIS_SCALAR_102_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_102_tkeep,
    input [S_AXIS_SCALAR_102_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_102_tstrb,
    input [S_AXIS_SCALAR_102_DIRECT_DMWIDTH-1:0] s_axis_scalar_102_tdata,
    output s_axis_scalar_102_tready,
    //input AXI-Stream to Scalar interface 103
    input s_axis_scalar_103_aclk,
    input s_axis_scalar_103_aresetn,
    input s_axis_scalar_103_tlast,
    input s_axis_scalar_103_tvalid,
    input [S_AXIS_SCALAR_103_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_103_tkeep,
    input [S_AXIS_SCALAR_103_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_103_tstrb,
    input [S_AXIS_SCALAR_103_DIRECT_DMWIDTH-1:0] s_axis_scalar_103_tdata,
    output s_axis_scalar_103_tready,
    //input AXI-Stream to Scalar interface 104
    input s_axis_scalar_104_aclk,
    input s_axis_scalar_104_aresetn,
    input s_axis_scalar_104_tlast,
    input s_axis_scalar_104_tvalid,
    input [S_AXIS_SCALAR_104_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_104_tkeep,
    input [S_AXIS_SCALAR_104_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_104_tstrb,
    input [S_AXIS_SCALAR_104_DIRECT_DMWIDTH-1:0] s_axis_scalar_104_tdata,
    output s_axis_scalar_104_tready,
    //input AXI-Stream to Scalar interface 105
    input s_axis_scalar_105_aclk,
    input s_axis_scalar_105_aresetn,
    input s_axis_scalar_105_tlast,
    input s_axis_scalar_105_tvalid,
    input [S_AXIS_SCALAR_105_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_105_tkeep,
    input [S_AXIS_SCALAR_105_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_105_tstrb,
    input [S_AXIS_SCALAR_105_DIRECT_DMWIDTH-1:0] s_axis_scalar_105_tdata,
    output s_axis_scalar_105_tready,
    //input AXI-Stream to Scalar interface 106
    input s_axis_scalar_106_aclk,
    input s_axis_scalar_106_aresetn,
    input s_axis_scalar_106_tlast,
    input s_axis_scalar_106_tvalid,
    input [S_AXIS_SCALAR_106_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_106_tkeep,
    input [S_AXIS_SCALAR_106_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_106_tstrb,
    input [S_AXIS_SCALAR_106_DIRECT_DMWIDTH-1:0] s_axis_scalar_106_tdata,
    output s_axis_scalar_106_tready,
    //input AXI-Stream to Scalar interface 107
    input s_axis_scalar_107_aclk,
    input s_axis_scalar_107_aresetn,
    input s_axis_scalar_107_tlast,
    input s_axis_scalar_107_tvalid,
    input [S_AXIS_SCALAR_107_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_107_tkeep,
    input [S_AXIS_SCALAR_107_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_107_tstrb,
    input [S_AXIS_SCALAR_107_DIRECT_DMWIDTH-1:0] s_axis_scalar_107_tdata,
    output s_axis_scalar_107_tready,
    //input AXI-Stream to Scalar interface 108
    input s_axis_scalar_108_aclk,
    input s_axis_scalar_108_aresetn,
    input s_axis_scalar_108_tlast,
    input s_axis_scalar_108_tvalid,
    input [S_AXIS_SCALAR_108_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_108_tkeep,
    input [S_AXIS_SCALAR_108_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_108_tstrb,
    input [S_AXIS_SCALAR_108_DIRECT_DMWIDTH-1:0] s_axis_scalar_108_tdata,
    output s_axis_scalar_108_tready,
    //input AXI-Stream to Scalar interface 109
    input s_axis_scalar_109_aclk,
    input s_axis_scalar_109_aresetn,
    input s_axis_scalar_109_tlast,
    input s_axis_scalar_109_tvalid,
    input [S_AXIS_SCALAR_109_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_109_tkeep,
    input [S_AXIS_SCALAR_109_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_109_tstrb,
    input [S_AXIS_SCALAR_109_DIRECT_DMWIDTH-1:0] s_axis_scalar_109_tdata,
    output s_axis_scalar_109_tready,
    //input AXI-Stream to Scalar interface 110
    input s_axis_scalar_110_aclk,
    input s_axis_scalar_110_aresetn,
    input s_axis_scalar_110_tlast,
    input s_axis_scalar_110_tvalid,
    input [S_AXIS_SCALAR_110_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_110_tkeep,
    input [S_AXIS_SCALAR_110_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_110_tstrb,
    input [S_AXIS_SCALAR_110_DIRECT_DMWIDTH-1:0] s_axis_scalar_110_tdata,
    output s_axis_scalar_110_tready,
    //input AXI-Stream to Scalar interface 111
    input s_axis_scalar_111_aclk,
    input s_axis_scalar_111_aresetn,
    input s_axis_scalar_111_tlast,
    input s_axis_scalar_111_tvalid,
    input [S_AXIS_SCALAR_111_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_111_tkeep,
    input [S_AXIS_SCALAR_111_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_111_tstrb,
    input [S_AXIS_SCALAR_111_DIRECT_DMWIDTH-1:0] s_axis_scalar_111_tdata,
    output s_axis_scalar_111_tready,
    //input AXI-Stream to Scalar interface 112
    input s_axis_scalar_112_aclk,
    input s_axis_scalar_112_aresetn,
    input s_axis_scalar_112_tlast,
    input s_axis_scalar_112_tvalid,
    input [S_AXIS_SCALAR_112_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_112_tkeep,
    input [S_AXIS_SCALAR_112_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_112_tstrb,
    input [S_AXIS_SCALAR_112_DIRECT_DMWIDTH-1:0] s_axis_scalar_112_tdata,
    output s_axis_scalar_112_tready,
    //input AXI-Stream to Scalar interface 113
    input s_axis_scalar_113_aclk,
    input s_axis_scalar_113_aresetn,
    input s_axis_scalar_113_tlast,
    input s_axis_scalar_113_tvalid,
    input [S_AXIS_SCALAR_113_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_113_tkeep,
    input [S_AXIS_SCALAR_113_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_113_tstrb,
    input [S_AXIS_SCALAR_113_DIRECT_DMWIDTH-1:0] s_axis_scalar_113_tdata,
    output s_axis_scalar_113_tready,
    //input AXI-Stream to Scalar interface 114
    input s_axis_scalar_114_aclk,
    input s_axis_scalar_114_aresetn,
    input s_axis_scalar_114_tlast,
    input s_axis_scalar_114_tvalid,
    input [S_AXIS_SCALAR_114_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_114_tkeep,
    input [S_AXIS_SCALAR_114_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_114_tstrb,
    input [S_AXIS_SCALAR_114_DIRECT_DMWIDTH-1:0] s_axis_scalar_114_tdata,
    output s_axis_scalar_114_tready,
    //input AXI-Stream to Scalar interface 115
    input s_axis_scalar_115_aclk,
    input s_axis_scalar_115_aresetn,
    input s_axis_scalar_115_tlast,
    input s_axis_scalar_115_tvalid,
    input [S_AXIS_SCALAR_115_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_115_tkeep,
    input [S_AXIS_SCALAR_115_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_115_tstrb,
    input [S_AXIS_SCALAR_115_DIRECT_DMWIDTH-1:0] s_axis_scalar_115_tdata,
    output s_axis_scalar_115_tready,
    //input AXI-Stream to Scalar interface 116
    input s_axis_scalar_116_aclk,
    input s_axis_scalar_116_aresetn,
    input s_axis_scalar_116_tlast,
    input s_axis_scalar_116_tvalid,
    input [S_AXIS_SCALAR_116_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_116_tkeep,
    input [S_AXIS_SCALAR_116_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_116_tstrb,
    input [S_AXIS_SCALAR_116_DIRECT_DMWIDTH-1:0] s_axis_scalar_116_tdata,
    output s_axis_scalar_116_tready,
    //input AXI-Stream to Scalar interface 117
    input s_axis_scalar_117_aclk,
    input s_axis_scalar_117_aresetn,
    input s_axis_scalar_117_tlast,
    input s_axis_scalar_117_tvalid,
    input [S_AXIS_SCALAR_117_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_117_tkeep,
    input [S_AXIS_SCALAR_117_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_117_tstrb,
    input [S_AXIS_SCALAR_117_DIRECT_DMWIDTH-1:0] s_axis_scalar_117_tdata,
    output s_axis_scalar_117_tready,
    //input AXI-Stream to Scalar interface 118
    input s_axis_scalar_118_aclk,
    input s_axis_scalar_118_aresetn,
    input s_axis_scalar_118_tlast,
    input s_axis_scalar_118_tvalid,
    input [S_AXIS_SCALAR_118_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_118_tkeep,
    input [S_AXIS_SCALAR_118_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_118_tstrb,
    input [S_AXIS_SCALAR_118_DIRECT_DMWIDTH-1:0] s_axis_scalar_118_tdata,
    output s_axis_scalar_118_tready,
    //input AXI-Stream to Scalar interface 119
    input s_axis_scalar_119_aclk,
    input s_axis_scalar_119_aresetn,
    input s_axis_scalar_119_tlast,
    input s_axis_scalar_119_tvalid,
    input [S_AXIS_SCALAR_119_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_119_tkeep,
    input [S_AXIS_SCALAR_119_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_119_tstrb,
    input [S_AXIS_SCALAR_119_DIRECT_DMWIDTH-1:0] s_axis_scalar_119_tdata,
    output s_axis_scalar_119_tready,
    //input AXI-Stream to Scalar interface 120
    input s_axis_scalar_120_aclk,
    input s_axis_scalar_120_aresetn,
    input s_axis_scalar_120_tlast,
    input s_axis_scalar_120_tvalid,
    input [S_AXIS_SCALAR_120_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_120_tkeep,
    input [S_AXIS_SCALAR_120_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_120_tstrb,
    input [S_AXIS_SCALAR_120_DIRECT_DMWIDTH-1:0] s_axis_scalar_120_tdata,
    output s_axis_scalar_120_tready,
    //input AXI-Stream to Scalar interface 121
    input s_axis_scalar_121_aclk,
    input s_axis_scalar_121_aresetn,
    input s_axis_scalar_121_tlast,
    input s_axis_scalar_121_tvalid,
    input [S_AXIS_SCALAR_121_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_121_tkeep,
    input [S_AXIS_SCALAR_121_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_121_tstrb,
    input [S_AXIS_SCALAR_121_DIRECT_DMWIDTH-1:0] s_axis_scalar_121_tdata,
    output s_axis_scalar_121_tready,
    //input AXI-Stream to Scalar interface 122
    input s_axis_scalar_122_aclk,
    input s_axis_scalar_122_aresetn,
    input s_axis_scalar_122_tlast,
    input s_axis_scalar_122_tvalid,
    input [S_AXIS_SCALAR_122_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_122_tkeep,
    input [S_AXIS_SCALAR_122_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_122_tstrb,
    input [S_AXIS_SCALAR_122_DIRECT_DMWIDTH-1:0] s_axis_scalar_122_tdata,
    output s_axis_scalar_122_tready,
    //input AXI-Stream to Scalar interface 123
    input s_axis_scalar_123_aclk,
    input s_axis_scalar_123_aresetn,
    input s_axis_scalar_123_tlast,
    input s_axis_scalar_123_tvalid,
    input [S_AXIS_SCALAR_123_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_123_tkeep,
    input [S_AXIS_SCALAR_123_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_123_tstrb,
    input [S_AXIS_SCALAR_123_DIRECT_DMWIDTH-1:0] s_axis_scalar_123_tdata,
    output s_axis_scalar_123_tready,
    //input AXI-Stream to Scalar interface 124
    input s_axis_scalar_124_aclk,
    input s_axis_scalar_124_aresetn,
    input s_axis_scalar_124_tlast,
    input s_axis_scalar_124_tvalid,
    input [S_AXIS_SCALAR_124_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_124_tkeep,
    input [S_AXIS_SCALAR_124_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_124_tstrb,
    input [S_AXIS_SCALAR_124_DIRECT_DMWIDTH-1:0] s_axis_scalar_124_tdata,
    output s_axis_scalar_124_tready,
    //input AXI-Stream to Scalar interface 125
    input s_axis_scalar_125_aclk,
    input s_axis_scalar_125_aresetn,
    input s_axis_scalar_125_tlast,
    input s_axis_scalar_125_tvalid,
    input [S_AXIS_SCALAR_125_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_125_tkeep,
    input [S_AXIS_SCALAR_125_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_125_tstrb,
    input [S_AXIS_SCALAR_125_DIRECT_DMWIDTH-1:0] s_axis_scalar_125_tdata,
    output s_axis_scalar_125_tready,
    //input AXI-Stream to Scalar interface 126
    input s_axis_scalar_126_aclk,
    input s_axis_scalar_126_aresetn,
    input s_axis_scalar_126_tlast,
    input s_axis_scalar_126_tvalid,
    input [S_AXIS_SCALAR_126_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_126_tkeep,
    input [S_AXIS_SCALAR_126_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_126_tstrb,
    input [S_AXIS_SCALAR_126_DIRECT_DMWIDTH-1:0] s_axis_scalar_126_tdata,
    output s_axis_scalar_126_tready,
    //input AXI-Stream to Scalar interface 127
    input s_axis_scalar_127_aclk,
    input s_axis_scalar_127_aresetn,
    input s_axis_scalar_127_tlast,
    input s_axis_scalar_127_tvalid,
    input [S_AXIS_SCALAR_127_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_127_tkeep,
    input [S_AXIS_SCALAR_127_DIRECT_DMWIDTH/8-1:0] s_axis_scalar_127_tstrb,
    input [S_AXIS_SCALAR_127_DIRECT_DMWIDTH-1:0] s_axis_scalar_127_tdata,
    output s_axis_scalar_127_tready,
    //output scalar ports
    input [C_OUTSCALAR_0_BITS-1:0] outscalar0,
    input [C_OUTSCALAR_1_BITS-1:0] outscalar1,
    input [C_OUTSCALAR_2_BITS-1:0] outscalar2,
    input [C_OUTSCALAR_3_BITS-1:0] outscalar3,
    input [C_OUTSCALAR_4_BITS-1:0] outscalar4,
    input [C_OUTSCALAR_5_BITS-1:0] outscalar5,
    input [C_OUTSCALAR_6_BITS-1:0] outscalar6,
    input [C_OUTSCALAR_7_BITS-1:0] outscalar7,
    input [C_OUTSCALAR_8_BITS-1:0] outscalar8,
    input [C_OUTSCALAR_9_BITS-1:0] outscalar9,
    input [C_OUTSCALAR_10_BITS-1:0] outscalar10,
    input [C_OUTSCALAR_11_BITS-1:0] outscalar11,
    input [C_OUTSCALAR_12_BITS-1:0] outscalar12,
    input [C_OUTSCALAR_13_BITS-1:0] outscalar13,
    input [C_OUTSCALAR_14_BITS-1:0] outscalar14,
    input [C_OUTSCALAR_15_BITS-1:0] outscalar15,
    input [C_OUTSCALAR_16_BITS-1:0] outscalar16,
    input [C_OUTSCALAR_17_BITS-1:0] outscalar17,
    input [C_OUTSCALAR_18_BITS-1:0] outscalar18,
    input [C_OUTSCALAR_19_BITS-1:0] outscalar19,
    input [C_OUTSCALAR_20_BITS-1:0] outscalar20,
    input [C_OUTSCALAR_21_BITS-1:0] outscalar21,
    input [C_OUTSCALAR_22_BITS-1:0] outscalar22,
    input [C_OUTSCALAR_23_BITS-1:0] outscalar23,
    input [C_OUTSCALAR_24_BITS-1:0] outscalar24,
    input [C_OUTSCALAR_25_BITS-1:0] outscalar25,
    input [C_OUTSCALAR_26_BITS-1:0] outscalar26,
    input [C_OUTSCALAR_27_BITS-1:0] outscalar27,
    input [C_OUTSCALAR_28_BITS-1:0] outscalar28,
    input [C_OUTSCALAR_29_BITS-1:0] outscalar29,
    input [C_OUTSCALAR_30_BITS-1:0] outscalar30,
    input [C_OUTSCALAR_31_BITS-1:0] outscalar31,
    input [C_OUTSCALAR_32_BITS-1:0] outscalar32,
    input [C_OUTSCALAR_33_BITS-1:0] outscalar33,
    input [C_OUTSCALAR_34_BITS-1:0] outscalar34,
    input [C_OUTSCALAR_35_BITS-1:0] outscalar35,
    input [C_OUTSCALAR_36_BITS-1:0] outscalar36,
    input [C_OUTSCALAR_37_BITS-1:0] outscalar37,
    input [C_OUTSCALAR_38_BITS-1:0] outscalar38,
    input [C_OUTSCALAR_39_BITS-1:0] outscalar39,
    input [C_OUTSCALAR_40_BITS-1:0] outscalar40,
    input [C_OUTSCALAR_41_BITS-1:0] outscalar41,
    input [C_OUTSCALAR_42_BITS-1:0] outscalar42,
    input [C_OUTSCALAR_43_BITS-1:0] outscalar43,
    input [C_OUTSCALAR_44_BITS-1:0] outscalar44,
    input [C_OUTSCALAR_45_BITS-1:0] outscalar45,
    input [C_OUTSCALAR_46_BITS-1:0] outscalar46,
    input [C_OUTSCALAR_47_BITS-1:0] outscalar47,
    input [C_OUTSCALAR_48_BITS-1:0] outscalar48,
    input [C_OUTSCALAR_49_BITS-1:0] outscalar49,
    input [C_OUTSCALAR_50_BITS-1:0] outscalar50,
    input [C_OUTSCALAR_51_BITS-1:0] outscalar51,
    input [C_OUTSCALAR_52_BITS-1:0] outscalar52,
    input [C_OUTSCALAR_53_BITS-1:0] outscalar53,
    input [C_OUTSCALAR_54_BITS-1:0] outscalar54,
    input [C_OUTSCALAR_55_BITS-1:0] outscalar55,
    input [C_OUTSCALAR_56_BITS-1:0] outscalar56,
    input [C_OUTSCALAR_57_BITS-1:0] outscalar57,
    input [C_OUTSCALAR_58_BITS-1:0] outscalar58,
    input [C_OUTSCALAR_59_BITS-1:0] outscalar59,
    input [C_OUTSCALAR_60_BITS-1:0] outscalar60,
    input [C_OUTSCALAR_61_BITS-1:0] outscalar61,
    input [C_OUTSCALAR_62_BITS-1:0] outscalar62,
    input [C_OUTSCALAR_63_BITS-1:0] outscalar63,
    input [C_OUTSCALAR_64_BITS-1:0] outscalar64,
    input [C_OUTSCALAR_65_BITS-1:0] outscalar65,
    input [C_OUTSCALAR_66_BITS-1:0] outscalar66,
    input [C_OUTSCALAR_67_BITS-1:0] outscalar67,
    input [C_OUTSCALAR_68_BITS-1:0] outscalar68,
    input [C_OUTSCALAR_69_BITS-1:0] outscalar69,
    input [C_OUTSCALAR_70_BITS-1:0] outscalar70,
    input [C_OUTSCALAR_71_BITS-1:0] outscalar71,
    input [C_OUTSCALAR_72_BITS-1:0] outscalar72,
    input [C_OUTSCALAR_73_BITS-1:0] outscalar73,
    input [C_OUTSCALAR_74_BITS-1:0] outscalar74,
    input [C_OUTSCALAR_75_BITS-1:0] outscalar75,
    input [C_OUTSCALAR_76_BITS-1:0] outscalar76,
    input [C_OUTSCALAR_77_BITS-1:0] outscalar77,
    input [C_OUTSCALAR_78_BITS-1:0] outscalar78,
    input [C_OUTSCALAR_79_BITS-1:0] outscalar79,
    input [C_OUTSCALAR_80_BITS-1:0] outscalar80,
    input [C_OUTSCALAR_81_BITS-1:0] outscalar81,
    input [C_OUTSCALAR_82_BITS-1:0] outscalar82,
    input [C_OUTSCALAR_83_BITS-1:0] outscalar83,
    input [C_OUTSCALAR_84_BITS-1:0] outscalar84,
    input [C_OUTSCALAR_85_BITS-1:0] outscalar85,
    input [C_OUTSCALAR_86_BITS-1:0] outscalar86,
    input [C_OUTSCALAR_87_BITS-1:0] outscalar87,
    input [C_OUTSCALAR_88_BITS-1:0] outscalar88,
    input [C_OUTSCALAR_89_BITS-1:0] outscalar89,
    input [C_OUTSCALAR_90_BITS-1:0] outscalar90,
    input [C_OUTSCALAR_91_BITS-1:0] outscalar91,
    input [C_OUTSCALAR_92_BITS-1:0] outscalar92,
    input [C_OUTSCALAR_93_BITS-1:0] outscalar93,
    input [C_OUTSCALAR_94_BITS-1:0] outscalar94,
    input [C_OUTSCALAR_95_BITS-1:0] outscalar95,
    input [C_OUTSCALAR_96_BITS-1:0] outscalar96,
    input [C_OUTSCALAR_97_BITS-1:0] outscalar97,
    input [C_OUTSCALAR_98_BITS-1:0] outscalar98,
    input [C_OUTSCALAR_99_BITS-1:0] outscalar99,
    input [C_OUTSCALAR_100_BITS-1:0] outscalar100,
    input [C_OUTSCALAR_101_BITS-1:0] outscalar101,
    input [C_OUTSCALAR_102_BITS-1:0] outscalar102,
    input [C_OUTSCALAR_103_BITS-1:0] outscalar103,
    input [C_OUTSCALAR_104_BITS-1:0] outscalar104,
    input [C_OUTSCALAR_105_BITS-1:0] outscalar105,
    input [C_OUTSCALAR_106_BITS-1:0] outscalar106,
    input [C_OUTSCALAR_107_BITS-1:0] outscalar107,
    input [C_OUTSCALAR_108_BITS-1:0] outscalar108,
    input [C_OUTSCALAR_109_BITS-1:0] outscalar109,
    input [C_OUTSCALAR_110_BITS-1:0] outscalar110,
    input [C_OUTSCALAR_111_BITS-1:0] outscalar111,
    input [C_OUTSCALAR_112_BITS-1:0] outscalar112,
    input [C_OUTSCALAR_113_BITS-1:0] outscalar113,
    input [C_OUTSCALAR_114_BITS-1:0] outscalar114,
    input [C_OUTSCALAR_115_BITS-1:0] outscalar115,
    input [C_OUTSCALAR_116_BITS-1:0] outscalar116,
    input [C_OUTSCALAR_117_BITS-1:0] outscalar117,
    input [C_OUTSCALAR_118_BITS-1:0] outscalar118,
    input [C_OUTSCALAR_119_BITS-1:0] outscalar119,
    input [C_OUTSCALAR_120_BITS-1:0] outscalar120,
    input [C_OUTSCALAR_121_BITS-1:0] outscalar121,
    input [C_OUTSCALAR_122_BITS-1:0] outscalar122,
    input [C_OUTSCALAR_123_BITS-1:0] outscalar123,
    input [C_OUTSCALAR_124_BITS-1:0] outscalar124,
    input [C_OUTSCALAR_125_BITS-1:0] outscalar125,
    input [C_OUTSCALAR_126_BITS-1:0] outscalar126,
    input [C_OUTSCALAR_127_BITS-1:0] outscalar127,
    //output scalar valid ports
    input outscalar0_vld,
    input outscalar1_vld,
    input outscalar2_vld,
    input outscalar3_vld,
    input outscalar4_vld,
    input outscalar5_vld,
    input outscalar6_vld,
    input outscalar7_vld,
    input outscalar8_vld,
    input outscalar9_vld,
    input outscalar10_vld,
    input outscalar11_vld,
    input outscalar12_vld,
    input outscalar13_vld,
    input outscalar14_vld,
    input outscalar15_vld,
    input outscalar16_vld,
    input outscalar17_vld,
    input outscalar18_vld,
    input outscalar19_vld,
    input outscalar20_vld,
    input outscalar21_vld,
    input outscalar22_vld,
    input outscalar23_vld,
    input outscalar24_vld,
    input outscalar25_vld,
    input outscalar26_vld,
    input outscalar27_vld,
    input outscalar28_vld,
    input outscalar29_vld,
    input outscalar30_vld,
    input outscalar31_vld,
    input outscalar32_vld,
    input outscalar33_vld,
    input outscalar34_vld,
    input outscalar35_vld,
    input outscalar36_vld,
    input outscalar37_vld,
    input outscalar38_vld,
    input outscalar39_vld,
    input outscalar40_vld,
    input outscalar41_vld,
    input outscalar42_vld,
    input outscalar43_vld,
    input outscalar44_vld,
    input outscalar45_vld,
    input outscalar46_vld,
    input outscalar47_vld,
    input outscalar48_vld,
    input outscalar49_vld,
    input outscalar50_vld,
    input outscalar51_vld,
    input outscalar52_vld,
    input outscalar53_vld,
    input outscalar54_vld,
    input outscalar55_vld,
    input outscalar56_vld,
    input outscalar57_vld,
    input outscalar58_vld,
    input outscalar59_vld,
    input outscalar60_vld,
    input outscalar61_vld,
    input outscalar62_vld,
    input outscalar63_vld,
    input outscalar64_vld,
    input outscalar65_vld,
    input outscalar66_vld,
    input outscalar67_vld,
    input outscalar68_vld,
    input outscalar69_vld,
    input outscalar70_vld,
    input outscalar71_vld,
    input outscalar72_vld,
    input outscalar73_vld,
    input outscalar74_vld,
    input outscalar75_vld,
    input outscalar76_vld,
    input outscalar77_vld,
    input outscalar78_vld,
    input outscalar79_vld,
    input outscalar80_vld,
    input outscalar81_vld,
    input outscalar82_vld,
    input outscalar83_vld,
    input outscalar84_vld,
    input outscalar85_vld,
    input outscalar86_vld,
    input outscalar87_vld,
    input outscalar88_vld,
    input outscalar89_vld,
    input outscalar90_vld,
    input outscalar91_vld,
    input outscalar92_vld,
    input outscalar93_vld,
    input outscalar94_vld,
    input outscalar95_vld,
    input outscalar96_vld,
    input outscalar97_vld,
    input outscalar98_vld,
    input outscalar99_vld,
    input outscalar100_vld,
    input outscalar101_vld,
    input outscalar102_vld,
    input outscalar103_vld,
    input outscalar104_vld,
    input outscalar105_vld,
    input outscalar106_vld,
    input outscalar107_vld,
    input outscalar108_vld,
    input outscalar109_vld,
    input outscalar110_vld,
    input outscalar111_vld,
    input outscalar112_vld,
    input outscalar113_vld,
    input outscalar114_vld,
    input outscalar115_vld,
    input outscalar116_vld,
    input outscalar117_vld,
    input outscalar118_vld,
    input outscalar119_vld,
    input outscalar120_vld,
    input outscalar121_vld,
    input outscalar122_vld,
    input outscalar123_vld,
    input outscalar124_vld,
    input outscalar125_vld,
    input outscalar126_vld,
    input outscalar127_vld,
    //output Scalar to AXI-Stream interface 0
    input m_axis_scalar_0_aclk,
    input m_axis_scalar_0_aresetn,
    output m_axis_scalar_0_tlast,
    output m_axis_scalar_0_tvalid,
    output [M_AXIS_SCALAR_0_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_0_tkeep,
    output [M_AXIS_SCALAR_0_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_0_tstrb,
    output [M_AXIS_SCALAR_0_DIRECT_DMWIDTH-1:0] m_axis_scalar_0_tdata,
    input m_axis_scalar_0_tready,
    //output Scalar to AXI-Stream interface 1
    input m_axis_scalar_1_aclk,
    input m_axis_scalar_1_aresetn,
    output m_axis_scalar_1_tlast,
    output m_axis_scalar_1_tvalid,
    output [M_AXIS_SCALAR_1_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_1_tkeep,
    output [M_AXIS_SCALAR_1_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_1_tstrb,
    output [M_AXIS_SCALAR_1_DIRECT_DMWIDTH-1:0] m_axis_scalar_1_tdata,
    input m_axis_scalar_1_tready,
    //output Scalar to AXI-Stream interface 2
    input m_axis_scalar_2_aclk,
    input m_axis_scalar_2_aresetn,
    output m_axis_scalar_2_tlast,
    output m_axis_scalar_2_tvalid,
    output [M_AXIS_SCALAR_2_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_2_tkeep,
    output [M_AXIS_SCALAR_2_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_2_tstrb,
    output [M_AXIS_SCALAR_2_DIRECT_DMWIDTH-1:0] m_axis_scalar_2_tdata,
    input m_axis_scalar_2_tready,
    //output Scalar to AXI-Stream interface 3
    input m_axis_scalar_3_aclk,
    input m_axis_scalar_3_aresetn,
    output m_axis_scalar_3_tlast,
    output m_axis_scalar_3_tvalid,
    output [M_AXIS_SCALAR_3_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_3_tkeep,
    output [M_AXIS_SCALAR_3_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_3_tstrb,
    output [M_AXIS_SCALAR_3_DIRECT_DMWIDTH-1:0] m_axis_scalar_3_tdata,
    input m_axis_scalar_3_tready,
    //output Scalar to AXI-Stream interface 4
    input m_axis_scalar_4_aclk,
    input m_axis_scalar_4_aresetn,
    output m_axis_scalar_4_tlast,
    output m_axis_scalar_4_tvalid,
    output [M_AXIS_SCALAR_4_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_4_tkeep,
    output [M_AXIS_SCALAR_4_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_4_tstrb,
    output [M_AXIS_SCALAR_4_DIRECT_DMWIDTH-1:0] m_axis_scalar_4_tdata,
    input m_axis_scalar_4_tready,
    //output Scalar to AXI-Stream interface 5
    input m_axis_scalar_5_aclk,
    input m_axis_scalar_5_aresetn,
    output m_axis_scalar_5_tlast,
    output m_axis_scalar_5_tvalid,
    output [M_AXIS_SCALAR_5_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_5_tkeep,
    output [M_AXIS_SCALAR_5_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_5_tstrb,
    output [M_AXIS_SCALAR_5_DIRECT_DMWIDTH-1:0] m_axis_scalar_5_tdata,
    input m_axis_scalar_5_tready,
    //output Scalar to AXI-Stream interface 6
    input m_axis_scalar_6_aclk,
    input m_axis_scalar_6_aresetn,
    output m_axis_scalar_6_tlast,
    output m_axis_scalar_6_tvalid,
    output [M_AXIS_SCALAR_6_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_6_tkeep,
    output [M_AXIS_SCALAR_6_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_6_tstrb,
    output [M_AXIS_SCALAR_6_DIRECT_DMWIDTH-1:0] m_axis_scalar_6_tdata,
    input m_axis_scalar_6_tready,
    //output Scalar to AXI-Stream interface 7
    input m_axis_scalar_7_aclk,
    input m_axis_scalar_7_aresetn,
    output m_axis_scalar_7_tlast,
    output m_axis_scalar_7_tvalid,
    output [M_AXIS_SCALAR_7_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_7_tkeep,
    output [M_AXIS_SCALAR_7_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_7_tstrb,
    output [M_AXIS_SCALAR_7_DIRECT_DMWIDTH-1:0] m_axis_scalar_7_tdata,
    input m_axis_scalar_7_tready,
    //output Scalar to AXI-Stream interface 8
    input m_axis_scalar_8_aclk,
    input m_axis_scalar_8_aresetn,
    output m_axis_scalar_8_tlast,
    output m_axis_scalar_8_tvalid,
    output [M_AXIS_SCALAR_8_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_8_tkeep,
    output [M_AXIS_SCALAR_8_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_8_tstrb,
    output [M_AXIS_SCALAR_8_DIRECT_DMWIDTH-1:0] m_axis_scalar_8_tdata,
    input m_axis_scalar_8_tready,
    //output Scalar to AXI-Stream interface 9
    input m_axis_scalar_9_aclk,
    input m_axis_scalar_9_aresetn,
    output m_axis_scalar_9_tlast,
    output m_axis_scalar_9_tvalid,
    output [M_AXIS_SCALAR_9_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_9_tkeep,
    output [M_AXIS_SCALAR_9_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_9_tstrb,
    output [M_AXIS_SCALAR_9_DIRECT_DMWIDTH-1:0] m_axis_scalar_9_tdata,
    input m_axis_scalar_9_tready,
    //output Scalar to AXI-Stream interface 10
    input m_axis_scalar_10_aclk,
    input m_axis_scalar_10_aresetn,
    output m_axis_scalar_10_tlast,
    output m_axis_scalar_10_tvalid,
    output [M_AXIS_SCALAR_10_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_10_tkeep,
    output [M_AXIS_SCALAR_10_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_10_tstrb,
    output [M_AXIS_SCALAR_10_DIRECT_DMWIDTH-1:0] m_axis_scalar_10_tdata,
    input m_axis_scalar_10_tready,
    //output Scalar to AXI-Stream interface 11
    input m_axis_scalar_11_aclk,
    input m_axis_scalar_11_aresetn,
    output m_axis_scalar_11_tlast,
    output m_axis_scalar_11_tvalid,
    output [M_AXIS_SCALAR_11_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_11_tkeep,
    output [M_AXIS_SCALAR_11_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_11_tstrb,
    output [M_AXIS_SCALAR_11_DIRECT_DMWIDTH-1:0] m_axis_scalar_11_tdata,
    input m_axis_scalar_11_tready,
    //output Scalar to AXI-Stream interface 12
    input m_axis_scalar_12_aclk,
    input m_axis_scalar_12_aresetn,
    output m_axis_scalar_12_tlast,
    output m_axis_scalar_12_tvalid,
    output [M_AXIS_SCALAR_12_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_12_tkeep,
    output [M_AXIS_SCALAR_12_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_12_tstrb,
    output [M_AXIS_SCALAR_12_DIRECT_DMWIDTH-1:0] m_axis_scalar_12_tdata,
    input m_axis_scalar_12_tready,
    //output Scalar to AXI-Stream interface 13
    input m_axis_scalar_13_aclk,
    input m_axis_scalar_13_aresetn,
    output m_axis_scalar_13_tlast,
    output m_axis_scalar_13_tvalid,
    output [M_AXIS_SCALAR_13_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_13_tkeep,
    output [M_AXIS_SCALAR_13_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_13_tstrb,
    output [M_AXIS_SCALAR_13_DIRECT_DMWIDTH-1:0] m_axis_scalar_13_tdata,
    input m_axis_scalar_13_tready,
    //output Scalar to AXI-Stream interface 14
    input m_axis_scalar_14_aclk,
    input m_axis_scalar_14_aresetn,
    output m_axis_scalar_14_tlast,
    output m_axis_scalar_14_tvalid,
    output [M_AXIS_SCALAR_14_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_14_tkeep,
    output [M_AXIS_SCALAR_14_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_14_tstrb,
    output [M_AXIS_SCALAR_14_DIRECT_DMWIDTH-1:0] m_axis_scalar_14_tdata,
    input m_axis_scalar_14_tready,
    //output Scalar to AXI-Stream interface 15
    input m_axis_scalar_15_aclk,
    input m_axis_scalar_15_aresetn,
    output m_axis_scalar_15_tlast,
    output m_axis_scalar_15_tvalid,
    output [M_AXIS_SCALAR_15_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_15_tkeep,
    output [M_AXIS_SCALAR_15_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_15_tstrb,
    output [M_AXIS_SCALAR_15_DIRECT_DMWIDTH-1:0] m_axis_scalar_15_tdata,
    input m_axis_scalar_15_tready,
    //output Scalar to AXI-Stream interface 16
    input m_axis_scalar_16_aclk,
    input m_axis_scalar_16_aresetn,
    output m_axis_scalar_16_tlast,
    output m_axis_scalar_16_tvalid,
    output [M_AXIS_SCALAR_16_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_16_tkeep,
    output [M_AXIS_SCALAR_16_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_16_tstrb,
    output [M_AXIS_SCALAR_16_DIRECT_DMWIDTH-1:0] m_axis_scalar_16_tdata,
    input m_axis_scalar_16_tready,
    //output Scalar to AXI-Stream interface 17
    input m_axis_scalar_17_aclk,
    input m_axis_scalar_17_aresetn,
    output m_axis_scalar_17_tlast,
    output m_axis_scalar_17_tvalid,
    output [M_AXIS_SCALAR_17_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_17_tkeep,
    output [M_AXIS_SCALAR_17_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_17_tstrb,
    output [M_AXIS_SCALAR_17_DIRECT_DMWIDTH-1:0] m_axis_scalar_17_tdata,
    input m_axis_scalar_17_tready,
    //output Scalar to AXI-Stream interface 18
    input m_axis_scalar_18_aclk,
    input m_axis_scalar_18_aresetn,
    output m_axis_scalar_18_tlast,
    output m_axis_scalar_18_tvalid,
    output [M_AXIS_SCALAR_18_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_18_tkeep,
    output [M_AXIS_SCALAR_18_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_18_tstrb,
    output [M_AXIS_SCALAR_18_DIRECT_DMWIDTH-1:0] m_axis_scalar_18_tdata,
    input m_axis_scalar_18_tready,
    //output Scalar to AXI-Stream interface 19
    input m_axis_scalar_19_aclk,
    input m_axis_scalar_19_aresetn,
    output m_axis_scalar_19_tlast,
    output m_axis_scalar_19_tvalid,
    output [M_AXIS_SCALAR_19_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_19_tkeep,
    output [M_AXIS_SCALAR_19_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_19_tstrb,
    output [M_AXIS_SCALAR_19_DIRECT_DMWIDTH-1:0] m_axis_scalar_19_tdata,
    input m_axis_scalar_19_tready,
    //output Scalar to AXI-Stream interface 20
    input m_axis_scalar_20_aclk,
    input m_axis_scalar_20_aresetn,
    output m_axis_scalar_20_tlast,
    output m_axis_scalar_20_tvalid,
    output [M_AXIS_SCALAR_20_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_20_tkeep,
    output [M_AXIS_SCALAR_20_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_20_tstrb,
    output [M_AXIS_SCALAR_20_DIRECT_DMWIDTH-1:0] m_axis_scalar_20_tdata,
    input m_axis_scalar_20_tready,
    //output Scalar to AXI-Stream interface 21
    input m_axis_scalar_21_aclk,
    input m_axis_scalar_21_aresetn,
    output m_axis_scalar_21_tlast,
    output m_axis_scalar_21_tvalid,
    output [M_AXIS_SCALAR_21_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_21_tkeep,
    output [M_AXIS_SCALAR_21_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_21_tstrb,
    output [M_AXIS_SCALAR_21_DIRECT_DMWIDTH-1:0] m_axis_scalar_21_tdata,
    input m_axis_scalar_21_tready,
    //output Scalar to AXI-Stream interface 22
    input m_axis_scalar_22_aclk,
    input m_axis_scalar_22_aresetn,
    output m_axis_scalar_22_tlast,
    output m_axis_scalar_22_tvalid,
    output [M_AXIS_SCALAR_22_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_22_tkeep,
    output [M_AXIS_SCALAR_22_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_22_tstrb,
    output [M_AXIS_SCALAR_22_DIRECT_DMWIDTH-1:0] m_axis_scalar_22_tdata,
    input m_axis_scalar_22_tready,
    //output Scalar to AXI-Stream interface 23
    input m_axis_scalar_23_aclk,
    input m_axis_scalar_23_aresetn,
    output m_axis_scalar_23_tlast,
    output m_axis_scalar_23_tvalid,
    output [M_AXIS_SCALAR_23_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_23_tkeep,
    output [M_AXIS_SCALAR_23_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_23_tstrb,
    output [M_AXIS_SCALAR_23_DIRECT_DMWIDTH-1:0] m_axis_scalar_23_tdata,
    input m_axis_scalar_23_tready,
    //output Scalar to AXI-Stream interface 24
    input m_axis_scalar_24_aclk,
    input m_axis_scalar_24_aresetn,
    output m_axis_scalar_24_tlast,
    output m_axis_scalar_24_tvalid,
    output [M_AXIS_SCALAR_24_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_24_tkeep,
    output [M_AXIS_SCALAR_24_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_24_tstrb,
    output [M_AXIS_SCALAR_24_DIRECT_DMWIDTH-1:0] m_axis_scalar_24_tdata,
    input m_axis_scalar_24_tready,
    //output Scalar to AXI-Stream interface 25
    input m_axis_scalar_25_aclk,
    input m_axis_scalar_25_aresetn,
    output m_axis_scalar_25_tlast,
    output m_axis_scalar_25_tvalid,
    output [M_AXIS_SCALAR_25_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_25_tkeep,
    output [M_AXIS_SCALAR_25_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_25_tstrb,
    output [M_AXIS_SCALAR_25_DIRECT_DMWIDTH-1:0] m_axis_scalar_25_tdata,
    input m_axis_scalar_25_tready,
    //output Scalar to AXI-Stream interface 26
    input m_axis_scalar_26_aclk,
    input m_axis_scalar_26_aresetn,
    output m_axis_scalar_26_tlast,
    output m_axis_scalar_26_tvalid,
    output [M_AXIS_SCALAR_26_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_26_tkeep,
    output [M_AXIS_SCALAR_26_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_26_tstrb,
    output [M_AXIS_SCALAR_26_DIRECT_DMWIDTH-1:0] m_axis_scalar_26_tdata,
    input m_axis_scalar_26_tready,
    //output Scalar to AXI-Stream interface 27
    input m_axis_scalar_27_aclk,
    input m_axis_scalar_27_aresetn,
    output m_axis_scalar_27_tlast,
    output m_axis_scalar_27_tvalid,
    output [M_AXIS_SCALAR_27_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_27_tkeep,
    output [M_AXIS_SCALAR_27_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_27_tstrb,
    output [M_AXIS_SCALAR_27_DIRECT_DMWIDTH-1:0] m_axis_scalar_27_tdata,
    input m_axis_scalar_27_tready,
    //output Scalar to AXI-Stream interface 28
    input m_axis_scalar_28_aclk,
    input m_axis_scalar_28_aresetn,
    output m_axis_scalar_28_tlast,
    output m_axis_scalar_28_tvalid,
    output [M_AXIS_SCALAR_28_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_28_tkeep,
    output [M_AXIS_SCALAR_28_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_28_tstrb,
    output [M_AXIS_SCALAR_28_DIRECT_DMWIDTH-1:0] m_axis_scalar_28_tdata,
    input m_axis_scalar_28_tready,
    //output Scalar to AXI-Stream interface 29
    input m_axis_scalar_29_aclk,
    input m_axis_scalar_29_aresetn,
    output m_axis_scalar_29_tlast,
    output m_axis_scalar_29_tvalid,
    output [M_AXIS_SCALAR_29_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_29_tkeep,
    output [M_AXIS_SCALAR_29_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_29_tstrb,
    output [M_AXIS_SCALAR_29_DIRECT_DMWIDTH-1:0] m_axis_scalar_29_tdata,
    input m_axis_scalar_29_tready,
    //output Scalar to AXI-Stream interface 30
    input m_axis_scalar_30_aclk,
    input m_axis_scalar_30_aresetn,
    output m_axis_scalar_30_tlast,
    output m_axis_scalar_30_tvalid,
    output [M_AXIS_SCALAR_30_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_30_tkeep,
    output [M_AXIS_SCALAR_30_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_30_tstrb,
    output [M_AXIS_SCALAR_30_DIRECT_DMWIDTH-1:0] m_axis_scalar_30_tdata,
    input m_axis_scalar_30_tready,
    //output Scalar to AXI-Stream interface 31
    input m_axis_scalar_31_aclk,
    input m_axis_scalar_31_aresetn,
    output m_axis_scalar_31_tlast,
    output m_axis_scalar_31_tvalid,
    output [M_AXIS_SCALAR_31_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_31_tkeep,
    output [M_AXIS_SCALAR_31_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_31_tstrb,
    output [M_AXIS_SCALAR_31_DIRECT_DMWIDTH-1:0] m_axis_scalar_31_tdata,
    input m_axis_scalar_31_tready,
    //output Scalar to AXI-Stream interface 32
    input m_axis_scalar_32_aclk,
    input m_axis_scalar_32_aresetn,
    output m_axis_scalar_32_tlast,
    output m_axis_scalar_32_tvalid,
    output [M_AXIS_SCALAR_32_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_32_tkeep,
    output [M_AXIS_SCALAR_32_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_32_tstrb,
    output [M_AXIS_SCALAR_32_DIRECT_DMWIDTH-1:0] m_axis_scalar_32_tdata,
    input m_axis_scalar_32_tready,
    //output Scalar to AXI-Stream interface 33
    input m_axis_scalar_33_aclk,
    input m_axis_scalar_33_aresetn,
    output m_axis_scalar_33_tlast,
    output m_axis_scalar_33_tvalid,
    output [M_AXIS_SCALAR_33_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_33_tkeep,
    output [M_AXIS_SCALAR_33_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_33_tstrb,
    output [M_AXIS_SCALAR_33_DIRECT_DMWIDTH-1:0] m_axis_scalar_33_tdata,
    input m_axis_scalar_33_tready,
    //output Scalar to AXI-Stream interface 34
    input m_axis_scalar_34_aclk,
    input m_axis_scalar_34_aresetn,
    output m_axis_scalar_34_tlast,
    output m_axis_scalar_34_tvalid,
    output [M_AXIS_SCALAR_34_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_34_tkeep,
    output [M_AXIS_SCALAR_34_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_34_tstrb,
    output [M_AXIS_SCALAR_34_DIRECT_DMWIDTH-1:0] m_axis_scalar_34_tdata,
    input m_axis_scalar_34_tready,
    //output Scalar to AXI-Stream interface 35
    input m_axis_scalar_35_aclk,
    input m_axis_scalar_35_aresetn,
    output m_axis_scalar_35_tlast,
    output m_axis_scalar_35_tvalid,
    output [M_AXIS_SCALAR_35_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_35_tkeep,
    output [M_AXIS_SCALAR_35_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_35_tstrb,
    output [M_AXIS_SCALAR_35_DIRECT_DMWIDTH-1:0] m_axis_scalar_35_tdata,
    input m_axis_scalar_35_tready,
    //output Scalar to AXI-Stream interface 36
    input m_axis_scalar_36_aclk,
    input m_axis_scalar_36_aresetn,
    output m_axis_scalar_36_tlast,
    output m_axis_scalar_36_tvalid,
    output [M_AXIS_SCALAR_36_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_36_tkeep,
    output [M_AXIS_SCALAR_36_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_36_tstrb,
    output [M_AXIS_SCALAR_36_DIRECT_DMWIDTH-1:0] m_axis_scalar_36_tdata,
    input m_axis_scalar_36_tready,
    //output Scalar to AXI-Stream interface 37
    input m_axis_scalar_37_aclk,
    input m_axis_scalar_37_aresetn,
    output m_axis_scalar_37_tlast,
    output m_axis_scalar_37_tvalid,
    output [M_AXIS_SCALAR_37_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_37_tkeep,
    output [M_AXIS_SCALAR_37_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_37_tstrb,
    output [M_AXIS_SCALAR_37_DIRECT_DMWIDTH-1:0] m_axis_scalar_37_tdata,
    input m_axis_scalar_37_tready,
    //output Scalar to AXI-Stream interface 38
    input m_axis_scalar_38_aclk,
    input m_axis_scalar_38_aresetn,
    output m_axis_scalar_38_tlast,
    output m_axis_scalar_38_tvalid,
    output [M_AXIS_SCALAR_38_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_38_tkeep,
    output [M_AXIS_SCALAR_38_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_38_tstrb,
    output [M_AXIS_SCALAR_38_DIRECT_DMWIDTH-1:0] m_axis_scalar_38_tdata,
    input m_axis_scalar_38_tready,
    //output Scalar to AXI-Stream interface 39
    input m_axis_scalar_39_aclk,
    input m_axis_scalar_39_aresetn,
    output m_axis_scalar_39_tlast,
    output m_axis_scalar_39_tvalid,
    output [M_AXIS_SCALAR_39_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_39_tkeep,
    output [M_AXIS_SCALAR_39_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_39_tstrb,
    output [M_AXIS_SCALAR_39_DIRECT_DMWIDTH-1:0] m_axis_scalar_39_tdata,
    input m_axis_scalar_39_tready,
    //output Scalar to AXI-Stream interface 40
    input m_axis_scalar_40_aclk,
    input m_axis_scalar_40_aresetn,
    output m_axis_scalar_40_tlast,
    output m_axis_scalar_40_tvalid,
    output [M_AXIS_SCALAR_40_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_40_tkeep,
    output [M_AXIS_SCALAR_40_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_40_tstrb,
    output [M_AXIS_SCALAR_40_DIRECT_DMWIDTH-1:0] m_axis_scalar_40_tdata,
    input m_axis_scalar_40_tready,
    //output Scalar to AXI-Stream interface 41
    input m_axis_scalar_41_aclk,
    input m_axis_scalar_41_aresetn,
    output m_axis_scalar_41_tlast,
    output m_axis_scalar_41_tvalid,
    output [M_AXIS_SCALAR_41_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_41_tkeep,
    output [M_AXIS_SCALAR_41_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_41_tstrb,
    output [M_AXIS_SCALAR_41_DIRECT_DMWIDTH-1:0] m_axis_scalar_41_tdata,
    input m_axis_scalar_41_tready,
    //output Scalar to AXI-Stream interface 42
    input m_axis_scalar_42_aclk,
    input m_axis_scalar_42_aresetn,
    output m_axis_scalar_42_tlast,
    output m_axis_scalar_42_tvalid,
    output [M_AXIS_SCALAR_42_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_42_tkeep,
    output [M_AXIS_SCALAR_42_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_42_tstrb,
    output [M_AXIS_SCALAR_42_DIRECT_DMWIDTH-1:0] m_axis_scalar_42_tdata,
    input m_axis_scalar_42_tready,
    //output Scalar to AXI-Stream interface 43
    input m_axis_scalar_43_aclk,
    input m_axis_scalar_43_aresetn,
    output m_axis_scalar_43_tlast,
    output m_axis_scalar_43_tvalid,
    output [M_AXIS_SCALAR_43_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_43_tkeep,
    output [M_AXIS_SCALAR_43_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_43_tstrb,
    output [M_AXIS_SCALAR_43_DIRECT_DMWIDTH-1:0] m_axis_scalar_43_tdata,
    input m_axis_scalar_43_tready,
    //output Scalar to AXI-Stream interface 44
    input m_axis_scalar_44_aclk,
    input m_axis_scalar_44_aresetn,
    output m_axis_scalar_44_tlast,
    output m_axis_scalar_44_tvalid,
    output [M_AXIS_SCALAR_44_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_44_tkeep,
    output [M_AXIS_SCALAR_44_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_44_tstrb,
    output [M_AXIS_SCALAR_44_DIRECT_DMWIDTH-1:0] m_axis_scalar_44_tdata,
    input m_axis_scalar_44_tready,
    //output Scalar to AXI-Stream interface 45
    input m_axis_scalar_45_aclk,
    input m_axis_scalar_45_aresetn,
    output m_axis_scalar_45_tlast,
    output m_axis_scalar_45_tvalid,
    output [M_AXIS_SCALAR_45_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_45_tkeep,
    output [M_AXIS_SCALAR_45_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_45_tstrb,
    output [M_AXIS_SCALAR_45_DIRECT_DMWIDTH-1:0] m_axis_scalar_45_tdata,
    input m_axis_scalar_45_tready,
    //output Scalar to AXI-Stream interface 46
    input m_axis_scalar_46_aclk,
    input m_axis_scalar_46_aresetn,
    output m_axis_scalar_46_tlast,
    output m_axis_scalar_46_tvalid,
    output [M_AXIS_SCALAR_46_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_46_tkeep,
    output [M_AXIS_SCALAR_46_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_46_tstrb,
    output [M_AXIS_SCALAR_46_DIRECT_DMWIDTH-1:0] m_axis_scalar_46_tdata,
    input m_axis_scalar_46_tready,
    //output Scalar to AXI-Stream interface 47
    input m_axis_scalar_47_aclk,
    input m_axis_scalar_47_aresetn,
    output m_axis_scalar_47_tlast,
    output m_axis_scalar_47_tvalid,
    output [M_AXIS_SCALAR_47_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_47_tkeep,
    output [M_AXIS_SCALAR_47_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_47_tstrb,
    output [M_AXIS_SCALAR_47_DIRECT_DMWIDTH-1:0] m_axis_scalar_47_tdata,
    input m_axis_scalar_47_tready,
    //output Scalar to AXI-Stream interface 48
    input m_axis_scalar_48_aclk,
    input m_axis_scalar_48_aresetn,
    output m_axis_scalar_48_tlast,
    output m_axis_scalar_48_tvalid,
    output [M_AXIS_SCALAR_48_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_48_tkeep,
    output [M_AXIS_SCALAR_48_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_48_tstrb,
    output [M_AXIS_SCALAR_48_DIRECT_DMWIDTH-1:0] m_axis_scalar_48_tdata,
    input m_axis_scalar_48_tready,
    //output Scalar to AXI-Stream interface 49
    input m_axis_scalar_49_aclk,
    input m_axis_scalar_49_aresetn,
    output m_axis_scalar_49_tlast,
    output m_axis_scalar_49_tvalid,
    output [M_AXIS_SCALAR_49_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_49_tkeep,
    output [M_AXIS_SCALAR_49_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_49_tstrb,
    output [M_AXIS_SCALAR_49_DIRECT_DMWIDTH-1:0] m_axis_scalar_49_tdata,
    input m_axis_scalar_49_tready,
    //output Scalar to AXI-Stream interface 50
    input m_axis_scalar_50_aclk,
    input m_axis_scalar_50_aresetn,
    output m_axis_scalar_50_tlast,
    output m_axis_scalar_50_tvalid,
    output [M_AXIS_SCALAR_50_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_50_tkeep,
    output [M_AXIS_SCALAR_50_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_50_tstrb,
    output [M_AXIS_SCALAR_50_DIRECT_DMWIDTH-1:0] m_axis_scalar_50_tdata,
    input m_axis_scalar_50_tready,
    //output Scalar to AXI-Stream interface 51
    input m_axis_scalar_51_aclk,
    input m_axis_scalar_51_aresetn,
    output m_axis_scalar_51_tlast,
    output m_axis_scalar_51_tvalid,
    output [M_AXIS_SCALAR_51_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_51_tkeep,
    output [M_AXIS_SCALAR_51_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_51_tstrb,
    output [M_AXIS_SCALAR_51_DIRECT_DMWIDTH-1:0] m_axis_scalar_51_tdata,
    input m_axis_scalar_51_tready,
    //output Scalar to AXI-Stream interface 52
    input m_axis_scalar_52_aclk,
    input m_axis_scalar_52_aresetn,
    output m_axis_scalar_52_tlast,
    output m_axis_scalar_52_tvalid,
    output [M_AXIS_SCALAR_52_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_52_tkeep,
    output [M_AXIS_SCALAR_52_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_52_tstrb,
    output [M_AXIS_SCALAR_52_DIRECT_DMWIDTH-1:0] m_axis_scalar_52_tdata,
    input m_axis_scalar_52_tready,
    //output Scalar to AXI-Stream interface 53
    input m_axis_scalar_53_aclk,
    input m_axis_scalar_53_aresetn,
    output m_axis_scalar_53_tlast,
    output m_axis_scalar_53_tvalid,
    output [M_AXIS_SCALAR_53_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_53_tkeep,
    output [M_AXIS_SCALAR_53_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_53_tstrb,
    output [M_AXIS_SCALAR_53_DIRECT_DMWIDTH-1:0] m_axis_scalar_53_tdata,
    input m_axis_scalar_53_tready,
    //output Scalar to AXI-Stream interface 54
    input m_axis_scalar_54_aclk,
    input m_axis_scalar_54_aresetn,
    output m_axis_scalar_54_tlast,
    output m_axis_scalar_54_tvalid,
    output [M_AXIS_SCALAR_54_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_54_tkeep,
    output [M_AXIS_SCALAR_54_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_54_tstrb,
    output [M_AXIS_SCALAR_54_DIRECT_DMWIDTH-1:0] m_axis_scalar_54_tdata,
    input m_axis_scalar_54_tready,
    //output Scalar to AXI-Stream interface 55
    input m_axis_scalar_55_aclk,
    input m_axis_scalar_55_aresetn,
    output m_axis_scalar_55_tlast,
    output m_axis_scalar_55_tvalid,
    output [M_AXIS_SCALAR_55_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_55_tkeep,
    output [M_AXIS_SCALAR_55_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_55_tstrb,
    output [M_AXIS_SCALAR_55_DIRECT_DMWIDTH-1:0] m_axis_scalar_55_tdata,
    input m_axis_scalar_55_tready,
    //output Scalar to AXI-Stream interface 56
    input m_axis_scalar_56_aclk,
    input m_axis_scalar_56_aresetn,
    output m_axis_scalar_56_tlast,
    output m_axis_scalar_56_tvalid,
    output [M_AXIS_SCALAR_56_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_56_tkeep,
    output [M_AXIS_SCALAR_56_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_56_tstrb,
    output [M_AXIS_SCALAR_56_DIRECT_DMWIDTH-1:0] m_axis_scalar_56_tdata,
    input m_axis_scalar_56_tready,
    //output Scalar to AXI-Stream interface 57
    input m_axis_scalar_57_aclk,
    input m_axis_scalar_57_aresetn,
    output m_axis_scalar_57_tlast,
    output m_axis_scalar_57_tvalid,
    output [M_AXIS_SCALAR_57_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_57_tkeep,
    output [M_AXIS_SCALAR_57_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_57_tstrb,
    output [M_AXIS_SCALAR_57_DIRECT_DMWIDTH-1:0] m_axis_scalar_57_tdata,
    input m_axis_scalar_57_tready,
    //output Scalar to AXI-Stream interface 58
    input m_axis_scalar_58_aclk,
    input m_axis_scalar_58_aresetn,
    output m_axis_scalar_58_tlast,
    output m_axis_scalar_58_tvalid,
    output [M_AXIS_SCALAR_58_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_58_tkeep,
    output [M_AXIS_SCALAR_58_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_58_tstrb,
    output [M_AXIS_SCALAR_58_DIRECT_DMWIDTH-1:0] m_axis_scalar_58_tdata,
    input m_axis_scalar_58_tready,
    //output Scalar to AXI-Stream interface 59
    input m_axis_scalar_59_aclk,
    input m_axis_scalar_59_aresetn,
    output m_axis_scalar_59_tlast,
    output m_axis_scalar_59_tvalid,
    output [M_AXIS_SCALAR_59_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_59_tkeep,
    output [M_AXIS_SCALAR_59_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_59_tstrb,
    output [M_AXIS_SCALAR_59_DIRECT_DMWIDTH-1:0] m_axis_scalar_59_tdata,
    input m_axis_scalar_59_tready,
    //output Scalar to AXI-Stream interface 60
    input m_axis_scalar_60_aclk,
    input m_axis_scalar_60_aresetn,
    output m_axis_scalar_60_tlast,
    output m_axis_scalar_60_tvalid,
    output [M_AXIS_SCALAR_60_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_60_tkeep,
    output [M_AXIS_SCALAR_60_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_60_tstrb,
    output [M_AXIS_SCALAR_60_DIRECT_DMWIDTH-1:0] m_axis_scalar_60_tdata,
    input m_axis_scalar_60_tready,
    //output Scalar to AXI-Stream interface 61
    input m_axis_scalar_61_aclk,
    input m_axis_scalar_61_aresetn,
    output m_axis_scalar_61_tlast,
    output m_axis_scalar_61_tvalid,
    output [M_AXIS_SCALAR_61_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_61_tkeep,
    output [M_AXIS_SCALAR_61_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_61_tstrb,
    output [M_AXIS_SCALAR_61_DIRECT_DMWIDTH-1:0] m_axis_scalar_61_tdata,
    input m_axis_scalar_61_tready,
    //output Scalar to AXI-Stream interface 62
    input m_axis_scalar_62_aclk,
    input m_axis_scalar_62_aresetn,
    output m_axis_scalar_62_tlast,
    output m_axis_scalar_62_tvalid,
    output [M_AXIS_SCALAR_62_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_62_tkeep,
    output [M_AXIS_SCALAR_62_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_62_tstrb,
    output [M_AXIS_SCALAR_62_DIRECT_DMWIDTH-1:0] m_axis_scalar_62_tdata,
    input m_axis_scalar_62_tready,
    //output Scalar to AXI-Stream interface 63
    input m_axis_scalar_63_aclk,
    input m_axis_scalar_63_aresetn,
    output m_axis_scalar_63_tlast,
    output m_axis_scalar_63_tvalid,
    output [M_AXIS_SCALAR_63_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_63_tkeep,
    output [M_AXIS_SCALAR_63_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_63_tstrb,
    output [M_AXIS_SCALAR_63_DIRECT_DMWIDTH-1:0] m_axis_scalar_63_tdata,
    input m_axis_scalar_63_tready,
    //output Scalar to AXI-Stream interface 64
    input m_axis_scalar_64_aclk,
    input m_axis_scalar_64_aresetn,
    output m_axis_scalar_64_tlast,
    output m_axis_scalar_64_tvalid,
    output [M_AXIS_SCALAR_64_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_64_tkeep,
    output [M_AXIS_SCALAR_64_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_64_tstrb,
    output [M_AXIS_SCALAR_64_DIRECT_DMWIDTH-1:0] m_axis_scalar_64_tdata,
    input m_axis_scalar_64_tready,
    //output Scalar to AXI-Stream interface 65
    input m_axis_scalar_65_aclk,
    input m_axis_scalar_65_aresetn,
    output m_axis_scalar_65_tlast,
    output m_axis_scalar_65_tvalid,
    output [M_AXIS_SCALAR_65_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_65_tkeep,
    output [M_AXIS_SCALAR_65_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_65_tstrb,
    output [M_AXIS_SCALAR_65_DIRECT_DMWIDTH-1:0] m_axis_scalar_65_tdata,
    input m_axis_scalar_65_tready,
    //output Scalar to AXI-Stream interface 66
    input m_axis_scalar_66_aclk,
    input m_axis_scalar_66_aresetn,
    output m_axis_scalar_66_tlast,
    output m_axis_scalar_66_tvalid,
    output [M_AXIS_SCALAR_66_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_66_tkeep,
    output [M_AXIS_SCALAR_66_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_66_tstrb,
    output [M_AXIS_SCALAR_66_DIRECT_DMWIDTH-1:0] m_axis_scalar_66_tdata,
    input m_axis_scalar_66_tready,
    //output Scalar to AXI-Stream interface 67
    input m_axis_scalar_67_aclk,
    input m_axis_scalar_67_aresetn,
    output m_axis_scalar_67_tlast,
    output m_axis_scalar_67_tvalid,
    output [M_AXIS_SCALAR_67_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_67_tkeep,
    output [M_AXIS_SCALAR_67_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_67_tstrb,
    output [M_AXIS_SCALAR_67_DIRECT_DMWIDTH-1:0] m_axis_scalar_67_tdata,
    input m_axis_scalar_67_tready,
    //output Scalar to AXI-Stream interface 68
    input m_axis_scalar_68_aclk,
    input m_axis_scalar_68_aresetn,
    output m_axis_scalar_68_tlast,
    output m_axis_scalar_68_tvalid,
    output [M_AXIS_SCALAR_68_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_68_tkeep,
    output [M_AXIS_SCALAR_68_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_68_tstrb,
    output [M_AXIS_SCALAR_68_DIRECT_DMWIDTH-1:0] m_axis_scalar_68_tdata,
    input m_axis_scalar_68_tready,
    //output Scalar to AXI-Stream interface 69
    input m_axis_scalar_69_aclk,
    input m_axis_scalar_69_aresetn,
    output m_axis_scalar_69_tlast,
    output m_axis_scalar_69_tvalid,
    output [M_AXIS_SCALAR_69_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_69_tkeep,
    output [M_AXIS_SCALAR_69_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_69_tstrb,
    output [M_AXIS_SCALAR_69_DIRECT_DMWIDTH-1:0] m_axis_scalar_69_tdata,
    input m_axis_scalar_69_tready,
    //output Scalar to AXI-Stream interface 70
    input m_axis_scalar_70_aclk,
    input m_axis_scalar_70_aresetn,
    output m_axis_scalar_70_tlast,
    output m_axis_scalar_70_tvalid,
    output [M_AXIS_SCALAR_70_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_70_tkeep,
    output [M_AXIS_SCALAR_70_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_70_tstrb,
    output [M_AXIS_SCALAR_70_DIRECT_DMWIDTH-1:0] m_axis_scalar_70_tdata,
    input m_axis_scalar_70_tready,
    //output Scalar to AXI-Stream interface 71
    input m_axis_scalar_71_aclk,
    input m_axis_scalar_71_aresetn,
    output m_axis_scalar_71_tlast,
    output m_axis_scalar_71_tvalid,
    output [M_AXIS_SCALAR_71_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_71_tkeep,
    output [M_AXIS_SCALAR_71_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_71_tstrb,
    output [M_AXIS_SCALAR_71_DIRECT_DMWIDTH-1:0] m_axis_scalar_71_tdata,
    input m_axis_scalar_71_tready,
    //output Scalar to AXI-Stream interface 72
    input m_axis_scalar_72_aclk,
    input m_axis_scalar_72_aresetn,
    output m_axis_scalar_72_tlast,
    output m_axis_scalar_72_tvalid,
    output [M_AXIS_SCALAR_72_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_72_tkeep,
    output [M_AXIS_SCALAR_72_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_72_tstrb,
    output [M_AXIS_SCALAR_72_DIRECT_DMWIDTH-1:0] m_axis_scalar_72_tdata,
    input m_axis_scalar_72_tready,
    //output Scalar to AXI-Stream interface 73
    input m_axis_scalar_73_aclk,
    input m_axis_scalar_73_aresetn,
    output m_axis_scalar_73_tlast,
    output m_axis_scalar_73_tvalid,
    output [M_AXIS_SCALAR_73_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_73_tkeep,
    output [M_AXIS_SCALAR_73_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_73_tstrb,
    output [M_AXIS_SCALAR_73_DIRECT_DMWIDTH-1:0] m_axis_scalar_73_tdata,
    input m_axis_scalar_73_tready,
    //output Scalar to AXI-Stream interface 74
    input m_axis_scalar_74_aclk,
    input m_axis_scalar_74_aresetn,
    output m_axis_scalar_74_tlast,
    output m_axis_scalar_74_tvalid,
    output [M_AXIS_SCALAR_74_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_74_tkeep,
    output [M_AXIS_SCALAR_74_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_74_tstrb,
    output [M_AXIS_SCALAR_74_DIRECT_DMWIDTH-1:0] m_axis_scalar_74_tdata,
    input m_axis_scalar_74_tready,
    //output Scalar to AXI-Stream interface 75
    input m_axis_scalar_75_aclk,
    input m_axis_scalar_75_aresetn,
    output m_axis_scalar_75_tlast,
    output m_axis_scalar_75_tvalid,
    output [M_AXIS_SCALAR_75_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_75_tkeep,
    output [M_AXIS_SCALAR_75_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_75_tstrb,
    output [M_AXIS_SCALAR_75_DIRECT_DMWIDTH-1:0] m_axis_scalar_75_tdata,
    input m_axis_scalar_75_tready,
    //output Scalar to AXI-Stream interface 76
    input m_axis_scalar_76_aclk,
    input m_axis_scalar_76_aresetn,
    output m_axis_scalar_76_tlast,
    output m_axis_scalar_76_tvalid,
    output [M_AXIS_SCALAR_76_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_76_tkeep,
    output [M_AXIS_SCALAR_76_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_76_tstrb,
    output [M_AXIS_SCALAR_76_DIRECT_DMWIDTH-1:0] m_axis_scalar_76_tdata,
    input m_axis_scalar_76_tready,
    //output Scalar to AXI-Stream interface 77
    input m_axis_scalar_77_aclk,
    input m_axis_scalar_77_aresetn,
    output m_axis_scalar_77_tlast,
    output m_axis_scalar_77_tvalid,
    output [M_AXIS_SCALAR_77_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_77_tkeep,
    output [M_AXIS_SCALAR_77_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_77_tstrb,
    output [M_AXIS_SCALAR_77_DIRECT_DMWIDTH-1:0] m_axis_scalar_77_tdata,
    input m_axis_scalar_77_tready,
    //output Scalar to AXI-Stream interface 78
    input m_axis_scalar_78_aclk,
    input m_axis_scalar_78_aresetn,
    output m_axis_scalar_78_tlast,
    output m_axis_scalar_78_tvalid,
    output [M_AXIS_SCALAR_78_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_78_tkeep,
    output [M_AXIS_SCALAR_78_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_78_tstrb,
    output [M_AXIS_SCALAR_78_DIRECT_DMWIDTH-1:0] m_axis_scalar_78_tdata,
    input m_axis_scalar_78_tready,
    //output Scalar to AXI-Stream interface 79
    input m_axis_scalar_79_aclk,
    input m_axis_scalar_79_aresetn,
    output m_axis_scalar_79_tlast,
    output m_axis_scalar_79_tvalid,
    output [M_AXIS_SCALAR_79_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_79_tkeep,
    output [M_AXIS_SCALAR_79_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_79_tstrb,
    output [M_AXIS_SCALAR_79_DIRECT_DMWIDTH-1:0] m_axis_scalar_79_tdata,
    input m_axis_scalar_79_tready,
    //output Scalar to AXI-Stream interface 80
    input m_axis_scalar_80_aclk,
    input m_axis_scalar_80_aresetn,
    output m_axis_scalar_80_tlast,
    output m_axis_scalar_80_tvalid,
    output [M_AXIS_SCALAR_80_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_80_tkeep,
    output [M_AXIS_SCALAR_80_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_80_tstrb,
    output [M_AXIS_SCALAR_80_DIRECT_DMWIDTH-1:0] m_axis_scalar_80_tdata,
    input m_axis_scalar_80_tready,
    //output Scalar to AXI-Stream interface 81
    input m_axis_scalar_81_aclk,
    input m_axis_scalar_81_aresetn,
    output m_axis_scalar_81_tlast,
    output m_axis_scalar_81_tvalid,
    output [M_AXIS_SCALAR_81_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_81_tkeep,
    output [M_AXIS_SCALAR_81_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_81_tstrb,
    output [M_AXIS_SCALAR_81_DIRECT_DMWIDTH-1:0] m_axis_scalar_81_tdata,
    input m_axis_scalar_81_tready,
    //output Scalar to AXI-Stream interface 82
    input m_axis_scalar_82_aclk,
    input m_axis_scalar_82_aresetn,
    output m_axis_scalar_82_tlast,
    output m_axis_scalar_82_tvalid,
    output [M_AXIS_SCALAR_82_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_82_tkeep,
    output [M_AXIS_SCALAR_82_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_82_tstrb,
    output [M_AXIS_SCALAR_82_DIRECT_DMWIDTH-1:0] m_axis_scalar_82_tdata,
    input m_axis_scalar_82_tready,
    //output Scalar to AXI-Stream interface 83
    input m_axis_scalar_83_aclk,
    input m_axis_scalar_83_aresetn,
    output m_axis_scalar_83_tlast,
    output m_axis_scalar_83_tvalid,
    output [M_AXIS_SCALAR_83_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_83_tkeep,
    output [M_AXIS_SCALAR_83_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_83_tstrb,
    output [M_AXIS_SCALAR_83_DIRECT_DMWIDTH-1:0] m_axis_scalar_83_tdata,
    input m_axis_scalar_83_tready,
    //output Scalar to AXI-Stream interface 84
    input m_axis_scalar_84_aclk,
    input m_axis_scalar_84_aresetn,
    output m_axis_scalar_84_tlast,
    output m_axis_scalar_84_tvalid,
    output [M_AXIS_SCALAR_84_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_84_tkeep,
    output [M_AXIS_SCALAR_84_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_84_tstrb,
    output [M_AXIS_SCALAR_84_DIRECT_DMWIDTH-1:0] m_axis_scalar_84_tdata,
    input m_axis_scalar_84_tready,
    //output Scalar to AXI-Stream interface 85
    input m_axis_scalar_85_aclk,
    input m_axis_scalar_85_aresetn,
    output m_axis_scalar_85_tlast,
    output m_axis_scalar_85_tvalid,
    output [M_AXIS_SCALAR_85_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_85_tkeep,
    output [M_AXIS_SCALAR_85_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_85_tstrb,
    output [M_AXIS_SCALAR_85_DIRECT_DMWIDTH-1:0] m_axis_scalar_85_tdata,
    input m_axis_scalar_85_tready,
    //output Scalar to AXI-Stream interface 86
    input m_axis_scalar_86_aclk,
    input m_axis_scalar_86_aresetn,
    output m_axis_scalar_86_tlast,
    output m_axis_scalar_86_tvalid,
    output [M_AXIS_SCALAR_86_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_86_tkeep,
    output [M_AXIS_SCALAR_86_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_86_tstrb,
    output [M_AXIS_SCALAR_86_DIRECT_DMWIDTH-1:0] m_axis_scalar_86_tdata,
    input m_axis_scalar_86_tready,
    //output Scalar to AXI-Stream interface 87
    input m_axis_scalar_87_aclk,
    input m_axis_scalar_87_aresetn,
    output m_axis_scalar_87_tlast,
    output m_axis_scalar_87_tvalid,
    output [M_AXIS_SCALAR_87_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_87_tkeep,
    output [M_AXIS_SCALAR_87_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_87_tstrb,
    output [M_AXIS_SCALAR_87_DIRECT_DMWIDTH-1:0] m_axis_scalar_87_tdata,
    input m_axis_scalar_87_tready,
    //output Scalar to AXI-Stream interface 88
    input m_axis_scalar_88_aclk,
    input m_axis_scalar_88_aresetn,
    output m_axis_scalar_88_tlast,
    output m_axis_scalar_88_tvalid,
    output [M_AXIS_SCALAR_88_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_88_tkeep,
    output [M_AXIS_SCALAR_88_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_88_tstrb,
    output [M_AXIS_SCALAR_88_DIRECT_DMWIDTH-1:0] m_axis_scalar_88_tdata,
    input m_axis_scalar_88_tready,
    //output Scalar to AXI-Stream interface 89
    input m_axis_scalar_89_aclk,
    input m_axis_scalar_89_aresetn,
    output m_axis_scalar_89_tlast,
    output m_axis_scalar_89_tvalid,
    output [M_AXIS_SCALAR_89_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_89_tkeep,
    output [M_AXIS_SCALAR_89_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_89_tstrb,
    output [M_AXIS_SCALAR_89_DIRECT_DMWIDTH-1:0] m_axis_scalar_89_tdata,
    input m_axis_scalar_89_tready,
    //output Scalar to AXI-Stream interface 90
    input m_axis_scalar_90_aclk,
    input m_axis_scalar_90_aresetn,
    output m_axis_scalar_90_tlast,
    output m_axis_scalar_90_tvalid,
    output [M_AXIS_SCALAR_90_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_90_tkeep,
    output [M_AXIS_SCALAR_90_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_90_tstrb,
    output [M_AXIS_SCALAR_90_DIRECT_DMWIDTH-1:0] m_axis_scalar_90_tdata,
    input m_axis_scalar_90_tready,
    //output Scalar to AXI-Stream interface 91
    input m_axis_scalar_91_aclk,
    input m_axis_scalar_91_aresetn,
    output m_axis_scalar_91_tlast,
    output m_axis_scalar_91_tvalid,
    output [M_AXIS_SCALAR_91_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_91_tkeep,
    output [M_AXIS_SCALAR_91_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_91_tstrb,
    output [M_AXIS_SCALAR_91_DIRECT_DMWIDTH-1:0] m_axis_scalar_91_tdata,
    input m_axis_scalar_91_tready,
    //output Scalar to AXI-Stream interface 92
    input m_axis_scalar_92_aclk,
    input m_axis_scalar_92_aresetn,
    output m_axis_scalar_92_tlast,
    output m_axis_scalar_92_tvalid,
    output [M_AXIS_SCALAR_92_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_92_tkeep,
    output [M_AXIS_SCALAR_92_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_92_tstrb,
    output [M_AXIS_SCALAR_92_DIRECT_DMWIDTH-1:0] m_axis_scalar_92_tdata,
    input m_axis_scalar_92_tready,
    //output Scalar to AXI-Stream interface 93
    input m_axis_scalar_93_aclk,
    input m_axis_scalar_93_aresetn,
    output m_axis_scalar_93_tlast,
    output m_axis_scalar_93_tvalid,
    output [M_AXIS_SCALAR_93_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_93_tkeep,
    output [M_AXIS_SCALAR_93_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_93_tstrb,
    output [M_AXIS_SCALAR_93_DIRECT_DMWIDTH-1:0] m_axis_scalar_93_tdata,
    input m_axis_scalar_93_tready,
    //output Scalar to AXI-Stream interface 94
    input m_axis_scalar_94_aclk,
    input m_axis_scalar_94_aresetn,
    output m_axis_scalar_94_tlast,
    output m_axis_scalar_94_tvalid,
    output [M_AXIS_SCALAR_94_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_94_tkeep,
    output [M_AXIS_SCALAR_94_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_94_tstrb,
    output [M_AXIS_SCALAR_94_DIRECT_DMWIDTH-1:0] m_axis_scalar_94_tdata,
    input m_axis_scalar_94_tready,
    //output Scalar to AXI-Stream interface 95
    input m_axis_scalar_95_aclk,
    input m_axis_scalar_95_aresetn,
    output m_axis_scalar_95_tlast,
    output m_axis_scalar_95_tvalid,
    output [M_AXIS_SCALAR_95_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_95_tkeep,
    output [M_AXIS_SCALAR_95_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_95_tstrb,
    output [M_AXIS_SCALAR_95_DIRECT_DMWIDTH-1:0] m_axis_scalar_95_tdata,
    input m_axis_scalar_95_tready,
    //output Scalar to AXI-Stream interface 96
    input m_axis_scalar_96_aclk,
    input m_axis_scalar_96_aresetn,
    output m_axis_scalar_96_tlast,
    output m_axis_scalar_96_tvalid,
    output [M_AXIS_SCALAR_96_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_96_tkeep,
    output [M_AXIS_SCALAR_96_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_96_tstrb,
    output [M_AXIS_SCALAR_96_DIRECT_DMWIDTH-1:0] m_axis_scalar_96_tdata,
    input m_axis_scalar_96_tready,
    //output Scalar to AXI-Stream interface 97
    input m_axis_scalar_97_aclk,
    input m_axis_scalar_97_aresetn,
    output m_axis_scalar_97_tlast,
    output m_axis_scalar_97_tvalid,
    output [M_AXIS_SCALAR_97_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_97_tkeep,
    output [M_AXIS_SCALAR_97_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_97_tstrb,
    output [M_AXIS_SCALAR_97_DIRECT_DMWIDTH-1:0] m_axis_scalar_97_tdata,
    input m_axis_scalar_97_tready,
    //output Scalar to AXI-Stream interface 98
    input m_axis_scalar_98_aclk,
    input m_axis_scalar_98_aresetn,
    output m_axis_scalar_98_tlast,
    output m_axis_scalar_98_tvalid,
    output [M_AXIS_SCALAR_98_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_98_tkeep,
    output [M_AXIS_SCALAR_98_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_98_tstrb,
    output [M_AXIS_SCALAR_98_DIRECT_DMWIDTH-1:0] m_axis_scalar_98_tdata,
    input m_axis_scalar_98_tready,
    //output Scalar to AXI-Stream interface 99
    input m_axis_scalar_99_aclk,
    input m_axis_scalar_99_aresetn,
    output m_axis_scalar_99_tlast,
    output m_axis_scalar_99_tvalid,
    output [M_AXIS_SCALAR_99_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_99_tkeep,
    output [M_AXIS_SCALAR_99_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_99_tstrb,
    output [M_AXIS_SCALAR_99_DIRECT_DMWIDTH-1:0] m_axis_scalar_99_tdata,
    input m_axis_scalar_99_tready,
    //output Scalar to AXI-Stream interface 100
    input m_axis_scalar_100_aclk,
    input m_axis_scalar_100_aresetn,
    output m_axis_scalar_100_tlast,
    output m_axis_scalar_100_tvalid,
    output [M_AXIS_SCALAR_100_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_100_tkeep,
    output [M_AXIS_SCALAR_100_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_100_tstrb,
    output [M_AXIS_SCALAR_100_DIRECT_DMWIDTH-1:0] m_axis_scalar_100_tdata,
    input m_axis_scalar_100_tready,
    //output Scalar to AXI-Stream interface 101
    input m_axis_scalar_101_aclk,
    input m_axis_scalar_101_aresetn,
    output m_axis_scalar_101_tlast,
    output m_axis_scalar_101_tvalid,
    output [M_AXIS_SCALAR_101_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_101_tkeep,
    output [M_AXIS_SCALAR_101_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_101_tstrb,
    output [M_AXIS_SCALAR_101_DIRECT_DMWIDTH-1:0] m_axis_scalar_101_tdata,
    input m_axis_scalar_101_tready,
    //output Scalar to AXI-Stream interface 102
    input m_axis_scalar_102_aclk,
    input m_axis_scalar_102_aresetn,
    output m_axis_scalar_102_tlast,
    output m_axis_scalar_102_tvalid,
    output [M_AXIS_SCALAR_102_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_102_tkeep,
    output [M_AXIS_SCALAR_102_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_102_tstrb,
    output [M_AXIS_SCALAR_102_DIRECT_DMWIDTH-1:0] m_axis_scalar_102_tdata,
    input m_axis_scalar_102_tready,
    //output Scalar to AXI-Stream interface 103
    input m_axis_scalar_103_aclk,
    input m_axis_scalar_103_aresetn,
    output m_axis_scalar_103_tlast,
    output m_axis_scalar_103_tvalid,
    output [M_AXIS_SCALAR_103_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_103_tkeep,
    output [M_AXIS_SCALAR_103_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_103_tstrb,
    output [M_AXIS_SCALAR_103_DIRECT_DMWIDTH-1:0] m_axis_scalar_103_tdata,
    input m_axis_scalar_103_tready,
    //output Scalar to AXI-Stream interface 104
    input m_axis_scalar_104_aclk,
    input m_axis_scalar_104_aresetn,
    output m_axis_scalar_104_tlast,
    output m_axis_scalar_104_tvalid,
    output [M_AXIS_SCALAR_104_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_104_tkeep,
    output [M_AXIS_SCALAR_104_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_104_tstrb,
    output [M_AXIS_SCALAR_104_DIRECT_DMWIDTH-1:0] m_axis_scalar_104_tdata,
    input m_axis_scalar_104_tready,
    //output Scalar to AXI-Stream interface 105
    input m_axis_scalar_105_aclk,
    input m_axis_scalar_105_aresetn,
    output m_axis_scalar_105_tlast,
    output m_axis_scalar_105_tvalid,
    output [M_AXIS_SCALAR_105_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_105_tkeep,
    output [M_AXIS_SCALAR_105_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_105_tstrb,
    output [M_AXIS_SCALAR_105_DIRECT_DMWIDTH-1:0] m_axis_scalar_105_tdata,
    input m_axis_scalar_105_tready,
    //output Scalar to AXI-Stream interface 106
    input m_axis_scalar_106_aclk,
    input m_axis_scalar_106_aresetn,
    output m_axis_scalar_106_tlast,
    output m_axis_scalar_106_tvalid,
    output [M_AXIS_SCALAR_106_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_106_tkeep,
    output [M_AXIS_SCALAR_106_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_106_tstrb,
    output [M_AXIS_SCALAR_106_DIRECT_DMWIDTH-1:0] m_axis_scalar_106_tdata,
    input m_axis_scalar_106_tready,
    //output Scalar to AXI-Stream interface 107
    input m_axis_scalar_107_aclk,
    input m_axis_scalar_107_aresetn,
    output m_axis_scalar_107_tlast,
    output m_axis_scalar_107_tvalid,
    output [M_AXIS_SCALAR_107_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_107_tkeep,
    output [M_AXIS_SCALAR_107_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_107_tstrb,
    output [M_AXIS_SCALAR_107_DIRECT_DMWIDTH-1:0] m_axis_scalar_107_tdata,
    input m_axis_scalar_107_tready,
    //output Scalar to AXI-Stream interface 108
    input m_axis_scalar_108_aclk,
    input m_axis_scalar_108_aresetn,
    output m_axis_scalar_108_tlast,
    output m_axis_scalar_108_tvalid,
    output [M_AXIS_SCALAR_108_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_108_tkeep,
    output [M_AXIS_SCALAR_108_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_108_tstrb,
    output [M_AXIS_SCALAR_108_DIRECT_DMWIDTH-1:0] m_axis_scalar_108_tdata,
    input m_axis_scalar_108_tready,
    //output Scalar to AXI-Stream interface 109
    input m_axis_scalar_109_aclk,
    input m_axis_scalar_109_aresetn,
    output m_axis_scalar_109_tlast,
    output m_axis_scalar_109_tvalid,
    output [M_AXIS_SCALAR_109_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_109_tkeep,
    output [M_AXIS_SCALAR_109_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_109_tstrb,
    output [M_AXIS_SCALAR_109_DIRECT_DMWIDTH-1:0] m_axis_scalar_109_tdata,
    input m_axis_scalar_109_tready,
    //output Scalar to AXI-Stream interface 110
    input m_axis_scalar_110_aclk,
    input m_axis_scalar_110_aresetn,
    output m_axis_scalar_110_tlast,
    output m_axis_scalar_110_tvalid,
    output [M_AXIS_SCALAR_110_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_110_tkeep,
    output [M_AXIS_SCALAR_110_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_110_tstrb,
    output [M_AXIS_SCALAR_110_DIRECT_DMWIDTH-1:0] m_axis_scalar_110_tdata,
    input m_axis_scalar_110_tready,
    //output Scalar to AXI-Stream interface 111
    input m_axis_scalar_111_aclk,
    input m_axis_scalar_111_aresetn,
    output m_axis_scalar_111_tlast,
    output m_axis_scalar_111_tvalid,
    output [M_AXIS_SCALAR_111_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_111_tkeep,
    output [M_AXIS_SCALAR_111_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_111_tstrb,
    output [M_AXIS_SCALAR_111_DIRECT_DMWIDTH-1:0] m_axis_scalar_111_tdata,
    input m_axis_scalar_111_tready,
    //output Scalar to AXI-Stream interface 112
    input m_axis_scalar_112_aclk,
    input m_axis_scalar_112_aresetn,
    output m_axis_scalar_112_tlast,
    output m_axis_scalar_112_tvalid,
    output [M_AXIS_SCALAR_112_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_112_tkeep,
    output [M_AXIS_SCALAR_112_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_112_tstrb,
    output [M_AXIS_SCALAR_112_DIRECT_DMWIDTH-1:0] m_axis_scalar_112_tdata,
    input m_axis_scalar_112_tready,
    //output Scalar to AXI-Stream interface 113
    input m_axis_scalar_113_aclk,
    input m_axis_scalar_113_aresetn,
    output m_axis_scalar_113_tlast,
    output m_axis_scalar_113_tvalid,
    output [M_AXIS_SCALAR_113_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_113_tkeep,
    output [M_AXIS_SCALAR_113_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_113_tstrb,
    output [M_AXIS_SCALAR_113_DIRECT_DMWIDTH-1:0] m_axis_scalar_113_tdata,
    input m_axis_scalar_113_tready,
    //output Scalar to AXI-Stream interface 114
    input m_axis_scalar_114_aclk,
    input m_axis_scalar_114_aresetn,
    output m_axis_scalar_114_tlast,
    output m_axis_scalar_114_tvalid,
    output [M_AXIS_SCALAR_114_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_114_tkeep,
    output [M_AXIS_SCALAR_114_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_114_tstrb,
    output [M_AXIS_SCALAR_114_DIRECT_DMWIDTH-1:0] m_axis_scalar_114_tdata,
    input m_axis_scalar_114_tready,
    //output Scalar to AXI-Stream interface 115
    input m_axis_scalar_115_aclk,
    input m_axis_scalar_115_aresetn,
    output m_axis_scalar_115_tlast,
    output m_axis_scalar_115_tvalid,
    output [M_AXIS_SCALAR_115_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_115_tkeep,
    output [M_AXIS_SCALAR_115_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_115_tstrb,
    output [M_AXIS_SCALAR_115_DIRECT_DMWIDTH-1:0] m_axis_scalar_115_tdata,
    input m_axis_scalar_115_tready,
    //output Scalar to AXI-Stream interface 116
    input m_axis_scalar_116_aclk,
    input m_axis_scalar_116_aresetn,
    output m_axis_scalar_116_tlast,
    output m_axis_scalar_116_tvalid,
    output [M_AXIS_SCALAR_116_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_116_tkeep,
    output [M_AXIS_SCALAR_116_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_116_tstrb,
    output [M_AXIS_SCALAR_116_DIRECT_DMWIDTH-1:0] m_axis_scalar_116_tdata,
    input m_axis_scalar_116_tready,
    //output Scalar to AXI-Stream interface 117
    input m_axis_scalar_117_aclk,
    input m_axis_scalar_117_aresetn,
    output m_axis_scalar_117_tlast,
    output m_axis_scalar_117_tvalid,
    output [M_AXIS_SCALAR_117_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_117_tkeep,
    output [M_AXIS_SCALAR_117_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_117_tstrb,
    output [M_AXIS_SCALAR_117_DIRECT_DMWIDTH-1:0] m_axis_scalar_117_tdata,
    input m_axis_scalar_117_tready,
    //output Scalar to AXI-Stream interface 118
    input m_axis_scalar_118_aclk,
    input m_axis_scalar_118_aresetn,
    output m_axis_scalar_118_tlast,
    output m_axis_scalar_118_tvalid,
    output [M_AXIS_SCALAR_118_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_118_tkeep,
    output [M_AXIS_SCALAR_118_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_118_tstrb,
    output [M_AXIS_SCALAR_118_DIRECT_DMWIDTH-1:0] m_axis_scalar_118_tdata,
    input m_axis_scalar_118_tready,
    //output Scalar to AXI-Stream interface 119
    input m_axis_scalar_119_aclk,
    input m_axis_scalar_119_aresetn,
    output m_axis_scalar_119_tlast,
    output m_axis_scalar_119_tvalid,
    output [M_AXIS_SCALAR_119_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_119_tkeep,
    output [M_AXIS_SCALAR_119_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_119_tstrb,
    output [M_AXIS_SCALAR_119_DIRECT_DMWIDTH-1:0] m_axis_scalar_119_tdata,
    input m_axis_scalar_119_tready,
    //output Scalar to AXI-Stream interface 120
    input m_axis_scalar_120_aclk,
    input m_axis_scalar_120_aresetn,
    output m_axis_scalar_120_tlast,
    output m_axis_scalar_120_tvalid,
    output [M_AXIS_SCALAR_120_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_120_tkeep,
    output [M_AXIS_SCALAR_120_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_120_tstrb,
    output [M_AXIS_SCALAR_120_DIRECT_DMWIDTH-1:0] m_axis_scalar_120_tdata,
    input m_axis_scalar_120_tready,
    //output Scalar to AXI-Stream interface 121
    input m_axis_scalar_121_aclk,
    input m_axis_scalar_121_aresetn,
    output m_axis_scalar_121_tlast,
    output m_axis_scalar_121_tvalid,
    output [M_AXIS_SCALAR_121_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_121_tkeep,
    output [M_AXIS_SCALAR_121_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_121_tstrb,
    output [M_AXIS_SCALAR_121_DIRECT_DMWIDTH-1:0] m_axis_scalar_121_tdata,
    input m_axis_scalar_121_tready,
    //output Scalar to AXI-Stream interface 122
    input m_axis_scalar_122_aclk,
    input m_axis_scalar_122_aresetn,
    output m_axis_scalar_122_tlast,
    output m_axis_scalar_122_tvalid,
    output [M_AXIS_SCALAR_122_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_122_tkeep,
    output [M_AXIS_SCALAR_122_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_122_tstrb,
    output [M_AXIS_SCALAR_122_DIRECT_DMWIDTH-1:0] m_axis_scalar_122_tdata,
    input m_axis_scalar_122_tready,
    //output Scalar to AXI-Stream interface 123
    input m_axis_scalar_123_aclk,
    input m_axis_scalar_123_aresetn,
    output m_axis_scalar_123_tlast,
    output m_axis_scalar_123_tvalid,
    output [M_AXIS_SCALAR_123_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_123_tkeep,
    output [M_AXIS_SCALAR_123_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_123_tstrb,
    output [M_AXIS_SCALAR_123_DIRECT_DMWIDTH-1:0] m_axis_scalar_123_tdata,
    input m_axis_scalar_123_tready,
    //output Scalar to AXI-Stream interface 124
    input m_axis_scalar_124_aclk,
    input m_axis_scalar_124_aresetn,
    output m_axis_scalar_124_tlast,
    output m_axis_scalar_124_tvalid,
    output [M_AXIS_SCALAR_124_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_124_tkeep,
    output [M_AXIS_SCALAR_124_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_124_tstrb,
    output [M_AXIS_SCALAR_124_DIRECT_DMWIDTH-1:0] m_axis_scalar_124_tdata,
    input m_axis_scalar_124_tready,
    //output Scalar to AXI-Stream interface 125
    input m_axis_scalar_125_aclk,
    input m_axis_scalar_125_aresetn,
    output m_axis_scalar_125_tlast,
    output m_axis_scalar_125_tvalid,
    output [M_AXIS_SCALAR_125_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_125_tkeep,
    output [M_AXIS_SCALAR_125_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_125_tstrb,
    output [M_AXIS_SCALAR_125_DIRECT_DMWIDTH-1:0] m_axis_scalar_125_tdata,
    input m_axis_scalar_125_tready,
    //output Scalar to AXI-Stream interface 126
    input m_axis_scalar_126_aclk,
    input m_axis_scalar_126_aresetn,
    output m_axis_scalar_126_tlast,
    output m_axis_scalar_126_tvalid,
    output [M_AXIS_SCALAR_126_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_126_tkeep,
    output [M_AXIS_SCALAR_126_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_126_tstrb,
    output [M_AXIS_SCALAR_126_DIRECT_DMWIDTH-1:0] m_axis_scalar_126_tdata,
    input m_axis_scalar_126_tready,
    //output Scalar to AXI-Stream interface 127
    input m_axis_scalar_127_aclk,
    input m_axis_scalar_127_aresetn,
    output m_axis_scalar_127_tlast,
    output m_axis_scalar_127_tvalid,
    output [M_AXIS_SCALAR_127_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_127_tkeep,
    output [M_AXIS_SCALAR_127_DIRECT_DMWIDTH/8-1:0] m_axis_scalar_127_tstrb,
    output [M_AXIS_SCALAR_127_DIRECT_DMWIDTH-1:0] m_axis_scalar_127_tdata,
    input m_axis_scalar_127_tready
);


localparam C_MAX_INSCALARS = 128;
localparam [(C_MAX_INSCALARS*32)-1:0] S_AXIS_SCALAR_BIT_ARRAY = {C_INSCALAR_127_BITS,C_INSCALAR_126_BITS,C_INSCALAR_125_BITS,C_INSCALAR_124_BITS,C_INSCALAR_123_BITS,C_INSCALAR_122_BITS,C_INSCALAR_121_BITS,C_INSCALAR_120_BITS,C_INSCALAR_119_BITS,C_INSCALAR_118_BITS,C_INSCALAR_117_BITS,C_INSCALAR_116_BITS,C_INSCALAR_115_BITS,C_INSCALAR_114_BITS,C_INSCALAR_113_BITS,C_INSCALAR_112_BITS,C_INSCALAR_111_BITS,C_INSCALAR_110_BITS,C_INSCALAR_109_BITS,C_INSCALAR_108_BITS,C_INSCALAR_107_BITS,C_INSCALAR_106_BITS,C_INSCALAR_105_BITS,C_INSCALAR_104_BITS,C_INSCALAR_103_BITS,C_INSCALAR_102_BITS,C_INSCALAR_101_BITS,C_INSCALAR_100_BITS,C_INSCALAR_99_BITS,C_INSCALAR_98_BITS,C_INSCALAR_97_BITS,C_INSCALAR_96_BITS,C_INSCALAR_95_BITS,C_INSCALAR_94_BITS,C_INSCALAR_93_BITS,C_INSCALAR_92_BITS,C_INSCALAR_91_BITS,C_INSCALAR_90_BITS,C_INSCALAR_89_BITS,C_INSCALAR_88_BITS,C_INSCALAR_87_BITS,C_INSCALAR_86_BITS,C_INSCALAR_85_BITS,C_INSCALAR_84_BITS,C_INSCALAR_83_BITS,C_INSCALAR_82_BITS,C_INSCALAR_81_BITS,C_INSCALAR_80_BITS,C_INSCALAR_79_BITS,C_INSCALAR_78_BITS,C_INSCALAR_77_BITS,C_INSCALAR_76_BITS,C_INSCALAR_75_BITS,C_INSCALAR_74_BITS,C_INSCALAR_73_BITS,C_INSCALAR_72_BITS,C_INSCALAR_71_BITS,C_INSCALAR_70_BITS,C_INSCALAR_69_BITS,C_INSCALAR_68_BITS,C_INSCALAR_67_BITS,C_INSCALAR_66_BITS,C_INSCALAR_65_BITS,C_INSCALAR_64_BITS,C_INSCALAR_63_BITS,C_INSCALAR_62_BITS,C_INSCALAR_61_BITS,C_INSCALAR_60_BITS,C_INSCALAR_59_BITS,C_INSCALAR_58_BITS,C_INSCALAR_57_BITS,C_INSCALAR_56_BITS,C_INSCALAR_55_BITS,C_INSCALAR_54_BITS,C_INSCALAR_53_BITS,C_INSCALAR_52_BITS,C_INSCALAR_51_BITS,C_INSCALAR_50_BITS,C_INSCALAR_49_BITS,C_INSCALAR_48_BITS,C_INSCALAR_47_BITS,C_INSCALAR_46_BITS,C_INSCALAR_45_BITS,C_INSCALAR_44_BITS,C_INSCALAR_43_BITS,C_INSCALAR_42_BITS,C_INSCALAR_41_BITS,C_INSCALAR_40_BITS,C_INSCALAR_39_BITS,C_INSCALAR_38_BITS,C_INSCALAR_37_BITS,C_INSCALAR_36_BITS,C_INSCALAR_35_BITS,C_INSCALAR_34_BITS,C_INSCALAR_33_BITS,C_INSCALAR_32_BITS,C_INSCALAR_31_BITS,C_INSCALAR_30_BITS,C_INSCALAR_29_BITS,C_INSCALAR_28_BITS,C_INSCALAR_27_BITS,C_INSCALAR_26_BITS,C_INSCALAR_25_BITS,C_INSCALAR_24_BITS,C_INSCALAR_23_BITS,C_INSCALAR_22_BITS,C_INSCALAR_21_BITS,C_INSCALAR_20_BITS,C_INSCALAR_19_BITS,C_INSCALAR_18_BITS,C_INSCALAR_17_BITS,C_INSCALAR_16_BITS,C_INSCALAR_15_BITS,C_INSCALAR_14_BITS,C_INSCALAR_13_BITS,C_INSCALAR_12_BITS,C_INSCALAR_11_BITS,C_INSCALAR_10_BITS,C_INSCALAR_9_BITS,C_INSCALAR_8_BITS,C_INSCALAR_7_BITS,C_INSCALAR_6_BITS,C_INSCALAR_5_BITS,C_INSCALAR_4_BITS,C_INSCALAR_3_BITS,C_INSCALAR_2_BITS,C_INSCALAR_1_BITS,C_INSCALAR_0_BITS};
localparam [(C_MAX_INSCALARS*32)-1:0] S_AXIS_SCALAR_IS_DIRECT_ARRAY = {S_AXIS_SCALAR_127_IS_DIRECT,S_AXIS_SCALAR_126_IS_DIRECT,S_AXIS_SCALAR_125_IS_DIRECT,S_AXIS_SCALAR_124_IS_DIRECT,S_AXIS_SCALAR_123_IS_DIRECT,S_AXIS_SCALAR_122_IS_DIRECT,S_AXIS_SCALAR_121_IS_DIRECT,S_AXIS_SCALAR_120_IS_DIRECT,S_AXIS_SCALAR_119_IS_DIRECT,S_AXIS_SCALAR_118_IS_DIRECT,S_AXIS_SCALAR_117_IS_DIRECT,S_AXIS_SCALAR_116_IS_DIRECT,S_AXIS_SCALAR_115_IS_DIRECT,S_AXIS_SCALAR_114_IS_DIRECT,S_AXIS_SCALAR_113_IS_DIRECT,S_AXIS_SCALAR_112_IS_DIRECT,S_AXIS_SCALAR_111_IS_DIRECT,S_AXIS_SCALAR_110_IS_DIRECT,S_AXIS_SCALAR_109_IS_DIRECT,S_AXIS_SCALAR_108_IS_DIRECT,S_AXIS_SCALAR_107_IS_DIRECT,S_AXIS_SCALAR_106_IS_DIRECT,S_AXIS_SCALAR_105_IS_DIRECT,S_AXIS_SCALAR_104_IS_DIRECT,S_AXIS_SCALAR_103_IS_DIRECT,S_AXIS_SCALAR_102_IS_DIRECT,S_AXIS_SCALAR_101_IS_DIRECT,S_AXIS_SCALAR_100_IS_DIRECT,S_AXIS_SCALAR_99_IS_DIRECT,S_AXIS_SCALAR_98_IS_DIRECT,S_AXIS_SCALAR_97_IS_DIRECT,S_AXIS_SCALAR_96_IS_DIRECT,S_AXIS_SCALAR_95_IS_DIRECT,S_AXIS_SCALAR_94_IS_DIRECT,S_AXIS_SCALAR_93_IS_DIRECT,S_AXIS_SCALAR_92_IS_DIRECT,S_AXIS_SCALAR_91_IS_DIRECT,S_AXIS_SCALAR_90_IS_DIRECT,S_AXIS_SCALAR_89_IS_DIRECT,S_AXIS_SCALAR_88_IS_DIRECT,S_AXIS_SCALAR_87_IS_DIRECT,S_AXIS_SCALAR_86_IS_DIRECT,S_AXIS_SCALAR_85_IS_DIRECT,S_AXIS_SCALAR_84_IS_DIRECT,S_AXIS_SCALAR_83_IS_DIRECT,S_AXIS_SCALAR_82_IS_DIRECT,S_AXIS_SCALAR_81_IS_DIRECT,S_AXIS_SCALAR_80_IS_DIRECT,S_AXIS_SCALAR_79_IS_DIRECT,S_AXIS_SCALAR_78_IS_DIRECT,S_AXIS_SCALAR_77_IS_DIRECT,S_AXIS_SCALAR_76_IS_DIRECT,S_AXIS_SCALAR_75_IS_DIRECT,S_AXIS_SCALAR_74_IS_DIRECT,S_AXIS_SCALAR_73_IS_DIRECT,S_AXIS_SCALAR_72_IS_DIRECT,S_AXIS_SCALAR_71_IS_DIRECT,S_AXIS_SCALAR_70_IS_DIRECT,S_AXIS_SCALAR_69_IS_DIRECT,S_AXIS_SCALAR_68_IS_DIRECT,S_AXIS_SCALAR_67_IS_DIRECT,S_AXIS_SCALAR_66_IS_DIRECT,S_AXIS_SCALAR_65_IS_DIRECT,S_AXIS_SCALAR_64_IS_DIRECT,S_AXIS_SCALAR_63_IS_DIRECT,S_AXIS_SCALAR_62_IS_DIRECT,S_AXIS_SCALAR_61_IS_DIRECT,S_AXIS_SCALAR_60_IS_DIRECT,S_AXIS_SCALAR_59_IS_DIRECT,S_AXIS_SCALAR_58_IS_DIRECT,S_AXIS_SCALAR_57_IS_DIRECT,S_AXIS_SCALAR_56_IS_DIRECT,S_AXIS_SCALAR_55_IS_DIRECT,S_AXIS_SCALAR_54_IS_DIRECT,S_AXIS_SCALAR_53_IS_DIRECT,S_AXIS_SCALAR_52_IS_DIRECT,S_AXIS_SCALAR_51_IS_DIRECT,S_AXIS_SCALAR_50_IS_DIRECT,S_AXIS_SCALAR_49_IS_DIRECT,S_AXIS_SCALAR_48_IS_DIRECT,S_AXIS_SCALAR_47_IS_DIRECT,S_AXIS_SCALAR_46_IS_DIRECT,S_AXIS_SCALAR_45_IS_DIRECT,S_AXIS_SCALAR_44_IS_DIRECT,S_AXIS_SCALAR_43_IS_DIRECT,S_AXIS_SCALAR_42_IS_DIRECT,S_AXIS_SCALAR_41_IS_DIRECT,S_AXIS_SCALAR_40_IS_DIRECT,S_AXIS_SCALAR_39_IS_DIRECT,S_AXIS_SCALAR_38_IS_DIRECT,S_AXIS_SCALAR_37_IS_DIRECT,S_AXIS_SCALAR_36_IS_DIRECT,S_AXIS_SCALAR_35_IS_DIRECT,S_AXIS_SCALAR_34_IS_DIRECT,S_AXIS_SCALAR_33_IS_DIRECT,S_AXIS_SCALAR_32_IS_DIRECT,S_AXIS_SCALAR_31_IS_DIRECT,S_AXIS_SCALAR_30_IS_DIRECT,S_AXIS_SCALAR_29_IS_DIRECT,S_AXIS_SCALAR_28_IS_DIRECT,S_AXIS_SCALAR_27_IS_DIRECT,S_AXIS_SCALAR_26_IS_DIRECT,S_AXIS_SCALAR_25_IS_DIRECT,S_AXIS_SCALAR_24_IS_DIRECT,S_AXIS_SCALAR_23_IS_DIRECT,S_AXIS_SCALAR_22_IS_DIRECT,S_AXIS_SCALAR_21_IS_DIRECT,S_AXIS_SCALAR_20_IS_DIRECT,S_AXIS_SCALAR_19_IS_DIRECT,S_AXIS_SCALAR_18_IS_DIRECT,S_AXIS_SCALAR_17_IS_DIRECT,S_AXIS_SCALAR_16_IS_DIRECT,S_AXIS_SCALAR_15_IS_DIRECT,S_AXIS_SCALAR_14_IS_DIRECT,S_AXIS_SCALAR_13_IS_DIRECT,S_AXIS_SCALAR_12_IS_DIRECT,S_AXIS_SCALAR_11_IS_DIRECT,S_AXIS_SCALAR_10_IS_DIRECT,S_AXIS_SCALAR_9_IS_DIRECT,S_AXIS_SCALAR_8_IS_DIRECT,S_AXIS_SCALAR_7_IS_DIRECT,S_AXIS_SCALAR_6_IS_DIRECT,S_AXIS_SCALAR_5_IS_DIRECT,S_AXIS_SCALAR_4_IS_DIRECT,S_AXIS_SCALAR_3_IS_DIRECT,S_AXIS_SCALAR_2_IS_DIRECT,S_AXIS_SCALAR_1_IS_DIRECT,S_AXIS_SCALAR_0_IS_DIRECT};
localparam [(C_MAX_INSCALARS*32)-1:0] S_AXIS_SCALAR_DMWIDTH_ARRAY = {S_AXIS_SCALAR_127_DIRECT_DMWIDTH,S_AXIS_SCALAR_126_DIRECT_DMWIDTH,S_AXIS_SCALAR_125_DIRECT_DMWIDTH,S_AXIS_SCALAR_124_DIRECT_DMWIDTH,S_AXIS_SCALAR_123_DIRECT_DMWIDTH,S_AXIS_SCALAR_122_DIRECT_DMWIDTH,S_AXIS_SCALAR_121_DIRECT_DMWIDTH,S_AXIS_SCALAR_120_DIRECT_DMWIDTH,S_AXIS_SCALAR_119_DIRECT_DMWIDTH,S_AXIS_SCALAR_118_DIRECT_DMWIDTH,S_AXIS_SCALAR_117_DIRECT_DMWIDTH,S_AXIS_SCALAR_116_DIRECT_DMWIDTH,S_AXIS_SCALAR_115_DIRECT_DMWIDTH,S_AXIS_SCALAR_114_DIRECT_DMWIDTH,S_AXIS_SCALAR_113_DIRECT_DMWIDTH,S_AXIS_SCALAR_112_DIRECT_DMWIDTH,S_AXIS_SCALAR_111_DIRECT_DMWIDTH,S_AXIS_SCALAR_110_DIRECT_DMWIDTH,S_AXIS_SCALAR_109_DIRECT_DMWIDTH,S_AXIS_SCALAR_108_DIRECT_DMWIDTH,S_AXIS_SCALAR_107_DIRECT_DMWIDTH,S_AXIS_SCALAR_106_DIRECT_DMWIDTH,S_AXIS_SCALAR_105_DIRECT_DMWIDTH,S_AXIS_SCALAR_104_DIRECT_DMWIDTH,S_AXIS_SCALAR_103_DIRECT_DMWIDTH,S_AXIS_SCALAR_102_DIRECT_DMWIDTH,S_AXIS_SCALAR_101_DIRECT_DMWIDTH,S_AXIS_SCALAR_100_DIRECT_DMWIDTH,S_AXIS_SCALAR_99_DIRECT_DMWIDTH,S_AXIS_SCALAR_98_DIRECT_DMWIDTH,S_AXIS_SCALAR_97_DIRECT_DMWIDTH,S_AXIS_SCALAR_96_DIRECT_DMWIDTH,S_AXIS_SCALAR_95_DIRECT_DMWIDTH,S_AXIS_SCALAR_94_DIRECT_DMWIDTH,S_AXIS_SCALAR_93_DIRECT_DMWIDTH,S_AXIS_SCALAR_92_DIRECT_DMWIDTH,S_AXIS_SCALAR_91_DIRECT_DMWIDTH,S_AXIS_SCALAR_90_DIRECT_DMWIDTH,S_AXIS_SCALAR_89_DIRECT_DMWIDTH,S_AXIS_SCALAR_88_DIRECT_DMWIDTH,S_AXIS_SCALAR_87_DIRECT_DMWIDTH,S_AXIS_SCALAR_86_DIRECT_DMWIDTH,S_AXIS_SCALAR_85_DIRECT_DMWIDTH,S_AXIS_SCALAR_84_DIRECT_DMWIDTH,S_AXIS_SCALAR_83_DIRECT_DMWIDTH,S_AXIS_SCALAR_82_DIRECT_DMWIDTH,S_AXIS_SCALAR_81_DIRECT_DMWIDTH,S_AXIS_SCALAR_80_DIRECT_DMWIDTH,S_AXIS_SCALAR_79_DIRECT_DMWIDTH,S_AXIS_SCALAR_78_DIRECT_DMWIDTH,S_AXIS_SCALAR_77_DIRECT_DMWIDTH,S_AXIS_SCALAR_76_DIRECT_DMWIDTH,S_AXIS_SCALAR_75_DIRECT_DMWIDTH,S_AXIS_SCALAR_74_DIRECT_DMWIDTH,S_AXIS_SCALAR_73_DIRECT_DMWIDTH,S_AXIS_SCALAR_72_DIRECT_DMWIDTH,S_AXIS_SCALAR_71_DIRECT_DMWIDTH,S_AXIS_SCALAR_70_DIRECT_DMWIDTH,S_AXIS_SCALAR_69_DIRECT_DMWIDTH,S_AXIS_SCALAR_68_DIRECT_DMWIDTH,S_AXIS_SCALAR_67_DIRECT_DMWIDTH,S_AXIS_SCALAR_66_DIRECT_DMWIDTH,S_AXIS_SCALAR_65_DIRECT_DMWIDTH,S_AXIS_SCALAR_64_DIRECT_DMWIDTH,S_AXIS_SCALAR_63_DIRECT_DMWIDTH,S_AXIS_SCALAR_62_DIRECT_DMWIDTH,S_AXIS_SCALAR_61_DIRECT_DMWIDTH,S_AXIS_SCALAR_60_DIRECT_DMWIDTH,S_AXIS_SCALAR_59_DIRECT_DMWIDTH,S_AXIS_SCALAR_58_DIRECT_DMWIDTH,S_AXIS_SCALAR_57_DIRECT_DMWIDTH,S_AXIS_SCALAR_56_DIRECT_DMWIDTH,S_AXIS_SCALAR_55_DIRECT_DMWIDTH,S_AXIS_SCALAR_54_DIRECT_DMWIDTH,S_AXIS_SCALAR_53_DIRECT_DMWIDTH,S_AXIS_SCALAR_52_DIRECT_DMWIDTH,S_AXIS_SCALAR_51_DIRECT_DMWIDTH,S_AXIS_SCALAR_50_DIRECT_DMWIDTH,S_AXIS_SCALAR_49_DIRECT_DMWIDTH,S_AXIS_SCALAR_48_DIRECT_DMWIDTH,S_AXIS_SCALAR_47_DIRECT_DMWIDTH,S_AXIS_SCALAR_46_DIRECT_DMWIDTH,S_AXIS_SCALAR_45_DIRECT_DMWIDTH,S_AXIS_SCALAR_44_DIRECT_DMWIDTH,S_AXIS_SCALAR_43_DIRECT_DMWIDTH,S_AXIS_SCALAR_42_DIRECT_DMWIDTH,S_AXIS_SCALAR_41_DIRECT_DMWIDTH,S_AXIS_SCALAR_40_DIRECT_DMWIDTH,S_AXIS_SCALAR_39_DIRECT_DMWIDTH,S_AXIS_SCALAR_38_DIRECT_DMWIDTH,S_AXIS_SCALAR_37_DIRECT_DMWIDTH,S_AXIS_SCALAR_36_DIRECT_DMWIDTH,S_AXIS_SCALAR_35_DIRECT_DMWIDTH,S_AXIS_SCALAR_34_DIRECT_DMWIDTH,S_AXIS_SCALAR_33_DIRECT_DMWIDTH,S_AXIS_SCALAR_32_DIRECT_DMWIDTH,S_AXIS_SCALAR_31_DIRECT_DMWIDTH,S_AXIS_SCALAR_30_DIRECT_DMWIDTH,S_AXIS_SCALAR_29_DIRECT_DMWIDTH,S_AXIS_SCALAR_28_DIRECT_DMWIDTH,S_AXIS_SCALAR_27_DIRECT_DMWIDTH,S_AXIS_SCALAR_26_DIRECT_DMWIDTH,S_AXIS_SCALAR_25_DIRECT_DMWIDTH,S_AXIS_SCALAR_24_DIRECT_DMWIDTH,S_AXIS_SCALAR_23_DIRECT_DMWIDTH,S_AXIS_SCALAR_22_DIRECT_DMWIDTH,S_AXIS_SCALAR_21_DIRECT_DMWIDTH,S_AXIS_SCALAR_20_DIRECT_DMWIDTH,S_AXIS_SCALAR_19_DIRECT_DMWIDTH,S_AXIS_SCALAR_18_DIRECT_DMWIDTH,S_AXIS_SCALAR_17_DIRECT_DMWIDTH,S_AXIS_SCALAR_16_DIRECT_DMWIDTH,S_AXIS_SCALAR_15_DIRECT_DMWIDTH,S_AXIS_SCALAR_14_DIRECT_DMWIDTH,S_AXIS_SCALAR_13_DIRECT_DMWIDTH,S_AXIS_SCALAR_12_DIRECT_DMWIDTH,S_AXIS_SCALAR_11_DIRECT_DMWIDTH,S_AXIS_SCALAR_10_DIRECT_DMWIDTH,S_AXIS_SCALAR_9_DIRECT_DMWIDTH,S_AXIS_SCALAR_8_DIRECT_DMWIDTH,S_AXIS_SCALAR_7_DIRECT_DMWIDTH,S_AXIS_SCALAR_6_DIRECT_DMWIDTH,S_AXIS_SCALAR_5_DIRECT_DMWIDTH,S_AXIS_SCALAR_4_DIRECT_DMWIDTH,S_AXIS_SCALAR_3_DIRECT_DMWIDTH,S_AXIS_SCALAR_2_DIRECT_DMWIDTH,S_AXIS_SCALAR_1_DIRECT_DMWIDTH,S_AXIS_SCALAR_0_DIRECT_DMWIDTH};
localparam [(C_MAX_INSCALARS*32)-1:0] S_AXIS_SCALAR_IS_ASYNC_ARRAY = {S_AXIS_SCALAR_127_DIRECT_IS_ASYNC,S_AXIS_SCALAR_126_DIRECT_IS_ASYNC,S_AXIS_SCALAR_125_DIRECT_IS_ASYNC,S_AXIS_SCALAR_124_DIRECT_IS_ASYNC,S_AXIS_SCALAR_123_DIRECT_IS_ASYNC,S_AXIS_SCALAR_122_DIRECT_IS_ASYNC,S_AXIS_SCALAR_121_DIRECT_IS_ASYNC,S_AXIS_SCALAR_120_DIRECT_IS_ASYNC,S_AXIS_SCALAR_119_DIRECT_IS_ASYNC,S_AXIS_SCALAR_118_DIRECT_IS_ASYNC,S_AXIS_SCALAR_117_DIRECT_IS_ASYNC,S_AXIS_SCALAR_116_DIRECT_IS_ASYNC,S_AXIS_SCALAR_115_DIRECT_IS_ASYNC,S_AXIS_SCALAR_114_DIRECT_IS_ASYNC,S_AXIS_SCALAR_113_DIRECT_IS_ASYNC,S_AXIS_SCALAR_112_DIRECT_IS_ASYNC,S_AXIS_SCALAR_111_DIRECT_IS_ASYNC,S_AXIS_SCALAR_110_DIRECT_IS_ASYNC,S_AXIS_SCALAR_109_DIRECT_IS_ASYNC,S_AXIS_SCALAR_108_DIRECT_IS_ASYNC,S_AXIS_SCALAR_107_DIRECT_IS_ASYNC,S_AXIS_SCALAR_106_DIRECT_IS_ASYNC,S_AXIS_SCALAR_105_DIRECT_IS_ASYNC,S_AXIS_SCALAR_104_DIRECT_IS_ASYNC,S_AXIS_SCALAR_103_DIRECT_IS_ASYNC,S_AXIS_SCALAR_102_DIRECT_IS_ASYNC,S_AXIS_SCALAR_101_DIRECT_IS_ASYNC,S_AXIS_SCALAR_100_DIRECT_IS_ASYNC,S_AXIS_SCALAR_99_DIRECT_IS_ASYNC,S_AXIS_SCALAR_98_DIRECT_IS_ASYNC,S_AXIS_SCALAR_97_DIRECT_IS_ASYNC,S_AXIS_SCALAR_96_DIRECT_IS_ASYNC,S_AXIS_SCALAR_95_DIRECT_IS_ASYNC,S_AXIS_SCALAR_94_DIRECT_IS_ASYNC,S_AXIS_SCALAR_93_DIRECT_IS_ASYNC,S_AXIS_SCALAR_92_DIRECT_IS_ASYNC,S_AXIS_SCALAR_91_DIRECT_IS_ASYNC,S_AXIS_SCALAR_90_DIRECT_IS_ASYNC,S_AXIS_SCALAR_89_DIRECT_IS_ASYNC,S_AXIS_SCALAR_88_DIRECT_IS_ASYNC,S_AXIS_SCALAR_87_DIRECT_IS_ASYNC,S_AXIS_SCALAR_86_DIRECT_IS_ASYNC,S_AXIS_SCALAR_85_DIRECT_IS_ASYNC,S_AXIS_SCALAR_84_DIRECT_IS_ASYNC,S_AXIS_SCALAR_83_DIRECT_IS_ASYNC,S_AXIS_SCALAR_82_DIRECT_IS_ASYNC,S_AXIS_SCALAR_81_DIRECT_IS_ASYNC,S_AXIS_SCALAR_80_DIRECT_IS_ASYNC,S_AXIS_SCALAR_79_DIRECT_IS_ASYNC,S_AXIS_SCALAR_78_DIRECT_IS_ASYNC,S_AXIS_SCALAR_77_DIRECT_IS_ASYNC,S_AXIS_SCALAR_76_DIRECT_IS_ASYNC,S_AXIS_SCALAR_75_DIRECT_IS_ASYNC,S_AXIS_SCALAR_74_DIRECT_IS_ASYNC,S_AXIS_SCALAR_73_DIRECT_IS_ASYNC,S_AXIS_SCALAR_72_DIRECT_IS_ASYNC,S_AXIS_SCALAR_71_DIRECT_IS_ASYNC,S_AXIS_SCALAR_70_DIRECT_IS_ASYNC,S_AXIS_SCALAR_69_DIRECT_IS_ASYNC,S_AXIS_SCALAR_68_DIRECT_IS_ASYNC,S_AXIS_SCALAR_67_DIRECT_IS_ASYNC,S_AXIS_SCALAR_66_DIRECT_IS_ASYNC,S_AXIS_SCALAR_65_DIRECT_IS_ASYNC,S_AXIS_SCALAR_64_DIRECT_IS_ASYNC,S_AXIS_SCALAR_63_DIRECT_IS_ASYNC,S_AXIS_SCALAR_62_DIRECT_IS_ASYNC,S_AXIS_SCALAR_61_DIRECT_IS_ASYNC,S_AXIS_SCALAR_60_DIRECT_IS_ASYNC,S_AXIS_SCALAR_59_DIRECT_IS_ASYNC,S_AXIS_SCALAR_58_DIRECT_IS_ASYNC,S_AXIS_SCALAR_57_DIRECT_IS_ASYNC,S_AXIS_SCALAR_56_DIRECT_IS_ASYNC,S_AXIS_SCALAR_55_DIRECT_IS_ASYNC,S_AXIS_SCALAR_54_DIRECT_IS_ASYNC,S_AXIS_SCALAR_53_DIRECT_IS_ASYNC,S_AXIS_SCALAR_52_DIRECT_IS_ASYNC,S_AXIS_SCALAR_51_DIRECT_IS_ASYNC,S_AXIS_SCALAR_50_DIRECT_IS_ASYNC,S_AXIS_SCALAR_49_DIRECT_IS_ASYNC,S_AXIS_SCALAR_48_DIRECT_IS_ASYNC,S_AXIS_SCALAR_47_DIRECT_IS_ASYNC,S_AXIS_SCALAR_46_DIRECT_IS_ASYNC,S_AXIS_SCALAR_45_DIRECT_IS_ASYNC,S_AXIS_SCALAR_44_DIRECT_IS_ASYNC,S_AXIS_SCALAR_43_DIRECT_IS_ASYNC,S_AXIS_SCALAR_42_DIRECT_IS_ASYNC,S_AXIS_SCALAR_41_DIRECT_IS_ASYNC,S_AXIS_SCALAR_40_DIRECT_IS_ASYNC,S_AXIS_SCALAR_39_DIRECT_IS_ASYNC,S_AXIS_SCALAR_38_DIRECT_IS_ASYNC,S_AXIS_SCALAR_37_DIRECT_IS_ASYNC,S_AXIS_SCALAR_36_DIRECT_IS_ASYNC,S_AXIS_SCALAR_35_DIRECT_IS_ASYNC,S_AXIS_SCALAR_34_DIRECT_IS_ASYNC,S_AXIS_SCALAR_33_DIRECT_IS_ASYNC,S_AXIS_SCALAR_32_DIRECT_IS_ASYNC,S_AXIS_SCALAR_31_DIRECT_IS_ASYNC,S_AXIS_SCALAR_30_DIRECT_IS_ASYNC,S_AXIS_SCALAR_29_DIRECT_IS_ASYNC,S_AXIS_SCALAR_28_DIRECT_IS_ASYNC,S_AXIS_SCALAR_27_DIRECT_IS_ASYNC,S_AXIS_SCALAR_26_DIRECT_IS_ASYNC,S_AXIS_SCALAR_25_DIRECT_IS_ASYNC,S_AXIS_SCALAR_24_DIRECT_IS_ASYNC,S_AXIS_SCALAR_23_DIRECT_IS_ASYNC,S_AXIS_SCALAR_22_DIRECT_IS_ASYNC,S_AXIS_SCALAR_21_DIRECT_IS_ASYNC,S_AXIS_SCALAR_20_DIRECT_IS_ASYNC,S_AXIS_SCALAR_19_DIRECT_IS_ASYNC,S_AXIS_SCALAR_18_DIRECT_IS_ASYNC,S_AXIS_SCALAR_17_DIRECT_IS_ASYNC,S_AXIS_SCALAR_16_DIRECT_IS_ASYNC,S_AXIS_SCALAR_15_DIRECT_IS_ASYNC,S_AXIS_SCALAR_14_DIRECT_IS_ASYNC,S_AXIS_SCALAR_13_DIRECT_IS_ASYNC,S_AXIS_SCALAR_12_DIRECT_IS_ASYNC,S_AXIS_SCALAR_11_DIRECT_IS_ASYNC,S_AXIS_SCALAR_10_DIRECT_IS_ASYNC,S_AXIS_SCALAR_9_DIRECT_IS_ASYNC,S_AXIS_SCALAR_8_DIRECT_IS_ASYNC,S_AXIS_SCALAR_7_DIRECT_IS_ASYNC,S_AXIS_SCALAR_6_DIRECT_IS_ASYNC,S_AXIS_SCALAR_5_DIRECT_IS_ASYNC,S_AXIS_SCALAR_4_DIRECT_IS_ASYNC,S_AXIS_SCALAR_3_DIRECT_IS_ASYNC,S_AXIS_SCALAR_2_DIRECT_IS_ASYNC,S_AXIS_SCALAR_1_DIRECT_IS_ASYNC,S_AXIS_SCALAR_0_DIRECT_IS_ASYNC};
localparam [(C_MAX_INSCALARS*32)-1:0] S_AXIS_SCALAR_DEPTH_ARRAY = {S_AXIS_SCALAR_127_DIRECT_DEPTH,S_AXIS_SCALAR_126_DIRECT_DEPTH,S_AXIS_SCALAR_125_DIRECT_DEPTH,S_AXIS_SCALAR_124_DIRECT_DEPTH,S_AXIS_SCALAR_123_DIRECT_DEPTH,S_AXIS_SCALAR_122_DIRECT_DEPTH,S_AXIS_SCALAR_121_DIRECT_DEPTH,S_AXIS_SCALAR_120_DIRECT_DEPTH,S_AXIS_SCALAR_119_DIRECT_DEPTH,S_AXIS_SCALAR_118_DIRECT_DEPTH,S_AXIS_SCALAR_117_DIRECT_DEPTH,S_AXIS_SCALAR_116_DIRECT_DEPTH,S_AXIS_SCALAR_115_DIRECT_DEPTH,S_AXIS_SCALAR_114_DIRECT_DEPTH,S_AXIS_SCALAR_113_DIRECT_DEPTH,S_AXIS_SCALAR_112_DIRECT_DEPTH,S_AXIS_SCALAR_111_DIRECT_DEPTH,S_AXIS_SCALAR_110_DIRECT_DEPTH,S_AXIS_SCALAR_109_DIRECT_DEPTH,S_AXIS_SCALAR_108_DIRECT_DEPTH,S_AXIS_SCALAR_107_DIRECT_DEPTH,S_AXIS_SCALAR_106_DIRECT_DEPTH,S_AXIS_SCALAR_105_DIRECT_DEPTH,S_AXIS_SCALAR_104_DIRECT_DEPTH,S_AXIS_SCALAR_103_DIRECT_DEPTH,S_AXIS_SCALAR_102_DIRECT_DEPTH,S_AXIS_SCALAR_101_DIRECT_DEPTH,S_AXIS_SCALAR_100_DIRECT_DEPTH,S_AXIS_SCALAR_99_DIRECT_DEPTH,S_AXIS_SCALAR_98_DIRECT_DEPTH,S_AXIS_SCALAR_97_DIRECT_DEPTH,S_AXIS_SCALAR_96_DIRECT_DEPTH,S_AXIS_SCALAR_95_DIRECT_DEPTH,S_AXIS_SCALAR_94_DIRECT_DEPTH,S_AXIS_SCALAR_93_DIRECT_DEPTH,S_AXIS_SCALAR_92_DIRECT_DEPTH,S_AXIS_SCALAR_91_DIRECT_DEPTH,S_AXIS_SCALAR_90_DIRECT_DEPTH,S_AXIS_SCALAR_89_DIRECT_DEPTH,S_AXIS_SCALAR_88_DIRECT_DEPTH,S_AXIS_SCALAR_87_DIRECT_DEPTH,S_AXIS_SCALAR_86_DIRECT_DEPTH,S_AXIS_SCALAR_85_DIRECT_DEPTH,S_AXIS_SCALAR_84_DIRECT_DEPTH,S_AXIS_SCALAR_83_DIRECT_DEPTH,S_AXIS_SCALAR_82_DIRECT_DEPTH,S_AXIS_SCALAR_81_DIRECT_DEPTH,S_AXIS_SCALAR_80_DIRECT_DEPTH,S_AXIS_SCALAR_79_DIRECT_DEPTH,S_AXIS_SCALAR_78_DIRECT_DEPTH,S_AXIS_SCALAR_77_DIRECT_DEPTH,S_AXIS_SCALAR_76_DIRECT_DEPTH,S_AXIS_SCALAR_75_DIRECT_DEPTH,S_AXIS_SCALAR_74_DIRECT_DEPTH,S_AXIS_SCALAR_73_DIRECT_DEPTH,S_AXIS_SCALAR_72_DIRECT_DEPTH,S_AXIS_SCALAR_71_DIRECT_DEPTH,S_AXIS_SCALAR_70_DIRECT_DEPTH,S_AXIS_SCALAR_69_DIRECT_DEPTH,S_AXIS_SCALAR_68_DIRECT_DEPTH,S_AXIS_SCALAR_67_DIRECT_DEPTH,S_AXIS_SCALAR_66_DIRECT_DEPTH,S_AXIS_SCALAR_65_DIRECT_DEPTH,S_AXIS_SCALAR_64_DIRECT_DEPTH,S_AXIS_SCALAR_63_DIRECT_DEPTH,S_AXIS_SCALAR_62_DIRECT_DEPTH,S_AXIS_SCALAR_61_DIRECT_DEPTH,S_AXIS_SCALAR_60_DIRECT_DEPTH,S_AXIS_SCALAR_59_DIRECT_DEPTH,S_AXIS_SCALAR_58_DIRECT_DEPTH,S_AXIS_SCALAR_57_DIRECT_DEPTH,S_AXIS_SCALAR_56_DIRECT_DEPTH,S_AXIS_SCALAR_55_DIRECT_DEPTH,S_AXIS_SCALAR_54_DIRECT_DEPTH,S_AXIS_SCALAR_53_DIRECT_DEPTH,S_AXIS_SCALAR_52_DIRECT_DEPTH,S_AXIS_SCALAR_51_DIRECT_DEPTH,S_AXIS_SCALAR_50_DIRECT_DEPTH,S_AXIS_SCALAR_49_DIRECT_DEPTH,S_AXIS_SCALAR_48_DIRECT_DEPTH,S_AXIS_SCALAR_47_DIRECT_DEPTH,S_AXIS_SCALAR_46_DIRECT_DEPTH,S_AXIS_SCALAR_45_DIRECT_DEPTH,S_AXIS_SCALAR_44_DIRECT_DEPTH,S_AXIS_SCALAR_43_DIRECT_DEPTH,S_AXIS_SCALAR_42_DIRECT_DEPTH,S_AXIS_SCALAR_41_DIRECT_DEPTH,S_AXIS_SCALAR_40_DIRECT_DEPTH,S_AXIS_SCALAR_39_DIRECT_DEPTH,S_AXIS_SCALAR_38_DIRECT_DEPTH,S_AXIS_SCALAR_37_DIRECT_DEPTH,S_AXIS_SCALAR_36_DIRECT_DEPTH,S_AXIS_SCALAR_35_DIRECT_DEPTH,S_AXIS_SCALAR_34_DIRECT_DEPTH,S_AXIS_SCALAR_33_DIRECT_DEPTH,S_AXIS_SCALAR_32_DIRECT_DEPTH,S_AXIS_SCALAR_31_DIRECT_DEPTH,S_AXIS_SCALAR_30_DIRECT_DEPTH,S_AXIS_SCALAR_29_DIRECT_DEPTH,S_AXIS_SCALAR_28_DIRECT_DEPTH,S_AXIS_SCALAR_27_DIRECT_DEPTH,S_AXIS_SCALAR_26_DIRECT_DEPTH,S_AXIS_SCALAR_25_DIRECT_DEPTH,S_AXIS_SCALAR_24_DIRECT_DEPTH,S_AXIS_SCALAR_23_DIRECT_DEPTH,S_AXIS_SCALAR_22_DIRECT_DEPTH,S_AXIS_SCALAR_21_DIRECT_DEPTH,S_AXIS_SCALAR_20_DIRECT_DEPTH,S_AXIS_SCALAR_19_DIRECT_DEPTH,S_AXIS_SCALAR_18_DIRECT_DEPTH,S_AXIS_SCALAR_17_DIRECT_DEPTH,S_AXIS_SCALAR_16_DIRECT_DEPTH,S_AXIS_SCALAR_15_DIRECT_DEPTH,S_AXIS_SCALAR_14_DIRECT_DEPTH,S_AXIS_SCALAR_13_DIRECT_DEPTH,S_AXIS_SCALAR_12_DIRECT_DEPTH,S_AXIS_SCALAR_11_DIRECT_DEPTH,S_AXIS_SCALAR_10_DIRECT_DEPTH,S_AXIS_SCALAR_9_DIRECT_DEPTH,S_AXIS_SCALAR_8_DIRECT_DEPTH,S_AXIS_SCALAR_7_DIRECT_DEPTH,S_AXIS_SCALAR_6_DIRECT_DEPTH,S_AXIS_SCALAR_5_DIRECT_DEPTH,S_AXIS_SCALAR_4_DIRECT_DEPTH,S_AXIS_SCALAR_3_DIRECT_DEPTH,S_AXIS_SCALAR_2_DIRECT_DEPTH,S_AXIS_SCALAR_1_DIRECT_DEPTH,S_AXIS_SCALAR_0_DIRECT_DEPTH};

localparam C_MAX_OUTSCALARS = 128;
localparam [(C_MAX_OUTSCALARS*32)-1:0] M_AXIS_SCALAR_BIT_ARRAY = {C_OUTSCALAR_127_BITS,C_OUTSCALAR_126_BITS,C_OUTSCALAR_125_BITS,C_OUTSCALAR_124_BITS,C_OUTSCALAR_123_BITS,C_OUTSCALAR_122_BITS,C_OUTSCALAR_121_BITS,C_OUTSCALAR_120_BITS,C_OUTSCALAR_119_BITS,C_OUTSCALAR_118_BITS,C_OUTSCALAR_117_BITS,C_OUTSCALAR_116_BITS,C_OUTSCALAR_115_BITS,C_OUTSCALAR_114_BITS,C_OUTSCALAR_113_BITS,C_OUTSCALAR_112_BITS,C_OUTSCALAR_111_BITS,C_OUTSCALAR_110_BITS,C_OUTSCALAR_109_BITS,C_OUTSCALAR_108_BITS,C_OUTSCALAR_107_BITS,C_OUTSCALAR_106_BITS,C_OUTSCALAR_105_BITS,C_OUTSCALAR_104_BITS,C_OUTSCALAR_103_BITS,C_OUTSCALAR_102_BITS,C_OUTSCALAR_101_BITS,C_OUTSCALAR_100_BITS,C_OUTSCALAR_99_BITS,C_OUTSCALAR_98_BITS,C_OUTSCALAR_97_BITS,C_OUTSCALAR_96_BITS,C_OUTSCALAR_95_BITS,C_OUTSCALAR_94_BITS,C_OUTSCALAR_93_BITS,C_OUTSCALAR_92_BITS,C_OUTSCALAR_91_BITS,C_OUTSCALAR_90_BITS,C_OUTSCALAR_89_BITS,C_OUTSCALAR_88_BITS,C_OUTSCALAR_87_BITS,C_OUTSCALAR_86_BITS,C_OUTSCALAR_85_BITS,C_OUTSCALAR_84_BITS,C_OUTSCALAR_83_BITS,C_OUTSCALAR_82_BITS,C_OUTSCALAR_81_BITS,C_OUTSCALAR_80_BITS,C_OUTSCALAR_79_BITS,C_OUTSCALAR_78_BITS,C_OUTSCALAR_77_BITS,C_OUTSCALAR_76_BITS,C_OUTSCALAR_75_BITS,C_OUTSCALAR_74_BITS,C_OUTSCALAR_73_BITS,C_OUTSCALAR_72_BITS,C_OUTSCALAR_71_BITS,C_OUTSCALAR_70_BITS,C_OUTSCALAR_69_BITS,C_OUTSCALAR_68_BITS,C_OUTSCALAR_67_BITS,C_OUTSCALAR_66_BITS,C_OUTSCALAR_65_BITS,C_OUTSCALAR_64_BITS,C_OUTSCALAR_63_BITS,C_OUTSCALAR_62_BITS,C_OUTSCALAR_61_BITS,C_OUTSCALAR_60_BITS,C_OUTSCALAR_59_BITS,C_OUTSCALAR_58_BITS,C_OUTSCALAR_57_BITS,C_OUTSCALAR_56_BITS,C_OUTSCALAR_55_BITS,C_OUTSCALAR_54_BITS,C_OUTSCALAR_53_BITS,C_OUTSCALAR_52_BITS,C_OUTSCALAR_51_BITS,C_OUTSCALAR_50_BITS,C_OUTSCALAR_49_BITS,C_OUTSCALAR_48_BITS,C_OUTSCALAR_47_BITS,C_OUTSCALAR_46_BITS,C_OUTSCALAR_45_BITS,C_OUTSCALAR_44_BITS,C_OUTSCALAR_43_BITS,C_OUTSCALAR_42_BITS,C_OUTSCALAR_41_BITS,C_OUTSCALAR_40_BITS,C_OUTSCALAR_39_BITS,C_OUTSCALAR_38_BITS,C_OUTSCALAR_37_BITS,C_OUTSCALAR_36_BITS,C_OUTSCALAR_35_BITS,C_OUTSCALAR_34_BITS,C_OUTSCALAR_33_BITS,C_OUTSCALAR_32_BITS,C_OUTSCALAR_31_BITS,C_OUTSCALAR_30_BITS,C_OUTSCALAR_29_BITS,C_OUTSCALAR_28_BITS,C_OUTSCALAR_27_BITS,C_OUTSCALAR_26_BITS,C_OUTSCALAR_25_BITS,C_OUTSCALAR_24_BITS,C_OUTSCALAR_23_BITS,C_OUTSCALAR_22_BITS,C_OUTSCALAR_21_BITS,C_OUTSCALAR_20_BITS,C_OUTSCALAR_19_BITS,C_OUTSCALAR_18_BITS,C_OUTSCALAR_17_BITS,C_OUTSCALAR_16_BITS,C_OUTSCALAR_15_BITS,C_OUTSCALAR_14_BITS,C_OUTSCALAR_13_BITS,C_OUTSCALAR_12_BITS,C_OUTSCALAR_11_BITS,C_OUTSCALAR_10_BITS,C_OUTSCALAR_9_BITS,C_OUTSCALAR_8_BITS,C_OUTSCALAR_7_BITS,C_OUTSCALAR_6_BITS,C_OUTSCALAR_5_BITS,C_OUTSCALAR_4_BITS,C_OUTSCALAR_3_BITS,C_OUTSCALAR_2_BITS,C_OUTSCALAR_1_BITS,C_OUTSCALAR_0_BITS};
localparam [(C_MAX_OUTSCALARS*32)-1:0] M_AXIS_SCALAR_IS_DIRECT_ARRAY = {M_AXIS_SCALAR_127_IS_DIRECT,M_AXIS_SCALAR_126_IS_DIRECT,M_AXIS_SCALAR_125_IS_DIRECT,M_AXIS_SCALAR_124_IS_DIRECT,M_AXIS_SCALAR_123_IS_DIRECT,M_AXIS_SCALAR_122_IS_DIRECT,M_AXIS_SCALAR_121_IS_DIRECT,M_AXIS_SCALAR_120_IS_DIRECT,M_AXIS_SCALAR_119_IS_DIRECT,M_AXIS_SCALAR_118_IS_DIRECT,M_AXIS_SCALAR_117_IS_DIRECT,M_AXIS_SCALAR_116_IS_DIRECT,M_AXIS_SCALAR_115_IS_DIRECT,M_AXIS_SCALAR_114_IS_DIRECT,M_AXIS_SCALAR_113_IS_DIRECT,M_AXIS_SCALAR_112_IS_DIRECT,M_AXIS_SCALAR_111_IS_DIRECT,M_AXIS_SCALAR_110_IS_DIRECT,M_AXIS_SCALAR_109_IS_DIRECT,M_AXIS_SCALAR_108_IS_DIRECT,M_AXIS_SCALAR_107_IS_DIRECT,M_AXIS_SCALAR_106_IS_DIRECT,M_AXIS_SCALAR_105_IS_DIRECT,M_AXIS_SCALAR_104_IS_DIRECT,M_AXIS_SCALAR_103_IS_DIRECT,M_AXIS_SCALAR_102_IS_DIRECT,M_AXIS_SCALAR_101_IS_DIRECT,M_AXIS_SCALAR_100_IS_DIRECT,M_AXIS_SCALAR_99_IS_DIRECT,M_AXIS_SCALAR_98_IS_DIRECT,M_AXIS_SCALAR_97_IS_DIRECT,M_AXIS_SCALAR_96_IS_DIRECT,M_AXIS_SCALAR_95_IS_DIRECT,M_AXIS_SCALAR_94_IS_DIRECT,M_AXIS_SCALAR_93_IS_DIRECT,M_AXIS_SCALAR_92_IS_DIRECT,M_AXIS_SCALAR_91_IS_DIRECT,M_AXIS_SCALAR_90_IS_DIRECT,M_AXIS_SCALAR_89_IS_DIRECT,M_AXIS_SCALAR_88_IS_DIRECT,M_AXIS_SCALAR_87_IS_DIRECT,M_AXIS_SCALAR_86_IS_DIRECT,M_AXIS_SCALAR_85_IS_DIRECT,M_AXIS_SCALAR_84_IS_DIRECT,M_AXIS_SCALAR_83_IS_DIRECT,M_AXIS_SCALAR_82_IS_DIRECT,M_AXIS_SCALAR_81_IS_DIRECT,M_AXIS_SCALAR_80_IS_DIRECT,M_AXIS_SCALAR_79_IS_DIRECT,M_AXIS_SCALAR_78_IS_DIRECT,M_AXIS_SCALAR_77_IS_DIRECT,M_AXIS_SCALAR_76_IS_DIRECT,M_AXIS_SCALAR_75_IS_DIRECT,M_AXIS_SCALAR_74_IS_DIRECT,M_AXIS_SCALAR_73_IS_DIRECT,M_AXIS_SCALAR_72_IS_DIRECT,M_AXIS_SCALAR_71_IS_DIRECT,M_AXIS_SCALAR_70_IS_DIRECT,M_AXIS_SCALAR_69_IS_DIRECT,M_AXIS_SCALAR_68_IS_DIRECT,M_AXIS_SCALAR_67_IS_DIRECT,M_AXIS_SCALAR_66_IS_DIRECT,M_AXIS_SCALAR_65_IS_DIRECT,M_AXIS_SCALAR_64_IS_DIRECT,M_AXIS_SCALAR_63_IS_DIRECT,M_AXIS_SCALAR_62_IS_DIRECT,M_AXIS_SCALAR_61_IS_DIRECT,M_AXIS_SCALAR_60_IS_DIRECT,M_AXIS_SCALAR_59_IS_DIRECT,M_AXIS_SCALAR_58_IS_DIRECT,M_AXIS_SCALAR_57_IS_DIRECT,M_AXIS_SCALAR_56_IS_DIRECT,M_AXIS_SCALAR_55_IS_DIRECT,M_AXIS_SCALAR_54_IS_DIRECT,M_AXIS_SCALAR_53_IS_DIRECT,M_AXIS_SCALAR_52_IS_DIRECT,M_AXIS_SCALAR_51_IS_DIRECT,M_AXIS_SCALAR_50_IS_DIRECT,M_AXIS_SCALAR_49_IS_DIRECT,M_AXIS_SCALAR_48_IS_DIRECT,M_AXIS_SCALAR_47_IS_DIRECT,M_AXIS_SCALAR_46_IS_DIRECT,M_AXIS_SCALAR_45_IS_DIRECT,M_AXIS_SCALAR_44_IS_DIRECT,M_AXIS_SCALAR_43_IS_DIRECT,M_AXIS_SCALAR_42_IS_DIRECT,M_AXIS_SCALAR_41_IS_DIRECT,M_AXIS_SCALAR_40_IS_DIRECT,M_AXIS_SCALAR_39_IS_DIRECT,M_AXIS_SCALAR_38_IS_DIRECT,M_AXIS_SCALAR_37_IS_DIRECT,M_AXIS_SCALAR_36_IS_DIRECT,M_AXIS_SCALAR_35_IS_DIRECT,M_AXIS_SCALAR_34_IS_DIRECT,M_AXIS_SCALAR_33_IS_DIRECT,M_AXIS_SCALAR_32_IS_DIRECT,M_AXIS_SCALAR_31_IS_DIRECT,M_AXIS_SCALAR_30_IS_DIRECT,M_AXIS_SCALAR_29_IS_DIRECT,M_AXIS_SCALAR_28_IS_DIRECT,M_AXIS_SCALAR_27_IS_DIRECT,M_AXIS_SCALAR_26_IS_DIRECT,M_AXIS_SCALAR_25_IS_DIRECT,M_AXIS_SCALAR_24_IS_DIRECT,M_AXIS_SCALAR_23_IS_DIRECT,M_AXIS_SCALAR_22_IS_DIRECT,M_AXIS_SCALAR_21_IS_DIRECT,M_AXIS_SCALAR_20_IS_DIRECT,M_AXIS_SCALAR_19_IS_DIRECT,M_AXIS_SCALAR_18_IS_DIRECT,M_AXIS_SCALAR_17_IS_DIRECT,M_AXIS_SCALAR_16_IS_DIRECT,M_AXIS_SCALAR_15_IS_DIRECT,M_AXIS_SCALAR_14_IS_DIRECT,M_AXIS_SCALAR_13_IS_DIRECT,M_AXIS_SCALAR_12_IS_DIRECT,M_AXIS_SCALAR_11_IS_DIRECT,M_AXIS_SCALAR_10_IS_DIRECT,M_AXIS_SCALAR_9_IS_DIRECT,M_AXIS_SCALAR_8_IS_DIRECT,M_AXIS_SCALAR_7_IS_DIRECT,M_AXIS_SCALAR_6_IS_DIRECT,M_AXIS_SCALAR_5_IS_DIRECT,M_AXIS_SCALAR_4_IS_DIRECT,M_AXIS_SCALAR_3_IS_DIRECT,M_AXIS_SCALAR_2_IS_DIRECT,M_AXIS_SCALAR_1_IS_DIRECT,M_AXIS_SCALAR_0_IS_DIRECT};
localparam [(C_MAX_OUTSCALARS*32)-1:0] M_AXIS_SCALAR_DMWIDTH_ARRAY = {M_AXIS_SCALAR_127_DIRECT_DMWIDTH,M_AXIS_SCALAR_126_DIRECT_DMWIDTH,M_AXIS_SCALAR_125_DIRECT_DMWIDTH,M_AXIS_SCALAR_124_DIRECT_DMWIDTH,M_AXIS_SCALAR_123_DIRECT_DMWIDTH,M_AXIS_SCALAR_122_DIRECT_DMWIDTH,M_AXIS_SCALAR_121_DIRECT_DMWIDTH,M_AXIS_SCALAR_120_DIRECT_DMWIDTH,M_AXIS_SCALAR_119_DIRECT_DMWIDTH,M_AXIS_SCALAR_118_DIRECT_DMWIDTH,M_AXIS_SCALAR_117_DIRECT_DMWIDTH,M_AXIS_SCALAR_116_DIRECT_DMWIDTH,M_AXIS_SCALAR_115_DIRECT_DMWIDTH,M_AXIS_SCALAR_114_DIRECT_DMWIDTH,M_AXIS_SCALAR_113_DIRECT_DMWIDTH,M_AXIS_SCALAR_112_DIRECT_DMWIDTH,M_AXIS_SCALAR_111_DIRECT_DMWIDTH,M_AXIS_SCALAR_110_DIRECT_DMWIDTH,M_AXIS_SCALAR_109_DIRECT_DMWIDTH,M_AXIS_SCALAR_108_DIRECT_DMWIDTH,M_AXIS_SCALAR_107_DIRECT_DMWIDTH,M_AXIS_SCALAR_106_DIRECT_DMWIDTH,M_AXIS_SCALAR_105_DIRECT_DMWIDTH,M_AXIS_SCALAR_104_DIRECT_DMWIDTH,M_AXIS_SCALAR_103_DIRECT_DMWIDTH,M_AXIS_SCALAR_102_DIRECT_DMWIDTH,M_AXIS_SCALAR_101_DIRECT_DMWIDTH,M_AXIS_SCALAR_100_DIRECT_DMWIDTH,M_AXIS_SCALAR_99_DIRECT_DMWIDTH,M_AXIS_SCALAR_98_DIRECT_DMWIDTH,M_AXIS_SCALAR_97_DIRECT_DMWIDTH,M_AXIS_SCALAR_96_DIRECT_DMWIDTH,M_AXIS_SCALAR_95_DIRECT_DMWIDTH,M_AXIS_SCALAR_94_DIRECT_DMWIDTH,M_AXIS_SCALAR_93_DIRECT_DMWIDTH,M_AXIS_SCALAR_92_DIRECT_DMWIDTH,M_AXIS_SCALAR_91_DIRECT_DMWIDTH,M_AXIS_SCALAR_90_DIRECT_DMWIDTH,M_AXIS_SCALAR_89_DIRECT_DMWIDTH,M_AXIS_SCALAR_88_DIRECT_DMWIDTH,M_AXIS_SCALAR_87_DIRECT_DMWIDTH,M_AXIS_SCALAR_86_DIRECT_DMWIDTH,M_AXIS_SCALAR_85_DIRECT_DMWIDTH,M_AXIS_SCALAR_84_DIRECT_DMWIDTH,M_AXIS_SCALAR_83_DIRECT_DMWIDTH,M_AXIS_SCALAR_82_DIRECT_DMWIDTH,M_AXIS_SCALAR_81_DIRECT_DMWIDTH,M_AXIS_SCALAR_80_DIRECT_DMWIDTH,M_AXIS_SCALAR_79_DIRECT_DMWIDTH,M_AXIS_SCALAR_78_DIRECT_DMWIDTH,M_AXIS_SCALAR_77_DIRECT_DMWIDTH,M_AXIS_SCALAR_76_DIRECT_DMWIDTH,M_AXIS_SCALAR_75_DIRECT_DMWIDTH,M_AXIS_SCALAR_74_DIRECT_DMWIDTH,M_AXIS_SCALAR_73_DIRECT_DMWIDTH,M_AXIS_SCALAR_72_DIRECT_DMWIDTH,M_AXIS_SCALAR_71_DIRECT_DMWIDTH,M_AXIS_SCALAR_70_DIRECT_DMWIDTH,M_AXIS_SCALAR_69_DIRECT_DMWIDTH,M_AXIS_SCALAR_68_DIRECT_DMWIDTH,M_AXIS_SCALAR_67_DIRECT_DMWIDTH,M_AXIS_SCALAR_66_DIRECT_DMWIDTH,M_AXIS_SCALAR_65_DIRECT_DMWIDTH,M_AXIS_SCALAR_64_DIRECT_DMWIDTH,M_AXIS_SCALAR_63_DIRECT_DMWIDTH,M_AXIS_SCALAR_62_DIRECT_DMWIDTH,M_AXIS_SCALAR_61_DIRECT_DMWIDTH,M_AXIS_SCALAR_60_DIRECT_DMWIDTH,M_AXIS_SCALAR_59_DIRECT_DMWIDTH,M_AXIS_SCALAR_58_DIRECT_DMWIDTH,M_AXIS_SCALAR_57_DIRECT_DMWIDTH,M_AXIS_SCALAR_56_DIRECT_DMWIDTH,M_AXIS_SCALAR_55_DIRECT_DMWIDTH,M_AXIS_SCALAR_54_DIRECT_DMWIDTH,M_AXIS_SCALAR_53_DIRECT_DMWIDTH,M_AXIS_SCALAR_52_DIRECT_DMWIDTH,M_AXIS_SCALAR_51_DIRECT_DMWIDTH,M_AXIS_SCALAR_50_DIRECT_DMWIDTH,M_AXIS_SCALAR_49_DIRECT_DMWIDTH,M_AXIS_SCALAR_48_DIRECT_DMWIDTH,M_AXIS_SCALAR_47_DIRECT_DMWIDTH,M_AXIS_SCALAR_46_DIRECT_DMWIDTH,M_AXIS_SCALAR_45_DIRECT_DMWIDTH,M_AXIS_SCALAR_44_DIRECT_DMWIDTH,M_AXIS_SCALAR_43_DIRECT_DMWIDTH,M_AXIS_SCALAR_42_DIRECT_DMWIDTH,M_AXIS_SCALAR_41_DIRECT_DMWIDTH,M_AXIS_SCALAR_40_DIRECT_DMWIDTH,M_AXIS_SCALAR_39_DIRECT_DMWIDTH,M_AXIS_SCALAR_38_DIRECT_DMWIDTH,M_AXIS_SCALAR_37_DIRECT_DMWIDTH,M_AXIS_SCALAR_36_DIRECT_DMWIDTH,M_AXIS_SCALAR_35_DIRECT_DMWIDTH,M_AXIS_SCALAR_34_DIRECT_DMWIDTH,M_AXIS_SCALAR_33_DIRECT_DMWIDTH,M_AXIS_SCALAR_32_DIRECT_DMWIDTH,M_AXIS_SCALAR_31_DIRECT_DMWIDTH,M_AXIS_SCALAR_30_DIRECT_DMWIDTH,M_AXIS_SCALAR_29_DIRECT_DMWIDTH,M_AXIS_SCALAR_28_DIRECT_DMWIDTH,M_AXIS_SCALAR_27_DIRECT_DMWIDTH,M_AXIS_SCALAR_26_DIRECT_DMWIDTH,M_AXIS_SCALAR_25_DIRECT_DMWIDTH,M_AXIS_SCALAR_24_DIRECT_DMWIDTH,M_AXIS_SCALAR_23_DIRECT_DMWIDTH,M_AXIS_SCALAR_22_DIRECT_DMWIDTH,M_AXIS_SCALAR_21_DIRECT_DMWIDTH,M_AXIS_SCALAR_20_DIRECT_DMWIDTH,M_AXIS_SCALAR_19_DIRECT_DMWIDTH,M_AXIS_SCALAR_18_DIRECT_DMWIDTH,M_AXIS_SCALAR_17_DIRECT_DMWIDTH,M_AXIS_SCALAR_16_DIRECT_DMWIDTH,M_AXIS_SCALAR_15_DIRECT_DMWIDTH,M_AXIS_SCALAR_14_DIRECT_DMWIDTH,M_AXIS_SCALAR_13_DIRECT_DMWIDTH,M_AXIS_SCALAR_12_DIRECT_DMWIDTH,M_AXIS_SCALAR_11_DIRECT_DMWIDTH,M_AXIS_SCALAR_10_DIRECT_DMWIDTH,M_AXIS_SCALAR_9_DIRECT_DMWIDTH,M_AXIS_SCALAR_8_DIRECT_DMWIDTH,M_AXIS_SCALAR_7_DIRECT_DMWIDTH,M_AXIS_SCALAR_6_DIRECT_DMWIDTH,M_AXIS_SCALAR_5_DIRECT_DMWIDTH,M_AXIS_SCALAR_4_DIRECT_DMWIDTH,M_AXIS_SCALAR_3_DIRECT_DMWIDTH,M_AXIS_SCALAR_2_DIRECT_DMWIDTH,M_AXIS_SCALAR_1_DIRECT_DMWIDTH,M_AXIS_SCALAR_0_DIRECT_DMWIDTH};
localparam [(C_MAX_OUTSCALARS*32)-1:0] M_AXIS_SCALAR_IS_ASYNC_ARRAY = {M_AXIS_SCALAR_127_DIRECT_IS_ASYNC,M_AXIS_SCALAR_126_DIRECT_IS_ASYNC,M_AXIS_SCALAR_125_DIRECT_IS_ASYNC,M_AXIS_SCALAR_124_DIRECT_IS_ASYNC,M_AXIS_SCALAR_123_DIRECT_IS_ASYNC,M_AXIS_SCALAR_122_DIRECT_IS_ASYNC,M_AXIS_SCALAR_121_DIRECT_IS_ASYNC,M_AXIS_SCALAR_120_DIRECT_IS_ASYNC,M_AXIS_SCALAR_119_DIRECT_IS_ASYNC,M_AXIS_SCALAR_118_DIRECT_IS_ASYNC,M_AXIS_SCALAR_117_DIRECT_IS_ASYNC,M_AXIS_SCALAR_116_DIRECT_IS_ASYNC,M_AXIS_SCALAR_115_DIRECT_IS_ASYNC,M_AXIS_SCALAR_114_DIRECT_IS_ASYNC,M_AXIS_SCALAR_113_DIRECT_IS_ASYNC,M_AXIS_SCALAR_112_DIRECT_IS_ASYNC,M_AXIS_SCALAR_111_DIRECT_IS_ASYNC,M_AXIS_SCALAR_110_DIRECT_IS_ASYNC,M_AXIS_SCALAR_109_DIRECT_IS_ASYNC,M_AXIS_SCALAR_108_DIRECT_IS_ASYNC,M_AXIS_SCALAR_107_DIRECT_IS_ASYNC,M_AXIS_SCALAR_106_DIRECT_IS_ASYNC,M_AXIS_SCALAR_105_DIRECT_IS_ASYNC,M_AXIS_SCALAR_104_DIRECT_IS_ASYNC,M_AXIS_SCALAR_103_DIRECT_IS_ASYNC,M_AXIS_SCALAR_102_DIRECT_IS_ASYNC,M_AXIS_SCALAR_101_DIRECT_IS_ASYNC,M_AXIS_SCALAR_100_DIRECT_IS_ASYNC,M_AXIS_SCALAR_99_DIRECT_IS_ASYNC,M_AXIS_SCALAR_98_DIRECT_IS_ASYNC,M_AXIS_SCALAR_97_DIRECT_IS_ASYNC,M_AXIS_SCALAR_96_DIRECT_IS_ASYNC,M_AXIS_SCALAR_95_DIRECT_IS_ASYNC,M_AXIS_SCALAR_94_DIRECT_IS_ASYNC,M_AXIS_SCALAR_93_DIRECT_IS_ASYNC,M_AXIS_SCALAR_92_DIRECT_IS_ASYNC,M_AXIS_SCALAR_91_DIRECT_IS_ASYNC,M_AXIS_SCALAR_90_DIRECT_IS_ASYNC,M_AXIS_SCALAR_89_DIRECT_IS_ASYNC,M_AXIS_SCALAR_88_DIRECT_IS_ASYNC,M_AXIS_SCALAR_87_DIRECT_IS_ASYNC,M_AXIS_SCALAR_86_DIRECT_IS_ASYNC,M_AXIS_SCALAR_85_DIRECT_IS_ASYNC,M_AXIS_SCALAR_84_DIRECT_IS_ASYNC,M_AXIS_SCALAR_83_DIRECT_IS_ASYNC,M_AXIS_SCALAR_82_DIRECT_IS_ASYNC,M_AXIS_SCALAR_81_DIRECT_IS_ASYNC,M_AXIS_SCALAR_80_DIRECT_IS_ASYNC,M_AXIS_SCALAR_79_DIRECT_IS_ASYNC,M_AXIS_SCALAR_78_DIRECT_IS_ASYNC,M_AXIS_SCALAR_77_DIRECT_IS_ASYNC,M_AXIS_SCALAR_76_DIRECT_IS_ASYNC,M_AXIS_SCALAR_75_DIRECT_IS_ASYNC,M_AXIS_SCALAR_74_DIRECT_IS_ASYNC,M_AXIS_SCALAR_73_DIRECT_IS_ASYNC,M_AXIS_SCALAR_72_DIRECT_IS_ASYNC,M_AXIS_SCALAR_71_DIRECT_IS_ASYNC,M_AXIS_SCALAR_70_DIRECT_IS_ASYNC,M_AXIS_SCALAR_69_DIRECT_IS_ASYNC,M_AXIS_SCALAR_68_DIRECT_IS_ASYNC,M_AXIS_SCALAR_67_DIRECT_IS_ASYNC,M_AXIS_SCALAR_66_DIRECT_IS_ASYNC,M_AXIS_SCALAR_65_DIRECT_IS_ASYNC,M_AXIS_SCALAR_64_DIRECT_IS_ASYNC,M_AXIS_SCALAR_63_DIRECT_IS_ASYNC,M_AXIS_SCALAR_62_DIRECT_IS_ASYNC,M_AXIS_SCALAR_61_DIRECT_IS_ASYNC,M_AXIS_SCALAR_60_DIRECT_IS_ASYNC,M_AXIS_SCALAR_59_DIRECT_IS_ASYNC,M_AXIS_SCALAR_58_DIRECT_IS_ASYNC,M_AXIS_SCALAR_57_DIRECT_IS_ASYNC,M_AXIS_SCALAR_56_DIRECT_IS_ASYNC,M_AXIS_SCALAR_55_DIRECT_IS_ASYNC,M_AXIS_SCALAR_54_DIRECT_IS_ASYNC,M_AXIS_SCALAR_53_DIRECT_IS_ASYNC,M_AXIS_SCALAR_52_DIRECT_IS_ASYNC,M_AXIS_SCALAR_51_DIRECT_IS_ASYNC,M_AXIS_SCALAR_50_DIRECT_IS_ASYNC,M_AXIS_SCALAR_49_DIRECT_IS_ASYNC,M_AXIS_SCALAR_48_DIRECT_IS_ASYNC,M_AXIS_SCALAR_47_DIRECT_IS_ASYNC,M_AXIS_SCALAR_46_DIRECT_IS_ASYNC,M_AXIS_SCALAR_45_DIRECT_IS_ASYNC,M_AXIS_SCALAR_44_DIRECT_IS_ASYNC,M_AXIS_SCALAR_43_DIRECT_IS_ASYNC,M_AXIS_SCALAR_42_DIRECT_IS_ASYNC,M_AXIS_SCALAR_41_DIRECT_IS_ASYNC,M_AXIS_SCALAR_40_DIRECT_IS_ASYNC,M_AXIS_SCALAR_39_DIRECT_IS_ASYNC,M_AXIS_SCALAR_38_DIRECT_IS_ASYNC,M_AXIS_SCALAR_37_DIRECT_IS_ASYNC,M_AXIS_SCALAR_36_DIRECT_IS_ASYNC,M_AXIS_SCALAR_35_DIRECT_IS_ASYNC,M_AXIS_SCALAR_34_DIRECT_IS_ASYNC,M_AXIS_SCALAR_33_DIRECT_IS_ASYNC,M_AXIS_SCALAR_32_DIRECT_IS_ASYNC,M_AXIS_SCALAR_31_DIRECT_IS_ASYNC,M_AXIS_SCALAR_30_DIRECT_IS_ASYNC,M_AXIS_SCALAR_29_DIRECT_IS_ASYNC,M_AXIS_SCALAR_28_DIRECT_IS_ASYNC,M_AXIS_SCALAR_27_DIRECT_IS_ASYNC,M_AXIS_SCALAR_26_DIRECT_IS_ASYNC,M_AXIS_SCALAR_25_DIRECT_IS_ASYNC,M_AXIS_SCALAR_24_DIRECT_IS_ASYNC,M_AXIS_SCALAR_23_DIRECT_IS_ASYNC,M_AXIS_SCALAR_22_DIRECT_IS_ASYNC,M_AXIS_SCALAR_21_DIRECT_IS_ASYNC,M_AXIS_SCALAR_20_DIRECT_IS_ASYNC,M_AXIS_SCALAR_19_DIRECT_IS_ASYNC,M_AXIS_SCALAR_18_DIRECT_IS_ASYNC,M_AXIS_SCALAR_17_DIRECT_IS_ASYNC,M_AXIS_SCALAR_16_DIRECT_IS_ASYNC,M_AXIS_SCALAR_15_DIRECT_IS_ASYNC,M_AXIS_SCALAR_14_DIRECT_IS_ASYNC,M_AXIS_SCALAR_13_DIRECT_IS_ASYNC,M_AXIS_SCALAR_12_DIRECT_IS_ASYNC,M_AXIS_SCALAR_11_DIRECT_IS_ASYNC,M_AXIS_SCALAR_10_DIRECT_IS_ASYNC,M_AXIS_SCALAR_9_DIRECT_IS_ASYNC,M_AXIS_SCALAR_8_DIRECT_IS_ASYNC,M_AXIS_SCALAR_7_DIRECT_IS_ASYNC,M_AXIS_SCALAR_6_DIRECT_IS_ASYNC,M_AXIS_SCALAR_5_DIRECT_IS_ASYNC,M_AXIS_SCALAR_4_DIRECT_IS_ASYNC,M_AXIS_SCALAR_3_DIRECT_IS_ASYNC,M_AXIS_SCALAR_2_DIRECT_IS_ASYNC,M_AXIS_SCALAR_1_DIRECT_IS_ASYNC,M_AXIS_SCALAR_0_DIRECT_IS_ASYNC};
localparam [(C_MAX_OUTSCALARS*32)-1:0] M_AXIS_SCALAR_DEPTH_ARRAY = {M_AXIS_SCALAR_127_DIRECT_DEPTH,M_AXIS_SCALAR_126_DIRECT_DEPTH,M_AXIS_SCALAR_125_DIRECT_DEPTH,M_AXIS_SCALAR_124_DIRECT_DEPTH,M_AXIS_SCALAR_123_DIRECT_DEPTH,M_AXIS_SCALAR_122_DIRECT_DEPTH,M_AXIS_SCALAR_121_DIRECT_DEPTH,M_AXIS_SCALAR_120_DIRECT_DEPTH,M_AXIS_SCALAR_119_DIRECT_DEPTH,M_AXIS_SCALAR_118_DIRECT_DEPTH,M_AXIS_SCALAR_117_DIRECT_DEPTH,M_AXIS_SCALAR_116_DIRECT_DEPTH,M_AXIS_SCALAR_115_DIRECT_DEPTH,M_AXIS_SCALAR_114_DIRECT_DEPTH,M_AXIS_SCALAR_113_DIRECT_DEPTH,M_AXIS_SCALAR_112_DIRECT_DEPTH,M_AXIS_SCALAR_111_DIRECT_DEPTH,M_AXIS_SCALAR_110_DIRECT_DEPTH,M_AXIS_SCALAR_109_DIRECT_DEPTH,M_AXIS_SCALAR_108_DIRECT_DEPTH,M_AXIS_SCALAR_107_DIRECT_DEPTH,M_AXIS_SCALAR_106_DIRECT_DEPTH,M_AXIS_SCALAR_105_DIRECT_DEPTH,M_AXIS_SCALAR_104_DIRECT_DEPTH,M_AXIS_SCALAR_103_DIRECT_DEPTH,M_AXIS_SCALAR_102_DIRECT_DEPTH,M_AXIS_SCALAR_101_DIRECT_DEPTH,M_AXIS_SCALAR_100_DIRECT_DEPTH,M_AXIS_SCALAR_99_DIRECT_DEPTH,M_AXIS_SCALAR_98_DIRECT_DEPTH,M_AXIS_SCALAR_97_DIRECT_DEPTH,M_AXIS_SCALAR_96_DIRECT_DEPTH,M_AXIS_SCALAR_95_DIRECT_DEPTH,M_AXIS_SCALAR_94_DIRECT_DEPTH,M_AXIS_SCALAR_93_DIRECT_DEPTH,M_AXIS_SCALAR_92_DIRECT_DEPTH,M_AXIS_SCALAR_91_DIRECT_DEPTH,M_AXIS_SCALAR_90_DIRECT_DEPTH,M_AXIS_SCALAR_89_DIRECT_DEPTH,M_AXIS_SCALAR_88_DIRECT_DEPTH,M_AXIS_SCALAR_87_DIRECT_DEPTH,M_AXIS_SCALAR_86_DIRECT_DEPTH,M_AXIS_SCALAR_85_DIRECT_DEPTH,M_AXIS_SCALAR_84_DIRECT_DEPTH,M_AXIS_SCALAR_83_DIRECT_DEPTH,M_AXIS_SCALAR_82_DIRECT_DEPTH,M_AXIS_SCALAR_81_DIRECT_DEPTH,M_AXIS_SCALAR_80_DIRECT_DEPTH,M_AXIS_SCALAR_79_DIRECT_DEPTH,M_AXIS_SCALAR_78_DIRECT_DEPTH,M_AXIS_SCALAR_77_DIRECT_DEPTH,M_AXIS_SCALAR_76_DIRECT_DEPTH,M_AXIS_SCALAR_75_DIRECT_DEPTH,M_AXIS_SCALAR_74_DIRECT_DEPTH,M_AXIS_SCALAR_73_DIRECT_DEPTH,M_AXIS_SCALAR_72_DIRECT_DEPTH,M_AXIS_SCALAR_71_DIRECT_DEPTH,M_AXIS_SCALAR_70_DIRECT_DEPTH,M_AXIS_SCALAR_69_DIRECT_DEPTH,M_AXIS_SCALAR_68_DIRECT_DEPTH,M_AXIS_SCALAR_67_DIRECT_DEPTH,M_AXIS_SCALAR_66_DIRECT_DEPTH,M_AXIS_SCALAR_65_DIRECT_DEPTH,M_AXIS_SCALAR_64_DIRECT_DEPTH,M_AXIS_SCALAR_63_DIRECT_DEPTH,M_AXIS_SCALAR_62_DIRECT_DEPTH,M_AXIS_SCALAR_61_DIRECT_DEPTH,M_AXIS_SCALAR_60_DIRECT_DEPTH,M_AXIS_SCALAR_59_DIRECT_DEPTH,M_AXIS_SCALAR_58_DIRECT_DEPTH,M_AXIS_SCALAR_57_DIRECT_DEPTH,M_AXIS_SCALAR_56_DIRECT_DEPTH,M_AXIS_SCALAR_55_DIRECT_DEPTH,M_AXIS_SCALAR_54_DIRECT_DEPTH,M_AXIS_SCALAR_53_DIRECT_DEPTH,M_AXIS_SCALAR_52_DIRECT_DEPTH,M_AXIS_SCALAR_51_DIRECT_DEPTH,M_AXIS_SCALAR_50_DIRECT_DEPTH,M_AXIS_SCALAR_49_DIRECT_DEPTH,M_AXIS_SCALAR_48_DIRECT_DEPTH,M_AXIS_SCALAR_47_DIRECT_DEPTH,M_AXIS_SCALAR_46_DIRECT_DEPTH,M_AXIS_SCALAR_45_DIRECT_DEPTH,M_AXIS_SCALAR_44_DIRECT_DEPTH,M_AXIS_SCALAR_43_DIRECT_DEPTH,M_AXIS_SCALAR_42_DIRECT_DEPTH,M_AXIS_SCALAR_41_DIRECT_DEPTH,M_AXIS_SCALAR_40_DIRECT_DEPTH,M_AXIS_SCALAR_39_DIRECT_DEPTH,M_AXIS_SCALAR_38_DIRECT_DEPTH,M_AXIS_SCALAR_37_DIRECT_DEPTH,M_AXIS_SCALAR_36_DIRECT_DEPTH,M_AXIS_SCALAR_35_DIRECT_DEPTH,M_AXIS_SCALAR_34_DIRECT_DEPTH,M_AXIS_SCALAR_33_DIRECT_DEPTH,M_AXIS_SCALAR_32_DIRECT_DEPTH,M_AXIS_SCALAR_31_DIRECT_DEPTH,M_AXIS_SCALAR_30_DIRECT_DEPTH,M_AXIS_SCALAR_29_DIRECT_DEPTH,M_AXIS_SCALAR_28_DIRECT_DEPTH,M_AXIS_SCALAR_27_DIRECT_DEPTH,M_AXIS_SCALAR_26_DIRECT_DEPTH,M_AXIS_SCALAR_25_DIRECT_DEPTH,M_AXIS_SCALAR_24_DIRECT_DEPTH,M_AXIS_SCALAR_23_DIRECT_DEPTH,M_AXIS_SCALAR_22_DIRECT_DEPTH,M_AXIS_SCALAR_21_DIRECT_DEPTH,M_AXIS_SCALAR_20_DIRECT_DEPTH,M_AXIS_SCALAR_19_DIRECT_DEPTH,M_AXIS_SCALAR_18_DIRECT_DEPTH,M_AXIS_SCALAR_17_DIRECT_DEPTH,M_AXIS_SCALAR_16_DIRECT_DEPTH,M_AXIS_SCALAR_15_DIRECT_DEPTH,M_AXIS_SCALAR_14_DIRECT_DEPTH,M_AXIS_SCALAR_13_DIRECT_DEPTH,M_AXIS_SCALAR_12_DIRECT_DEPTH,M_AXIS_SCALAR_11_DIRECT_DEPTH,M_AXIS_SCALAR_10_DIRECT_DEPTH,M_AXIS_SCALAR_9_DIRECT_DEPTH,M_AXIS_SCALAR_8_DIRECT_DEPTH,M_AXIS_SCALAR_7_DIRECT_DEPTH,M_AXIS_SCALAR_6_DIRECT_DEPTH,M_AXIS_SCALAR_5_DIRECT_DEPTH,M_AXIS_SCALAR_4_DIRECT_DEPTH,M_AXIS_SCALAR_3_DIRECT_DEPTH,M_AXIS_SCALAR_2_DIRECT_DEPTH,M_AXIS_SCALAR_1_DIRECT_DEPTH,M_AXIS_SCALAR_0_DIRECT_DEPTH};

localparam C_MAX_SCALAR_BITS = 1024;

reg [31:0] scalar_out_reg;  //output data register for control interface

wire [C_NUM_INSCALARS-1:0] inscalar_we;                              //write enables for input scalars
wire [C_MAX_SCALAR_BITS-1:0] inscalar_fifo [0:C_NUM_INSCALARS-1];    //input scalar data values from register to fifo
wire [C_MAX_SCALAR_BITS-1:0] inscalar [0:C_NUM_INSCALARS-1];         //input scalar data values from fifo to ports
wire [C_MAX_INSCALARS-1:0] inscalar_ready;                           //input scalar ready to be buffered in fifo

wire [C_NUM_OUTSCALARS-1:0] outscalar_re;                            //read enables for output scalars
wire [C_MAX_SCALAR_BITS-1:0] outscalar [0:C_NUM_OUTSCALARS-1];       //output scalar data values from port into reg
reg  [C_MAX_SCALAR_BITS-1:0] outscalar_reg [0:C_NUM_OUTSCALARS-1];   //output scalar data values from reg into fifo
wire [C_MAX_SCALAR_BITS-1:0] outscalar_fifo [0:C_NUM_OUTSCALARS-1];  //output scalar data values from fifo into 32bit interface
wire [31:0] outscalar_fifo32 [0:C_NUM_OUTSCALARS-1];                 //output scalar data values from fifo 32bit chunk (for reading)
wire [C_NUM_OUTSCALARS-1:0] outscalar_vld;                           //output scalar valid signals
reg [C_NUM_OUTSCALARS-1:0] outscalar_found_vld;                     //output scalar valid found signals
wire [C_NUM_OUTSCALARS-1:0] outscalar_read;                         //read signal from the out_register to the outscalar_fifo

reg capture_reg;//register the capture signal to trigger the next cycle

    wire [C_NUM_INSCALARS-1:0] in_clk;
    wire [C_NUM_INSCALARS-1:0] in_rst;
    
    wire [C_NUM_INSCALARS-1:0] in_tlast;
    wire [C_NUM_INSCALARS-1:0] in_tvalid;
    wire [C_MAX_SCALAR_BITS/8-1:0] in_tkeep [C_NUM_INSCALARS-1:0];
    wire [C_MAX_SCALAR_BITS/8-1:0] in_tstrb [C_NUM_INSCALARS-1:0];
    wire [C_MAX_SCALAR_BITS-1:0]   in_tdata [C_NUM_INSCALARS-1:0];
    wire [C_NUM_INSCALARS-1:0] in_tready;
    
    wire [C_NUM_INSCALARS-1:0] in_dwconv_tlast;
    wire [C_NUM_INSCALARS-1:0] in_dwconv_tvalid;
    wire [C_MAX_SCALAR_BITS-1:0] in_dwconv_tdata [C_NUM_INSCALARS-1:0];
    wire [C_NUM_INSCALARS-1:0] in_dwconv_tready;
    wire [C_NUM_INSCALARS-1:0] in_dwconv_full;

    wire [C_NUM_INSCALARS-1:0] out_clk;
    wire [C_NUM_INSCALARS-1:0] out_rst;
    
    wire [C_NUM_INSCALARS-1:0] out_tlast;
    wire [C_NUM_INSCALARS-1:0] out_tvalid;
    wire [C_NUM_INSCALARS-1:0] out_empty;
    wire [C_MAX_SCALAR_BITS/8-1:0] out_tkeep [C_NUM_INSCALARS-1:0];
    wire [C_MAX_SCALAR_BITS/8-1:0] out_tstrb [C_NUM_INSCALARS-1:0];
    wire [C_MAX_SCALAR_BITS-1:0]   out_tdata [C_NUM_INSCALARS-1:0];
    wire [C_NUM_INSCALARS-1:0] out_tready;
    
    wire [C_NUM_INSCALARS-1:0] out_dwconv_tlast;
    wire [C_NUM_INSCALARS-1:0] out_dwconv_tvalid;
    wire [C_MAX_SCALAR_BITS-1:0] out_dwconv_tdata [C_NUM_INSCALARS-1:0];
    wire [C_NUM_INSCALARS-1:0] out_dwconv_tready;
    wire [C_MAX_SCALAR_BITS/8-1:0] out_dwconv_tstrb [C_NUM_INSCALARS-1:0];
    wire [C_MAX_SCALAR_BITS/8-1:0] out_dwconv_tkeep [C_NUM_INSCALARS-1:0];

    generate
        if(C_NUM_INSCALARS > 0 && S_AXIS_SCALAR_0_IS_DIRECT == 1) begin
            assign in_clk[0] = s_axis_scalar_0_aclk;
            assign in_rst[0] = s_axis_scalar_0_aresetn;
            assign in_tlast[0] = s_axis_scalar_0_tlast;
            assign in_tvalid[0] = s_axis_scalar_0_tvalid;
            assign in_tkeep[0][S_AXIS_SCALAR_0_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_0_tkeep;
            assign in_tstrb[0][S_AXIS_SCALAR_0_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_0_tstrb;
            assign in_tdata[0][S_AXIS_SCALAR_0_DIRECT_DMWIDTH-1:0] = s_axis_scalar_0_tdata;
            assign s_axis_scalar_0_tready = in_tready[0];
        end
        if(C_NUM_INSCALARS > 1 && S_AXIS_SCALAR_1_IS_DIRECT == 1) begin
            assign in_clk[1] = s_axis_scalar_1_aclk;
            assign in_rst[1] = s_axis_scalar_1_aresetn;
            assign in_tlast[1] = s_axis_scalar_1_tlast;
            assign in_tvalid[1] = s_axis_scalar_1_tvalid;
            assign in_tkeep[1][S_AXIS_SCALAR_1_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_1_tkeep;
            assign in_tstrb[1][S_AXIS_SCALAR_1_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_1_tstrb;
            assign in_tdata[1][S_AXIS_SCALAR_1_DIRECT_DMWIDTH-1:0] = s_axis_scalar_1_tdata;
            assign s_axis_scalar_1_tready = in_tready[1];
        end
        if(C_NUM_INSCALARS > 2 && S_AXIS_SCALAR_2_IS_DIRECT == 1) begin
            assign in_clk[2] = s_axis_scalar_2_aclk;
            assign in_rst[2] = s_axis_scalar_2_aresetn;
            assign in_tlast[2] = s_axis_scalar_2_tlast;
            assign in_tvalid[2] = s_axis_scalar_2_tvalid;
            assign in_tkeep[2][S_AXIS_SCALAR_2_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_2_tkeep;
            assign in_tstrb[2][S_AXIS_SCALAR_2_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_2_tstrb;
            assign in_tdata[2][S_AXIS_SCALAR_2_DIRECT_DMWIDTH-1:0] = s_axis_scalar_2_tdata;
            assign s_axis_scalar_2_tready = in_tready[2];
        end
        if(C_NUM_INSCALARS > 3 && S_AXIS_SCALAR_3_IS_DIRECT == 1) begin
            assign in_clk[3] = s_axis_scalar_3_aclk;
            assign in_rst[3] = s_axis_scalar_3_aresetn;
            assign in_tlast[3] = s_axis_scalar_3_tlast;
            assign in_tvalid[3] = s_axis_scalar_3_tvalid;
            assign in_tkeep[3][S_AXIS_SCALAR_3_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_3_tkeep;
            assign in_tstrb[3][S_AXIS_SCALAR_3_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_3_tstrb;
            assign in_tdata[3][S_AXIS_SCALAR_3_DIRECT_DMWIDTH-1:0] = s_axis_scalar_3_tdata;
            assign s_axis_scalar_3_tready = in_tready[3];
        end
        if(C_NUM_INSCALARS > 4 && S_AXIS_SCALAR_4_IS_DIRECT == 1) begin
            assign in_clk[4] = s_axis_scalar_4_aclk;
            assign in_rst[4] = s_axis_scalar_4_aresetn;
            assign in_tlast[4] = s_axis_scalar_4_tlast;
            assign in_tvalid[4] = s_axis_scalar_4_tvalid;
            assign in_tkeep[4][S_AXIS_SCALAR_4_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_4_tkeep;
            assign in_tstrb[4][S_AXIS_SCALAR_4_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_4_tstrb;
            assign in_tdata[4][S_AXIS_SCALAR_4_DIRECT_DMWIDTH-1:0] = s_axis_scalar_4_tdata;
            assign s_axis_scalar_4_tready = in_tready[4];
        end
        if(C_NUM_INSCALARS > 5 && S_AXIS_SCALAR_5_IS_DIRECT == 1) begin
            assign in_clk[5] = s_axis_scalar_5_aclk;
            assign in_rst[5] = s_axis_scalar_5_aresetn;
            assign in_tlast[5] = s_axis_scalar_5_tlast;
            assign in_tvalid[5] = s_axis_scalar_5_tvalid;
            assign in_tkeep[5][S_AXIS_SCALAR_5_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_5_tkeep;
            assign in_tstrb[5][S_AXIS_SCALAR_5_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_5_tstrb;
            assign in_tdata[5][S_AXIS_SCALAR_5_DIRECT_DMWIDTH-1:0] = s_axis_scalar_5_tdata;
            assign s_axis_scalar_5_tready = in_tready[5];
        end
        if(C_NUM_INSCALARS > 6 && S_AXIS_SCALAR_6_IS_DIRECT == 1) begin
            assign in_clk[6] = s_axis_scalar_6_aclk;
            assign in_rst[6] = s_axis_scalar_6_aresetn;
            assign in_tlast[6] = s_axis_scalar_6_tlast;
            assign in_tvalid[6] = s_axis_scalar_6_tvalid;
            assign in_tkeep[6][S_AXIS_SCALAR_6_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_6_tkeep;
            assign in_tstrb[6][S_AXIS_SCALAR_6_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_6_tstrb;
            assign in_tdata[6][S_AXIS_SCALAR_6_DIRECT_DMWIDTH-1:0] = s_axis_scalar_6_tdata;
            assign s_axis_scalar_6_tready = in_tready[6];
        end
        if(C_NUM_INSCALARS > 7 && S_AXIS_SCALAR_7_IS_DIRECT == 1) begin
            assign in_clk[7] = s_axis_scalar_7_aclk;
            assign in_rst[7] = s_axis_scalar_7_aresetn;
            assign in_tlast[7] = s_axis_scalar_7_tlast;
            assign in_tvalid[7] = s_axis_scalar_7_tvalid;
            assign in_tkeep[7][S_AXIS_SCALAR_7_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_7_tkeep;
            assign in_tstrb[7][S_AXIS_SCALAR_7_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_7_tstrb;
            assign in_tdata[7][S_AXIS_SCALAR_7_DIRECT_DMWIDTH-1:0] = s_axis_scalar_7_tdata;
            assign s_axis_scalar_7_tready = in_tready[7];
        end
        if(C_NUM_INSCALARS > 8 && S_AXIS_SCALAR_8_IS_DIRECT == 1) begin
            assign in_clk[8] = s_axis_scalar_8_aclk;
            assign in_rst[8] = s_axis_scalar_8_aresetn;
            assign in_tlast[8] = s_axis_scalar_8_tlast;
            assign in_tvalid[8] = s_axis_scalar_8_tvalid;
            assign in_tkeep[8][S_AXIS_SCALAR_8_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_8_tkeep;
            assign in_tstrb[8][S_AXIS_SCALAR_8_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_8_tstrb;
            assign in_tdata[8][S_AXIS_SCALAR_8_DIRECT_DMWIDTH-1:0] = s_axis_scalar_8_tdata;
            assign s_axis_scalar_8_tready = in_tready[8];
        end
        if(C_NUM_INSCALARS > 9 && S_AXIS_SCALAR_9_IS_DIRECT == 1) begin
            assign in_clk[9] = s_axis_scalar_9_aclk;
            assign in_rst[9] = s_axis_scalar_9_aresetn;
            assign in_tlast[9] = s_axis_scalar_9_tlast;
            assign in_tvalid[9] = s_axis_scalar_9_tvalid;
            assign in_tkeep[9][S_AXIS_SCALAR_9_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_9_tkeep;
            assign in_tstrb[9][S_AXIS_SCALAR_9_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_9_tstrb;
            assign in_tdata[9][S_AXIS_SCALAR_9_DIRECT_DMWIDTH-1:0] = s_axis_scalar_9_tdata;
            assign s_axis_scalar_9_tready = in_tready[9];
        end
        if(C_NUM_INSCALARS > 10 && S_AXIS_SCALAR_10_IS_DIRECT == 1) begin
            assign in_clk[10] = s_axis_scalar_10_aclk;
            assign in_rst[10] = s_axis_scalar_10_aresetn;
            assign in_tlast[10] = s_axis_scalar_10_tlast;
            assign in_tvalid[10] = s_axis_scalar_10_tvalid;
            assign in_tkeep[10][S_AXIS_SCALAR_10_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_10_tkeep;
            assign in_tstrb[10][S_AXIS_SCALAR_10_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_10_tstrb;
            assign in_tdata[10][S_AXIS_SCALAR_10_DIRECT_DMWIDTH-1:0] = s_axis_scalar_10_tdata;
            assign s_axis_scalar_10_tready = in_tready[10];
        end
        if(C_NUM_INSCALARS > 11 && S_AXIS_SCALAR_11_IS_DIRECT == 1) begin
            assign in_clk[11] = s_axis_scalar_11_aclk;
            assign in_rst[11] = s_axis_scalar_11_aresetn;
            assign in_tlast[11] = s_axis_scalar_11_tlast;
            assign in_tvalid[11] = s_axis_scalar_11_tvalid;
            assign in_tkeep[11][S_AXIS_SCALAR_11_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_11_tkeep;
            assign in_tstrb[11][S_AXIS_SCALAR_11_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_11_tstrb;
            assign in_tdata[11][S_AXIS_SCALAR_11_DIRECT_DMWIDTH-1:0] = s_axis_scalar_11_tdata;
            assign s_axis_scalar_11_tready = in_tready[11];
        end
        if(C_NUM_INSCALARS > 12 && S_AXIS_SCALAR_12_IS_DIRECT == 1) begin
            assign in_clk[12] = s_axis_scalar_12_aclk;
            assign in_rst[12] = s_axis_scalar_12_aresetn;
            assign in_tlast[12] = s_axis_scalar_12_tlast;
            assign in_tvalid[12] = s_axis_scalar_12_tvalid;
            assign in_tkeep[12][S_AXIS_SCALAR_12_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_12_tkeep;
            assign in_tstrb[12][S_AXIS_SCALAR_12_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_12_tstrb;
            assign in_tdata[12][S_AXIS_SCALAR_12_DIRECT_DMWIDTH-1:0] = s_axis_scalar_12_tdata;
            assign s_axis_scalar_12_tready = in_tready[12];
        end
        if(C_NUM_INSCALARS > 13 && S_AXIS_SCALAR_13_IS_DIRECT == 1) begin
            assign in_clk[13] = s_axis_scalar_13_aclk;
            assign in_rst[13] = s_axis_scalar_13_aresetn;
            assign in_tlast[13] = s_axis_scalar_13_tlast;
            assign in_tvalid[13] = s_axis_scalar_13_tvalid;
            assign in_tkeep[13][S_AXIS_SCALAR_13_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_13_tkeep;
            assign in_tstrb[13][S_AXIS_SCALAR_13_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_13_tstrb;
            assign in_tdata[13][S_AXIS_SCALAR_13_DIRECT_DMWIDTH-1:0] = s_axis_scalar_13_tdata;
            assign s_axis_scalar_13_tready = in_tready[13];
        end
        if(C_NUM_INSCALARS > 14 && S_AXIS_SCALAR_14_IS_DIRECT == 1) begin
            assign in_clk[14] = s_axis_scalar_14_aclk;
            assign in_rst[14] = s_axis_scalar_14_aresetn;
            assign in_tlast[14] = s_axis_scalar_14_tlast;
            assign in_tvalid[14] = s_axis_scalar_14_tvalid;
            assign in_tkeep[14][S_AXIS_SCALAR_14_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_14_tkeep;
            assign in_tstrb[14][S_AXIS_SCALAR_14_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_14_tstrb;
            assign in_tdata[14][S_AXIS_SCALAR_14_DIRECT_DMWIDTH-1:0] = s_axis_scalar_14_tdata;
            assign s_axis_scalar_14_tready = in_tready[14];
        end
        if(C_NUM_INSCALARS > 15 && S_AXIS_SCALAR_15_IS_DIRECT == 1) begin
            assign in_clk[15] = s_axis_scalar_15_aclk;
            assign in_rst[15] = s_axis_scalar_15_aresetn;
            assign in_tlast[15] = s_axis_scalar_15_tlast;
            assign in_tvalid[15] = s_axis_scalar_15_tvalid;
            assign in_tkeep[15][S_AXIS_SCALAR_15_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_15_tkeep;
            assign in_tstrb[15][S_AXIS_SCALAR_15_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_15_tstrb;
            assign in_tdata[15][S_AXIS_SCALAR_15_DIRECT_DMWIDTH-1:0] = s_axis_scalar_15_tdata;
            assign s_axis_scalar_15_tready = in_tready[15];
        end
        if(C_NUM_INSCALARS > 16 && S_AXIS_SCALAR_16_IS_DIRECT == 1) begin
            assign in_clk[16] = s_axis_scalar_16_aclk;
            assign in_rst[16] = s_axis_scalar_16_aresetn;
            assign in_tlast[16] = s_axis_scalar_16_tlast;
            assign in_tvalid[16] = s_axis_scalar_16_tvalid;
            assign in_tkeep[16][S_AXIS_SCALAR_16_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_16_tkeep;
            assign in_tstrb[16][S_AXIS_SCALAR_16_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_16_tstrb;
            assign in_tdata[16][S_AXIS_SCALAR_16_DIRECT_DMWIDTH-1:0] = s_axis_scalar_16_tdata;
            assign s_axis_scalar_16_tready = in_tready[16];
        end
        if(C_NUM_INSCALARS > 17 && S_AXIS_SCALAR_17_IS_DIRECT == 1) begin
            assign in_clk[17] = s_axis_scalar_17_aclk;
            assign in_rst[17] = s_axis_scalar_17_aresetn;
            assign in_tlast[17] = s_axis_scalar_17_tlast;
            assign in_tvalid[17] = s_axis_scalar_17_tvalid;
            assign in_tkeep[17][S_AXIS_SCALAR_17_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_17_tkeep;
            assign in_tstrb[17][S_AXIS_SCALAR_17_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_17_tstrb;
            assign in_tdata[17][S_AXIS_SCALAR_17_DIRECT_DMWIDTH-1:0] = s_axis_scalar_17_tdata;
            assign s_axis_scalar_17_tready = in_tready[17];
        end
        if(C_NUM_INSCALARS > 18 && S_AXIS_SCALAR_18_IS_DIRECT == 1) begin
            assign in_clk[18] = s_axis_scalar_18_aclk;
            assign in_rst[18] = s_axis_scalar_18_aresetn;
            assign in_tlast[18] = s_axis_scalar_18_tlast;
            assign in_tvalid[18] = s_axis_scalar_18_tvalid;
            assign in_tkeep[18][S_AXIS_SCALAR_18_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_18_tkeep;
            assign in_tstrb[18][S_AXIS_SCALAR_18_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_18_tstrb;
            assign in_tdata[18][S_AXIS_SCALAR_18_DIRECT_DMWIDTH-1:0] = s_axis_scalar_18_tdata;
            assign s_axis_scalar_18_tready = in_tready[18];
        end
        if(C_NUM_INSCALARS > 19 && S_AXIS_SCALAR_19_IS_DIRECT == 1) begin
            assign in_clk[19] = s_axis_scalar_19_aclk;
            assign in_rst[19] = s_axis_scalar_19_aresetn;
            assign in_tlast[19] = s_axis_scalar_19_tlast;
            assign in_tvalid[19] = s_axis_scalar_19_tvalid;
            assign in_tkeep[19][S_AXIS_SCALAR_19_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_19_tkeep;
            assign in_tstrb[19][S_AXIS_SCALAR_19_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_19_tstrb;
            assign in_tdata[19][S_AXIS_SCALAR_19_DIRECT_DMWIDTH-1:0] = s_axis_scalar_19_tdata;
            assign s_axis_scalar_19_tready = in_tready[19];
        end
        if(C_NUM_INSCALARS > 20 && S_AXIS_SCALAR_20_IS_DIRECT == 1) begin
            assign in_clk[20] = s_axis_scalar_20_aclk;
            assign in_rst[20] = s_axis_scalar_20_aresetn;
            assign in_tlast[20] = s_axis_scalar_20_tlast;
            assign in_tvalid[20] = s_axis_scalar_20_tvalid;
            assign in_tkeep[20][S_AXIS_SCALAR_20_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_20_tkeep;
            assign in_tstrb[20][S_AXIS_SCALAR_20_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_20_tstrb;
            assign in_tdata[20][S_AXIS_SCALAR_20_DIRECT_DMWIDTH-1:0] = s_axis_scalar_20_tdata;
            assign s_axis_scalar_20_tready = in_tready[20];
        end
        if(C_NUM_INSCALARS > 21 && S_AXIS_SCALAR_21_IS_DIRECT == 1) begin
            assign in_clk[21] = s_axis_scalar_21_aclk;
            assign in_rst[21] = s_axis_scalar_21_aresetn;
            assign in_tlast[21] = s_axis_scalar_21_tlast;
            assign in_tvalid[21] = s_axis_scalar_21_tvalid;
            assign in_tkeep[21][S_AXIS_SCALAR_21_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_21_tkeep;
            assign in_tstrb[21][S_AXIS_SCALAR_21_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_21_tstrb;
            assign in_tdata[21][S_AXIS_SCALAR_21_DIRECT_DMWIDTH-1:0] = s_axis_scalar_21_tdata;
            assign s_axis_scalar_21_tready = in_tready[21];
        end
        if(C_NUM_INSCALARS > 22 && S_AXIS_SCALAR_22_IS_DIRECT == 1) begin
            assign in_clk[22] = s_axis_scalar_22_aclk;
            assign in_rst[22] = s_axis_scalar_22_aresetn;
            assign in_tlast[22] = s_axis_scalar_22_tlast;
            assign in_tvalid[22] = s_axis_scalar_22_tvalid;
            assign in_tkeep[22][S_AXIS_SCALAR_22_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_22_tkeep;
            assign in_tstrb[22][S_AXIS_SCALAR_22_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_22_tstrb;
            assign in_tdata[22][S_AXIS_SCALAR_22_DIRECT_DMWIDTH-1:0] = s_axis_scalar_22_tdata;
            assign s_axis_scalar_22_tready = in_tready[22];
        end
        if(C_NUM_INSCALARS > 23 && S_AXIS_SCALAR_23_IS_DIRECT == 1) begin
            assign in_clk[23] = s_axis_scalar_23_aclk;
            assign in_rst[23] = s_axis_scalar_23_aresetn;
            assign in_tlast[23] = s_axis_scalar_23_tlast;
            assign in_tvalid[23] = s_axis_scalar_23_tvalid;
            assign in_tkeep[23][S_AXIS_SCALAR_23_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_23_tkeep;
            assign in_tstrb[23][S_AXIS_SCALAR_23_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_23_tstrb;
            assign in_tdata[23][S_AXIS_SCALAR_23_DIRECT_DMWIDTH-1:0] = s_axis_scalar_23_tdata;
            assign s_axis_scalar_23_tready = in_tready[23];
        end
        if(C_NUM_INSCALARS > 24 && S_AXIS_SCALAR_24_IS_DIRECT == 1) begin
            assign in_clk[24] = s_axis_scalar_24_aclk;
            assign in_rst[24] = s_axis_scalar_24_aresetn;
            assign in_tlast[24] = s_axis_scalar_24_tlast;
            assign in_tvalid[24] = s_axis_scalar_24_tvalid;
            assign in_tkeep[24][S_AXIS_SCALAR_24_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_24_tkeep;
            assign in_tstrb[24][S_AXIS_SCALAR_24_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_24_tstrb;
            assign in_tdata[24][S_AXIS_SCALAR_24_DIRECT_DMWIDTH-1:0] = s_axis_scalar_24_tdata;
            assign s_axis_scalar_24_tready = in_tready[24];
        end
        if(C_NUM_INSCALARS > 25 && S_AXIS_SCALAR_25_IS_DIRECT == 1) begin
            assign in_clk[25] = s_axis_scalar_25_aclk;
            assign in_rst[25] = s_axis_scalar_25_aresetn;
            assign in_tlast[25] = s_axis_scalar_25_tlast;
            assign in_tvalid[25] = s_axis_scalar_25_tvalid;
            assign in_tkeep[25][S_AXIS_SCALAR_25_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_25_tkeep;
            assign in_tstrb[25][S_AXIS_SCALAR_25_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_25_tstrb;
            assign in_tdata[25][S_AXIS_SCALAR_25_DIRECT_DMWIDTH-1:0] = s_axis_scalar_25_tdata;
            assign s_axis_scalar_25_tready = in_tready[25];
        end
        if(C_NUM_INSCALARS > 26 && S_AXIS_SCALAR_26_IS_DIRECT == 1) begin
            assign in_clk[26] = s_axis_scalar_26_aclk;
            assign in_rst[26] = s_axis_scalar_26_aresetn;
            assign in_tlast[26] = s_axis_scalar_26_tlast;
            assign in_tvalid[26] = s_axis_scalar_26_tvalid;
            assign in_tkeep[26][S_AXIS_SCALAR_26_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_26_tkeep;
            assign in_tstrb[26][S_AXIS_SCALAR_26_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_26_tstrb;
            assign in_tdata[26][S_AXIS_SCALAR_26_DIRECT_DMWIDTH-1:0] = s_axis_scalar_26_tdata;
            assign s_axis_scalar_26_tready = in_tready[26];
        end
        if(C_NUM_INSCALARS > 27 && S_AXIS_SCALAR_27_IS_DIRECT == 1) begin
            assign in_clk[27] = s_axis_scalar_27_aclk;
            assign in_rst[27] = s_axis_scalar_27_aresetn;
            assign in_tlast[27] = s_axis_scalar_27_tlast;
            assign in_tvalid[27] = s_axis_scalar_27_tvalid;
            assign in_tkeep[27][S_AXIS_SCALAR_27_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_27_tkeep;
            assign in_tstrb[27][S_AXIS_SCALAR_27_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_27_tstrb;
            assign in_tdata[27][S_AXIS_SCALAR_27_DIRECT_DMWIDTH-1:0] = s_axis_scalar_27_tdata;
            assign s_axis_scalar_27_tready = in_tready[27];
        end
        if(C_NUM_INSCALARS > 28 && S_AXIS_SCALAR_28_IS_DIRECT == 1) begin
            assign in_clk[28] = s_axis_scalar_28_aclk;
            assign in_rst[28] = s_axis_scalar_28_aresetn;
            assign in_tlast[28] = s_axis_scalar_28_tlast;
            assign in_tvalid[28] = s_axis_scalar_28_tvalid;
            assign in_tkeep[28][S_AXIS_SCALAR_28_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_28_tkeep;
            assign in_tstrb[28][S_AXIS_SCALAR_28_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_28_tstrb;
            assign in_tdata[28][S_AXIS_SCALAR_28_DIRECT_DMWIDTH-1:0] = s_axis_scalar_28_tdata;
            assign s_axis_scalar_28_tready = in_tready[28];
        end
        if(C_NUM_INSCALARS > 29 && S_AXIS_SCALAR_29_IS_DIRECT == 1) begin
            assign in_clk[29] = s_axis_scalar_29_aclk;
            assign in_rst[29] = s_axis_scalar_29_aresetn;
            assign in_tlast[29] = s_axis_scalar_29_tlast;
            assign in_tvalid[29] = s_axis_scalar_29_tvalid;
            assign in_tkeep[29][S_AXIS_SCALAR_29_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_29_tkeep;
            assign in_tstrb[29][S_AXIS_SCALAR_29_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_29_tstrb;
            assign in_tdata[29][S_AXIS_SCALAR_29_DIRECT_DMWIDTH-1:0] = s_axis_scalar_29_tdata;
            assign s_axis_scalar_29_tready = in_tready[29];
        end
        if(C_NUM_INSCALARS > 30 && S_AXIS_SCALAR_30_IS_DIRECT == 1) begin
            assign in_clk[30] = s_axis_scalar_30_aclk;
            assign in_rst[30] = s_axis_scalar_30_aresetn;
            assign in_tlast[30] = s_axis_scalar_30_tlast;
            assign in_tvalid[30] = s_axis_scalar_30_tvalid;
            assign in_tkeep[30][S_AXIS_SCALAR_30_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_30_tkeep;
            assign in_tstrb[30][S_AXIS_SCALAR_30_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_30_tstrb;
            assign in_tdata[30][S_AXIS_SCALAR_30_DIRECT_DMWIDTH-1:0] = s_axis_scalar_30_tdata;
            assign s_axis_scalar_30_tready = in_tready[30];
        end
        if(C_NUM_INSCALARS > 31 && S_AXIS_SCALAR_31_IS_DIRECT == 1) begin
            assign in_clk[31] = s_axis_scalar_31_aclk;
            assign in_rst[31] = s_axis_scalar_31_aresetn;
            assign in_tlast[31] = s_axis_scalar_31_tlast;
            assign in_tvalid[31] = s_axis_scalar_31_tvalid;
            assign in_tkeep[31][S_AXIS_SCALAR_31_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_31_tkeep;
            assign in_tstrb[31][S_AXIS_SCALAR_31_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_31_tstrb;
            assign in_tdata[31][S_AXIS_SCALAR_31_DIRECT_DMWIDTH-1:0] = s_axis_scalar_31_tdata;
            assign s_axis_scalar_31_tready = in_tready[31];
        end
        if(C_NUM_INSCALARS > 32 && S_AXIS_SCALAR_32_IS_DIRECT == 1) begin
            assign in_clk[32] = s_axis_scalar_32_aclk;
            assign in_rst[32] = s_axis_scalar_32_aresetn;
            assign in_tlast[32] = s_axis_scalar_32_tlast;
            assign in_tvalid[32] = s_axis_scalar_32_tvalid;
            assign in_tkeep[32][S_AXIS_SCALAR_32_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_32_tkeep;
            assign in_tstrb[32][S_AXIS_SCALAR_32_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_32_tstrb;
            assign in_tdata[32][S_AXIS_SCALAR_32_DIRECT_DMWIDTH-1:0] = s_axis_scalar_32_tdata;
            assign s_axis_scalar_32_tready = in_tready[32];
        end
        if(C_NUM_INSCALARS > 33 && S_AXIS_SCALAR_33_IS_DIRECT == 1) begin
            assign in_clk[33] = s_axis_scalar_33_aclk;
            assign in_rst[33] = s_axis_scalar_33_aresetn;
            assign in_tlast[33] = s_axis_scalar_33_tlast;
            assign in_tvalid[33] = s_axis_scalar_33_tvalid;
            assign in_tkeep[33][S_AXIS_SCALAR_33_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_33_tkeep;
            assign in_tstrb[33][S_AXIS_SCALAR_33_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_33_tstrb;
            assign in_tdata[33][S_AXIS_SCALAR_33_DIRECT_DMWIDTH-1:0] = s_axis_scalar_33_tdata;
            assign s_axis_scalar_33_tready = in_tready[33];
        end
        if(C_NUM_INSCALARS > 34 && S_AXIS_SCALAR_34_IS_DIRECT == 1) begin
            assign in_clk[34] = s_axis_scalar_34_aclk;
            assign in_rst[34] = s_axis_scalar_34_aresetn;
            assign in_tlast[34] = s_axis_scalar_34_tlast;
            assign in_tvalid[34] = s_axis_scalar_34_tvalid;
            assign in_tkeep[34][S_AXIS_SCALAR_34_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_34_tkeep;
            assign in_tstrb[34][S_AXIS_SCALAR_34_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_34_tstrb;
            assign in_tdata[34][S_AXIS_SCALAR_34_DIRECT_DMWIDTH-1:0] = s_axis_scalar_34_tdata;
            assign s_axis_scalar_34_tready = in_tready[34];
        end
        if(C_NUM_INSCALARS > 35 && S_AXIS_SCALAR_35_IS_DIRECT == 1) begin
            assign in_clk[35] = s_axis_scalar_35_aclk;
            assign in_rst[35] = s_axis_scalar_35_aresetn;
            assign in_tlast[35] = s_axis_scalar_35_tlast;
            assign in_tvalid[35] = s_axis_scalar_35_tvalid;
            assign in_tkeep[35][S_AXIS_SCALAR_35_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_35_tkeep;
            assign in_tstrb[35][S_AXIS_SCALAR_35_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_35_tstrb;
            assign in_tdata[35][S_AXIS_SCALAR_35_DIRECT_DMWIDTH-1:0] = s_axis_scalar_35_tdata;
            assign s_axis_scalar_35_tready = in_tready[35];
        end
        if(C_NUM_INSCALARS > 36 && S_AXIS_SCALAR_36_IS_DIRECT == 1) begin
            assign in_clk[36] = s_axis_scalar_36_aclk;
            assign in_rst[36] = s_axis_scalar_36_aresetn;
            assign in_tlast[36] = s_axis_scalar_36_tlast;
            assign in_tvalid[36] = s_axis_scalar_36_tvalid;
            assign in_tkeep[36][S_AXIS_SCALAR_36_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_36_tkeep;
            assign in_tstrb[36][S_AXIS_SCALAR_36_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_36_tstrb;
            assign in_tdata[36][S_AXIS_SCALAR_36_DIRECT_DMWIDTH-1:0] = s_axis_scalar_36_tdata;
            assign s_axis_scalar_36_tready = in_tready[36];
        end
        if(C_NUM_INSCALARS > 37 && S_AXIS_SCALAR_37_IS_DIRECT == 1) begin
            assign in_clk[37] = s_axis_scalar_37_aclk;
            assign in_rst[37] = s_axis_scalar_37_aresetn;
            assign in_tlast[37] = s_axis_scalar_37_tlast;
            assign in_tvalid[37] = s_axis_scalar_37_tvalid;
            assign in_tkeep[37][S_AXIS_SCALAR_37_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_37_tkeep;
            assign in_tstrb[37][S_AXIS_SCALAR_37_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_37_tstrb;
            assign in_tdata[37][S_AXIS_SCALAR_37_DIRECT_DMWIDTH-1:0] = s_axis_scalar_37_tdata;
            assign s_axis_scalar_37_tready = in_tready[37];
        end
        if(C_NUM_INSCALARS > 38 && S_AXIS_SCALAR_38_IS_DIRECT == 1) begin
            assign in_clk[38] = s_axis_scalar_38_aclk;
            assign in_rst[38] = s_axis_scalar_38_aresetn;
            assign in_tlast[38] = s_axis_scalar_38_tlast;
            assign in_tvalid[38] = s_axis_scalar_38_tvalid;
            assign in_tkeep[38][S_AXIS_SCALAR_38_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_38_tkeep;
            assign in_tstrb[38][S_AXIS_SCALAR_38_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_38_tstrb;
            assign in_tdata[38][S_AXIS_SCALAR_38_DIRECT_DMWIDTH-1:0] = s_axis_scalar_38_tdata;
            assign s_axis_scalar_38_tready = in_tready[38];
        end
        if(C_NUM_INSCALARS > 39 && S_AXIS_SCALAR_39_IS_DIRECT == 1) begin
            assign in_clk[39] = s_axis_scalar_39_aclk;
            assign in_rst[39] = s_axis_scalar_39_aresetn;
            assign in_tlast[39] = s_axis_scalar_39_tlast;
            assign in_tvalid[39] = s_axis_scalar_39_tvalid;
            assign in_tkeep[39][S_AXIS_SCALAR_39_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_39_tkeep;
            assign in_tstrb[39][S_AXIS_SCALAR_39_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_39_tstrb;
            assign in_tdata[39][S_AXIS_SCALAR_39_DIRECT_DMWIDTH-1:0] = s_axis_scalar_39_tdata;
            assign s_axis_scalar_39_tready = in_tready[39];
        end
        if(C_NUM_INSCALARS > 40 && S_AXIS_SCALAR_40_IS_DIRECT == 1) begin
            assign in_clk[40] = s_axis_scalar_40_aclk;
            assign in_rst[40] = s_axis_scalar_40_aresetn;
            assign in_tlast[40] = s_axis_scalar_40_tlast;
            assign in_tvalid[40] = s_axis_scalar_40_tvalid;
            assign in_tkeep[40][S_AXIS_SCALAR_40_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_40_tkeep;
            assign in_tstrb[40][S_AXIS_SCALAR_40_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_40_tstrb;
            assign in_tdata[40][S_AXIS_SCALAR_40_DIRECT_DMWIDTH-1:0] = s_axis_scalar_40_tdata;
            assign s_axis_scalar_40_tready = in_tready[40];
        end
        if(C_NUM_INSCALARS > 41 && S_AXIS_SCALAR_41_IS_DIRECT == 1) begin
            assign in_clk[41] = s_axis_scalar_41_aclk;
            assign in_rst[41] = s_axis_scalar_41_aresetn;
            assign in_tlast[41] = s_axis_scalar_41_tlast;
            assign in_tvalid[41] = s_axis_scalar_41_tvalid;
            assign in_tkeep[41][S_AXIS_SCALAR_41_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_41_tkeep;
            assign in_tstrb[41][S_AXIS_SCALAR_41_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_41_tstrb;
            assign in_tdata[41][S_AXIS_SCALAR_41_DIRECT_DMWIDTH-1:0] = s_axis_scalar_41_tdata;
            assign s_axis_scalar_41_tready = in_tready[41];
        end
        if(C_NUM_INSCALARS > 42 && S_AXIS_SCALAR_42_IS_DIRECT == 1) begin
            assign in_clk[42] = s_axis_scalar_42_aclk;
            assign in_rst[42] = s_axis_scalar_42_aresetn;
            assign in_tlast[42] = s_axis_scalar_42_tlast;
            assign in_tvalid[42] = s_axis_scalar_42_tvalid;
            assign in_tkeep[42][S_AXIS_SCALAR_42_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_42_tkeep;
            assign in_tstrb[42][S_AXIS_SCALAR_42_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_42_tstrb;
            assign in_tdata[42][S_AXIS_SCALAR_42_DIRECT_DMWIDTH-1:0] = s_axis_scalar_42_tdata;
            assign s_axis_scalar_42_tready = in_tready[42];
        end
        if(C_NUM_INSCALARS > 43 && S_AXIS_SCALAR_43_IS_DIRECT == 1) begin
            assign in_clk[43] = s_axis_scalar_43_aclk;
            assign in_rst[43] = s_axis_scalar_43_aresetn;
            assign in_tlast[43] = s_axis_scalar_43_tlast;
            assign in_tvalid[43] = s_axis_scalar_43_tvalid;
            assign in_tkeep[43][S_AXIS_SCALAR_43_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_43_tkeep;
            assign in_tstrb[43][S_AXIS_SCALAR_43_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_43_tstrb;
            assign in_tdata[43][S_AXIS_SCALAR_43_DIRECT_DMWIDTH-1:0] = s_axis_scalar_43_tdata;
            assign s_axis_scalar_43_tready = in_tready[43];
        end
        if(C_NUM_INSCALARS > 44 && S_AXIS_SCALAR_44_IS_DIRECT == 1) begin
            assign in_clk[44] = s_axis_scalar_44_aclk;
            assign in_rst[44] = s_axis_scalar_44_aresetn;
            assign in_tlast[44] = s_axis_scalar_44_tlast;
            assign in_tvalid[44] = s_axis_scalar_44_tvalid;
            assign in_tkeep[44][S_AXIS_SCALAR_44_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_44_tkeep;
            assign in_tstrb[44][S_AXIS_SCALAR_44_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_44_tstrb;
            assign in_tdata[44][S_AXIS_SCALAR_44_DIRECT_DMWIDTH-1:0] = s_axis_scalar_44_tdata;
            assign s_axis_scalar_44_tready = in_tready[44];
        end
        if(C_NUM_INSCALARS > 45 && S_AXIS_SCALAR_45_IS_DIRECT == 1) begin
            assign in_clk[45] = s_axis_scalar_45_aclk;
            assign in_rst[45] = s_axis_scalar_45_aresetn;
            assign in_tlast[45] = s_axis_scalar_45_tlast;
            assign in_tvalid[45] = s_axis_scalar_45_tvalid;
            assign in_tkeep[45][S_AXIS_SCALAR_45_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_45_tkeep;
            assign in_tstrb[45][S_AXIS_SCALAR_45_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_45_tstrb;
            assign in_tdata[45][S_AXIS_SCALAR_45_DIRECT_DMWIDTH-1:0] = s_axis_scalar_45_tdata;
            assign s_axis_scalar_45_tready = in_tready[45];
        end
        if(C_NUM_INSCALARS > 46 && S_AXIS_SCALAR_46_IS_DIRECT == 1) begin
            assign in_clk[46] = s_axis_scalar_46_aclk;
            assign in_rst[46] = s_axis_scalar_46_aresetn;
            assign in_tlast[46] = s_axis_scalar_46_tlast;
            assign in_tvalid[46] = s_axis_scalar_46_tvalid;
            assign in_tkeep[46][S_AXIS_SCALAR_46_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_46_tkeep;
            assign in_tstrb[46][S_AXIS_SCALAR_46_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_46_tstrb;
            assign in_tdata[46][S_AXIS_SCALAR_46_DIRECT_DMWIDTH-1:0] = s_axis_scalar_46_tdata;
            assign s_axis_scalar_46_tready = in_tready[46];
        end
        if(C_NUM_INSCALARS > 47 && S_AXIS_SCALAR_47_IS_DIRECT == 1) begin
            assign in_clk[47] = s_axis_scalar_47_aclk;
            assign in_rst[47] = s_axis_scalar_47_aresetn;
            assign in_tlast[47] = s_axis_scalar_47_tlast;
            assign in_tvalid[47] = s_axis_scalar_47_tvalid;
            assign in_tkeep[47][S_AXIS_SCALAR_47_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_47_tkeep;
            assign in_tstrb[47][S_AXIS_SCALAR_47_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_47_tstrb;
            assign in_tdata[47][S_AXIS_SCALAR_47_DIRECT_DMWIDTH-1:0] = s_axis_scalar_47_tdata;
            assign s_axis_scalar_47_tready = in_tready[47];
        end
        if(C_NUM_INSCALARS > 48 && S_AXIS_SCALAR_48_IS_DIRECT == 1) begin
            assign in_clk[48] = s_axis_scalar_48_aclk;
            assign in_rst[48] = s_axis_scalar_48_aresetn;
            assign in_tlast[48] = s_axis_scalar_48_tlast;
            assign in_tvalid[48] = s_axis_scalar_48_tvalid;
            assign in_tkeep[48][S_AXIS_SCALAR_48_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_48_tkeep;
            assign in_tstrb[48][S_AXIS_SCALAR_48_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_48_tstrb;
            assign in_tdata[48][S_AXIS_SCALAR_48_DIRECT_DMWIDTH-1:0] = s_axis_scalar_48_tdata;
            assign s_axis_scalar_48_tready = in_tready[48];
        end
        if(C_NUM_INSCALARS > 49 && S_AXIS_SCALAR_49_IS_DIRECT == 1) begin
            assign in_clk[49] = s_axis_scalar_49_aclk;
            assign in_rst[49] = s_axis_scalar_49_aresetn;
            assign in_tlast[49] = s_axis_scalar_49_tlast;
            assign in_tvalid[49] = s_axis_scalar_49_tvalid;
            assign in_tkeep[49][S_AXIS_SCALAR_49_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_49_tkeep;
            assign in_tstrb[49][S_AXIS_SCALAR_49_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_49_tstrb;
            assign in_tdata[49][S_AXIS_SCALAR_49_DIRECT_DMWIDTH-1:0] = s_axis_scalar_49_tdata;
            assign s_axis_scalar_49_tready = in_tready[49];
        end
        if(C_NUM_INSCALARS > 50 && S_AXIS_SCALAR_50_IS_DIRECT == 1) begin
            assign in_clk[50] = s_axis_scalar_50_aclk;
            assign in_rst[50] = s_axis_scalar_50_aresetn;
            assign in_tlast[50] = s_axis_scalar_50_tlast;
            assign in_tvalid[50] = s_axis_scalar_50_tvalid;
            assign in_tkeep[50][S_AXIS_SCALAR_50_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_50_tkeep;
            assign in_tstrb[50][S_AXIS_SCALAR_50_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_50_tstrb;
            assign in_tdata[50][S_AXIS_SCALAR_50_DIRECT_DMWIDTH-1:0] = s_axis_scalar_50_tdata;
            assign s_axis_scalar_50_tready = in_tready[50];
        end
        if(C_NUM_INSCALARS > 51 && S_AXIS_SCALAR_51_IS_DIRECT == 1) begin
            assign in_clk[51] = s_axis_scalar_51_aclk;
            assign in_rst[51] = s_axis_scalar_51_aresetn;
            assign in_tlast[51] = s_axis_scalar_51_tlast;
            assign in_tvalid[51] = s_axis_scalar_51_tvalid;
            assign in_tkeep[51][S_AXIS_SCALAR_51_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_51_tkeep;
            assign in_tstrb[51][S_AXIS_SCALAR_51_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_51_tstrb;
            assign in_tdata[51][S_AXIS_SCALAR_51_DIRECT_DMWIDTH-1:0] = s_axis_scalar_51_tdata;
            assign s_axis_scalar_51_tready = in_tready[51];
        end
        if(C_NUM_INSCALARS > 52 && S_AXIS_SCALAR_52_IS_DIRECT == 1) begin
            assign in_clk[52] = s_axis_scalar_52_aclk;
            assign in_rst[52] = s_axis_scalar_52_aresetn;
            assign in_tlast[52] = s_axis_scalar_52_tlast;
            assign in_tvalid[52] = s_axis_scalar_52_tvalid;
            assign in_tkeep[52][S_AXIS_SCALAR_52_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_52_tkeep;
            assign in_tstrb[52][S_AXIS_SCALAR_52_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_52_tstrb;
            assign in_tdata[52][S_AXIS_SCALAR_52_DIRECT_DMWIDTH-1:0] = s_axis_scalar_52_tdata;
            assign s_axis_scalar_52_tready = in_tready[52];
        end
        if(C_NUM_INSCALARS > 53 && S_AXIS_SCALAR_53_IS_DIRECT == 1) begin
            assign in_clk[53] = s_axis_scalar_53_aclk;
            assign in_rst[53] = s_axis_scalar_53_aresetn;
            assign in_tlast[53] = s_axis_scalar_53_tlast;
            assign in_tvalid[53] = s_axis_scalar_53_tvalid;
            assign in_tkeep[53][S_AXIS_SCALAR_53_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_53_tkeep;
            assign in_tstrb[53][S_AXIS_SCALAR_53_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_53_tstrb;
            assign in_tdata[53][S_AXIS_SCALAR_53_DIRECT_DMWIDTH-1:0] = s_axis_scalar_53_tdata;
            assign s_axis_scalar_53_tready = in_tready[53];
        end
        if(C_NUM_INSCALARS > 54 && S_AXIS_SCALAR_54_IS_DIRECT == 1) begin
            assign in_clk[54] = s_axis_scalar_54_aclk;
            assign in_rst[54] = s_axis_scalar_54_aresetn;
            assign in_tlast[54] = s_axis_scalar_54_tlast;
            assign in_tvalid[54] = s_axis_scalar_54_tvalid;
            assign in_tkeep[54][S_AXIS_SCALAR_54_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_54_tkeep;
            assign in_tstrb[54][S_AXIS_SCALAR_54_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_54_tstrb;
            assign in_tdata[54][S_AXIS_SCALAR_54_DIRECT_DMWIDTH-1:0] = s_axis_scalar_54_tdata;
            assign s_axis_scalar_54_tready = in_tready[54];
        end
        if(C_NUM_INSCALARS > 55 && S_AXIS_SCALAR_55_IS_DIRECT == 1) begin
            assign in_clk[55] = s_axis_scalar_55_aclk;
            assign in_rst[55] = s_axis_scalar_55_aresetn;
            assign in_tlast[55] = s_axis_scalar_55_tlast;
            assign in_tvalid[55] = s_axis_scalar_55_tvalid;
            assign in_tkeep[55][S_AXIS_SCALAR_55_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_55_tkeep;
            assign in_tstrb[55][S_AXIS_SCALAR_55_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_55_tstrb;
            assign in_tdata[55][S_AXIS_SCALAR_55_DIRECT_DMWIDTH-1:0] = s_axis_scalar_55_tdata;
            assign s_axis_scalar_55_tready = in_tready[55];
        end
        if(C_NUM_INSCALARS > 56 && S_AXIS_SCALAR_56_IS_DIRECT == 1) begin
            assign in_clk[56] = s_axis_scalar_56_aclk;
            assign in_rst[56] = s_axis_scalar_56_aresetn;
            assign in_tlast[56] = s_axis_scalar_56_tlast;
            assign in_tvalid[56] = s_axis_scalar_56_tvalid;
            assign in_tkeep[56][S_AXIS_SCALAR_56_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_56_tkeep;
            assign in_tstrb[56][S_AXIS_SCALAR_56_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_56_tstrb;
            assign in_tdata[56][S_AXIS_SCALAR_56_DIRECT_DMWIDTH-1:0] = s_axis_scalar_56_tdata;
            assign s_axis_scalar_56_tready = in_tready[56];
        end
        if(C_NUM_INSCALARS > 57 && S_AXIS_SCALAR_57_IS_DIRECT == 1) begin
            assign in_clk[57] = s_axis_scalar_57_aclk;
            assign in_rst[57] = s_axis_scalar_57_aresetn;
            assign in_tlast[57] = s_axis_scalar_57_tlast;
            assign in_tvalid[57] = s_axis_scalar_57_tvalid;
            assign in_tkeep[57][S_AXIS_SCALAR_57_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_57_tkeep;
            assign in_tstrb[57][S_AXIS_SCALAR_57_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_57_tstrb;
            assign in_tdata[57][S_AXIS_SCALAR_57_DIRECT_DMWIDTH-1:0] = s_axis_scalar_57_tdata;
            assign s_axis_scalar_57_tready = in_tready[57];
        end
        if(C_NUM_INSCALARS > 58 && S_AXIS_SCALAR_58_IS_DIRECT == 1) begin
            assign in_clk[58] = s_axis_scalar_58_aclk;
            assign in_rst[58] = s_axis_scalar_58_aresetn;
            assign in_tlast[58] = s_axis_scalar_58_tlast;
            assign in_tvalid[58] = s_axis_scalar_58_tvalid;
            assign in_tkeep[58][S_AXIS_SCALAR_58_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_58_tkeep;
            assign in_tstrb[58][S_AXIS_SCALAR_58_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_58_tstrb;
            assign in_tdata[58][S_AXIS_SCALAR_58_DIRECT_DMWIDTH-1:0] = s_axis_scalar_58_tdata;
            assign s_axis_scalar_58_tready = in_tready[58];
        end
        if(C_NUM_INSCALARS > 59 && S_AXIS_SCALAR_59_IS_DIRECT == 1) begin
            assign in_clk[59] = s_axis_scalar_59_aclk;
            assign in_rst[59] = s_axis_scalar_59_aresetn;
            assign in_tlast[59] = s_axis_scalar_59_tlast;
            assign in_tvalid[59] = s_axis_scalar_59_tvalid;
            assign in_tkeep[59][S_AXIS_SCALAR_59_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_59_tkeep;
            assign in_tstrb[59][S_AXIS_SCALAR_59_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_59_tstrb;
            assign in_tdata[59][S_AXIS_SCALAR_59_DIRECT_DMWIDTH-1:0] = s_axis_scalar_59_tdata;
            assign s_axis_scalar_59_tready = in_tready[59];
        end
        if(C_NUM_INSCALARS > 60 && S_AXIS_SCALAR_60_IS_DIRECT == 1) begin
            assign in_clk[60] = s_axis_scalar_60_aclk;
            assign in_rst[60] = s_axis_scalar_60_aresetn;
            assign in_tlast[60] = s_axis_scalar_60_tlast;
            assign in_tvalid[60] = s_axis_scalar_60_tvalid;
            assign in_tkeep[60][S_AXIS_SCALAR_60_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_60_tkeep;
            assign in_tstrb[60][S_AXIS_SCALAR_60_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_60_tstrb;
            assign in_tdata[60][S_AXIS_SCALAR_60_DIRECT_DMWIDTH-1:0] = s_axis_scalar_60_tdata;
            assign s_axis_scalar_60_tready = in_tready[60];
        end
        if(C_NUM_INSCALARS > 61 && S_AXIS_SCALAR_61_IS_DIRECT == 1) begin
            assign in_clk[61] = s_axis_scalar_61_aclk;
            assign in_rst[61] = s_axis_scalar_61_aresetn;
            assign in_tlast[61] = s_axis_scalar_61_tlast;
            assign in_tvalid[61] = s_axis_scalar_61_tvalid;
            assign in_tkeep[61][S_AXIS_SCALAR_61_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_61_tkeep;
            assign in_tstrb[61][S_AXIS_SCALAR_61_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_61_tstrb;
            assign in_tdata[61][S_AXIS_SCALAR_61_DIRECT_DMWIDTH-1:0] = s_axis_scalar_61_tdata;
            assign s_axis_scalar_61_tready = in_tready[61];
        end
        if(C_NUM_INSCALARS > 62 && S_AXIS_SCALAR_62_IS_DIRECT == 1) begin
            assign in_clk[62] = s_axis_scalar_62_aclk;
            assign in_rst[62] = s_axis_scalar_62_aresetn;
            assign in_tlast[62] = s_axis_scalar_62_tlast;
            assign in_tvalid[62] = s_axis_scalar_62_tvalid;
            assign in_tkeep[62][S_AXIS_SCALAR_62_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_62_tkeep;
            assign in_tstrb[62][S_AXIS_SCALAR_62_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_62_tstrb;
            assign in_tdata[62][S_AXIS_SCALAR_62_DIRECT_DMWIDTH-1:0] = s_axis_scalar_62_tdata;
            assign s_axis_scalar_62_tready = in_tready[62];
        end
        if(C_NUM_INSCALARS > 63 && S_AXIS_SCALAR_63_IS_DIRECT == 1) begin
            assign in_clk[63] = s_axis_scalar_63_aclk;
            assign in_rst[63] = s_axis_scalar_63_aresetn;
            assign in_tlast[63] = s_axis_scalar_63_tlast;
            assign in_tvalid[63] = s_axis_scalar_63_tvalid;
            assign in_tkeep[63][S_AXIS_SCALAR_63_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_63_tkeep;
            assign in_tstrb[63][S_AXIS_SCALAR_63_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_63_tstrb;
            assign in_tdata[63][S_AXIS_SCALAR_63_DIRECT_DMWIDTH-1:0] = s_axis_scalar_63_tdata;
            assign s_axis_scalar_63_tready = in_tready[63];
        end
        if(C_NUM_INSCALARS > 64 && S_AXIS_SCALAR_64_IS_DIRECT == 1) begin
            assign in_clk[64] = s_axis_scalar_64_aclk;
            assign in_rst[64] = s_axis_scalar_64_aresetn;
            assign in_tlast[64] = s_axis_scalar_64_tlast;
            assign in_tvalid[64] = s_axis_scalar_64_tvalid;
            assign in_tkeep[64][S_AXIS_SCALAR_64_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_64_tkeep;
            assign in_tstrb[64][S_AXIS_SCALAR_64_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_64_tstrb;
            assign in_tdata[64][S_AXIS_SCALAR_64_DIRECT_DMWIDTH-1:0] = s_axis_scalar_64_tdata;
            assign s_axis_scalar_64_tready = in_tready[64];
        end
        if(C_NUM_INSCALARS > 65 && S_AXIS_SCALAR_65_IS_DIRECT == 1) begin
            assign in_clk[65] = s_axis_scalar_65_aclk;
            assign in_rst[65] = s_axis_scalar_65_aresetn;
            assign in_tlast[65] = s_axis_scalar_65_tlast;
            assign in_tvalid[65] = s_axis_scalar_65_tvalid;
            assign in_tkeep[65][S_AXIS_SCALAR_65_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_65_tkeep;
            assign in_tstrb[65][S_AXIS_SCALAR_65_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_65_tstrb;
            assign in_tdata[65][S_AXIS_SCALAR_65_DIRECT_DMWIDTH-1:0] = s_axis_scalar_65_tdata;
            assign s_axis_scalar_65_tready = in_tready[65];
        end
        if(C_NUM_INSCALARS > 66 && S_AXIS_SCALAR_66_IS_DIRECT == 1) begin
            assign in_clk[66] = s_axis_scalar_66_aclk;
            assign in_rst[66] = s_axis_scalar_66_aresetn;
            assign in_tlast[66] = s_axis_scalar_66_tlast;
            assign in_tvalid[66] = s_axis_scalar_66_tvalid;
            assign in_tkeep[66][S_AXIS_SCALAR_66_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_66_tkeep;
            assign in_tstrb[66][S_AXIS_SCALAR_66_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_66_tstrb;
            assign in_tdata[66][S_AXIS_SCALAR_66_DIRECT_DMWIDTH-1:0] = s_axis_scalar_66_tdata;
            assign s_axis_scalar_66_tready = in_tready[66];
        end
        if(C_NUM_INSCALARS > 67 && S_AXIS_SCALAR_67_IS_DIRECT == 1) begin
            assign in_clk[67] = s_axis_scalar_67_aclk;
            assign in_rst[67] = s_axis_scalar_67_aresetn;
            assign in_tlast[67] = s_axis_scalar_67_tlast;
            assign in_tvalid[67] = s_axis_scalar_67_tvalid;
            assign in_tkeep[67][S_AXIS_SCALAR_67_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_67_tkeep;
            assign in_tstrb[67][S_AXIS_SCALAR_67_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_67_tstrb;
            assign in_tdata[67][S_AXIS_SCALAR_67_DIRECT_DMWIDTH-1:0] = s_axis_scalar_67_tdata;
            assign s_axis_scalar_67_tready = in_tready[67];
        end
        if(C_NUM_INSCALARS > 68 && S_AXIS_SCALAR_68_IS_DIRECT == 1) begin
            assign in_clk[68] = s_axis_scalar_68_aclk;
            assign in_rst[68] = s_axis_scalar_68_aresetn;
            assign in_tlast[68] = s_axis_scalar_68_tlast;
            assign in_tvalid[68] = s_axis_scalar_68_tvalid;
            assign in_tkeep[68][S_AXIS_SCALAR_68_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_68_tkeep;
            assign in_tstrb[68][S_AXIS_SCALAR_68_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_68_tstrb;
            assign in_tdata[68][S_AXIS_SCALAR_68_DIRECT_DMWIDTH-1:0] = s_axis_scalar_68_tdata;
            assign s_axis_scalar_68_tready = in_tready[68];
        end
        if(C_NUM_INSCALARS > 69 && S_AXIS_SCALAR_69_IS_DIRECT == 1) begin
            assign in_clk[69] = s_axis_scalar_69_aclk;
            assign in_rst[69] = s_axis_scalar_69_aresetn;
            assign in_tlast[69] = s_axis_scalar_69_tlast;
            assign in_tvalid[69] = s_axis_scalar_69_tvalid;
            assign in_tkeep[69][S_AXIS_SCALAR_69_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_69_tkeep;
            assign in_tstrb[69][S_AXIS_SCALAR_69_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_69_tstrb;
            assign in_tdata[69][S_AXIS_SCALAR_69_DIRECT_DMWIDTH-1:0] = s_axis_scalar_69_tdata;
            assign s_axis_scalar_69_tready = in_tready[69];
        end
        if(C_NUM_INSCALARS > 70 && S_AXIS_SCALAR_70_IS_DIRECT == 1) begin
            assign in_clk[70] = s_axis_scalar_70_aclk;
            assign in_rst[70] = s_axis_scalar_70_aresetn;
            assign in_tlast[70] = s_axis_scalar_70_tlast;
            assign in_tvalid[70] = s_axis_scalar_70_tvalid;
            assign in_tkeep[70][S_AXIS_SCALAR_70_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_70_tkeep;
            assign in_tstrb[70][S_AXIS_SCALAR_70_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_70_tstrb;
            assign in_tdata[70][S_AXIS_SCALAR_70_DIRECT_DMWIDTH-1:0] = s_axis_scalar_70_tdata;
            assign s_axis_scalar_70_tready = in_tready[70];
        end
        if(C_NUM_INSCALARS > 71 && S_AXIS_SCALAR_71_IS_DIRECT == 1) begin
            assign in_clk[71] = s_axis_scalar_71_aclk;
            assign in_rst[71] = s_axis_scalar_71_aresetn;
            assign in_tlast[71] = s_axis_scalar_71_tlast;
            assign in_tvalid[71] = s_axis_scalar_71_tvalid;
            assign in_tkeep[71][S_AXIS_SCALAR_71_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_71_tkeep;
            assign in_tstrb[71][S_AXIS_SCALAR_71_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_71_tstrb;
            assign in_tdata[71][S_AXIS_SCALAR_71_DIRECT_DMWIDTH-1:0] = s_axis_scalar_71_tdata;
            assign s_axis_scalar_71_tready = in_tready[71];
        end
        if(C_NUM_INSCALARS > 72 && S_AXIS_SCALAR_72_IS_DIRECT == 1) begin
            assign in_clk[72] = s_axis_scalar_72_aclk;
            assign in_rst[72] = s_axis_scalar_72_aresetn;
            assign in_tlast[72] = s_axis_scalar_72_tlast;
            assign in_tvalid[72] = s_axis_scalar_72_tvalid;
            assign in_tkeep[72][S_AXIS_SCALAR_72_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_72_tkeep;
            assign in_tstrb[72][S_AXIS_SCALAR_72_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_72_tstrb;
            assign in_tdata[72][S_AXIS_SCALAR_72_DIRECT_DMWIDTH-1:0] = s_axis_scalar_72_tdata;
            assign s_axis_scalar_72_tready = in_tready[72];
        end
        if(C_NUM_INSCALARS > 73 && S_AXIS_SCALAR_73_IS_DIRECT == 1) begin
            assign in_clk[73] = s_axis_scalar_73_aclk;
            assign in_rst[73] = s_axis_scalar_73_aresetn;
            assign in_tlast[73] = s_axis_scalar_73_tlast;
            assign in_tvalid[73] = s_axis_scalar_73_tvalid;
            assign in_tkeep[73][S_AXIS_SCALAR_73_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_73_tkeep;
            assign in_tstrb[73][S_AXIS_SCALAR_73_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_73_tstrb;
            assign in_tdata[73][S_AXIS_SCALAR_73_DIRECT_DMWIDTH-1:0] = s_axis_scalar_73_tdata;
            assign s_axis_scalar_73_tready = in_tready[73];
        end
        if(C_NUM_INSCALARS > 74 && S_AXIS_SCALAR_74_IS_DIRECT == 1) begin
            assign in_clk[74] = s_axis_scalar_74_aclk;
            assign in_rst[74] = s_axis_scalar_74_aresetn;
            assign in_tlast[74] = s_axis_scalar_74_tlast;
            assign in_tvalid[74] = s_axis_scalar_74_tvalid;
            assign in_tkeep[74][S_AXIS_SCALAR_74_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_74_tkeep;
            assign in_tstrb[74][S_AXIS_SCALAR_74_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_74_tstrb;
            assign in_tdata[74][S_AXIS_SCALAR_74_DIRECT_DMWIDTH-1:0] = s_axis_scalar_74_tdata;
            assign s_axis_scalar_74_tready = in_tready[74];
        end
        if(C_NUM_INSCALARS > 75 && S_AXIS_SCALAR_75_IS_DIRECT == 1) begin
            assign in_clk[75] = s_axis_scalar_75_aclk;
            assign in_rst[75] = s_axis_scalar_75_aresetn;
            assign in_tlast[75] = s_axis_scalar_75_tlast;
            assign in_tvalid[75] = s_axis_scalar_75_tvalid;
            assign in_tkeep[75][S_AXIS_SCALAR_75_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_75_tkeep;
            assign in_tstrb[75][S_AXIS_SCALAR_75_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_75_tstrb;
            assign in_tdata[75][S_AXIS_SCALAR_75_DIRECT_DMWIDTH-1:0] = s_axis_scalar_75_tdata;
            assign s_axis_scalar_75_tready = in_tready[75];
        end
        if(C_NUM_INSCALARS > 76 && S_AXIS_SCALAR_76_IS_DIRECT == 1) begin
            assign in_clk[76] = s_axis_scalar_76_aclk;
            assign in_rst[76] = s_axis_scalar_76_aresetn;
            assign in_tlast[76] = s_axis_scalar_76_tlast;
            assign in_tvalid[76] = s_axis_scalar_76_tvalid;
            assign in_tkeep[76][S_AXIS_SCALAR_76_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_76_tkeep;
            assign in_tstrb[76][S_AXIS_SCALAR_76_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_76_tstrb;
            assign in_tdata[76][S_AXIS_SCALAR_76_DIRECT_DMWIDTH-1:0] = s_axis_scalar_76_tdata;
            assign s_axis_scalar_76_tready = in_tready[76];
        end
        if(C_NUM_INSCALARS > 77 && S_AXIS_SCALAR_77_IS_DIRECT == 1) begin
            assign in_clk[77] = s_axis_scalar_77_aclk;
            assign in_rst[77] = s_axis_scalar_77_aresetn;
            assign in_tlast[77] = s_axis_scalar_77_tlast;
            assign in_tvalid[77] = s_axis_scalar_77_tvalid;
            assign in_tkeep[77][S_AXIS_SCALAR_77_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_77_tkeep;
            assign in_tstrb[77][S_AXIS_SCALAR_77_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_77_tstrb;
            assign in_tdata[77][S_AXIS_SCALAR_77_DIRECT_DMWIDTH-1:0] = s_axis_scalar_77_tdata;
            assign s_axis_scalar_77_tready = in_tready[77];
        end
        if(C_NUM_INSCALARS > 78 && S_AXIS_SCALAR_78_IS_DIRECT == 1) begin
            assign in_clk[78] = s_axis_scalar_78_aclk;
            assign in_rst[78] = s_axis_scalar_78_aresetn;
            assign in_tlast[78] = s_axis_scalar_78_tlast;
            assign in_tvalid[78] = s_axis_scalar_78_tvalid;
            assign in_tkeep[78][S_AXIS_SCALAR_78_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_78_tkeep;
            assign in_tstrb[78][S_AXIS_SCALAR_78_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_78_tstrb;
            assign in_tdata[78][S_AXIS_SCALAR_78_DIRECT_DMWIDTH-1:0] = s_axis_scalar_78_tdata;
            assign s_axis_scalar_78_tready = in_tready[78];
        end
        if(C_NUM_INSCALARS > 79 && S_AXIS_SCALAR_79_IS_DIRECT == 1) begin
            assign in_clk[79] = s_axis_scalar_79_aclk;
            assign in_rst[79] = s_axis_scalar_79_aresetn;
            assign in_tlast[79] = s_axis_scalar_79_tlast;
            assign in_tvalid[79] = s_axis_scalar_79_tvalid;
            assign in_tkeep[79][S_AXIS_SCALAR_79_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_79_tkeep;
            assign in_tstrb[79][S_AXIS_SCALAR_79_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_79_tstrb;
            assign in_tdata[79][S_AXIS_SCALAR_79_DIRECT_DMWIDTH-1:0] = s_axis_scalar_79_tdata;
            assign s_axis_scalar_79_tready = in_tready[79];
        end
        if(C_NUM_INSCALARS > 80 && S_AXIS_SCALAR_80_IS_DIRECT == 1) begin
            assign in_clk[80] = s_axis_scalar_80_aclk;
            assign in_rst[80] = s_axis_scalar_80_aresetn;
            assign in_tlast[80] = s_axis_scalar_80_tlast;
            assign in_tvalid[80] = s_axis_scalar_80_tvalid;
            assign in_tkeep[80][S_AXIS_SCALAR_80_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_80_tkeep;
            assign in_tstrb[80][S_AXIS_SCALAR_80_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_80_tstrb;
            assign in_tdata[80][S_AXIS_SCALAR_80_DIRECT_DMWIDTH-1:0] = s_axis_scalar_80_tdata;
            assign s_axis_scalar_80_tready = in_tready[80];
        end
        if(C_NUM_INSCALARS > 81 && S_AXIS_SCALAR_81_IS_DIRECT == 1) begin
            assign in_clk[81] = s_axis_scalar_81_aclk;
            assign in_rst[81] = s_axis_scalar_81_aresetn;
            assign in_tlast[81] = s_axis_scalar_81_tlast;
            assign in_tvalid[81] = s_axis_scalar_81_tvalid;
            assign in_tkeep[81][S_AXIS_SCALAR_81_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_81_tkeep;
            assign in_tstrb[81][S_AXIS_SCALAR_81_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_81_tstrb;
            assign in_tdata[81][S_AXIS_SCALAR_81_DIRECT_DMWIDTH-1:0] = s_axis_scalar_81_tdata;
            assign s_axis_scalar_81_tready = in_tready[81];
        end
        if(C_NUM_INSCALARS > 82 && S_AXIS_SCALAR_82_IS_DIRECT == 1) begin
            assign in_clk[82] = s_axis_scalar_82_aclk;
            assign in_rst[82] = s_axis_scalar_82_aresetn;
            assign in_tlast[82] = s_axis_scalar_82_tlast;
            assign in_tvalid[82] = s_axis_scalar_82_tvalid;
            assign in_tkeep[82][S_AXIS_SCALAR_82_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_82_tkeep;
            assign in_tstrb[82][S_AXIS_SCALAR_82_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_82_tstrb;
            assign in_tdata[82][S_AXIS_SCALAR_82_DIRECT_DMWIDTH-1:0] = s_axis_scalar_82_tdata;
            assign s_axis_scalar_82_tready = in_tready[82];
        end
        if(C_NUM_INSCALARS > 83 && S_AXIS_SCALAR_83_IS_DIRECT == 1) begin
            assign in_clk[83] = s_axis_scalar_83_aclk;
            assign in_rst[83] = s_axis_scalar_83_aresetn;
            assign in_tlast[83] = s_axis_scalar_83_tlast;
            assign in_tvalid[83] = s_axis_scalar_83_tvalid;
            assign in_tkeep[83][S_AXIS_SCALAR_83_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_83_tkeep;
            assign in_tstrb[83][S_AXIS_SCALAR_83_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_83_tstrb;
            assign in_tdata[83][S_AXIS_SCALAR_83_DIRECT_DMWIDTH-1:0] = s_axis_scalar_83_tdata;
            assign s_axis_scalar_83_tready = in_tready[83];
        end
        if(C_NUM_INSCALARS > 84 && S_AXIS_SCALAR_84_IS_DIRECT == 1) begin
            assign in_clk[84] = s_axis_scalar_84_aclk;
            assign in_rst[84] = s_axis_scalar_84_aresetn;
            assign in_tlast[84] = s_axis_scalar_84_tlast;
            assign in_tvalid[84] = s_axis_scalar_84_tvalid;
            assign in_tkeep[84][S_AXIS_SCALAR_84_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_84_tkeep;
            assign in_tstrb[84][S_AXIS_SCALAR_84_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_84_tstrb;
            assign in_tdata[84][S_AXIS_SCALAR_84_DIRECT_DMWIDTH-1:0] = s_axis_scalar_84_tdata;
            assign s_axis_scalar_84_tready = in_tready[84];
        end
        if(C_NUM_INSCALARS > 85 && S_AXIS_SCALAR_85_IS_DIRECT == 1) begin
            assign in_clk[85] = s_axis_scalar_85_aclk;
            assign in_rst[85] = s_axis_scalar_85_aresetn;
            assign in_tlast[85] = s_axis_scalar_85_tlast;
            assign in_tvalid[85] = s_axis_scalar_85_tvalid;
            assign in_tkeep[85][S_AXIS_SCALAR_85_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_85_tkeep;
            assign in_tstrb[85][S_AXIS_SCALAR_85_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_85_tstrb;
            assign in_tdata[85][S_AXIS_SCALAR_85_DIRECT_DMWIDTH-1:0] = s_axis_scalar_85_tdata;
            assign s_axis_scalar_85_tready = in_tready[85];
        end
        if(C_NUM_INSCALARS > 86 && S_AXIS_SCALAR_86_IS_DIRECT == 1) begin
            assign in_clk[86] = s_axis_scalar_86_aclk;
            assign in_rst[86] = s_axis_scalar_86_aresetn;
            assign in_tlast[86] = s_axis_scalar_86_tlast;
            assign in_tvalid[86] = s_axis_scalar_86_tvalid;
            assign in_tkeep[86][S_AXIS_SCALAR_86_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_86_tkeep;
            assign in_tstrb[86][S_AXIS_SCALAR_86_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_86_tstrb;
            assign in_tdata[86][S_AXIS_SCALAR_86_DIRECT_DMWIDTH-1:0] = s_axis_scalar_86_tdata;
            assign s_axis_scalar_86_tready = in_tready[86];
        end
        if(C_NUM_INSCALARS > 87 && S_AXIS_SCALAR_87_IS_DIRECT == 1) begin
            assign in_clk[87] = s_axis_scalar_87_aclk;
            assign in_rst[87] = s_axis_scalar_87_aresetn;
            assign in_tlast[87] = s_axis_scalar_87_tlast;
            assign in_tvalid[87] = s_axis_scalar_87_tvalid;
            assign in_tkeep[87][S_AXIS_SCALAR_87_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_87_tkeep;
            assign in_tstrb[87][S_AXIS_SCALAR_87_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_87_tstrb;
            assign in_tdata[87][S_AXIS_SCALAR_87_DIRECT_DMWIDTH-1:0] = s_axis_scalar_87_tdata;
            assign s_axis_scalar_87_tready = in_tready[87];
        end
        if(C_NUM_INSCALARS > 88 && S_AXIS_SCALAR_88_IS_DIRECT == 1) begin
            assign in_clk[88] = s_axis_scalar_88_aclk;
            assign in_rst[88] = s_axis_scalar_88_aresetn;
            assign in_tlast[88] = s_axis_scalar_88_tlast;
            assign in_tvalid[88] = s_axis_scalar_88_tvalid;
            assign in_tkeep[88][S_AXIS_SCALAR_88_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_88_tkeep;
            assign in_tstrb[88][S_AXIS_SCALAR_88_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_88_tstrb;
            assign in_tdata[88][S_AXIS_SCALAR_88_DIRECT_DMWIDTH-1:0] = s_axis_scalar_88_tdata;
            assign s_axis_scalar_88_tready = in_tready[88];
        end
        if(C_NUM_INSCALARS > 89 && S_AXIS_SCALAR_89_IS_DIRECT == 1) begin
            assign in_clk[89] = s_axis_scalar_89_aclk;
            assign in_rst[89] = s_axis_scalar_89_aresetn;
            assign in_tlast[89] = s_axis_scalar_89_tlast;
            assign in_tvalid[89] = s_axis_scalar_89_tvalid;
            assign in_tkeep[89][S_AXIS_SCALAR_89_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_89_tkeep;
            assign in_tstrb[89][S_AXIS_SCALAR_89_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_89_tstrb;
            assign in_tdata[89][S_AXIS_SCALAR_89_DIRECT_DMWIDTH-1:0] = s_axis_scalar_89_tdata;
            assign s_axis_scalar_89_tready = in_tready[89];
        end
        if(C_NUM_INSCALARS > 90 && S_AXIS_SCALAR_90_IS_DIRECT == 1) begin
            assign in_clk[90] = s_axis_scalar_90_aclk;
            assign in_rst[90] = s_axis_scalar_90_aresetn;
            assign in_tlast[90] = s_axis_scalar_90_tlast;
            assign in_tvalid[90] = s_axis_scalar_90_tvalid;
            assign in_tkeep[90][S_AXIS_SCALAR_90_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_90_tkeep;
            assign in_tstrb[90][S_AXIS_SCALAR_90_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_90_tstrb;
            assign in_tdata[90][S_AXIS_SCALAR_90_DIRECT_DMWIDTH-1:0] = s_axis_scalar_90_tdata;
            assign s_axis_scalar_90_tready = in_tready[90];
        end
        if(C_NUM_INSCALARS > 91 && S_AXIS_SCALAR_91_IS_DIRECT == 1) begin
            assign in_clk[91] = s_axis_scalar_91_aclk;
            assign in_rst[91] = s_axis_scalar_91_aresetn;
            assign in_tlast[91] = s_axis_scalar_91_tlast;
            assign in_tvalid[91] = s_axis_scalar_91_tvalid;
            assign in_tkeep[91][S_AXIS_SCALAR_91_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_91_tkeep;
            assign in_tstrb[91][S_AXIS_SCALAR_91_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_91_tstrb;
            assign in_tdata[91][S_AXIS_SCALAR_91_DIRECT_DMWIDTH-1:0] = s_axis_scalar_91_tdata;
            assign s_axis_scalar_91_tready = in_tready[91];
        end
        if(C_NUM_INSCALARS > 92 && S_AXIS_SCALAR_92_IS_DIRECT == 1) begin
            assign in_clk[92] = s_axis_scalar_92_aclk;
            assign in_rst[92] = s_axis_scalar_92_aresetn;
            assign in_tlast[92] = s_axis_scalar_92_tlast;
            assign in_tvalid[92] = s_axis_scalar_92_tvalid;
            assign in_tkeep[92][S_AXIS_SCALAR_92_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_92_tkeep;
            assign in_tstrb[92][S_AXIS_SCALAR_92_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_92_tstrb;
            assign in_tdata[92][S_AXIS_SCALAR_92_DIRECT_DMWIDTH-1:0] = s_axis_scalar_92_tdata;
            assign s_axis_scalar_92_tready = in_tready[92];
        end
        if(C_NUM_INSCALARS > 93 && S_AXIS_SCALAR_93_IS_DIRECT == 1) begin
            assign in_clk[93] = s_axis_scalar_93_aclk;
            assign in_rst[93] = s_axis_scalar_93_aresetn;
            assign in_tlast[93] = s_axis_scalar_93_tlast;
            assign in_tvalid[93] = s_axis_scalar_93_tvalid;
            assign in_tkeep[93][S_AXIS_SCALAR_93_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_93_tkeep;
            assign in_tstrb[93][S_AXIS_SCALAR_93_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_93_tstrb;
            assign in_tdata[93][S_AXIS_SCALAR_93_DIRECT_DMWIDTH-1:0] = s_axis_scalar_93_tdata;
            assign s_axis_scalar_93_tready = in_tready[93];
        end
        if(C_NUM_INSCALARS > 94 && S_AXIS_SCALAR_94_IS_DIRECT == 1) begin
            assign in_clk[94] = s_axis_scalar_94_aclk;
            assign in_rst[94] = s_axis_scalar_94_aresetn;
            assign in_tlast[94] = s_axis_scalar_94_tlast;
            assign in_tvalid[94] = s_axis_scalar_94_tvalid;
            assign in_tkeep[94][S_AXIS_SCALAR_94_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_94_tkeep;
            assign in_tstrb[94][S_AXIS_SCALAR_94_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_94_tstrb;
            assign in_tdata[94][S_AXIS_SCALAR_94_DIRECT_DMWIDTH-1:0] = s_axis_scalar_94_tdata;
            assign s_axis_scalar_94_tready = in_tready[94];
        end
        if(C_NUM_INSCALARS > 95 && S_AXIS_SCALAR_95_IS_DIRECT == 1) begin
            assign in_clk[95] = s_axis_scalar_95_aclk;
            assign in_rst[95] = s_axis_scalar_95_aresetn;
            assign in_tlast[95] = s_axis_scalar_95_tlast;
            assign in_tvalid[95] = s_axis_scalar_95_tvalid;
            assign in_tkeep[95][S_AXIS_SCALAR_95_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_95_tkeep;
            assign in_tstrb[95][S_AXIS_SCALAR_95_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_95_tstrb;
            assign in_tdata[95][S_AXIS_SCALAR_95_DIRECT_DMWIDTH-1:0] = s_axis_scalar_95_tdata;
            assign s_axis_scalar_95_tready = in_tready[95];
        end
        if(C_NUM_INSCALARS > 96 && S_AXIS_SCALAR_96_IS_DIRECT == 1) begin
            assign in_clk[96] = s_axis_scalar_96_aclk;
            assign in_rst[96] = s_axis_scalar_96_aresetn;
            assign in_tlast[96] = s_axis_scalar_96_tlast;
            assign in_tvalid[96] = s_axis_scalar_96_tvalid;
            assign in_tkeep[96][S_AXIS_SCALAR_96_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_96_tkeep;
            assign in_tstrb[96][S_AXIS_SCALAR_96_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_96_tstrb;
            assign in_tdata[96][S_AXIS_SCALAR_96_DIRECT_DMWIDTH-1:0] = s_axis_scalar_96_tdata;
            assign s_axis_scalar_96_tready = in_tready[96];
        end
        if(C_NUM_INSCALARS > 97 && S_AXIS_SCALAR_97_IS_DIRECT == 1) begin
            assign in_clk[97] = s_axis_scalar_97_aclk;
            assign in_rst[97] = s_axis_scalar_97_aresetn;
            assign in_tlast[97] = s_axis_scalar_97_tlast;
            assign in_tvalid[97] = s_axis_scalar_97_tvalid;
            assign in_tkeep[97][S_AXIS_SCALAR_97_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_97_tkeep;
            assign in_tstrb[97][S_AXIS_SCALAR_97_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_97_tstrb;
            assign in_tdata[97][S_AXIS_SCALAR_97_DIRECT_DMWIDTH-1:0] = s_axis_scalar_97_tdata;
            assign s_axis_scalar_97_tready = in_tready[97];
        end
        if(C_NUM_INSCALARS > 98 && S_AXIS_SCALAR_98_IS_DIRECT == 1) begin
            assign in_clk[98] = s_axis_scalar_98_aclk;
            assign in_rst[98] = s_axis_scalar_98_aresetn;
            assign in_tlast[98] = s_axis_scalar_98_tlast;
            assign in_tvalid[98] = s_axis_scalar_98_tvalid;
            assign in_tkeep[98][S_AXIS_SCALAR_98_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_98_tkeep;
            assign in_tstrb[98][S_AXIS_SCALAR_98_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_98_tstrb;
            assign in_tdata[98][S_AXIS_SCALAR_98_DIRECT_DMWIDTH-1:0] = s_axis_scalar_98_tdata;
            assign s_axis_scalar_98_tready = in_tready[98];
        end
        if(C_NUM_INSCALARS > 99 && S_AXIS_SCALAR_99_IS_DIRECT == 1) begin
            assign in_clk[99] = s_axis_scalar_99_aclk;
            assign in_rst[99] = s_axis_scalar_99_aresetn;
            assign in_tlast[99] = s_axis_scalar_99_tlast;
            assign in_tvalid[99] = s_axis_scalar_99_tvalid;
            assign in_tkeep[99][S_AXIS_SCALAR_99_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_99_tkeep;
            assign in_tstrb[99][S_AXIS_SCALAR_99_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_99_tstrb;
            assign in_tdata[99][S_AXIS_SCALAR_99_DIRECT_DMWIDTH-1:0] = s_axis_scalar_99_tdata;
            assign s_axis_scalar_99_tready = in_tready[99];
        end
        if(C_NUM_INSCALARS > 100 && S_AXIS_SCALAR_100_IS_DIRECT == 1) begin
            assign in_clk[100] = s_axis_scalar_100_aclk;
            assign in_rst[100] = s_axis_scalar_100_aresetn;
            assign in_tlast[100] = s_axis_scalar_100_tlast;
            assign in_tvalid[100] = s_axis_scalar_100_tvalid;
            assign in_tkeep[100][S_AXIS_SCALAR_100_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_100_tkeep;
            assign in_tstrb[100][S_AXIS_SCALAR_100_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_100_tstrb;
            assign in_tdata[100][S_AXIS_SCALAR_100_DIRECT_DMWIDTH-1:0] = s_axis_scalar_100_tdata;
            assign s_axis_scalar_100_tready = in_tready[100];
        end
        if(C_NUM_INSCALARS > 101 && S_AXIS_SCALAR_101_IS_DIRECT == 1) begin
            assign in_clk[101] = s_axis_scalar_101_aclk;
            assign in_rst[101] = s_axis_scalar_101_aresetn;
            assign in_tlast[101] = s_axis_scalar_101_tlast;
            assign in_tvalid[101] = s_axis_scalar_101_tvalid;
            assign in_tkeep[101][S_AXIS_SCALAR_101_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_101_tkeep;
            assign in_tstrb[101][S_AXIS_SCALAR_101_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_101_tstrb;
            assign in_tdata[101][S_AXIS_SCALAR_101_DIRECT_DMWIDTH-1:0] = s_axis_scalar_101_tdata;
            assign s_axis_scalar_101_tready = in_tready[101];
        end
        if(C_NUM_INSCALARS > 102 && S_AXIS_SCALAR_102_IS_DIRECT == 1) begin
            assign in_clk[102] = s_axis_scalar_102_aclk;
            assign in_rst[102] = s_axis_scalar_102_aresetn;
            assign in_tlast[102] = s_axis_scalar_102_tlast;
            assign in_tvalid[102] = s_axis_scalar_102_tvalid;
            assign in_tkeep[102][S_AXIS_SCALAR_102_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_102_tkeep;
            assign in_tstrb[102][S_AXIS_SCALAR_102_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_102_tstrb;
            assign in_tdata[102][S_AXIS_SCALAR_102_DIRECT_DMWIDTH-1:0] = s_axis_scalar_102_tdata;
            assign s_axis_scalar_102_tready = in_tready[102];
        end
        if(C_NUM_INSCALARS > 103 && S_AXIS_SCALAR_103_IS_DIRECT == 1) begin
            assign in_clk[103] = s_axis_scalar_103_aclk;
            assign in_rst[103] = s_axis_scalar_103_aresetn;
            assign in_tlast[103] = s_axis_scalar_103_tlast;
            assign in_tvalid[103] = s_axis_scalar_103_tvalid;
            assign in_tkeep[103][S_AXIS_SCALAR_103_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_103_tkeep;
            assign in_tstrb[103][S_AXIS_SCALAR_103_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_103_tstrb;
            assign in_tdata[103][S_AXIS_SCALAR_103_DIRECT_DMWIDTH-1:0] = s_axis_scalar_103_tdata;
            assign s_axis_scalar_103_tready = in_tready[103];
        end
        if(C_NUM_INSCALARS > 104 && S_AXIS_SCALAR_104_IS_DIRECT == 1) begin
            assign in_clk[104] = s_axis_scalar_104_aclk;
            assign in_rst[104] = s_axis_scalar_104_aresetn;
            assign in_tlast[104] = s_axis_scalar_104_tlast;
            assign in_tvalid[104] = s_axis_scalar_104_tvalid;
            assign in_tkeep[104][S_AXIS_SCALAR_104_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_104_tkeep;
            assign in_tstrb[104][S_AXIS_SCALAR_104_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_104_tstrb;
            assign in_tdata[104][S_AXIS_SCALAR_104_DIRECT_DMWIDTH-1:0] = s_axis_scalar_104_tdata;
            assign s_axis_scalar_104_tready = in_tready[104];
        end
        if(C_NUM_INSCALARS > 105 && S_AXIS_SCALAR_105_IS_DIRECT == 1) begin
            assign in_clk[105] = s_axis_scalar_105_aclk;
            assign in_rst[105] = s_axis_scalar_105_aresetn;
            assign in_tlast[105] = s_axis_scalar_105_tlast;
            assign in_tvalid[105] = s_axis_scalar_105_tvalid;
            assign in_tkeep[105][S_AXIS_SCALAR_105_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_105_tkeep;
            assign in_tstrb[105][S_AXIS_SCALAR_105_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_105_tstrb;
            assign in_tdata[105][S_AXIS_SCALAR_105_DIRECT_DMWIDTH-1:0] = s_axis_scalar_105_tdata;
            assign s_axis_scalar_105_tready = in_tready[105];
        end
        if(C_NUM_INSCALARS > 106 && S_AXIS_SCALAR_106_IS_DIRECT == 1) begin
            assign in_clk[106] = s_axis_scalar_106_aclk;
            assign in_rst[106] = s_axis_scalar_106_aresetn;
            assign in_tlast[106] = s_axis_scalar_106_tlast;
            assign in_tvalid[106] = s_axis_scalar_106_tvalid;
            assign in_tkeep[106][S_AXIS_SCALAR_106_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_106_tkeep;
            assign in_tstrb[106][S_AXIS_SCALAR_106_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_106_tstrb;
            assign in_tdata[106][S_AXIS_SCALAR_106_DIRECT_DMWIDTH-1:0] = s_axis_scalar_106_tdata;
            assign s_axis_scalar_106_tready = in_tready[106];
        end
        if(C_NUM_INSCALARS > 107 && S_AXIS_SCALAR_107_IS_DIRECT == 1) begin
            assign in_clk[107] = s_axis_scalar_107_aclk;
            assign in_rst[107] = s_axis_scalar_107_aresetn;
            assign in_tlast[107] = s_axis_scalar_107_tlast;
            assign in_tvalid[107] = s_axis_scalar_107_tvalid;
            assign in_tkeep[107][S_AXIS_SCALAR_107_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_107_tkeep;
            assign in_tstrb[107][S_AXIS_SCALAR_107_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_107_tstrb;
            assign in_tdata[107][S_AXIS_SCALAR_107_DIRECT_DMWIDTH-1:0] = s_axis_scalar_107_tdata;
            assign s_axis_scalar_107_tready = in_tready[107];
        end
        if(C_NUM_INSCALARS > 108 && S_AXIS_SCALAR_108_IS_DIRECT == 1) begin
            assign in_clk[108] = s_axis_scalar_108_aclk;
            assign in_rst[108] = s_axis_scalar_108_aresetn;
            assign in_tlast[108] = s_axis_scalar_108_tlast;
            assign in_tvalid[108] = s_axis_scalar_108_tvalid;
            assign in_tkeep[108][S_AXIS_SCALAR_108_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_108_tkeep;
            assign in_tstrb[108][S_AXIS_SCALAR_108_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_108_tstrb;
            assign in_tdata[108][S_AXIS_SCALAR_108_DIRECT_DMWIDTH-1:0] = s_axis_scalar_108_tdata;
            assign s_axis_scalar_108_tready = in_tready[108];
        end
        if(C_NUM_INSCALARS > 109 && S_AXIS_SCALAR_109_IS_DIRECT == 1) begin
            assign in_clk[109] = s_axis_scalar_109_aclk;
            assign in_rst[109] = s_axis_scalar_109_aresetn;
            assign in_tlast[109] = s_axis_scalar_109_tlast;
            assign in_tvalid[109] = s_axis_scalar_109_tvalid;
            assign in_tkeep[109][S_AXIS_SCALAR_109_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_109_tkeep;
            assign in_tstrb[109][S_AXIS_SCALAR_109_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_109_tstrb;
            assign in_tdata[109][S_AXIS_SCALAR_109_DIRECT_DMWIDTH-1:0] = s_axis_scalar_109_tdata;
            assign s_axis_scalar_109_tready = in_tready[109];
        end
        if(C_NUM_INSCALARS > 110 && S_AXIS_SCALAR_110_IS_DIRECT == 1) begin
            assign in_clk[110] = s_axis_scalar_110_aclk;
            assign in_rst[110] = s_axis_scalar_110_aresetn;
            assign in_tlast[110] = s_axis_scalar_110_tlast;
            assign in_tvalid[110] = s_axis_scalar_110_tvalid;
            assign in_tkeep[110][S_AXIS_SCALAR_110_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_110_tkeep;
            assign in_tstrb[110][S_AXIS_SCALAR_110_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_110_tstrb;
            assign in_tdata[110][S_AXIS_SCALAR_110_DIRECT_DMWIDTH-1:0] = s_axis_scalar_110_tdata;
            assign s_axis_scalar_110_tready = in_tready[110];
        end
        if(C_NUM_INSCALARS > 111 && S_AXIS_SCALAR_111_IS_DIRECT == 1) begin
            assign in_clk[111] = s_axis_scalar_111_aclk;
            assign in_rst[111] = s_axis_scalar_111_aresetn;
            assign in_tlast[111] = s_axis_scalar_111_tlast;
            assign in_tvalid[111] = s_axis_scalar_111_tvalid;
            assign in_tkeep[111][S_AXIS_SCALAR_111_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_111_tkeep;
            assign in_tstrb[111][S_AXIS_SCALAR_111_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_111_tstrb;
            assign in_tdata[111][S_AXIS_SCALAR_111_DIRECT_DMWIDTH-1:0] = s_axis_scalar_111_tdata;
            assign s_axis_scalar_111_tready = in_tready[111];
        end
        if(C_NUM_INSCALARS > 112 && S_AXIS_SCALAR_112_IS_DIRECT == 1) begin
            assign in_clk[112] = s_axis_scalar_112_aclk;
            assign in_rst[112] = s_axis_scalar_112_aresetn;
            assign in_tlast[112] = s_axis_scalar_112_tlast;
            assign in_tvalid[112] = s_axis_scalar_112_tvalid;
            assign in_tkeep[112][S_AXIS_SCALAR_112_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_112_tkeep;
            assign in_tstrb[112][S_AXIS_SCALAR_112_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_112_tstrb;
            assign in_tdata[112][S_AXIS_SCALAR_112_DIRECT_DMWIDTH-1:0] = s_axis_scalar_112_tdata;
            assign s_axis_scalar_112_tready = in_tready[112];
        end
        if(C_NUM_INSCALARS > 113 && S_AXIS_SCALAR_113_IS_DIRECT == 1) begin
            assign in_clk[113] = s_axis_scalar_113_aclk;
            assign in_rst[113] = s_axis_scalar_113_aresetn;
            assign in_tlast[113] = s_axis_scalar_113_tlast;
            assign in_tvalid[113] = s_axis_scalar_113_tvalid;
            assign in_tkeep[113][S_AXIS_SCALAR_113_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_113_tkeep;
            assign in_tstrb[113][S_AXIS_SCALAR_113_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_113_tstrb;
            assign in_tdata[113][S_AXIS_SCALAR_113_DIRECT_DMWIDTH-1:0] = s_axis_scalar_113_tdata;
            assign s_axis_scalar_113_tready = in_tready[113];
        end
        if(C_NUM_INSCALARS > 114 && S_AXIS_SCALAR_114_IS_DIRECT == 1) begin
            assign in_clk[114] = s_axis_scalar_114_aclk;
            assign in_rst[114] = s_axis_scalar_114_aresetn;
            assign in_tlast[114] = s_axis_scalar_114_tlast;
            assign in_tvalid[114] = s_axis_scalar_114_tvalid;
            assign in_tkeep[114][S_AXIS_SCALAR_114_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_114_tkeep;
            assign in_tstrb[114][S_AXIS_SCALAR_114_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_114_tstrb;
            assign in_tdata[114][S_AXIS_SCALAR_114_DIRECT_DMWIDTH-1:0] = s_axis_scalar_114_tdata;
            assign s_axis_scalar_114_tready = in_tready[114];
        end
        if(C_NUM_INSCALARS > 115 && S_AXIS_SCALAR_115_IS_DIRECT == 1) begin
            assign in_clk[115] = s_axis_scalar_115_aclk;
            assign in_rst[115] = s_axis_scalar_115_aresetn;
            assign in_tlast[115] = s_axis_scalar_115_tlast;
            assign in_tvalid[115] = s_axis_scalar_115_tvalid;
            assign in_tkeep[115][S_AXIS_SCALAR_115_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_115_tkeep;
            assign in_tstrb[115][S_AXIS_SCALAR_115_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_115_tstrb;
            assign in_tdata[115][S_AXIS_SCALAR_115_DIRECT_DMWIDTH-1:0] = s_axis_scalar_115_tdata;
            assign s_axis_scalar_115_tready = in_tready[115];
        end
        if(C_NUM_INSCALARS > 116 && S_AXIS_SCALAR_116_IS_DIRECT == 1) begin
            assign in_clk[116] = s_axis_scalar_116_aclk;
            assign in_rst[116] = s_axis_scalar_116_aresetn;
            assign in_tlast[116] = s_axis_scalar_116_tlast;
            assign in_tvalid[116] = s_axis_scalar_116_tvalid;
            assign in_tkeep[116][S_AXIS_SCALAR_116_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_116_tkeep;
            assign in_tstrb[116][S_AXIS_SCALAR_116_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_116_tstrb;
            assign in_tdata[116][S_AXIS_SCALAR_116_DIRECT_DMWIDTH-1:0] = s_axis_scalar_116_tdata;
            assign s_axis_scalar_116_tready = in_tready[116];
        end
        if(C_NUM_INSCALARS > 117 && S_AXIS_SCALAR_117_IS_DIRECT == 1) begin
            assign in_clk[117] = s_axis_scalar_117_aclk;
            assign in_rst[117] = s_axis_scalar_117_aresetn;
            assign in_tlast[117] = s_axis_scalar_117_tlast;
            assign in_tvalid[117] = s_axis_scalar_117_tvalid;
            assign in_tkeep[117][S_AXIS_SCALAR_117_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_117_tkeep;
            assign in_tstrb[117][S_AXIS_SCALAR_117_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_117_tstrb;
            assign in_tdata[117][S_AXIS_SCALAR_117_DIRECT_DMWIDTH-1:0] = s_axis_scalar_117_tdata;
            assign s_axis_scalar_117_tready = in_tready[117];
        end
        if(C_NUM_INSCALARS > 118 && S_AXIS_SCALAR_118_IS_DIRECT == 1) begin
            assign in_clk[118] = s_axis_scalar_118_aclk;
            assign in_rst[118] = s_axis_scalar_118_aresetn;
            assign in_tlast[118] = s_axis_scalar_118_tlast;
            assign in_tvalid[118] = s_axis_scalar_118_tvalid;
            assign in_tkeep[118][S_AXIS_SCALAR_118_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_118_tkeep;
            assign in_tstrb[118][S_AXIS_SCALAR_118_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_118_tstrb;
            assign in_tdata[118][S_AXIS_SCALAR_118_DIRECT_DMWIDTH-1:0] = s_axis_scalar_118_tdata;
            assign s_axis_scalar_118_tready = in_tready[118];
        end
        if(C_NUM_INSCALARS > 119 && S_AXIS_SCALAR_119_IS_DIRECT == 1) begin
            assign in_clk[119] = s_axis_scalar_119_aclk;
            assign in_rst[119] = s_axis_scalar_119_aresetn;
            assign in_tlast[119] = s_axis_scalar_119_tlast;
            assign in_tvalid[119] = s_axis_scalar_119_tvalid;
            assign in_tkeep[119][S_AXIS_SCALAR_119_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_119_tkeep;
            assign in_tstrb[119][S_AXIS_SCALAR_119_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_119_tstrb;
            assign in_tdata[119][S_AXIS_SCALAR_119_DIRECT_DMWIDTH-1:0] = s_axis_scalar_119_tdata;
            assign s_axis_scalar_119_tready = in_tready[119];
        end
        if(C_NUM_INSCALARS > 120 && S_AXIS_SCALAR_120_IS_DIRECT == 1) begin
            assign in_clk[120] = s_axis_scalar_120_aclk;
            assign in_rst[120] = s_axis_scalar_120_aresetn;
            assign in_tlast[120] = s_axis_scalar_120_tlast;
            assign in_tvalid[120] = s_axis_scalar_120_tvalid;
            assign in_tkeep[120][S_AXIS_SCALAR_120_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_120_tkeep;
            assign in_tstrb[120][S_AXIS_SCALAR_120_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_120_tstrb;
            assign in_tdata[120][S_AXIS_SCALAR_120_DIRECT_DMWIDTH-1:0] = s_axis_scalar_120_tdata;
            assign s_axis_scalar_120_tready = in_tready[120];
        end
        if(C_NUM_INSCALARS > 121 && S_AXIS_SCALAR_121_IS_DIRECT == 1) begin
            assign in_clk[121] = s_axis_scalar_121_aclk;
            assign in_rst[121] = s_axis_scalar_121_aresetn;
            assign in_tlast[121] = s_axis_scalar_121_tlast;
            assign in_tvalid[121] = s_axis_scalar_121_tvalid;
            assign in_tkeep[121][S_AXIS_SCALAR_121_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_121_tkeep;
            assign in_tstrb[121][S_AXIS_SCALAR_121_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_121_tstrb;
            assign in_tdata[121][S_AXIS_SCALAR_121_DIRECT_DMWIDTH-1:0] = s_axis_scalar_121_tdata;
            assign s_axis_scalar_121_tready = in_tready[121];
        end
        if(C_NUM_INSCALARS > 122 && S_AXIS_SCALAR_122_IS_DIRECT == 1) begin
            assign in_clk[122] = s_axis_scalar_122_aclk;
            assign in_rst[122] = s_axis_scalar_122_aresetn;
            assign in_tlast[122] = s_axis_scalar_122_tlast;
            assign in_tvalid[122] = s_axis_scalar_122_tvalid;
            assign in_tkeep[122][S_AXIS_SCALAR_122_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_122_tkeep;
            assign in_tstrb[122][S_AXIS_SCALAR_122_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_122_tstrb;
            assign in_tdata[122][S_AXIS_SCALAR_122_DIRECT_DMWIDTH-1:0] = s_axis_scalar_122_tdata;
            assign s_axis_scalar_122_tready = in_tready[122];
        end
        if(C_NUM_INSCALARS > 123 && S_AXIS_SCALAR_123_IS_DIRECT == 1) begin
            assign in_clk[123] = s_axis_scalar_123_aclk;
            assign in_rst[123] = s_axis_scalar_123_aresetn;
            assign in_tlast[123] = s_axis_scalar_123_tlast;
            assign in_tvalid[123] = s_axis_scalar_123_tvalid;
            assign in_tkeep[123][S_AXIS_SCALAR_123_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_123_tkeep;
            assign in_tstrb[123][S_AXIS_SCALAR_123_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_123_tstrb;
            assign in_tdata[123][S_AXIS_SCALAR_123_DIRECT_DMWIDTH-1:0] = s_axis_scalar_123_tdata;
            assign s_axis_scalar_123_tready = in_tready[123];
        end
        if(C_NUM_INSCALARS > 124 && S_AXIS_SCALAR_124_IS_DIRECT == 1) begin
            assign in_clk[124] = s_axis_scalar_124_aclk;
            assign in_rst[124] = s_axis_scalar_124_aresetn;
            assign in_tlast[124] = s_axis_scalar_124_tlast;
            assign in_tvalid[124] = s_axis_scalar_124_tvalid;
            assign in_tkeep[124][S_AXIS_SCALAR_124_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_124_tkeep;
            assign in_tstrb[124][S_AXIS_SCALAR_124_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_124_tstrb;
            assign in_tdata[124][S_AXIS_SCALAR_124_DIRECT_DMWIDTH-1:0] = s_axis_scalar_124_tdata;
            assign s_axis_scalar_124_tready = in_tready[124];
        end
        if(C_NUM_INSCALARS > 125 && S_AXIS_SCALAR_125_IS_DIRECT == 1) begin
            assign in_clk[125] = s_axis_scalar_125_aclk;
            assign in_rst[125] = s_axis_scalar_125_aresetn;
            assign in_tlast[125] = s_axis_scalar_125_tlast;
            assign in_tvalid[125] = s_axis_scalar_125_tvalid;
            assign in_tkeep[125][S_AXIS_SCALAR_125_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_125_tkeep;
            assign in_tstrb[125][S_AXIS_SCALAR_125_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_125_tstrb;
            assign in_tdata[125][S_AXIS_SCALAR_125_DIRECT_DMWIDTH-1:0] = s_axis_scalar_125_tdata;
            assign s_axis_scalar_125_tready = in_tready[125];
        end
        if(C_NUM_INSCALARS > 126 && S_AXIS_SCALAR_126_IS_DIRECT == 1) begin
            assign in_clk[126] = s_axis_scalar_126_aclk;
            assign in_rst[126] = s_axis_scalar_126_aresetn;
            assign in_tlast[126] = s_axis_scalar_126_tlast;
            assign in_tvalid[126] = s_axis_scalar_126_tvalid;
            assign in_tkeep[126][S_AXIS_SCALAR_126_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_126_tkeep;
            assign in_tstrb[126][S_AXIS_SCALAR_126_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_126_tstrb;
            assign in_tdata[126][S_AXIS_SCALAR_126_DIRECT_DMWIDTH-1:0] = s_axis_scalar_126_tdata;
            assign s_axis_scalar_126_tready = in_tready[126];
        end
        if(C_NUM_INSCALARS > 127 && S_AXIS_SCALAR_127_IS_DIRECT == 1) begin
            assign in_clk[127] = s_axis_scalar_127_aclk;
            assign in_rst[127] = s_axis_scalar_127_aresetn;
            assign in_tlast[127] = s_axis_scalar_127_tlast;
            assign in_tvalid[127] = s_axis_scalar_127_tvalid;
            assign in_tkeep[127][S_AXIS_SCALAR_127_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_127_tkeep;
            assign in_tstrb[127][S_AXIS_SCALAR_127_DIRECT_DMWIDTH/8-1:0] = s_axis_scalar_127_tstrb;
            assign in_tdata[127][S_AXIS_SCALAR_127_DIRECT_DMWIDTH-1:0] = s_axis_scalar_127_tdata;
            assign s_axis_scalar_127_tready = in_tready[127];
        end

        if(C_NUM_OUTSCALARS > 0 && M_AXIS_SCALAR_0_IS_DIRECT == 1) begin
            assign out_clk[0] = m_axis_scalar_0_aclk;
            assign out_rst[0] = m_axis_scalar_0_aresetn;
            assign m_axis_scalar_0_tlast = out_dwconv_tlast[0];
            assign m_axis_scalar_0_tvalid = out_dwconv_tvalid[0];
            assign m_axis_scalar_0_tkeep = out_dwconv_tkeep[0][S_AXIS_SCALAR_0_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_0_tstrb = out_dwconv_tstrb[0][S_AXIS_SCALAR_0_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_0_tdata = out_dwconv_tdata[0][S_AXIS_SCALAR_0_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[0] = m_axis_scalar_0_tready;
        end
        if(C_NUM_OUTSCALARS > 1 && M_AXIS_SCALAR_1_IS_DIRECT == 1) begin
            assign out_clk[1] = m_axis_scalar_1_aclk;
            assign out_rst[1] = m_axis_scalar_1_aresetn;
            assign m_axis_scalar_1_tlast = out_dwconv_tlast[1];
            assign m_axis_scalar_1_tvalid = out_dwconv_tvalid[1];
            assign m_axis_scalar_1_tkeep = out_dwconv_tkeep[1][S_AXIS_SCALAR_1_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_1_tstrb = out_dwconv_tstrb[1][S_AXIS_SCALAR_1_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_1_tdata = out_dwconv_tdata[1][S_AXIS_SCALAR_1_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[1] = m_axis_scalar_1_tready;
        end
        if(C_NUM_OUTSCALARS > 2 && M_AXIS_SCALAR_2_IS_DIRECT == 1) begin
            assign out_clk[2] = m_axis_scalar_2_aclk;
            assign out_rst[2] = m_axis_scalar_2_aresetn;
            assign m_axis_scalar_2_tlast = out_dwconv_tlast[2];
            assign m_axis_scalar_2_tvalid = out_dwconv_tvalid[2];
            assign m_axis_scalar_2_tkeep = out_dwconv_tkeep[2][S_AXIS_SCALAR_2_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_2_tstrb = out_dwconv_tstrb[2][S_AXIS_SCALAR_2_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_2_tdata = out_dwconv_tdata[2][S_AXIS_SCALAR_2_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[2] = m_axis_scalar_2_tready;
        end
        if(C_NUM_OUTSCALARS > 3 && M_AXIS_SCALAR_3_IS_DIRECT == 1) begin
            assign out_clk[3] = m_axis_scalar_3_aclk;
            assign out_rst[3] = m_axis_scalar_3_aresetn;
            assign m_axis_scalar_3_tlast = out_dwconv_tlast[3];
            assign m_axis_scalar_3_tvalid = out_dwconv_tvalid[3];
            assign m_axis_scalar_3_tkeep = out_dwconv_tkeep[3][S_AXIS_SCALAR_3_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_3_tstrb = out_dwconv_tstrb[3][S_AXIS_SCALAR_3_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_3_tdata = out_dwconv_tdata[3][S_AXIS_SCALAR_3_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[3] = m_axis_scalar_3_tready;
        end
        if(C_NUM_OUTSCALARS > 4 && M_AXIS_SCALAR_4_IS_DIRECT == 1) begin
            assign out_clk[4] = m_axis_scalar_4_aclk;
            assign out_rst[4] = m_axis_scalar_4_aresetn;
            assign m_axis_scalar_4_tlast = out_dwconv_tlast[4];
            assign m_axis_scalar_4_tvalid = out_dwconv_tvalid[4];
            assign m_axis_scalar_4_tkeep = out_dwconv_tkeep[4][S_AXIS_SCALAR_4_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_4_tstrb = out_dwconv_tstrb[4][S_AXIS_SCALAR_4_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_4_tdata = out_dwconv_tdata[4][S_AXIS_SCALAR_4_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[4] = m_axis_scalar_4_tready;
        end
        if(C_NUM_OUTSCALARS > 5 && M_AXIS_SCALAR_5_IS_DIRECT == 1) begin
            assign out_clk[5] = m_axis_scalar_5_aclk;
            assign out_rst[5] = m_axis_scalar_5_aresetn;
            assign m_axis_scalar_5_tlast = out_dwconv_tlast[5];
            assign m_axis_scalar_5_tvalid = out_dwconv_tvalid[5];
            assign m_axis_scalar_5_tkeep = out_dwconv_tkeep[5][S_AXIS_SCALAR_5_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_5_tstrb = out_dwconv_tstrb[5][S_AXIS_SCALAR_5_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_5_tdata = out_dwconv_tdata[5][S_AXIS_SCALAR_5_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[5] = m_axis_scalar_5_tready;
        end
        if(C_NUM_OUTSCALARS > 6 && M_AXIS_SCALAR_6_IS_DIRECT == 1) begin
            assign out_clk[6] = m_axis_scalar_6_aclk;
            assign out_rst[6] = m_axis_scalar_6_aresetn;
            assign m_axis_scalar_6_tlast = out_dwconv_tlast[6];
            assign m_axis_scalar_6_tvalid = out_dwconv_tvalid[6];
            assign m_axis_scalar_6_tkeep = out_dwconv_tkeep[6][S_AXIS_SCALAR_6_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_6_tstrb = out_dwconv_tstrb[6][S_AXIS_SCALAR_6_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_6_tdata = out_dwconv_tdata[6][S_AXIS_SCALAR_6_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[6] = m_axis_scalar_6_tready;
        end
        if(C_NUM_OUTSCALARS > 7 && M_AXIS_SCALAR_7_IS_DIRECT == 1) begin
            assign out_clk[7] = m_axis_scalar_7_aclk;
            assign out_rst[7] = m_axis_scalar_7_aresetn;
            assign m_axis_scalar_7_tlast = out_dwconv_tlast[7];
            assign m_axis_scalar_7_tvalid = out_dwconv_tvalid[7];
            assign m_axis_scalar_7_tkeep = out_dwconv_tkeep[7][S_AXIS_SCALAR_7_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_7_tstrb = out_dwconv_tstrb[7][S_AXIS_SCALAR_7_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_7_tdata = out_dwconv_tdata[7][S_AXIS_SCALAR_7_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[7] = m_axis_scalar_7_tready;
        end
        if(C_NUM_OUTSCALARS > 8 && M_AXIS_SCALAR_8_IS_DIRECT == 1) begin
            assign out_clk[8] = m_axis_scalar_8_aclk;
            assign out_rst[8] = m_axis_scalar_8_aresetn;
            assign m_axis_scalar_8_tlast = out_dwconv_tlast[8];
            assign m_axis_scalar_8_tvalid = out_dwconv_tvalid[8];
            assign m_axis_scalar_8_tkeep = out_dwconv_tkeep[8][S_AXIS_SCALAR_8_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_8_tstrb = out_dwconv_tstrb[8][S_AXIS_SCALAR_8_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_8_tdata = out_dwconv_tdata[8][S_AXIS_SCALAR_8_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[8] = m_axis_scalar_8_tready;
        end
        if(C_NUM_OUTSCALARS > 9 && M_AXIS_SCALAR_9_IS_DIRECT == 1) begin
            assign out_clk[9] = m_axis_scalar_9_aclk;
            assign out_rst[9] = m_axis_scalar_9_aresetn;
            assign m_axis_scalar_9_tlast = out_dwconv_tlast[9];
            assign m_axis_scalar_9_tvalid = out_dwconv_tvalid[9];
            assign m_axis_scalar_9_tkeep = out_dwconv_tkeep[9][S_AXIS_SCALAR_9_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_9_tstrb = out_dwconv_tstrb[9][S_AXIS_SCALAR_9_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_9_tdata = out_dwconv_tdata[9][S_AXIS_SCALAR_9_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[9] = m_axis_scalar_9_tready;
        end
        if(C_NUM_OUTSCALARS > 10 && M_AXIS_SCALAR_10_IS_DIRECT == 1) begin
            assign out_clk[10] = m_axis_scalar_10_aclk;
            assign out_rst[10] = m_axis_scalar_10_aresetn;
            assign m_axis_scalar_10_tlast = out_dwconv_tlast[10];
            assign m_axis_scalar_10_tvalid = out_dwconv_tvalid[10];
            assign m_axis_scalar_10_tkeep = out_dwconv_tkeep[10][S_AXIS_SCALAR_10_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_10_tstrb = out_dwconv_tstrb[10][S_AXIS_SCALAR_10_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_10_tdata = out_dwconv_tdata[10][S_AXIS_SCALAR_10_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[10] = m_axis_scalar_10_tready;
        end
        if(C_NUM_OUTSCALARS > 11 && M_AXIS_SCALAR_11_IS_DIRECT == 1) begin
            assign out_clk[11] = m_axis_scalar_11_aclk;
            assign out_rst[11] = m_axis_scalar_11_aresetn;
            assign m_axis_scalar_11_tlast = out_dwconv_tlast[11];
            assign m_axis_scalar_11_tvalid = out_dwconv_tvalid[11];
            assign m_axis_scalar_11_tkeep = out_dwconv_tkeep[11][S_AXIS_SCALAR_11_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_11_tstrb = out_dwconv_tstrb[11][S_AXIS_SCALAR_11_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_11_tdata = out_dwconv_tdata[11][S_AXIS_SCALAR_11_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[11] = m_axis_scalar_11_tready;
        end
        if(C_NUM_OUTSCALARS > 12 && M_AXIS_SCALAR_12_IS_DIRECT == 1) begin
            assign out_clk[12] = m_axis_scalar_12_aclk;
            assign out_rst[12] = m_axis_scalar_12_aresetn;
            assign m_axis_scalar_12_tlast = out_dwconv_tlast[12];
            assign m_axis_scalar_12_tvalid = out_dwconv_tvalid[12];
            assign m_axis_scalar_12_tkeep = out_dwconv_tkeep[12][S_AXIS_SCALAR_12_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_12_tstrb = out_dwconv_tstrb[12][S_AXIS_SCALAR_12_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_12_tdata = out_dwconv_tdata[12][S_AXIS_SCALAR_12_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[12] = m_axis_scalar_12_tready;
        end
        if(C_NUM_OUTSCALARS > 13 && M_AXIS_SCALAR_13_IS_DIRECT == 1) begin
            assign out_clk[13] = m_axis_scalar_13_aclk;
            assign out_rst[13] = m_axis_scalar_13_aresetn;
            assign m_axis_scalar_13_tlast = out_dwconv_tlast[13];
            assign m_axis_scalar_13_tvalid = out_dwconv_tvalid[13];
            assign m_axis_scalar_13_tkeep = out_dwconv_tkeep[13][S_AXIS_SCALAR_13_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_13_tstrb = out_dwconv_tstrb[13][S_AXIS_SCALAR_13_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_13_tdata = out_dwconv_tdata[13][S_AXIS_SCALAR_13_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[13] = m_axis_scalar_13_tready;
        end
        if(C_NUM_OUTSCALARS > 14 && M_AXIS_SCALAR_14_IS_DIRECT == 1) begin
            assign out_clk[14] = m_axis_scalar_14_aclk;
            assign out_rst[14] = m_axis_scalar_14_aresetn;
            assign m_axis_scalar_14_tlast = out_dwconv_tlast[14];
            assign m_axis_scalar_14_tvalid = out_dwconv_tvalid[14];
            assign m_axis_scalar_14_tkeep = out_dwconv_tkeep[14][S_AXIS_SCALAR_14_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_14_tstrb = out_dwconv_tstrb[14][S_AXIS_SCALAR_14_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_14_tdata = out_dwconv_tdata[14][S_AXIS_SCALAR_14_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[14] = m_axis_scalar_14_tready;
        end
        if(C_NUM_OUTSCALARS > 15 && M_AXIS_SCALAR_15_IS_DIRECT == 1) begin
            assign out_clk[15] = m_axis_scalar_15_aclk;
            assign out_rst[15] = m_axis_scalar_15_aresetn;
            assign m_axis_scalar_15_tlast = out_dwconv_tlast[15];
            assign m_axis_scalar_15_tvalid = out_dwconv_tvalid[15];
            assign m_axis_scalar_15_tkeep = out_dwconv_tkeep[15][S_AXIS_SCALAR_15_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_15_tstrb = out_dwconv_tstrb[15][S_AXIS_SCALAR_15_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_15_tdata = out_dwconv_tdata[15][S_AXIS_SCALAR_15_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[15] = m_axis_scalar_15_tready;
        end
        if(C_NUM_OUTSCALARS > 16 && M_AXIS_SCALAR_16_IS_DIRECT == 1) begin
            assign out_clk[16] = m_axis_scalar_16_aclk;
            assign out_rst[16] = m_axis_scalar_16_aresetn;
            assign m_axis_scalar_16_tlast = out_dwconv_tlast[16];
            assign m_axis_scalar_16_tvalid = out_dwconv_tvalid[16];
            assign m_axis_scalar_16_tkeep = out_dwconv_tkeep[16][S_AXIS_SCALAR_16_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_16_tstrb = out_dwconv_tstrb[16][S_AXIS_SCALAR_16_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_16_tdata = out_dwconv_tdata[16][S_AXIS_SCALAR_16_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[16] = m_axis_scalar_16_tready;
        end
        if(C_NUM_OUTSCALARS > 17 && M_AXIS_SCALAR_17_IS_DIRECT == 1) begin
            assign out_clk[17] = m_axis_scalar_17_aclk;
            assign out_rst[17] = m_axis_scalar_17_aresetn;
            assign m_axis_scalar_17_tlast = out_dwconv_tlast[17];
            assign m_axis_scalar_17_tvalid = out_dwconv_tvalid[17];
            assign m_axis_scalar_17_tkeep = out_dwconv_tkeep[17][S_AXIS_SCALAR_17_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_17_tstrb = out_dwconv_tstrb[17][S_AXIS_SCALAR_17_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_17_tdata = out_dwconv_tdata[17][S_AXIS_SCALAR_17_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[17] = m_axis_scalar_17_tready;
        end
        if(C_NUM_OUTSCALARS > 18 && M_AXIS_SCALAR_18_IS_DIRECT == 1) begin
            assign out_clk[18] = m_axis_scalar_18_aclk;
            assign out_rst[18] = m_axis_scalar_18_aresetn;
            assign m_axis_scalar_18_tlast = out_dwconv_tlast[18];
            assign m_axis_scalar_18_tvalid = out_dwconv_tvalid[18];
            assign m_axis_scalar_18_tkeep = out_dwconv_tkeep[18][S_AXIS_SCALAR_18_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_18_tstrb = out_dwconv_tstrb[18][S_AXIS_SCALAR_18_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_18_tdata = out_dwconv_tdata[18][S_AXIS_SCALAR_18_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[18] = m_axis_scalar_18_tready;
        end
        if(C_NUM_OUTSCALARS > 19 && M_AXIS_SCALAR_19_IS_DIRECT == 1) begin
            assign out_clk[19] = m_axis_scalar_19_aclk;
            assign out_rst[19] = m_axis_scalar_19_aresetn;
            assign m_axis_scalar_19_tlast = out_dwconv_tlast[19];
            assign m_axis_scalar_19_tvalid = out_dwconv_tvalid[19];
            assign m_axis_scalar_19_tkeep = out_dwconv_tkeep[19][S_AXIS_SCALAR_19_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_19_tstrb = out_dwconv_tstrb[19][S_AXIS_SCALAR_19_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_19_tdata = out_dwconv_tdata[19][S_AXIS_SCALAR_19_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[19] = m_axis_scalar_19_tready;
        end
        if(C_NUM_OUTSCALARS > 20 && M_AXIS_SCALAR_20_IS_DIRECT == 1) begin
            assign out_clk[20] = m_axis_scalar_20_aclk;
            assign out_rst[20] = m_axis_scalar_20_aresetn;
            assign m_axis_scalar_20_tlast = out_dwconv_tlast[20];
            assign m_axis_scalar_20_tvalid = out_dwconv_tvalid[20];
            assign m_axis_scalar_20_tkeep = out_dwconv_tkeep[20][S_AXIS_SCALAR_20_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_20_tstrb = out_dwconv_tstrb[20][S_AXIS_SCALAR_20_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_20_tdata = out_dwconv_tdata[20][S_AXIS_SCALAR_20_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[20] = m_axis_scalar_20_tready;
        end
        if(C_NUM_OUTSCALARS > 21 && M_AXIS_SCALAR_21_IS_DIRECT == 1) begin
            assign out_clk[21] = m_axis_scalar_21_aclk;
            assign out_rst[21] = m_axis_scalar_21_aresetn;
            assign m_axis_scalar_21_tlast = out_dwconv_tlast[21];
            assign m_axis_scalar_21_tvalid = out_dwconv_tvalid[21];
            assign m_axis_scalar_21_tkeep = out_dwconv_tkeep[21][S_AXIS_SCALAR_21_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_21_tstrb = out_dwconv_tstrb[21][S_AXIS_SCALAR_21_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_21_tdata = out_dwconv_tdata[21][S_AXIS_SCALAR_21_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[21] = m_axis_scalar_21_tready;
        end
        if(C_NUM_OUTSCALARS > 22 && M_AXIS_SCALAR_22_IS_DIRECT == 1) begin
            assign out_clk[22] = m_axis_scalar_22_aclk;
            assign out_rst[22] = m_axis_scalar_22_aresetn;
            assign m_axis_scalar_22_tlast = out_dwconv_tlast[22];
            assign m_axis_scalar_22_tvalid = out_dwconv_tvalid[22];
            assign m_axis_scalar_22_tkeep = out_dwconv_tkeep[22][S_AXIS_SCALAR_22_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_22_tstrb = out_dwconv_tstrb[22][S_AXIS_SCALAR_22_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_22_tdata = out_dwconv_tdata[22][S_AXIS_SCALAR_22_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[22] = m_axis_scalar_22_tready;
        end
        if(C_NUM_OUTSCALARS > 23 && M_AXIS_SCALAR_23_IS_DIRECT == 1) begin
            assign out_clk[23] = m_axis_scalar_23_aclk;
            assign out_rst[23] = m_axis_scalar_23_aresetn;
            assign m_axis_scalar_23_tlast = out_dwconv_tlast[23];
            assign m_axis_scalar_23_tvalid = out_dwconv_tvalid[23];
            assign m_axis_scalar_23_tkeep = out_dwconv_tkeep[23][S_AXIS_SCALAR_23_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_23_tstrb = out_dwconv_tstrb[23][S_AXIS_SCALAR_23_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_23_tdata = out_dwconv_tdata[23][S_AXIS_SCALAR_23_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[23] = m_axis_scalar_23_tready;
        end
        if(C_NUM_OUTSCALARS > 24 && M_AXIS_SCALAR_24_IS_DIRECT == 1) begin
            assign out_clk[24] = m_axis_scalar_24_aclk;
            assign out_rst[24] = m_axis_scalar_24_aresetn;
            assign m_axis_scalar_24_tlast = out_dwconv_tlast[24];
            assign m_axis_scalar_24_tvalid = out_dwconv_tvalid[24];
            assign m_axis_scalar_24_tkeep = out_dwconv_tkeep[24][S_AXIS_SCALAR_24_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_24_tstrb = out_dwconv_tstrb[24][S_AXIS_SCALAR_24_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_24_tdata = out_dwconv_tdata[24][S_AXIS_SCALAR_24_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[24] = m_axis_scalar_24_tready;
        end
        if(C_NUM_OUTSCALARS > 25 && M_AXIS_SCALAR_25_IS_DIRECT == 1) begin
            assign out_clk[25] = m_axis_scalar_25_aclk;
            assign out_rst[25] = m_axis_scalar_25_aresetn;
            assign m_axis_scalar_25_tlast = out_dwconv_tlast[25];
            assign m_axis_scalar_25_tvalid = out_dwconv_tvalid[25];
            assign m_axis_scalar_25_tkeep = out_dwconv_tkeep[25][S_AXIS_SCALAR_25_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_25_tstrb = out_dwconv_tstrb[25][S_AXIS_SCALAR_25_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_25_tdata = out_dwconv_tdata[25][S_AXIS_SCALAR_25_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[25] = m_axis_scalar_25_tready;
        end
        if(C_NUM_OUTSCALARS > 26 && M_AXIS_SCALAR_26_IS_DIRECT == 1) begin
            assign out_clk[26] = m_axis_scalar_26_aclk;
            assign out_rst[26] = m_axis_scalar_26_aresetn;
            assign m_axis_scalar_26_tlast = out_dwconv_tlast[26];
            assign m_axis_scalar_26_tvalid = out_dwconv_tvalid[26];
            assign m_axis_scalar_26_tkeep = out_dwconv_tkeep[26][S_AXIS_SCALAR_26_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_26_tstrb = out_dwconv_tstrb[26][S_AXIS_SCALAR_26_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_26_tdata = out_dwconv_tdata[26][S_AXIS_SCALAR_26_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[26] = m_axis_scalar_26_tready;
        end
        if(C_NUM_OUTSCALARS > 27 && M_AXIS_SCALAR_27_IS_DIRECT == 1) begin
            assign out_clk[27] = m_axis_scalar_27_aclk;
            assign out_rst[27] = m_axis_scalar_27_aresetn;
            assign m_axis_scalar_27_tlast = out_dwconv_tlast[27];
            assign m_axis_scalar_27_tvalid = out_dwconv_tvalid[27];
            assign m_axis_scalar_27_tkeep = out_dwconv_tkeep[27][S_AXIS_SCALAR_27_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_27_tstrb = out_dwconv_tstrb[27][S_AXIS_SCALAR_27_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_27_tdata = out_dwconv_tdata[27][S_AXIS_SCALAR_27_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[27] = m_axis_scalar_27_tready;
        end
        if(C_NUM_OUTSCALARS > 28 && M_AXIS_SCALAR_28_IS_DIRECT == 1) begin
            assign out_clk[28] = m_axis_scalar_28_aclk;
            assign out_rst[28] = m_axis_scalar_28_aresetn;
            assign m_axis_scalar_28_tlast = out_dwconv_tlast[28];
            assign m_axis_scalar_28_tvalid = out_dwconv_tvalid[28];
            assign m_axis_scalar_28_tkeep = out_dwconv_tkeep[28][S_AXIS_SCALAR_28_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_28_tstrb = out_dwconv_tstrb[28][S_AXIS_SCALAR_28_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_28_tdata = out_dwconv_tdata[28][S_AXIS_SCALAR_28_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[28] = m_axis_scalar_28_tready;
        end
        if(C_NUM_OUTSCALARS > 29 && M_AXIS_SCALAR_29_IS_DIRECT == 1) begin
            assign out_clk[29] = m_axis_scalar_29_aclk;
            assign out_rst[29] = m_axis_scalar_29_aresetn;
            assign m_axis_scalar_29_tlast = out_dwconv_tlast[29];
            assign m_axis_scalar_29_tvalid = out_dwconv_tvalid[29];
            assign m_axis_scalar_29_tkeep = out_dwconv_tkeep[29][S_AXIS_SCALAR_29_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_29_tstrb = out_dwconv_tstrb[29][S_AXIS_SCALAR_29_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_29_tdata = out_dwconv_tdata[29][S_AXIS_SCALAR_29_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[29] = m_axis_scalar_29_tready;
        end
        if(C_NUM_OUTSCALARS > 30 && M_AXIS_SCALAR_30_IS_DIRECT == 1) begin
            assign out_clk[30] = m_axis_scalar_30_aclk;
            assign out_rst[30] = m_axis_scalar_30_aresetn;
            assign m_axis_scalar_30_tlast = out_dwconv_tlast[30];
            assign m_axis_scalar_30_tvalid = out_dwconv_tvalid[30];
            assign m_axis_scalar_30_tkeep = out_dwconv_tkeep[30][S_AXIS_SCALAR_30_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_30_tstrb = out_dwconv_tstrb[30][S_AXIS_SCALAR_30_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_30_tdata = out_dwconv_tdata[30][S_AXIS_SCALAR_30_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[30] = m_axis_scalar_30_tready;
        end
        if(C_NUM_OUTSCALARS > 31 && M_AXIS_SCALAR_31_IS_DIRECT == 1) begin
            assign out_clk[31] = m_axis_scalar_31_aclk;
            assign out_rst[31] = m_axis_scalar_31_aresetn;
            assign m_axis_scalar_31_tlast = out_dwconv_tlast[31];
            assign m_axis_scalar_31_tvalid = out_dwconv_tvalid[31];
            assign m_axis_scalar_31_tkeep = out_dwconv_tkeep[31][S_AXIS_SCALAR_31_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_31_tstrb = out_dwconv_tstrb[31][S_AXIS_SCALAR_31_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_31_tdata = out_dwconv_tdata[31][S_AXIS_SCALAR_31_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[31] = m_axis_scalar_31_tready;
        end
        if(C_NUM_OUTSCALARS > 32 && M_AXIS_SCALAR_32_IS_DIRECT == 1) begin
            assign out_clk[32] = m_axis_scalar_32_aclk;
            assign out_rst[32] = m_axis_scalar_32_aresetn;
            assign m_axis_scalar_32_tlast = out_dwconv_tlast[32];
            assign m_axis_scalar_32_tvalid = out_dwconv_tvalid[32];
            assign m_axis_scalar_32_tkeep = out_dwconv_tkeep[32][S_AXIS_SCALAR_32_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_32_tstrb = out_dwconv_tstrb[32][S_AXIS_SCALAR_32_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_32_tdata = out_dwconv_tdata[32][S_AXIS_SCALAR_32_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[32] = m_axis_scalar_32_tready;
        end
        if(C_NUM_OUTSCALARS > 33 && M_AXIS_SCALAR_33_IS_DIRECT == 1) begin
            assign out_clk[33] = m_axis_scalar_33_aclk;
            assign out_rst[33] = m_axis_scalar_33_aresetn;
            assign m_axis_scalar_33_tlast = out_dwconv_tlast[33];
            assign m_axis_scalar_33_tvalid = out_dwconv_tvalid[33];
            assign m_axis_scalar_33_tkeep = out_dwconv_tkeep[33][S_AXIS_SCALAR_33_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_33_tstrb = out_dwconv_tstrb[33][S_AXIS_SCALAR_33_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_33_tdata = out_dwconv_tdata[33][S_AXIS_SCALAR_33_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[33] = m_axis_scalar_33_tready;
        end
        if(C_NUM_OUTSCALARS > 34 && M_AXIS_SCALAR_34_IS_DIRECT == 1) begin
            assign out_clk[34] = m_axis_scalar_34_aclk;
            assign out_rst[34] = m_axis_scalar_34_aresetn;
            assign m_axis_scalar_34_tlast = out_dwconv_tlast[34];
            assign m_axis_scalar_34_tvalid = out_dwconv_tvalid[34];
            assign m_axis_scalar_34_tkeep = out_dwconv_tkeep[34][S_AXIS_SCALAR_34_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_34_tstrb = out_dwconv_tstrb[34][S_AXIS_SCALAR_34_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_34_tdata = out_dwconv_tdata[34][S_AXIS_SCALAR_34_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[34] = m_axis_scalar_34_tready;
        end
        if(C_NUM_OUTSCALARS > 35 && M_AXIS_SCALAR_35_IS_DIRECT == 1) begin
            assign out_clk[35] = m_axis_scalar_35_aclk;
            assign out_rst[35] = m_axis_scalar_35_aresetn;
            assign m_axis_scalar_35_tlast = out_dwconv_tlast[35];
            assign m_axis_scalar_35_tvalid = out_dwconv_tvalid[35];
            assign m_axis_scalar_35_tkeep = out_dwconv_tkeep[35][S_AXIS_SCALAR_35_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_35_tstrb = out_dwconv_tstrb[35][S_AXIS_SCALAR_35_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_35_tdata = out_dwconv_tdata[35][S_AXIS_SCALAR_35_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[35] = m_axis_scalar_35_tready;
        end
        if(C_NUM_OUTSCALARS > 36 && M_AXIS_SCALAR_36_IS_DIRECT == 1) begin
            assign out_clk[36] = m_axis_scalar_36_aclk;
            assign out_rst[36] = m_axis_scalar_36_aresetn;
            assign m_axis_scalar_36_tlast = out_dwconv_tlast[36];
            assign m_axis_scalar_36_tvalid = out_dwconv_tvalid[36];
            assign m_axis_scalar_36_tkeep = out_dwconv_tkeep[36][S_AXIS_SCALAR_36_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_36_tstrb = out_dwconv_tstrb[36][S_AXIS_SCALAR_36_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_36_tdata = out_dwconv_tdata[36][S_AXIS_SCALAR_36_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[36] = m_axis_scalar_36_tready;
        end
        if(C_NUM_OUTSCALARS > 37 && M_AXIS_SCALAR_37_IS_DIRECT == 1) begin
            assign out_clk[37] = m_axis_scalar_37_aclk;
            assign out_rst[37] = m_axis_scalar_37_aresetn;
            assign m_axis_scalar_37_tlast = out_dwconv_tlast[37];
            assign m_axis_scalar_37_tvalid = out_dwconv_tvalid[37];
            assign m_axis_scalar_37_tkeep = out_dwconv_tkeep[37][S_AXIS_SCALAR_37_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_37_tstrb = out_dwconv_tstrb[37][S_AXIS_SCALAR_37_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_37_tdata = out_dwconv_tdata[37][S_AXIS_SCALAR_37_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[37] = m_axis_scalar_37_tready;
        end
        if(C_NUM_OUTSCALARS > 38 && M_AXIS_SCALAR_38_IS_DIRECT == 1) begin
            assign out_clk[38] = m_axis_scalar_38_aclk;
            assign out_rst[38] = m_axis_scalar_38_aresetn;
            assign m_axis_scalar_38_tlast = out_dwconv_tlast[38];
            assign m_axis_scalar_38_tvalid = out_dwconv_tvalid[38];
            assign m_axis_scalar_38_tkeep = out_dwconv_tkeep[38][S_AXIS_SCALAR_38_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_38_tstrb = out_dwconv_tstrb[38][S_AXIS_SCALAR_38_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_38_tdata = out_dwconv_tdata[38][S_AXIS_SCALAR_38_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[38] = m_axis_scalar_38_tready;
        end
        if(C_NUM_OUTSCALARS > 39 && M_AXIS_SCALAR_39_IS_DIRECT == 1) begin
            assign out_clk[39] = m_axis_scalar_39_aclk;
            assign out_rst[39] = m_axis_scalar_39_aresetn;
            assign m_axis_scalar_39_tlast = out_dwconv_tlast[39];
            assign m_axis_scalar_39_tvalid = out_dwconv_tvalid[39];
            assign m_axis_scalar_39_tkeep = out_dwconv_tkeep[39][S_AXIS_SCALAR_39_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_39_tstrb = out_dwconv_tstrb[39][S_AXIS_SCALAR_39_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_39_tdata = out_dwconv_tdata[39][S_AXIS_SCALAR_39_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[39] = m_axis_scalar_39_tready;
        end
        if(C_NUM_OUTSCALARS > 40 && M_AXIS_SCALAR_40_IS_DIRECT == 1) begin
            assign out_clk[40] = m_axis_scalar_40_aclk;
            assign out_rst[40] = m_axis_scalar_40_aresetn;
            assign m_axis_scalar_40_tlast = out_dwconv_tlast[40];
            assign m_axis_scalar_40_tvalid = out_dwconv_tvalid[40];
            assign m_axis_scalar_40_tkeep = out_dwconv_tkeep[40][S_AXIS_SCALAR_40_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_40_tstrb = out_dwconv_tstrb[40][S_AXIS_SCALAR_40_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_40_tdata = out_dwconv_tdata[40][S_AXIS_SCALAR_40_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[40] = m_axis_scalar_40_tready;
        end
        if(C_NUM_OUTSCALARS > 41 && M_AXIS_SCALAR_41_IS_DIRECT == 1) begin
            assign out_clk[41] = m_axis_scalar_41_aclk;
            assign out_rst[41] = m_axis_scalar_41_aresetn;
            assign m_axis_scalar_41_tlast = out_dwconv_tlast[41];
            assign m_axis_scalar_41_tvalid = out_dwconv_tvalid[41];
            assign m_axis_scalar_41_tkeep = out_dwconv_tkeep[41][S_AXIS_SCALAR_41_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_41_tstrb = out_dwconv_tstrb[41][S_AXIS_SCALAR_41_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_41_tdata = out_dwconv_tdata[41][S_AXIS_SCALAR_41_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[41] = m_axis_scalar_41_tready;
        end
        if(C_NUM_OUTSCALARS > 42 && M_AXIS_SCALAR_42_IS_DIRECT == 1) begin
            assign out_clk[42] = m_axis_scalar_42_aclk;
            assign out_rst[42] = m_axis_scalar_42_aresetn;
            assign m_axis_scalar_42_tlast = out_dwconv_tlast[42];
            assign m_axis_scalar_42_tvalid = out_dwconv_tvalid[42];
            assign m_axis_scalar_42_tkeep = out_dwconv_tkeep[42][S_AXIS_SCALAR_42_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_42_tstrb = out_dwconv_tstrb[42][S_AXIS_SCALAR_42_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_42_tdata = out_dwconv_tdata[42][S_AXIS_SCALAR_42_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[42] = m_axis_scalar_42_tready;
        end
        if(C_NUM_OUTSCALARS > 43 && M_AXIS_SCALAR_43_IS_DIRECT == 1) begin
            assign out_clk[43] = m_axis_scalar_43_aclk;
            assign out_rst[43] = m_axis_scalar_43_aresetn;
            assign m_axis_scalar_43_tlast = out_dwconv_tlast[43];
            assign m_axis_scalar_43_tvalid = out_dwconv_tvalid[43];
            assign m_axis_scalar_43_tkeep = out_dwconv_tkeep[43][S_AXIS_SCALAR_43_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_43_tstrb = out_dwconv_tstrb[43][S_AXIS_SCALAR_43_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_43_tdata = out_dwconv_tdata[43][S_AXIS_SCALAR_43_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[43] = m_axis_scalar_43_tready;
        end
        if(C_NUM_OUTSCALARS > 44 && M_AXIS_SCALAR_44_IS_DIRECT == 1) begin
            assign out_clk[44] = m_axis_scalar_44_aclk;
            assign out_rst[44] = m_axis_scalar_44_aresetn;
            assign m_axis_scalar_44_tlast = out_dwconv_tlast[44];
            assign m_axis_scalar_44_tvalid = out_dwconv_tvalid[44];
            assign m_axis_scalar_44_tkeep = out_dwconv_tkeep[44][S_AXIS_SCALAR_44_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_44_tstrb = out_dwconv_tstrb[44][S_AXIS_SCALAR_44_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_44_tdata = out_dwconv_tdata[44][S_AXIS_SCALAR_44_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[44] = m_axis_scalar_44_tready;
        end
        if(C_NUM_OUTSCALARS > 45 && M_AXIS_SCALAR_45_IS_DIRECT == 1) begin
            assign out_clk[45] = m_axis_scalar_45_aclk;
            assign out_rst[45] = m_axis_scalar_45_aresetn;
            assign m_axis_scalar_45_tlast = out_dwconv_tlast[45];
            assign m_axis_scalar_45_tvalid = out_dwconv_tvalid[45];
            assign m_axis_scalar_45_tkeep = out_dwconv_tkeep[45][S_AXIS_SCALAR_45_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_45_tstrb = out_dwconv_tstrb[45][S_AXIS_SCALAR_45_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_45_tdata = out_dwconv_tdata[45][S_AXIS_SCALAR_45_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[45] = m_axis_scalar_45_tready;
        end
        if(C_NUM_OUTSCALARS > 46 && M_AXIS_SCALAR_46_IS_DIRECT == 1) begin
            assign out_clk[46] = m_axis_scalar_46_aclk;
            assign out_rst[46] = m_axis_scalar_46_aresetn;
            assign m_axis_scalar_46_tlast = out_dwconv_tlast[46];
            assign m_axis_scalar_46_tvalid = out_dwconv_tvalid[46];
            assign m_axis_scalar_46_tkeep = out_dwconv_tkeep[46][S_AXIS_SCALAR_46_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_46_tstrb = out_dwconv_tstrb[46][S_AXIS_SCALAR_46_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_46_tdata = out_dwconv_tdata[46][S_AXIS_SCALAR_46_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[46] = m_axis_scalar_46_tready;
        end
        if(C_NUM_OUTSCALARS > 47 && M_AXIS_SCALAR_47_IS_DIRECT == 1) begin
            assign out_clk[47] = m_axis_scalar_47_aclk;
            assign out_rst[47] = m_axis_scalar_47_aresetn;
            assign m_axis_scalar_47_tlast = out_dwconv_tlast[47];
            assign m_axis_scalar_47_tvalid = out_dwconv_tvalid[47];
            assign m_axis_scalar_47_tkeep = out_dwconv_tkeep[47][S_AXIS_SCALAR_47_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_47_tstrb = out_dwconv_tstrb[47][S_AXIS_SCALAR_47_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_47_tdata = out_dwconv_tdata[47][S_AXIS_SCALAR_47_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[47] = m_axis_scalar_47_tready;
        end
        if(C_NUM_OUTSCALARS > 48 && M_AXIS_SCALAR_48_IS_DIRECT == 1) begin
            assign out_clk[48] = m_axis_scalar_48_aclk;
            assign out_rst[48] = m_axis_scalar_48_aresetn;
            assign m_axis_scalar_48_tlast = out_dwconv_tlast[48];
            assign m_axis_scalar_48_tvalid = out_dwconv_tvalid[48];
            assign m_axis_scalar_48_tkeep = out_dwconv_tkeep[48][S_AXIS_SCALAR_48_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_48_tstrb = out_dwconv_tstrb[48][S_AXIS_SCALAR_48_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_48_tdata = out_dwconv_tdata[48][S_AXIS_SCALAR_48_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[48] = m_axis_scalar_48_tready;
        end
        if(C_NUM_OUTSCALARS > 49 && M_AXIS_SCALAR_49_IS_DIRECT == 1) begin
            assign out_clk[49] = m_axis_scalar_49_aclk;
            assign out_rst[49] = m_axis_scalar_49_aresetn;
            assign m_axis_scalar_49_tlast = out_dwconv_tlast[49];
            assign m_axis_scalar_49_tvalid = out_dwconv_tvalid[49];
            assign m_axis_scalar_49_tkeep = out_dwconv_tkeep[49][S_AXIS_SCALAR_49_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_49_tstrb = out_dwconv_tstrb[49][S_AXIS_SCALAR_49_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_49_tdata = out_dwconv_tdata[49][S_AXIS_SCALAR_49_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[49] = m_axis_scalar_49_tready;
        end
        if(C_NUM_OUTSCALARS > 50 && M_AXIS_SCALAR_50_IS_DIRECT == 1) begin
            assign out_clk[50] = m_axis_scalar_50_aclk;
            assign out_rst[50] = m_axis_scalar_50_aresetn;
            assign m_axis_scalar_50_tlast = out_dwconv_tlast[50];
            assign m_axis_scalar_50_tvalid = out_dwconv_tvalid[50];
            assign m_axis_scalar_50_tkeep = out_dwconv_tkeep[50][S_AXIS_SCALAR_50_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_50_tstrb = out_dwconv_tstrb[50][S_AXIS_SCALAR_50_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_50_tdata = out_dwconv_tdata[50][S_AXIS_SCALAR_50_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[50] = m_axis_scalar_50_tready;
        end
        if(C_NUM_OUTSCALARS > 51 && M_AXIS_SCALAR_51_IS_DIRECT == 1) begin
            assign out_clk[51] = m_axis_scalar_51_aclk;
            assign out_rst[51] = m_axis_scalar_51_aresetn;
            assign m_axis_scalar_51_tlast = out_dwconv_tlast[51];
            assign m_axis_scalar_51_tvalid = out_dwconv_tvalid[51];
            assign m_axis_scalar_51_tkeep = out_dwconv_tkeep[51][S_AXIS_SCALAR_51_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_51_tstrb = out_dwconv_tstrb[51][S_AXIS_SCALAR_51_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_51_tdata = out_dwconv_tdata[51][S_AXIS_SCALAR_51_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[51] = m_axis_scalar_51_tready;
        end
        if(C_NUM_OUTSCALARS > 52 && M_AXIS_SCALAR_52_IS_DIRECT == 1) begin
            assign out_clk[52] = m_axis_scalar_52_aclk;
            assign out_rst[52] = m_axis_scalar_52_aresetn;
            assign m_axis_scalar_52_tlast = out_dwconv_tlast[52];
            assign m_axis_scalar_52_tvalid = out_dwconv_tvalid[52];
            assign m_axis_scalar_52_tkeep = out_dwconv_tkeep[52][S_AXIS_SCALAR_52_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_52_tstrb = out_dwconv_tstrb[52][S_AXIS_SCALAR_52_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_52_tdata = out_dwconv_tdata[52][S_AXIS_SCALAR_52_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[52] = m_axis_scalar_52_tready;
        end
        if(C_NUM_OUTSCALARS > 53 && M_AXIS_SCALAR_53_IS_DIRECT == 1) begin
            assign out_clk[53] = m_axis_scalar_53_aclk;
            assign out_rst[53] = m_axis_scalar_53_aresetn;
            assign m_axis_scalar_53_tlast = out_dwconv_tlast[53];
            assign m_axis_scalar_53_tvalid = out_dwconv_tvalid[53];
            assign m_axis_scalar_53_tkeep = out_dwconv_tkeep[53][S_AXIS_SCALAR_53_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_53_tstrb = out_dwconv_tstrb[53][S_AXIS_SCALAR_53_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_53_tdata = out_dwconv_tdata[53][S_AXIS_SCALAR_53_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[53] = m_axis_scalar_53_tready;
        end
        if(C_NUM_OUTSCALARS > 54 && M_AXIS_SCALAR_54_IS_DIRECT == 1) begin
            assign out_clk[54] = m_axis_scalar_54_aclk;
            assign out_rst[54] = m_axis_scalar_54_aresetn;
            assign m_axis_scalar_54_tlast = out_dwconv_tlast[54];
            assign m_axis_scalar_54_tvalid = out_dwconv_tvalid[54];
            assign m_axis_scalar_54_tkeep = out_dwconv_tkeep[54][S_AXIS_SCALAR_54_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_54_tstrb = out_dwconv_tstrb[54][S_AXIS_SCALAR_54_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_54_tdata = out_dwconv_tdata[54][S_AXIS_SCALAR_54_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[54] = m_axis_scalar_54_tready;
        end
        if(C_NUM_OUTSCALARS > 55 && M_AXIS_SCALAR_55_IS_DIRECT == 1) begin
            assign out_clk[55] = m_axis_scalar_55_aclk;
            assign out_rst[55] = m_axis_scalar_55_aresetn;
            assign m_axis_scalar_55_tlast = out_dwconv_tlast[55];
            assign m_axis_scalar_55_tvalid = out_dwconv_tvalid[55];
            assign m_axis_scalar_55_tkeep = out_dwconv_tkeep[55][S_AXIS_SCALAR_55_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_55_tstrb = out_dwconv_tstrb[55][S_AXIS_SCALAR_55_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_55_tdata = out_dwconv_tdata[55][S_AXIS_SCALAR_55_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[55] = m_axis_scalar_55_tready;
        end
        if(C_NUM_OUTSCALARS > 56 && M_AXIS_SCALAR_56_IS_DIRECT == 1) begin
            assign out_clk[56] = m_axis_scalar_56_aclk;
            assign out_rst[56] = m_axis_scalar_56_aresetn;
            assign m_axis_scalar_56_tlast = out_dwconv_tlast[56];
            assign m_axis_scalar_56_tvalid = out_dwconv_tvalid[56];
            assign m_axis_scalar_56_tkeep = out_dwconv_tkeep[56][S_AXIS_SCALAR_56_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_56_tstrb = out_dwconv_tstrb[56][S_AXIS_SCALAR_56_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_56_tdata = out_dwconv_tdata[56][S_AXIS_SCALAR_56_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[56] = m_axis_scalar_56_tready;
        end
        if(C_NUM_OUTSCALARS > 57 && M_AXIS_SCALAR_57_IS_DIRECT == 1) begin
            assign out_clk[57] = m_axis_scalar_57_aclk;
            assign out_rst[57] = m_axis_scalar_57_aresetn;
            assign m_axis_scalar_57_tlast = out_dwconv_tlast[57];
            assign m_axis_scalar_57_tvalid = out_dwconv_tvalid[57];
            assign m_axis_scalar_57_tkeep = out_dwconv_tkeep[57][S_AXIS_SCALAR_57_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_57_tstrb = out_dwconv_tstrb[57][S_AXIS_SCALAR_57_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_57_tdata = out_dwconv_tdata[57][S_AXIS_SCALAR_57_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[57] = m_axis_scalar_57_tready;
        end
        if(C_NUM_OUTSCALARS > 58 && M_AXIS_SCALAR_58_IS_DIRECT == 1) begin
            assign out_clk[58] = m_axis_scalar_58_aclk;
            assign out_rst[58] = m_axis_scalar_58_aresetn;
            assign m_axis_scalar_58_tlast = out_dwconv_tlast[58];
            assign m_axis_scalar_58_tvalid = out_dwconv_tvalid[58];
            assign m_axis_scalar_58_tkeep = out_dwconv_tkeep[58][S_AXIS_SCALAR_58_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_58_tstrb = out_dwconv_tstrb[58][S_AXIS_SCALAR_58_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_58_tdata = out_dwconv_tdata[58][S_AXIS_SCALAR_58_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[58] = m_axis_scalar_58_tready;
        end
        if(C_NUM_OUTSCALARS > 59 && M_AXIS_SCALAR_59_IS_DIRECT == 1) begin
            assign out_clk[59] = m_axis_scalar_59_aclk;
            assign out_rst[59] = m_axis_scalar_59_aresetn;
            assign m_axis_scalar_59_tlast = out_dwconv_tlast[59];
            assign m_axis_scalar_59_tvalid = out_dwconv_tvalid[59];
            assign m_axis_scalar_59_tkeep = out_dwconv_tkeep[59][S_AXIS_SCALAR_59_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_59_tstrb = out_dwconv_tstrb[59][S_AXIS_SCALAR_59_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_59_tdata = out_dwconv_tdata[59][S_AXIS_SCALAR_59_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[59] = m_axis_scalar_59_tready;
        end
        if(C_NUM_OUTSCALARS > 60 && M_AXIS_SCALAR_60_IS_DIRECT == 1) begin
            assign out_clk[60] = m_axis_scalar_60_aclk;
            assign out_rst[60] = m_axis_scalar_60_aresetn;
            assign m_axis_scalar_60_tlast = out_dwconv_tlast[60];
            assign m_axis_scalar_60_tvalid = out_dwconv_tvalid[60];
            assign m_axis_scalar_60_tkeep = out_dwconv_tkeep[60][S_AXIS_SCALAR_60_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_60_tstrb = out_dwconv_tstrb[60][S_AXIS_SCALAR_60_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_60_tdata = out_dwconv_tdata[60][S_AXIS_SCALAR_60_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[60] = m_axis_scalar_60_tready;
        end
        if(C_NUM_OUTSCALARS > 61 && M_AXIS_SCALAR_61_IS_DIRECT == 1) begin
            assign out_clk[61] = m_axis_scalar_61_aclk;
            assign out_rst[61] = m_axis_scalar_61_aresetn;
            assign m_axis_scalar_61_tlast = out_dwconv_tlast[61];
            assign m_axis_scalar_61_tvalid = out_dwconv_tvalid[61];
            assign m_axis_scalar_61_tkeep = out_dwconv_tkeep[61][S_AXIS_SCALAR_61_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_61_tstrb = out_dwconv_tstrb[61][S_AXIS_SCALAR_61_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_61_tdata = out_dwconv_tdata[61][S_AXIS_SCALAR_61_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[61] = m_axis_scalar_61_tready;
        end
        if(C_NUM_OUTSCALARS > 62 && M_AXIS_SCALAR_62_IS_DIRECT == 1) begin
            assign out_clk[62] = m_axis_scalar_62_aclk;
            assign out_rst[62] = m_axis_scalar_62_aresetn;
            assign m_axis_scalar_62_tlast = out_dwconv_tlast[62];
            assign m_axis_scalar_62_tvalid = out_dwconv_tvalid[62];
            assign m_axis_scalar_62_tkeep = out_dwconv_tkeep[62][S_AXIS_SCALAR_62_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_62_tstrb = out_dwconv_tstrb[62][S_AXIS_SCALAR_62_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_62_tdata = out_dwconv_tdata[62][S_AXIS_SCALAR_62_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[62] = m_axis_scalar_62_tready;
        end
        if(C_NUM_OUTSCALARS > 63 && M_AXIS_SCALAR_63_IS_DIRECT == 1) begin
            assign out_clk[63] = m_axis_scalar_63_aclk;
            assign out_rst[63] = m_axis_scalar_63_aresetn;
            assign m_axis_scalar_63_tlast = out_dwconv_tlast[63];
            assign m_axis_scalar_63_tvalid = out_dwconv_tvalid[63];
            assign m_axis_scalar_63_tkeep = out_dwconv_tkeep[63][S_AXIS_SCALAR_63_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_63_tstrb = out_dwconv_tstrb[63][S_AXIS_SCALAR_63_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_63_tdata = out_dwconv_tdata[63][S_AXIS_SCALAR_63_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[63] = m_axis_scalar_63_tready;
        end
        if(C_NUM_OUTSCALARS > 64 && M_AXIS_SCALAR_64_IS_DIRECT == 1) begin
            assign out_clk[64] = m_axis_scalar_64_aclk;
            assign out_rst[64] = m_axis_scalar_64_aresetn;
            assign m_axis_scalar_64_tlast = out_dwconv_tlast[64];
            assign m_axis_scalar_64_tvalid = out_dwconv_tvalid[64];
            assign m_axis_scalar_64_tkeep = out_dwconv_tkeep[64][S_AXIS_SCALAR_64_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_64_tstrb = out_dwconv_tstrb[64][S_AXIS_SCALAR_64_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_64_tdata = out_dwconv_tdata[64][S_AXIS_SCALAR_64_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[64] = m_axis_scalar_64_tready;
        end
        if(C_NUM_OUTSCALARS > 65 && M_AXIS_SCALAR_65_IS_DIRECT == 1) begin
            assign out_clk[65] = m_axis_scalar_65_aclk;
            assign out_rst[65] = m_axis_scalar_65_aresetn;
            assign m_axis_scalar_65_tlast = out_dwconv_tlast[65];
            assign m_axis_scalar_65_tvalid = out_dwconv_tvalid[65];
            assign m_axis_scalar_65_tkeep = out_dwconv_tkeep[65][S_AXIS_SCALAR_65_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_65_tstrb = out_dwconv_tstrb[65][S_AXIS_SCALAR_65_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_65_tdata = out_dwconv_tdata[65][S_AXIS_SCALAR_65_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[65] = m_axis_scalar_65_tready;
        end
        if(C_NUM_OUTSCALARS > 66 && M_AXIS_SCALAR_66_IS_DIRECT == 1) begin
            assign out_clk[66] = m_axis_scalar_66_aclk;
            assign out_rst[66] = m_axis_scalar_66_aresetn;
            assign m_axis_scalar_66_tlast = out_dwconv_tlast[66];
            assign m_axis_scalar_66_tvalid = out_dwconv_tvalid[66];
            assign m_axis_scalar_66_tkeep = out_dwconv_tkeep[66][S_AXIS_SCALAR_66_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_66_tstrb = out_dwconv_tstrb[66][S_AXIS_SCALAR_66_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_66_tdata = out_dwconv_tdata[66][S_AXIS_SCALAR_66_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[66] = m_axis_scalar_66_tready;
        end
        if(C_NUM_OUTSCALARS > 67 && M_AXIS_SCALAR_67_IS_DIRECT == 1) begin
            assign out_clk[67] = m_axis_scalar_67_aclk;
            assign out_rst[67] = m_axis_scalar_67_aresetn;
            assign m_axis_scalar_67_tlast = out_dwconv_tlast[67];
            assign m_axis_scalar_67_tvalid = out_dwconv_tvalid[67];
            assign m_axis_scalar_67_tkeep = out_dwconv_tkeep[67][S_AXIS_SCALAR_67_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_67_tstrb = out_dwconv_tstrb[67][S_AXIS_SCALAR_67_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_67_tdata = out_dwconv_tdata[67][S_AXIS_SCALAR_67_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[67] = m_axis_scalar_67_tready;
        end
        if(C_NUM_OUTSCALARS > 68 && M_AXIS_SCALAR_68_IS_DIRECT == 1) begin
            assign out_clk[68] = m_axis_scalar_68_aclk;
            assign out_rst[68] = m_axis_scalar_68_aresetn;
            assign m_axis_scalar_68_tlast = out_dwconv_tlast[68];
            assign m_axis_scalar_68_tvalid = out_dwconv_tvalid[68];
            assign m_axis_scalar_68_tkeep = out_dwconv_tkeep[68][S_AXIS_SCALAR_68_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_68_tstrb = out_dwconv_tstrb[68][S_AXIS_SCALAR_68_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_68_tdata = out_dwconv_tdata[68][S_AXIS_SCALAR_68_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[68] = m_axis_scalar_68_tready;
        end
        if(C_NUM_OUTSCALARS > 69 && M_AXIS_SCALAR_69_IS_DIRECT == 1) begin
            assign out_clk[69] = m_axis_scalar_69_aclk;
            assign out_rst[69] = m_axis_scalar_69_aresetn;
            assign m_axis_scalar_69_tlast = out_dwconv_tlast[69];
            assign m_axis_scalar_69_tvalid = out_dwconv_tvalid[69];
            assign m_axis_scalar_69_tkeep = out_dwconv_tkeep[69][S_AXIS_SCALAR_69_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_69_tstrb = out_dwconv_tstrb[69][S_AXIS_SCALAR_69_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_69_tdata = out_dwconv_tdata[69][S_AXIS_SCALAR_69_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[69] = m_axis_scalar_69_tready;
        end
        if(C_NUM_OUTSCALARS > 70 && M_AXIS_SCALAR_70_IS_DIRECT == 1) begin
            assign out_clk[70] = m_axis_scalar_70_aclk;
            assign out_rst[70] = m_axis_scalar_70_aresetn;
            assign m_axis_scalar_70_tlast = out_dwconv_tlast[70];
            assign m_axis_scalar_70_tvalid = out_dwconv_tvalid[70];
            assign m_axis_scalar_70_tkeep = out_dwconv_tkeep[70][S_AXIS_SCALAR_70_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_70_tstrb = out_dwconv_tstrb[70][S_AXIS_SCALAR_70_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_70_tdata = out_dwconv_tdata[70][S_AXIS_SCALAR_70_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[70] = m_axis_scalar_70_tready;
        end
        if(C_NUM_OUTSCALARS > 71 && M_AXIS_SCALAR_71_IS_DIRECT == 1) begin
            assign out_clk[71] = m_axis_scalar_71_aclk;
            assign out_rst[71] = m_axis_scalar_71_aresetn;
            assign m_axis_scalar_71_tlast = out_dwconv_tlast[71];
            assign m_axis_scalar_71_tvalid = out_dwconv_tvalid[71];
            assign m_axis_scalar_71_tkeep = out_dwconv_tkeep[71][S_AXIS_SCALAR_71_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_71_tstrb = out_dwconv_tstrb[71][S_AXIS_SCALAR_71_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_71_tdata = out_dwconv_tdata[71][S_AXIS_SCALAR_71_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[71] = m_axis_scalar_71_tready;
        end
        if(C_NUM_OUTSCALARS > 72 && M_AXIS_SCALAR_72_IS_DIRECT == 1) begin
            assign out_clk[72] = m_axis_scalar_72_aclk;
            assign out_rst[72] = m_axis_scalar_72_aresetn;
            assign m_axis_scalar_72_tlast = out_dwconv_tlast[72];
            assign m_axis_scalar_72_tvalid = out_dwconv_tvalid[72];
            assign m_axis_scalar_72_tkeep = out_dwconv_tkeep[72][S_AXIS_SCALAR_72_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_72_tstrb = out_dwconv_tstrb[72][S_AXIS_SCALAR_72_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_72_tdata = out_dwconv_tdata[72][S_AXIS_SCALAR_72_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[72] = m_axis_scalar_72_tready;
        end
        if(C_NUM_OUTSCALARS > 73 && M_AXIS_SCALAR_73_IS_DIRECT == 1) begin
            assign out_clk[73] = m_axis_scalar_73_aclk;
            assign out_rst[73] = m_axis_scalar_73_aresetn;
            assign m_axis_scalar_73_tlast = out_dwconv_tlast[73];
            assign m_axis_scalar_73_tvalid = out_dwconv_tvalid[73];
            assign m_axis_scalar_73_tkeep = out_dwconv_tkeep[73][S_AXIS_SCALAR_73_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_73_tstrb = out_dwconv_tstrb[73][S_AXIS_SCALAR_73_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_73_tdata = out_dwconv_tdata[73][S_AXIS_SCALAR_73_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[73] = m_axis_scalar_73_tready;
        end
        if(C_NUM_OUTSCALARS > 74 && M_AXIS_SCALAR_74_IS_DIRECT == 1) begin
            assign out_clk[74] = m_axis_scalar_74_aclk;
            assign out_rst[74] = m_axis_scalar_74_aresetn;
            assign m_axis_scalar_74_tlast = out_dwconv_tlast[74];
            assign m_axis_scalar_74_tvalid = out_dwconv_tvalid[74];
            assign m_axis_scalar_74_tkeep = out_dwconv_tkeep[74][S_AXIS_SCALAR_74_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_74_tstrb = out_dwconv_tstrb[74][S_AXIS_SCALAR_74_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_74_tdata = out_dwconv_tdata[74][S_AXIS_SCALAR_74_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[74] = m_axis_scalar_74_tready;
        end
        if(C_NUM_OUTSCALARS > 75 && M_AXIS_SCALAR_75_IS_DIRECT == 1) begin
            assign out_clk[75] = m_axis_scalar_75_aclk;
            assign out_rst[75] = m_axis_scalar_75_aresetn;
            assign m_axis_scalar_75_tlast = out_dwconv_tlast[75];
            assign m_axis_scalar_75_tvalid = out_dwconv_tvalid[75];
            assign m_axis_scalar_75_tkeep = out_dwconv_tkeep[75][S_AXIS_SCALAR_75_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_75_tstrb = out_dwconv_tstrb[75][S_AXIS_SCALAR_75_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_75_tdata = out_dwconv_tdata[75][S_AXIS_SCALAR_75_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[75] = m_axis_scalar_75_tready;
        end
        if(C_NUM_OUTSCALARS > 76 && M_AXIS_SCALAR_76_IS_DIRECT == 1) begin
            assign out_clk[76] = m_axis_scalar_76_aclk;
            assign out_rst[76] = m_axis_scalar_76_aresetn;
            assign m_axis_scalar_76_tlast = out_dwconv_tlast[76];
            assign m_axis_scalar_76_tvalid = out_dwconv_tvalid[76];
            assign m_axis_scalar_76_tkeep = out_dwconv_tkeep[76][S_AXIS_SCALAR_76_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_76_tstrb = out_dwconv_tstrb[76][S_AXIS_SCALAR_76_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_76_tdata = out_dwconv_tdata[76][S_AXIS_SCALAR_76_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[76] = m_axis_scalar_76_tready;
        end
        if(C_NUM_OUTSCALARS > 77 && M_AXIS_SCALAR_77_IS_DIRECT == 1) begin
            assign out_clk[77] = m_axis_scalar_77_aclk;
            assign out_rst[77] = m_axis_scalar_77_aresetn;
            assign m_axis_scalar_77_tlast = out_dwconv_tlast[77];
            assign m_axis_scalar_77_tvalid = out_dwconv_tvalid[77];
            assign m_axis_scalar_77_tkeep = out_dwconv_tkeep[77][S_AXIS_SCALAR_77_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_77_tstrb = out_dwconv_tstrb[77][S_AXIS_SCALAR_77_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_77_tdata = out_dwconv_tdata[77][S_AXIS_SCALAR_77_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[77] = m_axis_scalar_77_tready;
        end
        if(C_NUM_OUTSCALARS > 78 && M_AXIS_SCALAR_78_IS_DIRECT == 1) begin
            assign out_clk[78] = m_axis_scalar_78_aclk;
            assign out_rst[78] = m_axis_scalar_78_aresetn;
            assign m_axis_scalar_78_tlast = out_dwconv_tlast[78];
            assign m_axis_scalar_78_tvalid = out_dwconv_tvalid[78];
            assign m_axis_scalar_78_tkeep = out_dwconv_tkeep[78][S_AXIS_SCALAR_78_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_78_tstrb = out_dwconv_tstrb[78][S_AXIS_SCALAR_78_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_78_tdata = out_dwconv_tdata[78][S_AXIS_SCALAR_78_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[78] = m_axis_scalar_78_tready;
        end
        if(C_NUM_OUTSCALARS > 79 && M_AXIS_SCALAR_79_IS_DIRECT == 1) begin
            assign out_clk[79] = m_axis_scalar_79_aclk;
            assign out_rst[79] = m_axis_scalar_79_aresetn;
            assign m_axis_scalar_79_tlast = out_dwconv_tlast[79];
            assign m_axis_scalar_79_tvalid = out_dwconv_tvalid[79];
            assign m_axis_scalar_79_tkeep = out_dwconv_tkeep[79][S_AXIS_SCALAR_79_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_79_tstrb = out_dwconv_tstrb[79][S_AXIS_SCALAR_79_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_79_tdata = out_dwconv_tdata[79][S_AXIS_SCALAR_79_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[79] = m_axis_scalar_79_tready;
        end
        if(C_NUM_OUTSCALARS > 80 && M_AXIS_SCALAR_80_IS_DIRECT == 1) begin
            assign out_clk[80] = m_axis_scalar_80_aclk;
            assign out_rst[80] = m_axis_scalar_80_aresetn;
            assign m_axis_scalar_80_tlast = out_dwconv_tlast[80];
            assign m_axis_scalar_80_tvalid = out_dwconv_tvalid[80];
            assign m_axis_scalar_80_tkeep = out_dwconv_tkeep[80][S_AXIS_SCALAR_80_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_80_tstrb = out_dwconv_tstrb[80][S_AXIS_SCALAR_80_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_80_tdata = out_dwconv_tdata[80][S_AXIS_SCALAR_80_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[80] = m_axis_scalar_80_tready;
        end
        if(C_NUM_OUTSCALARS > 81 && M_AXIS_SCALAR_81_IS_DIRECT == 1) begin
            assign out_clk[81] = m_axis_scalar_81_aclk;
            assign out_rst[81] = m_axis_scalar_81_aresetn;
            assign m_axis_scalar_81_tlast = out_dwconv_tlast[81];
            assign m_axis_scalar_81_tvalid = out_dwconv_tvalid[81];
            assign m_axis_scalar_81_tkeep = out_dwconv_tkeep[81][S_AXIS_SCALAR_81_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_81_tstrb = out_dwconv_tstrb[81][S_AXIS_SCALAR_81_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_81_tdata = out_dwconv_tdata[81][S_AXIS_SCALAR_81_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[81] = m_axis_scalar_81_tready;
        end
        if(C_NUM_OUTSCALARS > 82 && M_AXIS_SCALAR_82_IS_DIRECT == 1) begin
            assign out_clk[82] = m_axis_scalar_82_aclk;
            assign out_rst[82] = m_axis_scalar_82_aresetn;
            assign m_axis_scalar_82_tlast = out_dwconv_tlast[82];
            assign m_axis_scalar_82_tvalid = out_dwconv_tvalid[82];
            assign m_axis_scalar_82_tkeep = out_dwconv_tkeep[82][S_AXIS_SCALAR_82_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_82_tstrb = out_dwconv_tstrb[82][S_AXIS_SCALAR_82_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_82_tdata = out_dwconv_tdata[82][S_AXIS_SCALAR_82_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[82] = m_axis_scalar_82_tready;
        end
        if(C_NUM_OUTSCALARS > 83 && M_AXIS_SCALAR_83_IS_DIRECT == 1) begin
            assign out_clk[83] = m_axis_scalar_83_aclk;
            assign out_rst[83] = m_axis_scalar_83_aresetn;
            assign m_axis_scalar_83_tlast = out_dwconv_tlast[83];
            assign m_axis_scalar_83_tvalid = out_dwconv_tvalid[83];
            assign m_axis_scalar_83_tkeep = out_dwconv_tkeep[83][S_AXIS_SCALAR_83_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_83_tstrb = out_dwconv_tstrb[83][S_AXIS_SCALAR_83_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_83_tdata = out_dwconv_tdata[83][S_AXIS_SCALAR_83_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[83] = m_axis_scalar_83_tready;
        end
        if(C_NUM_OUTSCALARS > 84 && M_AXIS_SCALAR_84_IS_DIRECT == 1) begin
            assign out_clk[84] = m_axis_scalar_84_aclk;
            assign out_rst[84] = m_axis_scalar_84_aresetn;
            assign m_axis_scalar_84_tlast = out_dwconv_tlast[84];
            assign m_axis_scalar_84_tvalid = out_dwconv_tvalid[84];
            assign m_axis_scalar_84_tkeep = out_dwconv_tkeep[84][S_AXIS_SCALAR_84_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_84_tstrb = out_dwconv_tstrb[84][S_AXIS_SCALAR_84_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_84_tdata = out_dwconv_tdata[84][S_AXIS_SCALAR_84_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[84] = m_axis_scalar_84_tready;
        end
        if(C_NUM_OUTSCALARS > 85 && M_AXIS_SCALAR_85_IS_DIRECT == 1) begin
            assign out_clk[85] = m_axis_scalar_85_aclk;
            assign out_rst[85] = m_axis_scalar_85_aresetn;
            assign m_axis_scalar_85_tlast = out_dwconv_tlast[85];
            assign m_axis_scalar_85_tvalid = out_dwconv_tvalid[85];
            assign m_axis_scalar_85_tkeep = out_dwconv_tkeep[85][S_AXIS_SCALAR_85_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_85_tstrb = out_dwconv_tstrb[85][S_AXIS_SCALAR_85_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_85_tdata = out_dwconv_tdata[85][S_AXIS_SCALAR_85_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[85] = m_axis_scalar_85_tready;
        end
        if(C_NUM_OUTSCALARS > 86 && M_AXIS_SCALAR_86_IS_DIRECT == 1) begin
            assign out_clk[86] = m_axis_scalar_86_aclk;
            assign out_rst[86] = m_axis_scalar_86_aresetn;
            assign m_axis_scalar_86_tlast = out_dwconv_tlast[86];
            assign m_axis_scalar_86_tvalid = out_dwconv_tvalid[86];
            assign m_axis_scalar_86_tkeep = out_dwconv_tkeep[86][S_AXIS_SCALAR_86_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_86_tstrb = out_dwconv_tstrb[86][S_AXIS_SCALAR_86_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_86_tdata = out_dwconv_tdata[86][S_AXIS_SCALAR_86_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[86] = m_axis_scalar_86_tready;
        end
        if(C_NUM_OUTSCALARS > 87 && M_AXIS_SCALAR_87_IS_DIRECT == 1) begin
            assign out_clk[87] = m_axis_scalar_87_aclk;
            assign out_rst[87] = m_axis_scalar_87_aresetn;
            assign m_axis_scalar_87_tlast = out_dwconv_tlast[87];
            assign m_axis_scalar_87_tvalid = out_dwconv_tvalid[87];
            assign m_axis_scalar_87_tkeep = out_dwconv_tkeep[87][S_AXIS_SCALAR_87_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_87_tstrb = out_dwconv_tstrb[87][S_AXIS_SCALAR_87_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_87_tdata = out_dwconv_tdata[87][S_AXIS_SCALAR_87_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[87] = m_axis_scalar_87_tready;
        end
        if(C_NUM_OUTSCALARS > 88 && M_AXIS_SCALAR_88_IS_DIRECT == 1) begin
            assign out_clk[88] = m_axis_scalar_88_aclk;
            assign out_rst[88] = m_axis_scalar_88_aresetn;
            assign m_axis_scalar_88_tlast = out_dwconv_tlast[88];
            assign m_axis_scalar_88_tvalid = out_dwconv_tvalid[88];
            assign m_axis_scalar_88_tkeep = out_dwconv_tkeep[88][S_AXIS_SCALAR_88_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_88_tstrb = out_dwconv_tstrb[88][S_AXIS_SCALAR_88_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_88_tdata = out_dwconv_tdata[88][S_AXIS_SCALAR_88_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[88] = m_axis_scalar_88_tready;
        end
        if(C_NUM_OUTSCALARS > 89 && M_AXIS_SCALAR_89_IS_DIRECT == 1) begin
            assign out_clk[89] = m_axis_scalar_89_aclk;
            assign out_rst[89] = m_axis_scalar_89_aresetn;
            assign m_axis_scalar_89_tlast = out_dwconv_tlast[89];
            assign m_axis_scalar_89_tvalid = out_dwconv_tvalid[89];
            assign m_axis_scalar_89_tkeep = out_dwconv_tkeep[89][S_AXIS_SCALAR_89_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_89_tstrb = out_dwconv_tstrb[89][S_AXIS_SCALAR_89_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_89_tdata = out_dwconv_tdata[89][S_AXIS_SCALAR_89_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[89] = m_axis_scalar_89_tready;
        end
        if(C_NUM_OUTSCALARS > 90 && M_AXIS_SCALAR_90_IS_DIRECT == 1) begin
            assign out_clk[90] = m_axis_scalar_90_aclk;
            assign out_rst[90] = m_axis_scalar_90_aresetn;
            assign m_axis_scalar_90_tlast = out_dwconv_tlast[90];
            assign m_axis_scalar_90_tvalid = out_dwconv_tvalid[90];
            assign m_axis_scalar_90_tkeep = out_dwconv_tkeep[90][S_AXIS_SCALAR_90_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_90_tstrb = out_dwconv_tstrb[90][S_AXIS_SCALAR_90_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_90_tdata = out_dwconv_tdata[90][S_AXIS_SCALAR_90_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[90] = m_axis_scalar_90_tready;
        end
        if(C_NUM_OUTSCALARS > 91 && M_AXIS_SCALAR_91_IS_DIRECT == 1) begin
            assign out_clk[91] = m_axis_scalar_91_aclk;
            assign out_rst[91] = m_axis_scalar_91_aresetn;
            assign m_axis_scalar_91_tlast = out_dwconv_tlast[91];
            assign m_axis_scalar_91_tvalid = out_dwconv_tvalid[91];
            assign m_axis_scalar_91_tkeep = out_dwconv_tkeep[91][S_AXIS_SCALAR_91_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_91_tstrb = out_dwconv_tstrb[91][S_AXIS_SCALAR_91_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_91_tdata = out_dwconv_tdata[91][S_AXIS_SCALAR_91_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[91] = m_axis_scalar_91_tready;
        end
        if(C_NUM_OUTSCALARS > 92 && M_AXIS_SCALAR_92_IS_DIRECT == 1) begin
            assign out_clk[92] = m_axis_scalar_92_aclk;
            assign out_rst[92] = m_axis_scalar_92_aresetn;
            assign m_axis_scalar_92_tlast = out_dwconv_tlast[92];
            assign m_axis_scalar_92_tvalid = out_dwconv_tvalid[92];
            assign m_axis_scalar_92_tkeep = out_dwconv_tkeep[92][S_AXIS_SCALAR_92_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_92_tstrb = out_dwconv_tstrb[92][S_AXIS_SCALAR_92_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_92_tdata = out_dwconv_tdata[92][S_AXIS_SCALAR_92_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[92] = m_axis_scalar_92_tready;
        end
        if(C_NUM_OUTSCALARS > 93 && M_AXIS_SCALAR_93_IS_DIRECT == 1) begin
            assign out_clk[93] = m_axis_scalar_93_aclk;
            assign out_rst[93] = m_axis_scalar_93_aresetn;
            assign m_axis_scalar_93_tlast = out_dwconv_tlast[93];
            assign m_axis_scalar_93_tvalid = out_dwconv_tvalid[93];
            assign m_axis_scalar_93_tkeep = out_dwconv_tkeep[93][S_AXIS_SCALAR_93_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_93_tstrb = out_dwconv_tstrb[93][S_AXIS_SCALAR_93_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_93_tdata = out_dwconv_tdata[93][S_AXIS_SCALAR_93_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[93] = m_axis_scalar_93_tready;
        end
        if(C_NUM_OUTSCALARS > 94 && M_AXIS_SCALAR_94_IS_DIRECT == 1) begin
            assign out_clk[94] = m_axis_scalar_94_aclk;
            assign out_rst[94] = m_axis_scalar_94_aresetn;
            assign m_axis_scalar_94_tlast = out_dwconv_tlast[94];
            assign m_axis_scalar_94_tvalid = out_dwconv_tvalid[94];
            assign m_axis_scalar_94_tkeep = out_dwconv_tkeep[94][S_AXIS_SCALAR_94_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_94_tstrb = out_dwconv_tstrb[94][S_AXIS_SCALAR_94_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_94_tdata = out_dwconv_tdata[94][S_AXIS_SCALAR_94_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[94] = m_axis_scalar_94_tready;
        end
        if(C_NUM_OUTSCALARS > 95 && M_AXIS_SCALAR_95_IS_DIRECT == 1) begin
            assign out_clk[95] = m_axis_scalar_95_aclk;
            assign out_rst[95] = m_axis_scalar_95_aresetn;
            assign m_axis_scalar_95_tlast = out_dwconv_tlast[95];
            assign m_axis_scalar_95_tvalid = out_dwconv_tvalid[95];
            assign m_axis_scalar_95_tkeep = out_dwconv_tkeep[95][S_AXIS_SCALAR_95_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_95_tstrb = out_dwconv_tstrb[95][S_AXIS_SCALAR_95_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_95_tdata = out_dwconv_tdata[95][S_AXIS_SCALAR_95_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[95] = m_axis_scalar_95_tready;
        end
        if(C_NUM_OUTSCALARS > 96 && M_AXIS_SCALAR_96_IS_DIRECT == 1) begin
            assign out_clk[96] = m_axis_scalar_96_aclk;
            assign out_rst[96] = m_axis_scalar_96_aresetn;
            assign m_axis_scalar_96_tlast = out_dwconv_tlast[96];
            assign m_axis_scalar_96_tvalid = out_dwconv_tvalid[96];
            assign m_axis_scalar_96_tkeep = out_dwconv_tkeep[96][S_AXIS_SCALAR_96_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_96_tstrb = out_dwconv_tstrb[96][S_AXIS_SCALAR_96_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_96_tdata = out_dwconv_tdata[96][S_AXIS_SCALAR_96_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[96] = m_axis_scalar_96_tready;
        end
        if(C_NUM_OUTSCALARS > 97 && M_AXIS_SCALAR_97_IS_DIRECT == 1) begin
            assign out_clk[97] = m_axis_scalar_97_aclk;
            assign out_rst[97] = m_axis_scalar_97_aresetn;
            assign m_axis_scalar_97_tlast = out_dwconv_tlast[97];
            assign m_axis_scalar_97_tvalid = out_dwconv_tvalid[97];
            assign m_axis_scalar_97_tkeep = out_dwconv_tkeep[97][S_AXIS_SCALAR_97_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_97_tstrb = out_dwconv_tstrb[97][S_AXIS_SCALAR_97_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_97_tdata = out_dwconv_tdata[97][S_AXIS_SCALAR_97_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[97] = m_axis_scalar_97_tready;
        end
        if(C_NUM_OUTSCALARS > 98 && M_AXIS_SCALAR_98_IS_DIRECT == 1) begin
            assign out_clk[98] = m_axis_scalar_98_aclk;
            assign out_rst[98] = m_axis_scalar_98_aresetn;
            assign m_axis_scalar_98_tlast = out_dwconv_tlast[98];
            assign m_axis_scalar_98_tvalid = out_dwconv_tvalid[98];
            assign m_axis_scalar_98_tkeep = out_dwconv_tkeep[98][S_AXIS_SCALAR_98_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_98_tstrb = out_dwconv_tstrb[98][S_AXIS_SCALAR_98_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_98_tdata = out_dwconv_tdata[98][S_AXIS_SCALAR_98_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[98] = m_axis_scalar_98_tready;
        end
        if(C_NUM_OUTSCALARS > 99 && M_AXIS_SCALAR_99_IS_DIRECT == 1) begin
            assign out_clk[99] = m_axis_scalar_99_aclk;
            assign out_rst[99] = m_axis_scalar_99_aresetn;
            assign m_axis_scalar_99_tlast = out_dwconv_tlast[99];
            assign m_axis_scalar_99_tvalid = out_dwconv_tvalid[99];
            assign m_axis_scalar_99_tkeep = out_dwconv_tkeep[99][S_AXIS_SCALAR_99_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_99_tstrb = out_dwconv_tstrb[99][S_AXIS_SCALAR_99_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_99_tdata = out_dwconv_tdata[99][S_AXIS_SCALAR_99_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[99] = m_axis_scalar_99_tready;
        end
        if(C_NUM_OUTSCALARS > 100 && M_AXIS_SCALAR_100_IS_DIRECT == 1) begin
            assign out_clk[100] = m_axis_scalar_100_aclk;
            assign out_rst[100] = m_axis_scalar_100_aresetn;
            assign m_axis_scalar_100_tlast = out_dwconv_tlast[100];
            assign m_axis_scalar_100_tvalid = out_dwconv_tvalid[100];
            assign m_axis_scalar_100_tkeep = out_dwconv_tkeep[100][S_AXIS_SCALAR_100_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_100_tstrb = out_dwconv_tstrb[100][S_AXIS_SCALAR_100_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_100_tdata = out_dwconv_tdata[100][S_AXIS_SCALAR_100_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[100] = m_axis_scalar_100_tready;
        end
        if(C_NUM_OUTSCALARS > 101 && M_AXIS_SCALAR_101_IS_DIRECT == 1) begin
            assign out_clk[101] = m_axis_scalar_101_aclk;
            assign out_rst[101] = m_axis_scalar_101_aresetn;
            assign m_axis_scalar_101_tlast = out_dwconv_tlast[101];
            assign m_axis_scalar_101_tvalid = out_dwconv_tvalid[101];
            assign m_axis_scalar_101_tkeep = out_dwconv_tkeep[101][S_AXIS_SCALAR_101_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_101_tstrb = out_dwconv_tstrb[101][S_AXIS_SCALAR_101_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_101_tdata = out_dwconv_tdata[101][S_AXIS_SCALAR_101_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[101] = m_axis_scalar_101_tready;
        end
        if(C_NUM_OUTSCALARS > 102 && M_AXIS_SCALAR_102_IS_DIRECT == 1) begin
            assign out_clk[102] = m_axis_scalar_102_aclk;
            assign out_rst[102] = m_axis_scalar_102_aresetn;
            assign m_axis_scalar_102_tlast = out_dwconv_tlast[102];
            assign m_axis_scalar_102_tvalid = out_dwconv_tvalid[102];
            assign m_axis_scalar_102_tkeep = out_dwconv_tkeep[102][S_AXIS_SCALAR_102_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_102_tstrb = out_dwconv_tstrb[102][S_AXIS_SCALAR_102_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_102_tdata = out_dwconv_tdata[102][S_AXIS_SCALAR_102_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[102] = m_axis_scalar_102_tready;
        end
        if(C_NUM_OUTSCALARS > 103 && M_AXIS_SCALAR_103_IS_DIRECT == 1) begin
            assign out_clk[103] = m_axis_scalar_103_aclk;
            assign out_rst[103] = m_axis_scalar_103_aresetn;
            assign m_axis_scalar_103_tlast = out_dwconv_tlast[103];
            assign m_axis_scalar_103_tvalid = out_dwconv_tvalid[103];
            assign m_axis_scalar_103_tkeep = out_dwconv_tkeep[103][S_AXIS_SCALAR_103_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_103_tstrb = out_dwconv_tstrb[103][S_AXIS_SCALAR_103_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_103_tdata = out_dwconv_tdata[103][S_AXIS_SCALAR_103_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[103] = m_axis_scalar_103_tready;
        end
        if(C_NUM_OUTSCALARS > 104 && M_AXIS_SCALAR_104_IS_DIRECT == 1) begin
            assign out_clk[104] = m_axis_scalar_104_aclk;
            assign out_rst[104] = m_axis_scalar_104_aresetn;
            assign m_axis_scalar_104_tlast = out_dwconv_tlast[104];
            assign m_axis_scalar_104_tvalid = out_dwconv_tvalid[104];
            assign m_axis_scalar_104_tkeep = out_dwconv_tkeep[104][S_AXIS_SCALAR_104_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_104_tstrb = out_dwconv_tstrb[104][S_AXIS_SCALAR_104_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_104_tdata = out_dwconv_tdata[104][S_AXIS_SCALAR_104_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[104] = m_axis_scalar_104_tready;
        end
        if(C_NUM_OUTSCALARS > 105 && M_AXIS_SCALAR_105_IS_DIRECT == 1) begin
            assign out_clk[105] = m_axis_scalar_105_aclk;
            assign out_rst[105] = m_axis_scalar_105_aresetn;
            assign m_axis_scalar_105_tlast = out_dwconv_tlast[105];
            assign m_axis_scalar_105_tvalid = out_dwconv_tvalid[105];
            assign m_axis_scalar_105_tkeep = out_dwconv_tkeep[105][S_AXIS_SCALAR_105_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_105_tstrb = out_dwconv_tstrb[105][S_AXIS_SCALAR_105_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_105_tdata = out_dwconv_tdata[105][S_AXIS_SCALAR_105_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[105] = m_axis_scalar_105_tready;
        end
        if(C_NUM_OUTSCALARS > 106 && M_AXIS_SCALAR_106_IS_DIRECT == 1) begin
            assign out_clk[106] = m_axis_scalar_106_aclk;
            assign out_rst[106] = m_axis_scalar_106_aresetn;
            assign m_axis_scalar_106_tlast = out_dwconv_tlast[106];
            assign m_axis_scalar_106_tvalid = out_dwconv_tvalid[106];
            assign m_axis_scalar_106_tkeep = out_dwconv_tkeep[106][S_AXIS_SCALAR_106_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_106_tstrb = out_dwconv_tstrb[106][S_AXIS_SCALAR_106_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_106_tdata = out_dwconv_tdata[106][S_AXIS_SCALAR_106_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[106] = m_axis_scalar_106_tready;
        end
        if(C_NUM_OUTSCALARS > 107 && M_AXIS_SCALAR_107_IS_DIRECT == 1) begin
            assign out_clk[107] = m_axis_scalar_107_aclk;
            assign out_rst[107] = m_axis_scalar_107_aresetn;
            assign m_axis_scalar_107_tlast = out_dwconv_tlast[107];
            assign m_axis_scalar_107_tvalid = out_dwconv_tvalid[107];
            assign m_axis_scalar_107_tkeep = out_dwconv_tkeep[107][S_AXIS_SCALAR_107_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_107_tstrb = out_dwconv_tstrb[107][S_AXIS_SCALAR_107_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_107_tdata = out_dwconv_tdata[107][S_AXIS_SCALAR_107_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[107] = m_axis_scalar_107_tready;
        end
        if(C_NUM_OUTSCALARS > 108 && M_AXIS_SCALAR_108_IS_DIRECT == 1) begin
            assign out_clk[108] = m_axis_scalar_108_aclk;
            assign out_rst[108] = m_axis_scalar_108_aresetn;
            assign m_axis_scalar_108_tlast = out_dwconv_tlast[108];
            assign m_axis_scalar_108_tvalid = out_dwconv_tvalid[108];
            assign m_axis_scalar_108_tkeep = out_dwconv_tkeep[108][S_AXIS_SCALAR_108_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_108_tstrb = out_dwconv_tstrb[108][S_AXIS_SCALAR_108_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_108_tdata = out_dwconv_tdata[108][S_AXIS_SCALAR_108_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[108] = m_axis_scalar_108_tready;
        end
        if(C_NUM_OUTSCALARS > 109 && M_AXIS_SCALAR_109_IS_DIRECT == 1) begin
            assign out_clk[109] = m_axis_scalar_109_aclk;
            assign out_rst[109] = m_axis_scalar_109_aresetn;
            assign m_axis_scalar_109_tlast = out_dwconv_tlast[109];
            assign m_axis_scalar_109_tvalid = out_dwconv_tvalid[109];
            assign m_axis_scalar_109_tkeep = out_dwconv_tkeep[109][S_AXIS_SCALAR_109_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_109_tstrb = out_dwconv_tstrb[109][S_AXIS_SCALAR_109_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_109_tdata = out_dwconv_tdata[109][S_AXIS_SCALAR_109_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[109] = m_axis_scalar_109_tready;
        end
        if(C_NUM_OUTSCALARS > 110 && M_AXIS_SCALAR_110_IS_DIRECT == 1) begin
            assign out_clk[110] = m_axis_scalar_110_aclk;
            assign out_rst[110] = m_axis_scalar_110_aresetn;
            assign m_axis_scalar_110_tlast = out_dwconv_tlast[110];
            assign m_axis_scalar_110_tvalid = out_dwconv_tvalid[110];
            assign m_axis_scalar_110_tkeep = out_dwconv_tkeep[110][S_AXIS_SCALAR_110_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_110_tstrb = out_dwconv_tstrb[110][S_AXIS_SCALAR_110_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_110_tdata = out_dwconv_tdata[110][S_AXIS_SCALAR_110_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[110] = m_axis_scalar_110_tready;
        end
        if(C_NUM_OUTSCALARS > 111 && M_AXIS_SCALAR_111_IS_DIRECT == 1) begin
            assign out_clk[111] = m_axis_scalar_111_aclk;
            assign out_rst[111] = m_axis_scalar_111_aresetn;
            assign m_axis_scalar_111_tlast = out_dwconv_tlast[111];
            assign m_axis_scalar_111_tvalid = out_dwconv_tvalid[111];
            assign m_axis_scalar_111_tkeep = out_dwconv_tkeep[111][S_AXIS_SCALAR_111_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_111_tstrb = out_dwconv_tstrb[111][S_AXIS_SCALAR_111_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_111_tdata = out_dwconv_tdata[111][S_AXIS_SCALAR_111_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[111] = m_axis_scalar_111_tready;
        end
        if(C_NUM_OUTSCALARS > 112 && M_AXIS_SCALAR_112_IS_DIRECT == 1) begin
            assign out_clk[112] = m_axis_scalar_112_aclk;
            assign out_rst[112] = m_axis_scalar_112_aresetn;
            assign m_axis_scalar_112_tlast = out_dwconv_tlast[112];
            assign m_axis_scalar_112_tvalid = out_dwconv_tvalid[112];
            assign m_axis_scalar_112_tkeep = out_dwconv_tkeep[112][S_AXIS_SCALAR_112_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_112_tstrb = out_dwconv_tstrb[112][S_AXIS_SCALAR_112_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_112_tdata = out_dwconv_tdata[112][S_AXIS_SCALAR_112_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[112] = m_axis_scalar_112_tready;
        end
        if(C_NUM_OUTSCALARS > 113 && M_AXIS_SCALAR_113_IS_DIRECT == 1) begin
            assign out_clk[113] = m_axis_scalar_113_aclk;
            assign out_rst[113] = m_axis_scalar_113_aresetn;
            assign m_axis_scalar_113_tlast = out_dwconv_tlast[113];
            assign m_axis_scalar_113_tvalid = out_dwconv_tvalid[113];
            assign m_axis_scalar_113_tkeep = out_dwconv_tkeep[113][S_AXIS_SCALAR_113_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_113_tstrb = out_dwconv_tstrb[113][S_AXIS_SCALAR_113_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_113_tdata = out_dwconv_tdata[113][S_AXIS_SCALAR_113_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[113] = m_axis_scalar_113_tready;
        end
        if(C_NUM_OUTSCALARS > 114 && M_AXIS_SCALAR_114_IS_DIRECT == 1) begin
            assign out_clk[114] = m_axis_scalar_114_aclk;
            assign out_rst[114] = m_axis_scalar_114_aresetn;
            assign m_axis_scalar_114_tlast = out_dwconv_tlast[114];
            assign m_axis_scalar_114_tvalid = out_dwconv_tvalid[114];
            assign m_axis_scalar_114_tkeep = out_dwconv_tkeep[114][S_AXIS_SCALAR_114_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_114_tstrb = out_dwconv_tstrb[114][S_AXIS_SCALAR_114_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_114_tdata = out_dwconv_tdata[114][S_AXIS_SCALAR_114_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[114] = m_axis_scalar_114_tready;
        end
        if(C_NUM_OUTSCALARS > 115 && M_AXIS_SCALAR_115_IS_DIRECT == 1) begin
            assign out_clk[115] = m_axis_scalar_115_aclk;
            assign out_rst[115] = m_axis_scalar_115_aresetn;
            assign m_axis_scalar_115_tlast = out_dwconv_tlast[115];
            assign m_axis_scalar_115_tvalid = out_dwconv_tvalid[115];
            assign m_axis_scalar_115_tkeep = out_dwconv_tkeep[115][S_AXIS_SCALAR_115_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_115_tstrb = out_dwconv_tstrb[115][S_AXIS_SCALAR_115_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_115_tdata = out_dwconv_tdata[115][S_AXIS_SCALAR_115_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[115] = m_axis_scalar_115_tready;
        end
        if(C_NUM_OUTSCALARS > 116 && M_AXIS_SCALAR_116_IS_DIRECT == 1) begin
            assign out_clk[116] = m_axis_scalar_116_aclk;
            assign out_rst[116] = m_axis_scalar_116_aresetn;
            assign m_axis_scalar_116_tlast = out_dwconv_tlast[116];
            assign m_axis_scalar_116_tvalid = out_dwconv_tvalid[116];
            assign m_axis_scalar_116_tkeep = out_dwconv_tkeep[116][S_AXIS_SCALAR_116_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_116_tstrb = out_dwconv_tstrb[116][S_AXIS_SCALAR_116_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_116_tdata = out_dwconv_tdata[116][S_AXIS_SCALAR_116_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[116] = m_axis_scalar_116_tready;
        end
        if(C_NUM_OUTSCALARS > 117 && M_AXIS_SCALAR_117_IS_DIRECT == 1) begin
            assign out_clk[117] = m_axis_scalar_117_aclk;
            assign out_rst[117] = m_axis_scalar_117_aresetn;
            assign m_axis_scalar_117_tlast = out_dwconv_tlast[117];
            assign m_axis_scalar_117_tvalid = out_dwconv_tvalid[117];
            assign m_axis_scalar_117_tkeep = out_dwconv_tkeep[117][S_AXIS_SCALAR_117_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_117_tstrb = out_dwconv_tstrb[117][S_AXIS_SCALAR_117_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_117_tdata = out_dwconv_tdata[117][S_AXIS_SCALAR_117_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[117] = m_axis_scalar_117_tready;
        end
        if(C_NUM_OUTSCALARS > 118 && M_AXIS_SCALAR_118_IS_DIRECT == 1) begin
            assign out_clk[118] = m_axis_scalar_118_aclk;
            assign out_rst[118] = m_axis_scalar_118_aresetn;
            assign m_axis_scalar_118_tlast = out_dwconv_tlast[118];
            assign m_axis_scalar_118_tvalid = out_dwconv_tvalid[118];
            assign m_axis_scalar_118_tkeep = out_dwconv_tkeep[118][S_AXIS_SCALAR_118_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_118_tstrb = out_dwconv_tstrb[118][S_AXIS_SCALAR_118_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_118_tdata = out_dwconv_tdata[118][S_AXIS_SCALAR_118_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[118] = m_axis_scalar_118_tready;
        end
        if(C_NUM_OUTSCALARS > 119 && M_AXIS_SCALAR_119_IS_DIRECT == 1) begin
            assign out_clk[119] = m_axis_scalar_119_aclk;
            assign out_rst[119] = m_axis_scalar_119_aresetn;
            assign m_axis_scalar_119_tlast = out_dwconv_tlast[119];
            assign m_axis_scalar_119_tvalid = out_dwconv_tvalid[119];
            assign m_axis_scalar_119_tkeep = out_dwconv_tkeep[119][S_AXIS_SCALAR_119_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_119_tstrb = out_dwconv_tstrb[119][S_AXIS_SCALAR_119_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_119_tdata = out_dwconv_tdata[119][S_AXIS_SCALAR_119_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[119] = m_axis_scalar_119_tready;
        end
        if(C_NUM_OUTSCALARS > 120 && M_AXIS_SCALAR_120_IS_DIRECT == 1) begin
            assign out_clk[120] = m_axis_scalar_120_aclk;
            assign out_rst[120] = m_axis_scalar_120_aresetn;
            assign m_axis_scalar_120_tlast = out_dwconv_tlast[120];
            assign m_axis_scalar_120_tvalid = out_dwconv_tvalid[120];
            assign m_axis_scalar_120_tkeep = out_dwconv_tkeep[120][S_AXIS_SCALAR_120_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_120_tstrb = out_dwconv_tstrb[120][S_AXIS_SCALAR_120_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_120_tdata = out_dwconv_tdata[120][S_AXIS_SCALAR_120_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[120] = m_axis_scalar_120_tready;
        end
        if(C_NUM_OUTSCALARS > 121 && M_AXIS_SCALAR_121_IS_DIRECT == 1) begin
            assign out_clk[121] = m_axis_scalar_121_aclk;
            assign out_rst[121] = m_axis_scalar_121_aresetn;
            assign m_axis_scalar_121_tlast = out_dwconv_tlast[121];
            assign m_axis_scalar_121_tvalid = out_dwconv_tvalid[121];
            assign m_axis_scalar_121_tkeep = out_dwconv_tkeep[121][S_AXIS_SCALAR_121_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_121_tstrb = out_dwconv_tstrb[121][S_AXIS_SCALAR_121_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_121_tdata = out_dwconv_tdata[121][S_AXIS_SCALAR_121_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[121] = m_axis_scalar_121_tready;
        end
        if(C_NUM_OUTSCALARS > 122 && M_AXIS_SCALAR_122_IS_DIRECT == 1) begin
            assign out_clk[122] = m_axis_scalar_122_aclk;
            assign out_rst[122] = m_axis_scalar_122_aresetn;
            assign m_axis_scalar_122_tlast = out_dwconv_tlast[122];
            assign m_axis_scalar_122_tvalid = out_dwconv_tvalid[122];
            assign m_axis_scalar_122_tkeep = out_dwconv_tkeep[122][S_AXIS_SCALAR_122_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_122_tstrb = out_dwconv_tstrb[122][S_AXIS_SCALAR_122_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_122_tdata = out_dwconv_tdata[122][S_AXIS_SCALAR_122_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[122] = m_axis_scalar_122_tready;
        end
        if(C_NUM_OUTSCALARS > 123 && M_AXIS_SCALAR_123_IS_DIRECT == 1) begin
            assign out_clk[123] = m_axis_scalar_123_aclk;
            assign out_rst[123] = m_axis_scalar_123_aresetn;
            assign m_axis_scalar_123_tlast = out_dwconv_tlast[123];
            assign m_axis_scalar_123_tvalid = out_dwconv_tvalid[123];
            assign m_axis_scalar_123_tkeep = out_dwconv_tkeep[123][S_AXIS_SCALAR_123_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_123_tstrb = out_dwconv_tstrb[123][S_AXIS_SCALAR_123_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_123_tdata = out_dwconv_tdata[123][S_AXIS_SCALAR_123_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[123] = m_axis_scalar_123_tready;
        end
        if(C_NUM_OUTSCALARS > 124 && M_AXIS_SCALAR_124_IS_DIRECT == 1) begin
            assign out_clk[124] = m_axis_scalar_124_aclk;
            assign out_rst[124] = m_axis_scalar_124_aresetn;
            assign m_axis_scalar_124_tlast = out_dwconv_tlast[124];
            assign m_axis_scalar_124_tvalid = out_dwconv_tvalid[124];
            assign m_axis_scalar_124_tkeep = out_dwconv_tkeep[124][S_AXIS_SCALAR_124_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_124_tstrb = out_dwconv_tstrb[124][S_AXIS_SCALAR_124_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_124_tdata = out_dwconv_tdata[124][S_AXIS_SCALAR_124_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[124] = m_axis_scalar_124_tready;
        end
        if(C_NUM_OUTSCALARS > 125 && M_AXIS_SCALAR_125_IS_DIRECT == 1) begin
            assign out_clk[125] = m_axis_scalar_125_aclk;
            assign out_rst[125] = m_axis_scalar_125_aresetn;
            assign m_axis_scalar_125_tlast = out_dwconv_tlast[125];
            assign m_axis_scalar_125_tvalid = out_dwconv_tvalid[125];
            assign m_axis_scalar_125_tkeep = out_dwconv_tkeep[125][S_AXIS_SCALAR_125_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_125_tstrb = out_dwconv_tstrb[125][S_AXIS_SCALAR_125_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_125_tdata = out_dwconv_tdata[125][S_AXIS_SCALAR_125_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[125] = m_axis_scalar_125_tready;
        end
        if(C_NUM_OUTSCALARS > 126 && M_AXIS_SCALAR_126_IS_DIRECT == 1) begin
            assign out_clk[126] = m_axis_scalar_126_aclk;
            assign out_rst[126] = m_axis_scalar_126_aresetn;
            assign m_axis_scalar_126_tlast = out_dwconv_tlast[126];
            assign m_axis_scalar_126_tvalid = out_dwconv_tvalid[126];
            assign m_axis_scalar_126_tkeep = out_dwconv_tkeep[126][S_AXIS_SCALAR_126_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_126_tstrb = out_dwconv_tstrb[126][S_AXIS_SCALAR_126_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_126_tdata = out_dwconv_tdata[126][S_AXIS_SCALAR_126_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[126] = m_axis_scalar_126_tready;
        end
        if(C_NUM_OUTSCALARS > 127 && M_AXIS_SCALAR_127_IS_DIRECT == 1) begin
            assign out_clk[127] = m_axis_scalar_127_aclk;
            assign out_rst[127] = m_axis_scalar_127_aresetn;
            assign m_axis_scalar_127_tlast = out_dwconv_tlast[127];
            assign m_axis_scalar_127_tvalid = out_dwconv_tvalid[127];
            assign m_axis_scalar_127_tkeep = out_dwconv_tkeep[127][S_AXIS_SCALAR_127_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_127_tstrb = out_dwconv_tstrb[127][S_AXIS_SCALAR_127_DIRECT_DMWIDTH/8-1:0];
            assign m_axis_scalar_127_tdata = out_dwconv_tdata[127][S_AXIS_SCALAR_127_DIRECT_DMWIDTH-1:0];
            assign out_dwconv_tready[127] = m_axis_scalar_127_tready;
        end
    endgenerate

always @(posedge acc_clk)
    capture_reg <= outscalar_capture;

generate
    //map input scalar data values from register to ports
    if(C_NUM_INSCALARS > 0)
        assign inscalar0 = inscalar[0][C_INSCALAR_0_BITS-1:0];
    else begin
        assign inscalar0 = 0;
        assign inscalar_fifo_empty = 0;
        assign inscalar_fifo_full = 0;
    end

    if(C_NUM_INSCALARS > 1)
        assign inscalar1 = inscalar[1][C_INSCALAR_1_BITS-1:0];
    else
        assign inscalar1 = 0;

    if(C_NUM_INSCALARS > 2)
        assign inscalar2 = inscalar[2][C_INSCALAR_2_BITS-1:0];
    else
        assign inscalar2 = 0;

    if(C_NUM_INSCALARS > 3)
        assign inscalar3 = inscalar[3][C_INSCALAR_3_BITS-1:0];
    else
        assign inscalar3 = 0;

    if(C_NUM_INSCALARS > 4)
        assign inscalar4 = inscalar[4][C_INSCALAR_4_BITS-1:0];
    else
        assign inscalar4 = 0;

    if(C_NUM_INSCALARS > 5)
        assign inscalar5 = inscalar[5][C_INSCALAR_5_BITS-1:0];
    else
        assign inscalar5 = 0;

    if(C_NUM_INSCALARS > 6)
        assign inscalar6 = inscalar[6][C_INSCALAR_6_BITS-1:0];
    else
        assign inscalar6 = 0;

    if(C_NUM_INSCALARS > 7)
        assign inscalar7 = inscalar[7][C_INSCALAR_7_BITS-1:0];
    else
        assign inscalar7 = 0;

    if(C_NUM_INSCALARS > 8)
        assign inscalar8 = inscalar[8][C_INSCALAR_8_BITS-1:0];
    else
        assign inscalar8 = 0;

    if(C_NUM_INSCALARS > 9)
        assign inscalar9 = inscalar[9][C_INSCALAR_9_BITS-1:0];
    else
        assign inscalar9 = 0;

    if(C_NUM_INSCALARS > 10)
        assign inscalar10 = inscalar[10][C_INSCALAR_10_BITS-1:0];
    else
        assign inscalar10 = 0;

    if(C_NUM_INSCALARS > 11)
        assign inscalar11 = inscalar[11][C_INSCALAR_11_BITS-1:0];
    else
        assign inscalar11 = 0;

    if(C_NUM_INSCALARS > 12)
        assign inscalar12 = inscalar[12][C_INSCALAR_12_BITS-1:0];
    else
        assign inscalar12 = 0;

    if(C_NUM_INSCALARS > 13)
        assign inscalar13 = inscalar[13][C_INSCALAR_13_BITS-1:0];
    else
        assign inscalar13 = 0;

    if(C_NUM_INSCALARS > 14)
        assign inscalar14 = inscalar[14][C_INSCALAR_14_BITS-1:0];
    else
        assign inscalar14 = 0;

    if(C_NUM_INSCALARS > 15)
        assign inscalar15 = inscalar[15][C_INSCALAR_15_BITS-1:0];
    else
        assign inscalar15 = 0;

    if(C_NUM_INSCALARS > 16)
        assign inscalar16 = inscalar[16][C_INSCALAR_16_BITS-1:0];
    else
        assign inscalar16 = 0;

    if(C_NUM_INSCALARS > 17)
        assign inscalar17 = inscalar[17][C_INSCALAR_17_BITS-1:0];
    else
        assign inscalar17 = 0;

    if(C_NUM_INSCALARS > 18)
        assign inscalar18 = inscalar[18][C_INSCALAR_18_BITS-1:0];
    else
        assign inscalar18 = 0;

    if(C_NUM_INSCALARS > 19)
        assign inscalar19 = inscalar[19][C_INSCALAR_19_BITS-1:0];
    else
        assign inscalar19 = 0;

    if(C_NUM_INSCALARS > 20)
        assign inscalar20 = inscalar[20][C_INSCALAR_20_BITS-1:0];
    else
        assign inscalar20 = 0;

    if(C_NUM_INSCALARS > 21)
        assign inscalar21 = inscalar[21][C_INSCALAR_21_BITS-1:0];
    else
        assign inscalar21 = 0;

    if(C_NUM_INSCALARS > 22)
        assign inscalar22 = inscalar[22][C_INSCALAR_22_BITS-1:0];
    else
        assign inscalar22 = 0;

    if(C_NUM_INSCALARS > 23)
        assign inscalar23 = inscalar[23][C_INSCALAR_23_BITS-1:0];
    else
        assign inscalar23 = 0;

    if(C_NUM_INSCALARS > 24)
        assign inscalar24 = inscalar[24][C_INSCALAR_24_BITS-1:0];
    else
        assign inscalar24 = 0;

    if(C_NUM_INSCALARS > 25)
        assign inscalar25 = inscalar[25][C_INSCALAR_25_BITS-1:0];
    else
        assign inscalar25 = 0;

    if(C_NUM_INSCALARS > 26)
        assign inscalar26 = inscalar[26][C_INSCALAR_26_BITS-1:0];
    else
        assign inscalar26 = 0;

    if(C_NUM_INSCALARS > 27)
        assign inscalar27 = inscalar[27][C_INSCALAR_27_BITS-1:0];
    else
        assign inscalar27 = 0;

    if(C_NUM_INSCALARS > 28)
        assign inscalar28 = inscalar[28][C_INSCALAR_28_BITS-1:0];
    else
        assign inscalar28 = 0;

    if(C_NUM_INSCALARS > 29)
        assign inscalar29 = inscalar[29][C_INSCALAR_29_BITS-1:0];
    else
        assign inscalar29 = 0;

    if(C_NUM_INSCALARS > 30)
        assign inscalar30 = inscalar[30][C_INSCALAR_30_BITS-1:0];
    else
        assign inscalar30 = 0;

    if(C_NUM_INSCALARS > 31)
        assign inscalar31 = inscalar[31][C_INSCALAR_31_BITS-1:0];
    else
        assign inscalar31 = 0;

    if(C_NUM_INSCALARS > 32)
        assign inscalar32 = inscalar[32][C_INSCALAR_32_BITS-1:0];
    else
        assign inscalar32 = 0;

    if(C_NUM_INSCALARS > 33)
        assign inscalar33 = inscalar[33][C_INSCALAR_33_BITS-1:0];
    else
        assign inscalar33 = 0;

    if(C_NUM_INSCALARS > 34)
        assign inscalar34 = inscalar[34][C_INSCALAR_34_BITS-1:0];
    else
        assign inscalar34 = 0;

    if(C_NUM_INSCALARS > 35)
        assign inscalar35 = inscalar[35][C_INSCALAR_35_BITS-1:0];
    else
        assign inscalar35 = 0;

    if(C_NUM_INSCALARS > 36)
        assign inscalar36 = inscalar[36][C_INSCALAR_36_BITS-1:0];
    else
        assign inscalar36 = 0;

    if(C_NUM_INSCALARS > 37)
        assign inscalar37 = inscalar[37][C_INSCALAR_37_BITS-1:0];
    else
        assign inscalar37 = 0;

    if(C_NUM_INSCALARS > 38)
        assign inscalar38 = inscalar[38][C_INSCALAR_38_BITS-1:0];
    else
        assign inscalar38 = 0;

    if(C_NUM_INSCALARS > 39)
        assign inscalar39 = inscalar[39][C_INSCALAR_39_BITS-1:0];
    else
        assign inscalar39 = 0;

    if(C_NUM_INSCALARS > 40)
        assign inscalar40 = inscalar[40][C_INSCALAR_40_BITS-1:0];
    else
        assign inscalar40 = 0;

    if(C_NUM_INSCALARS > 41)
        assign inscalar41 = inscalar[41][C_INSCALAR_41_BITS-1:0];
    else
        assign inscalar41 = 0;

    if(C_NUM_INSCALARS > 42)
        assign inscalar42 = inscalar[42][C_INSCALAR_42_BITS-1:0];
    else
        assign inscalar42 = 0;

    if(C_NUM_INSCALARS > 43)
        assign inscalar43 = inscalar[43][C_INSCALAR_43_BITS-1:0];
    else
        assign inscalar43 = 0;

    if(C_NUM_INSCALARS > 44)
        assign inscalar44 = inscalar[44][C_INSCALAR_44_BITS-1:0];
    else
        assign inscalar44 = 0;

    if(C_NUM_INSCALARS > 45)
        assign inscalar45 = inscalar[45][C_INSCALAR_45_BITS-1:0];
    else
        assign inscalar45 = 0;

    if(C_NUM_INSCALARS > 46)
        assign inscalar46 = inscalar[46][C_INSCALAR_46_BITS-1:0];
    else
        assign inscalar46 = 0;

    if(C_NUM_INSCALARS > 47)
        assign inscalar47 = inscalar[47][C_INSCALAR_47_BITS-1:0];
    else
        assign inscalar47 = 0;

    if(C_NUM_INSCALARS > 48)
        assign inscalar48 = inscalar[48][C_INSCALAR_48_BITS-1:0];
    else
        assign inscalar48 = 0;

    if(C_NUM_INSCALARS > 49)
        assign inscalar49 = inscalar[49][C_INSCALAR_49_BITS-1:0];
    else
        assign inscalar49 = 0;

    if(C_NUM_INSCALARS > 50)
        assign inscalar50 = inscalar[50][C_INSCALAR_50_BITS-1:0];
    else
        assign inscalar50 = 0;

    if(C_NUM_INSCALARS > 51)
        assign inscalar51 = inscalar[51][C_INSCALAR_51_BITS-1:0];
    else
        assign inscalar51 = 0;

    if(C_NUM_INSCALARS > 52)
        assign inscalar52 = inscalar[52][C_INSCALAR_52_BITS-1:0];
    else
        assign inscalar52 = 0;

    if(C_NUM_INSCALARS > 53)
        assign inscalar53 = inscalar[53][C_INSCALAR_53_BITS-1:0];
    else
        assign inscalar53 = 0;

    if(C_NUM_INSCALARS > 54)
        assign inscalar54 = inscalar[54][C_INSCALAR_54_BITS-1:0];
    else
        assign inscalar54 = 0;

    if(C_NUM_INSCALARS > 55)
        assign inscalar55 = inscalar[55][C_INSCALAR_55_BITS-1:0];
    else
        assign inscalar55 = 0;

    if(C_NUM_INSCALARS > 56)
        assign inscalar56 = inscalar[56][C_INSCALAR_56_BITS-1:0];
    else
        assign inscalar56 = 0;

    if(C_NUM_INSCALARS > 57)
        assign inscalar57 = inscalar[57][C_INSCALAR_57_BITS-1:0];
    else
        assign inscalar57 = 0;

    if(C_NUM_INSCALARS > 58)
        assign inscalar58 = inscalar[58][C_INSCALAR_58_BITS-1:0];
    else
        assign inscalar58 = 0;

    if(C_NUM_INSCALARS > 59)
        assign inscalar59 = inscalar[59][C_INSCALAR_59_BITS-1:0];
    else
        assign inscalar59 = 0;

    if(C_NUM_INSCALARS > 60)
        assign inscalar60 = inscalar[60][C_INSCALAR_60_BITS-1:0];
    else
        assign inscalar60 = 0;

    if(C_NUM_INSCALARS > 61)
        assign inscalar61 = inscalar[61][C_INSCALAR_61_BITS-1:0];
    else
        assign inscalar61 = 0;

    if(C_NUM_INSCALARS > 62)
        assign inscalar62 = inscalar[62][C_INSCALAR_62_BITS-1:0];
    else
        assign inscalar62 = 0;

    if(C_NUM_INSCALARS > 63)
        assign inscalar63 = inscalar[63][C_INSCALAR_63_BITS-1:0];
    else
        assign inscalar63 = 0;

    if(C_NUM_INSCALARS > 64)
        assign inscalar64 = inscalar[64][C_INSCALAR_64_BITS-1:0];
    else
        assign inscalar64 = 0;

    if(C_NUM_INSCALARS > 65)
        assign inscalar65 = inscalar[65][C_INSCALAR_65_BITS-1:0];
    else
        assign inscalar65 = 0;

    if(C_NUM_INSCALARS > 66)
        assign inscalar66 = inscalar[66][C_INSCALAR_66_BITS-1:0];
    else
        assign inscalar66 = 0;

    if(C_NUM_INSCALARS > 67)
        assign inscalar67 = inscalar[67][C_INSCALAR_67_BITS-1:0];
    else
        assign inscalar67 = 0;

    if(C_NUM_INSCALARS > 68)
        assign inscalar68 = inscalar[68][C_INSCALAR_68_BITS-1:0];
    else
        assign inscalar68 = 0;

    if(C_NUM_INSCALARS > 69)
        assign inscalar69 = inscalar[69][C_INSCALAR_69_BITS-1:0];
    else
        assign inscalar69 = 0;

    if(C_NUM_INSCALARS > 70)
        assign inscalar70 = inscalar[70][C_INSCALAR_70_BITS-1:0];
    else
        assign inscalar70 = 0;

    if(C_NUM_INSCALARS > 71)
        assign inscalar71 = inscalar[71][C_INSCALAR_71_BITS-1:0];
    else
        assign inscalar71 = 0;

    if(C_NUM_INSCALARS > 72)
        assign inscalar72 = inscalar[72][C_INSCALAR_72_BITS-1:0];
    else
        assign inscalar72 = 0;

    if(C_NUM_INSCALARS > 73)
        assign inscalar73 = inscalar[73][C_INSCALAR_73_BITS-1:0];
    else
        assign inscalar73 = 0;

    if(C_NUM_INSCALARS > 74)
        assign inscalar74 = inscalar[74][C_INSCALAR_74_BITS-1:0];
    else
        assign inscalar74 = 0;

    if(C_NUM_INSCALARS > 75)
        assign inscalar75 = inscalar[75][C_INSCALAR_75_BITS-1:0];
    else
        assign inscalar75 = 0;

    if(C_NUM_INSCALARS > 76)
        assign inscalar76 = inscalar[76][C_INSCALAR_76_BITS-1:0];
    else
        assign inscalar76 = 0;

    if(C_NUM_INSCALARS > 77)
        assign inscalar77 = inscalar[77][C_INSCALAR_77_BITS-1:0];
    else
        assign inscalar77 = 0;

    if(C_NUM_INSCALARS > 78)
        assign inscalar78 = inscalar[78][C_INSCALAR_78_BITS-1:0];
    else
        assign inscalar78 = 0;

    if(C_NUM_INSCALARS > 79)
        assign inscalar79 = inscalar[79][C_INSCALAR_79_BITS-1:0];
    else
        assign inscalar79 = 0;

    if(C_NUM_INSCALARS > 80)
        assign inscalar80 = inscalar[80][C_INSCALAR_80_BITS-1:0];
    else
        assign inscalar80 = 0;

    if(C_NUM_INSCALARS > 81)
        assign inscalar81 = inscalar[81][C_INSCALAR_81_BITS-1:0];
    else
        assign inscalar81 = 0;

    if(C_NUM_INSCALARS > 82)
        assign inscalar82 = inscalar[82][C_INSCALAR_82_BITS-1:0];
    else
        assign inscalar82 = 0;

    if(C_NUM_INSCALARS > 83)
        assign inscalar83 = inscalar[83][C_INSCALAR_83_BITS-1:0];
    else
        assign inscalar83 = 0;

    if(C_NUM_INSCALARS > 84)
        assign inscalar84 = inscalar[84][C_INSCALAR_84_BITS-1:0];
    else
        assign inscalar84 = 0;

    if(C_NUM_INSCALARS > 85)
        assign inscalar85 = inscalar[85][C_INSCALAR_85_BITS-1:0];
    else
        assign inscalar85 = 0;

    if(C_NUM_INSCALARS > 86)
        assign inscalar86 = inscalar[86][C_INSCALAR_86_BITS-1:0];
    else
        assign inscalar86 = 0;

    if(C_NUM_INSCALARS > 87)
        assign inscalar87 = inscalar[87][C_INSCALAR_87_BITS-1:0];
    else
        assign inscalar87 = 0;

    if(C_NUM_INSCALARS > 88)
        assign inscalar88 = inscalar[88][C_INSCALAR_88_BITS-1:0];
    else
        assign inscalar88 = 0;

    if(C_NUM_INSCALARS > 89)
        assign inscalar89 = inscalar[89][C_INSCALAR_89_BITS-1:0];
    else
        assign inscalar89 = 0;

    if(C_NUM_INSCALARS > 90)
        assign inscalar90 = inscalar[90][C_INSCALAR_90_BITS-1:0];
    else
        assign inscalar90 = 0;

    if(C_NUM_INSCALARS > 91)
        assign inscalar91 = inscalar[91][C_INSCALAR_91_BITS-1:0];
    else
        assign inscalar91 = 0;

    if(C_NUM_INSCALARS > 92)
        assign inscalar92 = inscalar[92][C_INSCALAR_92_BITS-1:0];
    else
        assign inscalar92 = 0;

    if(C_NUM_INSCALARS > 93)
        assign inscalar93 = inscalar[93][C_INSCALAR_93_BITS-1:0];
    else
        assign inscalar93 = 0;

    if(C_NUM_INSCALARS > 94)
        assign inscalar94 = inscalar[94][C_INSCALAR_94_BITS-1:0];
    else
        assign inscalar94 = 0;

    if(C_NUM_INSCALARS > 95)
        assign inscalar95 = inscalar[95][C_INSCALAR_95_BITS-1:0];
    else
        assign inscalar95 = 0;

    if(C_NUM_INSCALARS > 96)
        assign inscalar96 = inscalar[96][C_INSCALAR_96_BITS-1:0];
    else
        assign inscalar96 = 0;

    if(C_NUM_INSCALARS > 97)
        assign inscalar97 = inscalar[97][C_INSCALAR_97_BITS-1:0];
    else
        assign inscalar97 = 0;

    if(C_NUM_INSCALARS > 98)
        assign inscalar98 = inscalar[98][C_INSCALAR_98_BITS-1:0];
    else
        assign inscalar98 = 0;

    if(C_NUM_INSCALARS > 99)
        assign inscalar99 = inscalar[99][C_INSCALAR_99_BITS-1:0];
    else
        assign inscalar99 = 0;

    if(C_NUM_INSCALARS > 100)
        assign inscalar100 = inscalar[100][C_INSCALAR_100_BITS-1:0];
    else
        assign inscalar100 = 0;

    if(C_NUM_INSCALARS > 101)
        assign inscalar101 = inscalar[101][C_INSCALAR_101_BITS-1:0];
    else
        assign inscalar101 = 0;

    if(C_NUM_INSCALARS > 102)
        assign inscalar102 = inscalar[102][C_INSCALAR_102_BITS-1:0];
    else
        assign inscalar102 = 0;

    if(C_NUM_INSCALARS > 103)
        assign inscalar103 = inscalar[103][C_INSCALAR_103_BITS-1:0];
    else
        assign inscalar103 = 0;

    if(C_NUM_INSCALARS > 104)
        assign inscalar104 = inscalar[104][C_INSCALAR_104_BITS-1:0];
    else
        assign inscalar104 = 0;

    if(C_NUM_INSCALARS > 105)
        assign inscalar105 = inscalar[105][C_INSCALAR_105_BITS-1:0];
    else
        assign inscalar105 = 0;

    if(C_NUM_INSCALARS > 106)
        assign inscalar106 = inscalar[106][C_INSCALAR_106_BITS-1:0];
    else
        assign inscalar106 = 0;

    if(C_NUM_INSCALARS > 107)
        assign inscalar107 = inscalar[107][C_INSCALAR_107_BITS-1:0];
    else
        assign inscalar107 = 0;

    if(C_NUM_INSCALARS > 108)
        assign inscalar108 = inscalar[108][C_INSCALAR_108_BITS-1:0];
    else
        assign inscalar108 = 0;

    if(C_NUM_INSCALARS > 109)
        assign inscalar109 = inscalar[109][C_INSCALAR_109_BITS-1:0];
    else
        assign inscalar109 = 0;

    if(C_NUM_INSCALARS > 110)
        assign inscalar110 = inscalar[110][C_INSCALAR_110_BITS-1:0];
    else
        assign inscalar110 = 0;

    if(C_NUM_INSCALARS > 111)
        assign inscalar111 = inscalar[111][C_INSCALAR_111_BITS-1:0];
    else
        assign inscalar111 = 0;

    if(C_NUM_INSCALARS > 112)
        assign inscalar112 = inscalar[112][C_INSCALAR_112_BITS-1:0];
    else
        assign inscalar112 = 0;

    if(C_NUM_INSCALARS > 113)
        assign inscalar113 = inscalar[113][C_INSCALAR_113_BITS-1:0];
    else
        assign inscalar113 = 0;

    if(C_NUM_INSCALARS > 114)
        assign inscalar114 = inscalar[114][C_INSCALAR_114_BITS-1:0];
    else
        assign inscalar114 = 0;

    if(C_NUM_INSCALARS > 115)
        assign inscalar115 = inscalar[115][C_INSCALAR_115_BITS-1:0];
    else
        assign inscalar115 = 0;

    if(C_NUM_INSCALARS > 116)
        assign inscalar116 = inscalar[116][C_INSCALAR_116_BITS-1:0];
    else
        assign inscalar116 = 0;

    if(C_NUM_INSCALARS > 117)
        assign inscalar117 = inscalar[117][C_INSCALAR_117_BITS-1:0];
    else
        assign inscalar117 = 0;

    if(C_NUM_INSCALARS > 118)
        assign inscalar118 = inscalar[118][C_INSCALAR_118_BITS-1:0];
    else
        assign inscalar118 = 0;

    if(C_NUM_INSCALARS > 119)
        assign inscalar119 = inscalar[119][C_INSCALAR_119_BITS-1:0];
    else
        assign inscalar119 = 0;

    if(C_NUM_INSCALARS > 120)
        assign inscalar120 = inscalar[120][C_INSCALAR_120_BITS-1:0];
    else
        assign inscalar120 = 0;

    if(C_NUM_INSCALARS > 121)
        assign inscalar121 = inscalar[121][C_INSCALAR_121_BITS-1:0];
    else
        assign inscalar121 = 0;

    if(C_NUM_INSCALARS > 122)
        assign inscalar122 = inscalar[122][C_INSCALAR_122_BITS-1:0];
    else
        assign inscalar122 = 0;

    if(C_NUM_INSCALARS > 123)
        assign inscalar123 = inscalar[123][C_INSCALAR_123_BITS-1:0];
    else
        assign inscalar123 = 0;

    if(C_NUM_INSCALARS > 124)
        assign inscalar124 = inscalar[124][C_INSCALAR_124_BITS-1:0];
    else
        assign inscalar124 = 0;

    if(C_NUM_INSCALARS > 125)
        assign inscalar125 = inscalar[125][C_INSCALAR_125_BITS-1:0];
    else
        assign inscalar125 = 0;

    if(C_NUM_INSCALARS > 126)
        assign inscalar126 = inscalar[126][C_INSCALAR_126_BITS-1:0];
    else
        assign inscalar126 = 0;

    if(C_NUM_INSCALARS > 127)
        assign inscalar127 = inscalar[127][C_INSCALAR_127_BITS-1:0];
    else
        assign inscalar127 = 0;

endgenerate

//map output scalar data values from ports to register
generate
    if(C_NUM_OUTSCALARS > 0) begin
        assign outscalar[0][C_OUTSCALAR_0_BITS-1:0] = outscalar0;
        if(C_HAS_RETURN > 0)
            assign outscalar_vld[0] = outscalar_capture;
        else
            assign outscalar_vld[0] = outscalar0_vld;
    end
    if(C_NUM_OUTSCALARS > 1) begin
        assign outscalar[1][C_OUTSCALAR_1_BITS-1:0] = outscalar1;
        assign outscalar_vld[1] = outscalar1_vld;
    end
    if(C_NUM_OUTSCALARS > 2) begin
        assign outscalar[2][C_OUTSCALAR_2_BITS-1:0] = outscalar2;
        assign outscalar_vld[2] = outscalar2_vld;
    end
    if(C_NUM_OUTSCALARS > 3) begin
        assign outscalar[3][C_OUTSCALAR_3_BITS-1:0] = outscalar3;
        assign outscalar_vld[3] = outscalar3_vld;
    end
    if(C_NUM_OUTSCALARS > 4) begin
        assign outscalar[4][C_OUTSCALAR_4_BITS-1:0] = outscalar4;
        assign outscalar_vld[4] = outscalar4_vld;
    end
    if(C_NUM_OUTSCALARS > 5) begin
        assign outscalar[5][C_OUTSCALAR_5_BITS-1:0] = outscalar5;
        assign outscalar_vld[5] = outscalar5_vld;
    end
    if(C_NUM_OUTSCALARS > 6) begin
        assign outscalar[6][C_OUTSCALAR_6_BITS-1:0] = outscalar6;
        assign outscalar_vld[6] = outscalar6_vld;
    end
    if(C_NUM_OUTSCALARS > 7) begin
        assign outscalar[7][C_OUTSCALAR_7_BITS-1:0] = outscalar7;
        assign outscalar_vld[7] = outscalar7_vld;
    end
    if(C_NUM_OUTSCALARS > 8) begin
        assign outscalar[8][C_OUTSCALAR_8_BITS-1:0] = outscalar8;
        assign outscalar_vld[8] = outscalar8_vld;
    end
    if(C_NUM_OUTSCALARS > 9) begin
        assign outscalar[9][C_OUTSCALAR_9_BITS-1:0] = outscalar9;
        assign outscalar_vld[9] = outscalar9_vld;
    end
    if(C_NUM_OUTSCALARS > 10) begin
        assign outscalar[10][C_OUTSCALAR_10_BITS-1:0] = outscalar10;
        assign outscalar_vld[10] = outscalar10_vld;
    end
    if(C_NUM_OUTSCALARS > 11) begin
        assign outscalar[11][C_OUTSCALAR_11_BITS-1:0] = outscalar11;
        assign outscalar_vld[11] = outscalar11_vld;
    end
    if(C_NUM_OUTSCALARS > 12) begin
        assign outscalar[12][C_OUTSCALAR_12_BITS-1:0] = outscalar12;
        assign outscalar_vld[12] = outscalar12_vld;
    end
    if(C_NUM_OUTSCALARS > 13) begin
        assign outscalar[13][C_OUTSCALAR_13_BITS-1:0] = outscalar13;
        assign outscalar_vld[13] = outscalar13_vld;
    end
    if(C_NUM_OUTSCALARS > 14) begin
        assign outscalar[14][C_OUTSCALAR_14_BITS-1:0] = outscalar14;
        assign outscalar_vld[14] = outscalar14_vld;
    end
    if(C_NUM_OUTSCALARS > 15) begin
        assign outscalar[15][C_OUTSCALAR_15_BITS-1:0] = outscalar15;
        assign outscalar_vld[15] = outscalar15_vld;
    end
    if(C_NUM_OUTSCALARS > 16) begin
        assign outscalar[16][C_OUTSCALAR_16_BITS-1:0] = outscalar16;
        assign outscalar_vld[16] = outscalar16_vld;
    end
    if(C_NUM_OUTSCALARS > 17) begin
        assign outscalar[17][C_OUTSCALAR_17_BITS-1:0] = outscalar17;
        assign outscalar_vld[17] = outscalar17_vld;
    end
    if(C_NUM_OUTSCALARS > 18) begin
        assign outscalar[18][C_OUTSCALAR_18_BITS-1:0] = outscalar18;
        assign outscalar_vld[18] = outscalar18_vld;
    end
    if(C_NUM_OUTSCALARS > 19) begin
        assign outscalar[19][C_OUTSCALAR_19_BITS-1:0] = outscalar19;
        assign outscalar_vld[19] = outscalar19_vld;
    end
    if(C_NUM_OUTSCALARS > 20) begin
        assign outscalar[20][C_OUTSCALAR_20_BITS-1:0] = outscalar20;
        assign outscalar_vld[20] = outscalar20_vld;
    end
    if(C_NUM_OUTSCALARS > 21) begin
        assign outscalar[21][C_OUTSCALAR_21_BITS-1:0] = outscalar21;
        assign outscalar_vld[21] = outscalar21_vld;
    end
    if(C_NUM_OUTSCALARS > 22) begin
        assign outscalar[22][C_OUTSCALAR_22_BITS-1:0] = outscalar22;
        assign outscalar_vld[22] = outscalar22_vld;
    end
    if(C_NUM_OUTSCALARS > 23) begin
        assign outscalar[23][C_OUTSCALAR_23_BITS-1:0] = outscalar23;
        assign outscalar_vld[23] = outscalar23_vld;
    end
    if(C_NUM_OUTSCALARS > 24) begin
        assign outscalar[24][C_OUTSCALAR_24_BITS-1:0] = outscalar24;
        assign outscalar_vld[24] = outscalar24_vld;
    end
    if(C_NUM_OUTSCALARS > 25) begin
        assign outscalar[25][C_OUTSCALAR_25_BITS-1:0] = outscalar25;
        assign outscalar_vld[25] = outscalar25_vld;
    end
    if(C_NUM_OUTSCALARS > 26) begin
        assign outscalar[26][C_OUTSCALAR_26_BITS-1:0] = outscalar26;
        assign outscalar_vld[26] = outscalar26_vld;
    end
    if(C_NUM_OUTSCALARS > 27) begin
        assign outscalar[27][C_OUTSCALAR_27_BITS-1:0] = outscalar27;
        assign outscalar_vld[27] = outscalar27_vld;
    end
    if(C_NUM_OUTSCALARS > 28) begin
        assign outscalar[28][C_OUTSCALAR_28_BITS-1:0] = outscalar28;
        assign outscalar_vld[28] = outscalar28_vld;
    end
    if(C_NUM_OUTSCALARS > 29) begin
        assign outscalar[29][C_OUTSCALAR_29_BITS-1:0] = outscalar29;
        assign outscalar_vld[29] = outscalar29_vld;
    end
    if(C_NUM_OUTSCALARS > 30) begin
        assign outscalar[30][C_OUTSCALAR_30_BITS-1:0] = outscalar30;
        assign outscalar_vld[30] = outscalar30_vld;
    end
    if(C_NUM_OUTSCALARS > 31) begin
        assign outscalar[31][C_OUTSCALAR_31_BITS-1:0] = outscalar31;
        assign outscalar_vld[31] = outscalar31_vld;
    end
    if(C_NUM_OUTSCALARS > 32) begin
        assign outscalar[32][C_OUTSCALAR_32_BITS-1:0] = outscalar32;
        assign outscalar_vld[32] = outscalar32_vld;
    end
    if(C_NUM_OUTSCALARS > 33) begin
        assign outscalar[33][C_OUTSCALAR_33_BITS-1:0] = outscalar33;
        assign outscalar_vld[33] = outscalar33_vld;
    end
    if(C_NUM_OUTSCALARS > 34) begin
        assign outscalar[34][C_OUTSCALAR_34_BITS-1:0] = outscalar34;
        assign outscalar_vld[34] = outscalar34_vld;
    end
    if(C_NUM_OUTSCALARS > 35) begin
        assign outscalar[35][C_OUTSCALAR_35_BITS-1:0] = outscalar35;
        assign outscalar_vld[35] = outscalar35_vld;
    end
    if(C_NUM_OUTSCALARS > 36) begin
        assign outscalar[36][C_OUTSCALAR_36_BITS-1:0] = outscalar36;
        assign outscalar_vld[36] = outscalar36_vld;
    end
    if(C_NUM_OUTSCALARS > 37) begin
        assign outscalar[37][C_OUTSCALAR_37_BITS-1:0] = outscalar37;
        assign outscalar_vld[37] = outscalar37_vld;
    end
    if(C_NUM_OUTSCALARS > 38) begin
        assign outscalar[38][C_OUTSCALAR_38_BITS-1:0] = outscalar38;
        assign outscalar_vld[38] = outscalar38_vld;
    end
    if(C_NUM_OUTSCALARS > 39) begin
        assign outscalar[39][C_OUTSCALAR_39_BITS-1:0] = outscalar39;
        assign outscalar_vld[39] = outscalar39_vld;
    end
    if(C_NUM_OUTSCALARS > 40) begin
        assign outscalar[40][C_OUTSCALAR_40_BITS-1:0] = outscalar40;
        assign outscalar_vld[40] = outscalar40_vld;
    end
    if(C_NUM_OUTSCALARS > 41) begin
        assign outscalar[41][C_OUTSCALAR_41_BITS-1:0] = outscalar41;
        assign outscalar_vld[41] = outscalar41_vld;
    end
    if(C_NUM_OUTSCALARS > 42) begin
        assign outscalar[42][C_OUTSCALAR_42_BITS-1:0] = outscalar42;
        assign outscalar_vld[42] = outscalar42_vld;
    end
    if(C_NUM_OUTSCALARS > 43) begin
        assign outscalar[43][C_OUTSCALAR_43_BITS-1:0] = outscalar43;
        assign outscalar_vld[43] = outscalar43_vld;
    end
    if(C_NUM_OUTSCALARS > 44) begin
        assign outscalar[44][C_OUTSCALAR_44_BITS-1:0] = outscalar44;
        assign outscalar_vld[44] = outscalar44_vld;
    end
    if(C_NUM_OUTSCALARS > 45) begin
        assign outscalar[45][C_OUTSCALAR_45_BITS-1:0] = outscalar45;
        assign outscalar_vld[45] = outscalar45_vld;
    end
    if(C_NUM_OUTSCALARS > 46) begin
        assign outscalar[46][C_OUTSCALAR_46_BITS-1:0] = outscalar46;
        assign outscalar_vld[46] = outscalar46_vld;
    end
    if(C_NUM_OUTSCALARS > 47) begin
        assign outscalar[47][C_OUTSCALAR_47_BITS-1:0] = outscalar47;
        assign outscalar_vld[47] = outscalar47_vld;
    end
    if(C_NUM_OUTSCALARS > 48) begin
        assign outscalar[48][C_OUTSCALAR_48_BITS-1:0] = outscalar48;
        assign outscalar_vld[48] = outscalar48_vld;
    end
    if(C_NUM_OUTSCALARS > 49) begin
        assign outscalar[49][C_OUTSCALAR_49_BITS-1:0] = outscalar49;
        assign outscalar_vld[49] = outscalar49_vld;
    end
    if(C_NUM_OUTSCALARS > 50) begin
        assign outscalar[50][C_OUTSCALAR_50_BITS-1:0] = outscalar50;
        assign outscalar_vld[50] = outscalar50_vld;
    end
    if(C_NUM_OUTSCALARS > 51) begin
        assign outscalar[51][C_OUTSCALAR_51_BITS-1:0] = outscalar51;
        assign outscalar_vld[51] = outscalar51_vld;
    end
    if(C_NUM_OUTSCALARS > 52) begin
        assign outscalar[52][C_OUTSCALAR_52_BITS-1:0] = outscalar52;
        assign outscalar_vld[52] = outscalar52_vld;
    end
    if(C_NUM_OUTSCALARS > 53) begin
        assign outscalar[53][C_OUTSCALAR_53_BITS-1:0] = outscalar53;
        assign outscalar_vld[53] = outscalar53_vld;
    end
    if(C_NUM_OUTSCALARS > 54) begin
        assign outscalar[54][C_OUTSCALAR_54_BITS-1:0] = outscalar54;
        assign outscalar_vld[54] = outscalar54_vld;
    end
    if(C_NUM_OUTSCALARS > 55) begin
        assign outscalar[55][C_OUTSCALAR_55_BITS-1:0] = outscalar55;
        assign outscalar_vld[55] = outscalar55_vld;
    end
    if(C_NUM_OUTSCALARS > 56) begin
        assign outscalar[56][C_OUTSCALAR_56_BITS-1:0] = outscalar56;
        assign outscalar_vld[56] = outscalar56_vld;
    end
    if(C_NUM_OUTSCALARS > 57) begin
        assign outscalar[57][C_OUTSCALAR_57_BITS-1:0] = outscalar57;
        assign outscalar_vld[57] = outscalar57_vld;
    end
    if(C_NUM_OUTSCALARS > 58) begin
        assign outscalar[58][C_OUTSCALAR_58_BITS-1:0] = outscalar58;
        assign outscalar_vld[58] = outscalar58_vld;
    end
    if(C_NUM_OUTSCALARS > 59) begin
        assign outscalar[59][C_OUTSCALAR_59_BITS-1:0] = outscalar59;
        assign outscalar_vld[59] = outscalar59_vld;
    end
    if(C_NUM_OUTSCALARS > 60) begin
        assign outscalar[60][C_OUTSCALAR_60_BITS-1:0] = outscalar60;
        assign outscalar_vld[60] = outscalar60_vld;
    end
    if(C_NUM_OUTSCALARS > 61) begin
        assign outscalar[61][C_OUTSCALAR_61_BITS-1:0] = outscalar61;
        assign outscalar_vld[61] = outscalar61_vld;
    end
    if(C_NUM_OUTSCALARS > 62) begin
        assign outscalar[62][C_OUTSCALAR_62_BITS-1:0] = outscalar62;
        assign outscalar_vld[62] = outscalar62_vld;
    end
    if(C_NUM_OUTSCALARS > 63) begin
        assign outscalar[63][C_OUTSCALAR_63_BITS-1:0] = outscalar63;
        assign outscalar_vld[63] = outscalar63_vld;
    end
    if(C_NUM_OUTSCALARS > 64) begin
        assign outscalar[64][C_OUTSCALAR_64_BITS-1:0] = outscalar64;
        assign outscalar_vld[64] = outscalar64_vld;
    end
    if(C_NUM_OUTSCALARS > 65) begin
        assign outscalar[65][C_OUTSCALAR_65_BITS-1:0] = outscalar65;
        assign outscalar_vld[65] = outscalar65_vld;
    end
    if(C_NUM_OUTSCALARS > 66) begin
        assign outscalar[66][C_OUTSCALAR_66_BITS-1:0] = outscalar66;
        assign outscalar_vld[66] = outscalar66_vld;
    end
    if(C_NUM_OUTSCALARS > 67) begin
        assign outscalar[67][C_OUTSCALAR_67_BITS-1:0] = outscalar67;
        assign outscalar_vld[67] = outscalar67_vld;
    end
    if(C_NUM_OUTSCALARS > 68) begin
        assign outscalar[68][C_OUTSCALAR_68_BITS-1:0] = outscalar68;
        assign outscalar_vld[68] = outscalar68_vld;
    end
    if(C_NUM_OUTSCALARS > 69) begin
        assign outscalar[69][C_OUTSCALAR_69_BITS-1:0] = outscalar69;
        assign outscalar_vld[69] = outscalar69_vld;
    end
    if(C_NUM_OUTSCALARS > 70) begin
        assign outscalar[70][C_OUTSCALAR_70_BITS-1:0] = outscalar70;
        assign outscalar_vld[70] = outscalar70_vld;
    end
    if(C_NUM_OUTSCALARS > 71) begin
        assign outscalar[71][C_OUTSCALAR_71_BITS-1:0] = outscalar71;
        assign outscalar_vld[71] = outscalar71_vld;
    end
    if(C_NUM_OUTSCALARS > 72) begin
        assign outscalar[72][C_OUTSCALAR_72_BITS-1:0] = outscalar72;
        assign outscalar_vld[72] = outscalar72_vld;
    end
    if(C_NUM_OUTSCALARS > 73) begin
        assign outscalar[73][C_OUTSCALAR_73_BITS-1:0] = outscalar73;
        assign outscalar_vld[73] = outscalar73_vld;
    end
    if(C_NUM_OUTSCALARS > 74) begin
        assign outscalar[74][C_OUTSCALAR_74_BITS-1:0] = outscalar74;
        assign outscalar_vld[74] = outscalar74_vld;
    end
    if(C_NUM_OUTSCALARS > 75) begin
        assign outscalar[75][C_OUTSCALAR_75_BITS-1:0] = outscalar75;
        assign outscalar_vld[75] = outscalar75_vld;
    end
    if(C_NUM_OUTSCALARS > 76) begin
        assign outscalar[76][C_OUTSCALAR_76_BITS-1:0] = outscalar76;
        assign outscalar_vld[76] = outscalar76_vld;
    end
    if(C_NUM_OUTSCALARS > 77) begin
        assign outscalar[77][C_OUTSCALAR_77_BITS-1:0] = outscalar77;
        assign outscalar_vld[77] = outscalar77_vld;
    end
    if(C_NUM_OUTSCALARS > 78) begin
        assign outscalar[78][C_OUTSCALAR_78_BITS-1:0] = outscalar78;
        assign outscalar_vld[78] = outscalar78_vld;
    end
    if(C_NUM_OUTSCALARS > 79) begin
        assign outscalar[79][C_OUTSCALAR_79_BITS-1:0] = outscalar79;
        assign outscalar_vld[79] = outscalar79_vld;
    end
    if(C_NUM_OUTSCALARS > 80) begin
        assign outscalar[80][C_OUTSCALAR_80_BITS-1:0] = outscalar80;
        assign outscalar_vld[80] = outscalar80_vld;
    end
    if(C_NUM_OUTSCALARS > 81) begin
        assign outscalar[81][C_OUTSCALAR_81_BITS-1:0] = outscalar81;
        assign outscalar_vld[81] = outscalar81_vld;
    end
    if(C_NUM_OUTSCALARS > 82) begin
        assign outscalar[82][C_OUTSCALAR_82_BITS-1:0] = outscalar82;
        assign outscalar_vld[82] = outscalar82_vld;
    end
    if(C_NUM_OUTSCALARS > 83) begin
        assign outscalar[83][C_OUTSCALAR_83_BITS-1:0] = outscalar83;
        assign outscalar_vld[83] = outscalar83_vld;
    end
    if(C_NUM_OUTSCALARS > 84) begin
        assign outscalar[84][C_OUTSCALAR_84_BITS-1:0] = outscalar84;
        assign outscalar_vld[84] = outscalar84_vld;
    end
    if(C_NUM_OUTSCALARS > 85) begin
        assign outscalar[85][C_OUTSCALAR_85_BITS-1:0] = outscalar85;
        assign outscalar_vld[85] = outscalar85_vld;
    end
    if(C_NUM_OUTSCALARS > 86) begin
        assign outscalar[86][C_OUTSCALAR_86_BITS-1:0] = outscalar86;
        assign outscalar_vld[86] = outscalar86_vld;
    end
    if(C_NUM_OUTSCALARS > 87) begin
        assign outscalar[87][C_OUTSCALAR_87_BITS-1:0] = outscalar87;
        assign outscalar_vld[87] = outscalar87_vld;
    end
    if(C_NUM_OUTSCALARS > 88) begin
        assign outscalar[88][C_OUTSCALAR_88_BITS-1:0] = outscalar88;
        assign outscalar_vld[88] = outscalar88_vld;
    end
    if(C_NUM_OUTSCALARS > 89) begin
        assign outscalar[89][C_OUTSCALAR_89_BITS-1:0] = outscalar89;
        assign outscalar_vld[89] = outscalar89_vld;
    end
    if(C_NUM_OUTSCALARS > 90) begin
        assign outscalar[90][C_OUTSCALAR_90_BITS-1:0] = outscalar90;
        assign outscalar_vld[90] = outscalar90_vld;
    end
    if(C_NUM_OUTSCALARS > 91) begin
        assign outscalar[91][C_OUTSCALAR_91_BITS-1:0] = outscalar91;
        assign outscalar_vld[91] = outscalar91_vld;
    end
    if(C_NUM_OUTSCALARS > 92) begin
        assign outscalar[92][C_OUTSCALAR_92_BITS-1:0] = outscalar92;
        assign outscalar_vld[92] = outscalar92_vld;
    end
    if(C_NUM_OUTSCALARS > 93) begin
        assign outscalar[93][C_OUTSCALAR_93_BITS-1:0] = outscalar93;
        assign outscalar_vld[93] = outscalar93_vld;
    end
    if(C_NUM_OUTSCALARS > 94) begin
        assign outscalar[94][C_OUTSCALAR_94_BITS-1:0] = outscalar94;
        assign outscalar_vld[94] = outscalar94_vld;
    end
    if(C_NUM_OUTSCALARS > 95) begin
        assign outscalar[95][C_OUTSCALAR_95_BITS-1:0] = outscalar95;
        assign outscalar_vld[95] = outscalar95_vld;
    end
    if(C_NUM_OUTSCALARS > 96) begin
        assign outscalar[96][C_OUTSCALAR_96_BITS-1:0] = outscalar96;
        assign outscalar_vld[96] = outscalar96_vld;
    end
    if(C_NUM_OUTSCALARS > 97) begin
        assign outscalar[97][C_OUTSCALAR_97_BITS-1:0] = outscalar97;
        assign outscalar_vld[97] = outscalar97_vld;
    end
    if(C_NUM_OUTSCALARS > 98) begin
        assign outscalar[98][C_OUTSCALAR_98_BITS-1:0] = outscalar98;
        assign outscalar_vld[98] = outscalar98_vld;
    end
    if(C_NUM_OUTSCALARS > 99) begin
        assign outscalar[99][C_OUTSCALAR_99_BITS-1:0] = outscalar99;
        assign outscalar_vld[99] = outscalar99_vld;
    end
    if(C_NUM_OUTSCALARS > 100) begin
        assign outscalar[100][C_OUTSCALAR_100_BITS-1:0] = outscalar100;
        assign outscalar_vld[100] = outscalar100_vld;
    end
    if(C_NUM_OUTSCALARS > 101) begin
        assign outscalar[101][C_OUTSCALAR_101_BITS-1:0] = outscalar101;
        assign outscalar_vld[101] = outscalar101_vld;
    end
    if(C_NUM_OUTSCALARS > 102) begin
        assign outscalar[102][C_OUTSCALAR_102_BITS-1:0] = outscalar102;
        assign outscalar_vld[102] = outscalar102_vld;
    end
    if(C_NUM_OUTSCALARS > 103) begin
        assign outscalar[103][C_OUTSCALAR_103_BITS-1:0] = outscalar103;
        assign outscalar_vld[103] = outscalar103_vld;
    end
    if(C_NUM_OUTSCALARS > 104) begin
        assign outscalar[104][C_OUTSCALAR_104_BITS-1:0] = outscalar104;
        assign outscalar_vld[104] = outscalar104_vld;
    end
    if(C_NUM_OUTSCALARS > 105) begin
        assign outscalar[105][C_OUTSCALAR_105_BITS-1:0] = outscalar105;
        assign outscalar_vld[105] = outscalar105_vld;
    end
    if(C_NUM_OUTSCALARS > 106) begin
        assign outscalar[106][C_OUTSCALAR_106_BITS-1:0] = outscalar106;
        assign outscalar_vld[106] = outscalar106_vld;
    end
    if(C_NUM_OUTSCALARS > 107) begin
        assign outscalar[107][C_OUTSCALAR_107_BITS-1:0] = outscalar107;
        assign outscalar_vld[107] = outscalar107_vld;
    end
    if(C_NUM_OUTSCALARS > 108) begin
        assign outscalar[108][C_OUTSCALAR_108_BITS-1:0] = outscalar108;
        assign outscalar_vld[108] = outscalar108_vld;
    end
    if(C_NUM_OUTSCALARS > 109) begin
        assign outscalar[109][C_OUTSCALAR_109_BITS-1:0] = outscalar109;
        assign outscalar_vld[109] = outscalar109_vld;
    end
    if(C_NUM_OUTSCALARS > 110) begin
        assign outscalar[110][C_OUTSCALAR_110_BITS-1:0] = outscalar110;
        assign outscalar_vld[110] = outscalar110_vld;
    end
    if(C_NUM_OUTSCALARS > 111) begin
        assign outscalar[111][C_OUTSCALAR_111_BITS-1:0] = outscalar111;
        assign outscalar_vld[111] = outscalar111_vld;
    end
    if(C_NUM_OUTSCALARS > 112) begin
        assign outscalar[112][C_OUTSCALAR_112_BITS-1:0] = outscalar112;
        assign outscalar_vld[112] = outscalar112_vld;
    end
    if(C_NUM_OUTSCALARS > 113) begin
        assign outscalar[113][C_OUTSCALAR_113_BITS-1:0] = outscalar113;
        assign outscalar_vld[113] = outscalar113_vld;
    end
    if(C_NUM_OUTSCALARS > 114) begin
        assign outscalar[114][C_OUTSCALAR_114_BITS-1:0] = outscalar114;
        assign outscalar_vld[114] = outscalar114_vld;
    end
    if(C_NUM_OUTSCALARS > 115) begin
        assign outscalar[115][C_OUTSCALAR_115_BITS-1:0] = outscalar115;
        assign outscalar_vld[115] = outscalar115_vld;
    end
    if(C_NUM_OUTSCALARS > 116) begin
        assign outscalar[116][C_OUTSCALAR_116_BITS-1:0] = outscalar116;
        assign outscalar_vld[116] = outscalar116_vld;
    end
    if(C_NUM_OUTSCALARS > 117) begin
        assign outscalar[117][C_OUTSCALAR_117_BITS-1:0] = outscalar117;
        assign outscalar_vld[117] = outscalar117_vld;
    end
    if(C_NUM_OUTSCALARS > 118) begin
        assign outscalar[118][C_OUTSCALAR_118_BITS-1:0] = outscalar118;
        assign outscalar_vld[118] = outscalar118_vld;
    end
    if(C_NUM_OUTSCALARS > 119) begin
        assign outscalar[119][C_OUTSCALAR_119_BITS-1:0] = outscalar119;
        assign outscalar_vld[119] = outscalar119_vld;
    end
    if(C_NUM_OUTSCALARS > 120) begin
        assign outscalar[120][C_OUTSCALAR_120_BITS-1:0] = outscalar120;
        assign outscalar_vld[120] = outscalar120_vld;
    end
    if(C_NUM_OUTSCALARS > 121) begin
        assign outscalar[121][C_OUTSCALAR_121_BITS-1:0] = outscalar121;
        assign outscalar_vld[121] = outscalar121_vld;
    end
    if(C_NUM_OUTSCALARS > 122) begin
        assign outscalar[122][C_OUTSCALAR_122_BITS-1:0] = outscalar122;
        assign outscalar_vld[122] = outscalar122_vld;
    end
    if(C_NUM_OUTSCALARS > 123) begin
        assign outscalar[123][C_OUTSCALAR_123_BITS-1:0] = outscalar123;
        assign outscalar_vld[123] = outscalar123_vld;
    end
    if(C_NUM_OUTSCALARS > 124) begin
        assign outscalar[124][C_OUTSCALAR_124_BITS-1:0] = outscalar124;
        assign outscalar_vld[124] = outscalar124_vld;
    end
    if(C_NUM_OUTSCALARS > 125) begin
        assign outscalar[125][C_OUTSCALAR_125_BITS-1:0] = outscalar125;
        assign outscalar_vld[125] = outscalar125_vld;
    end
    if(C_NUM_OUTSCALARS > 126) begin
        assign outscalar[126][C_OUTSCALAR_126_BITS-1:0] = outscalar126;
        assign outscalar_vld[126] = outscalar126_vld;
    end
    if(C_NUM_OUTSCALARS > 127) begin
        assign outscalar[127][C_OUTSCALAR_127_BITS-1:0] = outscalar127;
        assign outscalar_vld[127] = outscalar127_vld;
    end
endgenerate

//assign output data reg to port
assign scalar_dout = scalar_out_reg;

//generate input scalar registers
genvar idx;
generate
    for(idx=0; idx<C_NUM_INSCALARS; idx=idx+1) begin :INSCALAR_REG_GEN
        if(S_AXIS_SCALAR_IS_DIRECT_ARRAY[32*(idx+1)-1:32*idx] == 0) begin
            //regular in_register to fifo
            assign inscalar_we[idx] = scalar_we & (scalar_write_addr == idx);
            in_register #(
                .C_NUM_BITS(S_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx])
            ) inscalar_reg (
                .din(scalar_din),
                .we(inscalar_we[idx]),
                .clk(clk),
                .dout(inscalar_fifo[idx][S_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .ready(inscalar_ready[idx])
            );
            
            fifo #(
                .WIDTH(S_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .DEPTH(C_FIFO_DEPTH)
            ) in_fifo_i (
                .wr_clk(clk),
                .din(inscalar_fifo[idx][S_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .write(inscalar_ready[idx]),
                .full(inscalar_fifo_full[idx]),
                .dout(inscalar[idx][S_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .read(inscalar_next[idx]),
                .empty(inscalar_fifo_empty[idx]),
                .rd_clk(acc_clk),
                .rst(0) 
            );
        end
        else begin
            //input AXI Stream to fifo
            if(S_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx] != S_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]) begin
                 axis_dwidth_converter_v1_1_9_axis_dwidth_converter #(
                    .C_S_AXIS_TDATA_WIDTH(S_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]),
                    .C_M_AXIS_TDATA_WIDTH(S_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                    .C_AXIS_TID_WIDTH(1),
                    .C_AXIS_TDEST_WIDTH(1),
                    .C_S_AXIS_TUSER_WIDTH(1),
                    .C_M_AXIS_TUSER_WIDTH(1),
                    .C_AXIS_SIGNAL_SET(32'h1F)  //Enabled: TLAST, TKEEP, TSTRB, TDATA, TREADY
                ) data_width_conv_i (
                    .aclk(in_clk[idx]),
                    .aresetn(in_rst[idx]),
                    .aclken(1'b1),
                    .s_axis_tvalid(in_tvalid[idx]),
                    .s_axis_tready(in_tready[idx]),
                    .s_axis_tdata(in_tdata[idx][S_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                    .s_axis_tstrb(in_tstrb[idx][S_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                    .s_axis_tkeep(in_tkeep[idx][S_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                    .s_axis_tlast(in_tlast[idx]),
//                    .s_axis_tid(),
//                    .s_axis_tdest(),
//                    .s_axis_tuser(),
                    .m_axis_tvalid(in_dwconv_tvalid[idx]),
                    .m_axis_tready(in_dwconv_tready[idx]),
                    .m_axis_tdata(in_dwconv_tdata[idx][S_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
//                    .m_axis_tstrb(),
//                    .m_axis_tkeep(),
                    .m_axis_tlast(in_dwconv_tlast[idx])
//                    .m_axis_tid(),
//                    .m_axis_tdest(),
//                    .m_axis_tuser()
                );
            end
            else begin
                //if no data width conversion, wire the input signals straight through
                assign in_dwconv_tlast[idx] = in_tlast[idx];
                assign in_dwconv_tvalid[idx] = in_tvalid[idx];
                assign in_tready[idx] = in_dwconv_tready[idx];   //output
                assign in_dwconv_tdata[idx][S_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]-1:0] = in_tdata[idx][S_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0];
            end
            
            assign in_dwconv_tready[idx] = ~in_dwconv_full[idx];
            fifo #(
                .WIDTH(S_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .DEPTH(S_AXIS_SCALAR_DEPTH_ARRAY[32*(idx+1)-1:32*idx])
            ) in_fifo_i (
                .wr_clk(in_clk[idx]),
                .din(in_dwconv_tdata[idx][S_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .write(in_dwconv_tvalid[idx]),
                .full(in_dwconv_full[idx]),
                .dout(inscalar[idx][S_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .read(inscalar_next[idx]),
                .empty(inscalar_fifo_empty[idx]),
                .rd_clk(acc_clk),
                .rst(0) 
            );
        end
    end
endgenerate

//generate output scalar registers
generate
    if(C_NUM_OUTSCALARS == 0) begin
        assign outscalar_fifo32[0] = 0;
        assign outscalar_fifo32[-1] = 0;

        assign outscalar_fifo_empty = 0;
        assign outscalar_fifo_full = 0;
        assign outscalar_null_empty = 0;
        assign outscalar_null_dout = 0;
    end

    for(idx=0; idx<C_NUM_OUTSCALARS; idx=idx+1) begin :OUTSCALAR_REG_GEN
        //generate valid latch
        always @(posedge acc_clk) begin
            if(outscalar_vld[idx]) begin
                outscalar_reg[idx][M_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0] <= outscalar[idx][M_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0];
                outscalar_found_vld[idx] <= 1;
            end
            if(capture_reg)
                outscalar_found_vld[idx] <= 0;
        end

        if(M_AXIS_SCALAR_IS_DIRECT_ARRAY[32*(idx+1)-1:32*idx] == 0) begin
            assign outscalar_re[idx] = scalar_re & (scalar_read_addr == (idx+C_MAX_INSCALARS));
            //regular fifo to out_register
            fifo #(
                .WIDTH(M_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .DEPTH(C_FIFO_DEPTH)
            ) out_fifo_i (
                .wr_clk(acc_clk),
                .din(outscalar_reg[idx][M_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .write(capture_reg & outscalar_found_vld[idx]),
                .full(outscalar_fifo_full[idx]),
                .dout(outscalar_fifo[idx][M_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .read(outscalar_read[idx]),
                .empty(outscalar_fifo_empty[idx]),
                .rd_clk(clk),
                .rst(0) 
            );

            fifo #(
                .WIDTH(1),
                .DEPTH(C_FIFO_DEPTH)
            ) null_fifo_i (
                .wr_clk(acc_clk),
                .din(outscalar_found_vld[idx]),
                .write(capture_reg),
                //.full(outscalar_fifo_full[idx]),
                .dout(outscalar_null_dout[idx]),
                .read(outscalar_null_read[idx]),
                .empty(outscalar_null_empty[idx]),
                .rd_clk(clk), 
                .rst(0) 
            );

            out_register #(
                .C_NUM_BITS(M_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx])
            ) outscalar_reg_i (
                .din(outscalar_fifo[idx][M_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .read(outscalar_read[idx]),
                .clk(clk),
                .re(outscalar_re[idx]),
                .dout(outscalar_fifo32[idx])
            );
        end
        else begin
            fifo #(
                .WIDTH(M_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                .DEPTH(M_AXIS_SCALAR_DEPTH_ARRAY[32*(idx+1)-1:32*idx])
            ) out_fifo_i (
                .wr_clk(acc_clk),
                .din(outscalar_reg[idx][M_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .write(capture_reg & outscalar_found_vld[idx]),
                .full(outscalar_fifo_full[idx]),
                .dout(out_tdata[idx][M_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                .read(out_tready[idx]),
                .empty(out_empty[idx]),
                .rd_clk(out_clk[idx]),
                .rst(0) 
            );

            assign out_tvalid[idx] = ~out_empty[idx];
            if(M_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx] != M_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]) begin
                assign out_tstrb[idx][M_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8-1:0] = {M_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}};
                assign out_tkeep[idx][M_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8-1:0] = {M_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}};
                axis_dwidth_converter_v1_1_9_axis_dwidth_converter #(
                    .C_S_AXIS_TDATA_WIDTH(M_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]),
                    .C_M_AXIS_TDATA_WIDTH(M_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]),
                    .C_AXIS_TID_WIDTH(1),
                    .C_AXIS_TDEST_WIDTH(1),
                    .C_S_AXIS_TUSER_WIDTH(1),
                    .C_M_AXIS_TUSER_WIDTH(1),
                    .C_AXIS_SIGNAL_SET(32'h1F)  //Enabled: TLAST, TKEEP, TSTRB, TDATA, TREADY
                ) data_width_conv_i (
                    .aclk(out_clk[idx]),
                    .aresetn(out_rst[idx]),
                    .aclken(1'b1),
                    .s_axis_tvalid(out_tvalid[idx]),
                    .s_axis_tready(out_tready[idx]),
                    .s_axis_tdata(out_tdata[idx][S_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                    .s_axis_tstrb(out_tstrb[idx][S_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                    .s_axis_tkeep(out_tkeep[idx][S_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                    .s_axis_tlast(out_tlast[idx]),
//                    .s_axis_tid(),
//                    .s_axis_tdest(),
//                    .s_axis_tuser(),
                    .m_axis_tvalid(out_dwconv_tvalid[idx]),
                    .m_axis_tready(out_dwconv_tready[idx]),
                    .m_axis_tdata(out_dwconv_tdata[idx][S_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]-1:0]),
                    .m_axis_tstrb(out_dwconv_tstrb[idx][S_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                    .m_axis_tkeep(out_dwconv_tkeep[idx][S_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8-1:0]),
                    .m_axis_tlast(out_dwconv_tlast[idx])
//                    .m_axis_tid(),
//                    .m_axis_tdest(),
//                    .m_axis_tuser()
                );
            end
            else begin
                //if no data width conversion, wire the input signals straight through
                assign out_dwconv_tlast[idx] = out_tlast[idx];
                assign out_dwconv_tvalid[idx] = out_tvalid[idx];
                assign out_tready[idx] = out_dwconv_tready[idx];   //output
                assign out_dwconv_tdata[idx][S_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]-1:0] = out_tdata[idx][S_AXIS_SCALAR_BIT_ARRAY[32*(idx+1)-1:32*idx]-1:0];
                assign out_dwconv_tstrb[idx][M_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8-1:0] = {M_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}};
                assign out_dwconv_tkeep[idx][M_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8-1:0] = {M_AXIS_SCALAR_DMWIDTH_ARRAY[32*(idx+1)-1:32*idx]/8{1'b1}};
            end
        end

    end
endgenerate

    //read interface
    always @* begin
        if(scalar_read_addr >= C_MAX_INSCALARS)
            scalar_out_reg <= outscalar_fifo32[scalar_read_addr-C_MAX_INSCALARS];
        else
            scalar_out_reg <= 32'h00C0FFEE;
    end

endmodule
