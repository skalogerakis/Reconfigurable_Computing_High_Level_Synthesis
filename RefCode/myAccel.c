#include "myLib.h"

void myFuncAccel (unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2)
{
	unsigned int i, k, l;

	for ( i = 0 ; i < size ; i ++ )
	{
		/*
		 * In our initial try we chose to implement a loop fusion(loop merge).
		 * However, this implementation is not definite that will lead to better
		 * result than the commented initial version below. Loop fusion may increase
		 * level of parallelism, data locality and decrease loop overhead. Loop fission
		 * on the other hand(initial version commented below) might be used to distribute computations 
		 * and memory accesses in a way that may increase the potential for loop pipelining and loop vectorization, may reduce cache misses.
		 * The final result is highly depented in the application and will very likely change 
		 * in future implementation. This implementation was chosen as it produced better result in 
		 * our software analysis.
		 */
		// for ( k = 0 ; k < dim ; k ++ )
		// {
		// 	data2 [ i*dim + k ] = 0.0 ;
		// }

		dataType_t tempVal;
		for ( k = 0 ; k < dim ; k ++ )
		{
			data2 [ i*dim + k ] = 0.0 ;
			/*
			 *Use a tempVal to access memory and write data only once and not on each iteration
			 */
			tempVal=0;
			for ( l = 0 ; l < dim ; l ++ )
			{
				tempVal += data0 [ k * dim + l ] * data1 [ i*dim+ l ];
				
			}
			//printf("%\n");
			data2 [ i*dim + k ] = tempVal;			
		}
		
		int r = 1 ;

		//In this case threshold works as upper bound. If threshold cannot surpass
		//the value already assigned value zero is assigned
		for ( l = 0 ; r && ( l < dim ) ; l ++ )
		{
			r = ( data2 [ i*dim + l ] > threshold ) ;
		}

		/*
		 * Got rid of if statement.Inside a for loop if/else statements are inefficient.
		 * Vivado will create in each itearation structures that checks if the condition 
		 * is met.
		 */
		for ( l = 0 ; r && l < dim ; l ++ )
		{
			data2 [ i*dim + l ] = 0.0;
		}
	}
}
