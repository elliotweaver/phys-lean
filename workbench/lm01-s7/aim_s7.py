from fractions import Fraction as F
import mpmath as mp
mp.mp.dps = 120

def fn(fr, n=30):
    return mp.nstr(mp.mpf(fr.numerator) / fr.denominator, n)

# ============================================================================
# s7 = ONE STEP DEEPER THAN NarrowedBracket11's s6.
#   split@7 cos read (partialCos (2/9) 7, cosRemBound (2/9) 7)
#   -> tighter pB (target ~1e-18 grid)
#   -> re-propagate amplitude chain (wB, rB, wp, wr, b0, b1, mass0, mass1)
#   -> tighter m01 = mass0/mass1
#   -> cutLog(m01) via exp instrument at a deeper partial-sum index.
# ============================================================================

x = F(2, 9)

# ---- partialCos (2/9) 7 exactly (rational) ----
# cosTermC x i = (-1)^i x^(2i) / (2i)!
import math
def partialCos(x, N):
    s = F(0)
    for i in range(N):
        s += F((-1)**i) * x**(2*i) / F(math.factorial(2*i))
    return s

pc7 = partialCos(x, 7)
print("partialCos(2/9,7) =", pc7.numerator, "/", pc7.denominator)
print("  ~", fn(pc7, 30))

# ---- cosRemBound (2/9) 7 ----
# ((2/9)^(14)/14!) * (1 - (2/9)^2/((15)(16)))^-1
N = 7
num = x**(2*N) / F(math.factorial(2*N))
den = (1 - x**2 / F((2*N+1)*(2*N+2)))
crem7 = num / den
print("cosRemBound(2/9,7) ~", fn(crem7, 10))
# choose a simple rational upper bound for crem7 (like 4/1e17 at s6). Need a clean bound >= crem7.
# crem7 magnitude:
mag = mp.mpf(crem7.numerator)/crem7.denominator
print("crem7 magnitude exponent:", mp.log10(mag))

# true cutCos(2/9):
p_true = mp.cos(mp.mpf(2)/9)
print("cutCos(2/9) true ~", mp.nstr(p_true, 30))

# pick pB bracket on 1e18 grid
# lower = pc7 - crem_bound, upper = pc7 + crem_bound where crem_bound is a clean rational >= crem7
# crem7 ~ 10^-20, so a bound like 1/1e19 works and is >> crem7.
crem_bound = F(1, 10**19)
print("crem_bound >= crem7:", crem_bound >= crem7)
pB_lo_real = pc7 - crem_bound
pB_hi_real = pc7 + crem_bound
print("pB real bracket width:", fn(pB_hi_real - pB_lo_real, 5))

G = 10**18
def flo(x, G): return F(int(mp.floor(mp.mpf(x.numerator)/x.denominator*G)), G)
def fhi(x, G): return F(int(mp.ceil (mp.mpf(x.numerator)/x.denominator*G)), G)
pB_lo = flo(pB_lo_real, G)
pB_hi = fhi(pB_hi_real, G)
print("pB_lo =", pB_lo.numerator, "/", pB_lo.denominator, "  ~", fn(pB_lo, 25))
print("pB_hi =", pB_hi.numerator, "/", pB_hi.denominator, "  ~", fn(pB_hi, 25))
print("pB bracket ok (lo<=real, hi>=real):", pB_lo <= pB_lo_real, pB_hi >= pB_hi_real)
print("pB width:", fn(pB_hi - pB_lo, 5))
print()

# ---- wB = sqrt2 on 1e18 grid ----
w_true = mp.sqrt(2)
wB_lo = flo(F(int(mp.floor(w_true*G)), G), G)
wB_hi = fhi(F(int(mp.ceil(w_true*G)), G), G)
# ensure wB_lo^2 <= 2 <= wB_hi^2
while wB_lo*wB_lo > 2: wB_lo -= F(1,G)
while wB_hi*wB_hi < 2: wB_hi += F(1,G)
print("wB_lo =", wB_lo.numerator, "/", wB_lo.denominator, " (wB_lo^2<=2:", wB_lo*wB_lo<=2, ")")
print("wB_hi =", wB_hi.numerator, "/", wB_hi.denominator, " (wB_hi^2>=2:", wB_hi*wB_hi>=2, ")")
print()

# ---- rB: rr = 3 - 3 pB^2 ----
rr_lo = 3 - 3*pB_hi*pB_hi   # lower bound on rr
rr_hi = 3 - 3*pB_lo*pB_lo   # upper bound on rr
r_true = mp.sqrt(3 - 3*p_true*p_true)
print("rB true ~", mp.nstr(r_true, 25))
rB_lo = F(int(mp.floor(r_true*G)) - 2, G)
rB_hi = F(int(mp.ceil (r_true*G)) + 2, G)
while rB_lo*rB_lo > rr_lo: rB_lo -= F(1,G)
while rB_hi*rB_hi < rr_hi: rB_hi += F(1,G)
print("rB_lo =", rB_lo.numerator, "/", rB_lo.denominator, " (rB_lo^2<=rr_lo:", rB_lo*rB_lo<=rr_lo, ")")
print("rB_hi =", rB_hi.numerator, "/", rB_hi.denominator, " (rB_hi^2>=rr_hi:", rB_hi*rB_hi>=rr_hi, ")")
print()

# ---- products wp = wB*pB, wr = wB*rB ----
wp_lo = flo(wB_lo*pB_lo, G)
wp_hi = fhi(wB_hi*pB_hi, G)
wr_lo = flo(wB_lo*rB_lo, G)
wr_hi = fhi(wB_hi*rB_hi, G)
print("wp_lo<=wB_lo*pB_lo:", wp_lo <= wB_lo*pB_lo, " wp_hi>=wB_hi*pB_hi:", wp_hi >= wB_hi*pB_hi)
print("wr_lo<=wB_lo*rB_lo:", wr_lo <= wB_lo*rB_lo, " wr_hi>=wB_hi*rB_hi:", wr_hi >= wB_hi*rB_hi)

# ---- amplitudes ----
b0_lo = 1 + wp_lo
b0_hi = 1 + wp_hi
b1_lo = 1 - (wp_hi + wr_hi)/2
b1_hi = 1 - (wp_lo + wr_lo)/2
print("b0 in [", fn(b0_lo), ",", fn(b0_hi), "]")
print("b1 in [", fn(b1_lo), ",", fn(b1_hi), "]  (b1_lo>0:", b1_lo>0, ")")

# ---- masses ----
mass0_lo = b0_lo*b0_lo
mass0_hi = b0_hi*b0_hi
mass1_lo = b1_lo*b1_lo
mass1_hi = b1_hi*b1_hi

# ---- m01 = mass0/mass1 ----
m01_lo_real = mass0_lo/mass1_hi
m01_hi_real = mass0_hi/mass1_lo
print("m01 real bracket: [", fn(m01_lo_real, 25), ",", fn(m01_hi_real, 25), "]")
print("m01 real width:", fn(m01_hi_real - m01_lo_real, 5))

# choose m01 rational bracket. s6 was [3477472837103/1e9, 3477472837106/1e9] width 3e-6.
# target ~1e-8 or better on 1e11 grid.
Gm = 10**11
m01_lo = F(int(mp.floor(mp.mpf(m01_lo_real.numerator)/m01_lo_real.denominator*Gm)), Gm)
m01_hi = F(int(mp.ceil (mp.mpf(m01_hi_real.numerator)/m01_hi_real.denominator*Gm)), Gm)
print("m01_lo =", m01_lo.numerator, "/", m01_lo.denominator, " ~", fn(m01_lo, 25))
print("m01_hi =", m01_hi.numerator, "/", m01_hi.denominator, " ~", fn(m01_hi, 25))
# lower lemma:  m01_lo * mass1_hi <= mass0_lo
# upper lemma:  mass0_hi <= m01_hi * mass1_lo
print("lower lemma m01_lo*mass1_hi <= mass0_lo:", m01_lo*mass1_hi <= mass0_lo)
print("upper lemma mass0_hi <= m01_hi*mass1_lo:", mass0_hi <= m01_hi*mass1_lo)
print("m01 width:", fn(m01_hi - m01_lo, 5), " (", (m01_hi-m01_lo)*Gm, "grid units )")
print()

# ---- cutLog(m01) ----
L_true = mp.log(mp.mpf(m01_lo.numerator)/m01_lo.denominator)
print("cutLog(m01) true ~", mp.nstr(mp.log(m01_lo_real*mp.mpf(1)), 30) if False else mp.nstr(mp.log(mp.mpf(m01_lo_real.numerator)/m01_lo_real.denominator), 30))
Lreal_lo = mp.log(mp.mpf(m01_lo.numerator)/m01_lo.denominator)
Lreal_hi = mp.log(mp.mpf(m01_hi.numerator)/m01_hi.denominator)
print("cutLog bracket-from-m01: [", mp.nstr(Lreal_lo,20), ",", mp.nstr(Lreal_hi,20), "]")
print("  cutLog width from m01:", mp.nstr(Lreal_hi-Lreal_lo, 5))
