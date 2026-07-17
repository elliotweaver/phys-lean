from fractions import Fraction as F
from math import factorial, log, sqrt, pi
import math
def pExp(q,N): return sum(q**i/F(factorial(i)) for i in range(N))
def eRem(q,N): return (q**N/F(factorial(N)))*(1/(1-q/F(N+1)))

M01_LO=F(347744,100); M01_HI=F(347748,100)
lnLo=log(float(M01_LO)); lnHi=log(float(M01_HI))
print("target ln window [%.9f,%.9f] width %.2e"%(lnLo,lnHi,lnHi-lnLo))

# For CL_LO: maximize CL_LO (closest to lnLo from below) s.t. pExp(CL_LO,N)+eRem<=M01_LO for some N<=MAXN
# For CL_HI: minimize CL_HI (closest to lnHi from above) s.t. M01_HI<=pExp(CL_HI,N) for some N<=MAXN
for MAXN in [20,21,22,23,24]:
    # CL_LO: sweep from floor(lnLo,7) downward until feasible
    best_lo=None
    c=F(math.floor(lnLo*10**7),10**7)
    for _ in range(200):
        N=next((n for n in range(15,MAXN+1) if pExp(c,n)+eRem(c,n)<=M01_LO), None)
        if N is not None: best_lo=(c,N); break
        c-=F(1,10**7)
    # CL_HI: sweep from ceil(lnHi,7) upward
    best_hi=None
    c=F(math.ceil(lnHi*10**7),10**7)
    for _ in range(200):
        N=next((n for n in range(15,MAXN+1) if M01_HI<=pExp(c,n)), None)
        if N is not None: best_hi=(c,N); break
        c+=F(1,10**7)
    if best_lo and best_hi:
        clo,nlo=best_lo; chi,nhi=best_hi
        print("MAXN=%d: CL_LO=%s(N=%d) CL_HI=%s(N=%d) width=%.2e"%(MAXN,clo,nlo,chi,nhi,float(chi-clo)))
