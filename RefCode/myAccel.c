#include "myLib.h"

void myFuncAccel (unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2)
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
