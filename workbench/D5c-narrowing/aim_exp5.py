from fractions import Fraction as F
from mpmath import mp, mpf, factorial, log
import mpmath, math
mp.dps = 120

# m01 6-dp bracket from aim_chain5
m01_lo = F(3477472814,10**6)   # 3477.472814
m01_hi = F(3477472923,10**6)   # 3477.472923
tlo = mpf(3477472814)/mpf('1e6')
thi = mpf(3477472923)/mpf('1e6')
print("m01 bracket [%s, %s]"%(float(m01_lo),float(m01_hi)))
cl_true_lo = log(tlo); cl_true_hi = log(thi)
print("cutLog true range [%.11f, %.11f] width %.3e\n"%(float(cl_true_lo),float(cl_true_hi),float(cl_true_hi-cl_true_lo)))

def partialExp(x,N):
    s=mpf(0); term=mpf(1)
    for k in range(N):
        s+=term; term*=x/(k+1)
    return s
def expRemBound(x,N):
    return (x**N/factorial(N))*(1/(1 - x/(N+1)))

# LOWER cutLog: largest cl_lo (1e8 grid) with partialExp(cl_lo,N)+rem <= m01_lo
# UPPER cutLog: smallest cl_hi (1e8 grid) with m01_hi <= partialExp(cl_hi,N)
lo_center = 815406110  # 8.15406110  (1e8 grid)
for N in [24,26,27,28,29,30,31,32]:
    best_lo=None
    for i in range(lo_center-40, lo_center+60):
        c=mpf(i)/mpf('1e8')
        if partialExp(c,N)+expRemBound(c,N) <= tlo: best_lo=i
        else: break
    best_hi=None
    for i in range(lo_center+80, lo_center-40, -1):
        c=mpf(i)/mpf('1e8')
        if thi <= partialExp(c,N): best_hi=i
        else: break
    if best_lo and best_hi:
        w=(best_hi-best_lo)/1e8
        print("N=%2d  cl_lo=%d/1e8=%.8f  cl_hi=%d/1e8=%.8f  width=%.3e"%(N,best_lo,best_lo/1e8,best_hi,best_hi/1e8,w))
    else:
        print("N=%2d  lo=%s hi=%s"%(N,best_lo,best_hi))
