# dllexport-of-kernels
This is an example of what and how you can compile and separately link CUDA
programs and libraries. Unfortunately, I don't think NVIDIA throughly thought the
various permutations of separate compilation and linking out,
as there are some things you can do, and some thing you can't.

This VS 2017 solution contains two projects:
* "hw", which is a CUDA
program (.EXE) that contains a CUDA kernel call, the function defined in moduel Sep.dll.
* "Sep", which is a DLL containing the definition for the kernel and some other things.

In Sep, the kernel is declared with "__declspec(dllexport)".
It is compiled into Sep.dll/lib. Note, the NVCC compiler requires -dlink in order to build. If you
don't include it, the build fails with unresolved symbols to the CUDA runtime.
In "hw", the kernel is declared with "__declspec(dllimport)" and the program references
the Sep.dll/lib in the link.
Running the program works.

While this works for \__global__ functions (i.e., kernels),
it does not work for \__device__ functions. While one may declare
\__declspec(dllexport) \__device__ for functions
in Sep, Hw cannot link with Sep.

Furthermore, there doesn't seem to be a way to load Sep.dll using the CUDA Driver API.
This is unfortunately a major limitation in accessing the code in Sep.lib/dll. If you want
to pre-compile a CUDA library, the only way I found that works
is a static .LIB library without the -dlink option. I also believe the -dc option must be used
for NVCC.
