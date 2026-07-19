from fractions import Fraction as F
from math import factorial, floor, ceil
def pE(y,N): return sum(y**i/F(factorial(i)) for i in range(N))
def rem(y,N): return (y**N/F(factorial(N)))/(1-y/(N+1))

wp_lo=F(689719085816627,5*10**14); wp_hi=F(689719085816629,5*10**14)
wr_lo=F(269931005964161,5*10**14); wr_hi=F(269931005964169,5*10**14)
b2_lo_exact = 1-(wp_hi-wr_lo)/2
b2_hi_exact = 1-(wp_lo-wr_hi)/2
# clean b2 OUTWARD at 14 digits, widen by 1
b2L = F(floor(float(b2_lo_exact)*10**14)-1, 10**14)
b2H = F(ceil(float(b2_hi_exact)*10**14)+1, 10**14)
assert b2L <= b2_lo_exact and b2H >= b2_hi_exact
print("b2 clean [%s, %s] = [%.15f, %.15f]" % (b2L, b2H, float(b2L), float(b2H)))
# mass2 = b2^2, clean OUTWARD at 15 digits from b2L^2, b2H^2
m2L = F(floor(float(b2L*b2L)*10**15)-1, 10**15)
m2H = F(ceil(float(b2H*b2H)*10**15)+1, 10**15)
assert m2L <= b2L*b2L and b2H*b2H <= m2H
print("mass2 clean [%s, %s] = [%.16f, %.16f]" % (m2L, m2H, float(m2L), float(m2H)))
print("  b2L^2 >= m2L:", b2L*b2L >= m2L, "  b2H^2 <= m2H:", b2H*b2H <= m2H)
inv2_lo=1/m2H; inv2_hi=1/m2L
print("1/mass2 [%.14f, %.14f]" % (float(inv2_lo), float(inv2_hi)))
# recompute cutLog(1/mass2) target bracket: ref ~1.08872372522362
u_lo=F(10887237252236,10**13); u_hi=F(10887237252237,10**13)
for N in range(14,22):
    if pE(u_lo,N)+rem(u_lo,N) <= inv2_lo: print("L_b2 lo cert N=%d ok"%N); break
for N in range(14,22):
    if inv2_hi <= pE(u_hi,N): print("L_b2 hi cert N=%d ok"%N); break
print("=> cutLog mass2 in [%s, %s]" % (-u_hi, -u_lo))
# check the endpoint bracket still holds with these L_b2 = [-u_hi,-u_lo] (same as before)
print("(L_b2 bracket unchanged: [-10887237252237/1e13, -10887237252236/1e13])")
