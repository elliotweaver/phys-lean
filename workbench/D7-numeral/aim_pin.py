from fractions import Fraction as F
lo=F(12007329939722,176714586765)
hi=F(32019546505738,471238898037)
# 12-sig-digit pinning window [67.9475880261, 67.9475880262]
p_lo=F(679475880261,10000000000)
p_hi=F(679475880262,10000000000)
print('p_lo < lo :', p_lo < lo, float(p_lo), float(lo))
print('hi < p_hi :', hi < p_hi, float(hi), float(p_hi))
print('p_lo < p_hi (window strict):', p_lo < p_hi)
# width of bracket
print('bracket width:', float(hi-lo))
# check width < 1e-10
print('width < 1e-10:', (hi-lo) < F(1,10000000000))
# Also: pinned window width = 1e-10; the bracket is inside it — 12 sig figs pinned = 67.9475880261
