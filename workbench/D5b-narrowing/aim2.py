#!/usr/bin/env python3
# WIDTH DOMINANCE analysis + cutLog tightening feasibility (D5-next).
from fractions import Fraction as F
import math

def fact(n):
    r=1
    for i in range(2,n+1): r*=i
    return r
def partialExp(q,N):
    s=F(0)
    for i in range(N):
        s += q**i/fact(i)
    return s
def expRemBound(q,N):
    # (q^N/N!)*(1 - q/(N+1))^{-1}
    return (q**N/fact(N)) / (1 - q/F(N+1))

d = F(16,3)   # chargeTraceDepth
# assembled bare endpoint = 190/3 + (d/3)*cutLog*(1/cutPi)
# product P = cutLog*(1/cutPi). bracket = [la*pa, lb*pb]
print("=== TRUE values ===")
m01_lo = F(10**9,288575); m01_hi = F(10**9,286902)
print("m01 in [", float(m01_lo), ",", float(m01_hi), "]  cutLog ~", math.log(float(m01_lo)),"-",math.log(float(m01_hi)))
print("1/cutPi ~", 1/math.pi)
print("true product cutLog*(1/pi) ~", math.log(3475)/math.pi)
print("d/3 =", d/3, " bare endpoint contribution ~", float(d/3)*math.log(3475)/math.pi)
print("bare 1/a(0) ~ 190/3 +", float(d/3)*math.log(3475)/math.pi, "=", 190/3+float(d/3)*math.log(3475)/math.pi)

print("\n=== CURRENT assembled width (D5) ===")
la,lb = F(1),F(9); pa,pb = F(5,17),F(5,14)
lo = 190/F(3)+(d/3)*la*pa; hi = 190/F(3)+(d/3)*lb*pb
print("cutLog[1,9] x 1/cutPi[5/17,5/14]: product [",float(la*pa),",",float(lb*pb),"]  width",float(lb*pb-la*pa))
print("assembled [",float(lo),",",float(hi),"] width",float(hi-lo))

print("\n=== IF only tighten 1/cutPi to [5/16,1/3] ===")
pa2,pb2=F(5,16),F(1,3)
print("product [",float(la*pa2),",",float(lb*pb2),"] width",float(lb*pb2-la*pa2), " -> assembled width", float((d/3)*(lb*pb2-la*pa2)))

print("\n=== IF also tighten cutLog to [8, 41/5=8.2] ===")
la3,lb3=F(8),F(41,5)
print("product [",float(la3*pa2),",",float(lb3*pb2),"] width",float(lb3*pb2-la3*pa2)," -> assembled width",float((d/3)*(lb3*pb2-la3*pa2)))
print("  -> ENORMOUS narrowing vs current width", float(hi-lo))

print("\n=== cutLog LOWER feasibility: need partialExp(8,N)+rem <= m01_lo=3465.2 ; valid needs N>=8 ===")
for N in range(9,26):
    v = partialExp(F(8),N)+expRemBound(F(8),N)
    ok = v <= m01_lo
    # size of largest term numerator digits
    dig = len(str((F(8)**N/fact(N)).numerator))+len(str((F(8)**N/fact(N)).denominator))
    if ok:
        print(f"  N={N}: partialExp8+rem={float(v):.2f} <= 3465.2 OK ; rational size ~{dig} digits")
        break
    else:
        print(f"  N={N}: {float(v):.2f} > 3465.2")

print("\n=== cutLog UPPER feasibility: need m01_hi=3485.4 <= partialExp(41/5,N) ; valid any N ===")
for N in range(9,30):
    v = partialExp(F(41,5),N)
    ok = m01_hi <= v
    if ok:
        print(f"  N={N}: partialExp(8.2)={float(v):.2f} >= 3485.4 OK")
        break
    else:
        print(f"  N={N}: {float(v):.2f} < 3485.4")
