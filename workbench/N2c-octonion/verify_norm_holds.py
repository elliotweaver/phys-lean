#!/usr/bin/env python3
# W6/W8 independent verification: the Born self-overlap norm N(z) = scalar part of
# (z * star z) is MULTIPLICATIVE on levels 1,2,3 (C,H,O) and FAILS at level 4 (S).
# This is the anti-vacuity heart of the STOP: the law must genuinely HOLD before it
# dies, else `born_law_fails` would be a junk-projection artifact. Lean CD convention.
from fractions import Fraction as F
import random
def star(x, l):
    if l == 0: return x
    if l == 1:
        a, b = x; return (a, neg(b, 0))
    a, b = x; return (star(a, l-1), neg(b, l-1))
def neg(x, l): return -x if l == 0 else (neg(x[0], l-1), neg(x[1], l-1))
def add(x, y, l): return x + y if l == 0 else (add(x[0], y[0], l-1), add(x[1], y[1], l-1))
def sub(x, y, l): return add(x, neg(y, l), l)
def mul(x, y, l):
    if l == 0: return x * y
    a, b = x; c, d = y
    if l == 1: return (a*c - b*d, a*d + b*c)
    re = sub(mul(a, c, l-1), mul(star(d, l-1), b, l-1), l-1)
    im = add(mul(d, a, l-1), mul(b, star(c, l-1), l-1), l-1)
    return (re, im)
def flatten(x):
    if isinstance(x, F): return [x]
    return flatten(x[0]) + flatten(x[1])
def unflatten(v, l):
    if l == 0: return v[0]
    h = len(v)//2; return (unflatten(v[:h], l-1), unflatten(v[h:], l-1))
def randel(l): return unflatten([F(random.randint(-4, 4)) for _ in range(2**l)], l)
def Nscalar(z, l): return flatten(mul(z, star(z, l), l))[0]
def Nsumsq(z): return sum(c*c for c in flatten(z))
random.seed(7)
for l, name in [(1, 'C dim2'), (2, 'H dim4'), (3, 'O dim8'), (4, 'S dim16')]:
    ok_scalar = True; ok_mult = True; ssq_eq_scalar = True
    for _ in range(300):
        x = randel(l); y = randel(l)
        zz = flatten(mul(x, star(x, l), l))
        if any(c != 0 for c in zz[1:]): ok_scalar = False
        if zz[0] != Nsumsq(x): ssq_eq_scalar = False
        if Nscalar(mul(x, y, l), l) != Nscalar(x, l) * Nscalar(y, l): ok_mult = False
    print(f"{name}: z*star_z pure scalar={ok_scalar}  scalar==sum-of-squares={ssq_eq_scalar}  N multiplicative={ok_mult}")
