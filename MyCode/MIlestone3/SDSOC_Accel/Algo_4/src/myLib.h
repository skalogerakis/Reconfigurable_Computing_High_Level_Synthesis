#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <assert.h>

//Put some color in your life. Used to print error and successful output
//#define RED   "\x1B[31m"
//#define GRN   "\x1B[32m"
//#define RESET "\x1B[0m"
#include "sds_lib.h" // sds library
//Used for timer
#define BILLION 1E9


typedef float dataType_t;

void myFunc (unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2);
void myFuncAccel (unsigned int size, unsigned int dim, dataType_t threshold, dataType_t * data0, dataType_t * data1, dataType_t * data2);




