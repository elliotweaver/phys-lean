"""D5-next-8: lock exact rationals for the double-double-angle route.

cutCos x = 2*(2*cutCos(x/4)^2 - 1)^2 - 1.
Near-pi/8 universal lower bound: forall y < Y2 = X/4, cutCos y > C2, with
  cos(pi/8) < C2 < cos(Y2)  (well-conditioned: cos~0.924, no cancellation).
Final positivity from c = cutCos(x/4) > C2:  2*(2c^2-1)^2-1 > 0 since C2 > cos(pi/8).
"""
import mpmath as mp
from fractions import Fraction as F
mp.mp.dps = 60
pi = mp.pi
E8 = mp.mpf(10) ** 8
cpi8 = mp.cos(pi / 8)
print("cos(pi/8) =", mp.nstr(cpi8, 30))
print("true pi/2*1e8 =", mp.nstr(pi/2*E8, 22))
print()

# candidate C2 rationals (must exceed cos(pi/8)=0.9238795325112868)
def final_margin(C2):
    # 2*(2*C2^2-1)^2 - 1 as exact rational
    c1 = 2*C2*C2 - 1
    return 2*c1*c1 - 1

for Xn, C2 in [
    (157079628, F(9238795347, 10**10)),
    (157079630, F(9238795338, 10**10)),
    (157079631, F(9238795333, 10**10)),
    (157079632, F(9238795328, 10**10)),
]:
    X = mp.mpf(Xn) / E8
    Y2 = X / 4
    cY2 = mp.cos(Y2)
    C2f = mp.mpf(C2.numerator) / mp.mpf(C2.denominator)
    above_pi8 = C2f - cpi8
    below_cY2 = cY2 - C2f
    fm = final_margin(C2)  # exact rational, must be > 0
    # partialCos(Y2,6) exact-ish (float ok for aiming) minus remBound
    Y2f = Y2
    pc6 = 1 - Y2f**2/2 + Y2f**4/24 - Y2f**6/720 + Y2f**8/40320 - Y2f**10/3628800
    rem = mp.mpf(101)/100 * (Y2f**12/479001600)
    lower_est = pc6 - rem
    print("X=%d  C2=%s (=%s)" % (Xn, C2, mp.nstr(C2f, 18)))
    print("   Y2=X/4 = %s = %s" % (C2 and "", mp.nstr(Y2, 18)))
    print("   C2 - cos(pi/8) = %s  (must be >0)" % mp.nstr(above_pi8, 6))
    print("   cos(Y2) - C2   = %s  (certification margin, must be >0)" % mp.nstr(below_cY2, 6))
    print("   partialCos(Y2,6)-rem - C2 = %s  (what nlinarith proves >0 at worst y=Y2)"
          % mp.nstr(lower_est - C2f, 6))
    print("   FINAL 2*(2C2^2-1)^2-1 = %s = %s (>0 rational)"
          % (fm, mp.nstr(mp.mpf(fm.numerator)/mp.mpf(fm.denominator), 6)))
    # Y2 exact rational
    Y2rat = F(Xn, 4*10**8)
    print("   Y2 exact = %s" % Y2rat)
    print()
