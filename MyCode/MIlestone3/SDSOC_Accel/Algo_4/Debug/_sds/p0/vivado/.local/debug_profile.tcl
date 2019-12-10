package require math::bignum

namespace eval ocl_util {
  ################################################################################
  # Global variables
  ################################################################################
  # DSA-specific info (e.g., clocks, resets)
  set dsa_xdp_info {}

  # IP data (for debug_ip_layout)
  set debug_ip_list [list]

  # Trace IDs for profiling IPs
  # These are defined in xclperf.h for XRT
  variable trace_id_min_spm 0
  variable trace_id_min_sam 64
  variable trace_id_min_sspm 576
    
  # Use 64-bit counters for SPMs and SAMs
  variable use_64_bits 1
  
  # Separator used for CU port and memory resource (must match rt_profile.h in XRT)
  variable port_mem_sep "-"
  
  # utility function called by init_dr_bd in ocl_util.tcl
  # this is the main entrance tcl proc
  ################################################################################
  # insert_debug_profile_support
  #   Description:
  #     Insert all requested debug and profiling circuitry into dynamic BD    
  #   Arguments:
  #     dsa_info            DSA dict
  #     config_info         configuration dict
  #     debug_profile_info  debug/profile dict
  ################################################################################
  proc insert_debug_profile_support {dsa_info config_info debug_profile_info} {
    set dsa_vbnv            [dict get $dsa_info dsa_vbnv]
    set dsa_dr_bd           [dict get $dsa_info dsa_dr_bd] 
    set dsa_platform_state  [dict get $dsa_info dsa_platform_state] 
    set xpfm_file           [dict get $dsa_info xpfm_file]

    set is_hw_emu           [dict get $config_info is_hw_emu] 
    # set steps_log           [dict get $config_info steps_log] 
    set protocol_checker    [dict get $config_info protocol_checker]
    set output_dir          [dict get $config_info output_dir]
    set hw_emu_profiling    [dict get $config_info hw_emu_profiling]
    set bus_sp_tags         [dict get $config_info bus_sp_tags]
    set bus_sp_indeces      [dict get $config_info bus_sp_indeces]
    
    set is_soc_platform [string equal $dsa_platform_state "pre_synth"] 

    OPTRACE "START" "Insert debug / profiling support" 

    # Get bus interfaces and associated SP tags
    global dsa_xdp_info
    dict set dsa_xdp_info BUS_SP_TAGS $bus_sp_tags
    dict set dsa_xdp_info BUS_SP_INDECES $bus_sp_indeces
    puts "--- DEBUG: bus_sp_tags = $bus_sp_tags"
    puts "--- DEBUG: bus_sp_indeces = $bus_sp_indeces"

    # Read DSA-specific info (if available)
    if {[get_dsa_xdp_info $is_hw_emu $is_soc_platform $dsa_vbnv $xpfm_file $output_dir]} {
      warning2file $output_dir "CRITICAL WARNING: Unable to properly extract DSA-specific information. Debug or profiling may not work."
    }

    if { $is_hw_emu } {
      if { $protocol_checker } {
        if { [catch {add_protocol_checker_unip} catch_res] } {
          error2file $output_dir "Could not add protocol checkers on kernel boundary" $catch_res
        }
      }
      
      # Add performance monitoring for emulation (different for soc and pcie platforms)
      if { $is_soc_platform } {
        # soc platforms: monitor DDR banks only
        if { [catch {add_axi_perf_mons_banks} catch_res] } {
          error2file $output_dir "Could not add axi profilers on ddr banks in hw_em" $catch_res
        }
      } else {
        if { $hw_emu_profiling } {
          # pcie platforms: monitor CU ports and CUs
          if { [catch {add_axi_perf_mons_ports} catch_res] } {
            error2file $output_dir "Could not add axi profilers on accel ports in hw_em" $catch_res
          }
          if { [catch {add_accel_mons} catch_res] } {
            error2file $output_dir "Could not add accel profilers in hw_em" $catch_res
          }
        }
      }
    }
    
    # Debug/profiling info
    # Insert lapc if requested for SDAccel designs
    set debug_info [dict_get_default $debug_profile_info debug {}]
    if { [catch {update_axi_checkers $is_hw_emu $debug_info $dsa_info} catch_res] } {
      error2file $output_dir "Could not add axi protocol checkers into dynamic region" $catch_res
    }

    # Insert profiling (as requested)
    puts "--- DEBUG: Inserting profiling cores..."
    set profile_info [dict_get_default $debug_profile_info profile {}]
    
    # Insert profiling cores based on compute_unit/port info in profile_info
    # puts "--- DEBUG: profile_info is $profile_info"
    set kernel_debug [dict_get_default $debug_info kernel_debug false]
    if { [catch {update_unified_profiling $profile_info $is_hw_emu $kernel_debug $output_dir} catch_res] } {
      error2file $output_dir "Profiling not added to dynamic region" $catch_res
    }

    # Insert SystemILA debug core(s) based on compute_unit/port info in debug_info
    puts "--- DEBUG: Inserting SystemILA debug cores..."
    # puts "--- DEBUG: debug_info is $debug_info"
    if { [catch {insert_chipscope_debug $dsa_dr_bd $is_hw_emu $debug_info} catch_res] } {
      error2file $output_dir "Could not add ChipScope ILA to dynamic region" $catch_res
    }

    # Connect compute_unit(s) BSCAN Interface to Debug Bridge
    puts "--- DEBUG: Connecting BSCAN interfaces of compute unit(s)"
    # puts "--- DEBUG: debug_info is $debug_info"
    if { [catch {connect_bscan_ports $dsa_dr_bd $is_hw_emu } catch_res] } {
      error2file $output_dir "Could not connect BSCAN interfaces of dynamic region to Debug Bridge" $catch_res
    }

    OPTRACE "END" "Insert debug / profiling support"
  }; # end insert_debug_profile_support

  ################################################################################
  # get_bus_sp_tags
  #   Description:
  #     Get bus interfaces and associated SP tags
  #     NOTE: This proc can be really slow. It was moved to:
  #           sdx/ocl/src/compiler/HPIKernelCompiler.cxx (CR 1015834) 
  #   Arguments:
  #     xpfm_file        full path to XPFM file for DSA
  #     output_dir       output directory
  ################################################################################
  proc get_bus_sp_tags {xpfm_file output_dir} {
    global dsa_xdp_info
    
    # Get bus interfaces from hardware platform and convert to Tcl dict
    if { [catch { set bus_json [::platform::query -xpfm $xpfm_file -key hardwarePlatform.busInterfaces] } catch_res] } {
      warning2file $output_dir "CRITICAL WARNING: Could not extract bus interfaces from xpfm."
      return
    }
    if { [catch { set bus_dict [::json::json2dict $bus_json] } catch_res] } {
      warning2file $output_dir "CRITICAL WARNING: Could not convert bus interfaces to dictionary."
      return
    }
    
    # Make list of key/value pairs with base names and SP tags
    set bus_sp_tags [list]
    set bus_sp_indeces [list]
    
    foreach bus [dict keys $bus_dict] {
      foreach intf [dict get $bus_dict $bus] {
        set memTag [dict_get_default $intf spTag {}]
        if {($memTag == "DDR") || ($memTag == "PLRAM") || ($memTag == "HBM")} {
          foreach segment [dict get $intf addressSegments] {
            set index [dict_get_default $segment index 0]
            set baseName [dict_get_default $segment baseName {}]
            #set spTag [dict_get_default $segment spTag {}]
            #set spTag "${memTag}[${index}]"
            set spTag $memTag
            #puts "--- DEBUG: baseName = $baseName, spTag = $spTag"
            lappend bus_sp_tags $baseName $spTag
            lappend bus_sp_indeces $baseName $index
          }
        }
      }
    }
    
    puts "--- DEBUG: bus_sp_tags = $bus_sp_tags"
    puts "--- DEBUG: bus_sp_indeces = $bus_sp_indeces"
    dict set dsa_xdp_info BUS_SP_TAGS $bus_sp_tags
    dict set dsa_xdp_info BUS_SP_INDECES $bus_sp_indeces
  }; # end get_bus_sp_tags
  
  ################################################################################
  # get_dsa_xdp_info
  #   Description:
  #     Get DSA-specific info for debug/profiling
  #     NOTE: the __x_dsa_drbd_data dict is created in the pre-linker script
  #   Arguments:
  #     is_hw_emu        true: is HW emulation; false: not HW emulation
  #     is_soc_platform  true: is SoC platform; false: is PCIe based platform  
  #     dsa_vbnv         DSA VBNV string
  #     xpfm_file        full path to XPFM file for DSA
  #     output_dir       output directory
  ################################################################################
  proc get_dsa_xdp_info { is_hw_emu is_soc_platform dsa_vbnv xpfm_file output_dir } {
    global dsa_xdp_info
    
    set errorFound false
    # if DSA doesn't contain the "extension" metadata for "profile_debug", it returns empty string
    if { [catch { set dsa_dict [::platform::get_hw_ext_dict $xpfm_file profile_debug] } catch_res] } {
      warning2file $output_dir "CRITICAL WARNING: Could not extract profile_debug dictionary from xpfm."
      set errorFound true
    }

    # NOTE: This proc call was really slow so moved to HPIKernelCompiler.cxx (CR 1015834)
    # Get bus interfaces and associated SP tags
    #get_bus_sp_tags $xpfm_file $output_dir

    set version [lindex [split $dsa_vbnv ":"] 3]

    # Use defaults only when necessary
    if {$dsa_dict == {} || $errorFound || $is_hw_emu} {
      set dsa_type [lindex [split $dsa_vbnv ":"] 1]
      set dsa_name [lindex [split $dsa_vbnv ":"] 2]
      set 201820DSA [expr {([string first "201820" $version] >= 0) ? true : false}]
      set awsDSA [expr {$dsa_type == "aws-vu9p-f1-04261818" ? true : false}]
      set oldDSA [expr {(($version == "5.0") || ($version == "5.1") || $awsDSA) ? true : false}]
      puts "--- DEBUG: vbnv = $dsa_vbnv, version = $version, old DSA = $oldDSA, 2018.2 DSA = $201820DSA"
    
      # Catch special case of all VU9P parts (i.e., vcu1525 and u200)
      if {[string equal $dsa_type "vcu1525"] || [string equal $dsa_type "u200"]} {
        dict lappend dsa_xdp_info SLR_ASSIGNMENT "SLR1"
        set slrHierName "slr1"
      } else {
        dict lappend dsa_xdp_info SLR_ASSIGNMENT "SLR0"
        set slrHierName "slr0"
      }
    
      dict set dsa_xdp_info HOST_MASTERS [get_host_masters]
      set notDedicated [expr {($oldDSA || ([string equal $dsa_type "u200"] && $201820DSA)) ? true : false}]
      dict lappend dsa_xdp_info DEDICATED_MASTER [expr {$notDedicated ? false : true}]
      dict lappend dsa_xdp_info AXIMM_MASTER [expr {$notDedicated ? "interconnect_aximm_host" : "regslice_data_periph_M_AXI"}]
      set monClock [expr {(!$is_hw_emu && $awsDSA) ? "/clk_extra_b0" : "clkwiz_kernel_clk_out1"}]
      dict lappend dsa_xdp_info MONITOR_CLOCK $monClock

      # Find a default reset
      set monReset [expr {($is_hw_emu) ? "psr_kernel_clk/peripheral_aresetn" : "memory_subsystem/aresetn"}]
      if { $is_hw_emu && ([get_bd_pins -quiet $monReset] == {}) } {
        set monReset "/kernel_clk/sync_rst"
      }
      if { !$is_hw_emu && $awsDSA } {
        set monReset "reset_controllers/interconnect_aresetn"
      }
      if { [get_bd_pins -quiet $monReset] == {} && !$is_soc_platform } {
        warning2file $output_dir "CRITICAL WARNING: Unable to find Monitor Reset."
      }
      dict lappend dsa_xdp_info MONITOR_RESET $monReset
      
      # Get AXI-Lite interconnect from first CU (if not found then guess)
      set axilite_intercon {}
      set first_cu_cell [lindex [get_bd_cells -quiet -hier -filter "SDX_KERNEL==true"] 0]
      if {$first_cu_cell != {}} {
        set axilite_pin [get_bd_intf_pins -quiet -of_objects $first_cu_cell -filter {CONFIG.PROTOCOL == AXI4LITE && MODE == Slave}]
        set axilite_obj [find_bd_objs -quiet -relation connected_to -stop_at_interconnect -thru_hier $axilite_pin]
        set axilite_intercon [get_bd_cells -quiet -of_objects $axilite_obj]
      }
      if {$axilite_intercon == {}} {
        set axilite_intercon "interconnect_axilite_user"
        if {[get_bd_cells -quiet $axilite_intercon] == {}} { 
          set axilite_intercon "interconnect_axilite_user_slr0"
          if {[get_bd_cells -quiet $axilite_intercon] == {}} {
            puts "--- DEBUG: Unable to find AXI-Lite interconnect."
            #return 1
          }
        }
      }
      
      dict lappend dsa_xdp_info AXILITE_INTERCONNECT "$axilite_intercon"
      dict lappend dsa_xdp_info AXILITE_MASTER "$axilite_intercon/M00_AXI"
      if {$notDedicated} {
        dict lappend dsa_xdp_info TRACE_CLOCK "$axilite_intercon/S00_ACLK"
        if {[string first "x4" $dsa_name] >= 0} {
          dict lappend dsa_xdp_info TRACE_RESET "$slrHierName/reset_controllers/psreset_gate_pr_control_interconnect_aresetn"
        } else {
          dict lappend dsa_xdp_info TRACE_RESET "$axilite_intercon/S00_ARESETN"
        }
      } else {
        dict lappend dsa_xdp_info TRACE_CLOCK "dma_pcie_axi_aclk"
        dict lappend dsa_xdp_info TRACE_RESET "$slrHierName/reset_controllers/psreset_gate_pr_data_interconnect_aresetn"
      }
      
      if {!$is_hw_emu && !$is_soc_platform} {
        warning2file $output_dir "INFO: Using default values for profile instrumentation."
      }
      puts "--- DEBUG: Using default values: $dsa_xdp_info"
      return 0
    }
    
    puts "--- DEBUG: Parsing DSA-specific information for debug and profiling..."
    puts "--- DEBUG: -----------------------------------------------------------"
    
    # Host masters
    # NOTE: not all connections listed are valid for every design
    set host_masters [list]
    set host_dict [dict_get_default $dsa_dict host {}]
    puts "--- DEBUG:    Host dict: $host_dict"

    foreach slr [dict keys $host_dict] {
      foreach connection [dict get $host_dict $slr] {
        set host_net [get_bd_intf_nets -quiet -of_objects [get_bd_intf_pins $connection]]
        set host_master [get_bd_intf_pins -quiet -of_objects $host_net -filter {MODE == Master}]
        # Make sure it's not a kernel
        set host_master_cell [get_bd_cells -quiet -hier -of_objects $host_master -filter {SDX_KERNEL != true}]
        if {$host_master_cell != {}} {
          lappend host_masters $host_master
        }
      }
    }
    dict set dsa_xdp_info HOST_MASTERS $host_masters
    puts "--- DEBUG:    Host masters: $host_masters"

    # AXI-MM master
    #if {[dict exists $dsa_dict dedicated_aximm_master]} {
    #  set dedicated_master true
    #  set aximm_master [dict get $dsa_dict dedicated_aximm_master]
    #} else {
    #  set dedicated_master false
    #  set aximm_master "interconnect_aximm_host/M01_AXI"
    #}
    #dict lappend dsa_xdp_info DEDICATED_MASTER $dedicated_master
    #dict lappend dsa_xdp_info AXIMM_MASTER $aximm_master  
    #puts "--- DEBUG:    AXI-MM master: $aximm_master (dedicated: $dedicated_master)"

    # AXI-Lite master
    # TODO: grab all masters, not just the fallback
    set axlite_intercon "interconnect_axilite_user"
    set axlite_master "M00_AXI"
    set axilite_dict [dict_get_default $dsa_dict axilite {}]
    puts "--- DEBUG:    Axilite dict: $axilite_dict"

    foreach slr [dict keys $axilite_dict] {  
      set fallback [dict get $axilite_dict $slr fallback]
      
      foreach key [dict keys [dict get $axilite_dict $slr]] {
        set value [dict get $axilite_dict $slr $key]
        if {$fallback} {
          if {$key == "ip"} {  
            set axilite_intercon $value
          }
          if {$key == "mi"} {  
            set axilite_master $value
          }
        }
      }
    }
    
    dict lappend dsa_xdp_info AXILITE_INTERCONNECT $axilite_intercon
    dict lappend dsa_xdp_info AXILITE_MASTER "$axilite_intercon/$axilite_master"
    puts "--- DEBUG:    AXI-Lite interconnect: $axilite_intercon"
    puts "--- DEBUG:    AXI-Lite master: $axilite_intercon/$axilite_master"
    
    # Trace (AXI-MM master, clock/reset, SLR assignment)
    set slrAssignmentTrace "SLR0"
    set dedicated_master false
    set aximm_master "interconnect_aximm_host/M01_AXI"
    set trace_clock "dma_pcie_axi_aclk"
    set trace_reset "slr1/reset_controllers/psreset_gate_pr_data_interconnect_aresetn"
    set trace_dict [dict_get_default $dsa_dict trace {}]
    puts "--- DEBUG:    Trace dict: $trace_dict"

    foreach slr [dict keys $trace_dict] {
      set slrAssignmentTrace $slr
      
      foreach key [dict keys [dict get $trace_dict $slr]] {
        set value [dict get $trace_dict $slr $key]
        
        if {$key == "mi"} {
          set aximm_master $value
          set dedicated_master true
        } elseif {$key == "clk"} {
          set trace_clock $value
        } elseif {$key == "rst"} {
          set trace_reset $value
        }
      }
    }
    
    dict lappend dsa_xdp_info SLR_ASSIGNMENT $slrAssignmentTrace
    dict lappend dsa_xdp_info DEDICATED_MASTER $dedicated_master
    dict lappend dsa_xdp_info AXIMM_MASTER $aximm_master
    dict lappend dsa_xdp_info TRACE_CLOCK $trace_clock
    dict lappend dsa_xdp_info TRACE_RESET $trace_reset
    puts "--- DEBUG:    SLR assigment: $slrAssignmentTrace"
    puts "--- DEBUG:    AXI-MM master: $aximm_master (dedicated: $dedicated_master)"
    puts "--- DEBUG:    Trace clock: $trace_clock"
    puts "--- DEBUG:    Trace reset: $trace_reset"
    
    # Monitor clock/reset
    set monitor_clock "clkwiz_kernel_clk_out1"
    set monitor_reset "slr1/reset_controllers/psreset_gate_pr_kernel/peripheral_aresetn"
    set monitor_dict [dict_get_default $dsa_dict monitor {}]
    puts "--- DEBUG:    Monitor dict: $monitor_dict"

    foreach slr [dict keys $monitor_dict] {  
      set fallback [dict get $monitor_dict $slr fallback]
      
      foreach key [dict keys [dict get $monitor_dict $slr]] {
        set value [dict get $monitor_dict $slr $key]
        #puts "  ${key}: ${value}"
        if {$fallback == true} {
          if {$key == "clk"} {
            set monitor_clock $value
          } elseif {$key == "rst"} {
            set monitor_reset $value
          }
        }
      }
    }
  
    dict lappend dsa_xdp_info MONITOR_CLOCK $monitor_clock
    dict lappend dsa_xdp_info MONITOR_RESET $monitor_reset
    puts "--- DEBUG:    Monitor clock: $monitor_clock"
    puts "--- DEBUG:    Monitor reset: $monitor_reset"
    puts "--- DEBUG: -----------------------------------------------------------"
    return 0
  }; # end get_dsa_xdp_info
    
  ################################################################################
  # get_host_masters
  #   Description:
  #     gets a list of host masters
  #     NOTE: for v5.2 platforms, this includes multiple masters
  #   Arguments:
  #     none
  ################################################################################
  proc get_host_masters {} {
    set hostList [list]
    
    if {[get_bd_intf_pins "axi_vip_data/M_AXI" -quiet] != {}} {
      lappend hostList "axi_vip_data/M_AXI"
    } elseif {[get_bd_intf_pins "aws_0/M_AXI_PCIS" -quiet] != {}} {
      lappend hostList "aws_0/M_AXI_PCIS"
    } else {
      # find AXI-MM slaves on memory subsystem
      set slaves [get_bd_intf_pins -of_objects [get_bd_cells -quiet "memory_subsystem"] -quiet -filter {CONFIG.PROTOCOL == AXI4 && MODE == Slave}]
      foreach slave $slaves {
        set net [get_bd_intf_nets -of_objects $slave]
        set master [get_bd_intf_pins -of_objects $net -filter {MODE == Master}]
        set masterCell [get_bd_cells -quiet -hier -of_objects $master -filter {SDX_KERNEL != true}]
        if {$masterCell != {}} {
          lappend hostList $master 
        }
      }
    }
    
    return $hostList
  }; # end get_host_masters
  
  ################################################################################
  # add_axi_perf_mons_banks
  #   Description:
  #     Add profiling for DDR banks (soc platforms; HW emulation only)
  #     NOTE: BD of dynamic region is assumed to be open
  #   Arguments:
  #     none
  ################################################################################
  proc add_axi_perf_mons_banks {} {
    #TODO : Remove this block once generic pcie flow is available
    #get_bd_cell of sdaccel_generic_pcie
    set sdaccel_gen_pcie [get_bd_cells * -filter {VLNV=~xilinx.com:ip:sdaccel_generic_pcie:*} -quiet]
    if { [llength $sdaccel_gen_pcie] > 0 } { 
      set ddr0_ui_clk [get_bd_cells ddr0_ui_clk -quiet]
      set numGlobalMemories [get_property CONFIG.NUMBER_OF_GLOBAL_MEMORIES $sdaccel_gen_pcie]
      for {set i 0} {$i < 4} {incr i} {
        set perf_mon [ create_bd_cell -type ip -vlnv xilinx.com:Debug:sim_axi_perf_mon:1.0 sim_axi_perf_mon_${i} ]
        set_property -dict [list CONFIG.MONITOR_ID BANK${i}] $perf_mon

        connect_bd_net [get_bd_pins sim_axi_perf_mon_${i}/axi_aclk] [get_bd_pins $ddr0_ui_clk/clk]
        connect_bd_net [get_bd_pins sim_axi_perf_mon_${i}/axi_aresetn] [get_bd_pins $ddr0_ui_clk/sync_rst]
        connect_bd_intf_net [get_bd_intf_pins $perf_mon/MON_AXI] [get_bd_intf_pins $sdaccel_gen_pcie/C${i}_DDR_SAXI]
      }
    } else {
      set ddrx [get_bd_cells * -filter {VLNV=~ xilinx.com:user:ddrx:*} -quiet]
      if { [llength $ddrx] > 0 } { 
        set ddr0_ui_clk [get_bd_cells ddr0_ui_clk -quiet]
        set numGlobalMemories [get_property CONFIG.C_NUMBER_OF_GLOBAL_MEMORIES $ddrx]
        for {set i 0} {$i < 4} {incr i} {
          set perf_mon [ create_bd_cell -type ip -vlnv xilinx.com:Debug:sim_axi_perf_mon:1.0 sim_axi_perf_mon_${i} ]
          set_property -dict [list CONFIG.MONITOR_ID BANK${i}] $perf_mon
  
          connect_bd_net [get_bd_pins sim_axi_perf_mon_${i}/axi_aclk] [get_bd_pins $ddr0_ui_clk/clk]
          connect_bd_net [get_bd_pins sim_axi_perf_mon_${i}/axi_aresetn] [get_bd_pins $ddr0_ui_clk/sync_rst]
          connect_bd_intf_net [get_bd_intf_pins $perf_mon/MON_AXI] [get_bd_intf_pins $ddrx/C${i}_DDR_SAXI]
        }
      }
    }
  }; # end add_axi_perf_mons_banks
  
  ################################################################################
  # get_memory_from_addr_seg
  #   Description:
  #     Get the name of the memory resource attached to an address segment
  #   Arguments:
  #     addrSeg         address segment object
  ################################################################################
  proc get_memory_from_addr_seg {addrSeg} {
    global dsa_xdp_info
    set bus_sp_tags [dict_get_default $dsa_xdp_info BUS_SP_TAGS {}]
    if {$bus_sp_tags == {}} {
      return "DDR"
    }

    set segName [get_property name $addrSeg]
    
    foreach key [dict keys $bus_sp_tags] {
    	set value [dict get $bus_sp_tags $key]
    	if {[string first $key $segName] >= 0} {
    	  return $value
    	}
    }

    set memoryType [expr {([string first "PLRAM" $segName] >= 0) ? "PLRAM" : "DDR"}]
    set memoryType [expr {([string first "HBM" $segName] >= 0) ? "HBM" : $memoryType}]
    return $memoryType
  }; # end get_memory_from_addr_seg
  
  ################################################################################
  # get_memory_indeces_from_addr_segs
  #   Description:
  #     Get the indeces of the memory resource attached to address segments
  #     TODO: I hate this code. VPL/xocc needs to inform us of the indeces.
  #   Arguments:
  #     addrSegs        address segments
  #     memoryType      memory resource type
  ################################################################################
  proc get_memory_indeces_from_addr_segs {addrSegs memoryType} {
    global dsa_xdp_info
    set bus_sp_tags [dict_get_default $dsa_xdp_info BUS_SP_TAGS {}]
    set bus_sp_indeces [dict_get_default $dsa_xdp_info BUS_SP_INDECES {}]
    if {$bus_sp_tags == {} || $bus_sp_indeces == {}} {
      return ""
    }
    
    set minIndex 100
    set numSegments 0
    
    foreach seg $addrSegs {
      set segName [get_property name $seg]
      
      # Ignore segments targeting different memory types
      set currMemoryType [get_memory_from_addr_seg $seg]
      if {$currMemoryType != $memoryType} {
        continue
      }
      
      incr numSegments
      
      # First look at known segment names
      set found 0
      foreach key [dict keys $bus_sp_tags] {
        set value [dict get $bus_sp_tags $key]
        
    	  if {[string first $key $segName] >= 0} {
    	    set currIndex [dict get $bus_sp_indeces $key]
          set minIndex [expr { ($currIndex < $minIndex) ? $currIndex : $minIndex } ]
          set found 1
          break
    	  }
      }
      
      # If not found, then search for index expressed in segment name
      if {!$found} {
        for { set i 16 } { $i >= 0 } { incr i -1} {
          if {$i >= 10} {set ii "${i}"} else {set ii "0${i}"}
          if {[string first $ii $segName] >= 0} {
            set minIndex [expr { ($i < $minIndex) ? $i : $minIndex } ]
            break
          }
        }
      }
    }
     
    set maxIndex [expr $minIndex + $numSegments - 1]
    
    # Specify either as single value or as range
    if {$minIndex == $maxIndex} {
      set indeces $minIndex
    } else {
      set indeces "${minIndex}:${maxIndex}"
    }
    
    puts "--- DEBUG: segs = $addrSegs, type = $memoryType, indeces = $indeces"
    return $indeces
  }; # end get_memory_indeces_from_addr_segs
  
  ################################################################################
  # add_axi_perf_mons_ports
  #   Description:
  #     Add profiling for accelerator ports (pcie platforms; HW emulation only)
  #     NOTE: BD of dynamic region is assumed to be open
  #   Arguments:
  #     none
  ################################################################################
  proc add_axi_perf_mons_ports {} {
    global dsa_xdp_info
    variable ::ocl_util::port_mem_sep
    set monitor_reset [dict_get_default $dsa_xdp_info MONITOR_RESET {}]
    
    set i 0
    set cu_instances [get_bd_cells -quiet -hier -filter "SDX_KERNEL==true"]
    set cu_masters [get_bd_intf_pins -quiet -of $cu_instances -filter "Mode==Master"]

    set cu_slaves [get_bd_intf_pins -quiet -of $cu_instances -filter "Mode==Slave"]
    set sim_xdma [get_bd_cells  /static_region/* -filter {VLNV=~xilinx.com:xilinx:sim_xdma:3.0}]
    set sspm_supported_platform false

    if { [llength $sim_xdma] > 0 } { 
      set sspm_supported_platform true
    }
    foreach slave $cu_slaves {
      if {[string first axis [get_property -quiet VLNV $slave]] >= 0} {
        
        if { $sspm_supported_platform == false } {
          continue
        }

        puts "SSPM SLAVE: start sitching slave streaming monitor ..."
        set monName "sim_axi_stream_perf_mon_${i}"
        puts "SSPM SLAVE: Adding monitor $monName to CU slave $slave..."
        set str_mon [create_bd_cell -type ip -vlnv xilinx.com:Debug:sim_axi_stream_perf_mon:1.0 $monName]

        set cu_slave_name $slave
        set monId [string trimleft $slave "/"]
        set monId [string map {"/" ":"} $monId]

        set fullName $slave

        puts "SSPM SLAVE: setting monitor ID $monId"

        set_property -dict [list CONFIG.MONITOR_ID $monId ] $str_mon

        # "Slave"
        set monitorPinProperty 1
        set properties [expr ($monitorPinProperty << 1) ]
        add_debug_ip AXI_STREAM_MONITOR $str_mon $fullName $properties

        set monClock [get_clk_from_intf_pin $slave]

        set monReset [get_reset_from_intf_pin $slave]

        if {$monReset eq ""} {
          puts "SSPM SLAVE WARNING: using default reset in emulation flow"
          set monReset [get_bd_pins $monitor_reset]
        }

        puts "SSPM SLAVE: using clock: $monClock and reset: $monReset"

        connect_bd_net [get_bd_pins sim_axi_stream_perf_mon_${i}/axi_aclk] [get_bd_pins $monClock]
        connect_bd_net [get_bd_pins sim_axi_stream_perf_mon_${i}/axi_aresetn] [get_bd_pins $monReset]
        connect_bd_intf_net [get_bd_intf_pins $str_mon/MON_AXI_STRM] [get_bd_intf_pins $slave]

        incr i
      }
    }
    
    foreach master $cu_masters {
      if {[string first axis [get_property -quiet VLNV $master]] < 0} {
        set currSegs [get_bd_addr_segs -of_objects $master]
      
        # Calculate number of monitors (1 per memory type) and their min/max addresses for filtering
        # NOTE: the code below assumes a contiguous address space across each memory type 
        if {[llength $currSegs] <= 1} { 
          set numMonitors 1
        } else {
          set minAddresses {}
          set maxAddresses {}
          foreach seg $currSegs {
            set minAddress [get_property offset $seg]
            set range      [get_property range $seg]
            set maxAddress [format 0x%X [expr $minAddress + $range - 1]]
            #puts "--- DEBUG: Calculating # of monitors: min = $minAddress, max = $maxAddress, seg = $seg"
            
            # Get min/max addresses (must be in hex format, e.g., 0xDEADCAFE))
            set memoryResource [get_memory_from_addr_seg $seg]
            if {[dict exists $minAddresses $memoryResource]} {
              set currMin [dict get $minAddresses $memoryResource]
              set newMin [expr {($currMin < $minAddress) ? $currMin : $minAddress}]
              dict set minAddresses $memoryResource [format 0x%X $newMin]
              
              set currMax [dict get $maxAddresses $memoryResource]
              set newMax [expr {($currMax > $maxAddress) ? $currMax : $maxAddress}]
              dict set maxAddresses $memoryResource [format 0x%X $newMax]
            } else {
              dict set minAddresses $memoryResource [format 0x%X $minAddress]
              dict set maxAddresses $memoryResource [format 0x%X $maxAddress]
            }
          }
          
          set numMonitors [llength [dict keys $minAddresses]]
          puts "--- DEBUG: minAddresses = $minAddresses"
          puts "--- DEBUG: maxAddresses = $maxAddresses"  
        }
	           
        # Add a monitor for every memory type on this port (e.g., DDR, PLRAM)
        for { set m 0 } { $m < $numMonitors } { incr m } {
          set monName "sim_axi_perf_mon2_${i}"
          puts "--- DEBUG: Adding monitor $monName to CU master $master..."
          set perf_mon [create_bd_cell -type ip -vlnv xilinx.com:Debug:sim_axi_perf_mon:1.0 $monName]
          set fullName $master
  
          # Specify address filtering if multiple monitors
          if {$numMonitors > 1} {
            set memoryResource [lindex [dict keys $minAddresses] $m]
            set memoryIndeces [get_memory_indeces_from_addr_segs $currSegs $memoryResource]
            
            # Set min/max addresses
            set minAddress [dict get $minAddresses $memoryResource]
            set maxAddress [dict get $maxAddresses $memoryResource]
            puts "--- DEBUG: Address filtering for $master: min = $minAddress, max = $maxAddress, memory = $memoryResource" 
             
            # Enable and set address filtering
            # NOTE: these properties are used in RPC call
            set_property CONFIG.ENABLE_ADDR_FILTER 1 $perf_mon
            set_property CONFIG.ADDR_MIN $minAddress $perf_mon
            set_property CONFIG.ADDR_MAX $maxAddress $perf_mon
          } else {
            set memoryResource [get_memory_from_addr_seg [lindex $currSegs 0]]
            set memoryIndeces [get_memory_indeces_from_addr_segs $currSegs $memoryResource]
          }
          
          # Append memory name to port name
          append fullName $port_mem_sep
          append fullName $memoryResource
          if {$memoryIndeces != ""} {
            append fullName "\[${memoryIndeces}\]"
          }
          
          add_debug_ip AXI_MM_MONITOR $perf_mon $fullName $i
        
          # This property is used in RPC call
          set monId [string trimleft $fullName "/"]
          set monId [string map {"/" ":"} $monId]
          puts "--- DEBUG: setting monitor ID $monId"
          set_property -dict [list CONFIG.MONITOR_ID $monId ] $perf_mon
          
          set monClock [get_clk_from_intf_pin $master]
          set monReset [get_reset_from_intf_pin $master]
          if {$monReset eq ""} {
            puts "WARNING: using default reset in emulation flow"
            set monReset [get_bd_pins -quiet $monitor_reset]
          }
          puts "--- DEBUG: using clock: $monClock and reset: $monReset"
          connect_bd_net [get_bd_pins sim_axi_perf_mon2_${i}/axi_aclk] [get_bd_pins $monClock]
          if {$monReset ne ""} {
            connect_bd_net [get_bd_pins sim_axi_perf_mon2_${i}/axi_aresetn] [get_bd_pins $monReset]  
          }
          connect_bd_intf_net [get_bd_intf_pins $perf_mon/MON_AXI] [get_bd_intf_pins $master]
          incr i
        }
      } else {
        
        if { $sspm_supported_platform == false } {
          continue
        }
        puts "SSPM: start sitching master streaming monitor ..."
        set monName "sim_axi_stream_perf_mon_${i}"
        puts "SSPM: Adding monitor $monName to CU master $master..."
        set str_mon [create_bd_cell -type ip -vlnv xilinx.com:Debug:sim_axi_stream_perf_mon:1.0 $monName]
        
        set cu_master_name $master
        set monId [string trimleft $master "/"]
        set monId [string map {"/" ":"} $monId]
        
        set fullName $master
        
        puts "SSPM: setting monitor ID $monId"
        
        set_property -dict [list CONFIG.MONITOR_ID $monId ] $str_mon
        
          # "Master"
          set properties 0
        add_debug_ip AXI_STREAM_MONITOR $str_mon $fullName $properties
        
        set monClock [get_clk_from_intf_pin $master]
        
        set monReset [get_reset_from_intf_pin $master]
        
        if {$monReset eq ""} {
          puts "SSPM WARNING: using default reset in emulation flow"
          set monReset [get_bd_pins $monitor_reset]
        }
        
        puts "SSPM: using clock: $monClock and reset: $monReset"
        
        connect_bd_net [get_bd_pins sim_axi_stream_perf_mon_${i}/axi_aclk] [get_bd_pins $monClock]
        connect_bd_net [get_bd_pins sim_axi_stream_perf_mon_${i}/axi_aresetn] [get_bd_pins $monReset]
        connect_bd_intf_net [get_bd_intf_pins $str_mon/MON_AXI_STRM] [get_bd_intf_pins $master]
        
        incr i
      }
    }      
  }; # end add_axi_perf_mons_ports

  ################################################################################
  # add_accel_mons
  #   Description:
  #     Add accelerator monitors (HW emulation only)
  #     NOTE: BD of dynamic region is assumed to be open
  #   Arguments:
  #     none
  ################################################################################
  proc add_accel_mons {} {
    global dsa_xdp_info
    set monitor_reset [dict_get_default $dsa_xdp_info MONITOR_RESET {}]
    
    set i 0
    set cu_instances [get_bd_cells -quiet -hier -filter "SDX_KERNEL==true"]
    
    foreach cu $cu_instances {
      # Grab the AXI-Lite slave and associated clock/reset
      set monSlave [lindex [get_bd_intf_pins -quiet -of_objects $cu -filter {CONFIG.PROTOCOL == AXI4LITE && MODE == Slave}] 0]
      set monClock [get_clk_from_intf_pin $monSlave]
      set monReset [get_reset_from_intf_pin $monSlave]
      if {$monReset eq ""} {
        puts "WARNING: using default reset in emulation flow"
        set monReset [get_bd_pins $monitor_reset]
      }
      puts "--- DEBUG: using clock: $monClock, reset: $monReset, slave: $monSlave"
      
      # If all looks good, then insert monitor
      if {($monSlave ne "") && ($monClock ne "") && ($monReset ne "")} {
        puts "--- DEBUG: adding monitor to CU: $cu"
        set accel_mon [ create_bd_cell -type ip -vlnv xilinx.com:Debug:sim_sdx_accel_monitor sim_accel_mon_${i}]
        # This property is used in RPC call
        if {[string index $cu 0] == "/"} {
          set cu_name [string range $cu 1 [string length $cu]]
        }
        set_property -dict [list CONFIG.MONITOR_ID $cu_name] $accel_mon
        add_debug_ip ACCEL_MONITOR $accel_mon $cu_name $i
      
        connect_bd_net [get_bd_pins $accel_mon/axi_aclk] [get_bd_pins $monClock]
        connect_bd_net [get_bd_pins $accel_mon/axi_aresetn] [get_bd_pins $monReset]
        connect_bd_intf_net [get_bd_intf_pins $accel_mon/MON_AXI] [get_bd_intf_pins $monSlave]
        incr i
      }
    }
  }; # end add_accel_mons
  
  ################################################################################
  # add_protocol_checker_unip
  #   Description:
  #     Add protocol checkers (HW emulation only)
  #     NOTE: BD of dynamic region is assumed to be open
  #   Arguments:
  #     none
  ################################################################################
  proc add_protocol_checker_unip {} {
    # Monitor all AXI-MM ports on all compute units
    set perfMonPorts [list]
    set accelCells [get_bd_cells * -filter {VLNV =~ "xilinx.com:hls:*"} -quiet]
    foreach accel $accelCells {
      set accelMasters [get_bd_intf_pins -of_objects $accel -quiet]
      foreach pinName $accelMasters {
        # Instantiate monitor
        set tmpName "axi_protocol_checker_[string trimleft $pinName "/"]"
        set ipName [string map {"/" "_"} $tmpName]
        puts "--- DEBUG: Adding $ipName for kernel protocol checking..."
        set protocol_obj [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_protocol_checker $ipName]
        # Connect clock and reset
        set currClock [get_clk_from_intf_pin $pinName]
        set currReset [get_reset_from_intf_pin $pinName]
        if { ($currClock eq "") || ($currReset eq "") } {
          delete_bd_objs $protocol_obj
          puts "WARNING: unable to insert $ipName"
          continue
        }
        connect_bd_net [get_bd_pins $currClock] [get_bd_pins $ipName/aclk]
        connect_bd_net [get_bd_pins $currReset] [get_bd_pins $ipName/aresetn]

        # Connect AXI port"
        connect_bd_intf_net [get_bd_intf_pins $ipName/PC_AXI] [get_bd_intf_pins $pinName]
      }
    }
    save_bd_design
  }
  
  ################################################################################
  # get_clk_from_intf_pin
  #   Description:
  #     Get clock pin given AXI interface pin
  #   Arguments:
  #     intfPin          AXI interface pin
  ################################################################################
  proc get_clk_from_intf_pin {intfPin} {
    set currPin [get_bd_intf_pins $intfPin -quiet]
    set currCell [get_bd_cells -of_objects $currPin -quiet]
    if {$currCell eq ""} {
      puts "WARNING: unable to find clock from interface pin $intfPin"
      return ""   
    }
    
    # Non-hierarchy method
    set pinName [string range $intfPin [expr [string last "/" $intfPin]+1] [string length $intfPin]]
    #puts "--- DEBUG get_clk_from_intf_pin: pin = $intfPin, cell = $currCell, pinName = $pinName"

    set clockPins [get_bd_pins -of_objects $currCell -filter {TYPE == clk}]
    #puts "--- DEBUG get_clk_from_intf_pin: clock pins = $clockPins"
    foreach clockPin $clockPins {
      set associatedBusif [get_property CONFIG.ASSOCIATED_BUSIF $clockPin]
      if {[string first $pinName $associatedBusif] >= 0} {
        return $clockPin
      }
    }
    
    # Hierarchical method
    #puts "--- DEBUG get_clk_from_intf_pin: use hierarchical method..."
    set connObj [find_bd_objs -quiet -relation connected_to -boundary_type lower -stop_at_interconnect -thru_hier $currPin]
    set connCell [get_bd_cells -quiet -of_objects $connObj]
    set pinName [string range $connObj [expr [string last "/" $connObj]+1] [string length $connObj]]
    #puts "--- DEBUG get_clk_from_intf_pin: object = $connObj, cell = $connCell, pin = $pinName"

    set clockPins [get_bd_pins -of_objects $connCell -filter {TYPE == clk}]
    #puts "--- DEBUG get_clk_from_intf_pin: clock pins = $clockPins"
    foreach clockPin $clockPins {
      set associatedBusif [get_property CONFIG.ASSOCIATED_BUSIF $clockPin]
      if {[string first $pinName $associatedBusif] >= 0} {
        return $clockPin
      }
    }
    
    return ""
  }
   
  ################################################################################
  # get_reset_from_intf_pin
  #   Description:
  #     Get reset pin given AXI interface pin
  #   Arguments:
  #     intfPin          AXI interface pin
  ################################################################################
  proc get_reset_from_intf_pin {intfPin} {
    global dsa_xdp_info
    set default_reset [get_bd_pins -quiet [dict_get_default $dsa_xdp_info MONITOR_RESET {}]]
    
    set clockPin [get_clk_from_intf_pin $intfPin]
    set currPin [get_bd_intf_pins $intfPin -quiet]
    set currCell [get_bd_cells -of_objects $currPin -quiet]
    if {$currCell eq ""} {
      puts "WARNING: unable to find reset from interface pin $intfPin"
      return "" 
    }
    
    set resetPin [string tolower [get_property CONFIG.ASSOCIATED_RESET $clockPin -quiet]]
    #puts "--- DEBUG get_reset_from_intf_pin: ASSOCIATED_RESET clockPin = $clockPin, resetPin = $resetPin"
    # Grab first one if multiple ones are listed
    if {[string first ":" $resetPin] >= 0} {
      set resetPin [string range $resetPin 0 [expr [string first ":" $resetPin] - 1]]
    }
    
    if {$resetPin eq ""} {
      # Hierarchical method
      #puts "--- DEBUG get_reset_from_intf_pin: use hierarchical method..."
      set connObj [find_bd_objs -quiet -relation connected_to -boundary_type lower -stop_at_interconnect -thru_hier $currPin]
      set connCell [get_bd_cells -quiet -of_objects $connObj]
      set pinName [string range $connObj [expr [string last "/" $connObj]+1] [string length $connObj]]
      #puts "--- DEBUG get_reset_from_intf_pin: object = $connObj, cell = $connCell, pin = $pinName"

      set resetPins [get_bd_pins -quiet -of_objects $connCell -filter {TYPE == rst} -quiet]
      #puts "--- DEBUG get_reset_from_intf_pin: reset pins = $resetPins"
      foreach resetPin $resetPins {
        return $resetPin
      }
    
      # Find it another way
      set resetPin [lindex [get_bd_pins -of_objects $currCell -filter {TYPE == rst} -quiet] 0]
      if {$resetPin eq ""} {
        puts "WARNING: unable to find reset from interface pin $intfPin"
        set resetPin $default_reset
      }
      return "$resetPin"
    }
    
    set hierName [string range $clockPin 0 [expr [string last "/" $clockPin] - 1]]
    set hierNet [get_bd_nets -quiet -of_objects [get_bd_pins -quiet $hierName/$resetPin]]
    set hierDriverPin [lindex [get_bd_pins -quiet -of_objects $hierNet -filter {DIR == O}] 0]
    puts "--- DEBUG get_reset_from_intf_pin: name = $hierName, net = $hierNet, driver pin = $hierDriverPin"
    if {$hierDriverPin eq ""} {
      return "$currCell/$resetPin"
    }
    return $hierDriverPin
  }
  
  ################################################################################
  # get_version
  #   Description:
  #     Returns list of [major minor] versions of a given cell
  #   Arguments:
  #     cellName      name of cell
  #     major         major version
  #     minor         minor version
  ################################################################################ 
  proc get_version { cellName } {
    set cellObj [get_bd_cells -quiet $cellName]
    if {$cellObj == {}} {
      set cellObj [get_bd_cells -hier -quiet $cellName]
      if {$cellObj == {}} {
        return [list 0 0]
      }
    }
    
    set vlnv [split [get_property VLNV $cellObj] ":"]
    return [split [lindex $vlnv 3] "."]
  }
  
  ################################################################################
  # add_debug_ip
  #   Description:
  #     Add to list of debug IP
  #   Arguments:
  #     type          type of IP (string in debug_ip_types dict)
  #     instance      name of instance (used for matching to get base address)
  #     name          name string used in metadata (e.g., cu_name/port_name)
  #     properties    core-specific properties (default is 0)
  ################################################################################
  proc add_debug_ip { type instance {name "none"} {properties 0} } {
    global debug_ip_list
    set debug_ip [dict create type $type instance $instance name $name properties $properties]
    lappend debug_ip_list $debug_ip
  }
  
  proc write_debug_ip_entry { instance fp type index properties base_address name last } {
    set version [get_version $instance]
    
    puts $fp "      \"debug_ip_data\": \{"
    puts $fp "        \"m_type\": \"$type\","
    puts $fp "        \"m_index\": \"$index\","
    puts $fp "        \"m_major\": \"[lindex $version 0]\","
    puts $fp "        \"m_minor\": \"[lindex $version 1]\","
    puts $fp "        \"m_properties\": \"$properties\","
    puts $fp "        \"m_base_address\": \"$base_address\","
    puts $fp "        \"m_name\": \"$name\""
    if { $last } {
      puts $fp "      \}"
    } else {
      puts $fp "      \},"
    }
  }
  
  # utility function called by init_dr_bd in ocl_util.tcl
  # this is the main entrance tcl proc
  ################################################################################
  # write_debug_ip_unip
  #   Description:
  #     Write out debug_ip_layout.rtd file
  #   Arguments:
  #     output_dir       output directory
  ################################################################################
  proc write_debug_ip_unip { output_dir } {
    # Note: there is already an open bd design

    global debug_ip_list
    #global debug_ip_types
    set debug_ip_types { "UNDEFINED" 0 "LAPC" 1 "ILA" 2 "AXI_MM_MONITOR" 3 \
      "AXI_TRACE_FUNNEL" 4 "AXI_MONITOR_FIFO_LITE" 5 "AXI_MONITOR_FIFO_FULL" 6 "AXI_STREAM_MONITOR" 7 }
      
    if {![info exists debug_ip_list]} {
      return
    }
    
    set major_version 1
    set minor_version 0
    set patch 0
    set num_entries [llength $debug_ip_list]
    
    # No file written if no debug IP to report
    if {$num_entries == 0} {
      return
    }
    
    # set outfile ./debug_ip_layout.rtd
    set outfile $output_dir/debug_ip_layout.rtd
    puts "--- DEBUG: writing $outfile"
    set fp [open $outfile w]

    # write header
    puts $fp "\{"
    puts $fp "  \"schema_version\": \{"
    puts $fp "    \"major\": \"${major_version}\","
    puts $fp "    \"minor\": \"${minor_version}\","
    puts $fp "    \"patch\": \"${patch}\""
    puts $fp "  \},"
    puts $fp "  \"debug_ip_layout\": \{"
    puts $fp "    \"m_count\": \"${num_entries}\","
    puts $fp "    \"m_debug_ip_data\": \{"

    set i 0
    set addr_segs [get_bd_addr_segs -hier]
    
    foreach debug_ip $debug_ip_list {
      set type [dict get $debug_ip type]
      #set typenum [dict_get_default $debug_ip_types $type [dict get $debug_ip_types UNDEFINED]]
      set instance [dict get $debug_ip instance]
      set properties [dict get $debug_ip properties]
      set name [dict get $debug_ip name]
      #set name [string map {"/" "."} $name]
      if {[string index $name 0] == "/"} {
        set name [string range $name 1 [string length $name]]
      }
      
      set base_address 0xdeadbeef
      
      set index 0
      scan [regexp -inline {\d?\d} $instance] "%d" index

      # get base address (search address segs)
      foreach addr_seg $addr_segs {           
        set offset [get_property OFFSET $addr_seg]
        if {$offset != ""} {
          #set range [format 0x%X [get_property RANGE $addr_seg]]                 
          set slave [get_bd_addr_segs -of_object $addr_seg]

          # Catch incompatible trace FIFO addresses
          set foundFull [string first FULL $slave]
          if {($type == "AXI_MONITOR_FIFO_LITE" && $foundFull >= 0)
               || ($type == "AXI_MONITOR_FIFO_FULL" && $foundFull < 0)} {
            continue 
          }
          
          if { ![regexp {([^/]+)/([^/]+)/([^/]+)$} $slave match slaveRef slaveMemoryMap slaveSegment] } {
            puts "--- DEBUG: slave doesn't match regular expression (slave: $slave)"
            continue
          }
          #puts "slave = $slave, instance = $instance, slaveRef = $slaveRef, offset = $offset"
          if {[string equal -nocase $slaveRef $instance] == 1} {
            set base_address $offset
            break
          }
        }
      }
      
      incr i
      set last [expr {($i == $num_entries) ? true : false}]
      puts "--- DEBUG IP: inst = ${instance}, type = ${type}, addr = ${base_address}, name = ${name}"
      write_debug_ip_entry $instance $fp $type $index $properties $base_address $name $last
    }
    
    # write footer
    puts $fp "    \}"
    puts $fp "  \}"
    puts $fp "\}"
    close $fp
  }; # end write_debug_ip_unip
  
  ################################################################################
  # write_cu_masters_unip
  #   Description:
  #     writes list of all CU masters for monitoring purposes
  #   Arguments:
  #     none
  ################################################################################
  proc write_cu_masters_unip {} {
    set fd [open "./cu_masters.info" "w"]
    set cu_instances [get_bd_cells -quiet -hier -filter "SDX_KERNEL==true"]
    set cu_masters [get_bd_intf_pins -quiet -of $cu_instances -filter "Mode==Master"]
    foreach master $cu_masters {
      puts $fd [string map {"/" ":"} [string trimleft $master "/"]]
    }
    close $fd
  }
  
  ################################################################################
  # update_unified_profiling
  #   Description:
  #     add profiling for unified platforms, including monitoring:
  #     host and kernel masters, protocols for HW emulation, and 
  #     stall monitoring (in 2018.x)
  #     NOTE: the BD of the dynamic region is assumed to be open
  #   Arguments:
  #     profile_info     profile dictionary from compiler
  #     is_hw_emu        true: is HW emulation; false: not HW emulation
  #     kernel_debug     true: kernel debug is on; false: kernel debug is off
  #     output_dir       output directory
  ################################################################################
  proc update_unified_profiling { profile_info is_hw_emu kernel_debug output_dir } {
    global dsa_xdp_info
    set hostMasters     [dict_get_default $dsa_xdp_info HOST_MASTERS {}]
    set isDedicated     [dict_get_default $dsa_xdp_info DEDICATED_MASTER true]
    set fullMaster      [dict_get_default $dsa_xdp_info AXIMM_MASTER {}]
    set liteMaster      [get_bd_intf_pins -quiet [dict_get_default $dsa_xdp_info AXILITE_MASTER {}]]
    set traceClock      [get_bd_pins -quiet [dict_get_default $dsa_xdp_info TRACE_CLOCK {}]]
    set traceReset      [get_bd_pins -quiet [dict_get_default $dsa_xdp_info TRACE_RESET {}]]
    set default_ap_clk  [get_bd_pins -quiet [dict_get_default $dsa_xdp_info MONITOR_CLOCK {}]]
    set default_ap_rst  [get_bd_pins -quiet [dict_get_default $dsa_xdp_info MONITOR_RESET {}]]
    # Isolate clocks for better timing for designs with dedicated trace port
    set useCDC          $isDedicated
    puts "--- DEBUG DSA-Specific Information used for debug/profiling:"
    puts "--- DEBUG     host masters = $hostMasters"
    puts "--- DEBUG     AXI-lite master = $liteMaster"
    puts "--- DEBUG     AXI full master = $fullMaster (dedicated: $isDedicated)"
    puts "--- DEBUG     trace: clock = $traceClock, reset = $traceReset"
    puts "--- DEBUG     monitor: clock = $default_ap_clk, reset = $default_ap_rst"
    puts "--- DEBUG     new clocking structure = $useCDC"
      
    set name [dict_get_default $profile_info NAME "profile_monitors"]
    # Host and kernel masters (board only)
    if { !$is_hw_emu && ($profile_info != {})} {
      puts "--- DEBUG: Adding profiling of host and kernel masters..."

      set slots [dict get $profile_info DATA]
      set stallSlots [dict get $profile_info STALL]
      set execSlots [dict get $profile_info EXEC]
      set numDataSlots [llength $slots]
      set numStallSlots [llength $stallSlots]
      set numExecSlots [llength $execSlots]
      set is_exec_enabled [expr {$numDataSlots == 0 && $numStallSlots == 0 ? 1 : 0}]
      
      if {$numDataSlots == 0 && $numStallSlots == 0 && $numExecSlots == 0} {
        puts "CRITICAL WARNING: Empty profile data. Ignoring profiling."
        return
      }  
        
      if {($hostMasters == {}) || ($fullMaster == {}) || ($liteMaster == {}) \
          || ($traceClock == {}) || ($traceReset == {}) \
          || ($default_ap_clk == {}) || ($default_ap_rst == {})} {
        set warnMessage "CRITICAL WARNING: DSA-specific information is incorrect. Unable to insert profiling."
        puts $warnMessage
        warning2file $output_dir $warnMessage
        return
      }
      
      # Trace Infrastructure is setup based on this flag
      set useTrace 0
      if {$is_exec_enabled} {
        foreach data $execSlots {
          if {[dict get $data option] eq "all"} {set useTrace 1}
        }
      } else {
        foreach data $slots {
          if {[dict get $data option] eq "all"} {set useTrace 1}
        }
        foreach data $stallSlots {
          if {[dict get $data option] eq "all"} {set useTrace 1}
        }
      }
      puts "--- DEBUG: useTrace : $useTrace"

      # Free up AXI-Lite master
      set liteSlave [get_bd_intf_pins -quiet -of_objects [get_bd_intf_nets -quiet -of_objects $liteMaster] -filter {Mode=="Slave"}]
      delete_bd_objs -quiet [get_bd_cells -quiet -of_objects $liteSlave]
        
      # Add master and clock for AXI full
      # NOTE: assumes only one profiler
      if {$useTrace} {
        # If not dedicated master, then rip out current connection and add 1x2 SmartConnect 
        if {!$isDedicated} {
          # Get host interconnect name (if specified as cell/port, then split out cell name; CR-1016469)
          set hostInterconName [lindex [split $fullMaster "/"] 0]
        
          set hostMaster [lindex $hostMasters 0]
          set hostDataWidth [get_property -quiet CONFIG.DATA_WIDTH [get_bd_intf_pins $hostMaster]]
          # Default
          if {$hostDataWidth == {}} {
            set hostDataWidth 512
          }
          set hostNet [get_bd_intf_nets -of_objects [get_bd_intf_pins $hostMaster]]
          set hostSlavePin [get_bd_intf_pins -of_objects $hostNet -filter {MODE == Slave}]
          delete_bd_objs $hostNet
          set hostIntercon [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect $hostInterconName]
          set_property CONFIG.NUM_SI 1 $hostIntercon
          set_property CONFIG.NUM_MI 2 $hostIntercon
          set_property CONFIG.NUM_CLKS 2 $hostIntercon

          # CR 994345: add bypass reg slice to specify data width
          set hostRegName "reg_aximm_host" 
          set hostReg [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice $hostRegName]
          set_property CONFIG.DATA_WIDTH.VALUE_SRC USER $hostReg
          set_property CONFIG.DATA_WIDTH $hostDataWidth $hostReg
          set_property CONFIG.REG_AW 0 $hostReg
          set_property CONFIG.REG_AR 0 $hostReg
          set_property CONFIG.REG_W  0 $hostReg
          set_property CONFIG.REG_R  0 $hostReg
          set_property CONFIG.REG_B  0 $hostReg

          set hostClock [get_clk_from_intf_pin $hostMaster]
          set hostReset [get_reset_from_intf_pin $hostMaster]
          connect_bd_net [get_bd_pins $hostClock] [get_bd_pins $hostInterconName/aclk]
          connect_bd_net [get_bd_pins $hostReset] [get_bd_pins $hostInterconName/aresetn]
          connect_bd_net [get_bd_pins $hostClock] [get_bd_pins $hostRegName/aclk]
          connect_bd_net [get_bd_pins $hostReset] [get_bd_pins $hostRegName/aresetn]
          connect_bd_net $traceClock [get_bd_pins $hostInterconName/aclk1]

          connect_bd_intf_net [get_bd_intf_pins $hostMaster] [get_bd_intf_pins $hostInterconName/S00_AXI]
          connect_bd_intf_net [get_bd_intf_pins $hostInterconName/M00_AXI] [get_bd_intf_pins $hostRegName/S_AXI]
          connect_bd_intf_net [get_bd_intf_pins $hostRegName/M_AXI] $hostSlavePin
          set fullMaster [get_bd_intf_pins $hostInterconName/M01_AXI]
          # Specify new host master
          lset hostMasters 0 "$hostInterconName/M00_AXI"
        } else {
          set fullMaster [get_bd_intf_ports $fullMaster]
          
          # Since master is dedicated, delete any cells connected to it
          set fullSlavePins [get_bd_intf_pins -of_objects [get_bd_intf_nets -of_objects $fullMaster] -filter {Mode=="Slave"}]
          delete_bd_objs -quiet [get_bd_cells -quiet -of_objects $fullSlavePins]
        }
      }
      
      # Create complete list for data profiling (hosts + kernels)
      set dataSlots [list]
      set numHostMasters [llength $hostMasters]
      foreach hostMaster $hostMasters {
        lappend dataSlots [dict create port $hostMaster option counters host 1]
      }
      foreach kernelMaster $slots {
        dict append kernelMaster host 0
        lappend dataSlots $kernelMaster
      }
      
      puts "--- DEBUG: Adding kernel data profiling $name - lite master: $liteMaster, full master: $fullMaster"
      puts "--- DEBUG:   useTrace : $useTrace, trace clock: $traceClock, trace reset: $traceReset"
      puts "--- DEBUG:   slots: $dataSlots"
      add_kernel_data_profiling $liteMaster $fullMaster $traceClock \
                                $traceReset $useTrace $dataSlots $numHostMasters \
                                $default_ap_clk $default_ap_rst $useCDC
      #set slots [lreplace $slots 0 0]
      
      # Mutual Exclusion of data,stall and exec options
      set accelCells {}
      if {$is_exec_enabled} {
        puts "--- DEBUG: Adding only exec monitoring"
        foreach cell $execSlots {
          set execPort [get_bd_cells [dict get $cell port]]
          set execOpt [dict get $cell option]
          lappend accelCells [dict create port $execPort option $execOpt stall off]
        }
      } else {
        puts "--- DEBUG : Adding exec by default"
        set masterCellsList [list]
        foreach master $slots {
          set masterPort [dict get $master port]
          lappend masterCellsList [get_bd_cells -of_objects [get_bd_intf_pins $masterPort]]
        }
        set masterCellsList [lsort -unique $masterCellsList]
        foreach cell $masterCellsList {
          if {$useTrace} {
              lappend accelCells [dict create port $cell option all stall off]
            } else {
              lappend accelCells [dict create port $cell option counters stall off]
            }
        }
        foreach cell $stallSlots {
          set stallCell [get_bd_cells [dict get $cell port]]
          set stallOpt [expr { $useTrace ? "all" : [dict get $cell option] } ]
          set stallDict [dict create port $stallCell option $stallOpt stall on]
          set id [lsearch -exact $masterCellsList $stallCell]
          if {$id >= 0} {
            set accelCells [lreplace $accelCells $id $id $stallDict]
          } else {
            lappend accelCells $stallDict
          }
        }
        set accelCells [lsort -unique $accelCells]
      }
      puts "--- DEBUG: After kernel data profiling accelCells $accelCells"
      add_accel_monitors $is_hw_emu $name $accelCells $traceClock $traceReset $useCDC
      # Create hierarchy
      group_bd_cells $name [get_bd_cells xilmon*]
      save_bd_design
      puts "--- DEBUG: Completed adding kernel data profiling"
    }
    
    #
    # Protocol monitors for detailed kernel trace (HW emulation only)
    #
    if { $is_hw_emu && $kernel_debug } {
      puts "--- DEBUG: Adding protocol monitors..."
    
      # Write cu masters list to a file
      # write_cu_masters_unip
  
      # Monitor all AXI-MM ports on all compute units
      set perfMonPorts [list]
      set accelCells [get_bd_cells -quiet -hier -filter "SDX_KERNEL==true"]
      foreach accel $accelCells {
        set accelMasters [get_bd_intf_pins -of_objects $accel -filter {MODE == Master} -quiet]
        foreach master $accelMasters {
          lappend perfMonPorts $master
        }
      }
      
      puts "--- DEBUG: Monitoring ports = ${perfMonPorts}" 
      add_protocol_monitors ${perfMonPorts} false
      
      # Monitor all DDR bank masters
      set perfMonPorts [list]
      set bankMasterCells [get_bd_cells -filter {NAME =~ "interconnect_aximm_ddrmem*"} -quiet]
      lappend bankMasterCells [get_bd_cells -filter {NAME =~ "memory_subsystem"} -quiet]
      foreach masterCell $bankMasterCells {
        set memoryMasters [get_bd_intf_pins -of_objects $masterCell -filter {MODE == Master} -quiet]
        foreach master $memoryMasters {
          lappend perfMonPorts $master
        }
      }
      
      puts "--- DEBUG: Monitoring ports = ${perfMonPorts}" 
      add_protocol_monitors ${perfMonPorts} true
      save_bd_design
      puts "--- DEBUG: Completed adding protocol monitoring"
    }
  }; # end update_unified_profiling

  ################################################################################
  # add_kernel_data_profiling
  #   Description:
  #     Insert device profiling of kernel masters into IPI diagram
  #     NOTE: this uses the next generation monitor IP
  #   Arguments:
  #     liteMaster       AXI Lite master (BD interface pin)
  #     fullMaster       AXI Full master (BD interface pin)
  #     traceClock       Trace clock (BD pin)
  #     traceReset       Trace reset (BD pin)
  #     useTrace         Use Trace (boolean)
  #     monitorList      List of AXI interface port names to monitor
  #     numHostMasters   Number of host masters (depends on DSA)
  #     default_ap_clk   Clock from first cu. Used to setup trace
  #     default_ap_rst   Reset associated with default_ap_clk
  ################################################################################
  proc add_kernel_data_profiling {liteMaster fullMaster traceClock \
                                  traceReset useTrace monitorList numHostMasters \
                                  default_ap_clk default_ap_rst useCDC} {
    global dsa_xdp_info
    variable ::ocl_util::trace_id_min_spm
    variable ::ocl_util::trace_id_min_sspm
    variable ::ocl_util::use_64_bits
    variable ::ocl_util::port_mem_sep
    set slrAssignmentTrace [dict_get_default $dsa_xdp_info SLR_ASSIGNMENT "SLR0"]
    
    # Constants
    set hostIndex 0
    set maxAXISlaves 64
    set maxAXIMasters 64
    set monFifoDepth 1024
    set fifoDepth 8192
    set monName "xilmon_mon"
    set funnelName "xilmon_tm"
    set fifoName "xilmon_fifo0"
    set interconName "xilmon_intercon"
    
    #
    # Initialization
    #

    # Ensure correct number of monitor ports
    # NOTE: # ports = # CU masters + {1|4} for host; max # of trace ports on funnel = 63
    set numPorts [llength $monitorList]
    if {$numPorts <= 0 || $numPorts > 31} {
      puts "WARNING: Total number of ports (host inclusive) to monitor must be between 1 and 31."
      puts "numPorts : $numPorts numHostMasters : $numHostMasters"
      return
    }

    # Make sure interface pins exist
    for { set i 0 } { $i < $numPorts } { incr i } {
      set monitorPinName [ dict get [lindex $monitorList $i] port]
      #puts "DEBUG: Monitor Pin found $monitorPinName"
      if { [get_bd_intf_pins $monitorPinName -quiet] eq "" } {
        puts "WARNING: unable to find interface pin $monitorPinName"
        return
      }
    }
    
    # 
    # Insert cores
    #
    
    set numPortMon 0
    # Count of AXIMM IPs (used only for trace ID calculations)
    set strMonCount 0
    # Count of AXIMM IPs (used only for trace ID calculations)
    set aximmMonTrCount 0
    set monitorNames {}
    set monitorPins {}
    
    # AXI-MM and AXIS monitors
    for { set i 0 } { $i < $numPorts } { incr i } {
      set currDict [lindex $monitorList $i]
      set currPort [dict get $currDict port]
      set currUseTrace [expr {[dict get $currDict option] eq "all" ? 1 : 0 }]

      set currCell [get_bd_cells -of_objects [get_bd_intf_pins -quiet $currPort]]
      set currSLR [get_property -quiet CONFIG.SLR_ASSIGNMENTS $currCell]
      
      if { [string first axis [get_property -quiet VLNV [get_bd_intf_pins -quiet $currPort]]] < 0 } {
        set currSegs [get_bd_addr_segs -of_objects [get_bd_intf_pins $currPort]]
        set isHost [dict get $currDict host]
        
        # Calculate number of monitors (1 per memory type) and their min/max addresses for filtering
        # NOTE: the code below assumes a contiguous address space across each memory type 
        if {([llength $currSegs] <= 1) || $isHost} { 
          set numMonitors 1
        } else {
          set minAddresses {}
          set maxAddresses {}
          foreach seg $currSegs {
            set minAddress [get_property offset $seg]
            set range      [get_property range $seg]
            set maxAddress [format 0x%X [expr $minAddress + $range - 1]]
            #puts "--- DEBUG: Calculating # of monitors: min = $minAddress, max = $maxAddress, seg = $seg"
            
            # Get min/max addresses (must be in hex format, e.g., 0xDEADCAFE))
            set memoryResource [get_memory_from_addr_seg $seg]
            if {[dict exists $minAddresses $memoryResource]} {
              set currMin [dict get $minAddresses $memoryResource]
              set newMin [expr {($currMin < $minAddress) ? $currMin : $minAddress}]
              dict set minAddresses $memoryResource [format 0x%X $newMin]
              
              set currMax [dict get $maxAddresses $memoryResource]
              set newMax [expr {($currMax > $maxAddress) ? $currMax : $maxAddress}]
              dict set maxAddresses $memoryResource [format 0x%X $newMax]
            } else {
              dict set minAddresses $memoryResource [format 0x%X $minAddress]
              dict set maxAddresses $memoryResource [format 0x%X $maxAddress]
            }
          }
          
          set numMonitors [llength [dict keys $minAddresses]]
          puts "--- DEBUG: minAddresses = $minAddresses"
          puts "--- DEBUG: maxAddresses = $maxAddresses"  
        }
	      
        # Add a monitor for every memory type on this port (e.g., DDR, PLRAM)
        for { set m 0 } { $m < $numMonitors } { incr m } {
          set currMonName ${monName}${numPortMon}
          puts "--- DEBUG: Inserting AXI-MM monitor: $currMonName..."
          lappend monitorNames $currMonName
          lappend monitorPins [get_bd_intf_pins $currPort]
            
          set mon_obj [create_bd_cell -type ip -vlnv xilinx.com:ip:Monitor_AXI_Master $currMonName]
          set_property CONFIG.TRACE_READ_ID [expr $trace_id_min_spm + 2*$aximmMonTrCount] $mon_obj
          set_property CONFIG.TRACE_WRITE_ID [expr $trace_id_min_spm + 2*$aximmMonTrCount+1] $mon_obj
          set_property CONFIG.CAPTURE_BURSTS 0 $mon_obj
          set_property CONFIG.ENABLE_DEBUG 1 $mon_obj
          set_property CONFIG.EN_AXI_LITE 1 $mon_obj
          set_property CONFIG.ENABLE_COUNTERS 1 $mon_obj
          set_property CONFIG.MODE_SDACCEL 1 $mon_obj
          if {$use_64_bits} {
            set_property CONFIG.COUNT_WIDTH 64 $mon_obj
          }
          if {$currSLR != {}} {
            set_property CONFIG.SLR_ASSIGNMENTS $currSLR $mon_obj
          }
          
          set fullName $currPort
          
          if {!$isHost} {
            if {$numMonitors > 1} {
              set memoryResource [lindex [dict keys $minAddresses] $m]
              set memoryIndeces [get_memory_indeces_from_addr_segs $currSegs $memoryResource]
            
              # Set min/max addresses
              set minAddress [dict get $minAddresses $memoryResource]
              set maxAddress [dict get $maxAddresses $memoryResource]
              puts "--- DEBUG: Address filtering for $currPort: min = $minAddress, max = $maxAddress, memory = $memoryResource"
              
              # Enable and set address filtering
              set_property CONFIG.ENABLE_ADDR_FILTER 1 $mon_obj
              set_property CONFIG.ADDR_MIN $minAddress $mon_obj
              set_property CONFIG.ADDR_MAX $maxAddress $mon_obj
            } else {
              set memoryResource [get_memory_from_addr_seg [lindex $currSegs 0]]
              set memoryIndeces [get_memory_indeces_from_addr_segs $currSegs $memoryResource]
            }
            
            # Append memory name to port name
            append fullName $port_mem_sep
            append fullName $memoryResource
            if {$memoryIndeces != ""} {
              append fullName "\[${memoryIndeces}\]"
            }
          }
          
          set useCounters 1
          set_property CONFIG.ENABLE_COUNTERS $useCounters $mon_obj
          # Don't turn on trace for host monitor
          set_property CONFIG.ENABLE_TRACE $currUseTrace $mon_obj
      
          if { [info exists ::env(SDX_PROFILING_REG_STAGES)] } {
            set_property CONFIG.NUM_REG_STAGES $::env(SDX_PROFILING_REG_STAGES) $mon_obj
          } else {
            set_property CONFIG.NUM_REG_STAGES 0 $mon_obj
          }
      
          set properties [expr ($use_64_bits << 3) + ($isHost << 2) + ($useCounters << 1) + $currUseTrace]
          add_debug_ip AXI_MM_MONITOR $currMonName $fullName $properties
          incr numPortMon
          incr aximmMonTrCount
        }
      } else {
      	# Insert AXI Stream monitor
      	# NOTE: the counters in this monitor are always 64 bits
        set currMonName ${monName}${numPortMon}
        puts "--- DEBUG: Inserting AXI Stream monitor: $currMonName"
        lappend monitorNames $currMonName
        lappend monitorPins [get_bd_intf_pins $currPort]
        set mon_obj [create_bd_cell -type ip -vlnv xilinx.com:ip:SDx_Monitor_AXI_Stream $currMonName]
        set_property CONFIG.TRACE_ID [expr $trace_id_min_sspm + $strMonCount] $mon_obj
        set_property CONFIG.EN_AXI_LITE true $mon_obj
        set_property CONFIG.DETAILED_TRACE 1 $mon_obj
        set_property CONFIG.ENABLE_TRACE $currUseTrace $mon_obj
        if {$currSLR != {}} {
          set_property CONFIG.SLR_ASSIGNMENTS $currSLR $mon_obj
        }
        
        set monitorPinMode [get_property MODE [get_bd_intf_pins $currPort]]
        if  {$monitorPinMode == "Slave"} {
          set monitorPinProperty 1
        } else {
          set monitorPinProperty 0
        }
        set properties [expr ($monitorPinProperty << 1) + $currUseTrace]
        add_debug_ip AXI_STREAM_MONITOR $currMonName $currPort $properties
        incr strMonCount
        incr numPortMon
      }
    }
    
    # Gather list of unique clocks
    # NOTE: only needed for SmartConnect
    #set uniqueClockList [list $traceClock]
    #for { set i 0 } { $i < $numPortMon } { incr i } {
    #  set clockPin [get_clk_from_intf_pin [lindex $monitorPins $i]]
    #  if {[lsearch $uniqueClockList $clockPin] < 0} {
    #    lappend uniqueClockList $clockPin
    #  }
    #}
    #puts "uniqueClockList = $uniqueClockList"
    
    # Setup Trace Infrastructure
    if { $useTrace } {
      # Trace funnel
      puts "--- DEBUG: Inserting trace funnel: $funnelName..."
      set funnel_obj [create_bd_cell -type ip -vlnv xilinx.com:ip:Trace_Integrator $funnelName]
      set tracePorts [expr 2*($numPortMon-$numHostMasters)]
      #set_property CONFIG.NUM_TRACE_PORTS $tracePorts $funnel_obj
      set_property CONFIG.SLR_ASSIGNMENTS $slrAssignmentTrace $funnel_obj
   
      add_debug_ip AXI_TRACE_FUNNEL $funnelName none $tracePorts 
   
      # AXI Stream FIFO
      puts "--- DEBUG: Inserting AXI Stream FIFO: $fifoName..."
      set fifo_obj [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_fifo_mm_s $fifoName]
      set_property CONFIG.C_DATA_INTERFACE_TYPE 1 $fifo_obj
      set_property CONFIG.C_S_AXI4_DATA_WIDTH 64 $fifo_obj
      set_property CONFIG.C_RX_FIFO_DEPTH $fifoDepth $fifo_obj
      set_property CONFIG.C_RX_FIFO_PF_THRESHOLD [expr $fifoDepth - 5] $fifo_obj
      set_property CONFIG.C_USE_RX_CUT_THROUGH true $fifo_obj
      set_property CONFIG.C_USE_TX_DATA 0 $fifo_obj
      set_property CONFIG.SLR_ASSIGNMENTS $slrAssignmentTrace $fifo_obj
    
      add_debug_ip AXI_MONITOR_FIFO_LITE $fifoName
      add_debug_ip AXI_MONITOR_FIFO_FULL $fifoName

      # Trace Clocks
      connect_bd_net $default_ap_clk [get_bd_pins $funnelName/mon_clk]
      set fifoClkPins [get_bd_pins -of_objects $fifo_obj -filter {DIR == I && TYPE == clk}]
      connect_bd_net $traceClock $fifoClkPins
      # Trace Resets
      set funnelRstPins [get_bd_pins -of_objects $funnel_obj -filter {DIR == I && TYPE == rst}]
      connect_bd_net $default_ap_rst [get_bd_pins $funnelName/mon_resetn]
      set fifoRstPins [get_bd_pins -of_objects $fifo_obj -filter {DIR == I && TYPE == rst}]
      connect_bd_net $traceReset $fifoRstPins
      # AXI-MM full for trace offload
      connect_bd_intf_net $fullMaster [get_bd_intf_pins $fifoName/S_AXI_FULL]

      if {$useCDC} {
        # New Clocking structure
        connect_bd_net $default_ap_clk [get_bd_pins $funnelName/trace_clk]
        connect_bd_net $default_ap_rst [get_bd_pins $funnelName/trace_resetn]
        # AXIS CDC (Required for 5.2)
        set cdcName "xilmon_cdc"
        set cdc_obj [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_clock_converter $cdcName]
        connect_bd_net $default_ap_clk [get_bd_pins $cdcName/s_axis_aclk]
        connect_bd_net $default_ap_rst [get_bd_pins $cdcName/s_axis_aresetn]
        connect_bd_net $traceClock [get_bd_pins $cdcName/m_axis_aclk]
        connect_bd_net $traceReset [get_bd_pins $cdcName/m_axis_aresetn]
        # Funnel to FIFO connection
        connect_bd_intf_net [get_bd_intf_pins $funnelName/M_AXIS] [get_bd_intf_pins $cdcName/S_AXIS]
        connect_bd_intf_net [get_bd_intf_pins $cdcName/M_AXIS] [get_bd_intf_pins $fifoName/AXI_STR_RXD]
      } else {
        # Funnel to FIFO connection
        connect_bd_net $traceClock [get_bd_pins $funnelName/trace_clk]
        connect_bd_net $traceReset [get_bd_pins $funnelName/trace_resetn]
        connect_bd_intf_net [get_bd_intf_pins $funnelName/M_AXIS] [get_bd_intf_pins $fifoName/AXI_STR_RXD]
      }
    }
    
    # AXI interconnect
    # NOTE: use v2 AXI interconnect instead of Smart Connect since max # SI or MI = 64
    puts "--- DEBUG: Inserting AXI interconnect: $interconName..."
    set numSlaves 1
    set numMasters [expr { $useTrace ? ($numPortMon + 2) : $numPortMon } ]
    set intercon_obj [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect $interconName]
    #set intercon_obj [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect $interconName]
    set_property CONFIG.NUM_SI $numSlaves $intercon_obj
    set_property CONFIG.NUM_MI $numMasters $intercon_obj
    #set_property CONFIG.NUM_CLKS [llength $uniqueClockList] $intercon_obj
    
    for { set i 0 } { $i < $numSlaves } { incr i } {
      set axiSlaveRegSlice [expr { ($i >= 10) ? "S${i}_HAS_REGSLICE" : "S0${i}_HAS_REGSLICE" } ]
      set_property CONFIG.$axiSlaveRegSlice 1 $intercon_obj
    }
    for { set i 0 } { $i < $numMasters } { incr i } {
      set axiMasterRegSlice [expr { ($i >= 10) ? "M${i}_HAS_REGSLICE" : "M0${i}_HAS_REGSLICE" } ]
      set_property CONFIG.$axiMasterRegSlice 1 $intercon_obj
    }
    
    #
    # Connect clocks & resets
    #
    puts "--- DEBUG: Connecting clocks and resets..."
    
    # Clocks
    for { set i 0 } { $i < $numPortMon } { incr i } {
      set currMonName [lindex $monitorNames $i]
      set currUseTrace [get_property CONFIG.ENABLE_TRACE [get_bd_cells $currMonName]]
      set currClock [get_clk_from_intf_pin [lindex $monitorPins $i]]
      
      #puts "Connecting $currClock to $currMonName/mon_clk"
      connect_bd_net [get_bd_pins $currClock] [get_bd_pins $currMonName/mon_clk]
      if {$currUseTrace} {
        #puts "Connecting $traceClock to $currMonName/trace_clk"
        if {$useCDC} {
          connect_bd_net $currClock [get_bd_pins $currMonName/trace_clk]
        } else {
          connect_bd_net $traceClock [get_bd_pins $currMonName/trace_clk]
        }
      }
    }
    
    #puts "Connecting $default_ap_clk to $interconName/ACLK"
    #connect_bd_net $traceClock [get_bd_pins $interconName/ACLK]
    connect_bd_net $default_ap_clk [get_bd_pins $interconName/ACLK]
    
    for { set i 0 } { $i < $numSlaves } { incr i } {
      set currClock [get_clk_from_intf_pin $liteMaster]
      set axiClkName [expr { ($i >= 10) ? "S${i}_ACLK" : "S0${i}_ACLK" } ]
      #puts "Connecting $currClock to $interconName/$axiClkName"
      connect_bd_net [get_bd_pins $currClock] [get_bd_pins $interconName/$axiClkName]
    }
    for { set i 0 } { $i < $numMasters } { incr i } {
      set axiClkName [expr { ($i >= 10) ? "M${i}_ACLK" : "M0${i}_ACLK" } ]
      set allPortMon [expr $useCDC ? $numPortMon + 1 : $numPortMon]
      if {$i < $allPortMon} {
        set currClock [get_clk_from_intf_pin [lindex $monitorPins $i]]
        if {$currClock == {}} {
          set currClock $default_ap_clk
        }
        #puts "Connecting $currClock to $interconName/$axiClkName"
        connect_bd_net [get_bd_pins $currClock] [get_bd_pins $interconName/$axiClkName]
      } else {
        #puts "Connecting $traceClock to $interconName/$axiClkName"
        connect_bd_net $traceClock [get_bd_pins $interconName/$axiClkName]
      }
    }
    
    # Resets
    for { set i 0 } { $i < $numPortMon } { incr i } {
      set currMonName [lindex $monitorNames $i]
      set currUseTrace [get_property CONFIG.ENABLE_TRACE [get_bd_cells $currMonName]]
      set currReset [get_reset_from_intf_pin [lindex $monitorPins $i]]
      
      puts "Connecting port reset: $currReset to $currMonName/mon_resetn"
      connect_bd_net [get_bd_pins $currReset] [get_bd_pins $currMonName/mon_resetn]
      if {$currUseTrace} {
        #puts "Connecting port reset: $traceReset to $currMonName/trace_rst"
        if {$useCDC} {
          connect_bd_net $currReset [get_bd_pins $currMonName/trace_rst]
        } else {
          connect_bd_net $traceReset [get_bd_pins $currMonName/trace_rst]
        }
      }
    }

    # Interconnect reset
    #puts "Connecting $default_ap_rst to $interconName/ARESETN"
    #connect_bd_net $traceReset [get_bd_pins $interconName/ARESETN]
    connect_bd_net $default_ap_rst [get_bd_pins $interconName/ARESETN]
    
    for { set i 0 } { $i < $numSlaves } { incr i } {
      set currReset [get_bd_pins [get_reset_from_intf_pin $liteMaster]]
      set axiRstName [expr { ($i >= 10) ? "S${i}_ARESETN" : "S0${i}_ARESETN" } ]
      if {[get_property DIR $currReset] == "I"} {
        set currReset [find_bd_objs -relation connected_to -thru_hier $currReset]
      }
      
      puts "Connecting slave reset: $currReset to $interconName/$axiRstName"
      connect_bd_net $currReset [get_bd_pins $interconName/$axiRstName]
    }
    for { set i 0 } { $i < $numMasters } { incr i } {
      set axiRstName [expr { ($i >= 10) ? "M${i}_ARESETN" : "M0${i}_ARESETN" } ]
      set allPortMon [expr $useCDC ? $numPortMon + 1 : $numPortMon]
      if {$i < $allPortMon} {
        set currReset [get_reset_from_intf_pin [lindex $monitorPins $i]]
        if {$currReset == {}} {
          set currReset $default_ap_rst
        }
        puts "Connecting master reset: $currReset to $interconName/$axiRstName"
        connect_bd_net [get_bd_pins $currReset] [get_bd_pins $interconName/$axiRstName]
      } else {
        puts "Connecting master reset: $traceReset to $interconName/$axiRstName"
        connect_bd_net $traceReset [get_bd_pins $interconName/$axiRstName]
      }
    }
    
    #
    # Make Connections
    #
    puts "--- DEBUG: Connecting all blocks..."
    
    # Monitor ports
    set index 0
    for { set i 0 } { $i < $numPortMon } { incr i } {
      set currMonName [lindex $monitorNames $i]
      set isStreamMon [ string first Stream [get_property VLNV [get_bd_cells $currMonName]] ]
      set currUseTrace [get_property CONFIG.ENABLE_TRACE [get_bd_cells $currMonName]]
      if { $isStreamMon < 0 } {
      connect_bd_intf_net [get_bd_intf_pins $currMonName/MON_M_AXI] [lindex $monitorPins $i]
      } else {
        connect_bd_intf_net [get_bd_intf_pins $currMonName/MON_AXIS] [lindex $monitorPins $i]
      }
      
      # Connect trace for non-host ports
      if { $currUseTrace } {
        if { $isStreamMon < 0 } {
        set tracePort0 TRACE_${index}
        set tracePort1 TRACE_[expr $index + 1]
        incr index 2
          set_property CONFIG.NUM_TRACE_PORTS $index $funnel_obj
        connect_bd_intf_net [get_bd_intf_pins $currMonName/TRACE_OUT_0] [get_bd_intf_pins $funnelName/$tracePort0]
        connect_bd_intf_net [get_bd_intf_pins $currMonName/TRACE_OUT_1] [get_bd_intf_pins $funnelName/$tracePort1]
        set monPortNet [get_bd_intf_nets -of_objects [get_bd_intf_pins $currMonName/MON_M_AXI]]
        set currCUCell [get_bd_cells -of_objects [get_bd_intf_pins -of_objects $monPortNet -filter {MODE == Master}]]
        set accelAxiLiteSlave [get_bd_intf_pins -of_objects $currCUCell -filter {CONFIG.PROTOCOL == AXI4LITE && MODE == Slave}]
        connect_bd_intf_net -quiet $accelAxiLiteSlave [get_bd_intf_pins $currMonName/MON_S_AXI]
        } else {
          set tracePort0 TRACE_${index}
          incr index 1
          set_property CONFIG.NUM_TRACE_PORTS $index $funnel_obj
          connect_bd_intf_net [get_bd_intf_pins $currMonName/TRACE_OUT] [get_bd_intf_pins $funnelName/$tracePort0]
      }
    }
    }
    
    # Interconnect slaves
    connect_bd_intf_net $liteMaster [get_bd_intf_pins $interconName/S00_AXI]
    
    # Interconnect masters
    for { set i 0 } { $i < $numPortMon } { incr i } {
      set currMonName [lindex $monitorNames $i]
      set axiMasterName [expr { ($i >= 10) ? "M${i}_AXI" : "M0${i}_AXI" } ]
      connect_bd_intf_net [get_bd_intf_pins $interconName/$axiMasterName] [get_bd_intf_pins $currMonName/S_AXI]
    }
    
    if { $useTrace } {
    set axiMasterName [expr { ($numPortMon >= 10) ? "M${numPortMon}_AXI" : "M0${numPortMon}_AXI" } ]
    connect_bd_intf_net [get_bd_intf_pins $interconName/$axiMasterName] [get_bd_intf_pins $funnelName/S_AXI]
    set pp1 [expr $numPortMon + 1]
    set axiMasterName [expr { ($pp1 >= 10) ? "M${pp1}_AXI" : "M0${pp1}_AXI" } ]
    connect_bd_intf_net [get_bd_intf_pins $interconName/$axiMasterName] [get_bd_intf_pins $fifoName/S_AXI]
  }
  }; # end add_kernel_data_profiling
  
  ################################################################################
  # add_protocol_monitors
  #   Description:
  #     Insert debug monitoring for HW emulation into dynamic region of unified platforms
  #   Arguments:
  #     monNameList  list of AXI intf ports to monitor
  #     isDDR        true: monitors for DDR banks; false not for DDR
  #
  ################################################################################
  proc add_protocol_monitors {monNameList isDDR} {
    global dsa_xdp_info
    set monitor_reset [dict_get_default $dsa_xdp_info MONITOR_RESET {}]
    
    if {[llength $monNameList] == 0} {
      puts "WARNING: no ports specified for protocol monitoring"
      return
    }
    
    # Insert monitor interface block on each port
    foreach pinName $monNameList {
      if { [get_bd_intf_pins $pinName -quiet] eq "" } {
        puts "WARNING: interface pin $pinName not found in current block diagram"
        continue
      }
      
      # Instantiate monitor
      if {$isDDR} {
        if {[string last 3 $pinName] >= 0} {
          set tmpName "xilmonitor_ddrmem3"
        } elseif {[string last 2 $pinName] >= 0} {
          set tmpName "xilmonitor_ddrmem2"
        } elseif {[string last 1 $pinName] >= 0} {
          set tmpName "xilmonitor_ddrmem1"
        } else {
          set tmpName "xilmonitor_ddrmem0"
        }
      } else {
        set tmpName "xilmonitor_[string trimleft $pinName "/"]"
      }
      set ipName [string map {"/" "_"} $tmpName]
      puts "--- DEBUG: Adding $ipName for kernel debug monitoring..."
      set mon_obj [ create_bd_cell -type ip -vlnv xilinx.com:ip:sdx_aximm_wv $ipName]
      
      # Connect clock and reset
      set currClock [get_clk_from_intf_pin $pinName]
      set currReset [get_reset_from_intf_pin $pinName]
      if {$currClock eq ""} {
        delete_bd_objs $mon_obj
        puts "WARNING: unable to insert $ipName"
        continue
      }
      if {$currReset eq ""} {
        puts "WARNING: using default reset in emulation flow"
        set currReset [get_bd_pins $monitor_reset]
      }
      connect_bd_net [get_bd_pins $currClock] [get_bd_pins $ipName/mon_axi_aclk]
      connect_bd_net [get_bd_pins $currReset] [get_bd_pins $ipName/mon_axi_aresetn]
      
      # Connect AXI port
      connect_bd_intf_net [get_bd_intf_pins $ipName/mon_axi] [get_bd_intf_pins $pinName]
    }
  }; # end add_protocol_monitors
  
  ################################################################################
  # add_accel_monitors
  #   Description:
  #     Insert profile monitoring of accelerators into dynamic region of unified platforms
  #   Arguments:
  #     is_hw_emu        true: HW emulation run; false: otherwise 
  #     name             Name of hierarchical block
  #     accelList        List of accelerators to monitor
  #     traceClock       Clock that runs the trace system
  #     traceReset       Reset for traceClock
  #     useCDC           New clocking structure where using accel clock as trace clock
  ################################################################################
  proc add_accel_monitors {is_hw_emu name accelList traceClock traceReset useCDC} {
    global dsa_xdp_info
    variable ::ocl_util::trace_id_min_sam
    variable ::ocl_util::use_64_bits
    set axiLiteIntercon [dict_get_default $dsa_xdp_info AXILITE_INTERCONNECT {}]
    set liteMaster      [dict_get_default $dsa_xdp_info AXILITE_MASTER {}]
    
    if {($axiLiteIntercon == {}) || ($liteMaster == {})} {
      puts "CRITICAL WARNING: AXI-Lite interconnect and master not found. Unable to insert accelerator monitors."
      return
    }
    
    # Constants (same as in add_kernel_data_profiling)
    set fifoDepth 4096
    set funnelName "xilmon_tm"
    set fifoName "xilmon_fifo0"
    set interconName "xilmon_intercon"
    
    # Ensure correct number of monitor ports
    set numPorts [llength $accelList]
    if {$numPorts <= 0 || $numPorts > 30} {
      puts "WARNING: number of Accelerators to monitor must be between 1 and 30."
      return
    }
    
    # Get trace clock/reset (if not already defined)
    set firstAccel [get_bd_cells [dict get [lindex $accelList 0] port]]
    set accelClock [get_bd_pins -of_objects $firstAccel -filter {TYPE == clk}]
    set accelReset [get_bd_pins -of_objects $firstAccel -filter {TYPE == rst}]
    if {[expr {[llength $accelClock] != 1 || [llength $accelReset] != 1}]} {
      puts "WARNING : Kernel $firstAccel has non standard number of clocks/resets"
      set accelSlave [lindex [get_bd_intf_pins -quiet -of_objects $firstAccel -filter {CONFIG.PROTOCOL == AXI4LITE && MODE == Slave}] 0]
      set accelClock [get_clk_from_intf_pin $accelSlave]
      set accelReset [get_reset_from_intf_pin $accelSlave]
    }
      
    # Add another master (HW emulation only)
    if { $is_hw_emu } {
      set currNumMasters [get_property CONFIG.NUM_MI [get_bd_cells $axiLiteIntercon]]
      set_property CONFIG.NUM_MI [expr $currNumMasters + 1] [get_bd_cells $axiLiteIntercon]
      set masterName [expr { ($currNumMasters >= 10) ? "M${currNumMasters}_AXI" : "M0${currNumMasters}_AXI" } ]
      set liteMaster [get_bd_intf_pins $axiLiteIntercon/$masterName]
      
      set axiClkName [expr { ($currNumMasters >= 10) ? "M${currNumMasters}_ACLK" : "M0${currNumMasters}_ACLK" } ]
      set axiRstName [expr { ($currNumMasters >= 10) ? "M${currNumMasters}_ARESETN" : "M0${currNumMasters}_ARESETN" } ]
      connect_bd_net $accelClock [get_bd_pins $axiLiteIntercon/$axiClkName]
      connect_bd_net $accelReset [get_bd_pins $axiLiteIntercon/$axiRstName]
    }
    
    # Insert monitor on each accelerator
    set count 0
    foreach accelDict $accelList {
      set accelName [get_bd_cells -quiet [dict get $accelDict port]]
      set currUseTrace [expr {[dict get $accelDict option] eq "all" ? 1 : 0} ]
      set useStall [expr {[dict get $accelDict stall] eq "on" ? 1 : 0 }]
      if { $accelName == {} } {
        puts "WARNING: accelerator $accelName not found in current block diagram"
        continue
      }
      
      # Instantiate monitor
      set monName "xilmonitor_[string trimleft $accelName "/"]"
      #set monName $name/[string map {"/" "_"} $tmpName]
      if { [get_bd_cells -quiet $monName] != {} } {
        delete_bd_objs [get_bd_cells $monName]
      }
      puts "--- DEBUG: Adding $monName for accelerator monitoring..."
      set mon_obj [ create_bd_cell -type ip -vlnv xilinx.com:ip:sdx_accel_monitor $monName]
      set_property CONFIG.TRACE_ID [expr $trace_id_min_sam + ($count * 16)] $mon_obj
      set_property CONFIG.ENABLE_TRACE $currUseTrace $mon_obj
      set_property CONFIG.STALL_MON $useStall $mon_obj
      set_property CONFIG.EN_AXI_LITE 1 $mon_obj
      if {$use_64_bits} {
        set_property CONFIG.COUNT_WIDTH 64 $mon_obj
      }
    
      # Assign SLR (if defined)
      set currSLR [get_property -quiet CONFIG.SLR_ASSIGNMENTS $accelName]
      if {$currSLR != {}} {
        set_property CONFIG.SLR_ASSIGNMENTS $currSLR $mon_obj
      }
          
      # Connect clock and reset
      set accelClock [get_bd_pins -of_objects $accelName -filter {TYPE == clk}]
      set accelReset [get_bd_pins -of_objects $accelName -filter {TYPE == rst}]
      if {[expr {[llength $accelClock] != 1 || [llength $accelReset] != 1}]} {
      puts "WARNING : Kernel $accelName has non standard number of clocks/resets"
      set accelSlave [lindex [get_bd_intf_pins -quiet -of_objects $accelName -filter {CONFIG.PROTOCOL == AXI4LITE && MODE == Slave}] 0]
      set accelClock [get_clk_from_intf_pin $accelSlave]
      set accelReset [get_reset_from_intf_pin $accelSlave]
    }
      if { ($accelClock eq "") || ($accelReset eq "") } {
        delete_bd_objs $mon_obj
        puts "WARNING: unable to insert $monName"
        continue
      }
      connect_bd_net [get_bd_pins $accelClock] [get_bd_pins $monName/mon_clk]
      connect_bd_net [get_bd_pins $accelReset] [get_bd_pins $monName/mon_resetn]
      if ($currUseTrace) {
        if {$useCDC} {
          connect_bd_net $accelClock [get_bd_pins $monName/trace_clk]
          connect_bd_net $accelReset [get_bd_pins $monName/trace_rst]
        } else {
          connect_bd_net $traceClock [get_bd_pins $monName/trace_clk]
          connect_bd_net $traceReset [get_bd_pins $monName/trace_rst]
        }
      }
      
      # Connect control signals
      if {[get_bd_pins -quiet $accelName/event_start] != {}
          && [get_bd_pins -quiet $accelName/event_done] != {}} {
        set_property CONFIG.MONITOR_MODE 2 $mon_obj
        connect_bd_net [get_bd_pins $accelName/event_start] [get_bd_pins $monName/event_start]
        connect_bd_net [get_bd_pins $accelName/event_done] [get_bd_pins $monName/event_done]  
      } else {
        # Monitor AXI lite slave instead
        set_property CONFIG.MONITOR_MODE 1 $mon_obj
        set accelAxiLiteSlave [get_bd_intf_pins -of_objects $accelName -filter {CONFIG.PROTOCOL == AXI4LITE && MODE == Slave}]
        connect_bd_intf_net $accelAxiLiteSlave [get_bd_intf_pins $monName/s_axi_mon]
      }
      
      if {$useStall} {
        if {[get_bd_pins -quiet $accelName/stall_start_ext] != {}} {
          connect_bd_net [get_bd_pins $accelName/stall_start_ext] [get_bd_pins $monName/stall_start_ext]
          connect_bd_net [get_bd_pins $accelName/stall_done_ext] [get_bd_pins $monName/stall_done_ext]
          connect_bd_net [get_bd_pins $accelName/stall_start_str] [get_bd_pins $monName/stall_start_str]
          connect_bd_net [get_bd_pins $accelName/stall_done_str] [get_bd_pins $monName/stall_done_str]
          connect_bd_net [get_bd_pins $accelName/stall_start_int] [get_bd_pins $monName/stall_start_int]
          connect_bd_net [get_bd_pins $accelName/stall_done_int] [get_bd_pins $monName/stall_done_int]
        } else {
          # User forgot to compile with stall
          set useStall 0
        }
      }
    
      # Connect trace ports only if trace integrator is available
      if { !$is_hw_emu && $currUseTrace} {
        set firstPort 0
        set fullFunnelName $funnelName
        
        if { [get_bd_cells -quiet $fullFunnelName] != {} } {
          set funnel_obj [get_bd_cells $fullFunnelName]
          set currNumPorts [get_property CONFIG.NUM_TRACE_PORTS $funnel_obj]
          
          set firstPort $currNumPorts
          if { [get_bd_intf_pins -quiet $monName/trace_out] != {} && $firstPort < 63 } {
            set numPorts [expr $currNumPorts + 1]
            set_property CONFIG.NUM_TRACE_PORTS $numPorts $funnel_obj
            connect_bd_intf_net -quiet [get_bd_intf_pins $monName/trace_out] [get_bd_intf_pins $fullFunnelName/TRACE_${firstPort}]
          } else {
            # No port available on Trace Integrator
            set currUseTrace 0
            set_property CONFIG.ENABLE_TRACE $currUseTrace $mon_obj
          }
        } else {
          # No Trace Integrator IP Available
          set currUseTrace 0
          set_property CONFIG.ENABLE_TRACE $currUseTrace $mon_obj
        }
      }
      
      # Add AXI interconnect (if needed) and connect AXI slave
      set numMasters 1
      set fullInterconName $interconName
      if {[get_bd_cells -quiet $fullInterconName] != {}} {
        set intercon_obj [get_bd_cells $fullInterconName]
        set numMasters [expr [get_property CONFIG.NUM_MI $intercon_obj] + 1]
        set_property CONFIG.NUM_MI $numMasters $intercon_obj
      } else {
        set intercon_obj [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect $fullInterconName]
        set_property CONFIG.NUM_MI $numMasters $intercon_obj
        
        connect_bd_intf_net $liteMaster [get_bd_intf_pins $fullInterconName/S00_AXI]
        set liteMasterClk [get_bd_pins [get_clk_from_intf_pin $liteMaster]]
        set liteMasterRst [get_bd_pins [get_reset_from_intf_pin $liteMaster]]
        connect_bd_net $liteMasterClk [get_bd_pins $fullInterconName/ACLK]
        connect_bd_net $liteMasterRst [get_bd_pins $fullInterconName/ARESETN]
        connect_bd_net $liteMasterClk [get_bd_pins $fullInterconName/S00_ACLK]
        connect_bd_net $liteMasterRst [get_bd_pins $fullInterconName/S00_ARESETN]
      }
      set masterNum [expr $numMasters - 1]
      set masterName [expr { ($masterNum >= 10) ? "M${masterNum}_AXI" : "M0${masterNum}_AXI" } ]
      puts "--- DEBUG Add Accel Mons : connecting $monName to mastername $fullInterconName/$masterName"
      connect_bd_intf_net [get_bd_intf_pins $monName/s_axi] [get_bd_intf_pins $fullInterconName/$masterName]
      
      set axiClkName [expr { ($masterNum >= 10) ? "M${masterNum}_ACLK" : "M0${masterNum}_ACLK" } ]
      set axiRstName [expr { ($masterNum >= 10) ? "M${masterNum}_ARESETN" : "M0${masterNum}_ARESETN" } ]
      connect_bd_net [get_bd_pins $accelClock] [get_bd_pins $fullInterconName/$axiClkName]
      connect_bd_net [get_bd_pins $accelReset] [get_bd_pins $fullInterconName/$axiRstName]
      
      set properties [expr ($use_64_bits << 3) + ($useStall << 2) + 2 + $currUseTrace]
      add_debug_ip ACCEL_MONITOR $monName $accelName $properties

      incr count
    }
  }; # end add_accel_monitors

  # ****************************************************************************
  # insert_chipscope_debug -
  #     Given debug_info containing xocc command line compute_unit/port pairs,
  #     instantiate and connect SystemILA debug cores to the AXI interfaces
  #     requested
  #
  # TODO: Env var to turn on additional tcl settings file
  # ****************************************************************************
  proc insert_chipscope_debug {dsa_dr_bd is_hw_emu debug_info} {
    set chipscope_debugs [dict_get_default $debug_info chipscope_debugs [dict create]]
    set name [dict_get_default $chipscope_debugs name ""]
    if { $is_hw_emu } {
      return
    }
    if {$name eq ""} {
      puts "--- DEBUG: insert_chipscope_debug: No chipscope_debugs dict name - nothing to insert"
      return
    }
    set compute_units [dict_get_default $chipscope_debugs compute_units {}]
    if {[llength $compute_units] == 0} {
      puts "--- DEBUG: insert_chipscope_debug: No compute units - nothing to insert"
      return
    }

    open_bd_design $dsa_dr_bd
    set ila_probes [get_ila_probes $compute_units]
    set system_ila_cells [apply_automation $ila_probes]
    rename_ila_nets $ila_probes
    update_system_ila_props $system_ila_cells
    apply_user_ila_properties

    foreach cell $system_ila_cells {
      # Add ILA to debug_ip_layout - one entry per ila port
      set pins [get_bd_intf_pins -quiet -of $cell]
      foreach pin $pins {
        add_debug_ip ILA $cell $pin
      }
    }

    #validate_bd_design -force
    save_bd_design
  }

  # *****************************************************************************************
  # connect_bscan_ports -
  #     Connect the BSCAN interface ports of the kernel(s)(slave(s)) and debug bridge(master)
  #   Arguments:
  #     dsa_dr_bd        block diagram name: diagram in which the connections should be made
  #     is_hw_emu        true: HW emulation run; false: otherwise 
  #
  # *****************************************************************************************
  proc connect_bscan_ports {dsa_dr_bd is_hw_emu} {
    if { $is_hw_emu } {
      return
    }

    open_bd_design $dsa_dr_bd

    #instantiated debug bridge exists?
    set dbgs [get_bd_cells -quiet -hier -filter {VLNV =~ "*ip:debug_bridge*"}]
    #no debug bridge instances, do nothing
    if { [llength $dbgs] == 0} {
      return
    }

    #multiple debug bridge instances, warn
    if {[llength $dbgs] > 1 } {
      puts "WARNING: Could not connect BSCAN interface ports as there are $dbgs debug bridge instances found in the design. A single debug bridge is expected "
      return
    }
   
    #kernel(s) with BSCAN slave interfaces?      
    #ASSUMPTION: all the BSCAN slave interfaces found are unconnected by default 
    set accelBscanIntfs {}
    set accelCells [get_bd_cells -quiet -hier -filter "SDX_KERNEL==true"]
    foreach accel $accelCells {
      set accelSlaves [get_bd_intf_pins -of_objects $accel -filter {VLNV =~ "*interface:bscan_rtl*" && MODE == Slave} -quiet]
      set accelBscanIntfs [concat $accelBscanIntfs [lrange $accelSlaves 0 end]] 
    }

    #no slave BSCAN interfaces, do nothing  
    if {[llength $accelBscanIntfs] == 0} {
      return
    }
    
    #check for the limit and set the total BSCAN master interfaces on debug bridge
    #TODO: get the maximum BSCAN master interfaces from the IP
    set maxBSCANIntfs 16
    set dbg [lindex $dbgs 0]
    set curMBscan [get_property CONFIG.C_NUM_BS_MASTER $dbg]
    set totalMBscan [expr [llength $accelBscanIntfs] + $curMBscan]

    if { $totalMBscan > $maxBSCANIntfs } {
      error "Number of required master BSCAN interfaces $totalMBscan exceeds the limit 16"
      return false
    } 
    set_property CONFIG.C_NUM_BS_MASTER $totalMBscan $dbg -quiet

    #connect the slaves to unconnected master slots
    set slaveIdx 0
    set dbgMasters [get_bd_intf_pins -of_objects $dbg -filter {VLNV =~ "*interface:bscan_rtl*" && MODE == Master} -quiet]
    foreach master $dbgMasters {
      set intfNet [get_bd_intf_net -of $master -quiet]
      if {$intfNet != ""} {
        continue
      }
      set slaveIf [lindex $accelBscanIntfs $slaveIdx]   
      connect_bd_intf_net [get_bd_intf_pins $master -quiet ] [get_bd_intf_pins $slaveIf -quiet] -quiet 
    }

    save_bd_design
  }

  
  # get_clock_for_cu -
  #    Given a compute unit bd_cell, return the compute unit clock pin
  #
  proc get_clock_for_cu {cell} {
    set clk {}
    set clockPins [get_bd_pins -of $cell -filter {DIR==I && TYPE==clk}]
    # There should be only 1 pin, just in case, just take the first for ILA probing
    # TODO: Is it possible to create compute unit with multiple clocks?
    if {[llength $clockPins] > 0} {
      set clk [lindex $clockPins 0]
    } 
    return $clk
  }

  # get_source_clock_for_cu -
  #    Given a compute unit bd_cell, return the compute unit clock source pin/port
  #    if there are multiple clock input, return the highest frequency clock pin source
  #

  proc get_source_clock_for_cu {cell} {
    
    set clkSrc {}
    set clockPins [get_bd_pins -of $cell -filter {DIR==I && TYPE==clk}]
    set clk {}
    if {[llength $clockPins] > 0} {
      set maxFreq 0
      foreach pin $clockPins {
        set pinFreq [get_property CONFIG.FREQ_HZ $pin]
        if { [expr $pinFreq > $maxFreq] } {
          set maxFreq $pinFreq
          set clk $pin
        } 
      }      
    } 
    if {$clk != ""} {
      set clkSrc [get_bd_pins -of [get_bd_nets -of $clk] -filter {DIR==O && TYPE==clk}]
      if {$clkSrc == ""} {
        set clkSrc  [get_bd_ports -of [get_bd_nets -of $clk] -filter {DIR==I && TYPE==clk}]
      }
     
    }
    return $clkSrc
  }

  # get_reset_for_cu
  #   Given a compute unit bd cell, return the reset pin
  #
  proc get_reset_for_cu {cell} {
    set clk [get_clock_for_cu $cell]
    set resetPin [string tolower [get_property CONFIG.ASSOCIATED_RESET $clk]]
    return [get_bd_pins "$cell/$resetPin"]
  }

  # get_ila_probes -
  # Given a compute_units dictionary, return the ila connections as a list
  #    {compute_unit {pins...} compute_unit {pins...}}
  #
  proc get_ila_probes {compute_units} {
    set ila_probes {}
    foreach cu $compute_units {
      set automation_params {}
      set cu_name [dict_get_default $cu name false]
      set cu_pins [dict_get_default $cu ports {}]
      set cu_cell [get_bd_cells $cu_name]
      set intf_pins {}
      foreach cu_pin $cu_pins {
        if {[llength $cu_cell] > 0} {
          set intf_pin [get_bd_intf_pins -of [get_bd_cells $cu_name] -filter NAME=~$cu_pin]
          if {[llength $intf_pin] == 0} {
            set cu_pin_lc [string tolower $cu_pin]
            set intf_pin [get_bd_intf_pins -of [get_bd_cells $cu_name] -filter NAME=~${cu_pin_lc}]
          }
          lappend intf_pins $intf_pin
        }
      }
      # Considering all axi interfaces as no specific comput_unit pin is provided to debug 
      if {[llength $cu_cell] > 0 && [llength $cu_pins] == 0} {
            set cu_axi_pins [get_bd_intf_pins -of_objects $cu_cell -filter {VLNV =~ "*axi*" && CONFIG.PROTOCOL =~ "AXI4*" } -quiet]
            foreach cu_axi_pin $cu_axi_pins {
                lappend intf_pins $cu_axi_pin
            }
      }
      lappend ila_probes $cu_cell $intf_pins
    }
    return $ila_probes
  }

  # get_list_diffs -
  # Given a pre-list of cells and a post automation list of cells, compute
  # and return the list differences
  #
  proc get_list_diffs {old_cells new_cells} {
    set diff_cells {}
    array unset tmp_array
    foreach cell $old_cells {
      set tmp_array($cell) 1
    }
    foreach cell $new_cells {
      if {! [info exists tmp_array($cell)]} {
        lappend diff_cells $cell
      }
    }
    return $diff_cells
  }

  # get_system_ilas - 
  # Given a list of pre-automation and post-automation cells, return all system_ila 
  # cells in the new_cells list not in the old_cells list
  #
  # This is used to further customize IP automatically inserted during bd automation
  #
  proc get_system_ilas {old_cells new_cells} {
    set system_ila_cells {}
    set diff_cells [get_list_diffs $old_cells $new_cells]
    foreach cell $diff_cells {
      set vlnv [get_property VLNV $cell]
      # VLNV=xilinx.com:ip:system_ila:1.1
      if {[regexp {xilinx\.com:ip:system_ila:.*} $vlnv]} {
        lappend system_ila_cells $cell
      }
    }
    return $system_ila_cells
  }

  # rename_ila_nets
  # Given the list of ila_probes, 
  # 1. rename the nets of debug enabled slave interface(s) of kernels 
  #
  proc rename_ila_nets {ila_probes} {
    puts "--- DEBUG: Renaming Chipscope nets"
    foreach {cu_cell cu_pins} $ila_probes {
      set cuCell [get_bd_cells $cu_cell]
      set cuCompName [get_property CONFIG.Component_Name $cuCell]
      foreach cu_pin $cu_pins {
        set intf_net [get_bd_intf_nets -of $cu_pin]

        #rename the net to more readabale
        if { [string equal -nocase [get_property MODE $cu_pin] "Slave"] } {
          set curNetName [get_property NAME $intf_net]
          set pinName [get_property NAME [get_bd_intf_pins $cu_pin]]
          set newNetName ${cuCompName}_${pinName}
          if { ![string equal -nocase ${curNetName} ${newNetName}] } {
              set_property NAME ${newNetName} $intf_net
              puts "--- DEBUG: Renamed net ${curNetName} to $newNetName of pin $cu_pin of computing unit $cu_cell"
          }
        }
      }
    } 
  }
  
  # apply_automation -
  # Given the list of ila_probes, mark them for debug then apply bd automation
  # to instantiate and connect the system ila debug cores.
  #
  proc apply_automation {ila_probes} {
    set automation_params {}
    set system_ila_cells {}
    foreach {cu_cell cu_pins} $ila_probes {
      foreach cu_pin $cu_pins {
        #set clk_pin [get_clk_from_intf_pin $cu_pin]
        set clk_pin [bd::clkrst::get_intf_driver_clk [get_bd_intf_pins $cu_pin] ]
        if {$clk_pin == ""} {
           set clk_pin [get_source_clock_for_cu [get_bd_cells $cu_cell]]
        }
        set intf_net [get_bd_intf_nets -of $cu_pin]
        set_property HDL_ATTRIBUTE.DEBUG true $intf_net
        lappend automation_params $intf_net
        set protocol [get_property CONFIG.PROTOCOL [get_bd_intf_pins $cu_pin]]
        if {$protocol == "AXI4" || $protocol == "AXI4LITE" || $protocol == "AXI4S"} {  
           lappend automation_params \
           [list \
             AXI_R_ADDRESS  "Data and Trigger" \
             AXI_R_DATA     "Data and Trigger" \
             AXI_W_ADDRESS  "Data and Trigger" \
             AXI_W_DATA     "Data and Trigger" \
             AXI_W_RESPONSE "Data and Trigger" \
             CLK_SRC        "$clk_pin" \
             SYSTEM_ILA     "Auto" \
             APC_EN         "1" \
           ] 
        } else {
           lappend automation_params \
           [list \
             NON_AXI_SIGNALS "Data and Trigger" \
             CLK_SRC        "$clk_pin" \
             SYSTEM_ILA     "Auto" \
           ] 

        }
      }
    }
    puts "--- DEBUG: automation_params=$automation_params"
    if {[llength $automation_params] > 0} {
      set old_cells [get_bd_cells]
      apply_bd_automation -rule xilinx.com:bd_rule:debug -dict $automation_params
      set new_cells [get_bd_cells]
      set system_ila_cells [get_system_ilas $old_cells $new_cells]
    
      # automation creates some incorrect reset objects - delete them now
      lappend old_cells $system_ila_cells
      set reset_objs [get_list_diffs $old_cells $new_cells]
      if {[llength $reset_objs]} {
        puts "--- DEBUG: delete_bd_objs $reset_objs"
        delete_bd_objs $reset_objs
      }
    }
    return $system_ila_cells
  }

  # update_system_ila_props -
  #   Given a list of system ila cells, apply any necessary IP property updates
  #   that were not automatically applied during automation
  #
  proc update_system_ila_props {system_ila_cells} {
      # After automation we need to find the new system ILA IPs that are inserted
      # and apply parameter changes that are not available in the bd automation
      #   1. Locate all new system_ila IPs inserted by bd automation
      #   2. Apply parameters to the new IPs
      #
    # These are missing from bd automation so must be manually set on the IP
    foreach system_ila $system_ila_cells {
      set props [list \
          CONFIG.C_DATA_DEPTH {1024} \
          CONFIG.C_INPUT_PIPE_STAGES {2} \
      ]
      set num_slots [get_property {CONFIG.C_NUM_MONITOR_SLOTS} $system_ila]
      for {set slot_idx 0} {$slot_idx < $num_slots} {incr slot_idx} {
        lappend props [format "CONFIG.C_SLOT_%d_MAX_RD_BURSTS" $slot_idx] 64
        lappend props [format "CONFIG.C_SLOT_%d_MAX_WR_BURSTS" $slot_idx] 64
      }
      puts "--- DEBUG: $system_ila property update:  $props"
      set_property -dict $props $system_ila
    }
  }

  # Delete any system ILA cores in the top level bd
  proc delete_system_ilas {} { 
    set system_ila_cells {}
    foreach cell [get_bd_cells] {
      if {! [info exists tmp_array($cell)]} {
        set vlnv [get_property VLNV $cell]
        # VLNV=xilinx.com:ip:system_ila:1.1
        if {[regexp {xilinx\.com:ip:system_ila:.*} $vlnv]} {
          lappend system_ila_cells $cell
        }
      }
    }
    if {[llength $system_ila_cells] > 0} {
      puts "--- DEBUG: delete_bd_objs $system_ila_cells"
      delete_bd_objs $system_ila_cells
    }
  }

  # Expert user post processing
  proc apply_user_ila_properties {} {
    if { [info exists ::env(SDX_CHIPSCOPE_TCL)] } {
      set ila_script $::env(SDX_CHIPSCOPE_TCL)
      if { [file exists $ila_script] } {
        puts "--- DEBUG: sourcing SDX_CHIPSCOPE_TCL script: $ila_script"
        source $ila_script
      }
    }
  }

  ################################################################################
  # update_axi_checkers
  #   Description:
  #     add AXI checkers for unified platforms (does not apply to HW emulation)
  #     host and kernel masters
  #   Arguments:
  #     is_hw_emu        true: is HW emulation; false: not HW emulation
  #     debug_info       debug dictionary from compiler
  ################################################################################
  proc update_axi_checkers {is_hw_emu debug_info dsa_info} {
    if { ($debug_info == {}) } {
      return
    }

    # Contains everything to check (except host)
    # E.g., all AXI masters on all accelerators
    #       {accel_1/m_axi_gmem0 accel_1/m_axi_gmem1 accel_2/m_axi_gmem}
    set protocol_debugs [dict_get_default $debug_info protocol_debugs {}]

    if {$protocol_debugs == {}} {
      return
    }

    if { $is_hw_emu } {
      puts "WARNING: Light Weight AXI protocol checker insertion is supported only in hardware flow. They are not supported in hardware emulation."
      return
    }

    set compute_units [dict_get_default $protocol_debugs compute_units {}]

    puts "--- DEBUG: AXI protocol debug dictionary: $compute_units"
    if {$compute_units == {}} {
      error "No compute units/ports specified for AXI protocol checker insertion"
      return
    }

    #
    # kernel masters
    #
    puts "--- DEBUG: Adding lightweight axi protocol checkers for kernel masters..."

    # Trace back to axi lite interconnect from the first cu
    set first_cu_cell [get_bd_cells [dict get [lindex $compute_units 0] name]]
    set axilite_pin [get_bd_intf_pins -quiet -of_objects $first_cu_cell -filter {CONFIG.PROTOCOL == AXI4LITE && MODE == Slave}]
    set axilite_obj [find_bd_objs -relation connected_to -stop_at_interconnect -thru_hier $axilite_pin]
    set interconobj [get_bd_cells -quiet -of_objects $axilite_obj]
    
    set mgmt_clk [find_bd_objs -relation connected_to -thru_hier -stop_at_interconnect [get_bd_pins $interconobj/S00_ACLK] ]
    set mgmt_reset [find_bd_objs -relation connected_to -thru_hier -stop_at_interconnect [get_bd_pins $interconobj/S00_ARESETN] ]
    puts "--- DEBUG: mgmt_clk = $mgmt_clk, mgmt_reset = $mgmt_reset"
    
    # Check number of masters and add additional master for protocol checkers
    set currentMasters [get_property CONFIG.NUM_MI $interconobj]
    if {$currentMasters > 63} {
      error "Unable to add additional master on the axi-interconnect for inserting \
            AXI-protocol checkers. Current number of masters is $currentMasters. Skipping AXI \
            protocol checker insertion."
      return
    }

    set_property CONFIG.NUM_MI [expr $currentMasters + 1] $interconobj
    set currentMasterName [expr { ($currentMasters >= 10) ? "M${currentMasters}" : "M0${currentMasters}" }]

    #Enable regslice on the newly added master
    set axiMasterRegSlice "${currentMasterName}_HAS_REGSLICE"
    puts "PC: Setting regslice on new master: $axiMasterRegSlice"
    set_property CONFIG.$axiMasterRegSlice 1 $interconobj

    #Prepare checker lists to insert based on dictionary passed in
    #if "all" is specified for computeunit then it would already be expanded
    #if "all" is specified for interfaces then expand to include all masters
    set checkerList {}
    foreach checker_inst $compute_units {
      set name  [dict get $checker_inst name]
      set slots [dict get $checker_inst ports]
      set cu [get_bd_cells $name]
      if { $slots eq "all" } {
        set accelMasters [get_bd_intf_pins -of_objects $cu -filter {MODE == Master}]
        foreach master $accelMasters {
          lappend checkerList $master
        }
      } else {
        foreach slot $slots {
          set intf_pin [get_bd_intf_pins -of $cu -filter NAME=~$slot]
          #Portnames in kernel.xml are in uppercase while the in the BD 
          #they are in lower case (M_AXI_GMEM vs m_axi_gmem). 
          #So solution is to lowercase the compare if first compare fails
          if {[llength $intf_pin] == 0} {
            set cu_pin_lc [string tolower $slot]
            set intf_pin [get_bd_intf_pins -of $cu -filter NAME=~${cu_pin_lc}]
          }
          lappend checkerList $intf_pin
        }
      }
    }

    puts "PC: Prepared checker list"
    #sanity checks
    set numPorts [llength $checkerList]
    if {$numPorts <= 0 || $numPorts > 63} {
      error "Number of axi protocol checkers requested must be between 1 and 63."
      return
    }
    # Make sure interface pins exist
    set checkerPins {}
    for { set i 0 } { $i < $numPorts } { incr i } {
      set checkerPinName [lindex $checkerList $i]
      if { [get_bd_intf_pins $checkerPinName -quiet] eq "" } {
        error "Unable to find interface pin $checkerPinName for AXI protocol checker insertion"
        return
      }

      lappend checkerPins [get_bd_intf_pins $checkerPinName]
    }

    set liteMaster [get_bd_intf_pins "${interconobj}/${currentMasterName}_AXI"]

    #connect the clk and reset of the new master-interface to the slower mgmt clk  
    #This is not performance efficient, but works better in meeting timing
    connect_bd_net $mgmt_clk [get_clk_from_intf_pin "${interconobj}/${currentMasterName}_AXI"]

    #puts "PC: Connected $mgmt_clk [get_clk_from_intf_pin "${interconobj}/${currentMasterName}_AXI" ]"

    #get_reset_from_intf_pin did not return correct reset
    #set liteMaster_resetpin [get_bd_pins "interconnect_axilite_user/${currentMasterName}_ARESETN"]
    set liteMaster_resetpin [get_reset_from_intf_pin "${interconobj}/${currentMasterName}_AXI"]
    
    connect_bd_net $mgmt_reset [get_bd_pins $liteMaster_resetpin]
    #puts "PC: Connected $mgmt_reset  $liteMaster_resetpin"

    puts "--- DEBUG: Adding Protocol checkers $name - lite master: $liteMaster"
    puts "--- DEBUG:     slots: $slots"
    add_axi_checkers $liteMaster $interconobj $checkerPins $dsa_info
    
    # Create hierarchy
    group_bd_cells Checkers [get_bd_cells xilproto*]
    save_bd_design
    puts "--- DEBUG: Completed adding axi checkers"
  }; # end update_axi_checkers
  
  ################################################################################
  # add_axi_checkers
  #   Description:
  #     Insert axi protocol checkers into IPI diagram to monitor the ports in checkerList
  #     NOTE: this uses the next generation monitor IP
  #   Arguments:
  #     liteMaster            AXI Lite master (BD interface pin)
  #     interconnectAxiLite   AXI Lite interconnect
  #     checkerPins           List of AXI interface ports to monitor
  ################################################################################
  proc add_axi_checkers {liteMaster interconnectAxiLite checkerPins dsa_info} {
    # Constants
    set protoName "xilproto"
    set interconName "xilproto_intercon"

    #
    # Initialization
    #
   
    # Ensure correct number of checker ports
    set numPorts [llength $checkerPins]

    puts "---DEBUG: Adding AXI protocol checkers ..."

    # 
    # Insert cores
    #
    
    # AXI-Protocol Checkers
    puts "--- DEBUG: Inserting AXI-Protocol Checkers: $protoName..."
    for { set i 0 } { $i < $numPorts } { incr i } {
      set currProtoName ${protoName}$i
      set proto_obj [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_protocol_checker:2.0 $currProtoName]

	  #Lightweight
	  set_property -dict [list CONFIG.LIGHT_WEIGHT {1}] [get_bd_cells $currProtoName]
      #enable saxi
      set_property -dict [list CONFIG.ENABLE_CONTROL {1}] $proto_obj
      #These max rd/wr bursts to max (64). Kernels very unlikley to exceed this high value
      set_property -dict [list CONFIG.MAX_RD_BURSTS {64} CONFIG.MAX_WR_BURSTS {64}] [get_bd_cells $currProtoName]
      #set to maximum
	  set_property -dict [list CONFIG.MAX_AW_WAITS {1024} CONFIG.MAX_AR_WAITS {1024} CONFIG.MAX_W_WAITS {1024} CONFIG.MAX_R_WAITS {1024} CONFIG.MAX_B_WAITS {1024}] [get_bd_cells  $currProtoName]
	  set_property -dict [list CONFIG.MAX_CONTINUOUS_WTRANSFERS_WAITS {65536} CONFIG.MAX_WLAST_TO_AWVALID_WAITS {65536} CONFIG.MAX_WRITE_TO_BVALID_WAITS {65536} CONFIG.MAX_CONTINUOUS_RTRANSFERS_WAITS {65536}] [get_bd_cells $currProtoName]
	  
      add_debug_ip LAPC $currProtoName [lindex $checkerPins $i]
    }

    # AXI interconnect
    # NOTE: use v2 AXI interconnect instead of Smart Connect since max # SI or MI = 64
    puts "--- DEBUG: Inserting AXI interconnect: $interconName..."
    set numSlaves 1
    set numMasters $numPorts
    set intercon_obj [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect $interconName]
    #set intercon_obj [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect $interconName]
    set_property CONFIG.NUM_SI $numSlaves $intercon_obj
    set_property CONFIG.NUM_MI $numMasters $intercon_obj

    for { set i 0 } { $i < $numSlaves } { incr i } {
      set axiSlaveRegSlice [expr { ($i >= 10) ? "S${i}_HAS_REGSLICE" : "S0${i}_HAS_REGSLICE" } ]
      set_property CONFIG.$axiSlaveRegSlice 1 $intercon_obj
    }
    for { set i 0 } { $i < $numMasters } { incr i } {
      set axiMasterRegSlice [expr { ($i >= 10) ? "M${i}_HAS_REGSLICE" : "M0${i}_HAS_REGSLICE" } ]
      set_property CONFIG.$axiMasterRegSlice 1 $intercon_obj
    }
    #
    # Connect clocks & resets  
    #
    puts "--- DEBUG: Connecting clocks and resets..."
    
    # Clocks
    for { set i 0 } { $i < $numPorts } { incr i } {
      set currProtoName ${protoName}$i
      set currClock [get_clk_from_intf_pin [lindex $checkerPins $i]]
      
      connect_bd_net [get_bd_pins $currClock] [get_bd_pins $currProtoName/aclk]
    }

    puts "---DEBUG AWS Compatibility: sanity check"
    set dsa_vbnv [dict get $dsa_info dsa_vbnv]
    set dsa_type [lindex [split $dsa_vbnv ":"] 1]
    set dsa_name [lindex [split $dsa_vbnv ":"] 2]
    set version [lindex [split $dsa_vbnv ":"] 3]
    set 201820DSA [expr {([string first "201820" $version] >= 0) ? true : false}]
    set awsDSA [expr {$dsa_type == "aws-vu9p-f1-04261818" ? true : false}]
    set oldDSA [expr {(($version == "5.0") || ($version == "5.1") || $awsDSA) ? true : false}]
    puts "---DEBUG Shell Information: vbnv = $dsa_vbnv, type=$dsa_type, name = $dsa_name, version = $version, old DSA = $oldDSA, 2018.2 DSA = $201820DSA, AWS DSA = $awsDSA"

    set interconnect_axilite_clk [find_bd_objs -relation connected_to -thru_hier [get_bd_pins -quiet $interconnectAxiLite/ACLK]]
    puts "---DEBUG Connecting:  [get_bd_port $interconnect_axilite_clk] [get_bd_pins $interconName/ACLK]"
    # connect_bd_net  [get_bd_port $interconnect_axilite_clk] [get_bd_pins $interconName/ACLK]

    # AWS change
    if { $awsDSA } {
      connect_bd_net [get_bd_pins $interconnectAxiLite/ACLK] [get_bd_pins $interconName/ACLK]
    } else {
      connect_bd_net  [get_bd_port $interconnect_axilite_clk] [get_bd_pins $interconName/ACLK]
    }
    
    for { set i 0 } { $i < $numSlaves } { incr i } {
      set axiClkName [expr { ($i >= 10) ? "S${i}_ACLK" : "S0${i}_ACLK" } ]
      puts "---DEBUG Connecting:  [get_bd_port $interconnect_axilite_clk] [get_bd_pins $interconName/$axiClkName]"
      # connect_bd_net  [get_bd_port $interconnect_axilite_clk] [get_bd_pins $interconName/$axiClkName]

      #AWS change
      if { $awsDSA } {
        connect_bd_net [get_bd_pins $interconnectAxiLite/ACLK] [get_bd_pins $interconName/$axiClkName] 
      } else {
        connect_bd_net  [get_bd_port $interconnect_axilite_clk] [get_bd_pins $interconName/$axiClkName]
      }
    }
    for { set i 0 } { $i < $numMasters } { incr i } {
      set axiClkName [expr { ($i >= 10) ? "M${i}_ACLK" : "M0${i}_ACLK" } ]
      
      set currClock [get_clk_from_intf_pin [lindex $checkerPins $i]]
      connect_bd_net [get_bd_pins $currClock] [get_bd_pins $interconName/$axiClkName]
    }
    
    # Resets
    for { set i 0 } { $i < $numPorts } { incr i } {
      set currProtoName ${protoName}$i
      set currReset [get_reset_from_intf_pin [lindex $checkerPins $i]]
      #puts "PC: CheckerPin [lindex $checkerPins $i] reset is $currReset"
      #puts "PC: Connecting0 [get_bd_pins $currReset] to [get_bd_pins $currProtoName/aresetn]"
      connect_bd_net [get_bd_pins $currReset] [get_bd_pins $currProtoName/aresetn]
    }

    # Interconnect reset
    set interconnect_axilite_reset [find_bd_objs -relation connected_to -thru_hier [get_bd_pins -quiet $interconnectAxiLite/ARESETN]]
    puts "---DEBUG Connecting:  $interconnect_axilite_reset [get_bd_pins $interconName/ARESETN]"
    connect_bd_net $interconnect_axilite_reset [get_bd_pins $interconName/ARESETN]

    for { set i 0 } { $i < $numSlaves } { incr i } {
      set axiRstName [expr { ($i >= 10) ? "S${i}_ARESETN" : "S0${i}_ARESETN" } ]
      puts "---DEBUG Connecting slave reset: $interconnect_axilite_reset to $interconName/$axiRstName"
      connect_bd_net $interconnect_axilite_reset [get_bd_pins $interconName/$axiRstName]
    }
    for { set i 0 } { $i < $numMasters } { incr i } {
      set axiRstName [expr { ($i >= 10) ? "M${i}_ARESETN" : "M0${i}_ARESETN" } ]
      
      set currReset [get_reset_from_intf_pin [lindex $checkerPins $i]]
	  #puts "PC: Connecting3:  [get_bd_pins $currReset] to [get_bd_pins $interconName/$axiRstName]"
      connect_bd_net [get_bd_pins $currReset] [get_bd_pins $interconName/$axiRstName]
    }
    
    # Make Connections
    #
    puts "---DEBUG: Connecting all blocks... "
    
    # Checker ports
    for { set i 0 } { $i < $numPorts } { incr i } {
      set currProtoName ${protoName}$i
      connect_bd_intf_net [get_bd_intf_pins $currProtoName/PC_AXI] [lindex $checkerPins $i]
    }
    
    # Interconnect slaves
    connect_bd_intf_net $liteMaster [get_bd_intf_pins $interconName/S00_AXI]
    
    # Interconnect masters
    for { set i 0 } { $i < $numPorts } { incr i } {
      set currProtoName ${protoName}$i
      set axiMasterName [expr { ($i >= 10) ? "M${i}_AXI" : "M0${i}_AXI" } ]
      connect_bd_intf_net [get_bd_intf_pins $interconName/$axiMasterName] [get_bd_intf_pins $currProtoName/S_AXI]
    }

    puts "  Completed adding AXI checkers at ports: $checkerPins"
  }; # end add_axi_checkers  
################################PC###################################

}; # end namespace


