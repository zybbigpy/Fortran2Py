# combine fortran in python

## compile .so

```bash
mpifort -fPIC -shared -o libtest.so test.f90
python test.py
```