from mpmath import mp, mpf, sqrt, cos, log, e, factorial
from fractions import Fraction as F
mp.dps = 90

q = 1/sqrt(2); p = cos(mpf(2)/9); w = sqrt(2); r = sqrt(3-3*p*p)
b0=1+w*p; b2=1-w*(p-r)/2
mass0=b0*b0; mass2=b2*b2
mbRatio=(10 - 7*sqrt(2))/6

def tomp(a):
    return mpf(a.numerator)/a.denominator if isinstance(a,F) else mpf(a)
def partialExp(a, N):
    aa=tomp(a); return sum(aa**i/factorial(i) for i in range(N))
def remBound(a, N):
    aa=tomp(a); return aa**N/factorial(N) * (N+1)/(N+1-aa)

print("=== L_b0 = cutLog mass0 ; true", log(mass0))
# NB11 sharp mass0 bracket (rational):
m0lo=F(1189719085816627,500000000000000)**2
m0hi=F(1189719085816629,500000000000000)**2
print("mass0 rat lo", float(m0lo), "hi", float(m0hi))
# target L_b0 bracket width 1e-7: [17337287/1e7, 17337288/1e7]
a_lo=F(17337287,10**7); a_hi=F(17337288,10**7)
print("target L_b0 [", float(a_lo), ",", float(a_hi), "]")
# need partialExp(a_lo,N)+rem <= m0lo  and m0hi <= partialExp(a_hi,N)
for N in [21,24,27,30]:
    lhs=partialExp(a_lo,N)+remBound(a_lo,N)
    rhs=partialExp(a_hi,N)
    print(f"  N={N}: pE(a_lo)+rem={float(lhs):.12f} <= m0lo={float(m0lo):.12f}? {lhs<=m0lo};  m0hi={float(m0hi):.12f}<=pE(a_hi)={float(rhs):.12f}? {m0hi<=rhs}")

print()
print("=== L_b2 = cutLog mass2 ; via cutLog(1/mass2) true", log(1/mass2))
# mass2 sharp from NB4 wp/wr sharp: b2 in [0.58021191,0.580211935]
b2lo=F(58021191,10**8); b2hi=F(580211935,10**9)
m2lo=b2lo**2; m2hi=b2hi**2
print("mass2 rat lo", float(m2lo), "hi", float(m2hi))
inv2lo=1/m2hi; inv2hi=1/m2lo
print("1/mass2 rat lo", float(inv2lo), "hi", float(inv2hi), " true", float(1/mass2))
# cutLog(1/mass2) true 1.08872372522; target [10887237/1e7, 10887238/1e7]
a2_lo=F(10887237,10**7); a2_hi=F(10887238,10**7)
print("target cutLog(1/mass2) [", float(a2_lo),",", float(a2_hi),"]")
for N in [14,16,18,20]:
    lhs=partialExp(a2_lo,N)+remBound(a2_lo,N)
    rhs=partialExp(a2_hi,N)
    print(f"  N={N}: pE(a_lo)+rem <= inv2lo? {lhs<=inv2lo} ({float(lhs):.10f}<={float(inv2lo):.10f});  inv2hi<=pE(a_hi)? {inv2hi<=rhs} ({float(inv2hi):.10f}<={float(rhs):.10f})")

print()
print("=== L_mb = cutLog mbRatioDerived ; via cutLog(1/mbRatio) true", log(1/mbRatio))
# mbRatio = (10-7wB)/6, wB sharp [1414213562/1e9,1414213563/1e9]
wBlo=F(1414213562,10**9); wBhi=F(1414213563,10**9)
mb_hi=(10-7*wBlo)/6  # decreasing in wB
mb_lo=(10-7*wBhi)/6
print("mbRatio rat [", float(mb_lo),",", float(mb_hi),"] true", float(mbRatio))
invmb_lo=1/mb_hi; invmb_hi=1/mb_lo
print("1/mbRatio rat [", float(invmb_lo),",", float(invmb_hi),"] true", float(1/mbRatio))
# cutLog(1/mbRatio) true 4.089306640; target [40893066/1e7, 40893067/1e7]
a3_lo=F(40893066,10**7); a3_hi=F(40893067,10**7)
print("target cutLog(1/mbRatio) [", float(a3_lo),",", float(a3_hi),"]")
for N in [26,30,34,38]:
    lhs=partialExp(a3_lo,N)+remBound(a3_lo,N)
    rhs=partialExp(a3_hi,N)
    print(f"  N={N}: pE(a_lo)+rem <= invmb_lo? {lhs<=invmb_lo};  invmb_hi<=pE(a_hi)? {invmb_hi<=rhs}")
