#!/usr/bin/env python3
# D5-next-2 (node 3): tighten cutLog toward m01 floor + tighten 1/cutPi via deeper cos split.
from fractions import Fraction as F
import math

def fact(n):
    r=1
    for i in range(2,n+1): r*=i
    return r
def partialExp(q,N):
    return sum((q**i/fact(i) for i in range(N)), F(0))
def expRemBound(q,N):
    return (q**N/fact(N)) / (1 - q/F(N+1))

# ---- COS instrument ----
def partialCos(x,N):
    s=F(0)
    for i in range(N):
        s += F((-1)**i) * x**(2*i) / fact(2*i)
    return s
def cosRemBound(x,N):
    d = 1 - x**2 / F((2*N+1)*(2*N+2))
    return (x**(2*N)/fact(2*N)) / d
def cos_upper(x,N): return partialCos(x,N)+cosRemBound(x,N)
def Qpoly(t,N):  # t=x^2, partial alt cos minus 2 t^N/(2N)!  (majorant <=2 route)
    s=F(0)
    for i in range(N):
        s += F((-1)**i)*t**i/fact(2*i)
    s -= 2*t**N/fact(2*N)
    return s

m01_lo=F(10**9,288575); m01_hi=F(10**9,286902)
print("m01:", float(m01_lo),"-",float(m01_hi))
print("cutLog true range:",math.log(float(m01_lo)),"-",math.log(float(m01_hi)),"width",math.log(float(m01_hi))-math.log(float(m01_lo)))

# --- cutLog LOWER: largest a <= 8.1506 with feasible N (partialExp(a,N)+rem <= m01_lo) ---
print("\n--- cutLog LOWER (a<=8.1506) ---")
for a in [F(407,50),F(8149,1000),F(815,100),F(8150,1000)]:
    for N in range(int(a)+2,24):
        v=partialExp(a,N)+expRemBound(a,N)
        if a < F(N+1) and v<=m01_lo:
            print(f"  a={a}={float(a):.4f}: N={N} pExp+rem={float(v):.3f} <= {float(m01_lo):.3f}")
            break
    else:
        print(f"  a={a}={float(a):.4f}: NO N<24")

# --- cutLog UPPER: smallest b >= 8.1564 with feasible N (m01_hi <= partialExp(b,N)) ---
print("\n--- cutLog UPPER (b>=8.1564) ---")
for b in [F(817,100),F(8157,1000),F(816,100),F(8156,1000)]:
    for N in range(int(b)+2,26):
        v=partialExp(b,N)
        if m01_hi<=v:
            print(f"  b={b}={float(b):.4f}: N={N} pExp={float(v):.3f} >= {float(m01_hi):.3f}")
            break
    else:
        print(f"  b={b}={float(b):.4f}: NO N<26")

# --- 1/cutPi: leastCosZero in [zl,zh] ---
print("\n--- 1/cutPi tightening (pi/2 ~ 1.5708) ---")
print("UPPER cutCos(zh)<0:")
for zh in [F(159,100),F(158,100),F(1585,1000)]:
    for N in range(2,10):
        u=cos_upper(zh,N); valid = zh**2 < F((2*N+1)*(2*N+2))
        if u<0 and valid:
            print(f"  z_hi={zh}={float(zh):.4f}: N={N} cos_upper={float(u):.6f}<0")
            break
    else: print(f"  z_hi={zh}: no N (cos={math.cos(float(zh)):.5f})")
print("LOWER 0<cutCos on [0,zl):")
for zl in [F(31,20),F(156,100),F(1565,1000),F(157,100)]:
    t=zl**2
    for N in range(3,9):
        maj_ok = t <= F((2*N+1)*(2*N+2),2)
        q=Qpoly(t,N)
        if q>0 and maj_ok:
            print(f"  z_lo={zl}={float(zl):.4f}: N={N} Q={float(q):.6f}>0")
            break
    else: print(f"  z_lo={zl}: no N (cos={math.cos(float(zl)):.5f})")

# ---- Assemble candidate brackets ----
d=F(16,3)
def assemble(la,lb,pa,pb):
    lo=190/F(3)+(d/3)*la*pa; hi=190/F(3)+(d/3)*lb*pb
    return lo,hi
D5next_lo,D5next_hi=F(610,9),F(9206,135)
print("\nD5-next bracket [610/9, 9206/135] width",float(D5next_hi-D5next_lo))

print("\n=== CANDIDATES ===")
# 1/cutPi choices
cands_pi = {
 "[50/159,10/31] (zl=31/20,zh=159/100)": (F(50,159),F(10,31)),
}
cands_log = {
 "[407/50, 817/100]=[8.14,8.17]": (F(407,50),F(817,100)),
 "[8149/1000, 8157/1000]=[8.149,8.157]": (F(8149,1000),F(8157,1000)),
}
for lk,(la,lb) in cands_log.items():
    for pk,(pa,pb) in cands_pi.items():
        lo,hi=assemble(la,lb,pa,pb)
        nested = D5next_lo<=lo and hi<=D5next_hi
        narrower = (hi-lo) < (D5next_hi-D5next_lo)
        print(f"cutLog{lk} x 1/cutPi{pk}:")
        print(f"   [{float(lo):.5f},{float(hi):.5f}] width {float(hi-lo):.5f}  nested={nested} narrower={narrower}")
        print(f"   exact lo={lo}  hi={hi}")
