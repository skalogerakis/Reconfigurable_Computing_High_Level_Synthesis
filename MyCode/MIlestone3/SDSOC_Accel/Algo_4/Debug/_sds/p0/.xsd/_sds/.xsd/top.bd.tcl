

#---------------------------
# Constant blocks
#---------------------------

#---------------------------
# Platform Parameters for zed
#---------------------------
set ps7 [get_bd_cell /ps7]
    
set_property -dict [ list \
  CONFIG.PCW_USE_M_AXI_GP0 1 \
  CONFIG.PCW_USE_S_AXI_HP0 1 \
  CONFIG.PCW_USE_S_AXI_HP1 1 \
  CONFIG.PCW_USE_S_AXI_HP2 1 \
  ] $ps7
set xlconcat_0 [get_bd_cell /xlconcat_0]
    
set_property -dict [ list \
  CONFIG.NUM_PORTS 16 \
  ] $xlconcat_0

#---------------------------
# Instantiating dm_0
#---------------------------
set dm_0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 dm_0]
  
set_property -dict [ list \
  CONFIG.C_DLYTMR_RESOLUTION {1250} \
  CONFIG.C_SG_LENGTH_WIDTH {26} \
  CONFIG.C_INCLUDE_SG {0} \
  CONFIG.C_INCLUDE_MM2S {1} \
  CONFIG.C_INCLUDE_S2MM {0} \
  CONFIG.C_INCLUDE_MM2S_SF {1} \
  CONFIG.C_INCLUDE_MM2S_DRE {1} \
  CONFIG.C_MM2S_BURST_SIZE {64} \
  CONFIG.C_M_AXI_MM2S_DATA_WIDTH {64} \
  CONFIG.C_M_AXIS_MM2S_TDATA_WIDTH {64} \
  ] $dm_0

#---------------------------
# Instantiating dm_1
#---------------------------
set dm_1 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 dm_1]
  
set_property -dict [ list \
  CONFIG.C_DLYTMR_RESOLUTION {1250} \
  CONFIG.C_SG_LENGTH_WIDTH {26} \
  CONFIG.C_INCLUDE_SG {0} \
  CONFIG.C_INCLUDE_MM2S {1} \
  CONFIG.C_INCLUDE_S2MM {0} \
  CONFIG.C_INCLUDE_MM2S_SF {1} \
  CONFIG.C_INCLUDE_MM2S_DRE {1} \
  CONFIG.C_MM2S_BURST_SIZE {64} \
  CONFIG.C_M_AXI_MM2S_DATA_WIDTH {64} \
  CONFIG.C_M_AXIS_MM2S_TDATA_WIDTH {64} \
  ] $dm_1

#---------------------------
# Instantiating dm_2
#---------------------------
set dm_2 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 dm_2]
  
set_property -dict [ list \
  CONFIG.C_DLYTMR_RESOLUTION {1250} \
  CONFIG.C_SG_LENGTH_WIDTH {26} \
  CONFIG.C_INCLUDE_SG {0} \
  CONFIG.C_INCLUDE_MM2S {0} \
  CONFIG.C_INCLUDE_S2MM {1} \
  CONFIG.C_INCLUDE_S2MM_SF {1} \
  CONFIG.C_INCLUDE_S2MM_DRE {1} \
  CONFIG.C_S2MM_BURST_SIZE {64} \
  CONFIG.C_M_AXI_S2MM_DATA_WIDTH {64} \
  CONFIG.C_S_AXIS_S2MM_TDATA_WIDTH {64} \
  ] $dm_2

#---------------------------
# Instantiating myFuncAccel_1
#---------------------------
set myFuncAccel_1 [create_bd_cell -type ip -vlnv xilinx.com:hls:myFuncAccel:1.0 myFuncAccel_1]
  

#---------------------------
# Instantiating myFuncAccel_1_if
#---------------------------
set myFuncAccel_1_if [create_bd_cell -type ip -vlnv xilinx.com:ip:adapter_v3_0:1.0 myFuncAccel_1_if]
  
set_property -dict [ list \
  CONFIG.C_INPUT_SCALAR_0_WIDTH {32} \
  CONFIG.C_INPUT_SCALAR_1_WIDTH {32} \
  CONFIG.C_INPUT_SCALAR_2_WIDTH {32} \
  CONFIG.S_AXIS_FIFO_0_WIDTH {32} \
  CONFIG.S_AXIS_FIFO_0_BYTE_WIDTH {32} \
  CONFIG.S_AXIS_FIFO_0_DMWIDTH {32} \
  CONFIG.S_AXIS_FIFO_0_DEPTH {1024} \
  CONFIG.S_AXIS_FIFO_1_WIDTH {32} \
  CONFIG.S_AXIS_FIFO_1_BYTE_WIDTH {32} \
  CONFIG.S_AXIS_FIFO_1_DMWIDTH {32} \
  CONFIG.S_AXIS_FIFO_1_DEPTH {1024} \
  CONFIG.M_AXIS_FIFO_0_WIDTH {32} \
  CONFIG.M_AXIS_FIFO_0_BYTE_WIDTH {32} \
  CONFIG.M_AXIS_FIFO_0_DMWIDTH {32} \
  CONFIG.M_AXIS_FIFO_0_DEPTH {1024} \
  CONFIG.C_NUM_INPUT_FIFOs {2} \
  CONFIG.C_NUM_OUTPUT_FIFOs {1} \
  CONFIG.C_N_INPUT_SCALARS {3} \
  ] $myFuncAccel_1_if

#---------------------------
# Instantiating axi_ic_ps7_M_AXI_GP0
#---------------------------
set axi_ic_ps7_M_AXI_GP0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ps7_M_AXI_GP0]
  
set_property -dict [ list \
  CONFIG.NUM_MI {4} \
  CONFIG.NUM_SI {1} \
  CONFIG.STRATEGY {2} \
  CONFIG.M00_HAS_REGSLICE {1} \
  CONFIG.M01_HAS_REGSLICE {1} \
  CONFIG.M02_HAS_REGSLICE {1} \
  CONFIG.M03_HAS_REGSLICE {1} \
  CONFIG.S00_HAS_REGSLICE {1} \
  ] $axi_ic_ps7_M_AXI_GP0

#---------------------------
# Instantiating axi_ic_ps7_S_AXI_HP1
#---------------------------
set axi_ic_ps7_S_AXI_HP1 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ps7_S_AXI_HP1]
  
set_property -dict [ list \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {1} \
  CONFIG.STRATEGY {2} \
  CONFIG.M00_HAS_REGSLICE {1} \
  CONFIG.M00_HAS_DATA_FIFO {2} \
  CONFIG.S00_HAS_REGSLICE {1} \
  CONFIG.S00_HAS_DATA_FIFO {2} \
  ] $axi_ic_ps7_S_AXI_HP1

#---------------------------
# Instantiating axi_ic_ps7_S_AXI_HP0
#---------------------------
set axi_ic_ps7_S_AXI_HP0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ps7_S_AXI_HP0]
  
set_property -dict [ list \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {1} \
  CONFIG.STRATEGY {2} \
  CONFIG.M00_HAS_REGSLICE {1} \
  CONFIG.M00_HAS_DATA_FIFO {2} \
  CONFIG.S00_HAS_REGSLICE {1} \
  CONFIG.S00_HAS_DATA_FIFO {2} \
  ] $axi_ic_ps7_S_AXI_HP0

#---------------------------
# Instantiating axi_ic_ps7_S_AXI_HP2
#---------------------------
set axi_ic_ps7_S_AXI_HP2 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ps7_S_AXI_HP2]
  
set_property -dict [ list \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {1} \
  CONFIG.STRATEGY {2} \
  CONFIG.M00_HAS_REGSLICE {1} \
  CONFIG.M00_HAS_DATA_FIFO {2} \
  CONFIG.S00_HAS_REGSLICE {1} \
  CONFIG.S00_HAS_DATA_FIFO {2} \
  ] $axi_ic_ps7_S_AXI_HP2

#---------------------------
# Instantiating axis_dwc_dm_0_tx_0
#---------------------------
set axis_dwc_dm_0_tx_0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwc_dm_0_tx_0]
  
set_property -dict [ list \
  CONFIG.M_TDATA_NUM_BYTES {4} \
  CONFIG.S_TDATA_NUM_BYTES {8} \
  ] $axis_dwc_dm_0_tx_0

#---------------------------
# Instantiating axis_dwc_dm_1_tx_0
#---------------------------
set axis_dwc_dm_1_tx_0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwc_dm_1_tx_0]
  
set_property -dict [ list \
  CONFIG.M_TDATA_NUM_BYTES {4} \
  CONFIG.S_TDATA_NUM_BYTES {8} \
  ] $axis_dwc_dm_1_tx_0

#---------------------------
# Instantiating axis_dwc_dm_2_rx_0
#---------------------------
set axis_dwc_dm_2_rx_0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwc_dm_2_rx_0]
  
set_property -dict [ list \
  CONFIG.M_TDATA_NUM_BYTES {8} \
  CONFIG.S_TDATA_NUM_BYTES {4} \
  ] $axis_dwc_dm_2_rx_0

#---------------------------
# Instantiating sds_irq_const
#---------------------------
set sds_irq_const [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 sds_irq_const]
  
set_property -dict [ list \
  CONFIG.CONST_WIDTH {1} \
  CONFIG.CONST_VAL {0} \
  ] $sds_irq_const

#---------------------------
# Connectivity
#---------------------------
connect_bd_net  \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/ap_iscalar_0_dout] \
  [get_bd_pins -auto_enable /myFuncAccel_1/size] \

connect_bd_net  \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/ap_iscalar_1_dout] \
  [get_bd_pins -auto_enable /myFuncAccel_1/dim] \

connect_bd_net  \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/ap_iscalar_2_dout] \
  [get_bd_pins -auto_enable /myFuncAccel_1/threshold] \

connect_bd_net  \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/ap_clk] \
  [get_bd_pins -auto_enable /myFuncAccel_1/ap_clk] \

connect_bd_net  \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/ap_resetn] \
  [get_bd_pins -auto_enable /myFuncAccel_1/ap_rst_n] \

connect_bd_net  \
  [get_bd_pins -auto_enable /clk_wiz_0/clk_out1] \
  [get_bd_pins -auto_enable /ps7/M_AXI_GP0_ACLK] \
  [get_bd_pins -auto_enable /ps7/S_AXI_HP1_ACLK] \
  [get_bd_pins -auto_enable /ps7/S_AXI_HP0_ACLK] \
  [get_bd_pins -auto_enable /ps7/S_AXI_HP2_ACLK] \
  [get_bd_pins -auto_enable /dm_0/s_axi_lite_aclk] \
  [get_bd_pins -auto_enable /dm_0/m_axi_mm2s_aclk] \
  [get_bd_pins -auto_enable /dm_1/s_axi_lite_aclk] \
  [get_bd_pins -auto_enable /dm_1/m_axi_mm2s_aclk] \
  [get_bd_pins -auto_enable /dm_2/s_axi_lite_aclk] \
  [get_bd_pins -auto_enable /dm_2/m_axi_s2mm_aclk] \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/s_axi_aclk] \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/s_axis_fifo_0_aclk] \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/s_axis_fifo_1_aclk] \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/m_axis_fifo_0_aclk] \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/acc_aclk] \
  [get_bd_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/S00_ACLK] \
  [get_bd_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/M00_ACLK] \
  [get_bd_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/M01_ACLK] \
  [get_bd_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/M02_ACLK] \
  [get_bd_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/M03_ACLK] \
  [get_bd_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/ACLK] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP1/S00_ACLK] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP0/S00_ACLK] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP2/S00_ACLK] \
  [get_bd_pins -auto_enable /axis_dwc_dm_0_tx_0/aclk] \
  [get_bd_pins -auto_enable /axis_dwc_dm_1_tx_0/aclk] \
  [get_bd_pins -auto_enable /axis_dwc_dm_2_rx_0/aclk] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP1/ACLK] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP1/M00_ACLK] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP0/ACLK] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP0/M00_ACLK] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP2/ACLK] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP2/M00_ACLK] \

connect_bd_net  \
  [get_bd_pins -auto_enable /proc_sys_reset_0/interconnect_aresetn] \
  [get_bd_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/S00_ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/M00_ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/M01_ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/M02_ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/M03_ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP1/M00_ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP1/S00_ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP0/M00_ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP0/S00_ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP2/M00_ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP2/S00_ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP1/ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP0/ARESETN] \
  [get_bd_pins -auto_enable /axi_ic_ps7_S_AXI_HP2/ARESETN] \

connect_bd_net  \
  [get_bd_pins -auto_enable /proc_sys_reset_0/peripheral_aresetn] \
  [get_bd_pins -auto_enable /dm_0/axi_resetn] \
  [get_bd_pins -auto_enable /dm_0/mm2s_prmry_resetn_out_n] \
  [get_bd_pins -auto_enable /dm_1/axi_resetn] \
  [get_bd_pins -auto_enable /dm_1/mm2s_prmry_resetn_out_n] \
  [get_bd_pins -auto_enable /dm_2/axi_resetn] \
  [get_bd_pins -auto_enable /dm_2/s2mm_prmry_resetn_out_n] \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/s_axi_aresetn] \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/s_axis_fifo_0_aresetn] \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/s_axis_fifo_1_aresetn] \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/m_axis_fifo_0_aresetn] \
  [get_bd_pins -auto_enable /myFuncAccel_1_if/acc_aresetn] \
  [get_bd_pins -auto_enable /axis_dwc_dm_0_tx_0/aresetn] \
  [get_bd_pins -auto_enable /axis_dwc_dm_1_tx_0/aresetn] \
  [get_bd_pins -auto_enable /axis_dwc_dm_2_rx_0/aresetn] \

connect_bd_net  \
  [get_bd_pins -auto_enable /sds_irq_const/dout] \
  [get_bd_pins -auto_enable /xlconcat_0/In0] \
  [get_bd_pins -auto_enable /xlconcat_0/In1] \
  [get_bd_pins -auto_enable /xlconcat_0/In2] \
  [get_bd_pins -auto_enable /xlconcat_0/In3] \
  [get_bd_pins -auto_enable /xlconcat_0/In4] \
  [get_bd_pins -auto_enable /xlconcat_0/In5] \
  [get_bd_pins -auto_enable /xlconcat_0/In6] \
  [get_bd_pins -auto_enable /xlconcat_0/In7] \
  [get_bd_pins -auto_enable /xlconcat_0/In8] \
  [get_bd_pins -auto_enable /xlconcat_0/In9] \
  [get_bd_pins -auto_enable /xlconcat_0/In10] \
  [get_bd_pins -auto_enable /xlconcat_0/In11] \
  [get_bd_pins -auto_enable /xlconcat_0/In12] \
  [get_bd_pins -auto_enable /xlconcat_0/In13] \
  [get_bd_pins -auto_enable /xlconcat_0/In14] \
  [get_bd_pins -auto_enable /xlconcat_0/In15] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /myFuncAccel_1/data0] \
  [get_bd_intf_pins -auto_enable /myFuncAccel_1_if/AP_FIFO_IARG_0] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /myFuncAccel_1/data1] \
  [get_bd_intf_pins -auto_enable /myFuncAccel_1_if/AP_FIFO_IARG_1] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /myFuncAccel_1/data2] \
  [get_bd_intf_pins -auto_enable /myFuncAccel_1_if/AP_FIFO_OARG_0] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /myFuncAccel_1_if/ap_ctrl] \
  [get_bd_intf_pins -auto_enable /myFuncAccel_1/ap_ctrl] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /ps7/M_AXI_GP0] \
  [get_bd_intf_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/S00_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_ps7_S_AXI_HP1/M00_AXI] \
  [get_bd_intf_pins -auto_enable /ps7/S_AXI_HP1] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_ps7_S_AXI_HP0/M00_AXI] \
  [get_bd_intf_pins -auto_enable /ps7/S_AXI_HP0] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_ps7_S_AXI_HP2/M00_AXI] \
  [get_bd_intf_pins -auto_enable /ps7/S_AXI_HP2] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/M00_AXI] \
  [get_bd_intf_pins -auto_enable /myFuncAccel_1_if/S_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/M01_AXI] \
  [get_bd_intf_pins -auto_enable /dm_0/S_AXI_LITE] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /dm_0/M_AXI_MM2S] \
  [get_bd_intf_pins -auto_enable /axi_ic_ps7_S_AXI_HP1/S00_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /dm_0/M_AXIS_MM2S] \
  [get_bd_intf_pins -auto_enable /axis_dwc_dm_0_tx_0/S_AXIS] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axis_dwc_dm_0_tx_0/M_AXIS] \
  [get_bd_intf_pins -auto_enable /myFuncAccel_1_if/S_AXIS_FIFO_0] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/M02_AXI] \
  [get_bd_intf_pins -auto_enable /dm_1/S_AXI_LITE] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /dm_1/M_AXI_MM2S] \
  [get_bd_intf_pins -auto_enable /axi_ic_ps7_S_AXI_HP0/S00_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /dm_1/M_AXIS_MM2S] \
  [get_bd_intf_pins -auto_enable /axis_dwc_dm_1_tx_0/S_AXIS] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axis_dwc_dm_1_tx_0/M_AXIS] \
  [get_bd_intf_pins -auto_enable /myFuncAccel_1_if/S_AXIS_FIFO_1] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_ps7_M_AXI_GP0/M03_AXI] \
  [get_bd_intf_pins -auto_enable /dm_2/S_AXI_LITE] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /dm_2/M_AXI_S2MM] \
  [get_bd_intf_pins -auto_enable /axi_ic_ps7_S_AXI_HP2/S00_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /myFuncAccel_1_if/M_AXIS_FIFO_0] \
  [get_bd_intf_pins -auto_enable /axis_dwc_dm_2_rx_0/S_AXIS] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axis_dwc_dm_2_rx_0/M_AXIS] \
  [get_bd_intf_pins -auto_enable /dm_2/S_AXIS_S2MM] \


#---------------------------
# Create Stream Map file
#---------------------------
set stream_subsystems [get_bd_cells * -hierarchical -quiet -filter {VLNV =~ "*:*:sdx_stream_subsystem:*"}]
if {[string length $stream_subsystems] > 0} {    
  set xml_file $output_dir/qdma_stream_map.xml
  set fp [open ${xml_file} w]
  puts $fp "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
  puts $fp "<xd:streamMap xmlns:xd=\"http://www.xilinx.com/xd\">"
  foreach stream_ss [get_bd_cells * -hierarchical -quiet -filter {VLNV =~ "*:*:sdx_stream_subsystem:*"}] {
    set instance [string trimleft $stream_ss /]
    foreach ss_intf [get_bd_intf_pins $stream_ss/* -quiet -filter {NAME=~"S??_AXIS"}] {
      set pin_name [get_property NAME $ss_intf]
      set route_id [sdx_stream_subsystem::get_routeid $ss_intf]
      set flow_id [sdx_stream_subsystem::get_flowid $ss_intf]
      puts $fp "  <xd:streamRoute xd:instanceRef=\"$instance\" xd:portRef=\"$pin_name\" xd:route=\"$route_id\" xd:flow=\"$flow_id\"/>"
    }
    foreach ss_intf [get_bd_intf_pins $stream_ss/* -quiet -filter {NAME=~"M??_AXIS"}] {
      set pin_name [get_property NAME $ss_intf]
      set route_id [sdx_stream_subsystem::get_routeid $ss_intf]
      set flow_id [sdx_stream_subsystem::get_flowid $ss_intf]
      puts $fp "  <xd:streamRoute xd:instanceRef=\"$instance\" xd:portRef=\"$pin_name\" xd:route=\"$route_id\" xd:flow=\"$flow_id\"/>"
    }
  }
  puts $fp "</xd:streamMap>"
  close $fp
}

