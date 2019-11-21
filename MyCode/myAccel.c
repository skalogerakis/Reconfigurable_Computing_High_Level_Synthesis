#include "myLib.h"

/*
 *Two different functions with different implementations. Create different files for both accelerators and
 *created different metrics to test them at the same time. The final accelerator that will be decided after using HLS
 *and see the performance trade-offs in each case.
 */

/*
 * InitCode Solution: Our initial code without core changes
 * Optimization 1 Solution: Started changing code. Added pipeline in size loop. Initiation Interval = 16
 * Optimization 2 Solution: Added caches to process data0 that creates bottleneck. Initiation Interval = 4(Goal)
 * Optimization 3 Solution:
 */
void myFuncAccel (unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2)
{

 #pragma HLS INTERFACE ap_bus depth=16 port=data0 // 5. For simulation only
 #pragma HLS INTERFACE ap_bus depth=4000 port=data1
 #pragma HLS INTERFACE ap_bus depth=4000 port=data2

	unsigned int z, i, k, l,count,r,newcounter;
	size = 1000;
	dim = 4;
	threshold = 100;
//	float cach1[dim];
//	float cach2[dim];
//	float cach3[dim];
//	float cach4[dim];
	float cache[dim*dim];
	float tempArrData1[dim];
	float tempArrData2[dim];
		count = 0;

copyLoop: for ( z = 0 ; z < dim ; z++){
#pragma HLS unroll factor=4
//				cach1[z]=data0[z*dim];
//				cach2[z]=data0[z*dim+1];
//				cach3[z]=data0[z*dim+2];
//				cach4[z]=data0[z*dim+3];
//				for ( k = 0 ; k < dim ; z++){
//					cache[z*dim+k] = data0[z*dim+k];
//				}
				cache[z*dim] = data0[z*dim];
				cache[z*dim+1] = data0[z*dim+1];
				cache[z*dim+2] = data0[z*dim+2];
				cache[z*dim+3] = data0[z*dim+3];

			}
sizeLoop:
		for ( i = 0 ; i < size ; i ++ )
		{
#pragma HLS pipeline II=4
initLoop:	for ( k = 0 ; k < dim ; k ++ )
			{

				tempArrData2[k] = 0.0 ;
			}
			newcounter=0;
			r=0;

valueAsn:	for ( k = 0 ; k < dim ; k ++ )
			{
				//printf("%f\n", cach1[k]);
				if(k == 0){
					for(l = 0 ;l < dim ; l ++){
						tempArrData1[l] = data1[ i * dim + l];
					}
				}

				for(l = 0 ;l < dim ; l ++){
					tempArrData2[k]+=(cache[k*dim+l]*tempArrData1[l]);
				}

//				tempArrData2[k]=(cache[k*dim]*tempArrData1[0])+
//												(cache[k*dim+1]*tempArrData1[1])+
//												(cache[k*dim+2]*tempArrData1[2])+
//												(cache[k*dim+3]*tempArrData1[3]);

//				data2 [ i*dim + k ]=
//						(cach1[k]*tempArrData1[0])+
//						(cach2[k]*tempArrData1[1])+
//						(cach3[k]*tempArrData1[2])+
//						(cach4[k]*tempArrData1[3]);
				//tempArrData2[dim];
				if(tempArrData2[k] <= threshold){
					r = 1;
					//break;
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
