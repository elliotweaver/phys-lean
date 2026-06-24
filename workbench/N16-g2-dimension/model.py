#!/usr/bin/env python3
"""
N16 numerics — FAITHFUL exact-rational model of O ℚ = CD(CD(Dbl ℚ)) and the
Leibniz-derivation linear system. Reconnaissance only (NOT the deliverable).

Goal: compute the TRUE dimension of Der(O ℚ) (expect 14), exhibit an explicit
basis, check which banked constructions land in it, and design a biting costume.

Everything is EXACT (fractions). The product/star EXACTLY mirror the banked Lean:
  Dbl: (a,b)(c,d) = (ac - bd, ad + bc) ;  star(a,b) = (a,-b)
  CD A: (z*w).re = z.re*w.re - star(w.im)*z.im
        (z*w).im = w.im*z.re + z.im*star(w.re)
        star z   = (star z.re, -z.im)
"""
from fractions import Fraction as F
from itertools import product

# ---------- base: Dbl ℚ  (2-dim) ----------
# represent as (re, im) with re, im in ℚ
def dbl_mul(z, w):
    return (z[0]*w[0] - z[1]*w[1], z[0]*w[1] + z[1]*w[0])
def dbl_star(z):
    return (z[0], -z[1])
def dbl_add(z, w):
    return (z[0]+w[0], z[1]+w[1])
def dbl_neg(z):
    return (-z[0], -z[1])
DBL_ZERO = (F(0), F(0))

# ---------- generic CD doubling over a base with given ops ----------
def make_CD(mul, star, add, neg, zero):
    # element is (re, im), re/im in base
    def cd_mul(z, w):
        zr, zi = z; wr, wi = w
        re = add(mul(zr, wr), neg(mul(star(wi), zi)))
        im = add(mul(wi, zr), mul(zi, star(wr)))
        return (re, im)
    def cd_star(z):
        return (star(z[0]), neg(z[1]))
    def cd_add(z, w):
        return (add(z[0], w[0]), add(z[1], w[1]))
    def cd_neg(z):
        return (neg(z[0]), neg(z[1]))
    cd_zero = (zero, zero)
    return cd_mul, cd_star, cd_add, cd_neg, cd_zero

# H = CD(Dbl)
h_mul, h_star, h_add, h_neg, h_zero = make_CD(dbl_mul, dbl_star, dbl_add, dbl_neg, DBL_ZERO)
# O = CD(H)
o_mul, o_star, o_add, o_neg, o_zero = make_CD(h_mul, h_star, h_add, h_neg, h_zero)

# ---------- flatten octonion <-> 8 rational coords ----------
# octonion = (H_re, H_im); H = (Dbl_re, Dbl_im); Dbl = (q0,q1)
# coord index bit pattern (oct_im, h_im, dbl_im) -> 0..7
def o_from_vec(v):
    # v: list of 8 fractions, index = oct_im*4 + h_im*2 + dbl_im
    def dbl(b): return (v[b+0], v[b+1])
    def h(b):   return (dbl(b+0), dbl(b+2))
    return (h(0), h(4))
def o_to_vec(z):
    v = [None]*8
    for oi in (0,1):
        H = z[oi]
        for hi in (0,1):
            D = H[hi]
            for di in (0,1):
                v[oi*4 + hi*2 + di] = D[di]
    return v

# basis vectors e_0..e_7
def basis(i):
    v = [F(0)]*8; v[i] = F(1); return o_from_vec(v)

E = [basis(i) for i in range(8)]
# e_0 = 1 (the unit). Check:
ONE = E[0]
# sanity: 1*x = x
for i in range(8):
    assert o_to_vec(o_mul(ONE, E[i])) == o_to_vec(E[i]), f"1*e{i} fail"
    assert o_to_vec(o_mul(E[i], ONE)) == o_to_vec(E[i]), f"e{i}*1 fail"

# structure constants: e_i * e_j = sum_k C[i][j][k] e_k
C = [[o_to_vec(o_mul(E[i], E[j])) for j in range(8)] for i in range(8)]

# print the multiplication table (which unit, sign)
def fmt(vec):
    nz = [(k,c) for k,c in enumerate(vec) if c != 0]
    if not nz: return "0"
    return "+".join(f"{c}e{k}" for k,c in nz)
print("=== O ℚ multiplication table (e_i * e_j) ===")
for i in range(8):
    print(" ", " | ".join(f"{fmt(C[i][j]):>6}" for j in range(8)))

# imaginary units squared (expect -1 for i=1..7)
print("\n=== e_i * e_i ===")
for i in range(8):
    print(f"  e{i}*e{i} = {fmt(C[i][i])}")
