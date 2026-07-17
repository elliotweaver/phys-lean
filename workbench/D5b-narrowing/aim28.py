from fractions import Fraction as F
from math import factorial, log, sqrt, pi
import math
def pExp(q,N): return sum(q**i/F(factorial(i)) for i in range(N))
def eRem(q,N): return (q**N/F(factorial(N)))*(1/(1-q/F(N+1)))

# achievable m01 (split@4): [3477.4708, 3477.4760]. Choose M01 clean CONTAINING it,
# such that cutLog endpoints certify at exp index <=22.
m01_ach_lo=F(34774708,10**4); m01_ach_hi=F(34774760,10**4)
print("achievable m01 [%.4f,%.4f]"%(float(m01_ach_lo),float(m01_ach_hi)))

# Sweep M01 window widths (symmetric-ish, containing achievable), find min cutLog width with idx<=22
best=None
for lo_dec in range(347740, 347748):    # M01_LO in hundredths: 3477.40..3477.47
    M01_LO=F(lo_dec,100)
    if M01_LO>m01_ach_lo: continue
    for hi_dec in range(347748, 347760):
        M01_HI=F(hi_dec,100)
        if M01_HI<m01_ach_hi: continue
        lnLo=log(float(M01_LO)); lnHi=log(float(M01_HI))
        CL_LO=F(math.floor(lnLo*10**5),10**5)
        CLN=next((n for n in range(15,23) if pExp(CL_LO,n)+eRem(CL_LO,n)<=M01_LO), None)
        if CLN is None: continue
        # CL_HI minimal with idx<=22
        CHN=None; CL_HI=None
        for k in range(0,50):
            c=F(math.ceil(lnHi*10**5)+k,10**5)
            N=next((n for n in range(15,23) if M01_HI<=pExp(c,n)), None)
            if N is not None: CL_HI=c; CHN=N; break
        if CHN is None: continue
        w=float(CL_HI-CL_LO)
        if best is None or w<best[0]:
            best=(w,M01_LO,M01_HI,CL_LO,CL_HI,CLN,CHN)
w,M01_LO,M01_HI,CL_LO,CL_HI,CLN,CHN=best
print("BEST: M01 [%s,%s] cutLog [%s,%s] idx %d/%d width=%.2e"%(M01_LO,M01_HI,CL_LO,CL_HI,CLN,CHN,w))
print("  M01_LO<=ach_lo?%s M01_HI>=ach_hi?%s"%(M01_LO<=m01_ach_lo,M01_HI>=m01_ach_hi))

# assemble
zlo=15707952; zhi=15707970; DEN=10**7
ip_lo=F(DEN,2*zhi); ip_hi=F(DEN,2*zlo)
d=F(16,3)
lo=F(190,3)+d/3*CL_LO*ip_lo
hi=F(190,3)+d/3*CL_HI*ip_hi
par_lo=F(9606370,141381); par_hi=F(9605390,141363)
print("\nassembled lo=%s ~%.7f"%(lo,float(lo)))
print("assembled hi=%s ~%.7f"%(hi,float(hi)))
print("width=%.3e (parent 0.00172; %.1fx tighter)"%(float(hi-lo),0.00172/float(hi-lo)))
print("nested? lo>=par_lo:%s hi<=par_hi:%s ; strict lo<hi:%s"%(lo>=par_lo,hi<=par_hi,lo<hi))
dlo=F(74)+d/2*CL_LO*ip_lo; dhi=F(74)+d/2*CL_HI*ip_hi
print("dressed lo=%s hi=%s"%(dlo,dhi))
print("width_lt: (hi-lo)=%s < parent(%s)? %s"%(hi-lo,par_hi-par_lo,(hi-lo)<(par_hi-par_lo)))
