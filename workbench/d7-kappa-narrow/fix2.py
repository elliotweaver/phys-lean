from fractions import Fraction as F
from math import factorial
from mpmath import mp, mpf, log, floor as mfloor, ceil as mceil
mp.dps=100
def to_mpf(fr): return mpf(fr.numerator)/mpf(fr.denominator)
def partialExp(a,N): a=to_mpf(a); return sum(a**i/factorial(i) for i in range(N))
def expRem(a,N): a=to_mpf(a); return (a**N/factorial(N))/(1-a/(N+1))

# mbRatio source: mb in [16750843898055717/1e18, 16750843898055843/1e18]
# => 1/mb in [1e18/16750843898055843, 1e18/16750843898055717]
inv_lo = F(10**18,16750843898055843); inv_hi=F(10**18,16750843898055717)
print("1/mb in [%s, %s] = [%.15f, %.15f]" % (inv_lo, inv_hi, float(inv_lo), float(inv_hi)))
# log(1/mb) true bounds
L_lo_true = log(to_mpf(inv_lo)); L_hi_true = log(to_mpf(inv_hi))
print("log(1/mb) in [%.16f, %.16f]" % (float(L_lo_true), float(L_hi_true)))
# Choose a_lo = floor(L_lo_true*1e14)/1e14 (<= true), a_hi = ceil(L_hi_true*1e14)/1e14 (>= true)
G=10**14
a_lo=F(int(mfloor(L_lo_true*G)),G); a_hi=F(int(mceil(L_hi_true*G)),G)
print("a_lo=%d/1e14 a_hi=%d/1e14  width %.2e" % (int(a_lo*G), int(a_hi*G), float(a_hi-a_lo)))
# cert_lo: partialExp(a_lo,N)+rem <= inv_lo   (a_lo <= log inv_lo)
for N in range(26,42):
    if partialExp(a_lo,N)+expRem(a_lo,N) <= to_mpf(inv_lo):
        print(f"  cert_lo a_lo idx{N}: OK"); nlo=N; break
else: print("  cert_lo NEVER"); nlo=None
# cert_hi: inv_hi <= partialExp(a_hi,N)
for N in range(26,42):
    if to_mpf(inv_hi) <= partialExp(a_hi,N):
        print(f"  cert_hi a_hi idx{N}: OK"); nhi=N; break
else: print("  cert_hi NEVER"); nhi=None
print("  => L_mb in [%d/1e14, %d/1e14] (= -a_hi, -a_lo)" % (-int(a_hi*G), -int(a_lo*G)))
print("     L_mb_lo=%d/1e14  L_mb_hi=%d/1e14" % (-int(a_hi*G), -int(a_lo*G)))
print()

# Also recheck L_b0 and L_b2 the same rigorous way
print("=== L_b0 (mass0) ===")
b0_lo=F(2379438171633255409,10**18); b0_hi=F(2379438171633255413,10**18)
m0lo=b0_lo*b0_lo; m0hi=b0_hi*b0_hi
# pick mass0 bracket at 1e15
m0lo15=F(int(mfloor(to_mpf(m0lo)*10**15)),10**15); m0hi15=F(int(mceil(to_mpf(m0hi)*10**15)),10**15)
print("mass0 in [%d/1e15, %d/1e15]  m0lo15<=b0lo^2? %s  b0hi^2<=m0hi15? %s" %
      (int(m0lo15*10**15), int(m0hi15*10**15), m0lo15<=m0lo, m0hi<=m0hi15))
Ll=log(to_mpf(m0lo15)); Lh=log(to_mpf(m0hi15))
alo=F(int(mfloor(Ll*G)),G); ahi=F(int(mceil(Lh*G)),G)
print("L_b0 in [%d/1e14, %d/1e14]" % (int(alo*G), int(ahi*G)))
for N in range(18,26):
    if partialExp(alo,N)+expRem(alo,N)<=to_mpf(m0lo15): print(f"  cert_lo idx{N}: OK"); break
for N in range(18,26):
    if to_mpf(m0hi15)<=partialExp(ahi,N): print(f"  cert_hi idx{N}: OK"); break
print()
print("=== L_b2 (mass2) ===")
# corrected b2/mass2 brackets
b2lo=F(5802119201475372,10**16); b2hi=F(5802119201475373,10**16)
m2lo=F(3366458722812920,10**16); m2hi=F(3366458722812923,10**16)
print("m2lo<=b2lo^2? %s  b2hi^2<=m2hi? %s" % (m2lo<=b2lo*b2lo, b2hi*b2hi<=m2hi))
inv2lo=F(1,1)/m2hi; inv2hi=F(1,1)/m2lo
Ll=log(to_mpf(inv2lo)); Lh=log(to_mpf(inv2hi))
alo=F(int(mfloor(Ll*G)),G); ahi=F(int(mceil(Lh*G)),G)
print("L_b2^-1 in [%d/1e14, %d/1e14] => L_b2 in [%d/1e14, %d/1e14]" % (int(alo*G),int(ahi*G),-int(ahi*G),-int(alo*G)))
for N in range(14,24):
    if partialExp(alo,N)+expRem(alo,N)<=to_mpf(inv2lo): print(f"  cert_lo idx{N}: OK"); break
for N in range(14,24):
    if to_mpf(inv2hi)<=partialExp(ahi,N): print(f"  cert_hi idx{N}: OK"); break
