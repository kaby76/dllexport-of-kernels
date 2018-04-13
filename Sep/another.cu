
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>


__global__ void doKernel4(int *c, const int *a, const int *b)
{
	int i = threadIdx.x;
	c[i] = c[i] + b[i] + a[i];
}

__device__ void funny()
{

}