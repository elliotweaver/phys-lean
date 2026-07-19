from fractions import Fraction as F
from mpmath import mp
from math import factorial
mp.dps=90
def pE(a,N): return sum(a**i/factorial(i) for i in range(N))
def rem(a,N): return a**N/factorial(N)*(N+1)/((N+1)-a)
def f(x): return float(mp.mpf(x.numerator)/mp.mpf(x.denominator))

# NB11 mass0 bounds (exact):
m0lo = F(1189719085816627,500000000000000)**2
m0hi = F(1189719085816629,500000000000000)**2
print("mass0 NB11 [",f(m0lo),",",f(m0hi),"] width",f(m0hi-m0lo))
# clean rational brackets: c0lo<=m0lo, m0hi<=c0hi
c0lo=F(5661726012625402,10**15); c0hi=F(5661726012625422,10**15)
print("c0lo<=m0lo:", c0lo<=m0lo, " m0hi<=c0hi:", m0hi<=c0hi)
# L_b0 target [1.7337287,1.7337288]
al=F(17337287,10**7); ah=F(17337288,10**7)
for N in [21,22]:
    print(f" L_b0 N={N}: lower={pE(al,N)+rem(al,N)<=c0lo} upper={c0hi<=pE(ah,N)}")

# b2/mass2 from NB4-sharp products (7-digit):
b2lo=1-(F(137943818,10**8)-F(53986200,10**8))/2
b2hi=1-(F(137943816,10**8)-F(53986203,10**8))/2
m2lo=b2lo**2; m2hi=b2hi**2
print("\nmass2 [",f(m2lo),",",f(m2hi),"]")
c2lo=F(33664586,10**8); c2hi=F(3366459,10**7)
print("c2lo<=m2lo:", c2lo<=m2lo, " m2hi<=c2hi:", m2hi<=c2hi)
inv2lo=1/c2hi; inv2hi=1/c2lo
al2=F(10887236,10**7); ah2=F(10887238,10**7)
for N in [14,15,16]:
    print(f" L_b2 N={N}: lower={pE(al2,N)+rem(al2,N)<=inv2lo} upper={inv2hi<=pE(ah2,N)}")

# mbRatio from q
qlo=F(707106781,10**9); qhi=F(707106782,10**9)
def mb(qq): return (1-qq)**2/(3*(1+qq))
mb_lo=mb(qhi); mb_hi=mb(qlo)
cmb_lo=F(16750843797,10**12); cmb_hi=F(16750843922,10**12)
print("\ncmb_lo<=mb_lo:", cmb_lo<=mb_lo, " mb_hi<=cmb_hi:", mb_hi<=cmb_hi)
invmb_lo=1/cmb_hi; invmb_hi=1/cmb_lo
bl=F(40893066,10**7); bh=F(40893067,10**7)
for N in [26,27]:
    print(f" L_mb N={N}: lower={pE(bl,N)+rem(bl,N)<=invmb_lo} upper={invmb_hi<=pE(bh,N)}")
