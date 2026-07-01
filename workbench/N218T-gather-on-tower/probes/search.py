#!/usr/bin/env python3
# Measure-first probe for N218T — THE GATHER ON THE TOWER.
# Mirror the EXACT banked Cayley-Dickson product so any witness transcribes 1:1 to Lean.
#
# Banked (Phys/Cascade):
#   Dbl.mul  = <re*re - im*im, re*im + im*re>           (its OWN instance, over base Q with star=id)
#   Dbl.star = <re, -im>
#   CD.mul   = <z.re*w.re + -(star w.im * z.im), w.im*z.re + z.im*star w.re>
#   CD.star  = <star re, -im>
# Tower:  Dbl Q  ->  H = CD(Dbl Q)  ->  O = CD(H)  ->  S = CD(O)
#
# We test, per rung:
#   (assoc)  a*(b*c) == (a*b)*c            [GatherCoheres  <-> associativity]
#   (comm)   a*b == b*a                    [WorldsCommute]
#   (l-alt)  a*(a*y) == (a*a)*y            [SelfGlues      <-> left-alternative]
# and find a CLEAN small-integer witness where each first fails, for the Lean transcription.

from fractions import Fraction as F
from itertools import product
import random

# ---- level 0: Q ----
def q_mul(a, b): return a * b
def q_star(a): return a

# ---- Dbl over Q (its own instance) ----
def dbl_mul(z, w):
    (zr, zi), (wr, wi) = z, w
    return (zr*wr - zi*wi, zr*wi + zi*wr)
def dbl_star(z):
    (r, i) = z
    return (r, -i)

# ---- generic CD double over a base with (bmul, bstar) ----
def cd_mul(bmul, bstar):
    def mul(z, w):
        (zr, zi), (wr, wi) = z, w
        re = bmul(zr, wr)
        # -(star w.im * z.im)
        re = badd_generic(re, bneg_generic(bmul(bstar(wi), zi)))
        im = badd_generic(bmul(wi, zr), bmul(zi, bstar(wr)))
        return (re, im)
    return mul
def cd_star(bstar):
    def star(z):
        (r, i) = z
        return (bstar(r), bneg_generic(i))
    return star

# generic add/neg/zero that recurse on tuple depth
def badd_generic(a, b):
    if isinstance(a, tuple):
        return tuple(badd_generic(x, y) for x, y in zip(a, b))
    return a + b
def bneg_generic(a):
    if isinstance(a, tuple):
        return tuple(bneg_generic(x) for x in a)
    return -a
def zero_like(a):
    if isinstance(a, tuple):
        return tuple(zero_like(x) for x in a)
    return F(0)

# Build multiply/star per rung.
# Dbl:
Dbl = (dbl_mul, dbl_star, 2)
# H = CD(Dbl):
H_mul = cd_mul(dbl_mul, dbl_star); H_star = cd_star(dbl_star); H = (H_mul, H_star, 4)
# O = CD(H):
O_mul = cd_mul(H_mul, H_star); O_star = cd_star(H_star); O = (O_mul, O_star, 8)
# S = CD(O):
S_mul = cd_mul(O_mul, O_star); S_star = cd_star(O_star); S = (S_mul, S_star, 16)

def flat_to_nested(vec, dim):
    # vec: list of length dim of Fractions -> nested pair structure of depth log2(dim)
    if dim == 1:
        return vec[0]
    h = dim // 2
    return (flat_to_nested(vec[:h], h), flat_to_nested(vec[h:], h))

def nested_to_flat(x):
    if isinstance(x, tuple):
        return nested_to_flat(x[0]) + nested_to_flat(x[1])
    return [x]

def basis(dim, i):
    v = [F(0)]*dim
    v[i] = F(1)
    return flat_to_nested(v, dim)

def eq(a, b):
    return nested_to_flat(a) == nested_to_flat(b)

def test_rung(name, mul, dim, ntrials=4000):
    # random-search for failures of assoc, comm, left-alt
    def rnd():
        return flat_to_nested([F(random.randint(-2,2)) for _ in range(dim)], dim)
    assoc_fail = comm_fail = lalt_fail = None
    for _ in range(ntrials):
        a, b, c = rnd(), rnd(), rnd()
        if assoc_fail is None and not eq(mul(a, mul(b,c)), mul(mul(a,b), c)):
            assoc_fail = (a,b,c)
        if comm_fail is None and not eq(mul(a,b), mul(b,a)):
            comm_fail = (a,b)
        if lalt_fail is None and not eq(mul(a, mul(a,b)), mul(mul(a,a), b)):
            lalt_fail = (a,b)
        if assoc_fail and comm_fail and lalt_fail:
            break
    print(f"\n=== {name} (dim {dim}) ===")
    print(f"  assoc fails?     {'YES' if assoc_fail else 'no (associative in sample)'}")
    print(f"  comm  fails?     {'YES' if comm_fail else 'no (commutative in sample)'}")
    print(f"  left-alt fails?  {'YES' if lalt_fail else 'no (left-alt in sample)'}")
    return assoc_fail, comm_fail, lalt_fail

random.seed(1)
for nm, (mul, star, dim) in [("Dbl", Dbl), ("H", H), ("O", O), ("S", S)]:
    test_rung(nm, mul, dim)

# --- Find a CLEAN basis-pair left-alternativity failure on S for the Lean witness ---
print("\n=== S: clean basis-vector left-alternativity witnesses  a*(a*y) != (a*a)*y ===")
found = []
for i, j in product(range(16), range(16)):
    a = basis(16, i); y = basis(16, j)
    lhs = S_mul(a, S_mul(a, y))
    rhs = S_mul(S_mul(a, a), y)
    if not eq(lhs, rhs):
        found.append((i, j, nested_to_flat(lhs), nested_to_flat(rhs)))
print(f"  basis-pair failures: {len(found)}")
# also try sums of two basis vectors for a (single basis vectors square to -1, a*a central, so need non-basis a)
print("\n=== S: a = e_i + e_j (i<j), y = e_k : left-alt failures (small support) ===")
best = None
for i, j in product(range(16), range(16)):
    if i >= j: continue
    va = [F(0)]*16; va[i]=F(1); va[j]=F(1)
    a = flat_to_nested(va, 16)
    aa = S_mul(a,a)
    for k in range(16):
        y = basis(16, k)
        lhs = S_mul(a, S_mul(a,y)); rhs = S_mul(aa, y)
        if not eq(lhs, rhs):
            diff = [x-yv for x,yv in zip(nested_to_flat(lhs), nested_to_flat(rhs))]
            supp = sum(1 for d in diff if d!=0)
            cand = (i,j,k,supp,nested_to_flat(lhs),nested_to_flat(rhs))
            if best is None or supp < best[3]:
                best = cand
if best:
    i,j,k,supp,lhs,rhs = best
    print(f"  cleanest: a = e{i}+e{j}, y = e{k}, diff support {supp}")
    print(f"    lhs (a*(a*y)) = {lhs}")
    print(f"    rhs ((a*a)*y) = {rhs}")
else:
    print("  none found with e_i+e_j (unexpected)")
