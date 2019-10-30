#include "myLib.h"

void myFunc (int * array1, int * array2, int * array3, int N)
{
	int i;
	for(i=0;i<N;i++)
		array3[i] = array1[i] + array2[i];

}

int main (int argc, char ** argv)
{
	assert(argv[1]!=NULL);
	int N = atoi (argv[1]);
	assert(N>=1);
	
	assert(argv[2]!=NULL);
	int I = atoi (argv[2]);
	assert(I>=1);

	printf("Array size = %d\n", N);

	int * array1 = (int*)malloc(sizeof(int)*N);
	assert(array1!=NULL);

	int * array2 = (int*)malloc(sizeof(int)*N);
	assert(array2!=NULL);
	
	srand(time(NULL));

	int i;
	int T = 10;
	for(i=0;i<N;i++)
	{
		int randVal = rand()%(T+1);
		int val1 = randVal;
		int val2 = T - randVal;
		assert(val1+val2 == T);

		array1[i] = val1;
		array2[i] = val2;	
	}

	/****************************************/
	/* Part 1: Reference Software Execution */
	/****************************************/

	int * array3_sw = (int*)malloc(sizeof(int)*N);
	assert(array3_sw!=NULL);

	/* correctness check */
	myFunc (array1, array2, array3_sw, N);
	
	for(i=0;i<N;i++)
	{
		assert(array3_sw[i]==T);
	}

	/* timing */
	double totalTime_sw=0.0;
	struct timespec timerStart_sw;
	struct timespec timerStop_sw;

	clock_gettime(CLOCK_REALTIME, &timerStart_sw);

	for(i=0;i<I;i++)
		myFunc (array1, array2, array3_sw, N);

	clock_gettime(CLOCK_REALTIME, &timerStop_sw);
	totalTime_sw = (timerStop_sw.tv_sec-timerStart_sw.tv_sec)+ (timerStop_sw.tv_nsec-timerStart_sw.tv_nsec) / BILLION;

	printf("Software execution time: %f\n", totalTime_sw);

	/******************************/
	/* Part 2: Hardware Execution */
	/******************************/

	int * array3_hw = (int*)malloc(sizeof(int)*N);
	assert(array3_hw!=NULL);

	/* correctness check */
	myFunc_hw (array1, array2, array3_hw, N);
	
	for(i=0;i<N;i++)
	{
		assert(array3_hw[i]==T);
	}

	/* timing */
	double totalTime_hw=0.0;
	struct timespec timerStart_hw;
	struct timespec timerStop_hw;

	clock_gettime(CLOCK_REALTIME, &timerStart_hw);

	for(i=0;i<I;i++)
		myFunc_hw (array1, array2, array3_hw, N);

	clock_gettime(CLOCK_REALTIME, &timerStop_hw);
	totalTime_hw = (timerStop_hw.tv_sec-timerStart_hw.tv_sec)+ (timerStop_hw.tv_nsec-timerStart_hw.tv_nsec) / BILLION;

	printf("Hardware execution time: %f\n", totalTime_hw);

	free(array1);
	free(array2);
	free(array3_sw);
	free(array3_hw);
	
	return 0;
}
