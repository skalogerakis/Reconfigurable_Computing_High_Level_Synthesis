#include "myLib.h"

/*
 * Different implementation with dim = 16. Not too many changes. The same things are applied from
 * accelarator with dim =4
 */

void myFuncAccel (unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2)
{

 #pragma HLS INTERFACE ap_bus depth=256 port=data0 // 5. For simulation only
 #pragma HLS INTERFACE ap_bus depth=16000 port=data1
 #pragma HLS INTERFACE ap_bus depth=16000 port=data2

	unsigned int i, k, l, r;

	size = 1000;
	dim = 16;
	threshold = 100;

	dataType_t cache[dim*dim];
	dataType_t tempArrData1[dim];
	dataType_t tempArrData2[dim];

#pragma HLS dataflow

copyLoop: for ( i = 0 ; i < dim ; i++){
#pragma HLS unroll factor=16
				cache[i*dim] = data0[i*dim];
				cache[i*dim+1] = data0[i*dim+1];
				cache[i*dim+2] = data0[i*dim+2];
				cache[i*dim+3] = data0[i*dim+3];
				cache[i*dim+4] = data0[i*dim+4];
				cache[i*dim+5] = data0[i*dim+5];
				cache[i*dim+6] = data0[i*dim+6];
				cache[i*dim+7] = data0[i*dim+7];
				cache[i*dim+8] = data0[i*dim+8];
				cache[i*dim+9] = data0[i*dim+9];
				cache[i*dim+10] = data0[i*dim+10];
				cache[i*dim+11] = data0[i*dim+11];
				cache[i*dim+12] = data0[i*dim+12];
				cache[i*dim+13] = data0[i*dim+13];
				cache[i*dim+14] = data0[i*dim+14];
				cache[i*dim+15] = data0[i*dim+15];
			}

sizeLoop:
		for ( i = 0 ; i < size ; i ++ )
		{
#pragma HLS pipeline II=16

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
					tempArrData2[k]+=(cache[k*dim+l]*tempArrData1[l]);
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
