-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Thu Dec 12 23:33:58 2019
-- Host        : skl running 64-bit Ubuntu 18.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ zed_myFuncAccel_1_0_stub.vhdl
-- Design      : zed_myFuncAccel_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    size : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dim : in STD_LOGIC_VECTOR ( 31 downto 0 );
    threshold : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data0_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data0_empty_n : in STD_LOGIC;
    data0_read : out STD_LOGIC;
    data1_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data1_empty_n : in STD_LOGIC;
    data1_read : out STD_LOGIC;
    data2_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    data2_full_n : in STD_LOGIC;
    data2_write : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    ap_idle : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "size[31:0],dim[31:0],threshold[31:0],data0_dout[31:0],data0_empty_n,data0_read,data1_dout[31:0],data1_empty_n,data1_read,data2_din[31:0],data2_full_n,data2_write,ap_clk,ap_rst_n,ap_start,ap_done,ap_ready,ap_idle";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "a0_myFuncAccel,Vivado 2018.3";
begin
end;
