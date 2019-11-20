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
	dataType_t tempArrOut[16];
	dataType_t tempArrData1[4];
	//dataType_t tempArrData0[16];
	dataType_t tempArrData0[16];
	dataType_t finalOut[4];
	//tempArrData0 = data0;
		sizeLoop:
		for ( i = 0 ; i < size ; i ++ )
		{
#pragma HLS pipeline II=4	//BEST SOLUTION SO FAR. WHAT ABOUT INTERVAL????
//#pragma HLS UNROLL factor=4
//initLoop:	for ( k = 0 ; k < dim ; k ++ )
//			{
////#pragma HLS UNROLL factor=4
//				tempArrOut[k] = 0.0 ;
//			}

			//count=0;
			r=0;
valueAsn:	for ( k = 0 ; k < dim ; k ++ )
			{
				//data2 [ i*dim + k ] = 0.0 ;
				//Optimazation_1 solution: Added a tempVal to reduce read and write accesses in array
				tempVal=0;
				float tempTotal;
//#pragma HLS pipeline II=4 // COMPUTATIONS DROP BUT INCREASES LOOP INITIATION INTERVAL!!!
//#pragma HLS UNROLL factor=4
				//tempArr[k]
				//MAYBE NOT A SUITABLE BUFFER?????
				for ( l = 0 ; l < dim ; l ++ )
				{
					tempArrData0[l] = data0 [ k * dim + l ];
				}

valueAsnInner:	for ( l = 0 ; l < dim ; l ++ )
				{
					//Optimazation_1 solution
					if(k == 0){
						tempArrData1[l] = data1 [ i * dim + l ];
					}

					if(i == 0){
						tempArrData0[k * dim + l] = data0 [ k * dim + l ];
					}
					//tempVal += data0 [ k * dim + l ] * tempArrData1[l];
					tempArrOut[k * dim + l] = tempArrData0[k * dim + l] * tempArrData1[l];
					//tempTotal+=tempArr[l];
					//printf("pos %d val %f\n", k*dim+l ,tempArr[k*dim+l]);

				}

//				for ( l = 0 ; l < dim ; l ++ )
//				{
//					tempTotal+=tempArr[l];
//				}
				//Optimazation_1 solution
				//data2 [ i*dim + k ] = tempVal;


//				for ( l = 0 ; l < dim ; l ++ )
//				{
//					tempVal =tempArrOut[l];
//				}
//				//tempVal = tempArrOut[0]+tempArrOut[1]+tempArrOut[2]+tempArrOut[3];
//				data2 [ i*dim + k ] = tempVal;
//				if(tempVal <= threshold){
//					r = 1;
//					//break;
//				}

			}




			for ( k = 0 ; k < dim ; k ++ )
			{
				finalOut[k] = tempArrOut[k * dim + 0]+tempArrOut[k * dim + 1]+tempArrOut[k * dim + 2]+tempArrOut[k * dim + 3];
				//tempVal = tempArrOut[k * dim + 0]+tempArrOut[k * dim + 1]+tempArrOut[k * dim + 2]+tempArrOut[k * dim + 3];
				data2 [ i*dim + k ] = finalOut[k];
								if(finalOut[k] <= threshold){
									r = 1;
									//break;
								}
			}
//
//			for ( l = 0 ;l < dim*dim ; l +=4 )
//			{
//	//#pragma HLS UNROLL factor=4
//				float tempTotal;
//				int counter = 0;
//				tempTotal = tempArr[l]+tempArr[l+1]+tempArr[l+2]+tempArr[l+3];
//				printf("TOTAL %f\n", tempTotal);
//				data2 [ i*dim + counter ] = tempTotal;
//								if(tempTotal <= threshold){
//									r = 1;
//									//break;
//								}
//								counter++;
//
//			}
//



zeroAsn:	for ( l = 0 ;l < dim ; l ++ )
			{
	//#pragma HLS UNROLL factor=4
				data2 [ i*dim + l ] *= r;

			}

		}
}
