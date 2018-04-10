# dllexport-of-kernels
This is an example of what and how you can compile and separately link CUDA
programs and libraries. Unfortunately, I don't think it's been throughly thought out,
as there are some things you can do, and some thing you can't.

This VS 2017 solution contains two projects:
* "hw", which is a more or less generated CUDA
program using "File | New | Project | CUDA". The compiler options are more or less the default
generated.
* "Sep", which is also a more or less generated CUDA project,
but with the type of output set to a DLL.

In Sep, I use "__declspec(dllexport)" for a few kernels. This works fine: I can separately compile
and link everything into Sep.dll/lib. Note, the NVCC compiler requires -dlink as if you don't do that,
then anything referenced in one .CU file by another .CU file in Sep does not link. In "hw", I declare
a reference to a kernel in the Sep.dll/lib using "__declspec(dllimport)". This generates code that NVCC
can link with in "hw". Running the program works.

While this works for __global__ tagged functions (i.e., kernels),
it does not work for __device__ tagged functions. While the function declaration
compiles in Sep, it cannot link with its use in Hw.

Further, there doesn't seem to be a way to load Sep.dll using the CUDA Driver API.
This is unfortunately a major limitation in accessing the code in Sep.lib/dll. If you want
to pre-compile a CUDA library, you cannot use -DLINK, and it must be a static .LIB.
