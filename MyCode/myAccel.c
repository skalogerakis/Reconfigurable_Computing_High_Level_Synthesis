#include "myLib.h"

/*
 *Two different functions with different implementations. Create different files for both accelerators and 
 *created different metrics to test them at the same time. The final accelerator that will be decided after using HLS
 *and see the performance trade-offs in each case.
 */
void myFuncAccel (unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2)
{

#pragma HLS INTERFACE ap_bus depth=16 port=data0 // 5. For simulation only
#pragma HLS INTERFACE ap_bus depth=4000 port=data1
#pragma HLS INTERFACE ap_bus depth=4000 port=data2

	unsigned int i, k, l,count,r;
	dataType_t tempVal;
	size = 1000;
	dim = 4;
	threshold = 100;


		sizeLoop:
		for ( i = 0 ; i < size ; i ++ )
		{
#pragma HLS pipeline II=4	//BEST SOLUTION SO FAR. WHAT ABOUT INTERVAL????
//#pragma HLS UNROLL factor=4
initLoop:	for ( k = 0 ; k < dim ; k ++ )
			{
//#pragma HLS UNROLL factor=4
				data2 [ i*dim + k ] = 0.0 ;
			}

			//count=0;
			r=0;
valueAsn:	for ( k = 0 ; k < dim ; k ++ )
			{
				//data2 [ i*dim + k ] = 0.0 ;
				//Optimazation_1 solution: Added a tempVal to reduce read and write accesses in array
				tempVal=0;

#pragma HLS pipeline II=4 // COMPUTATIONS DROP BUT INCREASES LOOP INITIATION INTERVAL!!!
//#pragma HLS UNROLL factor=4
valueAsnInner:	for ( l = 0 ; l < dim ; l ++ )
				{

					//Optimazation_1 solution
					tempVal += data0 [ k * dim + l ] * data1 [ i * dim + l ];


				}
				//Optimazation_1 solution
				data2 [ i*dim + k ]= tempVal;
				if(tempVal <= threshold){
					r = 1;
					//break;
				}

			}

zeroAsn:	for ( l = 0 ;l < dim ; l ++ )
			{
	//#pragma HLS UNROLL factor=4
				data2 [ i*dim + l ] *= r;

			}

		}
}
