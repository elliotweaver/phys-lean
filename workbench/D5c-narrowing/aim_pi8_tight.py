import mpmath as mp
from fractions import Fraction as F
import math
mp.mp.dps = 60
pi = mp.pi
E8 = mp.mpf(10) ** 8
cpi8 = mp.cos(pi / 8)
true_zero = pi / 2 * E8  # 157079632.679...

print("=== LOWER-bound push: how tight can near-pi/8 C2 go? ===")
print("cos(pi/8) =", mp.nstr(cpi8, 30))
# For X, Y2=X/4e8, need C2 with cos(pi/8) < C2 < cutCos(Y2)=cos(Y2), and final 2*(2C2^2-1)^2-1>0.
# The final positivity 2*(2C2^2-1)^2-1>0 <=> C2 > cos(pi/8) (exact). So ANY C2>cos(pi/8) works.
# Real constraint: nlinarith must certify partialCos(Y2,6)-rem > C2, margin = cos(Y2)-C2.
for Xn in [157079630, 157079631, 157079632, 157079633]:
    Y2 = mp.mpf(Xn) / (4 * E8)
    cY2 = mp.cos(Y2)
    # pick C2 = round down cos(Y2) to safe rational leaving ~half the window above cos(pi/8)
    win = cY2 - cpi8
    # choose C2 as a 10-digit rational strictly between
    mid = (cY2 + cpi8) / 2
    C2 = F(int(mid * mp.mpf(10)**10), 10**10)
    C2f = mp.mpf(C2.numerator)/mp.mpf(C2.denominator)
    fm = 2*(2*C2*C2-1)**2 - 1
    print(f"X={Xn}: Y2={float(Y2):.10f}  cos(Y2)={mp.nstr(cY2,20)}")
    print(f"   window(cos(pi/8),cos(Y2))={mp.nstr(win,4)}  C2={C2}={float(C2f):.12f}")
    print(f"   C2-cos(pi8)={mp.nstr(C2f-cpi8,4)}  cos(Y2)-C2(cert margin)={mp.nstr(cY2-C2f,4)}  final={mp.nstr(mp.mpf(fm.numerator)/mp.mpf(fm.denominator),4)}")

print()
print("=== UPPER-bound: split@6 floor vs split@7 ===")
def partialcos(x, N):
    s = mp.mpf(0)
    for k in range(N):
        s += (-1)**k * x**(2*k) / mp.factorial(2*k)
    return s
def rembound(x, N):
    # x^(2N)/(2N)! * 1/(1-x^2/((2N+1)(2N+2)))
    return x**(2*N)/mp.factorial(2*N) / (1 - x**2/((2*N+1)*(2*N+2)))
for Xn in [157079633, 157079634]:
    x = mp.mpf(Xn)/E8
    for N in [6, 7]:
        pc = partialcos(x, N)
        rb = rembound(x, N)
        upper = pc + rb  # cutCos x <= this; <0 certifies neg
        print(f"X={Xn} split@{N}: partialCos={mp.nstr(pc,6)} rem={mp.nstr(rb,6)} pc+rem={mp.nstr(upper,6)} (<0? {upper<0})")
