#!/usr/bin/env python3
# Probe 2 — extract EXACT witness coordinates for the Lean transcription.
# Reuse the exact banked CD product from search.py logic.
from fractions import Fraction as F
from itertools import product

def dbl_mul(z, w):
    (zr, zi), (wr, wi) = z, w
    return (zr*wr - zi*wi, zr*wi + zi*wr)
def dbl_star(z):
    (r, i) = z; return (r, -i)
def badd(a, b):
    if isinstance(a, tuple): return tuple(badd(x,y) for x,y in zip(a,b))
    return a+b
def bneg(a):
    if isinstance(a, tuple): return tuple(bneg(x) for x in a)
    return -a
def cd_mul(bmul, bstar):
    def mul(z, w):
        (zr, zi), (wr, wi) = z, w
        re = badd(bmul(zr, wr), bneg(bmul(bstar(wi), zi)))
        im = badd(bmul(wi, zr), bmul(zi, bstar(wr)))
        return (re, im)
    return mul
def cd_star(bstar):
    def star(z):
        (r, i) = z; return (bstar(r), bneg(i))
    return star

H_mul = cd_mul(dbl_mul, dbl_star); H_star = cd_star(dbl_star)
O_mul = cd_mul(H_mul, H_star);     O_star = cd_star(H_star)
S_mul = cd_mul(O_mul, O_star);     S_star = cd_star(O_star)

def f2n(vec, dim):
    if dim == 1: return vec[0]
    h = dim//2; return (f2n(vec[:h],h), f2n(vec[h:],h))
def n2f(x):
    if isinstance(x, tuple): return n2f(x[0])+n2f(x[1])
    return [x]
def basis(dim,i):
    v=[F(0)]*dim; v[i]=F(1); return f2n(v,dim)

# nested literal printer producing Lean ⟨...⟩ over ℚ integer literals
def lean_lit(x):
    if isinstance(x, tuple):
        return "⟨" + lean_lit(x[0]) + ", " + lean_lit(x[1]) + "⟩"
    return f"({int(x)} : ℚ)" if x==int(x) else f"({x.numerator}/{x.denominator} : ℚ)"

def first_diff_coord(a, b):
    fa, fb = n2f(a), n2f(b)
    for idx,(u,v) in enumerate(zip(fa,fb)):
        if u!=v: return idx,u,v
    return None

# ---- O noncommute: smallest basis pair ----
print("=== O (dim 8) basis-pair commutation failures ===")
Ofound=None
for i,j in product(range(8),range(8)):
    if i>=j: continue
    a,b=basis(8,i),basis(8,j)
    if n2f(O_mul(a,b))!=n2f(O_mul(b,a)):
        Ofound=(i,j); break
print("  first:",Ofound)
i,j=Ofound
a,b=basis(8,i),basis(8,j)
d=first_diff_coord(O_mul(a,b),O_mul(b,a))
print(f"  O: e{i}*e{j} vs e{j}*e{i} differ at coord {d[0]}: {d[1]} vs {d[2]}")

# ---- S noncommute: smallest basis pair ----
print("\n=== S (dim 16) basis-pair commutation failures ===")
Sfound=None
for i,j in product(range(16),range(16)):
    if i>=j: continue
    a,b=basis(16,i),basis(16,j)
    if n2f(S_mul(a,b))!=n2f(S_mul(b,a)):
        Sfound=(i,j); break
print("  first:",Sfound)
i,j=Sfound
a,b=basis(16,i),basis(16,j)
d=first_diff_coord(S_mul(a,b),S_mul(b,a))
print(f"  S: e{i}*e{j} vs e{j}*e{i} differ at coord {d[0]}: {d[1]} vs {d[2]}")

# ---- S self-glue failure: a = zdX = e1+e10, y = e4 ----
print("\n=== S self-glue failure: a=e1+e10 (=banked zdX), y=e4 ===")
va=[F(0)]*16; va[1]=F(1); va[10]=F(1); a=f2n(va,16)
y=basis(16,4)
lhs=S_mul(a,S_mul(a,y)); rhs=S_mul(S_mul(a,a),y)
d=first_diff_coord(lhs,rhs)
print(f"  a*(a*y) vs (a*a)*y differ at coord {d[0]}: {d[1]} vs {d[2]}")
print("  a*a =", n2f(S_mul(a,a)))
# also try y as a pure banked basis we can name simply; check e0..e15 which give cleanest single-coord diff
print("\n=== S self-glue failure with a=zdX, vary y=e_k : cleanest ===")
best=None
for k in range(16):
    y=basis(16,k)
    lhs=S_mul(a,S_mul(a,y)); rhs=S_mul(S_mul(a,a),y)
    dd=first_diff_coord(lhs,rhs)
    if dd is not None:
        supp=sum(1 for u,v in zip(n2f(lhs),n2f(rhs)) if u!=v)
        if best is None or supp<best[1]:
            best=(k,supp,dd)
print("  best y=e",best[0]," support",best[1]," first-diff coord",best[2])

# Print exact Lean nested literal for zdX and e4 to confirm match with banked zdX
print("\n=== Lean literals ===")
print("  zdX(e1+e10) =", lean_lit(a))
print("  e4          =", lean_lit(basis(16,4)))
print("  e",best[0]," =", lean_lit(basis(16,best[0])))
