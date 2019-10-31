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
			// if(tempVal < threshold){

			// 	continue;
			// }

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


/*
 * In this implementation we change the way the calculations are implemented in a more general way in the algorithm.
 * This implementation will have better performance in cases where threshold values causes values to assign value 0.0
 * as the algorithm suggests. In this case and as size and dim increase we can encounter dramatic time improvement.
 * However, uses more complex checks and needs to be tested in HLS to see if the parellization leads to better perfomance
 */
void myFuncAccelTester (unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2)
{
	unsigned int i, k, l, j, r;

	for ( i = 0 ; i < size ; i ++ )
	{
		dataType_t tempVal;

		//Initialization
		for ( k = 0 ; k < dim ; k ++ )
		{
			data2 [ i*dim + k ] = 0.0 ;
		}

		for ( l = 0 ; l < dim ; l ++ )
		{
			r = 0 ;
			//Don't read every the value in every loop. Read once, store in a tempVal update the value needed
			tempVal = data1 [ i*dim+ l ];

			for ( k = 0 ; k < dim ; k ++ )
			{
				data2 [ i*dim + k ] += data0 [ k * dim + l ] * tempVal;
			
				//Update our threshold surpass counter
				if(data2 [ i*dim + k ] > threshold){
					r++;
				}
				
			}
			/*
			 * Check if all values surpass threshold at the same time and break loop
			 * to get rid of some calculations
			 */
			if(r==dim){
				for ( j = 0 ; j < dim ; j ++ )
				{
					data2 [ i*dim + j ] = 0.0;
				}
				break;
			}		
			
		}
		
	}
}