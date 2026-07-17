from fractions import Fraction as F
# ALL EXACT RATIONALS (no floats) — mirrors the banked Cut arithmetic.
# banked: dressedInvAlphaEM w s = 112 + ((chargeTraceDepth - s) * T) / (1 - w)   (D2c dressedInvAlphaEM_closed)
#         dressedInvAlphaEM w 0 - dressedInvAlphaEM w s = (s * T)/(1-w)           (D2c dressedInvAlphaEM_antiscreen)
# banked constants:
w = F(1,3)                    # depthWeight (D3 depthWeight_eq)
chargeDepth = F(16,3)         # chargeTraceDepth (X6)
isoDepth = F(2)               # isoDepth (N342)
# banked D7 numeral LOWER bound (theNumeral_bracket.1):  invAlphaZero >= 12007329939722/176714586765
invAlphaZero_lo = F(12007329939722, 176714586765)
# invAlphaZero = 42 + totalScreening  =>  totalScreening >= invAlphaZero_lo - 42
totalScreening_lo = invAlphaZero_lo - 42
# chargeDepth * T = totalScreening  (D2c chargeDepth_screeningUnit_eq)  =>  T = totalScreening/chargeDepth
T_lo = totalScreening_lo / chargeDepth
# THE s-INDUCED SPREAD over s in (0, isoDepth):
#   spread = dressedInvAlphaEM w 0 - dressedInvAlphaEM w isoDepth = (isoDepth * T)/(1-w)
spread_lo = (isoDepth * T_lo) / (1 - w)
print("invAlphaZero_lo (D7)     =", float(invAlphaZero_lo))
print("totalScreening_lo        =", float(totalScreening_lo), "=", totalScreening_lo)
print("T_lo (screening unit)    =", float(T_lo))
print("s-SPREAD lower bound     =", float(spread_lo), "=", spread_lo)
print()
print("A >=15-significant-digit two-sided bracket on 1/a(0) ~ 137 needs width < ~1e-11.")
print("The FREE parameter s alone forces width >=", float(spread_lo), " (>> 1e-11).")
print("spread_lo > 14 ?", spread_lo > 14)
print()
print("=> The >=15-digit two-sided bracket is STRUCTURALLY IMPOSSIBLE while s ranges over (0, isoDepth).")
print("   Reaching 137.036 requires PINNING s ~ 1.9  ==  FITTING to the measured value (G2 forbidden).")
print("   The ONLY non-fitting route: DERIVE s (trace-form cross-normalization hsCensus Imat=16 -> isoDepth=2).")
