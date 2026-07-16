#!/usr/bin/env python3
# Aiming numerics for D5-next (narrowing node 2): tighten 1/cutPi and (optionally) cutLog.
from fractions import Fraction as F
import math

def fact(n):
    r=1
    for i in range(2,n+1): r*=i
    return r

# ---- COS instrument ----
def partialCos(x,N):
    s=F(0)
    for i in range(N):
        s += F((-1)**i) * x**(2*i) / fact(2*i)
    return s
def cosRemBound(x,N):
    # (x^{2N}/(2N)!)*(1 - x^2/((2N+1)(2N+2)))^{-1}
    d = 1 - x**2 / F((2*N+1)*(2*N+2))
    return (x**(2*N)/fact(2*N)) / d
def cos_upper(x,N):  # partialCos + rem  (>= cutCos)
    return partialCos(x,N)+cosRemBound(x,N)
def cos_lower(x,N):  # partialCos - rem  (<= cutCos)
    return partialCos(x,N)-cosRemBound(x,N)

print("=== 1/cutPi tightening: pi/2 ~", math.pi/2)
# UPPER: need cutCos(z_hi) < 0  <=  cos_upper(z_hi,N) < 0
for zh,lbl in [(F(8,5),"8/5"),(F(16,10),"16/10"),(F(159,100),"159/100")]:
    for N in range(2,9):
        u = cos_upper(zh,N)
        valid = zh**2 < F((2*N+1)*(2*N+2))
        if u < 0 and valid:
            print(f"UPPER z_hi={lbl}: N={N} cos_upper={float(u):.6f} <0  valid={valid}")
            break
    else:
        print(f"UPPER z_hi={lbl}: no N<=8 works (cos({float(zh):.4f})={math.cos(float(zh)):.6f})")

# LOWER: need 0<cutCos x for 0<=x<z_lo  <=  partialCos(x,N) - 2*x^{2N}/(2N)! > 0 on [0,z_lo)
# Using the (1-..)^{-1} <= 2 majorant (valid when x^2 <= (2N+1)(2N+2)/2).
# Worst case is the polynomial Q_N(t)=partialCos-2 t^N/(2N)! ; it is decreasing, so check t=z_lo^2.
def Qpoly(t,N):  # t = x^2 ; partial alternating cos series minus 2 t^N/(2N)!
    s=F(0)
    for i in range(N):
        s += F((-1)**i)*t**i/fact(2*i)
    s -= 2*t**N/fact(2*N)
    return s
for zl,lbl in [(F(3,2),"3/2"),(F(31,20),"31/20"),(F(157,100),"157/100")]:
    t=zl**2
    for N in range(3,8):
        # majorant validity for the <=2 step: t <= (2N+1)(2N+2)/2
        maj_ok = t <= F((2*N+1)*(2*N+2),2)
        q = Qpoly(t,N)
        if q>0 and maj_ok:
            print(f"LOWER z_lo={lbl} (t={float(t):.4f}): N={N} Q_N(z_lo^2)={float(q):.6f} >0  maj_ok={maj_ok}")
            break
    else:
        print(f"LOWER z_lo={lbl}: no N<=7 (cos({float(zl):.4f})={math.cos(float(zl)):.6f})")

# resulting 1/cutPi bracket for z_lo=3/2, z_hi=8/5:
zl,zh=F(3,2),F(8,5)
# leastCosZero in [zl,zh] -> cutPi in [2zl,2zh] -> 1/cutPi in [1/(2zh),1/(2zl)]
print("\n1/cutPi in [",F(1)/(2*zh),",",F(1)/(2*zl),"] = [5/16, 1/3] ; old [5/17,5/14]")
print("new width", float(F(1)/(2*zl)-F(1)/(2*zh)), " old width", float(F(5,14)-F(5,17)))
print("nested?", F(5,17)<F(1)/(2*zh), F(1)/(2*zl)<F(5,14))
