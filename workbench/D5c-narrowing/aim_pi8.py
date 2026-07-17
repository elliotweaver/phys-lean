"""D5-next-8: double-double-angle at pi/8 route to escape the near-pi/2 nlinarith ceiling.

leastCosZero lower bound currently 157079620/1e8 (single double-angle at pi/4, hard nlinarith
ceiling). The double-double-angle: cutCos(x)=2*(2*cutCos(x/4)^2-1)^2-1, reduce positivity near
pi/2 to a bound at pi/8 (x/4) where cos~0.924 and the split@6 bracket is ~16000x tighter and
much better conditioned.

Final positivity 2*(2*C2^2-1)^2-1 > 0  <=>  C2 > cos(pi/8).
Certifiability: need C2 < cutCos(Y2) with Y2=X/4 (via split@6 bracket, remBound~2.8e-14).
"""
import mpmath as mp
mp.mp.dps = 60
pi = mp.pi
E8 = mp.mpf(10) ** 8

print("true pi/2 * 1e8 =", mp.nstr(pi / 2 * E8, 22))
print("cos(pi/8) =", mp.nstr(mp.cos(pi / 8), 30))
print("cos(pi/4) =", mp.nstr(mp.cos(pi / 4), 30))
print("2*cos(pi/8)^2-1 =", mp.nstr(2 * mp.cos(pi / 8) ** 2 - 1, 30), "(should be cos(pi/4))")
print()

for Xn in [157079626, 157079628, 157079630, 157079631, 157079632]:
    X = mp.mpf(Xn) / E8
    Y2 = X / 4
    cY2 = mp.cos(Y2)
    cpi8 = mp.cos(pi / 8)
    window = cY2 - cpi8
    rem = mp.mpf(101) / 100 * (Y2 ** 12 / 479001600)
    print("X=%d/1e8  Y2=X/4=%s" % (Xn, mp.nstr(Y2, 18)))
    print("   cos(Y2)      =", mp.nstr(cY2, 28))
    print("   cos(pi/8)    =", mp.nstr(cpi8, 28))
    print("   C2 window (cos(pi/8), cos(Y2)) width =", mp.nstr(window, 6))
    print("   remBound(Y2,6)*101/100 =", mp.nstr(rem, 6))
    print()
