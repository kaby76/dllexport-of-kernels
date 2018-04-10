
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__declspec(dllexport) __global__ void doKernel2(int *c, const int *a, const int *b)
{
    int i = threadIdx.x;
    c[i] = c[i] + b[i] + a[i];
}

