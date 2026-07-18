#!/usr/bin/env python3
"""C4 final brackets — naive-interval (mul_le_mul-friendly) forms, exact rationals.

The chain's convention-free Jarlskog-type CP invariant on the C3-native survival-dressed
mixing, carrying the associator as an EXPLICIT switch factor:

    cpInvSq(a) = mixProd * a^2 * cpFactorDerived,   cpFactorDerived = 1/2  (banked N418)
    mixProd    = G12 * G23 * H13,   Gij = mixij*(1-mixij),  H13 = mix13*(1-mix13)^2

Textures (a = associator value cast to Cut):
    quark  (Fano):   a = assoc3 u2 u1 (u1×u2) = -1  -> a^2 = 1  -> cpInvSq = mixProd/2  (positive bracket)
    lepton (C-line): a = assoc3 x (b·u1)(d·u1) = 0  -> a^2 = 0  -> cpInvSq = 0           (EXACT theorem)

Lean proves G/H/P brackets by mul_le_mul, giving the NAIVE interval endpoints below.
"""
from fractions import Fraction as F
import math

mix12_lo, mix12_hi = F(60740,10**7), F(60770,10**7)
mix23_lo, mix23_hi = F(5332,10**7),  F(5342,10**7)
mix13_lo, mix13_hi = F(3191,10**8),  F(3197,10**8)

# Gij naive-interval (what mul_le_mul yields): [mij_lo*(1-mij_hi), mij_hi*(1-mij_lo)]
G12_lo, G12_hi = mix12_lo*(1-mix12_hi), mix12_hi*(1-mix12_lo)
G23_lo, G23_hi = mix23_lo*(1-mix23_hi), mix23_hi*(1-mix23_lo)
# H13 = mix13*(1-mix13)^2 : (1-mix13) in [1-hi,1-lo], squared in [(1-hi)^2,(1-lo)^2]
c13_lo, c13_hi = 1-mix13_hi, 1-mix13_lo
H13_lo = mix13_lo*(c13_lo*c13_lo)
H13_hi = mix13_hi*(c13_hi*c13_hi)

# mixProd = G12*G23*H13 naive
GG_lo, GG_hi = G12_lo*G23_lo, G12_hi*G23_hi
P_lo, P_hi = GG_lo*H13_lo, GG_hi*H13_hi

cpFac = F(1,2)
Q_lo, Q_hi = P_lo*cpFac, P_hi*cpFac   # cpInvSq_quark = mixProd/2

print(f"G12 in [{float(G12_lo):.10e}, {float(G12_hi):.10e}]")
print(f"G23 in [{float(G23_lo):.10e}, {float(G23_hi):.10e}]")
print(f"H13 in [{float(H13_lo):.10e}, {float(H13_hi):.10e}]")
print(f"mixProd P in [{float(P_lo):.10e}, {float(P_hi):.10e}]")
print(f"cpInvSq_quark = P/2 in [{float(Q_lo):.10e}, {float(Q_hi):.10e}]")
q_lo, q_hi = math.sqrt(float(Q_lo)), math.sqrt(float(Q_hi))
print(f"cpInv_quark = sqrt in [{q_lo:.10e}, {q_hi:.10e}]")
print()

def sandwich(lo, hi, cand_lo, cand_hi, scale, name):
    ok_lo = F(cand_lo, scale) <= lo
    ok_hi = hi <= F(cand_hi, scale)
    print(f"  {name}: [{cand_lo}/{scale}, {cand_hi}/{scale}]  lo_ok={ok_lo} hi_ok={ok_hi}")
    return ok_lo and ok_hi

print("=== chosen production brackets (must sandwich exact) ===")
assert sandwich(G12_lo,G12_hi, 6037, 6041, 10**6, "G12 @1e6")
assert sandwich(G23_lo,G23_hi, 5329, 5340, 10**7, "G23 @1e7")
assert sandwich(H13_lo,H13_hi, 3190, 3197, 10**8, "H13 @1e8")
assert sandwich(P_lo,P_hi, 1026, 1031, 10**13, "mixProd @1e13")
assert sandwich(Q_lo,Q_hi, 513, 516, 10**13, "cpInvSq_quark @1e13")
# sqrt bracket: need c^2<=Q_lo and Q_hi<=d^2
c,d,scale = 71,72,10**7
print(f"  cpInv_quark: [{c}/1e7, {d}/1e7]  c^2<=lo? {F(c,scale)**2<=Q_lo}  hi<=d^2? {Q_hi<=F(d,scale)**2}")
assert F(c,scale)**2 <= Q_lo and Q_hi <= F(d,scale)**2
print()
print("ALL SANDWICH ASSERTIONS PASSED")
print()
# Now double check the G bracket lower endpoints in mul_le_mul form are the exact naive endpoints
print("=== verify mul_le_mul lower endpoints are provable (a*(1-b) <= x*(1-x)) at extremes ===")
print(f"G12: mix12_lo*(1-mix12_hi) = {float(G12_lo):.10e}  (<= true G12 min at mix=mix12_lo: {float(mix12_lo*(1-mix12_lo)):.10e})")
print(f"cpInvSq_quark exact lo={Q_lo}")
print(f"cpInvSq_quark exact hi={Q_hi}")
