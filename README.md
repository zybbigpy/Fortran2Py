# combine fortran in python

Sometimes, we need to use some fortran code in our project. A good practice is that we can compile the .f90 codes into dynamic link libraries (.so in Linux or .dll in windows). Then, we can use the `ctypes` in python to load the libs and get the handlers.


## compile the code 

```bash
# as dynamic link lib
mpifort -fPIC -shared -o libtest.so test.f90
python test.py
```

## some tricks

1. we use `subroutine` in fortran to provide the interface. However, there is no return
value. There is a smart way that we can make the following argreement.
    -  the `subroutine`s we need to use in fortran only accept array as arguments.
    -  we use `numpy.array` to pass arguments to the fortran handler.
2. Pay attention to the difference in the memory modle between C and fortran. Defenitely, we use the `C` interface in python.

## Test

1. MPI Use.
2. Optimize fortran `subroutine` in python by `scipy`.

## Reference

1. https://dektoud.github.io/blog/post/fortran_dlls/
2. https://www.jianshu.com/p/bd8554a13c0c