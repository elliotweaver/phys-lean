#!/usr/bin/env python3
# Pick tightest CHEAP cutLog + 1/cutPi endpoints and compute assembled bracket.
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

m01_lo=F(10**9,288575); m01_hi=F(10**9,286902)   # [3465.30, 3485.51]
print("cutLog true range from m01:",math.log(float(m01_lo)),"-",math.log(float(m01_hi)))
# tightest achievable cutLog from CURRENT m01 bracket ~ [8.1506, 8.1564]; irreducible w/o tightening m01.

# LOWER cutLog >= a : need partialExp(a,N)+rem(a,N) <= m01_lo. Find best a (largest) at modest N.
print("\n--- cutLog LOWER candidates (want largest a with cheap N) ---")
for a in [F(8),F(81,10),F(407,50),F(814,100),F(8149,1000)]:
    for N in range(int(a)+2,22):
        v=partialExp(a,N)+expRemBound(a,N)
        if a < F(N+1) and v<=m01_lo:
            print(f"  a={a}={float(a):.4f}: N={N} pExp+rem={float(v):.2f} <= {float(m01_lo):.2f}")
            break

# UPPER cutLog <= b : need m01_hi <= partialExp(b,N). Find best b (smallest) at modest N.
print("\n--- cutLog UPPER candidates (want smallest b with cheap N) ---")
for b in [F(41,5),F(82,10),F(817,100),F(8157,1000)]:
    for N in range(int(b)+2,26):
        v=partialExp(b,N)
        if m01_hi<=v:
            print(f"  b={b}={float(b):.4f}: N={N} pExp={float(v):.2f} >= {float(m01_hi):.2f}")
            break

# 1/cutPi: leastCosZero in [zl,zh] -> 1/cutPi in [1/(2zh), 1/(2zl)]
# from probes: zl=3/2 (split@3), zh=8/5 (split@4). => 1/cutPi in [5/16, 1/3]
zl,zh=F(3,2),F(8,5)
pa,pb = F(1)/(2*zh), F(1)/(2*zl)
print(f"\n1/cutPi in [{pa},{pb}] = [{float(pa):.4f},{float(pb):.4f}]  true {1/math.pi:.4f}")

# assemble with chosen best cutLog + 1/cutPi
d=F(16,3)
print("\n=== assembled candidates (190/3 + (d/3)*cutLog*(1/cutPi)) ===")
for (la,lb,tag) in [(F(8),F(41,5),"[8, 41/5]"),(F(81,10),F(82,10),"[8.1, 8.2]"),(F(407,50),F(817,100),"[8.14, 8.17]")]:
    lo=190/F(3)+(d/3)*la*pa; hi=190/F(3)+(d/3)*lb*pb
    print(f"cutLog{tag} x 1/cutPi[{pa},{pb}]: assembled [{float(lo):.5f},{float(hi):.5f}] width {float(hi-lo):.5f}")
    print(f"    exact lo={lo}  hi={hi}")

print("\ntrue 1/a(0) bare ~", 190/3+float(d/3)*math.log(3475)/math.pi)
print("D5 stated width (180/7 - 80/153):", float(F(180,7)-F(80,153)))
print("D5 tight width (40/7 - 80/153):", float(F(40,7)-F(80,153)))
