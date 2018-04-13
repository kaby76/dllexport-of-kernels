
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__device__ void funny();

__declspec(dllexport) __global__ void doKernel2(int *c, const int *a, const int *b)
{
	int i = threadIdx.x;
	c[i] = c[i] + b[i] + a[i];
	funny();
}

// Can declare, but cannot link in "hw".
__declspec(dllexport) __device__ void fun(int *c, const int *a, const int *b)
{
	c[0] = c[0] + b[0] + a[0];
}

__global__ void doKernel3(int *c, const int *a, const int *b)
{
	int i = threadIdx.x;
	c[i] = c[i] + b[i] + a[i];
}
