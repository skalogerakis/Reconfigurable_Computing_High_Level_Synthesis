#include "cf_lib.h"
#include "cf_request.h"
#include "accel_info.h"
#include "sds_lib.h"
#include "sds_trace.h"
#include "portinfo.h"
#include <stdio.h>  // for printf
#include <stdlib.h> // for exit
#include "xlnk_core_cf.h"
#include "axi_dma_simple_dm.h"
#include "axi_lite_dm.h"
#include "sysport_info.h"

sysport_info_t _sds_sysportp_0_ps7_S_AXI_HP0 = {
  .name = "ps7_S_AXI_HP0",
  .id = 1,
  .address_space = 0,
  .cmd_type = sysport_commands_type_non_coherent,
};

sysport_info_t _sds_sysportp_0_ps7_S_AXI_HP1 = {
  .name = "ps7_S_AXI_HP1",
  .id = 2,
  .address_space = 0,
  .cmd_type = sysport_commands_type_non_coherent,
};

sysport_info_t _sds_sysportp_0_ps7_S_AXI_HP2 = {
  .name = "ps7_S_AXI_HP2",
  .id = 3,
  .address_space = 0,
  .cmd_type = sysport_commands_type_non_coherent,
};

accel_info_t _sds_p_0_myFuncAccel_1 = {
  .device_id = 3,
  .phys_base_addr = 0x43c00000,
  .addr_range = 0x10000,
  .func_name = "myFuncAccel_1",
  .ip_type = "axis_acc_adapter",
};

axi_dma_simple_info_t p_0_dm_0 = {
  .name = "dm_0",
  .phys_base_addr = 0x40400000,
  .addr_range = 0x10000,
  .device_id = 0,
  .dir = XLNK_DMA_TO_DEV,
  .irq = -1,
  .data_sysport = &_sds_sysportp_0_ps7_S_AXI_HP1,
  .data_width = 64,
};

axi_dma_simple_info_t p_0_dm_1 = {
  .name = "dm_1",
  .phys_base_addr = 0x40410000,
  .addr_range = 0x10000,
  .device_id = 1,
  .dir = XLNK_DMA_TO_DEV,
  .irq = -1,
  .data_sysport = &_sds_sysportp_0_ps7_S_AXI_HP0,
  .data_width = 64,
};

axi_dma_simple_info_t p_0_dm_2 = {
  .name = "dm_2",
  .phys_base_addr = 0x40420000,
  .addr_range = 0x10000,
  .device_id = 2,
  .dir = XLNK_DMA_FROM_DEV,
  .irq = -1,
  .data_sysport = &_sds_sysportp_0_ps7_S_AXI_HP2,
  .data_width = 64,
};

int p_0_hwinst_myFuncAccel_1_cmd_myFuncAccel_sg_list[] = {0x8};

axi_lite_info_t p_0_hwinst_myFuncAccel_1_cmd_myFuncAccel_info = {
  .phys_base_addr = 0x43c00000,
  .data_reg_offset = p_0_hwinst_myFuncAccel_1_cmd_myFuncAccel_sg_list,
  .data_reg_sg_size = 1,
  .write_status_reg_offset = 0x0,
  .read_status_reg_offset = 0x0,
  .config = XLNK_AXI_LITE_SG |
    XLNK_AXI_LITE_STAT_REG_READ(XLNK_AXI_LITE_STAT_REG_NOCHECK) |
    XLNK_AXI_LITE_STAT_REG_WRITE(XLNK_AXI_LITE_STAT_REG_NOCHECK),
  .acc_info = &_sds_p_0_myFuncAccel_1,
};

int p_0_hwinst_myFuncAccel_1_size_sg_list[] = {0xc};

axi_lite_info_t p_0_hwinst_myFuncAccel_1_size_info = {
  .phys_base_addr = 0x43c00000,
  .data_reg_offset = p_0_hwinst_myFuncAccel_1_size_sg_list,
  .data_reg_sg_size = 1,
  .write_status_reg_offset = 0x40c,
  .read_status_reg_offset = 0x0,
  .config = XLNK_AXI_LITE_KEYHOLE |
    XLNK_AXI_LITE_STAT_REG_READ(XLNK_AXI_LITE_STAT_REG_NONE) |
    XLNK_AXI_LITE_STAT_REG_WRITE(XLNK_AXI_LITE_STAT_REG_QUEUING),
  .acc_info = &_sds_p_0_myFuncAccel_1,
};

int p_0_hwinst_myFuncAccel_1_dim_sg_list[] = {0x10};

axi_lite_info_t p_0_hwinst_myFuncAccel_1_dim_info = {
  .phys_base_addr = 0x43c00000,
  .data_reg_offset = p_0_hwinst_myFuncAccel_1_dim_sg_list,
  .data_reg_sg_size = 1,
  .write_status_reg_offset = 0x410,
  .read_status_reg_offset = 0x0,
  .config = XLNK_AXI_LITE_KEYHOLE |
    XLNK_AXI_LITE_STAT_REG_READ(XLNK_AXI_LITE_STAT_REG_NONE) |
    XLNK_AXI_LITE_STAT_REG_WRITE(XLNK_AXI_LITE_STAT_REG_QUEUING),
  .acc_info = &_sds_p_0_myFuncAccel_1,
};

int p_0_hwinst_myFuncAccel_1_threshold_sg_list[] = {0x14};

axi_lite_info_t p_0_hwinst_myFuncAccel_1_threshold_info = {
  .phys_base_addr = 0x43c00000,
  .data_reg_offset = p_0_hwinst_myFuncAccel_1_threshold_sg_list,
  .data_reg_sg_size = 1,
  .write_status_reg_offset = 0x414,
  .read_status_reg_offset = 0x0,
  .config = XLNK_AXI_LITE_KEYHOLE |
    XLNK_AXI_LITE_STAT_REG_READ(XLNK_AXI_LITE_STAT_REG_NONE) |
    XLNK_AXI_LITE_STAT_REG_WRITE(XLNK_AXI_LITE_STAT_REG_QUEUING),
  .acc_info = &_sds_p_0_myFuncAccel_1,
};

struct p_0_hwblk_myFuncAccel p_0_hwinst_myFuncAccel_1 = {
  .cmd_myFuncAccel = { .base = { .channel_info = &p_0_hwinst_myFuncAccel_1_cmd_myFuncAccel_info}, 
    .send_i = &axi_lite_send },
  .size = { .base = { .channel_info = &p_0_hwinst_myFuncAccel_1_size_info}, 
    .send_i = &axi_lite_send },
  .dim = { .base = { .channel_info = &p_0_hwinst_myFuncAccel_1_dim_info}, 
    .send_i = &axi_lite_send },
  .threshold = { .base = { .channel_info = &p_0_hwinst_myFuncAccel_1_threshold_info}, 
    .send_i = &axi_lite_send },
  .data0 = { .base = { .channel_info = &p_0_dm_0},
    .send_i = &axi_dma_simple_send_i },
  .data1 = { .base = { .channel_info = &p_0_dm_1},
    .send_i = &axi_dma_simple_send_i },
  .data2 = { .base = { .channel_info = &p_0_dm_2},
    .receive_ref_i = 0,
    .receive_i = &axi_dma_simple_recv_i },
};

extern void pfm_hook_init(void);
extern void pfm_hook_shutdown(void);
void p_0_init_pl(void)
{
  sysport_open(&_sds_sysportp_0_ps7_S_AXI_HP0);
  sysport_open(&_sds_sysportp_0_ps7_S_AXI_HP1);
  sysport_open(&_sds_sysportp_0_ps7_S_AXI_HP2);
  axi_dma_simple_open(&p_0_dm_0);
  axi_dma_simple_open(&p_0_dm_1);
  axi_dma_simple_open(&p_0_dm_2);
  axi_lite_open(&p_0_hwinst_myFuncAccel_1_cmd_myFuncAccel_info);
  axi_lite_open(&p_0_hwinst_myFuncAccel_1_size_info);
  axi_lite_open(&p_0_hwinst_myFuncAccel_1_dim_info);
  axi_lite_open(&p_0_hwinst_myFuncAccel_1_threshold_info);
  _sds_p_0_myFuncAccel_1.arg_dm_id[0] = p_0_hwinst_myFuncAccel_1_cmd_myFuncAccel_info.dm_id;
  _sds_p_0_myFuncAccel_1.arg_dm_id[1] = p_0_hwinst_myFuncAccel_1_size_info.dm_id;
  _sds_p_0_myFuncAccel_1.arg_dm_id[2] = p_0_hwinst_myFuncAccel_1_dim_info.dm_id;
  _sds_p_0_myFuncAccel_1.arg_dm_id[3] = p_0_hwinst_myFuncAccel_1_threshold_info.dm_id;
  _sds_p_0_myFuncAccel_1.arg_dm_id[4] = p_0_dm_0.dm_id;
  _sds_p_0_myFuncAccel_1.arg_dm_id[5] = p_0_dm_1.dm_id;
  _sds_p_0_myFuncAccel_1.arg_dm_id[6] = p_0_dm_2.dm_id;
  _sds_p_0_myFuncAccel_1.arg_dm_id_count = 7;
  accel_open(&_sds_p_0_myFuncAccel_1);
}

void p_0_shutdown_pl()
{
  accel_close(&_sds_p_0_myFuncAccel_1);
  axi_dma_simple_close(&p_0_dm_0);
  axi_dma_simple_close(&p_0_dm_1);
  axi_dma_simple_close(&p_0_dm_2);
  axi_lite_close(&p_0_hwinst_myFuncAccel_1_cmd_myFuncAccel_info);
  axi_lite_close(&p_0_hwinst_myFuncAccel_1_size_info);
  axi_lite_close(&p_0_hwinst_myFuncAccel_1_dim_info);
  axi_lite_close(&p_0_hwinst_myFuncAccel_1_threshold_info);
  sysport_close(&_sds_sysportp_0_ps7_S_AXI_HP0);
  sysport_close(&_sds_sysportp_0_ps7_S_AXI_HP1);
  sysport_close(&_sds_sysportp_0_ps7_S_AXI_HP2);
}


void p_0_cf_framework_open(void) __attribute__((constructor));
void p_0_cf_framework_close(void) __attribute__((destructor));
void p_0_cf_framework_open(void)
{
  if (xlnkOpen()) {
    cf_context_init();
    xlnkCounterMap(666666687);
    pfm_hook_init();
    sds_trace_setup(0x0);
  }
  p_0_init_pl();
}

#ifdef PERF_EST
void add_sw_estimates();
#endif

void p_0_cf_framework_close(void)
{
  p_0_shutdown_pl();
  if(xlnkDecrementRef()) {
    sds_trace_cleanup();
    pfm_hook_shutdown();
    xlnkClose(1, NULL);
  }
#ifdef PERF_EST
  add_sw_estimates();
  apf_perf_estimation_exit();
#endif
}
