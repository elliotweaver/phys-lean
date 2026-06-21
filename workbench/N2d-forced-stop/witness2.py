"""
N2d — find the SIMPLEST witnesses x,y in CD A whose norm-defect D(x,y) is a pure
base associator, for the HARD direction (N multiplicative => A associative).

Reuses free NON-associative *-algebra. Letters: p,q,r and conjugates; 0; 1.
Print all nonzero D's by increasing term-count; identify the associator.
"""
from collections import defaultdict
import itertools

def leaf(i, conj=False): return {('gc' if conj else 'g', i): 1}
def aadd(x, y):
    r = defaultdict(int, x)
    for m, c in y.items():
        r[m] += c
        if r[m] == 0: del r[m]
    return dict(r)
def aneg(x): return {m: -c for m, c in x.items()}
def asub(x, y): return aadd(x, aneg(y))

ONEM = ('one',)
def amul(x, y):
    r = defaultdict(int)
    for mx, cx in x.items():
        for my, cy in y.items():
            if mx == ONEM and my == ONEM: key = ONEM
            elif mx == ONEM: key = my
            elif my == ONEM: key = mx
            else: key = (mx, my)
            r[key] += cx * cy
            if r[key] == 0: del r[key]
    return dict(r)
def astar_mono(m):
    if m == ONEM: return ONEM
    if m[0] in ('g', 'gc'): return ('gc' if m[0] == 'g' else 'g', m[1])
    L, R = m
    return (astar_mono(R), astar_mono(L))
def astar(x): return {astar_mono(m): c for m, c in x.items()}

def cd_mul(z, w):
    a, b = z; c, d = w
    re = asub(amul(a, c), amul(astar(d), b))
    im = aadd(amul(d, a), amul(b, astar(c)))
    return (re, im)
def nrm(z):
    re, im = z
    return aadd(amul(re, astar(re)), amul(astar(im), im))
def D_of(x, y): return asub(nrm(cd_mul(x, y)), amul(nrm(x), nrm(y)))

p, q, r = leaf(0), leaf(1), leaf(2)
P, Q, R = leaf(0, True), leaf(1, True), leaf(2, True)
one = {ONEM: 1}
zero = {}
alpha = {'0': zero, '1': one, 'p': p, 'q': q, 'r': r, 'P': P, 'Q': Q, 'R': R}

def assoc_word(u, v, w):
    return asub(amul(amul(u, v), w), amul(u, amul(v, w)))

# reference associators
refs = {
    '[p,q,r]': assoc_word(p, q, r),
    '[p,q,P]': assoc_word(p, q, P),
    '[P,q,r]': assoc_word(P, q, r),
    '[p,P,q]': assoc_word(p, P, q),
    '[q,p,r]': assoc_word(q, p, r),
}

def eqset(a, b): return a == b
def negset(a, b): return a == aneg(b)

results = []
keys = list(alpha.keys())
for fill in itertools.product(keys, repeat=4):
    av, bv, cv, dv = (alpha[k] for k in fill)
    Dw = D_of((av, bv), (cv, dv))
    if not Dw: continue
    results.append((len(Dw), fill, Dw))

results.sort(key=lambda t: t[0])
print("Total nonzero-defect fills:", len(results))
print("Simplest 25 (term-count, fill):")
for n, fill, Dw in results[:25]:
    tag = ""
    for name, ref in refs.items():
        if eqset(Dw, ref): tag = f"  == {name}"
        if negset(Dw, ref): tag = f"  == -{name}"
    print("  ", n, fill, tag)

# focus: print the very simplest few in full
print("\nFull expansion of the simplest nonzero defects:")
for n, fill, Dw in results[:6]:
    print(f"  fill={fill}  D({n} terms):")
    for m, co in sorted(Dw.items(), key=lambda kv: str(kv[0])):
        print(f"      {co:+d} * {m}")
