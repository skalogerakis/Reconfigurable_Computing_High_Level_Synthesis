#include "myLib.h"

/*
 * Different imlementation. In this implementation we change the way the calculations are implemented in a more general way in the algorithm.
 * This implementation will have better performance in cases where threshold values causes values to assign value 0.0
 * as the algorithm suggests. In this case and as size and dim increase we can encounter dramatic time improvement.
 * (Current ./run executable bash file tests a case in which the performance is highlighted as mentioned exec ./exec 10 10000000 16 50. Results:
 * myFunc 13.47 myFuncAccelDif:6.1)
 * However, it uses more complex checks and needs to be tested in HLS to see if the parellization leads to better perfomance.
 */
void myFuncAccelDif (unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2)
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