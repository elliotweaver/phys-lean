from fractions import Fraction as F
from math import factorial, log, sqrt
import math

def pExp(q,N): return sum(q**i/F(factorial(i)) for i in range(N))
def eRem(q,N): return (q**N/F(factorial(N)))*(1/(1-q/F(N+1)))

M01_LO=F(347744,100); M01_HI=F(347748,100)   # from aim20 chain
print("ln(M01_LO)=%.9f ln(M01_HI)=%.9f"%(log(float(M01_LO)),log(float(M01_HI))))

# LOWER: CL_LO<=ln(M01_LO) and exists N: pExp(CL_LO,N)+eRem<=M01_LO
# CL_LO = floor to 6 dec of ln(M01_LO):
CL_LO=F(math.floor(log(float(M01_LO))*10**6),10**6)
for N in range(17,30):
    if pExp(CL_LO,N)+eRem(CL_LO,N)<=M01_LO:
        print("CL_LO=%s idx N=%d  pExp+rem=%.5f<=%.2f"%(CL_LO,N,float(pExp(CL_LO,N)+eRem(CL_LO,N)),float(M01_LO))); CLN=N; break

# UPPER: search CL_HI from ceil(ln M01_HI) upward until feasible small N
base=F(math.ceil(log(float(M01_HI))*10**6),10**6)
found=None
for add in range(0,60):
    CL_HI=base+F(add,10**6)
    for N in range(17,30):
        if M01_HI<=pExp(CL_HI,N):
            found=(CL_HI,N); break
    if found: break
CL_HI,CHN=found
print("CL_HI=%s idx N=%d  pExp=%.5f>=%.2f"%(CL_HI,CHN,float(pExp(CL_HI,CHN)),float(M01_HI)))
print("cutLog bracket [%s,%s] width=%.6f = %.2e"%(CL_LO,CL_HI,float(CL_HI-CL_LO),float(CL_HI-CL_LO)))
print("  (parent 0.002; %.1fx tighter)"%(0.002/float(CL_HI-CL_LO)))

# assembled
ip_lo=F(500000,1570810); ip_hi=F(500000,1570790)
d=F(16,3)
lo=F(190,3)+d/3*CL_LO*ip_lo
hi=F(190,3)+d/3*CL_HI*ip_hi
par_lo=F(9606370,141381); par_hi=F(9605390,141363)
print("assembled lo=%s ~%.7f"%(lo,float(lo)))
print("assembled hi=%s ~%.7f"%(hi,float(hi)))
print("width=%.3e (parent 0.00172; %.1fx tighter)"%(float(hi-lo),0.00172/float(hi-lo)))
print("nested? lo>=par_lo:%s hi<=par_hi:%s"%(lo>=par_lo,hi<=par_hi))
dlo=F(74)+d/2*CL_LO*ip_lo; dhi=F(74)+d/2*CL_HI*ip_hi
print("dressed lo=%s hi=%s"%(dlo,dhi))
