from fractions import Fraction as F
import mpmath as mp, math
mp.mp.dps = 90

# ---- 1. pB split@6 bracket (exact rationals, from the banked cutCos_bracket pattern) ----
x = F(2,9)
def partialCos(x, N):
    s = F(0)
    for k in range(N):
        s += F((-1)**k) * x**(2*k) / math.factorial(2*k)
    return s
def cosRemBound(x,N):
    return x**(2*N)/F(math.factorial(2*N)) * 1/(1 - x**2/F((2*N+1)*(2*N+2)))
pc6 = partialCos(x,6)
rem6 = cosRemBound(x,6)
# choose clean decimal bounds for pB just outside [pc6-rem6, pc6+rem6]
pB_lo_true = pc6 - rem6
pB_hi_true = pc6 + rem6
print("pB in [", mp.nstr(mp.mpf(pB_lo_true.numerator)/pB_lo_true.denominator,25), ",", mp.nstr(mp.mpf(pB_hi_true.numerator)/pB_hi_true.denominator,25),"]")
# pick pB bounds at 1e15 grid (15 digits after decimal ~ 16 sig digits since ~0.975)
# true p = 0.9754100853894475229...
# lo <= pB, choose lo = 975410085389447/1e15 (=0.975410085389447)  which is < pB_lo_true
# hi >= pB, choose hi = 975410085389448/1e15
pB_lo = F(975410085389447, 10**15)
pB_hi = F(975410085389448, 10**15)
print("chosen pB_lo =", pB_lo, "=", mp.nstr(mp.mpf(pB_lo.numerator)/pB_lo.denominator,25))
print("chosen pB_hi =", pB_hi, "=", mp.nstr(mp.mpf(pB_hi.numerator)/pB_hi.denominator,25))
print("  pB_lo <= pB_lo_true?", pB_lo <= pB_lo_true, "  pB_hi >= pB_hi_true?", pB_hi >= pB_hi_true)
print("  need partialCos6 - rem6 >= pB_lo:", pc6 - rem6 >= pB_lo)
print("  need partialCos6 + rem6 <= pB_hi:", pc6 + rem6 <= pB_hi)
print()

# ---- 2. wB = sqrt2 bracket (from wB*wB=2) ----
# true sqrt2 = 1.41421356237309504880...
# choose lo=1414213562373095/1e15, hi=1414213562373096/1e15 ; check lo^2<=2<=hi^2
wB_lo = F(1414213562373095, 10**15)
wB_hi = F(1414213562373096, 10**15)
print("wB_lo^2 <= 2 <= wB_hi^2 :", wB_lo*wB_lo <= 2, 2 <= wB_hi*wB_hi)
print()

# ---- 3. rB = sqrt(3-3p^2) bracket (from rB*rB = 3-3pB^2) ----
# rB depends on pB. rr = 3 - 3 pB^2. Upper pB -> lower rr; lower pB -> upper rr.
rr_lo = 3 - 3*pB_hi*pB_hi   # lower bound on rr
rr_hi = 3 - 3*pB_lo*pB_lo   # upper bound on rr
r_true = mp.sqrt(3 - 3*(mp.mpf(pB_lo.numerator)/pB_lo.denominator)**2)
print("rr in [", mp.nstr(mp.mpf(rr_lo.numerator)/rr_lo.denominator,25), ",", mp.nstr(mp.mpf(rr_hi.numerator)/rr_hi.denominator,25),"]")
print("r_true ~", mp.nstr(mp.sqrt(3-3*mp.cos(mp.mpf(2)/9)**2),25))
# choose rB bounds: rB_lo^2 <= rr_lo (so rB_lo <= sqrt(rr_lo) <= rB) ; rB_hi^2 >= rr_hi (rB <= sqrt(rr_hi) <= rB_hi)
# true r ~ 0.381740089539534838
rB_lo = F(381740089539534, 10**15)
rB_hi = F(381740089539536, 10**15)
print("rB_lo=",mp.nstr(mp.mpf(rB_lo.numerator)/rB_lo.denominator,25)," rB_hi=",mp.nstr(mp.mpf(rB_hi.numerator)/rB_hi.denominator,25))
print("rB_lo^2 <= rr_lo :", rB_lo*rB_lo <= rr_lo, "   rr_hi <= rB_hi^2 :", rr_hi <= rB_hi*rB_hi)
