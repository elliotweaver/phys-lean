from mpmath import mp, mpf, sqrt, log
from fractions import Fraction as F
mp.dps = 80

# NB11 banked sharp mass0 brackets
m0_lo_rat = F(1189719085816627, 500000000000000)**2
m0_hi_rat = F(1189719085816629, 500000000000000)**2
print("mass0_lo_rat =", mp.mpf(m0_lo_rat.numerator)/m0_lo_rat.denominator)
print("mass0_hi_rat =", mp.mpf(m0_hi_rat.numerator)/m0_hi_rat.denominator)
# true
q = 1/sqrt(2); p = __import__('mpmath').cos(mpf(2)/9); w = sqrt(2); r = sqrt(3-3*p*p)
b0 = 1+w*p; b2 = 1 - w*(p-r)/2
mass0 = b0*b0; mass2 = b2*b2
print("mass0 true =", mass0, "cutLog:", log(mass0))
print("mass2 true =", mass2, "cutLog:", log(mass2))

# Clean rational intermediates for mass0 (for exp cert)
# choose L_b0 target bracket
print()
print("cutLog mass0 =", log(mass0))   # 1.7337287949546308
# target L_b0 in [1733728/1e6, 1733729/1e6]? width 1e-6
print("e^1.733728 =", __import__('mpmath').e**mpf('1.733728'))
print("e^1.733729 =", __import__('mpmath').e**mpf('1.733729'))
# need mass0_lo >= e^1.733728 ; mass0_hi <= e^1.733729
print("mass0_lo_rat >= e^1.733728?", mp.mpf(m0_lo_rat.numerator)/m0_lo_rat.denominator, ">", __import__('mpmath').e**mpf('1.733728'))

# mass2 sharp bracket from NB4 wp/wr sharp
# wp in [137943816/1e8,137943818/1e8], wr in [53986200/1e8,53986203/1e8]
wp_lo=F(137943816,10**8); wp_hi=F(137943818,10**8)
wr_lo=F(53986200,10**8); wr_hi=F(53986203,10**8)
# b2 = 1 - (wp - wr)/2
b2_lo = 1 - (wp_hi - wr_lo)/2
b2_hi = 1 - (wp_lo - wr_hi)/2
print()
print("b2_lo =", mp.mpf(b2_lo.numerator)/b2_lo.denominator)
print("b2_hi =", mp.mpf(b2_hi.numerator)/b2_hi.denominator)
print("b2 true =", b2)
m2_lo = b2_lo**2; m2_hi = b2_hi**2
print("mass2_lo =", mp.mpf(m2_lo.numerator)/m2_lo.denominator)
print("mass2_hi =", mp.mpf(m2_hi.numerator)/m2_hi.denominator)
print("cutLog mass2 =", log(mass2))
# 1/mass2 bracket
inv2_lo = 1/m2_hi; inv2_hi = 1/m2_lo
print("1/mass2 in [", float(inv2_lo), ",", float(inv2_hi), "] true", float(1/mass2))
print("cutLog(1/mass2) =", log(1/mass2))
