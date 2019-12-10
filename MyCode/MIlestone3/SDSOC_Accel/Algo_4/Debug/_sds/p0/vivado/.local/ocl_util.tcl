package require math::bignum

namespace eval ocl_util {
  namespace export write_cookie_file_impl report_utilization_impl \
                   report_timing_and_scale_freq  get_achievable_kernel_freq write_new_clk_freq \
                   write_user_impl_clock_constraint

  proc get_script_dir {} [list return [file dirname [info script]]]

  proc dict_get_default {adict key default} {
    if { [dict exists $adict $key] } {
      return [dict get $adict $key]
    }
    return $default
  }

  proc error2file {dir msg {catch_res ""}} {
    global vivado_error_file
    if { $catch_res ne "" } {
      puts "ERROR: caught error: $catch_res"
    }
    # remove the leading "<spaces>ERROR:<spaces>" from msg
    regsub -nocase {^\s*ERROR\s*:*\s*} $msg {} msg
    set fname [file join $dir $vivado_error_file]
    # puts "--- DEBUG: Writing to file $fname: $msg"
    set fh [open $fname w]
    puts $fh $msg
    close $fh
    uplevel 1 error [list $msg]
    #error $msg
  }

  proc warning2file {dir msg } {
    global vivado_warn_file
    puts "$msg"
    # remove the leading "<spaces>WARNING:<spaces>" from msg
    regsub -nocase {^\s*(CRITICAL)?\s*WARNING\s*:\s*} $msg {} msg
    set fname [file join $dir $vivado_warn_file]
    # puts "--- DEBUG: Writing warnings to file $fname: $msg"
    # this file may have multiple warning messages, we should use "append" mode
    set fh [open $fname a+]
    puts $fh $msg
    close $fh
  }

  set System "system"
  set Kernel "kernel"

  # Initialize rule-checker functionality if the environment has been configured for it.
  set drcv_connected false
  if {[info exists ::env(XILINX_RS_PORT)]} {
    if { [catch {
      # Load library (shared/common/services/rulecheck/client/tcl)
      set result [load librdi_drcvtcl[info sharedlibextension]]
      # Connect
      if {$result eq "true"} {
        set result [::drcv::connect]
      }
      # Load rules
      if {$result eq "true"} {
        set platformSeparator ":"
        if {[info exist tcl_platform(platform)] && ($tcl_platform(platform) == "windows")} {
          set platformSeparator ";"
        }
        set rule_part [file join scripts ocl ocl_rules.cfg]
        foreach rdiRoot [split "$::env(RDI_APPROOT)" $platformSeparator] {
          set path_test [file join $rdiRoot $rule_part]
          if {[file exists $path_test]} {
            set rule_path $path_test
            break
          }
        }
        if {$rule_path ne ""} {
          set result [::drcv::load_rule_data_file $rule_path]
          set drcv_connected $result    
        }
      }
    } catch_res] } {
      #TODO: This doesn't appear to work so early in the flow because
      # can't read "vivado_warn_file": no such variable
      #warning2file [pwd] "failed to connect to rulecheck server: $catch_res"
      puts "WARNING: failed to connect to rulecheck server - $catch_res"
    }
  }
  proc is_drcv {} {
    if { $ocl_util::drcv_connected } { return true }
    return false
  }

  # Dummy proc "OPTRACE".  Needs to be created in case the real OPTRACE proc
  # isn't inserted
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }

  # TODO: originally used for non-unified paltform only, might be useful, keep it for now
  proc is_sdaccel_debug {} {
    set is_dbg false
    if { [info exists ::env(SDACCEL_DEBUG)] } {
      set is_dbg [expr bool($::env(SDACCEL_DEBUG))]
    }
    return $is_dbg
  }; # end is_sdaccel_debug


  # added by vamshi, TODO: add comments to explain why this is needed
  proc update_kernel_clocks { kernel_clock_freqs } {
    dict for {kernel_clk dict_clock} $kernel_clock_freqs {
      set kernel_clk_inst [string range $kernel_clk 0 [string last _ $kernel_clk]-1]
      set clk_freq [dict get $dict_clock freq]
      set is_user_set   [dict get $dict_clock is_user_set]

      if { [string equal -nocase $is_user_set "true" ] } {
      set clkFreqHZ [expr {int($clk_freq*1000000)}]
        set_property -dict [list CONFIG.FREQ_HZ $clkFreqHZ] [get_bd_cells $kernel_clk_inst]
      }
    }
  }; # end update_kernel_clocks

  #Procedure to return kernel name for a given run
  proc get_kernel_name_from_run {kernel_run} {
    set cand_fs [get_property srcset $kernel_run]
    if {[get_property fileset_type $cand_fs] != "BlockSrcs"} {return}
    set cand_files [get_files -of_objects $cand_fs -norecurse]
    if {[llength $cand_files] != 1} {return}
    set cand_file [lindex $cand_files 0]
    if {[get_property FILE_TYPE $cand_file] != "IP"} {return}
    set cand_ip [get_ips -all [get_property IP_TOP $cand_file]]
    if {$cand_ip == {}} {return}
    set prop_val [get_property SDX_KERNEL $cand_ip]
    if {[get_property SDX_KERNEL $cand_ip] && [get_property SDX_KERNEL_TYPE $cand_ip] eq "hls"} {
      set fields [split [get_property IPDEF $cand_ip] ":"]
      lassign $fields vender slibrary ipname version
      return $ipname
    }
  }

  # Procedure for tracking report files
  proc log_generated_reports {log_file runs} {
    set failed [catch {
      set generated_reports_fh [open $log_file a]
      puts $generated_reports_fh [join [get_generated_reports $runs] "\n"]
      close $generated_reports_fh
    } _error]
    if { $failed } {
      puts "WARNING: Failed while trying to create a log with all generated reports, error: '${_error}'"
      puts "         The flow will continue, but generated reports may not be listed correctly."
    }
  }

  # Assemble the content of the generated reports log
  proc get_generated_reports {runs} {
    set log_content {}
    foreach run $runs {
      set props [list_property $run STEPS.*.REPORTS]
      foreach prop $props {
        set run_step_reports [get_property $prop $run]
        foreach run_step_report $run_step_reports {
          set report_obj [get_report_configs $run_step_report]
          if { [llength $report_obj] > 0 } {        
            set output_file [get_property OUTPUT_FILE $report_obj]
            # NOTE: report_type has <report_command>:<version>
            set report_type [get_property REPORT_TYPE $report_obj]
            set report_type_list [split ${report_type} ":"]
            set report_command [lindex ${report_type_list} 0]
            set version [lindex ${report_type_list} 1]
            set report_name [get_property NAME $report_obj]
            set kernel_name [get_kernel_name_from_run $run]
            if { $output_file != "" } {
              set file_path [file join [get_property directory $run] $output_file]
              lappend log_content "${report_command}|${version}|${report_name}|${file_path}|${kernel_name}"
            }
          }
        }
      }
    }
    return $log_content
  }

  ################################################################################
  # TODO: single_project_flow_unip
  #   Description: the main tcl entry for hw and hw_emu flow, called by ipirun.tcl 
  #      
  #   Arguments:
  #      dsa_info
  #      config_info 
  #      clk_info
  #      debug_porfile_info
  ################################################################################
  proc single_project_flow_unip {dsa_info config_info clk_info debug_profile_info} {
    set dsa_rebuild_tcl     [dict get $dsa_info dsa_rebuild_tcl] 
    set dsa_platform_state  [dict get $dsa_info dsa_platform_state] 
    set dsa_part            [dict get $dsa_info dsa_part]

    set steps_log           [dict get $config_info steps_log] 
    set output_dir          [dict get $config_info output_dir] 
    set script_only         [dict get $config_info generate_script_only] 
    set return_pre_synth    [dict get $config_info return_pre_synth]
    set return_post_synth   [dict get $config_info return_post_synth]
    set return_pre_impl     [dict get $config_info return_pre_impl]
    set is_hw_emu           [dict get $config_info is_hw_emu] 
    set return_pre_sys_link_tcl [dict get $config_info return_pre_sys_link_tcl]

    set project_name        [dict get $config_info proj_name] 
    if {$is_hw_emu} {
      set project_name      [dict get $config_info emu_proj_name] 
    } else {
      set report_commands_tcl [dict get $config_info report_commands_tcl] 
      set synth_props_tcl     [dict get $config_info synth_props_tcl] 
      set impl_props_tcl      [dict get $config_info impl_props_tcl]
    }

    set cwd [pwd]

    OPTRACE "START" "Create project" 

    # there are two ways of creating project
    #    soc platform: source rebuild.tcl in dsa
    #    pcie platform: create a vivado project and import the dr bd 
    if { [string equal $dsa_platform_state "pre_synth"] } {
      # soc platforms (applicable to both hw and hw_emu flows)
      # note: hw_emu flow is avilable for soc platform, e.g. /proj/testcases/fisusr/sdaccel/sdx_canary_HEAD/sdsoc/cosim_hello_vadd_ocl_102/
      set dsa_prj_dir [file dirname $dsa_rebuild_tcl]
      set ::origin_dir_loc $dsa_prj_dir
      set ::user_project_name $project_name
 
      add_to_steps_log $steps_log "internal step: source $dsa_rebuild_tcl to create $project_name project" [fileName]:[lineNumber [info frame]]
      if { [catch {source $dsa_rebuild_tcl} catch_res] } {
        error2file $output_dir "problem rebuilding project $project_name" $catch_res
      }
    } else {
      # pcie platforms
      if { $is_hw_emu } {
        # hw_emu flow, create the vivado project 
        add_to_steps_log $steps_log "internal step: create_project -part $dsa_part -force $project_name $project_name" [fileName]:[lineNumber [info frame]]
        create_project -part $dsa_part -force $project_name $project_name
      } else {
        # hw flow, create the vivado porject, add the bb_locked dcp to the design, 
        #          create partition def and reconfig module for pcie platform
        create_project_and_init_rm_pcie $dsa_info $config_info
      }
    }
    set_property tool_flow SDx [current_project]

    OPTRACE "END" "Create project"

    # populate dr_bd portion of the design 
    init_dr_bd $dsa_info $config_info $clk_info $debug_profile_info 
    if { $return_pre_sys_link_tcl } {
      return
    }

    # the following is NA for hw_emu flow
    if { $is_hw_emu } {
      return
    }
  
    # source report_commands_tcl file if it exists
    if { ![string equal $report_commands_tcl ""] && [file exists $report_commands_tcl] } {
      OPTRACE "START" "Source report_commands_tcl" 
      add_to_steps_log $steps_log "internal step: source $report_commands_tcl" [fileName]:[lineNumber [info frame]]
      source $report_commands_tcl
      OPTRACE "END" "Source report_commands_tcl" 
    }

    # source synth_props_tcl file if it exists
    if { ![string equal $synth_props_tcl ""] && [file exists $synth_props_tcl] } {
      OPTRACE "START" "Source synth_props_tcl" 
      add_to_steps_log $steps_log "internal step: source $synth_props_tcl" [fileName]:[lineNumber [info frame]]
      source $synth_props_tcl
      OPTRACE "END" "Source synth_props_tcl" 
    }

    # post project conguration for pcie platform, add impl xdc, don't partition, create pr configuration, etc.  
    if { ![string equal $dsa_platform_state "pre_synth"] } {
      post_config_pcie $dsa_info $config_info
    }

    add_to_steps_log $steps_log "internal step: source $impl_props_tcl" [fileName]:[lineNumber [info frame]]
    OPTRACE "START" "Source impl_props_tcl" 
    source $impl_props_tcl
    OPTRACE "END" "Source impl_props_tcl" 

    # delay the report_timing and frequency scaling until the end of implementation steps just before bitstream (CR 992243)
    set is_physopt_enabled [get_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED [get_runs impl_1]] 
    write_report_timing_and_scale_freq $dsa_info $config_info $clk_info $is_physopt_enabled
    
    if { $return_pre_synth } {
      puts "INFO: return_pre_synth enabled, skip the synthesis and implementation"
      return
    }

   if { $script_only } {
      add_to_steps_log $steps_log "internal step: creating run script map file" [fileName]:[lineNumber [info frame]]
      launch_runs impl_1 -to_step write_bitstream -scripts_only
      create_run_script_map_file "synth" $output_dir
      create_run_script_map_file "impl" $output_dir
      return
    }

    run_synthesis $dsa_info $config_info

    # implementation
    if { $return_post_synth || $return_pre_impl } {
      puts "INFO: return_pre_impl or return_post_synth enabled, skip running implementation"
      return
    }

    run_implementation $dsa_info $config_info
  }; # end single_project_flow_unip

  # utility funciton called by single_project_flow_unip
  ################################################################################
  # TODO: create_project_and_init_rm_pcie
  #   Description:
  #      
  #   Arguments:
  #      dsa_info
  #      config_info 
  ################################################################################
  proc create_project_and_init_rm_pcie {dsa_info config_info} {
    set dsa_dr_bd           [dict get $dsa_info dsa_dr_bd] 
    set dsa_part            [dict get $dsa_info dsa_part]
    set bb_locked_dcp       [dict get $dsa_info bb_locked_dcp]
    set uses_pr_shell_dcp   [dict get $dsa_info dsa_uses_pr_shell_dcp]
    set link_output_format  [dict get $dsa_info link_output_format]
    set pr_shell_dcp        [dict get $dsa_info dsa_pr_shell_dcp]

    set project_name        [dict get $config_info proj_name] 
    set steps_log           [dict get $config_info steps_log] 
    set partition_def       [dict get $config_info partition_def]
    set reconfig_module     [dict get $config_info reconfig_module]

    # -- Create the project --
    add_to_steps_log $steps_log "internal step: create_project -part $dsa_part -force $project_name $project_name" [fileName]:[lineNumber [info frame]]
    create_project -part $dsa_part -force $project_name $project_name
    puts "INFO: \[OCL_UTIL\] set_property design_mode GateLvl \[current_fileset\]"
    set_property design_mode GateLvl [current_fileset]
    puts "INFO: \[OCL_UTIL\] set_property PR_FLOW 1 \[current_project\]"
    set_property PR_FLOW 1 [current_project]

    # Memory initialization isn't support, speed up flow by disabling creation
    # of the BMM / MMI file.
    set_property mem.enable_memory_map_generation 0 [current_project]

    # support bb_locked dcp (enhanced link_design pr flow)
    # bb_locked dcp should always be there for unified platforms since 2018.1
    # abstract shell dcp in 2018.2 only supports FaaS
    # if AcceleratorBinaryContent is set to "bitstream", we should use bb_locked dcp
    # if AcceleratorBinaryContent is set to "dcp", abstract shell dcp should take precedence
    # necessary error check has already been done in xocc frontend, we can only consider the valid usecase here
    if { $bb_locked_dcp ne "" || $uses_pr_shell_dcp} {
      if { [string equal $link_output_format "bitstream"] } {  
        set dsa_dcp $bb_locked_dcp
      } else {
        set dsa_dcp [expr { $uses_pr_shell_dcp ? $pr_shell_dcp : $bb_locked_dcp} ] 
      }

      add_to_steps_log $steps_log "internal step: add_files $dsa_dcp" [fileName]:[lineNumber [info frame]]
      add_files $dsa_dcp

      # -- Create the partion and rm that will contain the bd
      # use dr_bd base name as the dr top
      set dr_top [file rootname [file tail $dsa_dr_bd]]
      add_to_steps_log $steps_log "internal step: create_partition_def -name $partition_def -module $dr_top" [fileName]:[lineNumber [info frame]]
      create_partition_def -name $partition_def -module $dr_top
      add_to_steps_log $steps_log "internal step: create_reconfig_module -name $reconfig_module -partition_def \[get_partition_defs $partition_def \] -top $dr_top" [fileName]:[lineNumber [info frame]]
      create_reconfig_module -name $reconfig_module -partition_def [get_partition_defs $partition_def ] -top $dr_top
      add_to_steps_log $steps_log "internal step: set_property use_blackbox_stub false \[get_filesets $reconfig_module -of_objects \[get_reconfig_modules $reconfig_module\]\]" [fileName]:[lineNumber [info frame]]
      set_property use_blackbox_stub false [get_filesets $reconfig_module -of_objects [get_reconfig_modules $reconfig_module]]
      add_to_steps_log $steps_log "internal step: set_property USE_BLACKBOX_STUB 0 \[get_partition_defs $partition_def\]" [fileName]:[lineNumber [info frame]]
      set_property USE_BLACKBOX_STUB 0 [get_partition_defs $partition_def]
    }
  }

  # utility funciton called by single_project_flow_unip
  ################################################################################
  # TODO: post_configue_pcie
  #   Description:
  #      
  #   Arguments:
  #      dsa_info
  #      config_info 
  ################################################################################
  proc post_config_pcie {dsa_info config_info} {
    set ocl_inst_path       [dict get $dsa_info ocl_region]
    set impl_xdc            [dict get $dsa_info impl_xdc] 

    set steps_log           [dict get $config_info steps_log] 
    set output_dir          [dict get $config_info output_dir] 
    set enable_dont_partition  [dict get $config_info enable_dont_partition]
    set reconfig_module     [dict get $config_info reconfig_module]

    # impl_constrs support
    add_xdc_files $impl_xdc $steps_log
  
    # read the _post_sys_link_gen_constrs.xdc generated by sourcing post_sys_link_tcl
    set post_sys_link_gen_xdc "_post_sys_link_gen_constrs.xdc"
    if { [file exists $post_sys_link_gen_xdc] } {
      add_to_steps_log $steps_log "internal step: add_files $post_sys_link_gen_xdc" [fileName]:[lineNumber [info frame]]
      add_files $post_sys_link_gen_xdc
    }
  
    # when executed in the non-design environment, read_xdc is same as add_files
    apply_dont_partition $enable_dont_partition $steps_log $output_dir
        
    # -- Create the PR configuration alone with data on where the BD will go --
    set config_name "config_1"
    add_to_steps_log $steps_log "internal step: create_pr_configuration -name $config_name -partitions \[list $ocl_inst_path:$reconfig_module\]" [fileName]:[lineNumber [info frame]]
    create_pr_configuration -name $config_name -partitions [list $ocl_inst_path:$reconfig_module]
    # disable the generation of the cell level checkpoints for RMs during post bitstream 
    set_property AUTO_IMPORT 0 [get_pr_configuration $config_name]
    # disable the generation of wrapper black box checkpoint during post bitstream
    set_property USE_BLACKBOX 0 [get_pr_configuration $config_name]
    # add_to_steps_log $steps_log "internal step: set_property PR_CONFIGURATION $config_name \[get_runs impl_1\]" [fileName]:[lineNumber [info frame]]
    puts "INFO: \[OCL_UTIL\] set_property PR_CONFIGURATION $config_name \[get_runs impl_1\]"
    set_property PR_CONFIGURATION $config_name [get_runs impl_1]
  }

  # utility funciton called by single_project_flow_unip
  ################################################################################
  # TODO: run_synthesis
  #   Description:
  #      
  #   Arguments:
  #      dsa_info
  #      config_info 
  ################################################################################
  proc run_synthesis {dsa_info config_info} {
    set dsa_platform_state  [dict get $dsa_info dsa_platform_state] 
 
    set steps_log           [dict get $config_info steps_log] 
    set output_dir          [dict get $config_info output_dir] 
    set run_script_map_file [dict get $config_info run_script_map_file] 
    set num_jobs            [dict get $config_info num_jobs] 
    set lsf_string          [dict get $config_info lsf_string] 
    set reconfig_module     [dict get $config_info reconfig_module]

    # synthesis
    if { [string equal $dsa_platform_state "pre_synth"] } {
      set syn_run_name "synth_1"
    } else {
      set syn_run_name "${reconfig_module}_synth_1"
    }

    # this is the request from Sudipto to address a runtime/memory issue in SDx 2017.4
    # synthesis itself seems to be doing more aggressive parallelization by launching multiple parallel_synth 
    # helper processes for each of the OOC runs, set this param to reduce the cpu and memory usage
    set_param general.maxThreads 1

    set user_run_script_switch ""
    if { ![string equal $run_script_map_file ""] } {
      set user_run_script_switch "-custom_script $run_script_map_file"
    }

    set lsf_switch ""
    if { ![string equal $lsf_string ""] } {
      set lsf_switch "-lsf $lsf_string"
    }

    #
    # by default, num_jobs is 0
    add_to_steps_log $steps_log "internal step: launch_runs $syn_run_name -jobs $num_jobs $lsf_switch $user_run_script_switch" [fileName]:[lineNumber [info frame]]
    # The existence of this file while synthesis is running tells
    # HPIKernelCompilerSystemFpga::printStatus_ to produce regular
    # "heartbeat" messages.
    close [open __xocc_running_synthesis__ w]
    OPTRACE "START" "Synthesis" "SYNTH,ROLLUP_1"
    launch_runs $syn_run_name -jobs $num_jobs {*}$lsf_switch {*}$user_run_script_switch
    wait_on_run $syn_run_name
    OPTRACE "END" "Synthesis" 
    file delete __xocc_running_synthesis__

    # unset maxThreads parameter
    reset_param general.maxThreads

    # generate a resource demand report per ip instance
    generate_resource_report $output_dir $steps_log

    # capture synth reports
    set generated_reports_log [file join $output_dir "generated_reports.log"]
    set report_synth_runs [get_runs -filter {IS_SYNTHESIS==1}]
    add_to_steps_log $steps_log "internal step: log_generated_reports for synthesis '${generated_reports_log}'" [fileName]:[lineNumber [info frame]]
    log_generated_reports $generated_reports_log $report_synth_runs

    set err_str ""
    if { ![check_synth_runs_status $steps_log err_str] } {
      error2file $output_dir "One or more synthesis runs failed during dynamic region dcp generation $err_str"
    } 
  }

  # utility funciton called by single_project_flow_unip
  ################################################################################
  # TODO: run_implementation
  #   Description:
  #      
  #   Arguments:
  #      dsa_info
  #      config_info 
  ################################################################################
  proc run_implementation {dsa_info config_info} {
    set link_output_format  [dict get $dsa_info link_output_format]
    set dsa_uses_pr         [dict get $dsa_info dsa_uses_pr]

    set steps_log           [dict get $config_info steps_log] 
    set output_dir          [dict get $config_info output_dir] 
    set run_script_map_file [dict get $config_info run_script_map_file] 
    set out_partial_bit     [dict get $config_info out_partial_bitstream]
    set out_partial_clear_bit  [dict get $config_info out_partial_clear_bit]
    set out_full_bit        [dict get $config_info out_full_bitstream]
    set encrypt_impl_dcp    [dict get $config_info encrypt_impl_dcp]
    set clbinary_name       [dict get $config_info clbinary_name]

    set_property GEN_FULL_BITSTREAM 0 [get_runs impl_1]
    set to_step_switch "-to_step write_bitstream"
    if { [string equal $link_output_format "dcp"] } {
      set to_step_switch ""
    }

    set user_run_script_switch ""
    if { ![string equal $run_script_map_file ""] } {
      set user_run_script_switch "-custom_script $run_script_map_file"
    }

    add_to_steps_log $steps_log "internal step: launch_runs impl_1 $to_step_switch $user_run_script_switch" [fileName]:[lineNumber [info frame]]
    launch_runs impl_1 {*}$to_step_switch {*}$user_run_script_switch
    set run_dir [get_property DIRECTORY [get_runs impl_1]]
    # Note: when run fails, wait_on_run may not raise an error
    if { [catch {wait_on_run impl_1} catch_res] } {
      add_to_steps_log $steps_log "status: fail" [fileName]:[lineNumber [info frame]]
      add_to_steps_log $steps_log "log: $run_dir/runme.log" [fileName]:[lineNumber [info frame]]
      error2file $output_dir "problem implementing dynamic region, please look at the run log file '$run_dir/runme.log' for more information" $catch_res
    }

    # capture impl reports
    set generated_reports_log [file join $output_dir "generated_reports.log"]
    set report_impl_runs [get_runs -filter {IS_IMPLEMENTATION==1}]
    add_to_steps_log $steps_log "internal step: log_generated_reports for implementation '${generated_reports_log}'" [fileName]:[lineNumber [info frame]]
    log_generated_reports $generated_reports_log $report_impl_runs

    set run_status [get_property STATUS [get_runs impl_1]]
    # puts "--- DEBUG: run_status is $run_status"
    if { [string match "*ERROR" $run_status] } {
      add_to_steps_log $steps_log "status: fail ($run_status)" [fileName]:[lineNumber [info frame]]
      add_to_steps_log $steps_log "log: $run_dir/runme.log" [fileName]:[lineNumber [info frame]]
      error2file $output_dir "problem implementing dynamic region, $run_status, please look at the run log file '$run_dir/runme.log' for more information" 
    }

    # aws dcp support
    # copy the post-route dcp to vivado output directory
    if { [string equal $link_output_format "dcp"] } {
      if { $encrypt_impl_dcp} {
        set routed_dcp [glob -nocomplain "$run_dir/encrypted_routed.dcp"]
      } else {
        set routed_dcp [glob -nocomplain "$run_dir/*_routed.dcp"]
      }
      set out_routed_dcp "$output_dir/routed.dcp"
      if { ![string equal $routed_dcp ""] } {
        file copy -force $routed_dcp $out_routed_dcp
      }
    } else {
      # copy the generated bit files to vivado output dir 
      if { $dsa_uses_pr } {
        # there could be one partial bit and one partial clear bit files.
        # kcu1500 generates both bit files while vcu1525 only generats the partial bit file
        set partial_bit [glob -nocomplain "$run_dir/*_partial.bit"]
        set partial_clear_bit [glob -nocomplain "$run_dir/*_partial_clear.bit"]
        # puts "--- DEBUG: partial_bit is $partial_bit"
        # puts "--- DEBUG: partial_clear_bit is $partial_clear_bit"
  
        if { ![string equal $partial_bit ""] && [file exists $partial_bit] } {
          file copy -force $partial_bit $out_partial_bit
        }
        if { ![string equal $partial_clear_bit ""] && [file exists $partial_clear_bit] } {
          file copy -force $partial_clear_bit $out_partial_clear_bit
        }

      } else {
        # flat flow (i.e. zynq)
        set full_bit [glob -nocomplain "$run_dir/*.bit"]
        if { ![string equal $full_bit ""] && [file exists $full_bit] } {
          file copy -force $full_bit $out_full_bit
        }
      }
    }

    # Copy LTX files up to ipi dir
    # CR 1011484: copy *just* debug_nets.ltx and rename it to <binary>.ltx
    # set ltx_files [glob -nocomplain "$run_dir/*.ltx"]
    # if {[llength $ltx_files] > 0} {
    #   foreach ltx_file $ltx_files {
    #     if {[file tail $ltx_file] ne "debug_nets.ltx"} {
    #       catch {file copy -force $ltx_file $output_dir}
    #     }
    #   }
    # }
    set ltx_file [glob -nocomplain "$run_dir/debug_nets.ltx"]
    if {$ltx_file ne ""} {
       set out_ltx_file "$clbinary_name.ltx"
       catch {file copy -force $ltx_file $output_dir/$out_ltx_file}
    }
  }

  ################################################################################
  # TODO: init_dr_bd
  #   Description: utility tcl proc called by single_project_flow_unip for both hw and hw_emu flows
  #      
  #   Arguments:
  #      dsa_info
  #      config_info 
  #      clk_info
  #      debug_profile_info
  ################################################################################
  proc init_dr_bd {dsa_info config_info clk_info debug_profile_info} {
    OPTRACE "START" "Front end project & BD setup" "ROLLUP_1,PROJECT"
    set dsa_rebuild_tcl     [dict get $dsa_info dsa_rebuild_tcl] 
    set pre_sys_link_tcl    [dict get $dsa_info pre_sys_link_tcl] 
    set dsa_platform_state  [dict get $dsa_info dsa_platform_state] 
    set dsa_part            [dict get $dsa_info dsa_part]

    set webtalk_flag        [dict get $config_info webtalk_flag] 
    set is_hw_emu           [dict get $config_info is_hw_emu] 
    set design_name         [dict get $config_info design_name]
    set steps_log           [dict get $config_info steps_log] 
    set output_dir          [dict get $config_info output_dir] 
    set return_pre_sys_link_tcl [dict get $config_info return_pre_sys_link_tcl]

    set kernel_clock_freqs  [dict get $clk_info kernel_clock_freqs]  

    set cwd [pwd]

    # pre_sys_link_tcl must be sourced before importing bd (pcie platform only)
    # http://jira.xilinx.com/browse/CR-1009391
    # Ben: The error occurs during generation, but the root problem occurs if that parameter has not been set 
    # before the IP catalog is loaded. Anything that triggers interaction with IP will cause an catalog load.  
    if { ![string equal $dsa_platform_state "pre_synth"] } {
      if { ![string equal $pre_sys_link_tcl ""] && [file exists $pre_sys_link_tcl] } {
        OPTRACE "START" "Source pre_sys_link Tcl script" 
        global env
        add_to_steps_log $steps_log "internal step: source $pre_sys_link_tcl" [fileName]:[lineNumber [info frame]]
        source $pre_sys_link_tcl
        OPTRACE "END" "Source pre_sys_link Tcl script"
      }
    }

    # set the board repo, part and connections for pcie platform
    if { ![string equal $dsa_platform_state "pre_synth"] } {
      set_board_part_repo_and_connections $dsa_info $config_info
    }

    set_ip_repo_and_caching $dsa_info $config_info

    import_bd_and_apply_dr_bd_tcl $dsa_info $config_info $clk_info bd_file
    if { $return_pre_sys_link_tcl } {
      return
    }

    add_to_steps_log $steps_log "internal step: inserting profiling and debug cores" [fileName]:[lineNumber [info frame]]
    insert_debug_profile_support $dsa_info $config_info $debug_profile_info

    OPTRACE "START" "IPI address assignments" 

    # this is needed to generate address_map.xml
    add_to_steps_log $steps_log "internal step: assign_bd_address" [fileName]:[lineNumber [info frame]]
    assign_bd_address

    OPTRACE "END" "IPI address assignments"

    # post_sys_link tcl scripts can potentially add more things to BD, in which case, the script
    # developer should do the assign bd address for those additional things
    source_post_sys_link_tcls $dsa_info $config_info

    # metadata for webtalk
    if { $webtalk_flag ne "" } { 
      add_to_steps_log $steps_log "internal step: bd::util_cmd set_bd_source $webtalk_flag \[current_bd_design\]" [fileName]:[lineNumber [info frame]]
      regenerate_bd_layout
      bd::util_cmd set_bd_source $webtalk_flag [current_bd_design]
    }

    OPTRACE "START" "Save BD" 
    add_to_steps_log $steps_log "internal step: save_bd_design" [fileName]:[lineNumber [info frame]]
    save_bd_design
    OPTRACE "END" "Save BD" 

    OPTRACE "START" "Create address map and debug IP profile files" 

    # generate address_map.tcl
    add_to_steps_log $steps_log "internal step: writing address_map.xml" [fileName]:[lineNumber [info frame]]
    write_address_map $output_dir

    # generate debug/profile IP file
    # this depends on assign_bd_address, so it has to be called after
    add_to_steps_log $steps_log "internal step: writing debug ip layout" [fileName]:[lineNumber [info frame]]
    write_debug_ip_unip $output_dir

    OPTRACE "END" "Create address map and debug IP profile files"
    OPTRACE "START" "Generate output products" 

    if { $is_hw_emu } {
      set_param ips.enableSVCosim 1
      set_param project.allowSharedLibraryType 1
      set_param project.copyShLibsToCurrRunDir 1
      set_param bd.generateHybridSystemC true
    }

    # generate_target is required for write_hwdef
    add_to_steps_log $steps_log "internal step: generate_target all \[get_files $bd_file\]" [fileName]:[lineNumber [info frame]]
    generate_target all [get_files $bd_file]

    # for ip early cache check (if an ip is already generated, this prevents an occ run to be created for that ip)
    ip_cache_export_and_report $config_info $bd_file

    if { [string equal $dsa_platform_state "pre_synth"] } {
      # for SoC platform, create hdf file
      add_to_steps_log $steps_log "internal step: write_hwdef -force -file $output_dir/system.hdf" [fileName]:[lineNumber [info frame]]
      write_hwdef -force -file $output_dir/system.hdf

      # for SoC platform, let's create the wrapper
      add_to_steps_log $steps_log "internal step: add_files -norecurse \[make_wrapper -top -files \[get_files $bd_file\]\]" [fileName]:[lineNumber [info frame]]
      add_files -norecurse [make_wrapper -top -files [get_files $bd_file]]
      # for SoC unified platform, skip setting -mode out_of_context because it IS the full design
    } 

    copy_ooc_xdc_files $bd_file $kernel_clock_freqs $config_info

    if { $is_hw_emu } {
      # set new_clk_freq_file "_new_clk_freq"
      set new_clk_freq_file "$output_dir/_new_clk_freq"
      write_orig_clk_freq $new_clk_freq_file $design_name $clk_info err_str
    }

    OPTRACE "END" "Generate output products"

    OPTRACE "END" "Front end project & BD setup"
    # for testing only
    # error2file $output_dir "problem initialize syn project" 
  }; # end init_dr_bd

  # utility funciton called by init_dr_bd
  ################################################################################
  # TODO: set_board_part_repo_and_connections
  #   Description:
  #      
  #   Arguments:
  #      config_info 
  #      bd_file is an output argument
  #
  #   Reference: http://confluence.xilinx.com/display/XSW/Support+Board+DIMM+Modeling+-+Framework+Spec
  ################################################################################
  proc set_board_part_repo_and_connections {dsa_info config_info} {
    set dsa_board_repo      [dict get $dsa_info dsa_board_repo] 
    set dsa_board_part      [dict get $dsa_info dsa_board_part] 
    set dsa_bconn_locked    [dict get $dsa_info dsa_bconn_locked]
    set dsa_bconn_unlocked  [dict get $dsa_info dsa_bconn_unlocked]
   
    set user_board_repo     [dict get $config_info user_board_repo]
    set user_bconn          [dict get $config_info user_bconn]

    # set a board_part_repo_paths property on current project. $user has higher priority than $dsa (first one wins)
    # set_board_repo_paths_property $user_board_repo $dsa_board_repo
    set board_repo [list]
    if { $user_board_repo ne "" } {
      lappend board_repo {*}$user_board_repo
    }
    if { $dsa_board_repo ne "" } {
      lappend board_repo {*}$dsa_board_repo
    }
    if { $board_repo ne "" } {
      puts "INFO: \[OCL_UTIL\] set_property board_part_repo_paths $board_repo \[current_project\]"
      set_property board_part_repo_paths $board_repo [current_project]
    } 

    # set the board part
    if {$dsa_board_part ne ""} {
      puts "INFO: \[OCL_UTIL\] set_property board_part $dsa_board_part \[current_project\]"
      set_property board_part $dsa_board_part [current_project]
    }
 
    # set a board_connections property on current project. $user has higher priority than $dsa_unlocked. $dsa_locked cannot be overwritten (last one wins) 
    # set_board_connections_property $dsa_bconn_unlocked $user_bconn $dsa_bconn_locked
    set board_connections [list]
    if { $dsa_bconn_unlocked ne "" } {
      lappend board_connections {*}$dsa_bconn_unlocked
    }
    if { $user_bconn ne "" } {
      lappend board_connections {*}$user_bconn
    }
    if { $dsa_bconn_locked ne "" } {
      lappend board_connections {*}$dsa_bconn_locked
    }
    if { $board_connections ne "" } {
      puts "INFO: \[OCL_UTIL\] set_property board_connections $board_connections \[current_project\]"
      set_property board_connections $board_connections [current_project]
    }

  }

  # utility funciton called by init_dr_bd
  ################################################################################
  # TODO: import_bd_and_apply_dr_bd_tcl
  #   Description:
  #      
  #   Arguments:
  #      config_info 
  #      bd_file is an output argument
  ################################################################################
  proc import_bd_and_apply_dr_bd_tcl {dsa_info config_info clk_info bd_file} {
    set dsa_dr_bd           [dict get $dsa_info dsa_dr_bd] 
    set dr_bd_name          [dict get $dsa_info dr_bd_name] 
    set dsa_platform_state  [dict get $dsa_info dsa_platform_state] 
    set synth_xdc           [dict get $dsa_info synth_xdc] 
    set pre_sys_link_tcl    [dict get $dsa_info pre_sys_link_tcl] 
    set user_pre_sys_link_tcl   [dict get $dsa_info user_pre_sys_link_tcl] 

    set dr_bd_tcl           [dict get $config_info dr_bd_tcl] 
    set is_hw_emu           [dict get $config_info is_hw_emu] 
    set steps_log           [dict get $config_info steps_log] 
    set output_dir          [dict get $config_info output_dir] 
    set reconfig_module     [dict get $config_info reconfig_module]
    set return_pre_sys_link_tcl [dict get $config_info return_pre_sys_link_tcl]

    set kernel_clock_freqs  [dict get $clk_info kernel_clock_freqs]  

    upvar $bd_file _bd_file

#    # pre_sys_link_tcl must be sourced before importing the bd (pcie platform only)
#    # this should be a good place, but needs thorough testing (espeically raptor)
#    if { ![string equal $dsa_platform_state "pre_synth"] } {
#      OPTRACE "START" "Source pre_sys_link Tcl script" 
#      global env
#      add_to_steps_log $steps_log "internal step: source $pre_sys_link_tcl" [fileName]:[lineNumber [info frame]]
#      source $pre_sys_link_tcl
#      OPTRACE "END" "Source pre_sys_link Tcl script"
#    }

    OPTRACE "START" "Import / add dynamic bd" 

    # import dr_bd from dsa for pcie platforms
    # for soc platforms, the dr_bd is imported to the project as part of sourcing rebuild.tcl
    if { ![string equal $dsa_platform_state "pre_synth"] } {
      set rm_switch ""
      if { !$is_hw_emu} {
        # hw flow only 
        set rm_switch "-of_objects [get_reconfig_modules $reconfig_module]"
      }
      add_to_steps_log $steps_log "internal step: import_files -norecurse $dsa_dr_bd $rm_switch" [fileName]:[lineNumber [info frame]]
      # we should use import_files to copy the bd file to the local project
      # 1. the temporaray location might be read-only 2. user could potentially delete the temporary location
      import_files -norecurse $dsa_dr_bd {*}$rm_switch
    }

    # Starting 2018.3 DSA captures the dr_bd name (the bd file name)
    if {$dr_bd_name ne "" && !$is_hw_emu} {
      # dr_bd_name is not applicable to hw_emu.
      # for hw_emu, the bd file is always determined by $dsa_dr_bd
      set _bd_file $dr_bd_name
    } else {
      # get the base file name of $dsa_dr_bd (for pcie platforms)
      set _bd_file [file tail $dsa_dr_bd]
      # for soc platform, there is no dr_bd file captured in dsa
      # we assume there is only bd in the project after sourcing rebuild.tcl
      if { [string equal $dsa_platform_state "pre_synth"] } {
        set _bd_file [file tail [lindex [get_files *.bd] 0]]
      }
    }

    set_property synth_checkpoint_mode Hierarchical [get_files $_bd_file]
    OPTRACE "END" "Import / add dynamic bd"
    OPTRACE "START" "Open bd and insert kernels" 

    add_to_steps_log $steps_log "internal step: open_bd_design -auto_upgrade \[get_files $_bd_file\]" [fileName]:[lineNumber [info frame]]
    # open the BD design first, then upgrade IPs to newest version if have new version.
    open_bd_design -auto_upgrade [get_files $_bd_file]
    
    if { ![string equal $user_pre_sys_link_tcl ""] && [file exists $user_pre_sys_link_tcl] } {
      OPTRACE "START" "Sourcing user pre_sys_link Tcl script" 
      add_to_steps_log $steps_log "internal step: source $user_pre_sys_link_tcl" [fileName]:[lineNumber [info frame]]
      source $user_pre_sys_link_tcl
      OPTRACE "END" "Sourcing user pre_sys_link Tcl script"
    }

    if { $return_pre_sys_link_tcl } {
      puts "INFO: return_pre_sys_link_tcl enabled, skip sourcing $dr_bd_tcl and everything after"
      return
    }

    # note: dr_bd_tcl is generated by system linker
    add_to_steps_log $steps_log "internal step: source $dr_bd_tcl" [fileName]:[lineNumber [info frame]]
    source $dr_bd_tcl

    add_to_steps_log $steps_log "internal step: save_bd_design" [fileName]:[lineNumber [info frame]]
    save_bd_design

    # synth_constrs support
    add_xdc_files $synth_xdc $steps_log

    #update kernel frequencies provided using --kernel_frequency
    if { $is_hw_emu } {
      add_to_steps_log $steps_log "internal step: updating kernel clocks" [fileName]:[lineNumber [info frame]]
      if { [catch {update_kernel_clocks $kernel_clock_freqs } catch_res] } {
        error2file $output_dir "Could not change the kernel frequencies provided using --kernel_frequency" $catch_res
      }
    }
    
    OPTRACE "END" "Open bd and insert kernels"
  }


  # utility funciton called by init_dr_bd
  ################################################################################
  # TODO: source_post_sys_link_tcls
  #   Description:
  #      
  #   Arguments:
  #      config_info 
  ################################################################################
  proc source_post_sys_link_tcls {dsa_info config_info} {
    set post_sys_link_tcl   [dict get $dsa_info post_sys_link_tcl] 
    set user_post_sys_link_tcl [dict get $dsa_info user_post_sys_link_tcl] 

    set steps_log           [dict get $config_info steps_log] 
    set output_dir          [dict get $config_info output_dir] 

    # post_sys_link_tcl needs to be sourced after sourcing dr_bd_tcl
    if { ![string equal $post_sys_link_tcl ""] && [file exists $post_sys_link_tcl] } {
      OPTRACE "START" "Sourcing DSA post_sys_link Tcl script" 
      add_to_steps_log $steps_log "internal step: source $post_sys_link_tcl" [fileName]:[lineNumber [info frame]]
      source $post_sys_link_tcl
      # this generates a xdc file _post_sys_link_gen_constrs.xdc

      # bd validation is not needed here. sourcing a post-sys-link tcl hook *could* change the bd, in 
      # which case, it is dsa developer's responsibility to call validation in that tcl hook

      set post_sys_link_gen_xdc "_post_sys_link_gen_constrs.xdc"
      if { ![file exists $post_sys_link_gen_xdc] } {
        puts "WARNING: the output of $post_sys_link_gen_xdc doesn't exist - $post_sys_link_gen_xdc"
      } else {
        # move the file to output_dir
        if { ![file exists $output_dir/$post_sys_link_gen_xdc] } {
          file rename $post_sys_link_gen_xdc $output_dir
        }
      }
      OPTRACE "END" "Sourcing DSA post_sys_link Tcl script"
    }

    if { ![string equal $user_post_sys_link_tcl ""] && [file exists $user_post_sys_link_tcl] } {
      OPTRACE "START" "Validate BD" 
      add_to_steps_log $steps_log "internal step: validate_bd_design -force" [fileName]:[lineNumber [info frame]]
      validate_bd_design -force
      OPTRACE "END" "Validate BD" 

      OPTRACE "START" "Sourcing user post_sys_link Tcl script" 
      add_to_steps_log $steps_log "internal step: source $user_post_sys_link_tcl" [fileName]:[lineNumber [info frame]]
      source $user_post_sys_link_tcl
      OPTRACE "END" "Sourcing user post_sys_link Tcl script"
    }
  }

  # utility funciton called by init_dr_bd
  ################################################################################
  # TODO: ip_cache_export_and_report
  #   Description:
  #      
  #   Arguments:
  #      config_info 
  ################################################################################
  proc ip_cache_export_and_report {config_info bd_file} {
    set no_ip_cache         [dict get $config_info no_ip_cache] 
    set ip_cache_report     [dict_get_default $config_info ip_cache_report {}]
    set steps_log           [dict get $config_info steps_log] 

    # ip early cache check (if an ip is already generated, this prevents an occ run to be created for that ip)
    if { !$no_ip_cache } { 
      add_to_steps_log $steps_log "internal step: config_ip_cache -export \[get_ips -all -of_object \[get_files $bd_file\]\]" [fileName]:[lineNumber [info frame]]
      catch {config_ip_cache -export [get_ips -all -of_object [get_files $bd_file]]}

      if { $ip_cache_report ne "" } {
        # Create a single file with all the information correctly formatted as JSON.
        # It would be nice to just have the ::debug::debug_cache_miss build the file,
        # but it only takes one IP at a time. And just appending to a file doesn't add
        # the JSON open and close braces, and separator commas needed. JSON is nice,
        # but not entirely flexible in its application. And this is probably slightly
        # more efficient since we aren't opening and closing the file repeatedly.
        set report_file [open $ip_cache_report "w"]
        puts $report_file "{ \"ips\": \["
        set first_entry true
        foreach file [get_files *.xci] { 
          if {$first_entry} {
            set first_entry false
          } else { 
            puts $report_file ","
          }
          set json_entry [::debug::debug_cache_miss $file -json]
          puts -nonewline $report_file $json_entry
        }
        puts $report_file ""
        puts $report_file "\] }"
      }
    }
  }

  # utility funciton called by init_dr_bd
  ################################################################################
  # TODO: set_ip_repo_and_caching
  #   Description:
  #      
  #   Arguments:
  #      config_info 
  ################################################################################
  proc set_ip_repo_and_caching {dsa_info config_info} {
    set dsa_ip_repo         [dict get $dsa_info dsa_ip_repo] 
    set dsa_ip_cache        [dict get $dsa_info dsa_ip_cache] 

    set is_hw_emu           [dict get $config_info is_hw_emu] 
    set user_ip_repo        [dict get $config_info user_ip_repo] 
    set emu_user_ip_repo    [dict get $config_info emu_user_ip_repo] 
    set kernel_ip_dirs      [dict get $config_info kernel_ip_dirs] 
    set install_ip_cache    [dict get $config_info install_ip_cache] 
    set remote_ip_cache     [dict get $config_info remote_ip_cache] 
    set no_ip_cache         [dict get $config_info no_ip_cache] 
    set no_dsa_ip_cache     [dict get $config_info no_dsa_ip_cache] 
    set no_install_ip_cache [dict get $config_info no_install_ip_cache] 
    set ip_cache_report     [dict_get_default $config_info ip_cache_report {}]
    set steps_log           [dict get $config_info steps_log] 

    OPTRACE "START" "Create IP caching environment" 
    # construct ip_repo_paths with the order below (first one wins)
    #  1. User IP repo from --user_ip_repo_paths
    #  2. User emulation IP repo (i.e. $::env(SDX_EM_REPO)) -- hw_emu only
    #  3. Kernel IP definitions (vpl --iprepo switch value)
    #  4. IP definitions from DSA IP repo -- hw only
    #  5. IP cache dir from Install area (/proj/xbuilds/2018.2_daily_latest/installs/lin64/SDx/2018.2/data/cache/xilinx)
    #  6. IP cache stored inside DSA
    #  7. $::env(XILINX_SDX)/data/emulation/hw_em/ip_repo  -- hw_emu only
    #  8. $::env(XILINX_VIVADO)/data/emulation/hw_em/ip_repo  -- hw_emu only
    #  9. SDx Specific Xilinx IP repo from install area (/proj/xbuilds/2018.2_daily_latest/installs/lin64/SDx/2018.2/data/ip/)
    # 10. General Xilinx IP repo from install area (/proj/xbuilds/2018.2_daily_latest/installs/lin64/Vivado/2018.2/data/ip/)
    # note: 10 is automatically handled by IP Services as the final fallback, so we don't need to add it explicitly

    # 1. append the user ip repo
    if { $user_ip_repo ne "" } {
      lappend ip_repo_paths {*}$user_ip_repo 
    } 
    # 2. append user emulation ip repo (hw_emu only)
    if { $is_hw_emu && [info exists ::env(SDX_EM_REPO)] } {
      lappend ip_repo_paths $::env(SDX_EM_REPO)
    }
    if { $is_hw_emu && $emu_user_ip_repo ne "" } {
      lappend ip_repo_paths $emu_user_ip_repo
    }
    # 3. append kernel ip repo
    lappend ip_repo_paths {*}$kernel_ip_dirs
    # 4. append DSA ip repo (hw only) 
    # hw_emu flow uses its own copy of these ip's from $(XILINX_SDX)/data/emulation/hw_em/ip_repo
    if { $dsa_ip_repo ne "" && !$is_hw_emu} {
      lappend ip_repo_paths $dsa_ip_repo 
    }
    # 5. append xilinx ip cache dir from install area
    if { !$no_ip_cache && !$no_install_ip_cache && $install_ip_cache ne "" } {
      lappend ip_repo_paths $install_ip_cache 
    }
    # 6. append DSA ip cache
    if { !$no_ip_cache && !$no_dsa_ip_cache && $dsa_ip_cache ne "" } {
      lappend ip_repo_paths $dsa_ip_cache 
    }
    # for debug and profiling (hw_emu only)
    if { $is_hw_emu } {
      # 7. append SDX specific xilinx emulation ip repo
      if { [info exists ::env(XILINX_SDX)] } {
        lappend ip_repo_paths $::env(XILINX_SDX)/data/emulation/hw_em/ip_repo 
      }
      # 8. append General xilinx emulation ip repo
      if { [info exists ::env(XILINX_VIVADO)] } {
        lappend ip_repo_paths $::env(XILINX_VIVADO)/data/emulation/hw_em/ip_repo 
      }
    }
    # 9. append SDx Specific xilinx ip repo from install area
    if { [info exists ::env(XILINX_SDX)] } {
      lappend ip_repo_paths $::env(XILINX_SDX)/data/ip
    }

    if { $ip_repo_paths ne "" } {
      puts "INFO: \[OCL_UTIL\] setting ip_repo_paths: $ip_repo_paths"
      set_property ip_repo_paths $ip_repo_paths [current_project] 
      add_to_steps_log $steps_log "internal step: update_ip_catalog" [fileName]:[lineNumber [info frame]]
      update_ip_catalog
    }

    # ip caching
    if { $no_ip_cache } { 
      add_to_steps_log $steps_log "internal step: config_ip_cache -disable_cache" [fileName]:[lineNumber [info frame]]
      config_ip_cache -disable_cache
    } else {
      if { $remote_ip_cache ne ""} {
        add_to_steps_log $steps_log "internal step: config_ip_cache -use_cache_location $remote_ip_cache" [fileName]:[lineNumber [info frame]]
        config_ip_cache -use_cache_location $remote_ip_cache
      } 
      # from nabeel: project level cache became default in 2016.3, no need
      # to explicitly call "config_ip_cache -use_project_cache" in else clause
    }

    OPTRACE "END" "Create IP caching environment"
  }

  # utility funciton called by init_dr_bd
  ################################################################################
  # TODO: copy_ooc_xdc_files
  #   Description:
  #      
  #   Arguments:
  #      bd_file is_hw_emu kernel_clock_freqs output_dir
  ################################################################################
  proc copy_ooc_xdc_files {bd_file kernel_clock_freqs config_info} {
    set is_hw_emu           [dict get $config_info is_hw_emu] 
    set steps_log           [dict get $config_info steps_log] 
    set output_dir          [dict get $config_info output_dir] 

    # moved section below from ipirun.tcl to here
    # Copy the OOC constraint files in BD, and add them to the top level design in order for
    # the clock constraints to be applied
    set var [lineNumber [info frame]]
    set ooc_xdc_files [get_files -of_object [get_files $bd_file] -norecurse -filter { FILE_TYPE == "XDC" && USED_IN =~ "*out_of_context*" }]
    
    foreach ooc_xdc_file $ooc_xdc_files {
      if {![string equal $ooc_xdc_file ""] && [file exists $ooc_xdc_file]} {
        set used_in_value [get_property used_in $ooc_xdc_file]
        set xdc_file_copy "[file rootname [file tail $ooc_xdc_file]]_copy.xdc"
        set xdc_file_copy $output_dir/$xdc_file_copy
        # file copy $ooc_xdc_file ./$xdc_file_copy
        file copy $ooc_xdc_file $xdc_file_copy
        if { !$is_hw_emu } { 
          # create a kernel clock constraint for synthesis, and overwrite the default frequency from dsa
          add_to_steps_log $steps_log "internal step: writing user synth clock constraints in $xdc_file_copy" [fileName]:[expr [lineNumber [info frame]] + $var]
          write_user_synth_clock_constraint $xdc_file_copy $kernel_clock_freqs
        } 

        add_to_steps_log $steps_log "internal step: add_files $xdc_file_copy -fileset \[current_fileset -constrset\]" [fileName]:[expr [lineNumber [info frame]] + $var]
        set xdc_file_obj [add_files $xdc_file_copy -fileset [current_fileset -constrset]]
        puts "INFO: \[OCL_UTIL\] set_property used_in $used_in_value $xdc_file_obj"
        set_property used_in $used_in_value $xdc_file_obj
        puts "INFO: \[OCL_UTIL\] set_property processing_order early $xdc_file_obj"
        set_property processing_order "early" $xdc_file_obj
      }
    }
  }

  # utility funciton called by init_dr_bd
  ################################################################################
  # TODO: write_address_map
  #   Description: write the address_map.xml file
  #      
  #   Arguments:
  #      output_dir
  ################################################################################
  proc write_address_map { output_dir } {
    # Note: there is already an open bd design

    # create Address Map file
    set xml_file $output_dir/address_map.xml
    set fp [open $xml_file w] 
    set addr_segs [get_bd_addr_segs -hier]
    # puts "--- DEBUG: current_bd_design: [current_bd_design]"
    # puts "--- DEBUG: addr_segs is $addr_segs"
    puts $fp "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
    puts $fp "<xd:addressMap xmlns:xd=\"http://www.xilinx.com/xd\">"
    foreach addr_seg $addr_segs {
      set path [get_property PATH $addr_seg]
      set offset [get_property OFFSET $addr_seg]
      # puts "--- DEBUG: addr_seg: $addr_seg\n\tpath: $path\n\toffset: $offset"
      if {$offset != ""} {
        set range [format 0x%X [get_property RANGE $addr_seg]]
        set high_addr [format 0x%X [expr $offset + $range - 1]]
        set slave [get_bd_addr_segs -of_object $addr_seg]

        if { [regexp {([^/]+)/([^/]+)/([^/]+)$} $path match componentRef addressSpace segment] } {

        } elseif { [regexp {([^/]+)/([^/]+)$} $path match addressSpace segment] }  {
          # In this case, address space is an external interface. For now, 
          # just use addressSpace as componentRef
          set componentRef $addressSpace
        } else {
          puts "warning: path doesn't match the regular expression ($path)"
          continue
        }

        if { [regexp {([^/]+)/([^/]+)/([^/]+)$} $slave match slaveRef slaveMemoryMap slaveSegment] } {
          set slaveIntfPin [get_bd_intf_pins -of_objects $slave]                      
        
        } elseif { [regexp {/([^/]+)/([^/]+)$} $slave match slaveMemoryMap slaveSegment] }  {
          # In this case, address segement is an external interface.
          set slaveIntfPin [get_bd_intf_ports -of_objects $slave]                      
          set slaveRef $slaveMemoryMap
        } else {
           puts "warning: slave doesn't match the regular expression ($slave)"
           continue
        }
        # set slaveIntfPin [get_bd_intf_pins -of_objects $slave]

        if { ![regexp {([^/]+)$} $slaveIntfPin match slaveInterface] } {
          puts "warning: slaveIntfPin doesn't match the regular expression ($slaveIntfPin)"
          continue
        }

        puts $fp "  <xd:addressRange xd:componentRef=\"${componentRef}\" xd:addressSpace=\"${addressSpace}\" xd:segment=\"${segment}\" xd:slaveRef=\"${slaveRef}\"\
xd:slaveInterface=\"${slaveInterface}\" xd:slaveSegment=\"${slaveSegment}\" xd:baseAddr=\"${offset}\" xd:range=\"${range}\"/>" 
      } 
    } 
    puts $fp "</xd:addressMap>"
    close $fp
  }

  # used by --reuse_impl
  proc create_bitstreams_without_implementation { dsa_info config_info clk_info } {
    set dsa_uses_pr      [dict get $dsa_info dsa_uses_pr]
    set ocl_inst_path    [dict get $dsa_info ocl_region]
    set is_unified       [dict get $dsa_info is_unified]

    set design_name      [dict get $config_info design_name]
    set out_partial_bit  [dict get $config_info out_partial_bitstream]
    set out_full_bit     [dict get $config_info out_full_bitstream]
    set steps_log        [dict get $config_info steps_log] 
    set reuse_impl_dcp   [dict get $config_info reuse_impl_dcp] 
    set output_dir       [dict get $config_info output_dir] 
    set clbinary_name    [dict get $config_info clbinary_name]

    set cwd [pwd]

    # open reuse_impl_dcp and run write_bistream
    # open_checkpoint creates a diskless project
    add_to_steps_log $steps_log "internal step: open_checkpoint $reuse_impl_dcp" [fileName]:[lineNumber [info frame]]
    open_checkpoint $reuse_impl_dcp

    # Make sure the design is fully routed
    if { ![report_route_status -boolean_check ROUTED_FULLY] } {
      puts "ERROR: The supplied design '$reuse_impl_dcp' is not fully routed. Please supply a routed design when using the --reuse_impl option."
      add_to_steps_log $steps_log "status: fail" [fileName]:[lineNumber [info frame]]
      error2file $output_dir "improper dcp supplied (not routed)"
    }

    # timing check and frequency scaling
    set is_in_run false
    if { ![report_timing_and_scale_freq $ocl_inst_path $is_unified $design_name $output_dir $clk_info $clbinary_name $is_in_run] } {
      return false
    }

    set out_bit $out_full_bit
    set cell_switch ""
    if { $dsa_uses_pr } {
      set out_bit $out_partial_bit
      set cell_switch "-cell $ocl_inst_path"
    }

    # to disable the generation of webtalk files (e.g. usage_statistics_webtalk.xml)
    # we want to keep the vivado directory as clean as possible
    config_webtalk -user off

    add_to_steps_log $steps_log "internal step: write_bitstream $cell_switch -force $out_bit" [fileName]:[lineNumber [info frame]]
    write_bitstream {*}$cell_switch -force $out_bit
  }

  # used to add synth_constrs and impl_constrs files in dsa
  proc add_xdc_files {xdc_dict steps_log} { 
    set var [lineNumber [info frame]] 
    foreach xdc_name [dict keys $xdc_dict] {
      set xdc_info [dict get $xdc_dict $xdc_name]
      set file_path [dict get $xdc_info file_path]
      set used_in [dict get $xdc_info used_in]
      set processing_order [dict get $xdc_info processing_order]
  
      if { [string equal $file_path ""] || ![file exists $file_path] } {
        continue;
      }

      add_to_steps_log $steps_log "internal step: add_files $file_path -fileset \[current_fileset -constrset\]" [fileName]:[expr [lineNumber [info frame]] + $var]
      add_files $file_path -fileset [current_fileset -constrset]
      if {$used_in ne ""} {
        puts "INFO: \[OCL_UTIL\] set_property USED_IN \"$used_in\" \[get_files $file_path\]"
        set_property USED_IN $used_in [get_files $file_path]
      }
      if {$processing_order ne ""} {
        puts "INFO: \[OCL_UTIL\] set_property PROCESSING_ORDER \"$processing_order\" \[get_files $file_path\]"
        set_property PROCESSING_ORDER $processing_order [get_files $file_path]
      }
      # puts "--- DEBUG: processing order for $file_path: [get_property processing_order [get_files $file_path]]"
    }
  }

  proc generate_kernel_inst_path_data { steps_log output_dir} { 
    add_to_steps_log $steps_log "internal step: creating $output_dir/_kernel_inst_paths.dat" [fileName]:[lineNumber [info frame]]
    set outfile [open "$output_dir/_kernel_inst_paths.dat" w]
    puts $outfile "# This file was automatically generated by SDx"
    puts $outfile "version: 1.0"

    # bd is already open at this point, verify with get_bd_design or current_bd_design
    # puts "--- DEBUG: current_bd_design:\n[join [current_bd_design] \n]"

    set bd_name [get_property name [current_bd_design]]
    # set ips [get_ips -quiet -all -filter "SDX_KERNEL==true"]
    # puts "ips: $ips"
    # puts "--- DEBUG: ip instance properties:"
    # report_property $ips

    set instances [get_bd_cells -quiet -hier -filter "SDX_KERNEL==true"]
    # puts "--- DEBUG: bd cells: $instances:"
    if { [llength $instances] > 0 } { 
      foreach instance $instances {
        # $instance returns "/OCL_Region_0/adder_stage_cu0"
        # we need to prepend the wrapper and bd name
        # puts "--- DEBUG: instance properties:"
        # report_property $instance
        # get the ip component name (xilinx.com:hls:vadd:1.0)
        set vlnv [get_property VLNV $instance]
        # we are only interested in the "name" portion
        set vlnv_list [split $vlnv ":"]
        set name [lindex $vlnv_list 2]
        
        set kernel_inst [get_property SDX_KERNEL_INST $instance]
        set kernel_type [get_property SDX_KERNEL_TYPE $instance]
        # puts "--- DEBUG: bd cell: $instance; kernel_inst: $kernel_inst; kernel_type: $kernel_type"
        set instance "/${bd_name}_wrapper/${bd_name}_i$instance"
        puts $outfile "$name:"
        puts $outfile "   instance path: $instance"
        puts $outfile "   type: $kernel_type"
      }
    }

    close $outfile
  }

  # utility funciton called by run_synthesis
  ################################################################################
  # TODO: check_synth_runs_status
  #   Description: 
  #      
  #   Arguments:
  #      steps_log err_str
  #   
  #   return false if any run fails
  ################################################################################
  proc check_synth_runs_status { steps_log err_str} {
    upvar $err_str _err_str

    # check for any run failure
    # and write the "cookie file" for Dennis' messaging support
    set any_run_not_done false
    set runs [get_runs -filter {IS_SYNTHESIS == 1}]
    # puts "--- DEBUG: get_filesets: [get_filesets]"
    set var [lineNumber [info frame]]

    foreach _run $runs {
      set run_name [get_property NAME $_run]
      # puts "--- DEBUG: run: $run_name"
      set run_status [get_property STATUS $_run]
      set run_dir [get_property DIRECTORY $_run]
      set run_fileset [get_property SRCSET $_run]
      # puts "--- DEBUG: run_fileset: $run_fileset"

      # having a run returned by get_runs does NOT guarantee the run dir would exist
      if { ![file exists $run_dir] } {
        puts "INFO: \[OCL_UTIL\] the run directory for run '$run_name' doesn't exist"
        continue;
      }
      #info frame returns line number of current stack inside foreach loop. So adding the line numbers to get current line number
      add_to_steps_log $steps_log "internal step: launched run $run_name" [fileName]:[expr [lineNumber [info frame]] + $var]

      # generate the cookie file for Dennis' messaging support
      set cookie_file $run_dir/.xocc_runmsg.txt
      set outfile [open $cookie_file w]
      
      # single project flow, the "top" level synthesis run is not synth_1, it is <rm>_synth_1
      # it is associated with reconfig module
      set fs_obj [get_filesets $run_fileset]
      # puts "--- DEBUG: fs_obj is '$fs_obj'"
      if { $fs_obj == "" } {
        # this fileset is associated with reconfig module, get_filesets without -of_object returns empty
        puts $outfile "Compiling (reconfig module level synthesis checkpoint) dynamic region"
      } elseif { [string equal $run_name "synth_1"] } {
        # TODO: hard-coded "synth_1
        puts $outfile "Compiling (top level synthesis checkpoint) dynamic region"
      } else {
        set ip_file [get_files -norecurse -of_objects $fs_obj]
        # puts "--- DEBUG: ip_file: $ip_file"
        # ip_top is only applicable to ip file type
        set file_type [get_property FILE_TYPE $ip_file]
        set ip_top ""
        if { [string equal -nocase $file_type "ip"] } {
          set ip_top [get_property IP_TOP $ip_file] 
          # puts "--- DEBUG: ip_top: $ip_top"
        }

        puts $outfile "Compiling (synthesis checkpoint) kernel/IP: $ip_top"
      }
      puts $outfile "Log file: $run_dir/runme.log"
      close $outfile

      # puts "--- DEBUG: run '$_run' has status '$run_status'"
      if { [string equal $run_status "synth_design ERROR"] } {
        puts "ERROR: run '$_run' failed, please look at the run log file '$run_dir/runme.log' for more information"
        append _err_str "\nrun '$_run' failed, please look at the run log file '$run_dir/runme.log' for more information"
        add_to_steps_log $steps_log "status: fail" [fileName]:[expr [lineNumber [info frame]] + $var]
        add_to_steps_log $steps_log "log: $run_dir/runme.log" [fileName]:[expr [lineNumber [info frame]] + $var]
        set any_run_not_done true
        # return false
      }
      if { [string equal $run_status "Scripts Generated"] } {
        puts "ERROR: run '$_run' couldn't start because one or more of the prerequisite runs failed"
        append _err_str "\nrun '$_run' couldn't start because one or more of the prerequisite runs failed"
        set any_run_not_done true
        # return false
      }
    }

    if {$any_run_not_done} {
      return false
    }

    return true
  }

  # TODO: this method was used by non-unified platform and dual project flow for unified platform only, 
  # but we may use this functionality for single project flow in the future, keep it for now 
  proc report_utilization_drc_synth { dsa_vbnv utilization config_info} {
    set enable_util_report  [dict get $config_info enable_util_report] 
    set threshold   [dict get $config_info utilization_threshold] 
    set kernels     [dict get $config_info kernels] 
    set steps_log   [dict get $config_info steps_log] 
    set output_dir  [dict get $config_info output_dir] 

    set availluts   [dict get $utilization luts]
    set availregisters      [dict get $utilization registers]
    set availbrams  [dict get $utilization brams]
    set availdsps   [dict get $utilization dsps]
    set cwd [pwd]

    if { $enable_util_report } {
      puts "Post-synthesis utilization DRC check..."
      puts "available resources:" 
      puts "   luts      : $availluts"
      puts "   registers : $availregisters"
      puts "   brams     : $availbrams"
      puts "   dsps      : $availdsps"

      # get the utilization numbers for dynamic region
      set ocl_utils [get_utilization]
    
      # compare the utilization with ones from DSA
      foreach util $ocl_utils {
        # puts "demand utilization is $util"
        set utilspec [split $util ":"]
        # puts "[lindex $utilspec 0] [lindex $utilspec 1] [lindex $utilspec 2]"
        if {[string equal -nocase [lindex $utilspec 0] "LUT"]} {
          set luts [lindex $utilspec 1]
        }
        if {[string equal -nocase [lindex $utilspec 0] "REG"]} {
          set registers [lindex $utilspec 1]
        }
        if {[string equal -nocase [lindex $utilspec 0] "BRAM"]} {
          set brams [lindex $utilspec 1]
        }
        if {[string equal -nocase [lindex $utilspec 0] "DSP"]} {
          set dsps [lindex $utilspec 1]
        }
      } 
      puts "required resources:"
      puts "   luts      : $luts"
      puts "   registers : $registers"
      puts "   brams     : $brams"
      puts "   dsps      : $dsps"
    
      # if dsa doesn't contains utilization data, the avilable resource number would be set to -1
      if { $availluts == -1 || $availregisters == -1 || $availbrams == -1 || $availbrams == -1 } {
        puts "WARNING: There is no resource utilization data in DSA, utilization DRC is skipped"
      }

      if { $availluts != -1 && $luts >= $threshold * $availluts} {
        warning2file $output_dir "CRITICAL WARNING: The available LUTs may not be sufficient to accommodate the kernels"
        if {[is_drcv]} { ::drcv::create_violation ACCELERATOR-FIT-04 -d $luts -d $availluts -f $threshold }
      }
      if { $availregisters != -1 && $registers >= $threshold * $availregisters} {
        warning2file $output_dir "CRITICAL WARNING: The available Registers may not be sufficient to accommodate the kernels"
        if {[is_drcv]} { ::drcv::create_violation ACCELERATOR-FIT-03 -d $registers -d $availregisters -f $threshold }
      }
      if { $availbrams != -1 && $brams >= $threshold * $availbrams} {
        warning2file $output_dir "CRITICAL WARNING: The available BRAMs may not be sufficient to accommodate the kernels"
        if {[is_drcv]} { ::drcv::create_violation ACCELERATOR-FIT-02 -d $brams -d $availbrams -f $threshold }
      }
      if { $availdsps != -1 && $dsps >= $threshold * $availdsps} {
        warning2file $output_dir "CRITICAL WARNING: The available DSPs may not be sufficient to accommodate the kernels"
        if {[is_drcv]} { ::drcv::create_violation ACCELERATOR-FIT-01 -d $dsps -d $availdsps -f $threshold }
      }
    
      # generate the utilizaiton reports, one for each kernel
      set sdx_util_string ""
      # puts "--- DEBUG:  generating kernel utilizaiton reports after dynamic region dcp synthesis"
      foreach kernel_inst [get_cells -hier -filter "SDX_KERNEL==true"] {
        if { ![string equal $kernel_inst ""] } {
          # puts "--- DEBUG: kernel instance is $kernel_inst"
          # report_property $kernel_inst
          # get the kernel name (for hls kernel, the orig_ref_name seems to be the kernel name) 
          set kernel [get_property ORIG_REF_NAME $kernel_inst]

          # vadd_cu0/inst
          set ki_split [split $kernel_inst "/"]
          # assume the second to the last element is the kernel instance name (i.e. "mmult_cu1")
          # this is not reliable, but couldn't figure out a better way
          set kernel_inst_base [lindex $ki_split end-1]

          set sdx_util_string "$sdx_util_string $kernel:$kernel_inst:$kernel_inst_base"
        }
      }

      if {$sdx_util_string ne ""} {
        add_to_steps_log $steps_log "internal step: report_sdx_utilization -kernels \"$sdx_util_string\" -file \"$output_dir/kernel_util_synthed.rpt\" -name kernel_util_synthed" [fileName]:[lineNumber [info frame]]
        report_sdx_utilization -kernels "$sdx_util_string" -file "$output_dir/kernel_util_synthed.rpt" -name kernel_util_synthed
      }
    } else {
      puts "INFO: post-synthesis utilization DRC check skipped"
    }
  }

  proc create_run_script_map_file { run_type output_dir {kernels ""} } {
    # get all the kernels
    if { $kernels eq "" && [string equal $run_type "synth"] } {
      set instances [get_bd_cells -quiet -hier -filter "SDX_KERNEL==true"]
      # puts "--- DEBUG: bd cells: $instances:"
      if { [llength $instances] > 0 } { 
        foreach instance $instances {
          # $instance returns "/OCL_Region_0/adder_stage_cu0"
          # get the ip component name (xilinx.com:hls:vadd:1.0)
          set vlnv [get_property VLNV $instance]
          # we are only interested in the "name" portion
          set vlnv_list [split $vlnv ":"]
          set name [lindex $vlnv_list 2]
          lappend kernels $name
        }
      }
    }
    # puts "--- DEBUG: kernels: $kernels"

    # the cwd is "ipi"
    set file_exist [file exists "$output_dir/run_script_map.dat"]
    set outfile [open "$output_dir/run_script_map.dat" a+]
    
    # header
    if { !$file_exist} {
      puts $outfile "#"
      puts $outfile "# Run script mapping file created by SDx"
      puts $outfile "#"
      puts $outfile "# This is the template file for user to use custom script feature"
      puts $outfile "# Format: <run name>: <custom script>"
      puts $outfile "# Usage:"
      puts $outfile "#   User can modify this file directly, to specify a custom script for a particular run,"
      puts $outfile "#   first find the entry below that matches the run name, uncomment it, replace the default"
      puts $outfile "#   run script with the *absolute* path to the custom script"
      puts $outfile "#   note: do NOT use the original (default) run script as the custom script"
      puts $outfile "# Note: if the custom script doesn't exist, it will be ignored by vivado"
    }

    # <run name> : <run driver script>
    if { [string equal $run_type "synth"] } { 
      set runs [get_runs -filter {IS_SYNTHESIS == 1}]
      puts $outfile ""
      puts $outfile "# ################"
      puts $outfile "# Synthesis runs"
      puts $outfile "# ################"
    } else {
      set runs [get_runs -filter {IS_IMPLEMENTATION == 1}]
      puts $outfile ""
      puts $outfile "# #################"
      puts $outfile "# Implmentation runs"
      puts $outfile "# #################"
    }

    # group the runs, list the kernel ooc runs first
    # for synthesis, there are three groups - top level, kernel ooc, other ip ooc
    set top_level ""
    set kernel_ooc ""
    set other_ooc ""
    foreach _run $runs {
      set run_name [get_property NAME [get_runs $_run]]
      if { [string equal $run_name "synth_1"] || [string equal $run_name "impl_1"] } {
        lappend top_level $_run
        continue;
      } 
     
      set kernel_ooc_run_found false
      foreach _kernel $kernels {
        if { [string match "*_${_kernel}_*" $run_name] } {
          lappend kernel_ooc $_run
          set kernel_ooc_run_found true
          break;
        }
      }
      if { $kernel_ooc_run_found } {
        continue;
      }
      
      lappend other_ooc $_run
    }

    # top level runs, i.e. synth_1 or impl_1
    if { [llength $top_level] > 0 } {
      puts $outfile "#"
      puts $outfile "# top level runs"
      puts $outfile "# ---------------------------------------"
    }

    foreach _run $top_level {
      set run_dir [get_property DIRECTORY [get_runs $_run]]
      set run_name [get_property NAME [get_runs $_run]]
      # get the run driver script
      set run_script [glob -nocomplain "$run_dir/*.tcl"]

      puts $outfile ""
      puts $outfile "# $run_name: $run_script"
    }

    # kernel ooc runs
    if { [llength $kernel_ooc] > 0 } {
      puts $outfile "#"
      puts $outfile "# kernel ooc runs"
      puts $outfile "# ---------------------------------------"
    }

    foreach _run $kernel_ooc {
      set run_dir [get_property DIRECTORY [get_runs $_run]]
      set run_name [get_property NAME [get_runs $_run]]
      # get the run driver script
      set run_script [glob -nocomplain "$run_dir/*.tcl"]

      if { $run_script ne ""} { 
        puts $outfile ""
        puts $outfile "# $run_name: $run_script"
      }
    }

    # other ooc runs (supporting ips)
    if { [llength $other_ooc] > 0 } {
      puts $outfile "#"
      puts $outfile "# supporting ip ooc runs"
      puts $outfile "# ---------------------------------------"
    }

    foreach _run $other_ooc {
      set run_dir [get_property DIRECTORY [get_runs $_run]]
      set run_name [get_property NAME [get_runs $_run]]
      # get the run driver script
      set run_script [glob -nocomplain "$run_dir/*.tcl"]

      if { $run_script ne ""} { 
        puts $outfile ""
        puts $outfile "# $run_name: $run_script"
      }
    }

    close $outfile
  }
  
  proc lineNumber {frame_info} {
    set result [dict get [info frame $frame_info] line]
    return "$result"
  }
  
  proc fileName {} {
    set script_path [dict get [info frame 0] file] 
    return "$script_path"
  }
  
  proc extFileName {} {
    set script_path [ info script ]
    return "$script_path"
  }
  
  proc add_to_steps_log { steps_log content file_name {indent "   "} } {
    # this is not a fatal problem from flow's perspective, hence using WARNING
    if { [catch {set outfile [open $steps_log a+]} catch_res] } {
      puts "WARNING: problem opening file $steps_log: $catch_res"
    }

    # echo the message
    puts "INFO: \[OCL_UTIL\] $content"

    set tool_flow "VPL"
    if { [string match "internal step:*" $content] } {
      puts $outfile "${indent}-----------------------"
      puts $outfile "${indent}$tool_flow $content"
      puts $outfile "${indent}File: $file_name"
    
      # get current timestamp
      set systemTime [clock seconds]
      puts $outfile "${indent}timestamp: [clock format $systemTime -format {%d %B %Y %H:%M:%S}]"
    } else {
      puts $outfile "${indent}$tool_flow $content"
    }

    close $outfile
  }

  # used for both unified platforms and non-unified platforms
  proc write_sdx_tcl_hooks {dsa_info config_info clk_info} {
    set steps_log        [dict get $config_info steps_log] 

    add_to_steps_log $steps_log "internal step: creating sdx tcl hooks for implementation run" [fileName]:[lineNumber [info frame]]
    write_sdx_pre_init_hook $config_info
    write_sdx_post_init_hook $dsa_info $config_info $clk_info 
    write_sdx_pre_opt_hook $config_info $dsa_info
    write_sdx_post_opt_hook $config_info $dsa_info
    write_sdx_pre_place_hook $dsa_info $config_info $clk_info 
    write_sdx_post_place_hook $config_info 
    write_sdx_post_route_hook $dsa_info $config_info $clk_info 
    write_sdx_post_post_route_phys_opt_hook $config_info
  }

  proc write_init_cmds_for_run {outfile local_dir} {
    global vivado_error_file
    global vivado_warn_file

    puts $outfile "if { !\[info exists _is_init_cmds\] } {"
    puts $outfile "  set vivado_error_file $vivado_error_file"
    puts $outfile "  set vivado_warn_file $vivado_warn_file"
    puts $outfile ""

    # import ocl_util::* tcl procs so that 'ocl_util::' prefix is not needed
    # puts $outfile "source [ dict get [ info frame 0 ] file ]"
    # to increase the portability, we copy ocl_util to local (ipi directory)
    puts $outfile "  source ../../../$local_dir/ocl_util.tcl"
    puts $outfile "  namespace import ocl_util::*"
    # puts $outfile "# get_script_dir returns [get_script_dir]"
    puts $outfile ""
    # puts $outfile "  set _is_sdx_post_route_run false"
    puts $outfile "  set _is_init_cmds true"
    puts $outfile "}"
    puts $outfile ""
  }

  proc write_sdx_pre_init_hook { config_info } {
    set scripts_dir      [dict get $config_info scripts_dir] 
    set local_dir        [dict get $config_info local_dir] 
  
    set sdx_pre_init_tcl "$scripts_dir/_sdx_pre_init.tcl"
    set outfile [open $sdx_pre_init_tcl w]
    # puts $outfile "puts \"sourcing _sdx_pre_init.tcl\""

    puts $outfile "# This file was automatically generated by SDx"
    write_init_cmds_for_run $outfile $local_dir

    close $outfile
  }

  # --kernel_frequency support for implementation (i.e. adding clock constraints)
  # for single project flow only
  proc write_sdx_post_init_hook { dsa_info config_info clk_info } {
    set ocl_inst_path    [dict get $dsa_info ocl_region]
    set steps_log        [dict get $config_info steps_log] 
    set scripts_dir      [dict get $config_info scripts_dir] 
    set output_dir       [dict get $config_info output_dir]  
    set kernel_clock_freqs     [dict get $clk_info kernel_clock_freqs]  

    set sdx_post_init_tcl "$scripts_dir/_sdx_post_init.tcl"
    set outfile [open $sdx_post_init_tcl w]
    puts $outfile "# This file was automatically generated by SDx"
    puts $outfile "write_user_impl_clock_constraint \"$ocl_inst_path\" \"$kernel_clock_freqs\" \"\" \"../../../$output_dir\"" 

    close $outfile
  }

  proc write_sdx_pre_opt_hook { config_info dsa_info } {
    set ocl_inst_path    [dict get $dsa_info ocl_region]
    set scripts_dir      [dict get $config_info scripts_dir] 
    set local_dir        [dict get $config_info local_dir] 
    
    # failfast_config is only available for unified platform
    set failfast_config ""
    if { [dict exists $config_info failfast_config] } {
      set failfast_config  [dict get $config_info failfast_config]  
    }

    set sdx_pre_opt_tcl "$scripts_dir/_sdx_pre_opt.tcl"
    set outfile [open $sdx_pre_opt_tcl w]

    puts $outfile "# This file was automatically generated by SDx"
    write_init_cmds_for_run $outfile $local_dir

    if { [dict exists $failfast_config pre_opt_design] } {
      set failfast_args [dict get $failfast_config pre_opt_design]
      # TODO: this is not needed
      if { [llength $failfast_args] == 0} {
        set failfast_args ""
      }
      # added on 4/9/2018 - to support macro expansion for reporting
      report_failfast_helper $config_info $dsa_info $failfast_args $outfile
    }
    
    close $outfile
  }

  ## helper for failfast macro expansion
  proc report_failfast_helper {config_info dsa_info failfast_args outfile} {
      # added on 4/9/2018 - to support macro expansion for reporting
      if { [string equal $failfast_args "__OCL_TOP__"] } {
        set ocl_inst_path    [dict get $dsa_info ocl_region]
        # If the ocl_region is empty (SoC), then drop the -pblock and -cell
        if { [string equal $ocl_inst_path ""] } {
          puts $outfile "if {\[catch {::tclapp::xilinx::designutils::report_failfast -detailed_report full.postopt -file full.postopt.failfast.rpt} _error\]} {"
          puts $outfile "  puts \"The report_failfast command failed with message '\${_error}', the flow will continue but this report will be missing.\""
          puts $outfile "}"
        } else {
          set ocl_inst_escaped [string map {/ _} $ocl_inst_path]
          puts $outfile "set oclPblock \[get_pblocks -quiet -filter {PARENT==ROOT && EXCLUDE_PLACEMENT} -of \[get_cells $ocl_inst_path/*\]\] "
          puts $outfile "if {\[catch {::tclapp::xilinx::designutils::report_failfast -detailed_report $ocl_inst_escaped.postopt -file $ocl_inst_escaped.postopt.failfast.rpt -pblock \$oclPblock -cell $ocl_inst_path} _error\]} {"
          puts $outfile "  puts \"The report_failfast command failed with message '\${_error}', the flow will continue but this report will be missing.\""
          puts $outfile "}"
        }
      } elseif { [string equal $failfast_args "__SLR__"] } {
        puts $outfile "if {\[catch {::tclapp::xilinx::designutils::report_failfast -detailed_report bySLR.postplace -file bySLR.postplace.failfast.rpt -by_slr} _error\]} {"
        puts $outfile "  puts \"The report_failfast command failed with message '\${_error}', the flow will continue but this report will be missing.\""
        puts $outfile "}"
      } elseif { [string equal $failfast_args "__KERNEL_NAMES__"] } {
        puts $outfile "foreach kernel_inst \[get_cells -hier -filter \"SDX_KERNEL==true\"\] {"
        # get the kernel name (for hls kernel, the orig_ref_name seems to be the kernel name) 
        puts $outfile "  set kernel_name \[get_property ORIG_REF_NAME \$kernel_inst\]"
        puts $outfile "  set oclPblock \[get_pblocks -quiet -filter {PARENT==ROOT && EXCLUDE_PLACEMENT} -of \[get_cells \$kernel_inst\]\] "
        puts $outfile "  # Skip if oclPblock is empty, SoC Platforms will match this criteria"
        puts $outfile "  if {!\[string equal \$oclPblock \"\"\]} {"
        puts $outfile "    if {\[catch {::tclapp::xilinx::designutils::report_failfast -show_resource -detailed_report \$kernel_name.postsynth -file \$kernel_name.postsynth.failfast.rpt -cell \$kernel_inst -pblock  \$oclPblock} _error\]} {"
        puts $outfile "      puts \"The report_failfast command failed with message '\${_error}', the flow will continue but this report will be missing.\""
        puts $outfile "    }"
        puts $outfile "  }"
        puts $outfile "}"
      } else {
        puts $outfile "if {\[catch {::tclapp::xilinx::designutils::report_failfast $failfast_args} _error\]} {"
        puts $outfile "  puts \"The report_failfast command failed with message '\${_error}', the flow will continue but this report will be missing.\""
        puts $outfile "}"
      }
    }

  proc write_sdx_post_opt_hook { config_info dsa_info} {
    set ocl_inst_path    [dict get $dsa_info ocl_region]
    set scripts_dir      [dict get $config_info scripts_dir] 
    # failfast_config is only available for unified platform
    set failfast_config ""
    if { [dict exists $config_info failfast_config] } {
      set failfast_config  [dict get $config_info failfast_config]  
    }

    set sdx_post_opt_tcl "$scripts_dir/_sdx_post_opt.tcl"
    set outfile [open $sdx_post_opt_tcl w]
    puts $outfile "# This file was automatically generated by SDx"

    if { [dict exists $failfast_config post_opt_design] } {
      set failfast_args [dict get $failfast_config post_opt_design]
      if { [llength $failfast_args] == 0} {
        set failfast_args ""
      }
      # added on 4/9/2018 - to support macro expansion for reporting
      report_failfast_helper $config_info $dsa_info $failfast_args $outfile
    }
    
    close $outfile
  }

  proc write_sdx_pre_place_hook { dsa_info config_info clk_info } {
    set xocc_optimize_level  [dict get $config_info xocc_optimize_level]
    set scripts_dir          [dict get $config_info scripts_dir] 
    set local_dir            [dict get $config_info local_dir] 

    # write the kernel clock info file for Steven Li
    set sdx_pre_place_tcl "$scripts_dir/_sdx_pre_place.tcl"
    set outfile [open $sdx_pre_place_tcl w]
    # puts $outfile "puts \"sourcing _sdx_pre_place.tcl\""

    puts $outfile "# This file was automatically generated by SDx"
    write_init_cmds_for_run $outfile $local_dir

    # move post_init tcl hook to here
    puts $outfile "set xocc_optimize_level $xocc_optimize_level"
    puts $outfile "set_property SEVERITY {Warning} \[get_drc_checks HDPR-5\]"
    # CR 955574 - Turn off BUFG insertion during opt_design
    puts $outfile "set_param logicopt.enableBUFGinsertHFN 0"
    puts $outfile ""

    close $outfile
  }

  proc write_sdx_post_place_hook { config_info } {
    set enable_util_report    [dict get $config_info enable_util_report] 
    set kernels               [dict get $config_info kernels]
    set scripts_dir           [dict get $config_info scripts_dir] 

    set sdx_post_place_tcl "$scripts_dir/_sdx_post_place.tcl"
    set outfile [open $sdx_post_place_tcl w]
    # puts $outfile "puts \"DEBUG: sourcing _sdx_post_place.tcl\""
    puts $outfile "# This file was automatically generated by SDx"

    # generate the utilization reports after place_design
    puts $outfile "# utilization reports"
    puts $outfile "report_utilization_impl $enable_util_report \"$kernels\" \"placed\""

    close $outfile
  }

  # timing report/frequency scaling operations are done here
  # if post_route_phys_opt_design is not enabled
  proc write_sdx_post_route_hook { dsa_info config_info clk_info } {
    set ocl_inst_path         [dict get $dsa_info ocl_region]
    set is_unified            [dict get $dsa_info is_unified]
    set dsa_full_dcp          [dict get $dsa_info dsa_dcp]
    set pr_shell_dcp          [dict get $dsa_info dsa_pr_shell_dcp]
    set dsa_uses_pr_shell_dcp [dict get $dsa_info dsa_uses_pr_shell_dcp]
    set link_output_format    [dict get $dsa_info link_output_format]

    set design_name           [dict get $config_info design_name]
    set enable_util_report    [dict get $config_info enable_util_report] 
    set kernels               [dict get $config_info kernels]
    set clbinary_name         [dict get $config_info clbinary_name]
    set encrypt_impl_dcp      [dict get $config_info encrypt_impl_dcp]
    set enable_pr_verify      [dict get $config_info enable_pr_verify]
    set local_dir             [dict get $config_info local_dir] 
    set scripts_dir           [dict get $config_info scripts_dir] 
    set output_dir            [dict get $config_info output_dir] 
    set failfast_config       [dict get $config_info failfast_config]  
    # # failfast_config is only available for unified platform
    # set failfast_config ""
    # if { [dict exists $config_info failfast_config] } {
    #   set failfast_config  [dict get $config_info failfast_config]  
    # }

    # when this tcl hook runs, we know we are in prj/proj.runs/impl_1/, so we need to go 3 levels up
    set output_dir "../../../$output_dir" 

    # generate the sdx tclhook for utilization report generation after place_design
    set sdx_post_route_tcl "$scripts_dir/_sdx_post_route.tcl"
    set outfile [open $sdx_post_route_tcl w]
    # puts $outfile "puts \"DEBUG: sourcing _sdx_post_route.tcl\""

    puts $outfile "# This file was automatically generated by SDx"
    write_init_cmds_for_run $outfile $local_dir

    puts $outfile ""
    if { $encrypt_impl_dcp } {
      puts $outfile "# generate encrypted implemented checkpoint file"
      puts $outfile "if { !\[file exists encrypted_routed.dcp\] } {"
      puts $outfile "  write_checkpoint -encrypt encrypted_routed.dcp"
      puts $outfile "}"
      puts $outfile ""
    }
    puts $outfile "# generate cookie file for messaging"
    puts $outfile "write_cookie_file_impl \"$clbinary_name\""
    puts $outfile ""
    puts $outfile "# utilization reports"
    puts $outfile "report_utilization_impl $enable_util_report \"$kernels\" \"routed\""
    puts $outfile ""

    if {$enable_pr_verify} {
      if { $dsa_uses_pr_shell_dcp } {
        set dsa_dcp $pr_shell_dcp
      } else {
        set dsa_dcp $dsa_full_dcp
      }
      if {$dsa_dcp ne ""} {
        # to increase the portability, support relative path
        if { [string first ".local_dsa" $dsa_dcp] != -1 || 
             [string first "$local_dir" $dsa_dcp] != -1 } {
          set dsa_dcp "../../../$dsa_dcp"
        }

        puts $outfile "# verify pr with the dsa dcp"
        puts $outfile "pr_verify -in_memory -additional $dsa_dcp"
        puts $outfile ""
      }
    }

    # aws dcp support
    # ltx files are generated as part of write_bitstream, since for Faas, we stop at post route_design,
    # we need to run write_debug_probes commands explicitly to generate them
    # CR 1011484: copy *just* debug_nets.ltx and rename it to <binary>.ltx
    if { [string equal $link_output_format "dcp"] } {
      puts $outfile "# generate ltx files"
      puts $outfile "write_debug_probes -force -quiet -no_partial_ltxfile \[format \"%s/%s\" \".\" debug_nets.ltx\]"
      # puts $outfile "write_debug_probes -force -quiet -no_partial_ltxfile \[format \"%s/%s\" \".\" \[get_property TOP \[current_design\]\]\]"
    }

    if { [dict exists $failfast_config post_route_design] } {
      set failfast_args [dict get  $failfast_config post_route_design]
      if { [llength $failfast_args] == 0} {
        set failfast_args ""
      }
      # added on 4/9/2018 - to support macro expansion for reporting
      report_failfast_helper $config_info $dsa_info $failfast_args $outfile
    }

    close $outfile
  }

  # create a tcl hook for post post_route_phy_opt_design
  proc write_sdx_post_post_route_phys_opt_hook { config_info } {
    set scripts_dir           [dict get $config_info scripts_dir]
    set sdx_post_phys [open "$scripts_dir/_sdx_post_post_route_phys_opt.tcl" w]
    puts $sdx_post_phys "# This file was automatically generated by SDx"
    close $sdx_post_phys
  }

  # runs the report timing and frequency scaling either: 
  #    1. after route_design if post_route_phys_opt_design is not enabled
  # or 2. after post_route_phy_opt_design if enabled
  proc write_report_timing_and_scale_freq { dsa_info config_info clk_info is_physopt_enabled} {
    set ocl_inst_path         [dict get $dsa_info ocl_region]
    set is_unified            [dict get $dsa_info is_unified]
    set design_name           [dict get $config_info design_name]
    set output_dir            [dict get $config_info output_dir]
    set scripts_dir           [dict get $config_info scripts_dir]
    set clbinary_name         [dict get $config_info clbinary_name]

    # when this tcl hook runs, we know we are in prj/prj.runs/impl_1/, so we need to go 3 levels up
    set output_dir "../../../$output_dir"

    if { $is_physopt_enabled } {
      set tcl_hook "_sdx_post_post_route_phys_opt.tcl"
    } else {
      set tcl_hook "_sdx_post_route.tcl"
    }

    # insert a proc at the end of a tcl hook
    set sdx_post_hook [open "$scripts_dir/$tcl_hook" a+]
    puts $sdx_post_hook ""
    puts $sdx_post_hook "# run timing analysis and frequency scaling"
    puts $sdx_post_hook "if { !\[report_timing_and_scale_freq \"$ocl_inst_path\" \"$is_unified\" \"$design_name\" \"$output_dir\" \"$clk_info\" \"$clbinary_name\"\] } {"
    puts $sdx_post_hook "  return false"
    puts $sdx_post_hook "}"
    close $sdx_post_hook
  }

  proc report_utilization_impl {enable_util_report kernels run_step} {
    if { $enable_util_report } { 
      set sdx_util_string ""

      foreach kernel_inst [get_cells -hier -filter "SDX_KERNEL==true"] {
        if { ![string equal $kernel_inst ""] } {
          # puts "--- DEBUG: kernel instance is $kernel_inst"
          # report_property $kernel_inst
          # get the kernel name (for hls kernel, the orig_ref_name seems to be the kernel name) 
          set kernel [get_property ORIG_REF_NAME $kernel_inst]

          # xcl_design_i/expanded_region/u_ocl_region/opencldesign_i/mmult_cu1/inst
          set ki_split [split $kernel_inst "/"]
          # assume the second to the last element is the kernel instance name (i.e. "mmult_cu1")
          # this is not reliable, but couldn't figure out a better way
          set kernel_inst_base [lindex $ki_split end-1]

          set sdx_util_string "$sdx_util_string $kernel:$kernel_inst:$kernel_inst_base"
        }
      }

      if {$sdx_util_string ne ""} {
        # puts "--- DEBUG: report_sdx_utilization -kernels \"$sdx_util_string\" -file \"kernel_util_${run_step}.rpt\" -name kernel_util_${run_step}"
        report_sdx_utilization -kernels "$sdx_util_string" -file "kernel_util_${run_step}.rpt" -name kernel_util_${run_step}
      }
    }
  }

  proc write_cookie_file_impl { clbinary_name} { 
    # write the "cookie file" for Dennis' messaging support
    set run_dir [pwd]
    set cookie_file ./.xocc_runmsg.txt
    set outfile [open $cookie_file w]
    puts $outfile "Compiling (bitstream) accelerator binary: $clbinary_name"
    puts $outfile "Log file: $run_dir/runme.log"
    close $outfile
  }

  proc report_timing_and_scale_freq {ocl_inst_path is_unified design_name output_dir clk_info clbinary_name {is_in_run true}} {
    set worst_negative_slack    [dict get $clk_info worst_negative_slack]
    set error_on_hold_violation [dict get $clk_info error_on_hold_violation]
    set skip_timing_and_scaling [dict get $clk_info skip_timing_and_scaling]
    set enable_auto_freq_scale  [dict get $clk_info enable_auto_freq_scale]
    set cwd [pwd]

    # used for internal developer only
    if {$skip_timing_and_scaling} {
      return true
    }

    # if this tcl proc is executed as part of implementation run, the cwd is vivdo/prj/prj.runs/impl_1
    #    the timing dcp and report files should be generated at the cwd
    # if this tcl proc is executed standalone (e.g. create_bitstreams_without_implementation), the cwd is vivado/
    #    this timing dcp and report files should be generated at vivado/output/
    set timing_output_dir [expr { $is_in_run ? $cwd : $output_dir} ] 
    
    set routed_timing_dcp $timing_output_dir/${design_name}_routed_timing.dcp
    # Check hold violation before trying frequency scaling per Steven's request
    set timingHoldPaths [get_timing_paths -hold -quiet]
    if { [llength $timingHoldPaths] > 0 && [get_property SLACK $timingHoldPaths] < 0} {
      # The command above will return the worst hold slack. If it's negative, we error out.
      if { ![file exists $routed_timing_dcp] } {
        write_checkpoint $routed_timing_dcp
      }
      report_timing_summary -hold -file $timing_output_dir/${design_name}_timing_summary_hold.rpt
      # when there is a hold violation, it can be caused by huge failures in setup timing
      # so setup timing report should always be generated as well
      report_timing_summary -slack_lesser_than $worst_negative_slack -file $timing_output_dir/${design_name}_timing_summary.rpt

      if { $error_on_hold_violation } {
        if { $is_in_run } { 
          error "design did not meet timing - hold violation"
        } else {
          error2file $output_dir "design did not meet timing - hold violation"
        }
      } else {
        puts "WARNING: Hold violation detected, it will be ignored due to user setting."
      }
    }

    set err_str "Design failed to meet timing"
    # set new_clk_freq_file [expr { $is_in_run ? "../../../$output_dir/_new_clk_freq" : "$output_dir/_new_clk_freq"} ] 
    set new_clk_freq_file "$output_dir/_new_clk_freq" 
    if {$enable_auto_freq_scale} {
      set is_timing_failure [expr [write_new_clk_freq $new_clk_freq_file $ocl_inst_path $is_unified $clk_info err_str $clbinary_name] == "0"]
    } else {
      # for soc platforms
      set is_timing_failure [expr [write_orig_clk_freq $new_clk_freq_file $design_name $clk_info err_str] == "0"] 
    }
    if { $is_timing_failure } {
      if { ![file exists $routed_timing_dcp] } {
        write_checkpoint $routed_timing_dcp
      }
      report_timing_summary -slack_lesser_than $worst_negative_slack -file ${design_name}_timing_summary.rpt

      if { $is_in_run } { 
        error "design did not meet timing - $err_str"
      } else {
        error2file $output_dir $err_str
      }
    }
    return true
  }

  proc apply_dont_partition { enable_dont_partition steps_log output_dir} {
    if { $enable_dont_partition } {
      add_to_steps_log $steps_log "internal step: read_xdc $output_dir/dont_partition.xdc" [fileName]:[lineNumber [info frame]]

      # create the dont partition xdc for kernels
      # 1. Creating a dont_partition.xdc file what will contain a dont_partition constraint for all kernels.
      # 2. Adding the dont_partition.xdc to the project prior to running implementation.
      # puts "--- DEBUG: get_cells: [get_cells -hier -filter "SDX_KERNEL==true"]"
      
      set dontpartition [open "$output_dir/dont_partition.xdc" w]
      puts $dontpartition "set_property DONT_PARTITION TRUE \[get_cells -hier -filter {SDX_KERNEL==true}\]"
      close $dontpartition

      read_xdc $output_dir/dont_partition.xdc
    }
  }

  # used by for both hw_emu flow and soc platform of the hw flow
  proc write_orig_clk_freq {new_clk_freq_file design_name clk_info err_str} {
    set kernel_clock_freqs    [dict get $clk_info kernel_clock_freqs]  
    set system_clock_freqs    [dict get $clk_info system_clock_freqs]  
    set worst_negative_slack  [dict get $clk_info worst_negative_slack]
    upvar $err_str _err_str

    set routed_timing_dcp ${design_name}_routed_timing.dcp
    set timing_summary_rpt ${design_name}_timing_summary.rpt
    puts "INFO: \[OCL_UTIL\] clock frequency scaling is disabled for this flow, perform the normal timing check instead"
    puts "INFO: \[OCL_UTIL\] get_timing_paths -quiet -slack_lesser_than $worst_negative_slack"
    set timingFailedPaths [ get_timing_paths -quiet -slack_lesser_than $worst_negative_slack ]
    if { [llength $timingFailedPaths] > 0 } {
      set _err_str "Design failed to meet timing.\n"
      append _err_str "    Failed timing checks (paths):\n\t[ join $timingFailedPaths \n\t ]\n\n"
      append _err_str "    Please check the routed checkpoint ($routed_timing_dcp) and timing summary report ($timing_summary_rpt) for more information."

      return 0;
    }

    # write the original clock frequencies in _new_ocl_freq file
    set outfile [open $new_clk_freq_file w]
    dict for {kernel_clk dict_clock} $kernel_clock_freqs {
      set orig_clk_freq [dict get $dict_clock freq]
      set clk_id [dict get $dict_clock clk_id] 
      puts $outfile "kernel:$clk_id:$kernel_clk:$orig_clk_freq"
    }

    dict for {system_clk dict_clock} $system_clock_freqs {
      set orig_clk_freq [dict get $dict_clock freq]
      set clk_id [dict get $dict_clock clk_id] 
      # note for system clock, the clk_id is an empty string
      puts $outfile "system:$clk_id:$system_clk:$orig_clk_freq"
    }

    close $outfile
    return 1
  }

  # ocl_util::get_kernel_counts

  proc get_kernel_counts {} {

    set hls_count 0
    set rtl_count 0

    set kernel_instances [get_cells -hier -filter "SDX_KERNEL==true"] 
    foreach instance $kernel_instances {
      if { [get_property SDX_KERNEL_TYPE $instance] eq "hls" } {
        incr hls_count
      } else {
        incr rtl_count
      }
    }
    # assumes that the only two valid kernel types are 'hls' and 'rtl'
    return [dict create hls $hls_count rtl $rtl_count]
  }

  # ocl_util::check_kernel_count
  #
  #     Assumes that PL 0 is always hls kernel clock and PL 1 is always rtl kernel clock,
  #     regardless of platform.
  #
  # Parameters:
  #     d A dictionary of kernel counts indexed by keys 'hls' or 'rtl'
  #     clk_id A number where 0 is the id for hls kernel clock, 1 is rtl kernel clock
  #
  # Results:
  #     Returns 1 if at least one kernel of the given type is found
  #     Else returns 0

  proc check_kernel_count { d clk_id } {
      set kernel_type hls
      if { $clk_id == 1 } {
          set kernel_type rtl
      }
      if { [dict exists $d $kernel_type] } {
          if { [dict get $d $kernel_type] > 0 } {
              return 1
          }
      }
      return 0
  }

  # ocl_util::kernel_clock_purpose
  #
  #     Format human-readable string that explains the purpose for a given
  #     scalable kernel clock.
  #
  # Parameters:
  #     kernel_clk     A scalable kernel clock 'name' (pin path?)
  #     clk_id         Value 0 is the id for hls kernel clock, 1 is rtl kernel clock
  #     kernel_counts  Dict of kernel counts indexed by keys 'hls' or 'rtl'
  #
  # Results:
  #     A string, which may be empty

  proc kernel_clock_purpose { kernel_clk clk_id kernel_counts } {

    set result ""
    set kernel_type "" 
    if { $clk_id == 0 } {
      set kernel_type hls
    } elseif { $clk_id == 1 } {
      set kernel_type rtl
    } else {
      return $result
    }
    set count 0
    if { [dict exists $kernel_counts $kernel_type] } {
      set count [dict get $kernel_counts $kernel_type]
    }  
    set result "\n"
    append result "Scalable clock $kernel_clk (Id = $clk_id) is used for $kernel_type kernels. "
    append result "This design has $count $kernel_type kernel(s)."
    return $result
  }

  # ocl_util::write_new_clk_freq
  #
  #     Writes frequency data to file, used by runtime to set MMCM control registers.
  #     Output data is for scalable system clocks and kernel clocks.
  #
  # Parameters:
  #
  #     new_clk_freq_file Path to output file for scalable system and kernel clock results
  #     ocl_inst_path
  #     is_unified        True for a unified platform, false otherwise
  #     clk_info          Dictionary
  #     err_str
  #
  # Results:
  #     Returns 0 indicates frequency scaling failure; return 1 indicate success
  #
  # TODO: we no longer support non-unified platform, remove "is_unified"

  proc write_new_clk_freq {new_clk_freq_file ocl_inst_path is_unified clk_info err_str clbinary_name} {
    set kernel_clock_freqs    [dict get $clk_info kernel_clock_freqs]  
    set system_clock_freqs    [dict get $clk_info system_clock_freqs]  
    set worst_negative_slack  [dict get $clk_info worst_negative_slack]

    upvar $err_str _err_str
    # set startdir [pwd]

    puts "Starting auto-frequency scaling ..."
    # initialize kernel_pin_freqs
    foreach kernel_clk [dict keys $kernel_clock_freqs] {
      set kernel_pin_path "$ocl_inst_path/$kernel_clk"
      set dict_clock [dict get $kernel_clock_freqs $kernel_clk]
      set orig_clock_freq [dict get $dict_clock freq]
      set orig_clock_freq [format "%.1f" $orig_clock_freq]
      set kernel_pin_clock_map($kernel_pin_path) $kernel_clk

      # kernel_pin_freqs is a tcl array
      set kernel_pin_freqs($kernel_pin_path) $orig_clock_freq
      puts "kernel clock '$kernel_clk':"
      puts "   clock pin path     : $kernel_pin_path"
      puts "   original frequency : ${orig_clock_freq} MHz"
    }
    puts ""

    foreach system_clk [dict keys $system_clock_freqs] {
      set system_pin_path [lindex [get_pins -of_objects [get_clocks $system_clk]] 0]
      set dict_clock [dict get $system_clock_freqs $system_clk]
      set orig_clock_freq [dict get $dict_clock freq] 
      set orig_clock_freq [format "%.1f" $orig_clock_freq]
      set system_pin_clock_map($system_pin_path) $system_clk

      # system_pin_freqs is a tcl array
      set system_pin_freqs($system_pin_path) $orig_clock_freq
      puts "system clock '$system_clk':"
      puts "   clock pin path     : $system_pin_path"
      puts "   original frequency : ${orig_clock_freq} MHz"
    }
    puts ""

    # call steven li's auto frequency scaling tcl proc, kernel_pin_freqs and system_pin_freqs contains the scaled frequencies
    # note: get_achievable_kernel_freq not only tries to scale the scalable clocks, it also reports
    #       any unscalable clock (e.g. system clock) which doesn't meet timing (worse than wns)
    set failing_system_clocks ""
    # Used to message final achieved frequency for all scalable clocks.
    set achieved ""
    set purpose ""
    set ret [get_achievable_kernel_freq $worst_negative_slack kernel_pin_freqs system_pin_freqs failing_system_clocks]
    puts "Auto-frequency scaling completed"

    set kernel_counts [get_kernel_counts]

    # returns 0 if any system clock slack < worst negative slack, in which case, the kernel clock frequencies are NOT scaled?
    if { $ret  == "0" } {
      set err_freq ""
      # unified platforms, clock names are not hard-coded
      # find the mimimum new_ocl_freq 
      set min_new_ocl_freq 0
      foreach kernel_pin [array names kernel_pin_freqs] {
        validate_new_clk_freq $ocl_util::Kernel $clk_info $kernel_pin kernel_pin_clock_map kernel_pin_freqs _err_str new_ocl_freq $clbinary_name $kernel_counts
        if { $min_new_ocl_freq == 0 } {
          set min_new_ocl_freq $new_ocl_freq 
        }
        # puts "min_new_ocl_freq is $min_new_ocl_freq; new_ocl_freq is $new_ocl_freq"
        if { $min_new_ocl_freq > $new_ocl_freq } {
          set min_new_ocl_freq $new_ocl_freq 
        }
      }
      set new_ocl_freq $min_new_ocl_freq

      # $new_ocl_freq could have decimal places, so round it down 
      set err_freq [round_down $new_ocl_freq]
      set _err_str "Design did not meet timing. One or more unscalable system clocks did not meet their required target frequency. Please try specifying a clock frequency lower than $err_freq MHz using the '--kernel_frequency' switch for the next compilation. For all system clocks, this design is using $worst_negative_slack nanoseconds as the threshold worst negative slack (WNS) value. List of system clocks with timing failure:"
      set report_clock_list ""
      foreach _sys_clk [dict keys $failing_system_clocks] {
        set _slack [dict get $failing_system_clocks $_sys_clk]
        append _err_str "\nsystem clock: $_sys_clk; slack: $_slack ns"
        append report_clock_list "\nsystem clock: $_sys_clk; slack: $_slack ns"
      }

      # AUTO-FREQ-SCALING-01
      if {[is_drcv]} { ::drcv::create_violation AUTO-FREQ-SCALING-01 -s $err_freq -s $worst_negative_slack -s $report_clock_list }
      return 0
    }

    # write the new clock frequencies in _new_ocl_freq file
    set output_dir [file dirname $new_clk_freq_file]
    set outfile [open $new_clk_freq_file w]


    # Handles scalable kernel clocks
    foreach kernel_pin [array names kernel_pin_freqs] {
      if { ![validate_new_clk_freq $ocl_util::Kernel $clk_info $kernel_pin kernel_pin_clock_map kernel_pin_freqs _err_str new_ocl_freq $clbinary_name $kernel_counts] } {
        close $outfile
        return 0 
      }
   
      set kernel_clk $kernel_pin_clock_map($kernel_pin)
      set dict_clock [dict get $kernel_clock_freqs $kernel_clk]
      set orig_clk_freq [dict get $dict_clock freq]
      set clk_id [dict get $dict_clock clk_id] 

      if { $new_ocl_freq < $orig_clk_freq } {
        warning2file $output_dir "WARNING: One or more timing paths failed timing targeting $orig_clk_freq MHz for kernel clock '$kernel_clk'. The frequency is being automatically changed to $new_ocl_freq MHz to enable proper functionality"
        # AUTO-FREQ-SCALING-04
        if {[is_drcv]} { ::drcv::create_violation AUTO-FREQ-SCALING-04 -dynamic_category [list [list xclbin $clbinary_name]] -REF [list type OTHER -name $kernel_clk] -s $orig_clk_freq -s $new_ocl_freq -s $clk_id }
      }

      # write the new ocl frequency to the file "_new_clk_freq" regardless the clock has been scaled or not
      # in the case where the clock is not scaled, the new frequency would be same as original frequency
      puts $outfile "kernel:$clk_id:$kernel_clk:$new_ocl_freq"
      append achieved "\nKernel: $kernel_clk = $new_ocl_freq MHz "
      append purpose [kernel_clock_purpose $kernel_clk $clk_id $kernel_counts]
    }

    # Handles scalable system clocks
    foreach system_pin [array names system_pin_freqs] {
      if { ![validate_new_clk_freq $ocl_util::System $clk_info $system_pin system_pin_clock_map system_pin_freqs _err_str new_clk_freq $clbinary_name $kernel_counts] } {
        close $outfile
        return 0 
      }
   
      set system_clk $system_pin_clock_map($system_pin)
      set dict_clock [dict get $system_clock_freqs $system_clk]
      set orig_clk_freq [dict get $dict_clock freq]
      set clk_id [dict get $dict_clock clk_id] 

      if { $new_clk_freq < $orig_clk_freq } {
        warning2file $output_dir "WARNING: One or more timing paths failed timing targeting $orig_clk_freq MHz for system clock '$system_clk'. The frequency is being automatically changed to $new_clk_freq MHz to enable proper functionality"
        # AUTO-FREQ-SCALING-07
        if {[is_drcv]} { ::drcv::create_violation AUTO-FREQ-SCALING-07 -REF [list type OTHER -name $system_clk] -s $orig_clk_freq -s $new_clk_freq }
      }

      # write the new ocl frequency to the file "_new_clk_freq" regardless the clock has been scaled or not
      # in the case where the clock is not scaled, the new frequency would be same as original frequency
      puts $outfile "system:$clk_id:$system_clk:$new_clk_freq"
      append achieved "\nSystem: $system_clk = $new_clk_freq MHz "
    }

    close $outfile
    append achieved $purpose
    # This is the right place to affirm the final achieved frequencies for the scalable clock domains.
    if {[is_drcv]} { ::drcv::create_affirmation PLATFORM-CLOCK-DOMAINS-01 -s $achieved }
    return 1;
  }

  # ::ocl_util::validate_new_clk_freq
  #
  # Parameters:
  #     clk_type       One of 'kernel' or 'system'
  #     clk_info       A dict populated using data from the HPFM
  #     clock_pin      A pin name
  #     pin_clock_map
  #     clk_pin_freqs
  #     err_str
  #     new_clk_freq   The proposed, computed value to validate
  #     clbinary_name
  #     kernel_counts  A dict that relates kernel type to count
  #
  # Results:
  #     Sets a scaled frequency value - return 0 when scaled frequency is below minimum,
  #     return 1 otherwise.

  proc validate_new_clk_freq { clk_type clk_info clock_pin pin_clock_map clk_pin_freqs err_str \
      new_clk_freq clbinary_name kernel_counts} {

    upvar $err_str _err_str
    upvar $new_clk_freq _new_clk_freq
    upvar $clk_pin_freqs _clk_pin_freqs
    upvar $pin_clock_map _pin_clock_map

    set max_frequency        [dict get $clk_info max_frequency]
    set min_frequency        [dict get $clk_info min_frequency]

    # clock_freqs can either be kernel_clock_freqs or system_clock_freqs depending on $clk_type 
    set clock_freqs [dict get $clk_info ${clk_type}_clock_freqs]  
    set clk $_pin_clock_map($clock_pin)
    set dict_clock [dict get $clock_freqs $clk]
    set orig_clk_freq [dict get $dict_clock freq]
    set orig_clk_freq [format "%.1f" $orig_clk_freq]
    set clk_id [dict get $dict_clock clk_id]
    set _new_clk_freq $_clk_pin_freqs($clock_pin)

    puts "$clk_type clock '$clk':"
    puts "   original frequency : ${orig_clk_freq} MHz"
    puts "   scaled frequency   : ${_new_clk_freq} MHz"
    if {[is_drcv]} { set clk_ref [::drcv::create_reference OTHER -name $clk] }

    # CR 964071: We should error out below 60Mhz. Nothing slower than this is supported
    # compiler.minFrequencyLimit
    if { $_new_clk_freq < $min_frequency } {
      set _err_str "auto frequency scaling failed because the auto scaled frequency '$_new_clk_freq MHz' is lower than the minimum frequency limit supported by the runtime ($min_frequency MHz)."
      if {[is_drcv]} {
        if {$clk_type eq $ocl_util::System} {
          # AUTO-FREQ-SCALING-05 is for system clock minimum
          ::drcv::create_violation AUTO-FREQ-SCALING-05 -REF $clk_ref -s $orig_clk_freq -s $_new_clk_freq -s $min_frequency
        } else {
          # AUTO-FREQ-SCALING-02 is for kernel clock minimum
          ::drcv::create_violation AUTO-FREQ-SCALING-02 -dynamic_category [list [list xclbin $clbinary_name]] -REF $clk_ref -s $orig_clk_freq -s $_new_clk_freq -s $min_frequency
        }
      }
      set _new_clk_freq $min_frequency
      return 0 
    }

    # runtime has a hard cap for maximum frequency of 500MHz, it the scaled frequency is larger 
    # than 500, we should cap it to 500.
    # compiler.maxFrequencyLimit
    if { $_new_clk_freq > $max_frequency } {
      puts "INFO: The maximum frequency supported by the runtime is $max_frequency MHz, which this design achieved. The compiler will not select a frequency value higher than the runtime maximum."
      if {[is_drcv]} {
        if {$clk_type eq $ocl_util::System} {
          # AUTO-FREQ-SCALING-06 is for system clock maximum
          ::drcv::create_affirmation AUTO-FREQ-SCALING-06 -s $max_frequency -REF $clk_ref -s $orig_clk_freq -s $_new_clk_freq -actual [list string $_new_clk_freq] -threshold [list string $max_frequency]
        } else {
          if { [check_kernel_count $kernel_counts $clk_id] } {
            # AUTO-FREQ-SCALING-03 is for kernel clock maximum
            ::drcv::create_affirmation AUTO-FREQ-SCALING-03 -s $max_frequency -dynamic_category [list [list xclbin $clbinary_name]] -REF $clk_ref -s $orig_clk_freq -s $_new_clk_freq -actual [list string $_new_clk_freq] -threshold [list string $max_frequency]
          }
        }
      }
      set _new_clk_freq $max_frequency
    }

    # cap the new frequency so that it is not higher than orignal frequency
    if { $_new_clk_freq > $orig_clk_freq } {
      puts "WARNING: The auto scaled frequency '$_new_clk_freq MHz' exceeds the original specified frequency. The compiler will select the original specified frequency of '$orig_clk_freq' MHz."
      if {[is_drcv]} {
        # AUTO-FREQ-SCALING-08
        ::drcv::create_violation AUTO-FREQ-SCALING-08 -dynamic_category [list [list xclbin $clbinary_name]] -REF $clk_ref -s $_new_clk_freq -s $orig_clk_freq
      }
      set _new_clk_freq $orig_clk_freq
    }

    return 1
  }

  proc get_achievable_kernel_freq {sysClkWnsTolerance kernelPinFreqArray sysPinFreqArray failingSysClksDict} {
    upvar $kernelPinFreqArray kernelPinFreqs
    upvar $sysPinFreqArray sysPinFreqs
    upvar $failingSysClksDict failingSysClks

    # initialize combined_pin_freqs
    foreach k_k [array names kernelPinFreqs] {
      set combined_pin_freqs($k_k) $kernelPinFreqs($k_k)
    }
    foreach s_k [array names sysPinFreqs] {
      set combined_pin_freqs($s_k) $sysPinFreqs($s_k)
    }

    #scale clocks
    set ret [get_achievable_kernel_freq_ $sysClkWnsTolerance combined_pin_freqs failingSysClks]
    if { $ret == "0" } {
      return $ret
    }

    #update pin freq arrays
    foreach k_k [array names kernelPinFreqs] {
      set kernelPinFreqs($k_k) $combined_pin_freqs($k_k)
    }
    foreach s_k [array names sysPinFreqs] {
      set sysPinFreqs($s_k) $combined_pin_freqs($s_k)
    }

    return $ret
  }

  # Compute the acheivable kernel frequency
  # Authur: Steven Li 
  # Input: sysClkWnsTolerance: the tolerance in which we consider the system clocks as meeting timing, typical value 0ns or -0.1ns. 
  #        kernelPinFreqArray - array containing the kernel clock pin names and their corresponding the returned scale freq
  #
  # Return: A list of achievable kernel frequencies in MHz unit with 1 decimal point
  #         For each kernel clock pin, compute the achievable kernel frequency, or unchange if the kernel clock pin is not found, or it's not connected to a clock
  #         The computed scaled frequencies are stored in the kernelPinFreqArray
  #         0 if any system clock slack < sysClkWnsTolerance
  #         1 if success

  proc get_achievable_kernel_freq_ {sysClkWnsTolerance kernelPinFreqArray failingSysClksDict} {
    upvar $kernelPinFreqArray kernelPinFreqs
    upvar $failingSysClksDict failingSysClks
    # puts "--- DEBUG: sysClkWnsTolerance is $sysClkWnsTolerance"
    # foreach kernel_pin [array names kernelPinFreqs] {
    #   set new_ocl_freq $kernelPinFreqs($kernel_pin)
    #   puts "--- DEBUG: $kernel_pin : $new_ocl_freq"
    # }

    set kernelClksToScale 0
    set success 1

    foreach kernelClkPin [array names kernelPinFreqs] {
      set pin [get_pins $kernelClkPin]
      if {$pin == ""} {
        # kernel clock pin is unconnected and optimized away
        puts "INFO: Pin $kernelClkPin not found"
        continue
      }

      set clk [get_clocks -of_objects $pin]
      if {$clk == ""} {
        # kernel clock pin is unconnected
        puts "INFO: Pin $pin has no clock"
        continue
      }
      puts "INFO: \[OCL_UTIL\] clock is '$clk' for pin '$pin'"

      # for dynamic platform (due to the dr bd boundary), it is a valid case
      # to NOT have a timing path for the secondary clock (which is used to
      # drive rtl kernel)
      set tps [get_timing_paths -group $clk]
      if {[llength $tps] == 0} {
        # kernel clock does not have timing paths
        puts "INFO: Clock $clk has no timing paths"
        continue
      }
      
      if {[info exists clkToKernelPins($clk)]} {
        lappend clkToKernelPins($clk) $kernelClkPin
      } else {
        set clkToKernelPins($clk) [list $kernelClkPin]
      }

      set kernelPinFreqs($kernelClkPin) 0
      incr kernelClksToScale 1
    }

    # puts "--- DEBUG: kernelClksToScale is $kernelClksToScale"
    # foreach _clk [array names clkToKernelPins] {
    #   set _pins $clkToKernelPins($_clk)
    #   puts "--- DEBUG: kernel clk '$_clk': $_pins"
    # }

    set tps [get_timing_paths -max_paths 1 -sort_by group]

    # tps is already sorted from worst clock to best clock
    # loop through each clock until slack >= sysClkWnsTolerance and the kernel freq is computed
    foreach tp $tps {
      set slk [get_property SLACK $tp]
      set grp [get_property GROUP $tp]
      # puts "--- DEBUG: Path=$tp\n\t Group=$grp Slack=$slk"
      #report_property $tp

      if {$grp == "**async_default**"} {
        continue
      }

      if {$slk < $sysClkWnsTolerance} {
        # puts "--- DEBUG: \$slk < \$sysClkWnsTolerance"
        if {[info exists clkToKernelPins($grp)]} {
          # puts "--- DEBUG: grp '$grp' exists in clkToKernelPins"
          set period [get_property PERIOD [get_clocks [get_property ENDPOINT_CLOCK $tp]]]
          set freq [expr int(10000.0 / ($period - $slk)) / 10.0]
          # puts "--- DEBUG: freq = $freq"

          foreach kernelPin $clkToKernelPins($grp) {
            # puts "--- DEBUG: set kernelPinFreqs($kernelPin) to $freq"
            set kernelPinFreqs($kernelPin) $freq
            incr kernelClksToScale -1
          }
        } else {
          # negative WNS for system clock, cannot scale frequency
          puts "WARNING: cannot scale kernel clocks: the failing system clock is $grp:$slk, the wns tolerance is $sysClkWnsTolerance"
          dict set failingSysClks $grp $slk
          # continue with other clocks until the scaled freq of all kernel clocks are computed
          set success 0
        }
      } else {
        # slack is better than $sysClkWnsTolerance
        # puts "--- DEBUG: \$slk > \$sysClkWnsTolerance"
        if {$kernelClksToScale == 0} {
          return $success
        } else {
          if {[info exists clkToKernelPins($grp)]} {
            # puts "--- DEBUG: grp '$grp' exists in clkToKernelPins"
            # Kernel slack is within the tolerance.  Treat it as 0 so as to compute the target frequency
            if {$slk < 0} {
              set slk 0
            }
            set period [get_property PERIOD [get_clocks [get_property ENDPOINT_CLOCK $tp]]]
            set freq [expr int(10000.0 / ($period - $slk)) / 10.0]
        
            # puts "freq: $freq"

            foreach kernelPin $clkToKernelPins($grp) {
              # puts "--- DEBUG: set kernelPinFreqs($kernelPin) to $freq"
              set kernelPinFreqs($kernelPin) $freq
              incr kernelClksToScale -1
            }
          }
        }
      }
    }

    # all the clocks in kernelPinFreqs should be scaled at this point
    if { $kernelClksToScale > 0 } {
      puts "WARNING: there are $kernelClksToScale clock(s) that couldn't be scaled, scaling algorithm needs to be checked"
      # set success 0
    }

    # Not all kernel clocks are found
    return $success
}

  # round down any number to an integer
  proc round_down {val} {
    set fl [expr {floor($val)}]
    set retval [format "%.0f" $fl]
    return $retval
  }; # end round_down  

  # convert frequency in MHz to period in ns
  proc convert_freq_to_period {freq} {
    return [expr {1000.000 / $freq}]
  }; # end convert_freq_to_period

  # convert period in ns to frequency in MHz
  proc convert_period_to_freq {period} {
    return [expr {1000 / $period}] 
  }; # end convert_period_to_freq

  # initialize clkwiz debug instance run
  proc initialize_clkwiz_debug {} {
    load librdi_iptasks.so
    set partinfo [get_property PART [current_project]]
    Init_Clkwiz [current_project] test1 $partinfo
  }; # end initialize_clkwiz_debug

  # un-initialize clkwiz debug instance run
  proc uninitialize_clkwiz_debug {} {
    UnInit_Clkwiz [current_project] test1
  }; # end uninitialize_clkwiz_debug

  # get property from clkwiz instance
  proc get_clkwiz_prop {prop} {
    set val [GetClkwizProperty [current_project] test1 $prop]
    return $val
  }; # end get_clkwiz_prop

  # set clkwiz instance properties
  proc set_clkwiz_prop {clock_freq_orig clock_freq} {
    SetClkwizProperty [current_project] test1 UseFinePS true 
    # GetClosestSolution <project_name> <instance_name> <requested output frequencies of clks separated by spaces> <requested phases of clocks separated by spaces> <requested duty cycles of clocks separated by spaces> <primary clock frequency> <secondary clock frequency> <number of output clocks> <minimum output jiter used> <non default phase or duty cycle> <primitive (MMCM or PLL)> <debug mode> <clkout XiPhy Enable> <clkout XiPhy Freq>
    GetClosestSolution [current_project] test1 $clock_freq 0 50 $clock_freq_orig 0 1 false false false false false false
  }; # end set_clkwiz_prop

  # create clock constraint(s) on the output pin of mmcm for implementation, overwriting a default generated clock
  proc write_user_impl_clock_constraint {inst dict_clock_freqs steps_log output_dir} {
    set uninit_wiz true
    set user_impl_clk_xdc "_user_impl_clk.xdc"
    set fo_xdc_file [open $output_dir/$user_impl_clk_xdc w]

    foreach clock_name [dict keys $dict_clock_freqs] {
      set dict_clock [dict get $dict_clock_freqs $clock_name]
      set is_user_set [dict get $dict_clock is_user_set]
      if { [string equal -nocase $is_user_set "true" ] } {
        set clock_freq [dict get $dict_clock freq]
        #set clock_freq_orig [dict get $dict_clock freq_orig]
        set outpin_mmcm [get_pins [get_property SOURCE_PINS [get_clocks -of_objects [get_pins $inst/$clock_name]]]]
        set gclock [get_clocks -of_objects [get_pins $outpin_mmcm]]
        set gclock_name [get_property NAME $gclock]
        set inpin_mmcm [get_property SOURCE $gclock]
        set clock_period [get_property PERIOD [get_clocks -of_objects [get_pins $inpin_mmcm]]]  
        set clock_freq_orig [round_down [convert_period_to_freq $clock_period]]
        if { $uninit_wiz } {
          initialize_clkwiz_debug
          set uninit_wiz false
        }
        set_clkwiz_prop $clock_freq_orig $clock_freq
        set clkout0_divide [round_down [get_clkwiz_prop ChosenDiv0]]
        set divclk_divide [round_down [get_clkwiz_prop ChosenD]]
        set divide_by [expr {$clkout0_divide * $divclk_divide}]
        set multiply_by [round_down [get_clkwiz_prop ChosenM]]
    
        # puts "--- DEBUG: write_user_impl_clock_constraint:\n\tcreate_generated_clock -name $gclock_name -divide_by $divide_by -multiply_by $multiply_by -source $inpin_mmcm $outpin_mmcm"
        # create_generated_clock -name $gclock_name -divide_by $divide_by -multiply_by $multiply_by -source $inpin_mmcm $outpin_mmcm
        puts $fo_xdc_file "\n# Kernel clock overridden by user"
        puts $fo_xdc_file "create_generated_clock -name $gclock_name -divide_by $divide_by -multiply_by $multiply_by -source $inpin_mmcm $outpin_mmcm"

        #puts "DBG: $clock_freq_orig, $clock_freq, $gclock_name, $divide_by, $multiply_by, $inpin_mmcm, $outpin_mmcm"
        #create_clock -name USER_$clock_name -period $clock_period $source_pin
      }
    }
    close $fo_xdc_file 
    # read_xdc applies the constraints immediately if a design is open
    # read_xdc behaves same as add_files if there is no open design
    if {$steps_log ne ""} {
      add_to_steps_log $steps_log "internal step: read_xdc $output_dir/$user_impl_clk_xdc" [fileName]:[lineNumber [info frame]]
    }
    read_xdc $output_dir/$user_impl_clk_xdc
    
    if { !$uninit_wiz } {
      uninitialize_clkwiz_debug 
    }
  }; # end write_user_impl_clock_constraint

  # create clock constraint(s) for synthesis, overwriting the default frequency from dsa
  proc write_user_synth_clock_constraint {xdc_file dict_clock_freqs} {
    set fo_xdc_file [open ./$xdc_file a]
    foreach clock_name [dict keys $dict_clock_freqs] {
      set dict_clock [dict get $dict_clock_freqs $clock_name]
      set is_user_set [dict get $dict_clock is_user_set]
      if { [string equal -nocase $is_user_set "true" ] } {
        set clock_freq [dict get $dict_clock freq]
        set clock_period [convert_freq_to_period $clock_freq]
        puts $fo_xdc_file "\n# Kernel clock overridden by user"
        puts $fo_xdc_file "create_clock -name USER_$clock_name -period $clock_period \[get_ports $clock_name\]"
        # puts "--- DEBUG: write_user_synth_clock_constraint:\n\tcreate_clock -name USER_$clock_name -period $clock_period \[get_ports $clock_name\]"
      }
    }
    close $fo_xdc_file 
  }; # end write_user_synth_clock_constraint 

  # generate a resource demand report per ip instance after OOC synth is done 
  proc generate_resource_report { output_dir steps_log } {
    set sdx_all_ips [get_ips -quiet -all -filter "SDX_KERNEL==true"]
    # puts "--- DEBUG: get_ips -quiet -all -filter \"SDX_KERNEL==true\": $sdx_all_ips"
    set size_all_ips [llength $sdx_all_ips]

    if { $size_all_ips > 0 } {
      set resource_usage_report [file join $output_dir "resource.json"]
      add_to_steps_log $steps_log "internal step: generating resource usage report '${resource_usage_report}'" [fileName]:[lineNumber [info frame]]
      set rdata_file [open $resource_usage_report "w"]
      puts $rdata_file "\{"
      puts $rdata_file "    \"Used Resources\": \["
      set index_ip 0

      foreach sdx_ip $sdx_all_ips {
        puts $rdata_file "        \{"
        puts $rdata_file "            \"ip_instance\": \"$sdx_ip\","

        set rdata [get_property dcp_resource_data $sdx_ip]
        # puts "--- DEBUG: get_property dcp_resource_data $sdx_ip: $rdata"
        puts $rdata_file "            \"resources\": \["
        set rdata_list [regexp -all -inline {\S+} $rdata]
        set size_rdata_list [llength $rdata_list]
        if { $size_rdata_list > 0 } {
          set index_rdata 0
          foreach rdata_item $rdata_list {
            incr index_rdata
            set is_odd [expr {($index_rdata % 2) != 0}]
            if { $is_odd } {
              puts $rdata_file "                \{"
              puts -nonewline $rdata_file "                    \"$rdata_item\": "
            } else {
              puts $rdata_file "\"$rdata_item\""
              if { $index_rdata == $size_rdata_list } {
                puts $rdata_file "                \}"
              } else {
                puts $rdata_file "                \},"
              }
            }
          }
        }
        puts $rdata_file "            \]"
        #puts "--- DEBUG: reporting IP properties of $sdx_ip"
        #report_property $sdx_ip

        incr index_ip
        if { $index_ip == $size_all_ips } {
          puts $rdata_file "        \}"
        } else {
          puts $rdata_file "        \},"
        }
      }

      puts $rdata_file "    \]"
      puts $rdata_file "\}"
      close $rdata_file
    }
  }; # end generate_resource_report 

}; # end namespace

