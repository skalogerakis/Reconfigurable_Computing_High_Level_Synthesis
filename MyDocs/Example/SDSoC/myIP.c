#include "myLib.h"

#pragma SDS data zero_copy(array1[0:N])
#pragma SDS data zero_copy(array2[0:N])
#pragma SDS data zero_copy(array3[0:N])
void myFunc_hw (int * array1, int * array2, int * array3, int N)
{
	// 6. Remove for SDSoC
//#pragma HLS INTERFACE ap_bus depth=1000 port=array1 // 5. For simulation only
//#pragma HLS INTERFACE ap_bus depth=1000 port=array2
//#pragma HLS INTERFACE ap_bus depth=1000 port=array3

	//int M = 1000; // 7. Quick resource/performance check after synthesis

	int i;
	for(i=0;i<N;i++)
	{
#pragma HLS PIPELINE II=1 // 6. pipeline
		array3[i] = array1[i] + array2[i]+i; // 4. To check in the waveform
	}

}
