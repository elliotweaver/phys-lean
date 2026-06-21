"""
N2d probe — faithful Python model of the BANKED Cayley-Dickson double `CD`
(Phys/Cascade/Double.lean), to settle the EXACT algebra of the generic
self-overlap norm before any Lean.

Lean conventions (Double.lean):
  star z      = (star z.re, -z.im)
  (z*w).re    = z.re*w.re + -(star(w.im) * z.im)   =  z.re*w.re - star(w.im)*z.im
  (z*w).im    = w.im*z.re + z.im*star(w.re)
base R = ℚ (Fraction), star = id on the base.

An element at level L is a nested pair; we model it as a recursive structure:
  level 0 : a Fraction (the base ℚ)
  level L : a pair (re, im) of level L-1 elements.

We test, at each level:
  (A) the A-VALUED self-overlap   Nrm(z) := (z * star z).re   (a level L-1 element)
      multiplicativity:  Nrm(z*w) == Nrm(z) * Nrm(w)  (product in level L-1)
  (B) the SCALAR self-overlap     q(z)  := fully-projected re of (z*star z)  (a Fraction)
      multiplicativity:  q(z*w) == q(z) * q(w)
"""
from fractions import Fraction as F
import random

# ---------- recursive *-algebra over ℚ via Cayley-Dickson ----------

def zero(L):
    if L == 0: return F(0)
    return (zero(L-1), zero(L-1))

def add(x, y, L):
    if L == 0: return x + y
    return (add(x[0], y[0], L-1), add(x[1], y[1], L-1))

def neg(x, L):
    if L == 0: return -x
    return (neg(x[0], L-1), neg(x[1], L-1))

def star(x, L):
    if L == 0: return x                      # base: star = id
    return (star(x[0], L-1), neg(x[1], L-1)) # (star re, -im)

def mul(x, y, L):
    if L == 0: return x * y
    a, b = x          # z.re, z.im
    c, d = y          # w.re, w.im
    # re = a*c - star(d)*b ; im = d*a + b*star(c)
    re = add(mul(a, c, L-1), neg(mul(star(d, L-1), b, L-1), L-1), L-1)
    im = add(mul(d, a, L-1), mul(b, star(c, L-1), L-1), L-1)
    return (re, im)

def is_zero(x, L):
    if L == 0: return x == 0
    return is_zero(x[0], L-1) and is_zero(x[1], L-1)

def eq(x, y, L):
    return is_zero(add(x, neg(y, L), L), L)

# ---------- norms ----------

def Nrm(z, L):
    """A-valued self-overlap: (z * star z).re  — a level L-1 element."""
    return mul(z, star(z, L), L)[0]

def proj_re(x, L):
    """fully project to the base ℚ by taking .re repeatedly."""
    while L > 0:
        x = x[0]; L -= 1
    return x

def q(z, L):
    """scalar self-overlap: proj_re of (z*star z)."""
    return proj_re(mul(z, star(z, L), L), L)

# ---------- random elements ----------

def rand(L, lo=-3, hi=3):
    if L == 0: return F(random.randint(lo, hi))
    return (rand(L-1, lo, hi), rand(L-1, lo, hi))

# ---------- tests ----------

def test_Avalued(L, trials=400):
    """Is the A-valued norm multiplicative at level L? (product in base level L-1)"""
    fails = 0
    for _ in range(trials):
        z = rand(L); w = rand(L)
        lhs = Nrm(mul(z, w, L), L)            # level L-1
        rhs = mul(Nrm(z, L), Nrm(w, L), L-1)  # level L-1
        if not eq(lhs, rhs, L-1):
            fails += 1
    return fails

def test_scalar(L, trials=400):
    """Is the scalar norm multiplicative at level L?"""
    fails = 0
    for _ in range(trials):
        z = rand(L); w = rand(L)
        if q(mul(z, w, L), L) != q(z, L) * q(w, L):
            fails += 1
    return fails

names = {1: "C(dim2)", 2: "H(dim4)", 3: "O(dim8)", 4: "S(dim16)"}
print("=== A-VALUED self-overlap  Nrm(z)=(z*star z).re  multiplicativity ===")
for L in (1, 2, 3, 4):
    f = test_Avalued(L)
    print(f"  level {L} {names[L]:9s}: fails {f}/400  -> {'MULTIPLICATIVE' if f==0 else 'NOT multiplicative'}")

print("=== SCALAR self-overlap   q(z)=proj_re(z*star z)  multiplicativity ===")
for L in (1, 2, 3, 4):
    f = test_scalar(L)
    print(f"  level {L} {names[L]:9s}: fails {f}/400  -> {'MULTIPLICATIVE' if f==0 else 'NOT multiplicative'}")
