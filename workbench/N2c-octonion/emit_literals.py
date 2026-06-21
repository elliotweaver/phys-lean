#!/usr/bin/env python3
# Re-run the witness construction and EMIT Lean anonymous-constructor literals.
from fractions import Fraction as F
def add(x, y, l):
    return x + y if l == 0 else (add(x[0], y[0], l-1), add(x[1], y[1], l-1))
def unflatten(vec, l):
    if l == 0: return vec[0]
    h = len(vec)//2
    return (unflatten(vec[:h], l-1), unflatten(vec[h:], l-1))
def basis(l, i):
    e = [F(0)]*(2**l); e[i] = F(1)
    return unflatten(e, l)
xs = add(basis(4, 1), basis(4, 10), 4)
ys = add(basis(4, 5), basis(4, 14), 4)
def lean(x):
    if isinstance(x, F):
        return str(int(x))
    return '\u27e8' + lean(x[0]) + ', ' + lean(x[1]) + '\u27e9'
print('x (e1+e10) :=', lean(xs))
print('y (e5+e14) :=', lean(ys))
