# dllexport-of-kernels
This is a "Hello World" example of CUDA, generated automatically using VS 2017/CUDA GPU TK 9.1.45,
but with another kernel call added to one that is defined in another project, wrapped in a DLL.
In this case, there is no wrapper for the kernel fumction; the kernel is tagged with declspec(dllexport).
I didn't know if it would work, but it does.
