"""
N2d — non-associative free *-algebra model, the DECISIVE instrument.

We build the FREE NON-ASSOCIATIVE *-algebra A over ℤ:
  - generators g0,g1,... and an involutive conjugation on generators
  - elements: dict { word : int coeff }, word = nested binary tree (tuple) of
    generators; leaves are ('g', i) or ('gc', i) (conjugate generator).
  - multiplication is BILINEAR and NON-associative: word*word' = (word, word')
    (a NODE — never flattened). This faithfully models a magma algebra.
  - star: anti-automorphism, involutive, ℤ-linear:
       star(leaf gi) = gci ; star(leaf gci) = gi
       star( (u, v) ) = ( star v, star u )      [reverse + star each]

Then model CD A (one Cayley-Dickson double) with the BANKED Lean product:
  (a,b)*(c,d) = ( a*c - star(d)*b , d*a + b*star(c) )
  star (a,b)  = ( star a , -b )
  nrm (z)     = z.re * star(z.re) + star(z.im) * z.im        [ = (z*star z).re ]

Compute the obstruction  D(x,y) := nrm(x*y) - nrm(x)*nrm(y)  in A, for generic
x=(a,b), y=(c,d).  Read which associator words appear -> the exact witness.
"""
from collections import defaultdict

# ---------- free non-associative *-algebra A over ℤ ----------
# A "monomial" is a binary tree:  leaf = ('g',i) or ('gc',i);  node = (L, R)
# An "element" is a dict { monomial : coeff }.

def leaf(i, conj=False):
    return {('gc' if conj else 'g', i): 1}

def az():  # zero
    return {}

def aadd(x, y):
    r = defaultdict(int, x)
    for m, c in y.items():
        r[m] += c
        if r[m] == 0: del r[m]
    return dict(r)

def aneg(x):
    return {m: -c for m, c in x.items()}

def asub(x, y):
    return aadd(x, aneg(y))

def amul(x, y):
    # bilinear, NON-associative: monomials combine as a NODE (mL, mR)
    r = defaultdict(int)
    for mx, cx in x.items():
        for my, cy in y.items():
            r[(mx, my)] += cx * cy
            if r[(mx, my)] == 0: del r[(mx, my)]
    return dict(r)

def amul_words(*xs):
    # left-assoc convenience only; NOT used for the algebra (kept explicit)
    raise NotImplementedError

def astar_mono(m):
    if m[0] in ('g', 'gc'):
        return ('gc' if m[0] == 'g' else 'g', m[1])
    L, R = m
    return (astar_mono(R), astar_mono(L))  # reverse + star

def astar(x):
    return {astar_mono(m): c for m, c in x.items()}

# ---------- CD A : pairs (re, im) of A-elements ----------

def cd(re, im):
    return (re, im)

def cd_star(z):
    return (astar(z[0]), aneg(z[1]))

def cd_mul(z, w):
    a, b = z; c, d = w
    re = asub(amul(a, c), amul(astar(d), b))   # a c - star(d) b
    im = aadd(amul(d, a), amul(b, astar(c)))   # d a + b star(c)
    return (re, im)

def nrm(z):
    # (z * star z).re  =  re*star(re) + star(im)*im
    re, im = z
    return aadd(amul(re, astar(re)), amul(astar(im), im))

# ---------- the obstruction ----------

# generic elements
a, b, c, d = leaf(0), leaf(1), leaf(2), leaf(3)
x = cd(a, b)
y = cd(c, d)

D = asub(nrm(cd_mul(x, y)), amul(nrm(x), nrm(y)))

def show(elt, label):
    print(f"{label}:  ({len(elt)} terms)")
    for m, co in sorted(elt.items(), key=lambda kv: str(kv[0])):
        print(f"    {co:+d} * {m}")
    if not elt:
        print("    0")
    print()

show(D, "D(x,y) = nrm(xy) - nrm(x)nrm(y),  x=(a,b) y=(c,d) generic")
