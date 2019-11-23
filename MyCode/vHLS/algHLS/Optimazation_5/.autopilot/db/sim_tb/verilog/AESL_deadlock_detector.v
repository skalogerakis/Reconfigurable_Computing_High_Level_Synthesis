`timescale 1 ns / 1 ps

module AESL_deadlock_detector (
    input reset,
    input clock);

    wire [0:0] proc_dep_vld_vec_0;
    reg [0:0] proc_dep_vld_vec_0_reg;
    wire [0:0] in_chan_dep_vld_vec_0;
    wire [1:0] in_chan_dep_data_vec_0;
    wire [0:0] token_in_vec_0;
    wire [0:0] out_chan_dep_vld_vec_0;
    wire [1:0] out_chan_dep_data_0;
    wire [0:0] token_out_vec_0;
    wire dl_detect_out_0;
    wire dep_chan_vld_1_0;
    wire [1:0] dep_chan_data_1_0;
    wire token_1_0;
    wire [0:0] proc_dep_vld_vec_1;
    reg [0:0] proc_dep_vld_vec_1_reg;
    wire [0:0] in_chan_dep_vld_vec_1;
    wire [1:0] in_chan_dep_data_vec_1;
    wire [0:0] token_in_vec_1;
    wire [0:0] out_chan_dep_vld_vec_1;
    wire [1:0] out_chan_dep_data_1;
    wire [0:0] token_out_vec_1;
    wire dl_detect_out_1;
    wire dep_chan_vld_0_1;
    wire [1:0] dep_chan_data_0_1;
    wire token_0_1;
    wire [1:0] dl_in_vec;
    wire dl_detect_out;
    wire [1:0] origin;
    wire token_clear;

    reg ap_done_reg_0;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            ap_done_reg_0 <= 'b0;
        end
        else begin
            ap_done_reg_0 <= AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_done;
        end
    end

    // delay ap_idle for one cycle
    reg [0:0] AESL_inst_myFuncAccel$Block_codeRepl50_pro_U0$ap_idle;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            AESL_inst_myFuncAccel$Block_codeRepl50_pro_U0$ap_idle <= 'b0;
        end
        else begin
            AESL_inst_myFuncAccel$Block_codeRepl50_pro_U0$ap_idle <= AESL_inst_myFuncAccel.Block_codeRepl50_pro_U0.ap_idle;
        end
    end
    // Process: AESL_inst_myFuncAccel.Block_codeRepl50_pro_U0
    AESL_deadlock_detect_unit #(2, 0, 1, 1) AESL_deadlock_detect_unit_0 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_0),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_0),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_0),
        .token_in_vec(token_in_vec_0),
        .dl_detect_in(dl_detect_out),
        .origin(origin[0]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_0),
        .out_chan_dep_data(out_chan_dep_data_0),
        .token_out_vec(token_out_vec_0),
        .dl_detect_out(dl_in_vec[0]));

    assign proc_dep_vld_vec_0[0] = dl_detect_out ? proc_dep_vld_vec_0_reg[0] : (((AESL_inst_myFuncAccel.Block_codeRepl50_pro_U0_ap_ready_count[0]) & AESL_inst_myFuncAccel.Block_codeRepl50_pro_U0.ap_idle & ~(AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0_ap_ready_count[0])));
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_0_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_0_reg <= proc_dep_vld_vec_0;
        end
    end
    assign in_chan_dep_vld_vec_0[0] = dep_chan_vld_1_0;
    assign in_chan_dep_data_vec_0[1 : 0] = dep_chan_data_1_0;
    assign token_in_vec_0[0] = token_1_0;
    assign dep_chan_vld_0_1 = out_chan_dep_vld_vec_0[0];
    assign dep_chan_data_0_1 = out_chan_dep_data_0;
    assign token_0_1 = token_out_vec_0[0];

    // delay ap_idle for one cycle
    reg [0:0] AESL_inst_myFuncAccel$Loop_sizeLoop_proc_U0$ap_idle;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            AESL_inst_myFuncAccel$Loop_sizeLoop_proc_U0$ap_idle <= 'b0;
        end
        else begin
            AESL_inst_myFuncAccel$Loop_sizeLoop_proc_U0$ap_idle <= AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle;
        end
    end
    // Process: AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0
    AESL_deadlock_detect_unit #(2, 1, 1, 1) AESL_deadlock_detect_unit_1 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_1),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_1),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_1),
        .token_in_vec(token_in_vec_1),
        .dl_detect_in(dl_detect_out),
        .origin(origin[1]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_1),
        .out_chan_dep_data(out_chan_dep_data_1),
        .token_out_vec(token_out_vec_1),
        .dl_detect_out(dl_in_vec[1]));

    assign proc_dep_vld_vec_1[0] = dl_detect_out ? proc_dep_vld_vec_1_reg[0] : (~AESL_inst_myFuncAccel.data0_load_loc_chann_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_loc_chann_U.if_write | ~AESL_inst_myFuncAccel.data0_load_1_loc_cha_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_1_loc_cha_U.if_write | ~AESL_inst_myFuncAccel.data0_load_2_loc_cha_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_2_loc_cha_U.if_write | ~AESL_inst_myFuncAccel.data0_load_3_loc_cha_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_3_loc_cha_U.if_write | ~AESL_inst_myFuncAccel.data0_load_4_loc_cha_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_4_loc_cha_U.if_write | ~AESL_inst_myFuncAccel.data0_load_5_loc_cha_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_5_loc_cha_U.if_write | ~AESL_inst_myFuncAccel.data0_load_6_loc_cha_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_6_loc_cha_U.if_write | ~AESL_inst_myFuncAccel.data0_load_7_loc_cha_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_7_loc_cha_U.if_write | ~AESL_inst_myFuncAccel.data0_load_8_loc_cha_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_8_loc_cha_U.if_write | ~AESL_inst_myFuncAccel.data0_load_9_loc_cha_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_9_loc_cha_U.if_write | ~AESL_inst_myFuncAccel.data0_load_10_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_10_loc_ch_U.if_write | ~AESL_inst_myFuncAccel.data0_load_11_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_11_loc_ch_U.if_write | ~AESL_inst_myFuncAccel.data0_load_12_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_12_loc_ch_U.if_write | ~AESL_inst_myFuncAccel.data0_load_13_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_13_loc_ch_U.if_write | ~AESL_inst_myFuncAccel.data0_load_14_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_14_loc_ch_U.if_write | ~AESL_inst_myFuncAccel.data0_load_15_loc_ch_U.if_empty_n & (AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_ready | AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle) & ~AESL_inst_myFuncAccel.data0_load_15_loc_ch_U.if_write | ((AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0_ap_ready_count[0]) & AESL_inst_myFuncAccel.Loop_sizeLoop_proc_U0.ap_idle & ~(AESL_inst_myFuncAccel.Block_codeRepl50_pro_U0_ap_ready_count[0])));
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_1_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_1_reg <= proc_dep_vld_vec_1;
        end
    end
    assign in_chan_dep_vld_vec_1[0] = dep_chan_vld_0_1;
    assign in_chan_dep_data_vec_1[1 : 0] = dep_chan_data_0_1;
    assign token_in_vec_1[0] = token_0_1;
    assign dep_chan_vld_1_0 = out_chan_dep_vld_vec_1[0];
    assign dep_chan_data_1_0 = out_chan_dep_data_1;
    assign token_1_0 = token_out_vec_1[0];


    AESL_deadlock_report_unit #(2) AESL_deadlock_report_unit_inst (
        .reset(reset),
        .clock(clock),
        .dl_in_vec(dl_in_vec),
        .dl_detect_out(dl_detect_out),
        .origin(origin),
        .token_clear(token_clear));

endmodule
