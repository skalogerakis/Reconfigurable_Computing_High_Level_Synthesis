#include "myLib.h"

void myFunc_hw (int * array1, int * array2, int * array3, int N)
{
	int i;
	for(i=0;i<N;i++)
		array3[i] = array1[i] + array2[i];

}
