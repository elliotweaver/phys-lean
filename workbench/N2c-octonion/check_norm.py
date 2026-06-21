#!/usr/bin/env python3
# Confirm z*star(z) is a pure base scalar (= self-overlap norm) for the witnesses,
# so N := (z*star z).re.re.re.re genuinely reads the Born self-overlap form.
from fractions import Fraction as F
def star(x, lvl):
    if lvl == 0: return x
    if lvl == 1:
        a, b = x; return (a, neg(b, 0))
    a, b = x; return (star(a, lvl-1), neg(b, lvl-1))
def neg(x, lvl):
    return -x if lvl == 0 else (neg(x[0], lvl-1), neg(x[1], lvl-1))
def add(x, y, lvl):
    return x + y if lvl == 0 else (add(x[0], y[0], lvl-1), add(x[1], y[1], lvl-1))
def sub(x, y, lvl): return add(x, neg(y, lvl), lvl)
def mul(x, y, lvl):
    if lvl == 0: return x * y
    a, b = x; c, d = y
    if lvl == 1:
        return (a*c - b*d, a*d + b*c)
    re = sub(mul(a, c, lvl-1), mul(star(d, lvl-1), b, lvl-1), lvl-1)
    im = add(mul(d, a, lvl-1), mul(b, star(c, lvl-1), lvl-1), lvl-1)
    return (re, im)
def flatten(x):
    if isinstance(x, F): return [x]
    return flatten(x[0]) + flatten(x[1])
def unflatten(vec, lvl):
    if lvl == 0: return vec[0]
    h = len(vec)//2
    return (unflatten(vec[:h], lvl-1), unflatten(vec[h:], lvl-1))
def basis(lvl, i):
    e = [F(0)]*(2**lvl); e[i] = F(1); return unflatten(e, lvl)
x = add(basis(4,1), basis(4,10), 4)
y = add(basis(4,5), basis(4,14), 4)
for name, z in [("zdX", x), ("zdY", y)]:
    zz = mul(z, star(z, 4), 4)
    fl = flatten(zz)
    print(f"{name}: z*star(z) flat = {[int(v) for v in fl]}")
    print(f"   base scalar (coord 0) = {int(fl[0])}, all other coords zero? {all(v==0 for v in fl[1:])}")
    print(f"   sum-of-squares self-overlap Q(z) = {sum(int(v)**2 for v in flatten(z))}")
