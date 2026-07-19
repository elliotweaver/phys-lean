from mpmath import mp, mpf, sqrt, cos, log, factorial
from fractions import Fraction as F
mp.dps = 90

def tomp(a):
    return mpf(a.numerator)/mpf(a.denominator) if isinstance(a,F) else mpf(a)
def pE(a,N):
    aa=tomp(a); return sum(aa**i/factorial(i) for i in range(N))
def rem(a,N):
    aa=tomp(a); return aa**N/factorial(N)*(N+1)/(N+1-aa)

# ---- L_b0 = cutLog mass0 : lower via cert at a_lo, upper via cert at a_hi ----
m0lo=tomp(F(1189719085816627,500000000000000)**2)
m0hi=tomp(F(1189719085816629,500000000000000)**2)
print("mass0 [",m0lo,",",m0hi,"]")
a_lo=F(17337287,10**7); a_hi=F(17337288,10**7)  # width 1e-7
print("L_b0 target [1.7337287,1.7337288]")
for N in [21,24,27,30]:
    lo_ok = pE(a_lo,N)+rem(a_lo,N) <= m0lo
    hi_ok = m0hi <= pE(a_hi,N)
    print(f"  N={N}: lower cert ok={lo_ok}, upper cert ok={hi_ok}")

# ---- L_b2 via cutLog(1/mass2) ----
b2lo=F(58021191,10**8); b2hi=F(580211935,10**9)
m2lo=tomp(b2lo**2); m2hi=tomp(b2hi**2)
inv2lo=1/m2hi; inv2hi=1/m2lo
print("\n1/mass2 [",inv2lo,",",inv2hi,"]  true",1/(cos(mpf(2)/9)*0+ (1-sqrt(2)*(cos(mpf(2)/9)-sqrt(3-3*cos(mpf(2)/9)**2))/2)**2))
al=F(10887237,10**7); ah=F(10887238,10**7)
print("cutLog(1/mass2) target [1.0887237,1.0887238]")
for N in [14,16,18,20]:
    lo_ok = pE(al,N)+rem(al,N) <= inv2lo
    hi_ok = inv2hi <= pE(ah,N)
    print(f"  N={N}: lower cert ok={lo_ok}, upper cert ok={hi_ok}")

# ---- L_mb via cutLog(1/mbRatio), mbRatio=(10-7wB)/6 ----
wBlo=F(1414213562,10**9); wBhi=F(1414213563,10**9)
mb_hi=(10-7*wBlo)/6; mb_lo=(10-7*wBhi)/6
invmb_lo=1/mb_hi; invmb_hi=1/mb_lo
print("\n1/mbRatio [",tomp(invmb_lo),",",tomp(invmb_hi),"]")
bl=F(40893066,10**7); bh=F(40893067,10**7)
print("cutLog(1/mbRatio) target [4.0893066,4.0893067]")
for N in [26,30,34,38,42]:
    lo_ok = pE(bl,N)+rem(bl,N) <= tomp(invmb_lo)
    hi_ok = tomp(invmb_hi) <= pE(bh,N)
    print(f"  N={N}: lower cert ok={lo_ok}, upper cert ok={hi_ok}")

# ---- Assemble endpoint width with sharpened inputs ----
kap=(1/__import__('mpmath').pi)/3
# use widths: L_m01 1e-11, L_b0 1e-7, L_b2 1e-7, L_mb 1e-7, 1/pi 2e-12
print("\nendpoint width est (rough):",
      2*kap*mpf('1e-11') + (mpf(11)/3)*kap*mpf('1e-7') + (mpf(5)/3)*kap*mpf('1e-7') + (mpf(7)/3)*kap*mpf('1e-7'))
