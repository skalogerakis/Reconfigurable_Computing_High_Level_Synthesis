#include "myLib.h"

void myFunc (unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2)
{
	unsigned int i, k, l;

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

		for ( l = 0 ; r && ( l < dim ) ; l ++ )
		{
			r = ( data2 [ i*dim + l ] > threshold ) ;
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

int main(int argc, char ** argv)
{
	unsigned int i;

	unsigned int seed = (unsigned int)atoi(argv[1]);
	assert(seed>=0);

	srand(seed);

	unsigned int size = (unsigned int)atoi(argv[2]);
	assert(size>=1);

	unsigned int dim = (unsigned int)atoi(argv[3]);
	assert(dim>=2);

	dataType_t threshold = (dataType_t)atof(argv[4]);
	assert(threshold>=0.0);

	printf("Seed %u\nSize %u\nDimension %u\nThreshold %f\n", seed, size, dim, threshold);
	fflush(stdout);	

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

	dataType_t * data2 = (dataType_t *)malloc(sizeof(dataType_t)*dim*size);
	assert(data2!=NULL);

	printf("Calling myFunc... ");
	fflush(stdout);

	myFunc (size, dim, threshold, data0, data1, data2);

	printf("DONE\n");
	fflush(stdout);

	free(data0);
	free(data1);
	free(data2);	

	return 0;
}
