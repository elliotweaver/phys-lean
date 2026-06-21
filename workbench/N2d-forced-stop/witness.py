"""
N2d — decisive: (a) does imposing ASSOCIATIVITY on A kill the obstruction D?
                (b) find clean WITNESSES x,y (built from base p,q,r and 0/1) whose
                    obstruction is a single associator, for the HARD direction.

Reuses the free non-associative *-algebra of nonassoc.py.
"""
from collections import defaultdict

def leaf(i, conj=False):
    return {('gc' if conj else 'g', i): 1}

def aadd(x, y):
    r = defaultdict(int, x)
    for m, c in y.items():
        r[m] += c
        if r[m] == 0: del r[m]
    return dict(r)

def aneg(x): return {m: -c for m, c in x.items()}
def asub(x, y): return aadd(x, aneg(y))

def amul(x, y):
    r = defaultdict(int)
    for mx, cx in x.items():
        for my, cy in y.items():
            r[(mx, my)] += cx * cy
            if r[(mx, my)] == 0: del r[(mx, my)]
    return dict(r)

def astar_mono(m):
    if m[0] in ('g', 'gc'):
        return ('gc' if m[0] == 'g' else 'g', m[1])
    L, R = m
    return (astar_mono(R), astar_mono(L))

def astar(x): return {astar_mono(m): c for m, c in x.items()}

ONE = {('one',): 1}   # unit monomial; multiplication treats it as identity

def amul1(x, y):
    # multiplication WITH unit handling (so we can plug 1 into slots)
    r = defaultdict(int)
    for mx, cx in x.items():
        for my, cy in y.items():
            if mx == ('one',) and my == ('one',):
                key = ('one',)
            elif mx == ('one',):
                key = my
            elif my == ('one',):
                key = mx
            else:
                key = (mx, my)
            r[key] += cx * cy
            if r[key] == 0: del r[key]
    return dict(r)

def astar_mono1(m):
    if m == ('one',): return ('one',)
    return astar_mono(m)
def astar1(x): return {astar_mono1(m): c for m, c in x.items()}

# CD with unit-aware ops
def cd_star(z): return (astar1(z[0]), aneg(z[1]))
def cd_mul(z, w):
    a, b = z; c, d = w
    re = asub(amul1(a, c), amul1(astar1(d), b))
    im = aadd(amul1(d, a), amul1(b, astar1(c)))
    return (re, im)
def nrm(z):
    re, im = z
    return aadd(amul1(re, astar1(re)), amul1(astar1(im), im))

def D_of(x, y):
    return asub(nrm(cd_mul(x, y)), amul1(nrm(x), nrm(y)))

# ---- associativity canonicalizer: flatten a monomial tree to its leaf-sequence
def leaves(m):
    if m == ('one',): return ()
    if m[0] in ('g', 'gc'): return (m,)
    L, R = m
    return leaves(L) + leaves(R)

def assoc_reduce(elt):
    """collapse under associativity (+ unit): key by the ordered leaf-sequence."""
    r = defaultdict(int)
    for m, c in elt.items():
        r[leaves(m)] += c
        if r[leaves(m)] == 0: del r[leaves(m)]
    return dict(r)

p, q, r = leaf(0), leaf(1), leaf(2)
P, Q, R = leaf(0, True), leaf(1, True), leaf(2, True)  # conjugates
one = ONE

# (a) generic D, then reduce under associativity
a, b, c, d = leaf(0), leaf(1), leaf(2), leaf(3)
Dgen = D_of((a, b), (c, d))
print("(a) generic D has", len(Dgen), "terms; under ASSOCIATIVITY it reduces to:",
      len(assoc_reduce(Dgen)), "terms ->",
      "ZERO (associative base => N multiplicative)" if not assoc_reduce(Dgen) else assoc_reduce(Dgen))
print()

# (b) witness hunt: slots from a small alphabet; find D that is one associator
def assoc_word(u, v, w):
    # [u,v,w] = (uv)w - u(vw)
    return asub(amul1(amul1(u, v), w), amul1(u, amul1(v, w)))

alphabet = {'0': {}, '1': one, 'p': p, 'q': q, 'r': r, 'P': P, 'Q': Q, 'R': R}
target_assoc = assoc_word(p, q, r)   # [p,q,r]
print("(b) searching slot fills (a,b,c,d) for D == +/- associator-of-3 ...")
import itertools
hits = []
keys = list(alphabet.keys())
for a4 in itertools.product(keys, repeat=4):
    av, bv, cv, dv = (alphabet[k] for k in a4)
    Dw = D_of((av, bv), (cv, dv))
    if not Dw:
        continue
    # reduced under associativity must be ZERO (consistency) and the raw must be
    # nonzero only via associators. Check: does assoc_reduce(Dw) == 0 (it must,
    # if our easy direction is right) AND Dw nonzero -> Dw is purely associator obstruction.
    red = assoc_reduce(Dw)
    if red:   # would mean D nonzero even when associative -> reject (not pure obstruction)
        continue
    hits.append((a4, len(Dw)))
hits.sort(key=lambda t: t[1])
print("   #witness fills giving pure-associator obstruction:", len(hits))
for a4, n in hits[:12]:
    print("   ", a4, "-> D has", n, "raw terms (vanishes under associativity)")
