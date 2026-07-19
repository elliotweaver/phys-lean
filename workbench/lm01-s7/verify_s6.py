import mpmath as mp
from fractions import Fraction as F
mp.mp.dps = 60

# BANKED s6 (NarrowedBracket11)
m01_lo_s6 = F(3477472837103, 10**9)
m01_hi_s6 = F(3477472837106, 10**9)
cutlog_lo_s6 = F(815406111272, 10**11)
cutlog_hi_s6 = F(815406111273, 10**11)

def lnf(fr): return mp.log(mp.mpf(fr.numerator)/fr.denominator)

print("=== BANKED s6 CONSISTENCY CHECK ===")
print("ln(m01_lo_s6) =", mp.nstr(lnf(m01_lo_s6), 20))
print("ln(m01_hi_s6) =", mp.nstr(lnf(m01_hi_s6), 20))
print("cutlog_lo_s6  =", mp.nstr(mp.mpf(cutlog_lo_s6.numerator)/cutlog_lo_s6.denominator, 20))
print("cutlog_hi_s6  =", mp.nstr(mp.mpf(cutlog_hi_s6.numerator)/cutlog_hi_s6.denominator, 20))
print("cutlog_lo_s6 <= ln(m01_lo_s6)?", cutlog_lo_s6 <= lnf(m01_lo_s6))
print("ln(m01_hi_s6) <= cutlog_hi_s6?", lnf(m01_hi_s6) <= cutlog_hi_s6)
print("m01 width:", mp.nstr(mp.mpf((m01_hi_s6-m01_lo_s6).numerator)/(m01_hi_s6-m01_lo_s6).denominator,5))
print("ln diff (m01-induced cutLog width):", mp.nstr(lnf(m01_hi_s6)-lnf(m01_lo_s6), 5))
print("banked cutlog width:", mp.nstr(mp.mpf((cutlog_hi_s6-cutlog_lo_s6).numerator)/(cutlog_hi_s6-cutlog_lo_s6).denominator,5))
