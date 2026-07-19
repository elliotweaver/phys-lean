from mpmath import mp, mpf, log, sqrt, floor, ceil
mp.dps = 80

def frac(x, denpow):
    # tight rationals bracketing x at 10^denpow grid
    d = mpf(10)**denpow
    lo = int(floor(x*d))
    hi = int(ceil(x*d))
    if hi == lo: hi = lo+1
    return lo, hi, denpow

# L_b0 = log(mass0)
m0_lo = mpf(5661726012625402)/mpf(10**15)
m0_hi = mpf(5661726012625422)/mpf(10**15)
Lb0_lo_true = log(m0_lo); Lb0_hi_true = log(m0_hi)
print("L_b0 true endpoints:", mp.nstr(Lb0_lo_true,18), mp.nstr(Lb0_hi_true,18))
# choose 13-digit rationals: a below Lb0_lo_true, b above Lb0_hi_true, at 1e12 grid
a_num = int(floor(Lb0_lo_true*mpf(10)**12))
b_num = int(ceil(Lb0_hi_true*mpf(10)**12))
print("L_b0 bracket @1e12: [", a_num, "/1e12,", b_num, "/1e12], width", (b_num-a_num), "e-12")
print("  a =", mp.nstr(mpf(a_num)/mpf(10)**12,18), " b =", mp.nstr(mpf(b_num)/mpf(10)**12,18))
# margin for cert: c_lo - exp(a) ; need expRemBound(a,N) <= this
from mpmath import exp, factorial
a = mpf(a_num)/mpf(10)**12
margin_lo = m0_lo - exp(a)
print("  margin_lo (c_lo - exp(a)) =", mp.nstr(margin_lo,6))
b = mpf(b_num)/mpf(10)**12
margin_hi = exp(b) - m0_hi
print("  margin_hi (exp(b) - c_hi) =", mp.nstr(margin_hi,6))
def rembound(q,N):
    return q**N/factorial(N)*(1/(1-q/(N+1)))
for N in [18,20,21,22,24]:
    print(f"  expRemBound(a,{N}) = {mp.nstr(rembound(a,N),4)}  (need <= margin_lo {mp.nstr(margin_lo,4)})")
print()

# L_b2 = log(mass2)
wp_lo = mpf(689719085816627)/mpf(500000000000000); wp_hi = mpf(689719085816629)/mpf(500000000000000)
wr_lo = mpf(269931005964161)/mpf(500000000000000); wr_hi = mpf(269931005964169)/mpf(500000000000000)
b2_lo = 1-(wp_hi-wr_lo)/2; b2_hi = 1-(wp_lo-wr_hi)/2
mass2_lo = b2_lo*b2_lo; mass2_hi = b2_hi*b2_hi
# use 1/mass2 approach like rung1
inv2_lo = 1/mass2_hi; inv2_hi = 1/mass2_lo
Linv2_lo_true = log(inv2_lo); Linv2_hi_true = log(inv2_hi)
print("cutLog(1/mass2) true:", mp.nstr(Linv2_lo_true,18), mp.nstr(Linv2_hi_true,18))
a2n = int(floor(Linv2_lo_true*mpf(10)**12)); b2n = int(ceil(Linv2_hi_true*mpf(10)**12))
print("  bracket @1e12: [", a2n,"/1e12,", b2n,"/1e12], width", b2n-a2n,"e-12")
a2 = mpf(a2n)/mpf(10)**12
print("  margin_lo =", mp.nstr(inv2_lo - exp(a2),6))
for N in [14,15,16,18]:
    print(f"  expRemBound(a2={mp.nstr(a2,4)},{N}) = {mp.nstr(rembound(a2,N),4)}")
print()

# L_mb: q at deeper grid. q^2 = 1/2, push q to 13 digits
q = 1/sqrt(2)
print("q true =", mp.nstr(q,20))
qn_lo = int(floor(q*mpf(10)**12)); qn_hi = int(ceil(q*mpf(10)**12))
print("q @1e12: [", qn_lo,"/1e12,", qn_hi,"/1e12]")
# mbRatio = (1-q)^2/(3(1+q)) decreasing in q
q_lo = mpf(qn_lo)/mpf(10)**12; q_hi = mpf(qn_hi)/mpf(10)**12
mb_lo = (1-q_hi)**2/(3*(1+q_hi)); mb_hi = (1-q_lo)**2/(3*(1+q_lo))
print("mbRatio bracket:", mp.nstr(mb_lo,18), mp.nstr(mb_hi,18))
inv_mb_lo = 1/mb_hi; inv_mb_hi = 1/mb_lo
Linvmb_lo_true = log(inv_mb_lo); Linvmb_hi_true = log(inv_mb_hi)
print("cutLog(1/mbRatio) true:", mp.nstr(Linvmb_lo_true,18), mp.nstr(Linvmb_hi_true,18))
ambn = int(floor(Linvmb_lo_true*mpf(10)**11)); bmbn = int(ceil(Linvmb_hi_true*mpf(10)**11))
print("  bracket @1e11: [", ambn,"/1e11,", bmbn,"/1e11], width", bmbn-ambn,"e-11")
amb = mpf(ambn)/mpf(10)**11
print("  amb =", mp.nstr(amb,18), "margin_lo =", mp.nstr(inv_mb_lo - exp(amb),6))
for N in [24,26,28,30]:
    print(f"  expRemBound(amb={mp.nstr(amb,4)},{N}) = {mp.nstr(rembound(amb,N),4)}")
print()

# L_m01 from s6 ratio
m01_lo = mpf(3477472837103)/mpf(10**9); m01_hi = mpf(3477472837106)/mpf(10**9)
Lm01_lo_true = log(m01_lo); Lm01_hi_true = log(m01_hi)
print("cutLog(m01) true:", mp.nstr(Lm01_lo_true,18), mp.nstr(Lm01_hi_true,18))
print("  current banked: [815406111272/1e11, 815406111273/1e11]")
am01 = int(floor(Lm01_lo_true*mpf(10)**11)); bm01 = int(ceil(Lm01_hi_true*mpf(10)**11))
print("  achievable @1e11: [", am01,"/1e11,", bm01,"/1e11], width", bm01-am01,"e-11")
