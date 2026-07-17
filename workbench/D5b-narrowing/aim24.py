from fractions import Fraction as F
from math import factorial, log, sqrt, pi
import math
DEN=10**7
def pCos(x,N): return sum(F((-1)**i)*x**(2*i)/F(factorial(2*i)) for i in range(N))
def cRem(x,N): return (x**(2*N)/F(factorial(2*N)))*(1/(1-x*x/F((2*N+1)*(2*N+2))))

# split@5 lower with TIGHTER factor. factor f = (1-x²/132)^-1. For x<zlo, x²<zlo².
# poly_f(x) = 1 - x²/2 + x⁴/24 - x⁶/720 + x⁸/40320 - f·x¹⁰/3628800 must be >0.
# The remainder <= (x¹⁰/10!)·f. With f a constant upper bound valid for x<=zlo.
# Find largest zlo s.t. with f = (1-zlo²/132)^-1 rounded up, poly_f(zlo)>0.
def poly_f(x, fnum, fden):  # subtract (fnum/fden)*x^10/3628800
    return 1 - x**2/2 + x**4/24 - x**6/720 + x**8/40320 - F(fnum,fden)*x**10/F(3628800)

print("=== split@5 LOWER reach with tight factor ===")
for zlo_n in [15707940,15707950,15707955,15707958,15707960,15707962]:
    x=F(zlo_n,DEN)
    x2=x*x
    fbound=1/(1-x2/132)   # exact factor upper bound at x=zlo (max over [0,zlo])
    # pick rational f >= fbound, say ceil to 4 dec
    fnum=math.ceil(float(fbound)*10000); fden=10000
    p=poly_f(x,fnum,fden)
    print("zlo=%d f<=%.4f(=%d/%d): poly=%.3e >0?%s"%(zlo_n,float(fbound),fnum,fden,float(p),p>0))

print("\n=== split@6 UPPER sign reach (cheap, no nlinarith) ===")
for zhi_n in [15707970,15707966,15707965,15707964]:
    x=F(zhi_n,DEN)
    p6=pCos(x,6)
    rem6=x**12/F(factorial(12))*2   # <=2 factor bound; actual /239500800*... 
    print("zhi=%d partialCos6=%.3e + rem6bound=%.3e = %.3e <0?%s"%(zhi_n,float(p6),float(rem6),float(p6+rem6),(p6+rem6)<0))

# Chosen front-2: zlo=15707958, zhi=15707966
zlo=15707958; zhi=15707966
ip_lo=F(DEN,2*zhi); ip_hi=F(DEN,2*zlo)
print("\nChosen front2: leastZero in [%d,%d]/1e7, 1/cutPi=[%s,%s] width=%.2e"%(zlo,zhi,ip_lo,ip_hi,float(ip_hi-ip_lo)))

# assembled with cutLog [8154051/1e6, 815419/1e5] (idx 22/21) and this 1/cutPi
CL_LO=F(8154051,10**6); CL_HI=F(815419,10**5)
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
