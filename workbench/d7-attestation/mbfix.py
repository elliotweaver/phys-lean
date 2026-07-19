from mpmath import mp
from math import factorial
from fractions import Fraction as F
mp.dps = 90
def pE(a,N): return sum(a**i/factorial(i) for i in range(N))
def rem(a,N): return a**N/factorial(N)*(N+1)/((N+1)-a)
def f(x): return float(mp.mpf(x.numerator)/mp.mpf(x.denominator))

qlo=F(707106781,10**9); qhi=F(707106782,10**9)
def mb(qq): return (1-qq)**2/(3*(1+qq))
mb_lo=mb(qhi); mb_hi=mb(qlo)   # mb decreasing in q
print("mb_lo=",f(mb_lo)," mb_hi=",f(mb_hi)," width",f(mb_hi-mb_lo))
# tight clean brackets on 1e12 grid
cmb_lo=F(16750843797,10**12); cmb_hi=F(16750843922,10**12)
print("cmb_lo<=mb_lo:", cmb_lo<=mb_lo, " mb_hi<=cmb_hi:", mb_hi<=cmb_hi)
invmb_lo=1/cmb_hi; invmb_hi=1/cmb_lo
print("1/mbRatio in [", f(invmb_lo), ",", f(invmb_hi), "]  width", f(invmb_hi-invmb_lo))
bl=F(40893066,10**7); bh=F(40893067,10**7)
print("cutLog(1/mbRatio) target [4.0893066,4.0893067]")
for N in [26,27,28]:
    print(f"  N={N}: lower(pE(bl)+rem<=invmb_lo)={pE(bl,N)+rem(bl,N)<=invmb_lo}  upper(invmb_hi<=pE(bh))={invmb_hi<=pE(bh,N)}")
