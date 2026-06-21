#!/usr/bin/env python3
"""
N2b numerics-with-teeth — the generic Cayley-Dickson DOUBLING, reused at every rung.

ONE operation (the CD double) applied repeatedly from the base line:
    R (star=id)  --double-->  C (dim 2)  --double-->  H (dim 4)
                 --double-->  O (dim 8)  --double-->  S (dim 16, sedenions)

Exact arithmetic (Fraction). We probe the FORCED cascade and the garbage witnesses
each rung MUST reject:

  rung C (=Dbl R, banked):  commutative + associative.
  rung H:  ASSOCIATIVE, NON-commutative  (the rung-2 content of N2b).
           GARBAGE: "H is commutative" must be FALSE (exhibit a non-commuting pair).
  rung O:  NON-associative  (rung-3 content of the child N2c).
           GARBAGE: "O is associative" must be FALSE (exhibit a non-associating triple).
  rung S:  the composition/Born norm law  N(xy)=N(x)N(y)  DIES, zero divisors appear
           (the STOP, grandchild). GARBAGE: "S keeps the norm law" must be FALSE.

The CAUSE chain (one cause, many terminations):
  - H loses commutativity  BECAUSE the base C has an element with  a != star a  (the
    rung-1 complex unit J, star J = -J).
  - O loses associativity  BECAUSE the base H is non-commutative.
  - S loses the norm law    BECAUSE the base O is non-associative.
Each loss is caused by the property lost at the PREVIOUS rung.
"""
from fractions import Fraction as F
import itertools, random

# ---- generic Cayley-Dickson double over a *-ring represented as nested pairs ----
# A base element is a Fraction (star = identity). A doubled element is a tuple (a, b)
# of two same-level elements. Operations recurse on structure.

def add(x, y):
    if isinstance(x, F): return x + y
    return (add(x[0], y[0]), add(x[1], y[1]))

def neg(x):
    if isinstance(x, F): return -x
    return (neg(x[0]), neg(x[1]))

def sub(x, y):
    return add(x, neg(y))

def star(x):
    # base: identity; doubled: (a,b)* = (star a, -b)
    if isinstance(x, F): return x
    return (star(x[0]), neg(x[1]))

def mul(x, y):
    # base: field mult; doubled CD product (Baez): (a,b)(c,d) = (ac - d* b, d a + b c*)
    if isinstance(x, F): return x * y
    a, b = x; c, d = y
    re = sub(mul(a, c), mul(star(d), b))
    im = add(mul(d, a), mul(b, star(c)))
    return (re, im)

def zero(level):
    if level == 0: return F(0)
    return (zero(level-1), zero(level-1))

def one(level):
    if level == 0: return F(1)
    return (one(level-1), zero(level-1))

def eq(x, y):
    if isinstance(x, F): return x == y
    return eq(x[0], y[0]) and eq(x[1], y[1])

def flatten(x):
    if isinstance(x, F): return [x]
    return flatten(x[0]) + flatten(x[1])

def norm_sq(x):
    # N(x) = x * star(x) ; for a composition algebra this is the base scalar (re part)
    return mul(x, star(x))

def is_scalar(x, level):
    # True iff x lives on the base line (all non-re components zero)
    fl = flatten(x)
    return all(v == 0 for v in fl[1:])

def rand_elem(level, lo=-3, hi=3):
    if level == 0:
        return F(random.randint(lo, hi))
    return (rand_elem(level-1, lo, hi), rand_elem(level-1, lo, hi))

def basis(level, idx):
    # the idx-th standard basis element at given level (dim = 2**level)
    e = [F(0)] * (2**level)
    e[idx] = F(1)
    return unflatten(e, level)

def unflatten(vec, level):
    if level == 0:
        assert len(vec) == 1
        return vec[0]
    half = len(vec)//2
    return (unflatten(vec[:half], level-1), unflatten(vec[half:], level-1))

random.seed(1)
print("="*70)
print("CASCADE by repeated Cayley-Dickson doubling (exact rational arithmetic)")
print("="*70)

# ---- sanity: levels and units ----
for lvl, name in [(1,"C"),(2,"H"),(3,"O"),(4,"S")]:
    print(f"  level {lvl} ({name}): dim = {2**lvl}")

def check_commutative(level, trials=400):
    for _ in range(trials):
        x = rand_elem(level); y = rand_elem(level)
        if not eq(mul(x,y), mul(y,x)):
            return (x, y)
    return None

def check_associative(level, trials=400):
    for _ in range(trials):
        x = rand_elem(level); y = rand_elem(level); z = rand_elem(level)
        if not eq(mul(mul(x,y),z), mul(x,mul(y,z))):
            return (x, y, z)
    return None

def check_norm_multiplicative(level, trials=400):
    for _ in range(trials):
        x = rand_elem(level); y = rand_elem(level)
        lhs = norm_sq(mul(x,y))
        rhs = mul(norm_sq(x), norm_sq(y))
        # both should be scalars; compare
        if not eq(lhs, rhs):
            return (x, y, lhs, rhs)
    return None

def check_zero_divisors(level, trials=20000):
    # look for nonzero x,y with xy = 0
    for _ in range(trials):
        x = rand_elem(level, -1, 1); y = rand_elem(level, -1, 1)
        if not eq(x, zero(level)) and not eq(y, zero(level)) and eq(mul(x,y), zero(level)):
            return (x, y)
    return None

print("\n-- rung C (= banked Dbl R): expect commutative + associative --")
print("   commutative? ", check_commutative(1) is None)
print("   associative? ", check_associative(1) is None)

print("\n-- rung H = CD(C): expect ASSOCIATIVE, NON-commutative (rung-2 content) --")
assoc_H = check_associative(2)
ncomm_H = check_commutative(2)
print("   associative? ", assoc_H is None)
print("   non-commutative witness found? ", ncomm_H is not None)
# the CANONICAL cause: ι(J)*e2 vs e2*ι(J) where J is the rung-1 complex unit (star J = -J)
J = (F(0), F(1))               # complex unit at level 1, star J = -J = (0,-1)
iotaJ = (J, (F(0),F(0)))       # embed J into H as (J, 0)
e2     = ((F(0),F(0)), (F(1),F(0)))  # the new generator (0,1) at level 2
lhs = mul(iotaJ, e2); rhs = mul(e2, iotaJ)
print("   canonical pair iota(J)*e2 =", flatten(lhs), " e2*iota(J) =", flatten(rhs))
print("   iota(J) and e2 commute? ", eq(lhs, rhs), " (MUST be False)")
print("   cause: star(J) != J ? ", not eq(star(J), J), " (star J =", flatten(star(J)), ")")

print("\n-- rung O = CD(H): expect NON-associative (rung-3 content, child) --")
nassoc_O = check_associative(3)
print("   non-associative witness found? ", nassoc_O is not None)
print("   still has multiplicative norm (composition)? ", check_norm_multiplicative(3) is None)
print("   zero divisors in O? ", check_zero_divisors(3, 4000) is not None, " (expect False: O is a division algebra)")

print("\n-- rung S = CD(O) (sedenions): expect norm law DIES + zero divisors (THE STOP) --")
nm_S = check_norm_multiplicative(4)
print("   norm law N(xy)=N(x)N(y) holds? ", nm_S is None, " (MUST be False = the stop)")
if nm_S is not None:
    x,y,l,r = nm_S
    print("     witness N(xy) =", flatten(l)[0], " N(x)N(y) =", flatten(r)[0])
zd_S = check_zero_divisors(4)
print("   zero divisors exist in S? ", zd_S is not None, " (MUST be True = the stop / loss of division)")
if zd_S is not None:
    x,y = zd_S
    print("     witness x =", flatten(x), " y =", flatten(y), " xy =", flatten(mul(x,y)))

# canonical sedenion zero divisor: (e3+e10)(e6+e15) = 0 style; search structured one
print("\n-- canonical structured sedenion zero divisor search --")
found = None
es = [basis(4, i) for i in range(16)]
for i,j,k,l in itertools.product(range(1,16), repeat=4):
    if i<j and k<l and (i,j)!=(k,l):
        x = add(es[i], es[j]); y = add(es[k], es[l])
        if eq(mul(x,y), zero(4)):
            found = (i,j,k,l)
            break
    if found: break
print("   structured zero divisor (e_i+e_j)(e_k+e_l)=0 at indices:", found)

print("\n-- star anti-multiplicativity star(xy)=star(y)star(x) at each level --")
for lvl,name in [(1,"C"),(2,"H"),(3,"O")]:
    ok = True
    for _ in range(300):
        x = rand_elem(lvl); y = rand_elem(lvl)
        if not eq(star(mul(x,y)), mul(star(y), star(x))):
            ok = False; break
    print(f"   level {lvl} ({name}): star anti-multiplicative? ", ok)

print("\nDONE.")
