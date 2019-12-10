/* File: /home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/MIlestone3/SDSOC_Accel/Algo_4/Debug/_sds/p0/.cf_work/portinfo.h */
#ifndef _SDS_PORTINFO_p_0__H
#define _SDS_PORTINFO_p_0__H

#include "cf_request.h"
#include "accel_irq.h"

#ifdef __cplusplus
extern "C" {
#endif

struct p_0_hwblk_myFuncAccel {
  cf_port_send_t cmd_myFuncAccel;
  cf_port_send_t size;
  cf_port_send_t dim;
  cf_port_send_t threshold;
  cf_port_send_t data0;
  cf_port_send_t data1;
  cf_port_receive_t data2;
};

extern struct p_0_hwblk_myFuncAccel p_0_hwinst_myFuncAccel_1;
void p_0_cf_framework_open(void);
void p_0_cf_framework_close(void);

#ifdef __cplusplus
};
#endif

#endif
