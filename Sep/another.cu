
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__device__ void fun(int *c, const int *a, const int *b);

__global__ void doKernel4(int *c, const int *a, const int *b)
{
	fun(c, a, b);
	int i = threadIdx.x;
	c[i] = c[i] + b[i] + a[i];
}
