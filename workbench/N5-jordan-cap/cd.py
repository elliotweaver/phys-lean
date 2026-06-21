"""
Exact Cayley-Dickson arithmetic matching the BANKED Lean construction.

  O ℚ = CD (CD (Dbl ℚ)).  Dbl ℚ behaves as CD ℚ with star = id on ℚ.
  So an octonion = 3 doublings of ℚ = nested pairs, 8 rationals.

CD product (Phys/Cascade/Double.lean):
  (z*w).re = z.re*w.re + -(star(w.im)*z.im)
  (z*w).im = w.im*z.re + z.im*star(w.re)
star: (star z).re = star(z.re),  (star z).im = -z.im
At the bottom (ℚ): star = id.
"""
from fractions import Fraction as F

# ---- generic CD arithmetic over nested tuples; bottom = Fraction ----
def is_scalar(x):
    return isinstance(x, F)

def add(x, y):
    if is_scalar(x):
        return x + y
    return (add(x[0], y[0]), add(x[1], y[1]))

def neg(x):
    if is_scalar(x):
        return -x
    return (neg(x[0]), neg(x[1]))

def sub(x, y):
    return add(x, neg(y))

def star(x):
    if is_scalar(x):
        return x
    return (star(x[0]), neg(x[1]))

def mul(x, y):
    if is_scalar(x):
        return x * y
    a, b = x      # z.re, z.im
    c, d = y      # w.re, w.im
    re = sub(mul(a, c), mul(star(d), b))   # z.re*w.re - star(w.im)*z.im
    im = add(mul(d, a), mul(b, star(c)))   # w.im*z.re + z.im*star(w.re)
    return (re, im)

def zero(level):
    if level == 0:
        return F(0)
    z = zero(level - 1)
    return (z, z)

def one(level):
    if level == 0:
        return F(1)
    return (one(level - 1), zero(level - 1))

# octonions live at level 3
LV = 3
def Ozero():
    return zero(LV)
def Oone():
    return one(LV)

def is_zero(x):
    if is_scalar(x):
        return x == 0
    return is_zero(x[0]) and is_zero(x[1])

def eq(x, y):
    return is_zero(sub(x, y))

# ---- the 8 standard basis octonions, as level-3 nested tuples ----
# basis index k (0..7): 1 at the k-th of 8 leaf slots, 0 elsewhere.
def basis(k):
    # leaves order: traverse (re,im) recursively, re first.
    bits = [(k >> (LV - 1 - i)) & 1 for i in range(LV)]  # MSB = outermost
    def build(level, path):
        if level == 0:
            return F(1) if path == [] else None
        # path[0] selects re(0)/im(1)
        re = build(level - 1, path[1:]) if path[0] == 0 else zero(level - 1)
        im = build(level - 1, path[1:]) if path[0] == 1 else zero(level - 1)
        if path[0] == 0:
            return (re if re is not None else zero(level-1), zero(level-1))
        else:
            return (zero(level-1), im if im is not None else zero(level-1))
    return build(LV, bits)

# sanity: basis(0) should be the unit (1,0,0,...,0)
def flatten(x):
    if is_scalar(x):
        return [x]
    return flatten(x[0]) + flatten(x[1])

def from_coords(cs):
    """build octonion from list of 8 rationals (leaf order)."""
    def build(level, lst):
        if level == 0:
            return lst[0], lst[1:]
        re, lst = build(level - 1, lst)
        im, lst = build(level - 1, lst)
        return (re, im), lst
    o, rest = build(LV, [F(c) for c in cs])
    assert rest == []
    return o

if __name__ == "__main__":
    # checks
    assert flatten(Oone()) == [F(1)] + [F(0)]*7
    for k in range(8):
        assert flatten(basis(k))[k] == 1 and sum(1 for v in flatten(basis(k)) if v != 0) == 1, k
    # unit behaves as identity
    import random
    for _ in range(50):
        cs = [F(random.randint(-3,3)) for _ in range(8)]
        x = from_coords(cs)
        assert eq(mul(x, Oone()), x) and eq(mul(Oone(), x), x)
    # star anti-multiplicative: star(xy) = star(y) star(x)
    for _ in range(200):
        x = from_coords([F(random.randint(-3,3)) for _ in range(8)])
        y = from_coords([F(random.randint(-3,3)) for _ in range(8)])
        assert eq(star(mul(x,y)), mul(star(y), star(x))), "star not anti-mult!"
    # NON-associativity present (the banked fact)
    triples_nonassoc = 0
    for _ in range(500):
        x = from_coords([F(random.randint(-2,2)) for _ in range(8)])
        y = from_coords([F(random.randint(-2,2)) for _ in range(8)])
        z = from_coords([F(random.randint(-2,2)) for _ in range(8)])
        if not eq(mul(mul(x,y),z), mul(x,mul(y,z))):
            triples_nonassoc += 1
    print("octonion arithmetic OK. star anti-mult holds. non-assoc triples (of 500):", triples_nonassoc)
    # alternativity: x(xy) = (xx)y  and (yx)x = y(xx)
    altL = altR = True
    for _ in range(500):
        x = from_coords([F(random.randint(-2,2)) for _ in range(8)])
        y = from_coords([F(random.randint(-2,2)) for _ in range(8)])
        if not eq(mul(x, mul(x, y)), mul(mul(x, x), y)): altL = False
        if not eq(mul(mul(y, x), x), mul(y, mul(x, x))): altR = False
    print("left-alternative x(xy)=(xx)y:", altL, " right-alternative (yx)x=y(xx):", altR)
