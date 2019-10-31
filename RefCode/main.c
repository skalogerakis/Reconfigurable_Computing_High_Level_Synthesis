#include "myLib.h"

void myFunc (unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2)
{
	unsigned int i, k, l;

	//printf("size %d\tdim %d\tthreshold %f\n",size,dim, threshold );

	for ( i = 0 ; i < size ; i ++ )
	{
		for ( k = 0 ; k < dim ; k ++ )
		{
			data2 [ i*dim + k ] = 0.0 ;
		}

		for ( k = 0 ; k < dim ; k ++ )
		{
			for ( l = 0 ; l < dim ; l ++ )
			{
				data2 [ i*dim + k ] += data0 [ k * dim + l ] * data1 [ i*dim+ l ];
				
			}			
		}
		
		int r = 1 ;

		//In this case threshold works as upper bound. If threshold cannot surpass
		//the value already assigned value zero is assigned
		for ( l = 0 ; r && ( l < dim ) ; l ++ )
		{
			// printf("\nsize %d fin data2 %f\n",i,data2 [ i*dim + l ] );
			r = ( data2 [ i*dim + l ] > threshold ) ;
			// printf("r %d\n",r );
		}

		if ( r )
		{
			for ( l = 0 ; l < dim ; l ++ )
			{
				data2 [ i*dim + l ] = 0.0;
			}
		}
	}
}

/*Compare elements one by one for the same input. Both functions are supposed to
 *work in the same way so for the same input output must be the same.
 *If an element does not match something went wrong so print an error message
 */
void validityChecker(unsigned int size, unsigned int dim, dataType_t * data2, dataType_t * data2_hw){
	
	unsigned int flag = 0;
	for(int i=0; flag!=1 && i<dim*size; i++){
		// printf("%f, %f \n", data2[i], data2_hw[i] );
		flag = data2[i] != data2_hw[i] ? 1 : 0;
		
	}

	printf(flag==1 ? RED "SOMETHING WENT WRONG\n" RESET : GRN "SUCCESS\n" RESET);
	fflush(stdout);

}

int main(int argc, char ** argv)
{	

	unsigned int i;

	/*take parameters from input*/
	unsigned int seed = (unsigned int)atoi(argv[1]);
	assert(seed>=0);

	srand(seed);

	unsigned int size = (unsigned int)atoi(argv[2]);
	assert(size>=1);

	unsigned int dim = (unsigned int)atoi(argv[3]);
	assert(dim>=2);

	dataType_t threshold = (dataType_t)atof(argv[4]);
	assert(threshold>=0.0);

	printf("Seed %u\nSize %u\nDimension %u\nThreshold %f\n\n", seed, size, dim, threshold);
	fflush(stdout);	

	/* Allocate space and assign rand values*/
	dataType_t * data0 = (dataType_t *)malloc(sizeof(dataType_t)*dim*dim);
	assert(data0!=NULL);

	for(i=0;i<dim*dim;i++)
	{
		dataType_t t = (float)(rand()%10);
		dataType_t d = ((float)(rand()%10))/10;
		data0[i] = t+d;
	}
	
	dataType_t * data1 = (dataType_t *)malloc(sizeof(dataType_t)*dim*size);
	assert(data1!=NULL);

	for(i=0;i<dim*size;i++)
	{
		dataType_t t = (float)(rand()%10);
		dataType_t d = ((float)(rand()%10))/10;
		data1[i] = t+d;
	}


	/**********Reference Code Execution**********/
	dataType_t * data2 = (dataType_t *)malloc(sizeof(dataType_t)*dim*size);
	assert(data2!=NULL);

	printf("Executing myFunc...\n");
	fflush(stdout);

	/* timing */
	double totalTime_ref=0.0;
	struct timespec timerStart_ref;
	struct timespec timerStop_ref;

	clock_gettime(CLOCK_REALTIME, &timerStart_ref);

	myFunc (size, dim, threshold, data0, data1, data2);

	clock_gettime(CLOCK_REALTIME, &timerStop_ref);
	totalTime_ref = (timerStop_ref.tv_sec-timerStart_ref.tv_sec)+ (timerStop_ref.tv_nsec-timerStart_ref.tv_nsec) / BILLION;

	printf("Reference Code execution time: %f\n\n", totalTime_ref);
	fflush(stdout);

	/**********Hardware Code Execution**********/
	dataType_t * data2_hw = (dataType_t *)malloc(sizeof(dataType_t)*dim*size);
	assert(data2_hw!=NULL);

	printf("Executing myFuncAccel...\n");
	fflush(stdout);

	/* timing */
	double totalTime_hw=0.0;
	struct timespec timerStart_hw;
	struct timespec timerStop_hw;

	clock_gettime(CLOCK_REALTIME, &timerStart_hw);

	myFuncAccelTester (size, dim, threshold, data0, data1, data2_hw);

	clock_gettime(CLOCK_REALTIME, &timerStop_hw);
	totalTime_hw = (timerStop_hw.tv_sec-timerStart_hw.tv_sec)+ (timerStop_hw.tv_nsec-timerStart_hw.tv_nsec) / BILLION;

	printf("Hardware execution time: %f\n\n", totalTime_hw);
	fflush(stdout);

	validityChecker(size, dim, data2, data2_hw);

	free(data0);
	free(data1);
	free(data2);
	free(data2_hw);	

	return 0;
}
