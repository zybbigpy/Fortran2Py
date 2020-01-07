import ctypes as ct
import numpy as np
from scipy.optimize import minimize 

flib = ct.CDLL("libtest.so")

# test-1
func = flib.mpi_hello
print("*"*50)
func()

# test-2
print("-"*50)
func2 =flib.x2y2

# wrap fortran function in python
def func3(val):
    m = np.array([100.0], dtype='float64')
    # transpose due to the memo arch diff between C and Fortran
    val = np.asfortranarray(val).T
    m = np.asfortranarray(m).T
    func2(np.ctypeslib.as_ctypes(val), np.ctypeslib.as_ctypes(m))

    return m[0]

# optimize
x0 = np.array([13, 7], dtype='float64')
res = minimize(func3, x0, method='nelder-mead', options={'xatol': 1e-8, 'disp': True})
print(res.x)