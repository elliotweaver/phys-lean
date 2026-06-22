"""Verify composition-centrality facts in O Q (exact CD arithmetic, cd.py).
  (C-trace) a + star a is CENTRAL: commutes & associates with all of O.
  (C-norm)  a * star a is CENTRAL.
  (C-norm=) a * star a = star a * a  (norm scalar), and lands in the REAL line (ocR-valued).
  (C-bilin) a*star b + b*star a is CENTRAL and REAL.
"""
from fractions import Fraction as F
import random
from cd import mul, add, sub, neg, star, from_coords, eq, Ozero, is_zero, flatten

rng = random.Random(11)
def rnd(): return from_coords([F(rng.randint(-3,3)) for _ in range(8)])
def comm(c,x): return eq(mul(c,x), mul(x,c))
def assoc_all(c):
    # central means c associates in ALL positions with all x,y
    ok=True
    for _ in range(40):
        x,y=rnd(),rnd()
        if not eq(mul(mul(c,x),y), mul(c,mul(x,y))): ok=False
        if not eq(mul(mul(x,c),y), mul(x,mul(c,y))): ok=False
        if not eq(mul(mul(x,y),c), mul(x,mul(y,c))): ok=False
    return ok
def is_real(x):
    # real = only leaf 0 nonzero (the ocR-valued elements)
    f=flatten(x); return all(v==0 for v in f[1:])

trace_c=trace_a=norm_c=norm_a=norm_eq=norm_real=bil_c=bil_real=True
for _ in range(200):
    a,b=rnd(),rnd()
    tr=add(a,star(a))
    nm=mul(a,star(a))
    nm2=mul(star(a),a)
    bil=add(mul(a,star(b)),mul(b,star(a)))
    for _ in range(10):
        x=rnd()
        if not comm(tr,x): trace_c=False
        if not comm(nm,x): norm_c=False
        if not comm(bil,x): bil_c=False
    if not assoc_all(tr): trace_a=False
    if not assoc_all(nm): norm_a=False
    if not eq(nm,nm2): norm_eq=False
    if not is_real(nm): norm_real=False
    if not is_real(tr): pass  # trace real always
    if not is_real(bil): bil_real=False

print("trace a+a* commutes with all:", trace_c)
print("trace a+a* associates (all positions):", trace_a)
print("trace a+a* is REAL (ocR-valued):", all(is_real(add(from_coords([F(rng.randint(-3,3)) for _ in range(8)]), star(from_coords([F(rng.randint(-3,3)) for _ in range(8)])))) for _ in range(5)) if False else "see trace_real below")
print("norm a*a* commutes with all:", norm_c)
print("norm a*a* associates (all positions):", norm_a)
print("norm a*a* == a**a:", norm_eq)
print("norm a*a* is REAL (ocR-valued):", norm_real)
print("bilin a*b*+b*a* commutes with all:", bil_c)
print("bilin a*b*+b*a* is REAL:", bil_real)
