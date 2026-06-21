#!/usr/bin/env python3
"""
N2a — THE COMPLEX UNIT — numerics with teeth.

The probe: a *fold-root* is a real linear operator J with J∘J = look = -id (N1's fold).
We ask, by EXACT integer/rational linear algebra, on which real dimensions a fold-root
exists, and verify the concrete dim-2 construction J(a,b) = (-b, a) is a genuine fold-root,
self-blind, and a NEW operator. The teeth: a wrong continuation (claiming a fold-root at the
odd base dim) and a wrong stop (the swap map J(a,b)=(b,a) with J^2 = +id) must BOTH be false.

Exact arithmetic only (Fraction); no floats in any decision.
"""
from fractions import Fraction as F
from itertools import product

def matmul(A, B):
    n = len(A); m = len(B[0]); k = len(B)
    return [[sum(A[i][t]*B[t][j] for t in range(k)) for j in range(m)] for i in range(n)]

def neg_id(n):
    return [[F(-1) if i==j else F(0) for j in range(n)] for i in range(n)]

def ident(n):
    return [[F(1) if i==j else F(0) for j in range(n)] for i in range(n)]

def is_fold_root(J):
    """J∘J == -id  (the fold law applied to J∘J: (J∘J)(x) + x = 0)."""
    n = len(J)
    return matmul(J, J) == neg_id(n)

def det(M):
    """Exact determinant by cofactor expansion (small n)."""
    n = len(M)
    if n == 1:
        return M[0][0]
    if n == 2:
        return M[0][0]*M[1][1] - M[0][1]*M[1][0]
    total = F(0)
    for j in range(n):
        minor = [row[:j]+row[j+1:] for row in M[1:]]
        total += ((-1)**j) * M[0][j] * det(minor)
    return total

print("="*70)
print("N2a THE COMPLEX UNIT — fold-root obstruction & resolution (exact)")
print("="*70)

# ---------------------------------------------------------------------------
# RUNG 1 — OBSTRUCTION at the base (dim 1). A linear endo of R is c·(); a
# fold-root needs c^2 = -1, impossible in R. Search ALL rational c in a wide
# exact grid: none squares to -1 (and the algebraic fact c^2>=0 settles it).
# ---------------------------------------------------------------------------
print("\n[RUNG 1] dim 1 — does any real-linear J satisfy J^2 = -id?")
found = None
# c^2 = -1 over the rationals: scan numerators/denominators exactly.
for p in range(-50, 51):
    for q in range(1, 51):
        c = F(p, q)
        if c*c == F(-1):
            found = c
# Plus the structural fact:
print("   J on dim 1 is multiplication by c; J^2=-id  <=>  c^2 = -1.")
print("   exact rational scan for c with c^2=-1 :", "NONE" if found is None else found)
print("   c^2 >= 0 for every real c, so c^2 = -1 is impossible  -> OBSTRUCTION CONFIRMED")
assert found is None, "BUG: found a rational square root of -1"

# ---------------------------------------------------------------------------
# RUNG 2 — RESOLUTION by doubling (dim 2). J2(a,b) = (-b, a).
# matrix [[0,-1],[1,0]].
# ---------------------------------------------------------------------------
print("\n[RUNG 2] dim 2 — the doubled carrier R x R, J2(a,b) = (-b, a):")
J2 = [[F(0), F(-1)],
      [F(1), F(0)]]
print("   J2 =", J2)
print("   J2 is a fold-root (J2^2 = -id) :", is_fold_root(J2))
assert is_fold_root(J2)

# self-blindness: J2 p = p  =>  p = 0. Solve (J2 - I)p = 0 exactly.
# [[-1,-1],[1,-1]] p = 0  => only p = 0 (det = 2 != 0).
JmI = [[J2[i][j] - (F(1) if i==j else F(0)) for j in range(2)] for i in range(2)]
print("   det(J2 - I) =", det(JmI), "(nonzero => only fixed point is 0 => SELF-BLIND)")
assert det(JmI) != 0

# NEW operator: J2 != id and J2 != -id.
print("   J2 == id ? ", J2 == ident(2), "  J2 == -id ? ", J2 == neg_id(2),
      "  => genuinely NEW operator")
assert J2 != ident(2) and J2 != neg_id(2)

# the complex-unit law, read out: J2 acts as i;  for z=(a,b)~a+bi, J2 z ~ i*z.
a, b = F(3), F(5)
img = (J2[0][0]*a + J2[0][1]*b, J2[1][0]*a + J2[1][1]*b)
print(f"   J2*(a,b)=({a},{b}) -> {img}  == i*(a+bi) = (-b)+(a)i = ({-b},{a}) :",
      img == (-b, a))
assert img == (-b, a)

# ---------------------------------------------------------------------------
# THE TEETH — costumes that MUST be false.
# ---------------------------------------------------------------------------
print("\n[TEETH] garbage witnesses the kernel MUST reject:")

# Costume A: WRONG CONTINUATION — claim a fold-root exists at the odd base dim 1.
#   ANY 1x1 matrix [[c]] : c^2 = -1 has no real solution.
print("   (A) WRONG CONTINUATION: a fold-root at dim 1.")
print("       no real c has c^2=-1  => the dim-1 fold-root claim is FALSE (must reject).")

# Costume B: WRONG STOP — the swap map J(a,b)=(b,a), matrix [[0,1],[1,0]], has
#   J^2 = +id, NOT -id. Claiming it is a fold-root is FALSE.
Jswap = [[F(0), F(1)],
         [F(1), F(0)]]
print("   (B) WRONG STOP: swap map Jswap(a,b)=(b,a):")
print("       Jswap^2 =", matmul(Jswap, Jswap), " == +id, NOT -id => NOT a fold-root (must reject).")
assert matmul(Jswap, Jswap) == ident(2)
assert not is_fold_root(Jswap)

# ---------------------------------------------------------------------------
# THE FORCED-DOUBLING SIGNAL — det(J)^2 = (-1)^n. Odd n => det^2 = -1 impossible
# over R => NO fold-root in odd dim. Even n => possible. This is the "why double".
# ---------------------------------------------------------------------------
print("\n[DOUBLING LAW] for J^2 = -id on dim n:  det(J)^2 = det(-id) = (-1)^n")
for n in range(1, 7):
    dn = (-1)**n
    print(f"   n={n}: det(J)^2 must equal (-1)^{n} = {dn:+d}  -> "
          f"{'IMPOSSIBLE over R (det^2>=0)  => NO fold-root' if dn<0 else 'allowed (even dim)'}")
print("   => fold-roots live ONLY in EVEN dimension; base dim 1 (odd) is blocked;")
print("      minimal nontrivial even dim is 2  => the carrier is FORCED to double 1 -> 2.")

print("\n" + "="*70)
print("VERDICT: GO. dim-1 obstruction is a real contradiction (c^2=-1);")
print("dim-2 resolution J2 is a genuine, self-blind, NEW fold-root = the complex unit;")
print("both costumes (dim-1 continuation, swap-map stop) are FALSE => teeth bite.")
print("="*70)
