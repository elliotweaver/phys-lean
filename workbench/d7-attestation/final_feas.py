from mpmath import mp, mpf, sqrt
from math import factorial
from fractions import Fraction as F
mp.dps = 90

def pE(a,N):
    return sum(a**i/factorial(i) for i in range(N))   # exact Fraction partial sum
def rem(a,N):
    return a**N/factorial(N) * (N+1)/((N+1)-a)          # exact Fraction

qlo=F(707106781,10**9); qhi=F(707106782,10**9)
print("q_lo^2 <= 1/2 ?", qlo*qlo <= F(1,2), " q_hi^2 >= 1/2 ?", qhi*qhi >= F(1,2))

def mb(qq): return (1-qq)**2/(3*(1+qq))
mb_lo=mb(qhi); mb_hi=mb(qlo)
invmb_lo=1/mb_hi; invmb_hi=1/mb_lo
print("1/mbRatio [",float(invmb_lo),",",float(invmb_hi),"]")

bl=F(40893066,10**7); bh=F(40893067,10**7)
print("--- cutLog(1/mbRatio) target [4.0893066,4.0893067]")
for N in [26,28,30]:
    print(f"  N={N}: lower={pE(bl,N)+rem(bl,N) <= invmb_lo} upper={invmb_hi <= pE(bh,N)}")

m0lo=F(1189719085816627,500000000000000)**2
m0hi=F(1189719085816629,500000000000000)**2
al=F(17337287,10**7); ah=F(17337288,10**7)
print("--- cutLog mass0 target [1.7337287,1.7337288]")
for N in [21,23,25]:
    print(f"  N={N}: lower={pE(al,N)+rem(al,N) <= m0lo} upper={m0hi <= pE(ah,N)}")

b2lo=F(58021191,10**8); b2hi=F(580211935,10**9)
m2lo=b2lo**2; m2hi=b2hi**2
inv2lo=1/m2hi; inv2hi=1/m2lo
al2=F(10887236,10**7); ah2=F(10887238,10**7)
print("--- cutLog(1/mass2) target [1.0887236,1.0887238]")
for N in [14,16,18]:
    print(f"  N={N}: lower={pE(al2,N)+rem(al2,N) <= inv2lo} upper={inv2hi <= pE(ah2,N)}")
