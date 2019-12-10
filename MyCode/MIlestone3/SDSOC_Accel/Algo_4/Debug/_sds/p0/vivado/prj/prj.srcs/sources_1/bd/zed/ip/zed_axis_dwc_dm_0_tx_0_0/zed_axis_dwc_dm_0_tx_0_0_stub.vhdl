-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2403119 Mon Dec  3 18:12:39 MST 2018
-- Date        : Tue Dec  4 00:31:42 2018
-- Host        : xcolbl6781 running 64-bit Red Hat Enterprise Linux Workstation release 7.3 (Maipo)
-- Command     : write_vhdl -force -mode synth_stub -rename_top zed_axis_dwc_dm_0_tx_0_0 -prefix
--               zed_axis_dwc_dm_0_tx_0_0_ zc702_axis_dwc_dm_1_tx_0_0_stub.vhdl
-- Design      : zc702_axis_dwc_dm_1_tx_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zed_axis_dwc_dm_0_tx_0_0 is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );

end zed_axis_dwc_dm_0_tx_0_0;

architecture stub of zed_axis_dwc_dm_0_tx_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[63:0],s_axis_tkeep[7:0],s_axis_tlast,m_axis_tvalid,m_axis_tready,m_axis_tdata[31:0],m_axis_tkeep[3:0],m_axis_tlast";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axis_dwidth_converter_v1_1_17_axis_dwidth_converter,Vivado 2018.3";
begin
end;
