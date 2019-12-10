
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

void myFuncAccel (unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2)
{
//Dim in this case has size 4 so we need 3 bits to represent that
 #pragma HLS INTERFACE ap_bus depth=16 port=data0 // 5. For simulation only
 #pragma HLS INTERFACE ap_bus depth=4000 port=data1
 #pragma HLS INTERFACE ap_bus depth=4000 port=data2



//	Arbitrary types build in for c. Not performance improvement
//	uint24 i;	//Size max is:16,777,216.
//	uint1 r;
//	uint3 k,l;
	unsigned int i, k ,l ,r;

	 size = 1000;
	 dim = 4;
	 threshold = 100;

	dataType_t tempVal;
	dataType_t cache[dim*dim];
	dataType_t tempArrData1[dim];
	dataType_t tempArrData2[dim];



#pragma HLS dataflow //HELPS

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
//				Hardcoded version demands fewer resources but we approached the problem as above
//				tempArrData2[k]=(cache[k*dim]*tempArrData1[0])+
//												(cache[k*dim+1]*tempArrData1[1])+
//												(cache[k*dim+2]*tempArrData1[2])+
//												(cache[k*dim+3]*tempArrData1[3]);

				if(tempArrData2[k] <= threshold){
					r = 1;

				}

			}

zeroAsn:	for ( l = 0 ;l < dim ; l ++ )
			{
				//Clever way to get rid of existing if statement.With a flag and a product
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
