from fractions import Fraction as F
# NB11 s6 products
wp_lo = F(689719085816627, 5*10**14); wp_hi = F(689719085816629, 5*10**14)
wr_lo = F(269931005964161, 5*10**14); wr_hi = F(269931005964169, 5*10**14)
# b2 = 1 - (wp - wr)/2
b2_lo = 1 - (wp_hi - wr_lo)/2   # minimize b2
b2_hi = 1 - (wp_lo - wr_hi)/2   # maximize b2
print("b2 exact-derived lo:", b2_lo, float(b2_lo))
print("b2 exact-derived hi:", b2_hi, float(b2_hi))
# reverted-Rung2 claimed b2 brackets:
b2c_lo = F(580211920147532, 10**15); b2c_hi = F(580211920147542, 10**15)
print("claim b2_lo <= derived lo:", b2c_lo <= b2_lo)
print("claim derived hi <= b2_hi:", b2_hi <= b2c_hi)
# mass2 = b2^2 in [b2c_lo^2, b2c_hi^2]
m2_lo = b2c_lo**2; m2_hi = b2c_hi**2
print("m2 from b2c: [", float(m2_lo), ",", float(m2_hi), "]")
m2c_lo = F(336645872281286, 10**15); m2c_hi = F(336645872281298, 10**15)
print("claim m2_lo <= m2_lo^2:", m2c_lo <= m2_lo)
print("claim m2_hi^2 <= m2c_hi:", m2_hi <= m2c_hi)
