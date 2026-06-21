#!/usr/bin/env python3
"""
N2c probe — verify the GO conditions in EXACT Lean convention before production Lean.

Lean CD (Phys/Cascade/Double.lean):
  star z       = (star z.re, -z.im)
  z * w        = (z.re*w.re + -(star w.im * z.im),  w.im*z.re + z.im*star w.re)
Base = Dbl ℚ (the complex algebra), itself a CD with trivial base star:
  Dbl star z   = (z.re, -z.im)
  Dbl z * w    = (z.re*w.re - z.im*w.im,  z.re*w.im + z.im*w.re)
Bottom = ℚ (star = id). We represent EVERY level as nested pairs and recurse, exactly
matching Lean's mk/accessors so a verified literal transcribes 1:1.

Tower:  level0 ℚ  → level1 C=Dbl ℚ → level2 H=CD C → level3 O=CD H → level4 S=CD O.
NOTE: level1 uses the Dbl product (the rung-1 special case, base star = id). levels 2,3,4
use the generic CD product with the propagated star. This matches Lean exactly:
H = CD (Dbl R), O = CD (CD (Dbl R)), S = CD (CD (CD (Dbl R))).
"""
from fractions import Fraction as F
import itertools

def star(x, lvl):
    if lvl == 0:
        return x
    if lvl == 1:                      # Dbl star: (re, -im)
        a, b = x
        return (a, neg(b, 0))
    a, b = x                          # CD star: (star re, -im)
    return (star(a, lvl-1), neg(b, lvl-1))

def neg(x, lvl):
    if lvl == 0: return -x
    return (neg(x[0], lvl-1), neg(x[1], lvl-1))

def add(x, y, lvl):
    if lvl == 0: return x + y
    return (add(x[0], y[0], lvl-1), add(x[1], y[1], lvl-1))

def mul(x, y, lvl):
    if lvl == 0:
        return x * y
    a, b = x; c, d = y
    if lvl == 1:                      # Dbl product (base star trivial)
        re = a*c - b*d
        im = a*d + b*c
        return (re, im)
    # generic CD product, Lean convention
    re = sub(mul(a, c, lvl-1), mul(star(d, lvl-1), b, lvl-1), lvl-1)
    im = add(mul(d, a, lvl-1), mul(b, star(c, lvl-1), lvl-1), lvl-1)
    return (re, im)

def sub(x, y, lvl):
    return add(x, neg(y, lvl), lvl)

def zero(lvl):
    if lvl == 0: return F(0)
    return (zero(lvl-1), zero(lvl-1))

def eq(x, y, lvl):
    if lvl == 0: return x == y
    return eq(x[0], y[0], lvl-1) and eq(x[1], y[1], lvl-1)

def flatten(x):
    if isinstance(x, F): return [x]
    return flatten(x[0]) + flatten(x[1])

def unflatten(vec, lvl):
    if lvl == 0:
        assert len(vec) == 1
        return vec[0]
    h = len(vec)//2
    return (unflatten(vec[:h], lvl-1), unflatten(vec[h:], lvl-1))

def basis(lvl, idx):
    e = [F(0)]*(2**lvl); e[idx] = F(1)
    return unflatten(e, lvl)

print("="*70)
print("N2c probe — Lean-exact CD conventions")
print("="*70)

# sanity: level1 J^2 = -1  (J=(0,1))
J = (F(0), F(1))
print("\n[sanity] level1 (C): J*J =", flatten(mul(J, J, 1)), "(expect [-1,0])")

# ---- G1: assoc-iff  (ι a · ι b)·e₂ == ι a·(ι b·e₂)  ⟺  ab == ba ----
# Work in a generic CD over base level L (so L+1 is the doubled level). Test both a
# commuting base (L=1, C commutative) and a NON-commuting base (L=2, H).
def iota(a, lvl):          # embed level-(lvl-1) elt a into CD at level lvl as (a,0)
    return (a, zero(lvl-1))
def e2(lvl):               # new generator (0,1) at level lvl
    return (zero(lvl-1), unit(lvl-1)) if False else (zero(lvl-1), one(lvl-1))
def one(lvl):
    if lvl == 0: return F(1)
    return (one(lvl-1), zero(lvl-1))

def assoc_iff_holds(a, b, L):
    # in CD at level L+1 over base level L
    lvl = L+1
    ia = iota(a, lvl); ib = iota(b, lvl); e = e2(lvl)
    lhs = mul(mul(ia, ib, lvl), e, lvl)
    rhs = mul(ia, mul(ib, e, lvl), lvl)
    assoc = eq(lhs, rhs, lvl)
    comm  = eq(mul(a, b, L), mul(b, a, L), L)
    return assoc, comm, lhs, rhs

print("\n[G1] assoc-iff  (ι a·ι b)·e₂ == ι a·(ι b·e₂)  ⟺  ab==ba")
# commuting base C (L=1): pick a=J, b=1+J
for (a, b, L, tag) in [
    (J, add(one(1), J, 1), 1, "C: a=J, b=1+J (commute)"),
]:
    assoc, comm, lhs, rhs = assoc_iff_holds(a, b, L)
    print(f"   {tag}: assoc={assoc} comm={comm}  -> iff OK: {assoc==comm}")
# non-commuting base H (L=2): a = ιJ, b = e₂  (the rung-2 pair)
aH = iota(J, 2)            # ιJ in H
bH = e2(2)                 # e₂ in H
assoc, comm, lhs, rhs = assoc_iff_holds(aH, bH, 2)
print(f"   H: a=ιJ, b=e₂ (DO NOT commute): assoc={assoc} comm={comm} -> iff OK: {assoc==comm}")
print(f"      witness lhs.im flat={flatten(lhs)[8:]} rhs.im flat={flatten(rhs)[8:]}")

# ---- G2: 𝕆 = CD(H) non-associating triple from the rung-2 pair ----
print("\n[G2] 𝕆 non-assoc: triple (ι(ιJ), ι(e₂_H), e₂_O) in O=level3")
x = iota(aH, 3)            # ι(ιJ) in O
y = iota(bH, 3)            # ι(e₂_H) in O
z = e2(3)                 # e₂ of O
lhsO = mul(mul(x, y, 3), z, 3)
rhsO = mul(x, mul(y, z, 3), 3)
print("   (x*y)*z == x*(y*z)? ", eq(lhsO, rhsO, 3), " (MUST be False)")
print("   (x*y)*z flat =", flatten(lhsO))
print("   x*(y*z) flat =", flatten(rhsO))

# ---- G3 + G4: zero divisor in S = CD(O) = level4, witness (e1+e10)(e5+e14)=0 ----
print("\n[G3/G4] STOP: zero divisor in S (level4, dim16): (e1+e10)(e5+e14)")
e = [basis(4, i) for i in range(16)]
xs = add(e[1], e[10], 4)
ys = add(e[5], e[14], 4)
prod = mul(xs, ys, 4)
print("   x*y == 0 ? ", eq(prod, zero(4), 4), " (MUST be True)")
print("   x flat =", [int(v) for v in flatten(xs)])
print("   y flat =", [int(v) for v in flatten(ys)])
print("   x nested =", xs)
print("   y nested =", ys)
Qx = sum(v*v for v in flatten(xs)); Qy = sum(v*v for v in flatten(ys))
Qxy = sum(v*v for v in flatten(prod))
print(f"   Q x = {Qx}, Q y = {Qy}, Q(x*y) = {Qxy}  -> Born law Q(xy)=QxQy? {Qxy==Qx*Qy} (MUST be False)")
print("\nDONE.")
