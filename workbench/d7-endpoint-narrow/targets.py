"""
Node 4 TARGET SIZING. Sharpen the three edge logs to ~1e-12 (below the kappa floor 1e-11),
keeping kappa at ext6. Compute:
 - clean rational mass0 bracket from mass0_lo_s6/hi_s6 (b0=1189719085816627/5e14 ..)
 - clean rational mass2 bracket from b2 (via s6 wp/wr) and mass2=b2^2
 - clean rational mbRatio bracket from q sharpened deeper (q^2=1/2)
 - the exp instrument index N for each cutLog target width ~1e-12
 - the reassembled endpoint bracket
"""
import mpmath as mp
from fractions import Fraction as F
mp.mp.dps = 80

# ---- reference values ----
q  = mp.cos(mp.pi/4)
w  = mp.sqrt(2)
p  = mp.cos(mp.mpf(2)/9)
r  = mp.sqrt(3-3*p*p)
b0 = 1+w*p
b2 = 1-(w*p-w*r)/2
mass0 = b0*b0
mass2 = b2*b2
mbR = (1-q)**2/(3*(1+q))

# ---- banked s6 numeral brackets (exact rationals) ----
# b0 in [1189719085816627/5e14, 1189719085816629/5e14]  (mass0_lo_s6/hi_s6 are these squared)
b0_lo = F(1189719085816627,5*10**14); b0_hi = F(1189719085816629,5*10**14)
mass0_lo = b0_lo*b0_lo; mass0_hi = b0_hi*b0_hi
print("mass0 s6 bracket [%s, %s]" % (mp.nstr(mp.mpf(mass0_lo.numerator)/mass0_lo.denominator,20), mp.nstr(mp.mpf(mass0_hi.numerator)/mass0_hi.denominator,20)))
print("  ref mass0 =", mp.nstr(mass0,20), " width=", mp.nstr(mp.mpf((mass0_hi-mass0_lo).numerator)/(mass0_hi-mass0_lo).denominator,4))

# clean rational mass0 bracket (round outward to 15 digits)
def clean_lo(x, digits):  # floor to 'digits' after point-ish, as k/10^d
    from math import floor
    d = 10**digits
    return F(floor(x*d), d)
def clean_hi(x, digits):
    from math import ceil
    d = 10**digits
    return F(ceil(x*d), d)
mass0_l = clean_lo(mp.mpf(mass0_lo.numerator)/mass0_lo.denominator, 15)
mass0_h = clean_hi(mp.mpf(mass0_hi.numerator)/mass0_hi.denominator, 15)
print("  clean mass0 in [%s, %s]" % (mass0_l, mass0_h))

# b2 from s6 wp, wr
wp_lo = F(689719085816627,5*10**14); wp_hi = F(689719085816629,5*10**14)
wr_lo = F(269931005964161,5*10**14); wr_hi = F(269931005964169,5*10**14)
# b2 = 1 - (wp-wr)/2 ; b2_lo uses wp_hi, wr_lo ; b2_hi uses wp_lo, wr_hi
b2_lo = 1 - (wp_hi - wr_lo)/2
b2_hi = 1 - (wp_lo - wr_hi)/2
print()
print("b2 s6 bracket [%s, %s]" % (mp.nstr(mp.mpf(b2_lo.numerator)/b2_lo.denominator,20), mp.nstr(mp.mpf(b2_hi.numerator)/b2_hi.denominator,20)))
print("  ref b2 =", mp.nstr(b2,20), " width=", mp.nstr(mp.mpf((b2_hi-b2_lo).numerator)/(b2_hi-b2_lo).denominator,4))
mass2_lo = b2_lo*b2_lo; mass2_hi = b2_hi*b2_hi
mass2_l = clean_lo(mp.mpf(mass2_lo.numerator)/mass2_lo.denominator, 15)
mass2_h = clean_hi(mp.mpf(mass2_hi.numerator)/mass2_hi.denominator, 15)
print("  clean mass2 in [%s, %s]" % (mass2_l, mass2_h))
print("  ref mass2 =", mp.nstr(mass2,20))

# q deeper: q^2=1/2, q=0.7071067811865475244
# need q width small enough that mbR width ~1e-13
qref = mp.mpf(1)/mp.sqrt(2)
dmb_dq = mp.diff(lambda t:(1-t)**2/(3*(1+t)), qref)
print()
print("q ref =", mp.nstr(qref,25))
print("dmbR/dq =", mp.nstr(dmb_dq,6))
# target mbR width 1e-13 -> q width ~ 1e-13/|dmb_dq|
need_qw = mp.mpf('1e-13')/abs(dmb_dq)
print("target mbR width 1e-13 => need q width ~", mp.nstr(need_qw,3))
# choose q to 15 digits
q_l = clean_lo(qref,15); q_h = clean_hi(qref,15)
print("  q 15-digit bracket [%s, %s] width=%s" % (q_l, q_h, mp.nstr(mp.mpf((q_h-q_l).numerator)/(q_h-q_l).denominator,3)))
# verify q_l^2<=1/2<=q_h^2
print("  q_l^2 =", mp.nstr(mp.mpf((q_l*q_l).numerator)/(q_l*q_l).denominator,20), "<= 0.5? ", q_l*q_l<=F(1,2))
print("  q_h^2 =", mp.nstr(mp.mpf((q_h*q_h).numerator)/(q_h*q_h).denominator,20), ">= 0.5? ", q_h*q_h>=F(1,2))
# mbR bracket (decreasing in q): mbR_lo uses q_h, mbR_hi uses q_lo
mbR_lo = (1-q_h)**2/(3*(1+q_h))
mbR_hi = (1-q_l)**2/(3*(1+q_l))
print("  mbR bracket [%s, %s]" % (mp.nstr(mp.mpf(mbR_lo.numerator)/mbR_lo.denominator,20), mp.nstr(mp.mpf(mbR_hi.numerator)/mbR_hi.denominator,20)))
print("  ref mbR =", mp.nstr(mbR,20), " width=", mp.nstr(mp.mpf((mbR_hi-mbR_lo).numerator)/(mbR_hi-mbR_lo).denominator,4))

# ---- exp instrument index sizing: expRemBound(y,N) ~ y^N/N! * 1/(1-y/(N+1)) ----
def expRemBound(y, N):
    yN = y**N/mp.factorial(N)
    return yN/(1-y/(N+1))
print()
for label,y in [("L_b0 y~1.7337", mp.mpf('1.7337288')),
                ("L_b2 |y|~1.0887 (recip)", mp.mpf('1.0887238')),
                ("L_mb |y|~4.0893 (recip)", mp.mpf('4.0893067'))]:
    print(label)
    for N in range(20, 45):
        rb = expRemBound(y,N)
        if rb < mp.mpf('1e-13'):
            print("   need N ~", N, " expRemBound ~", mp.nstr(rb,3)); break
