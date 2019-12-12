
#include "myLib.h"


/*
 * InitCode Solution: Our initial code without core changes
 * Optimization 1 Solution: Started changing code. Added pipeline in size loop. Initiation Interval = 16
 * Optimization 2 Solution: Added caches to process data0 that creates bottleneck. Initiation Interval = 4(Goal)
 * Optimization 3 Solution: Single cache solution hardcoded. Fewer resources
 * Optimization 4 Solution: Single cache solution for-loop implementation. More resources, easier to generalize
 * Optimization 5 Solution: Start playing with bit-width. Arbitrary types used. Still cannot see performance improvement.Return on previous version. C does not support fixed point values??
 * Milestone 2 Sent: Added a few extra buffers between memory reads and writes. Every step until Optimization 4 was implemented. Optimization 5 made matters worse(Code is in comments)
 */

//The DATA ZERO_COPY pragma means that the hardware function accesses the data directly from shared memory through an AXI master bus interface.


// In this implementation we use data_mover pragma with AXIDMA_SIMPLE, because we have only contiguous memory and it is supported only with this mover.
// We also give id (its optional)so as to use the same instance to transfer data for arguments

#pragma SDS data mem_attribute(data0:PHYSICAL_CONTIGUOUS, data1:PHYSICAL_CONTIGUOUS, data2:PHYSICAL_CONTIGUOUS)
#pragma SDS data access_pattern(data0:SEQUENTIAL, data1:SEQUENTIAL, data2:SEQUENTIAL)
#pragma SDS data data_mover(data0:AXIDMA_SIMPLE, data1:AXIDMA_SIMPLE, data2:AXIDMA_SIMPLE)

#pragma SDS data copy(data0[0:dim*dim])
#pragma SDS data copy(data1[0:dim*size])
#pragma SDS data copy(data2[0:dim*size])

void myFuncAccel (unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2)
{
//Dim in this case has size 4 so we need 3 bits to represent that

	unsigned int i, k ,l ,r;
	dim = 4;
	dataType_t tempVal;
	dataType_t cache[dim*dim];
	dataType_t tempArrData1[dim];
	dataType_t tempArrData2[dim];

#pragma HLS dataflow

copyLoop: for ( i = 0 ; i < dim ; i++){

#pragma HLS unroll skip_exit_check factor=4
				cache[i*dim] = data0[i*dim];
				cache[i*dim+1] = data0[i*dim+1];
				cache[i*dim+2] = data0[i*dim+2];
				cache[i*dim+3] = data0[i*dim+3];
			}

sizeLoop:

		for ( i = 0 ; i < size ; i ++ )
		{
#pragma HLS pipeline II=4


initLoop:	for ( k = 0 ; k < dim ; k ++ )
			{
				tempArrData2[k] = 0.0 ;
			}

			r=0;

valueAsn:	for ( k = 0 ; k < dim ; k ++ )
			{
				if(k == 0){

					for(l = 0 ;l < dim ; l ++){

						tempArrData1[l] = data1[ i * dim + l];
					}
				}

				for(l = 0 ;l < dim ; l ++){
					tempVal =(cache[k*dim+l]*tempArrData1[l]);
					tempArrData2[k]+=tempVal;
				}

				if(tempArrData2[k] <= threshold){
					r = 1;

				}

			}

zeroAsn:	for ( l = 0 ;l < dim ; l ++ )
			{
				tempArrData2[l] *= r;
				if(l == dim - 1){
					for ( k = 0 ;k < dim ; k ++ )
					{
						data2 [ i*dim + k ] = tempArrData2[k];
					}
				}
			}


		}
}

#include "cf_stub.h"
#ifdef __cplusplus
extern "C" {
#endif
void p_0_myFuncAccel_1_noasync(unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2);
#ifdef __cplusplus
}
#endif
void p_0_myFuncAccel_1_noasync(unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2)
{
  int start_seq[1];
  start_seq[0] = 0;
  cf_request_handle_t p_0_hwinst_myFuncAccel_1_cmd;
  cf_send_i(&(p_0_hwinst_myFuncAccel_1.cmd_myFuncAccel), start_seq, 1 * sizeof(int), &p_0_hwinst_myFuncAccel_1_cmd);
  cf_wait(p_0_hwinst_myFuncAccel_1_cmd);

  cf_send_i(&(p_0_hwinst_myFuncAccel_1.size), &size, 4, &p_0_request_0);
  cf_send_i(&(p_0_hwinst_myFuncAccel_1.dim), &dim, 4, &p_0_request_1);
  cf_send_i(&(p_0_hwinst_myFuncAccel_1.threshold), &threshold, 4, &p_0_request_2);
  cf_send_i(&(p_0_hwinst_myFuncAccel_1.data0), data0, (dim*dim) * 4, &p_0_request_3);
  cf_send_i(&(p_0_hwinst_myFuncAccel_1.data1), data1, (dim*size) * 4, &p_0_request_4);

  cf_receive_i(&(p_0_hwinst_myFuncAccel_1.data2), data2, (dim*size) * 4, &p_0_myFuncAccel_1_noasync_num_data2, &p_0_request_5);

  cf_wait(p_0_request_0);
  cf_wait(p_0_request_1);
  cf_wait(p_0_request_2);
  cf_wait(p_0_request_3);
  cf_wait(p_0_request_4);
  cf_wait(p_0_request_5);
}


