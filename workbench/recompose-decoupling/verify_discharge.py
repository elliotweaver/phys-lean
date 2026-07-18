#!/usr/bin/env python3
"""Verify the certified charm-edge log bracket built from the banked cutLog instrument.

edge = 1/mbRatioDerived, banked invMbRatio_bracket: 5969/100 <= edge <= 5971/100.
We want a two-sided certified bracket  a <= cutLog(edge) <= b  built ONLY from:
  - cutLog_ge_certified: a <= cutLog(c)  if  partialExp(a,N)+expRemBound(a,N) <= c
  - cutLog_le_certified: cutLog(c) <= b  if  c <= partialExp(b,N)
with c = edge, using the banked rational bounds 5969/100 (lower) and 5971/100 (upper).

Lower target a: need partialExp(a,N)+expRemBound(a,N) <= 5969/100 (then <= edge).
Upper target b: need 5971/100 <= partialExp(b,N)  (then edge <= that <= cutExp b).
"""
from fractions import Fraction as F
from math import factorial, log

def partialExp(q, N):
    return sum(q**i / F(factorial(i)) for i in range(N))

def expRemBound(q, N):
    # (q^N/N!) * (1 - q/(N+1))^{-1}
    return (q**N / F(factorial(N))) * (1 - q/(F(N+1)))**(-1)

edge_lo = F(5969,100)
edge_hi = F(5971,100)
print(f"edge bracket: [{float(edge_lo):.4f}, {float(edge_hi):.4f}]  (1/mbRatio)")
print(f"ln(edge_lo)={log(float(edge_lo)):.6f}  ln(edge_hi)={log(float(edge_hi)):.6f}")
print()

# --- LOWER: find smallest N s.t. partialExp(4,N)+expRemBound(4,N) <= 5969/100 ---
a = F(4)
print(f"LOWER a=4 (need partialExp(4,N)+expRemBound(4,N) <= {float(edge_lo):.4f}):")
for N in range(5, 40):
    if a < N+1:
        val = partialExp(a,N) + expRemBound(a,N)
        ok = val <= edge_lo
        if ok:
            print(f"  N={N}: partialExp+rem = {float(val):.5f}  <= {float(edge_lo):.4f}  CERTIFIES a=4  ✓")
            print(f"       exact: {val} <= {edge_lo}: {val <= edge_lo}")
            LOWER_N = N; break
        elif N < 20:
            print(f"  N={N}: partialExp+rem = {float(val):.5f}  (not yet)")

# --- UPPER: find smallest N s.t. 5971/100 <= partialExp(41/10,N) ---
b = F(41,10)
print(f"\nUPPER b=41/10 (need {float(edge_hi):.4f} <= partialExp(41/10,N)):")
for N in range(5, 40):
    val = partialExp(b,N)
    ok = edge_hi <= val
    if ok:
        print(f"  N={N}: partialExp(4.1,N) = {float(val):.5f}  >= {float(edge_hi):.4f}  CERTIFIES b=41/10  ✓")
        print(f"       exact: {edge_hi} <= {val}: {edge_hi <= val}")
        UPPER_N = N; break
    elif N < 20:
        print(f"  N={N}: partialExp(4.1,N) = {float(val):.5f}  (not yet)")

print()
print("SANITY: 4 < 41/10 (strict two-sided):", F(4) < F(41,10))
print("charm cross-ratio log negative: cutLog(mbRatio) = -cutLog(edge) in [-41/10, -4] < 0")
print("mbRatioDerived approx:", 1/float(edge_lo), "to", 1/float(edge_hi), "-> ln in",
      f"[{log(1/float(edge_lo)):.5f}, {log(1/float(edge_hi)):.5f}]")
