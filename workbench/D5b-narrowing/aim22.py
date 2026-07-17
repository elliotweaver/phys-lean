from fractions import Fraction as F
from math import factorial, log, sqrt, pi
import math

def pExp(q,N): return sum(q**i/F(factorial(i)) for i in range(N))
def eRem(q,N): return (q**N/F(factorial(N)))*(1/(1-q/F(N+1)))
def pCos(x,N): return sum(F((-1)**i)*x**(2*i)/F(factorial(2*i)) for i in range(N))
def cRem(x,N): return (x**(2*N)/F(factorial(2*N)))*(1/(1-x*x/F((2*N+1)*(2*N+2))))

# ==== FRONT 1 fixed: split@4 cutCos(2/9) -> m01 ~ [3477.44,3477.48], cutLog endpoints with SAFE exp index ====
M01_LO=F(347744,100); M01_HI=F(347748,100)
lnLo=log(float(M01_LO)); lnHi=log(float(M01_HI))
print("ln(m01) in [%.9f, %.9f]  true 8.154061"%(lnLo,lnHi))
# LOWER cutLog: CL_LO<=lnLo, smallest index. CL_LO at 5 dec floor:
for decs in [5,6]:
    CL_LO=F(math.floor(lnLo*10**decs),10**decs)
    N=next((n for n in range(15,22) if pExp(CL_LO,n)+eRem(CL_LO,n)<=M01_LO), None)
    print("  CL_LO(%dd)=%s idxLO=%s"%(decs,CL_LO,N))
# UPPER cutLog: want smallest index<=21. Bigger CL_HI margin -> smaller index. Sweep CL_HI at 5 dec.
print("  --- CL_HI options (want idx<=21) ---")
for k in range(0,20):
    CL_HI=F(math.ceil(lnHi*10**5)+k,10**5)
    N=next((n for n in range(15,22) if M01_HI<=pExp(CL_HI,n)), None)
    if N is not None:
        print("  CL_HI=%s (=%0.5f) idxHI=%d width_from_CL_LO(6d)=%.2e"%(CL_HI,float(CL_HI),N, float(CL_HI-F(math.floor(lnLo*10**6),10**6))))
        if N<=21: break

# Choose CL_LO 6d, CL_HI first with idx<=21
CL_LO=F(math.floor(lnLo*10**6),10**6)
CLN=next(n for n in range(15,25) if pExp(CL_LO,n)+eRem(CL_LO,n)<=M01_LO)
CL_HI=None
for k in range(0,30):
    c=F(math.ceil(lnHi*10**5)+k,10**5)
    N=next((n for n in range(15,22) if M01_HI<=pExp(c,n)), None)
    if N is not None and N<=21:
        CL_HI=c; CHN=N; break
print("\nCHOSEN cutLog: [%s,%s] width=%.2e idxLO=%d idxHI=%d"%(CL_LO,CL_HI,float(CL_HI-CL_LO),CLN,CHN))

# ==== FRONT 2: balance. Try split@5 lower + split@6 upper for tight 1/cutPi ====
print("\n--- FRONT 2 endpoint options ---")
for zlo_n,zhi_n,slo,shi in [(1570790,1570847,5,4),(1570790,1570800,5,6),(1570795,1570800,5,6),(1570792,1570799,5,6)]:
    zlo=F(zlo_n,10**7); zhi=F(zhi_n,10**7)
    vlo=pCos(zlo,slo)-cRem(zlo,slo)
    vhi=pCos(zhi,shi)+cRem(zhi,shi)
    okpoly = None  # positivity poly value at zlo for split@5
    # poly = 1 - x^2/2 + x^4/24 - x^6/720 + x^8/40320 - x^10/1814400
    xx=zlo
    poly=1 - xx**2/2 + xx**4/24 - xx**6/720 + xx**8/40320 - xx**10/F(1814400)
    ip_lo=F(1,2)/zhi; ip_hi=F(1,2)/zlo
    print("z[%d,%d]@(%d,%d): lowerPOS=%s(margin poly=%.2e) upperNEG=%s ; 1/cutPi width=%.2e"%(
        zlo_n,zhi_n,slo,shi, vlo>0, float(poly), vhi<0, float(ip_hi-ip_lo)))
