`timescale 1 ns / 1 ps

module AESL_deadlock_report_unit #( parameter PROC_NUM = 4 ) (
    input reset,
    input clock,
    input [PROC_NUM - 1:0] dl_in_vec,
    output dl_detect_out,
    output reg [PROC_NUM - 1:0] origin,
    output token_clear);
   
    // FSM states
    localparam ST_IDLE = 2'b0;
    localparam ST_DL_DETECTED = 2'b1;
    localparam ST_DL_REPORT = 2'b10;

    reg [1:0] CS_fsm;
    reg [1:0] NS_fsm;
    reg [PROC_NUM - 1:0] dl_detect_reg;
    reg [PROC_NUM - 1:0] dl_done_reg;
    reg [PROC_NUM - 1:0] origin_reg;
    reg [PROC_NUM - 1:0] dl_in_vec_reg;
    integer i;

    // FSM State machine
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            CS_fsm <= ST_IDLE;
        end
        else begin
            CS_fsm <= NS_fsm;
        end
    end
    always @ (CS_fsm or dl_in_vec or dl_detect_reg or dl_done_reg or dl_in_vec or origin_reg) begin
        NS_fsm = CS_fsm;
        case (CS_fsm)
            ST_IDLE : begin
                if (|dl_in_vec) begin
                    NS_fsm = ST_DL_DETECTED;
                end
            end
            ST_DL_DETECTED: begin
                // has unreported deadlock circle
                if (dl_detect_reg != dl_done_reg) begin
                    NS_fsm = ST_DL_REPORT;
                end
            end
            ST_DL_REPORT: begin
                if (|(dl_in_vec & origin_reg)) begin
                    NS_fsm = ST_DL_DETECTED;
                end
            end
        endcase
    end

    // dl_detect_reg record the procs that first detect deadlock
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            dl_detect_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_IDLE) begin
                dl_detect_reg <= dl_in_vec;
            end
        end
    end

    // dl_detect_out keeps in high after deadlock detected
    assign dl_detect_out = |dl_detect_reg;

    // dl_done_reg record the circles has been reported
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            dl_done_reg <= 'b0;
        end
        else begin
            if ((CS_fsm == ST_DL_REPORT) && (|(dl_in_vec & dl_detect_reg) == 'b1)) begin
                dl_done_reg <= dl_done_reg | dl_in_vec;
            end
        end
    end

    // clear token once a circle is done
    assign token_clear = (CS_fsm == ST_DL_REPORT) ? ((|(dl_in_vec & origin_reg)) ? 'b1 : 'b0) : 'b0;

    // origin_reg record the current circle start id
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            origin_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_DL_DETECTED) begin
                origin_reg <= origin;
            end
        end
    end
   
    // origin will be valid for only one cycle
    always @ (CS_fsm or dl_detect_reg or dl_done_reg) begin
        origin = 'b0;
        if (CS_fsm == ST_DL_DETECTED) begin
            for (i = 0; i < PROC_NUM; i = i + 1) begin
                if (dl_detect_reg[i] & ~dl_done_reg[i] & ~(|origin)) begin
                    origin = 'b1 << i;
                end
            end
        end
    end
    
    // dl_in_vec_reg record the current circle dl_in_vec
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            dl_in_vec_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_DL_DETECTED) begin
                dl_in_vec_reg <= origin;
            end
            else if (CS_fsm == ST_DL_REPORT) begin
                dl_in_vec_reg <= dl_in_vec;
            end
        end
    end
    
    // get the first valid proc index in dl vector
    function integer proc_index(input [PROC_NUM - 1:0] dl_vec);
        begin
            proc_index = 0;
            for (i = 0; i < PROC_NUM; i = i + 1) begin
                if (dl_vec[i]) begin
                    proc_index = i;
                end
            end
        end
    endfunction

    // get the proc path based on dl vector
    function [360:0] proc_path(input [PROC_NUM - 1:0] dl_vec);
        integer index;
        begin
            index = proc_index(dl_vec);
            case (index)
                0 : begin
                    proc_path = "myFuncAccel.Block_codeRepl93_pro_U0";
                end
                1 : begin
                    proc_path = "myFuncAccel.Loop_sizeLoop_proc_U0";
                end
                default : begin
                    proc_path = "unknown";
                end
            endcase
        end
    endfunction

    // print the headlines of deadlock detection
    task print_dl_head;
        begin
            $display("\n//////////////////////////////////////////////////////////////////////////////");
            $display("// ERROR!!! DEADLOCK DETECTED at %0t ns! SIMULATION WILL BE STOPPED! //", $time);
            $display("//////////////////////////////////////////////////////////////////////////////");
        end
    endtask

    // print the start of a circle
    task print_circle_start(input reg [360:0] proc_path, input integer circle_id);
        begin
            $display("/////////////////////////");
            $display("// Dependence circle %0d:", circle_id);
            $display("// (1): Process: %0s", proc_path);
        end
    endtask

    // print the end of deadlock detection
    task print_dl_end(input integer num);
        begin
            $display("////////////////////////////////////////////////////////////////////////");
            $display("// Totally %0d circles detected!", num);
            $display("////////////////////////////////////////////////////////////////////////");
        end
    endtask

    // print one proc component in the circle
    task print_circle_proc_comp(input reg [360:0] proc_path, input integer circle_comp_id);
        begin
            $display("// (%0d): Process: %0s", circle_comp_id, proc_path);
        end
    endtask

    // print one channel component in the circle
    task print_circle_chan_comp(input [PROC_NUM - 1:0] dl_vec1, input [PROC_NUM - 1:0] dl_vec2);
        reg [352:0] chan_path;
        integer index1;
        integer index2;
        begin
            index1 = proc_index(dl_vec1);
            index2 = proc_index(dl_vec2);
            case (index1)
                0 : begin
                    case(index2)
                    1: begin
                        if (~AESL_inst_myFuncAccel.empty_U.i_full_n & AESL_inst_myFuncAccel.Block_codeRepl93_pro_U0.ap_done & deadlock_detector.ap_done_reg_0 & ~AESL_inst_myFuncAccel.empty_U.t_read) begin
                            chan_path = "myFuncAccel.empty_U";
                            if (~AESL_inst_myFuncAccel.empty_U.t_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.empty_U.i_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (((AESL_inst_myFuncAccel.Block_codeRepl93_pro_U0_ap_ready_count[0]) & AESL_inst_myFuncAccel.Block_codeRepl93_pro_U0.ap_idle & ~(AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0_ap_ready_count[0]))) begin
                            chan_path = "";
                            if (((AESL_inst_myFuncAccel.Block_codeRepl93_pro_U0_ap_ready_count[0]) & AESL_inst_myFuncAccel.Block_codeRepl93_pro_U0.ap_idle & ~(AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0_ap_ready_count[0]))) begin
                                $display("//      Deadlocked by sync logic between input processes");
                                $display("//      Please increase channel depth");
                            end
                        end
                    end
                    endcase
                end
                1 : begin
                    case(index2)
                    0: begin
                        if (~AESL_inst_myFuncAccel.empty_U.t_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.empty_U.i_write) begin
                            chan_path = "myFuncAccel.empty_U";
                            if (~AESL_inst_myFuncAccel.empty_U.t_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.empty_U.i_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_6_loc_cha_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_6_loc_cha_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_6_loc_cha_U";
                            if (~AESL_inst_myFuncAccel.data0_load_6_loc_cha_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_6_loc_cha_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_7_loc_cha_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_7_loc_cha_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_7_loc_cha_U";
                            if (~AESL_inst_myFuncAccel.data0_load_7_loc_cha_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_7_loc_cha_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_8_loc_cha_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_8_loc_cha_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_8_loc_cha_U";
                            if (~AESL_inst_myFuncAccel.data0_load_8_loc_cha_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_8_loc_cha_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_9_loc_cha_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_9_loc_cha_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_9_loc_cha_U";
                            if (~AESL_inst_myFuncAccel.data0_load_9_loc_cha_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_9_loc_cha_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_10_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_10_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_10_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_10_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_10_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_11_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_11_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_11_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_11_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_11_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_12_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_12_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_12_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_12_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_12_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_13_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_13_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_13_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_13_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_13_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_14_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_14_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_14_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_14_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_14_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_15_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_15_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_15_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_15_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_15_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_16_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_16_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_16_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_16_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_16_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_17_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_17_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_17_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_17_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_17_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_18_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_18_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_18_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_18_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_18_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_19_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_19_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_19_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_19_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_19_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_20_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_20_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_20_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_20_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_20_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_21_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_21_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_21_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_21_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_21_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_22_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_22_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_22_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_22_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_22_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_23_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_23_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_23_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_23_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_23_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_24_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_24_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_24_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_24_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_24_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_25_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_25_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_25_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_25_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_25_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_26_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_26_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_26_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_26_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_26_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_27_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_27_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_27_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_27_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_27_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_28_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_28_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_28_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_28_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_28_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_29_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_29_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_29_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_29_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_29_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_30_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_30_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_30_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_30_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_30_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_31_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_31_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_31_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_31_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_31_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_32_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_32_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_32_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_32_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_32_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_33_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_33_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_33_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_33_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_33_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_34_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_34_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_34_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_34_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_34_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_35_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_35_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_35_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_35_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_35_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_36_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_36_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_36_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_36_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_36_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_37_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_37_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_37_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_37_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_37_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_38_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_38_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_38_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_38_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_38_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_39_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_39_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_39_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_39_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_39_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_40_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_40_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_40_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_40_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_40_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_41_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_41_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_41_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_41_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_41_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_42_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_42_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_42_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_42_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_42_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_43_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_43_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_43_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_43_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_43_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_44_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_44_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_44_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_44_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_44_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_45_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_45_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_45_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_45_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_45_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_46_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_46_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_46_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_46_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_46_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_47_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_47_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_47_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_47_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_47_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_48_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_48_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_48_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_48_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_48_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_49_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_49_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_49_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_49_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_49_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_50_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_50_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_50_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_50_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_50_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_51_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_51_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_51_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_51_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_51_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_52_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_52_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_52_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_52_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_52_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_53_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_53_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_53_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_53_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_53_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_54_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_54_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_54_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_54_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_54_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_55_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_55_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_55_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_55_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_55_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_56_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_56_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_56_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_56_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_56_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_57_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_57_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_57_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_57_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_57_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_58_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_58_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_58_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_58_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_58_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_59_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_59_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_59_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_59_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_59_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_60_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_60_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_60_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_60_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_60_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_61_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_61_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_61_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_61_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_61_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_62_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_62_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_62_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_62_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_62_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_63_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_63_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_63_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_63_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_63_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_64_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_64_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_64_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_64_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_64_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_65_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_65_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_65_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_65_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_65_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_66_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_66_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_66_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_66_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_66_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_67_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_67_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_67_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_67_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_67_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_68_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_68_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_68_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_68_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_68_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_69_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_69_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_69_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_69_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_69_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_70_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_70_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_70_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_70_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_70_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_71_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_71_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_71_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_71_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_71_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_72_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_72_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_72_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_72_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_72_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_73_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_73_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_73_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_73_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_73_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_74_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_74_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_74_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_74_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_74_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_75_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_75_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_75_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_75_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_75_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_76_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_76_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_76_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_76_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_76_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_77_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_77_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_77_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_77_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_77_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_78_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_78_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_78_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_78_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_78_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_79_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_79_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_79_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_79_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_79_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_80_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_80_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_80_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_80_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_80_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_81_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_81_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_81_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_81_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_81_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_82_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_82_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_82_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_82_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_82_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_83_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_83_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_83_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_83_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_83_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_84_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_84_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_84_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_84_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_84_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_85_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_85_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_85_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_85_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_85_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_86_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_86_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_86_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_86_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_86_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_87_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_87_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_87_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_87_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_87_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_88_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_88_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_88_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_88_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_88_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_89_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_89_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_89_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_89_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_89_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_90_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_90_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_90_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_90_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_90_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_91_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_91_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_91_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_91_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_91_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_92_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_92_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_92_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_92_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_92_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_93_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_93_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_93_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_93_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_93_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_94_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_94_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_94_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_94_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_94_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_95_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_95_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_95_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_95_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_95_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_96_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_96_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_96_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_96_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_96_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_97_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_97_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_97_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_97_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_97_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_98_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_98_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_98_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_98_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_98_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_99_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_99_loc_ch_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_99_loc_ch_U";
                            if (~AESL_inst_myFuncAccel.data0_load_99_loc_ch_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_99_loc_ch_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_100_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_100_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_100_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_100_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_100_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_101_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_101_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_101_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_101_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_101_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_102_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_102_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_102_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_102_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_102_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_103_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_103_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_103_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_103_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_103_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_104_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_104_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_104_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_104_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_104_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_105_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_105_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_105_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_105_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_105_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_106_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_106_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_106_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_106_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_106_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_107_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_107_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_107_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_107_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_107_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_108_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_108_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_108_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_108_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_108_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_109_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_109_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_109_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_109_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_109_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_110_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_110_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_110_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_110_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_110_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_111_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_111_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_111_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_111_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_111_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_112_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_112_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_112_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_112_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_112_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_113_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_113_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_113_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_113_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_113_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_114_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_114_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_114_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_114_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_114_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_115_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_115_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_115_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_115_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_115_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_116_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_116_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_116_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_116_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_116_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_117_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_117_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_117_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_117_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_117_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_118_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_118_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_118_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_118_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_118_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_119_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_119_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_119_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_119_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_119_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_120_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_120_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_120_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_120_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_120_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_121_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_121_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_121_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_121_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_121_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_122_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_122_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_122_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_122_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_122_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_123_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_123_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_123_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_123_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_123_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_124_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_124_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_124_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_124_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_124_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_125_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_125_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_125_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_125_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_125_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_126_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_126_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_126_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_126_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_126_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_127_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_127_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_127_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_127_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_127_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_128_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_128_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_128_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_128_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_128_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_129_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_129_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_129_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_129_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_129_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_130_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_130_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_130_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_130_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_130_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_131_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_131_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_131_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_131_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_131_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_132_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_132_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_132_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_132_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_132_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_133_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_133_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_133_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_133_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_133_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_134_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_134_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_134_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_134_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_134_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_135_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_135_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_135_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_135_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_135_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_136_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_136_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_136_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_136_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_136_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_137_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_137_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_137_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_137_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_137_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_138_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_138_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_138_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_138_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_138_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_139_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_139_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_139_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_139_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_139_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_140_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_140_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_140_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_140_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_140_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_141_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_141_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_141_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_141_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_141_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_142_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_142_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_142_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_142_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_142_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_143_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_143_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_143_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_143_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_143_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_144_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_144_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_144_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_144_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_144_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_145_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_145_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_145_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_145_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_145_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_146_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_146_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_146_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_146_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_146_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_147_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_147_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_147_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_147_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_147_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_148_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_148_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_148_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_148_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_148_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_149_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_149_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_149_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_149_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_149_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_150_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_150_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_150_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_150_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_150_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_151_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_151_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_151_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_151_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_151_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_152_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_152_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_152_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_152_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_152_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_153_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_153_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_153_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_153_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_153_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_154_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_154_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_154_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_154_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_154_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_155_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_155_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_155_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_155_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_155_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_156_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_156_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_156_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_156_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_156_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_157_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_157_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_157_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_157_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_157_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_158_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_158_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_158_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_158_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_158_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_159_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_159_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_159_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_159_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_159_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_160_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_160_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_160_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_160_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_160_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_161_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_161_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_161_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_161_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_161_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_162_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_162_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_162_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_162_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_162_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_163_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_163_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_163_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_163_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_163_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_164_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_164_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_164_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_164_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_164_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_165_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_165_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_165_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_165_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_165_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_166_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_166_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_166_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_166_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_166_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_167_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_167_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_167_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_167_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_167_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_168_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_168_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_168_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_168_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_168_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_169_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_169_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_169_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_169_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_169_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_170_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_170_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_170_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_170_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_170_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_171_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_171_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_171_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_171_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_171_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_172_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_172_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_172_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_172_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_172_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_173_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_173_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_173_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_173_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_173_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_174_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_174_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_174_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_174_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_174_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_175_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_175_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_175_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_175_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_175_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_176_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_176_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_176_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_176_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_176_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_177_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_177_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_177_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_177_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_177_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_178_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_178_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_178_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_178_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_178_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_179_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_179_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_179_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_179_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_179_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_180_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_180_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_180_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_180_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_180_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_181_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_181_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_181_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_181_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_181_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_182_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_182_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_182_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_182_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_182_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_183_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_183_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_183_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_183_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_183_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_184_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_184_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_184_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_184_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_184_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_185_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_185_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_185_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_185_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_185_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_186_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_186_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_186_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_186_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_186_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_187_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_187_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_187_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_187_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_187_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_188_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_188_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_188_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_188_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_188_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_189_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_189_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_189_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_189_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_189_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_190_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_190_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_190_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_190_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_190_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_191_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_191_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_191_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_191_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_191_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_192_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_192_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_192_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_192_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_192_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_193_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_193_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_193_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_193_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_193_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_194_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_194_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_194_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_194_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_194_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_195_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_195_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_195_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_195_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_195_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_196_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_196_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_196_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_196_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_196_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_197_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_197_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_197_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_197_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_197_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_198_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_198_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_198_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_198_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_198_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_199_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_199_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_199_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_199_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_199_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_200_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_200_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_200_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_200_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_200_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_201_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_201_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_201_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_201_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_201_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_202_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_202_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_202_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_202_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_202_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_203_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_203_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_203_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_203_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_203_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_204_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_204_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_204_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_204_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_204_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_205_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_205_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_205_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_205_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_205_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_206_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_206_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_206_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_206_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_206_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_207_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_207_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_207_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_207_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_207_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_208_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_208_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_208_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_208_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_208_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_209_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_209_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_209_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_209_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_209_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_210_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_210_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_210_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_210_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_210_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_211_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_211_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_211_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_211_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_211_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_212_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_212_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_212_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_212_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_212_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_213_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_213_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_213_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_213_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_213_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_214_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_214_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_214_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_214_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_214_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_215_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_215_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_215_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_215_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_215_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_216_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_216_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_216_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_216_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_216_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_217_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_217_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_217_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_217_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_217_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_218_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_218_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_218_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_218_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_218_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_219_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_219_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_219_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_219_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_219_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_220_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_220_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_220_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_220_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_220_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_221_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_221_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_221_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_221_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_221_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_222_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_222_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_222_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_222_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_222_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_223_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_223_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_223_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_223_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_223_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_224_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_224_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_224_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_224_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_224_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_225_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_225_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_225_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_225_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_225_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_226_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_226_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_226_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_226_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_226_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_227_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_227_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_227_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_227_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_227_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_228_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_228_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_228_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_228_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_228_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_229_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_229_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_229_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_229_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_229_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_230_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_230_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_230_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_230_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_230_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_231_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_231_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_231_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_231_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_231_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_232_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_232_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_232_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_232_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_232_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_233_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_233_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_233_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_233_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_233_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_234_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_234_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_234_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_234_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_234_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_235_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_235_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_235_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_235_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_235_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_236_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_236_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_236_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_236_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_236_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_237_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_237_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_237_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_237_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_237_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_238_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_238_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_238_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_238_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_238_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_239_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_239_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_239_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_239_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_239_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_240_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_240_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_240_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_240_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_240_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_241_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_241_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_241_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_241_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_241_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_242_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_242_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_242_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_242_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_242_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_243_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_243_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_243_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_243_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_243_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_244_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_244_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_244_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_244_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_244_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_245_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_245_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_245_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_245_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_245_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_246_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_246_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_246_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_246_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_246_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_247_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_247_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_247_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_247_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_247_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_248_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_248_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_248_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_248_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_248_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_249_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_249_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_249_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_249_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_249_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_250_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_250_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_250_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_250_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_250_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_251_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_251_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_251_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_251_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_251_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_252_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_252_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_252_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_252_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_252_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_253_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_253_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_253_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_253_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_253_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_254_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_254_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_254_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_254_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_254_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (~AESL_inst_myFuncAccel.data0_load_255_loc_c_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_255_loc_c_U.if_write) begin
                            chan_path = "myFuncAccel.data0_load_255_loc_c_U";
                            if (~AESL_inst_myFuncAccel.data0_load_255_loc_c_U.if_empty_n) begin
                                $display("//      Channel: %0s, EMPTY", chan_path);
                            end
                            else if (~AESL_inst_myFuncAccel.data0_load_255_loc_c_U.if_full_n) begin
                                $display("//      Channel: %0s, FULL", chan_path);
                            end
                            else begin
                                $display("//      Channel: %0s", chan_path);
                            end
                        end
                        if (((AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0_ap_ready_count[0]) & AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle & ~(AESL_inst_myFuncAccel.Block_codeRepl93_pro_U0_ap_ready_count[0]))) begin
                            chan_path = "";
                            if (((AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0_ap_ready_count[0]) & AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle & ~(AESL_inst_myFuncAccel.Block_codeRepl93_pro_U0_ap_ready_count[0]))) begin
                                $display("//      Deadlocked by sync logic between input processes");
                                $display("//      Please increase channel depth");
                            end
                        end
                    end
                    endcase
                end
            endcase
        end
    endtask

    // report
    initial begin : report_deadlock
        integer circle_id;
        integer circle_comp_id;
        wait (reset == 1);
        circle_id = 1;
        while (1) begin
            @ (negedge clock);
            case (CS_fsm)
                ST_DL_DETECTED: begin
                    circle_comp_id = 2;
                    if (dl_detect_reg != dl_done_reg) begin
                        if (dl_done_reg == 'b0) begin
                            print_dl_head;
                        end
                        print_circle_start(proc_path(origin), circle_id);
                        circle_id = circle_id + 1;
                    end
                    else begin
                        print_dl_end(circle_id - 1);
                        $finish;
                    end
                end
                ST_DL_REPORT: begin
                    if ((|(dl_in_vec)) & ~(|(dl_in_vec & origin_reg))) begin
                        print_circle_chan_comp(dl_in_vec_reg, dl_in_vec);
                        print_circle_proc_comp(proc_path(dl_in_vec), circle_comp_id);
                        circle_comp_id = circle_comp_id + 1;
                    end
                    else begin
                        print_circle_chan_comp(dl_in_vec_reg, dl_in_vec);
                    end
                end
            endcase
        end
    end
 
endmodule
