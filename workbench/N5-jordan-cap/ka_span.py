"""ka_span (run 59): test whether each building-block-1 entry of jdef(Xz a b c)(Xz p 0 0)
is a flat ℚ-combination of the BANKED `ka` lever instances over leaf/conjugate args.
ka(x,y,w) = (Sx·Sw)·(y·x) − Sx·(Sw·(y·x)) − ((Sx·Sy)·w)·x + (Sx·Sy)·(w·x), identically 0.
If an entry lies in the ka-span, it closes in Lean by `linear_combination (norm:=abel) Σ cᵢ·ka(...)`
reusing the SINGLE banked ka lemma — no new heavy lever proof. Report cert per entry.
Monomials are nested tuples of leaf symbols; star is conjugation+reversal.
"""
from fractions import Fraction as F
from collections import defaultdict

def E_(m): return {m: F(1)}
def add(*xs):
    r = defaultdict(F)
    for x in xs:
        for m, v in x.items(): r[m] += v
    return {m: v for m, v in r.items() if v != 0}
def neg(x): return {m: -v for m, v in x.items()}
def sub(x, y): return add(x, neg(y))
def mul(x, y):
    r = defaultdict(F)
    for mx, cx in x.items():
        for my, cy in y.items(): r[(mx, my)] += cx*cy
    return {m: v for m, v in r.items() if v != 0}
CONJ = {'a':'A','b':'B','c':'C','p':'P'}
for k, v in list(CONJ.items()): CONJ[v] = k
def star_mon(m):
    if isinstance(m, str): return CONJ[m]
    l, r = m; return (star_mon(r), star_mon(l))
def star(x): return {star_mon(m): v for m, v in x.items()}
ZERO = {}
def mzero(): return [[dict(ZERO) for _ in range(3)] for _ in range(3)]
def madd(A, B): return [[add(A[i][j], B[i][j]) for j in range(3)] for i in range(3)]
def mmul(A, B):
    C = mzero()
    for i in range(3):
        for j in range(3):
            s = dict(ZERO)
            for k in range(3): s = add(s, mul(A[i][k], B[k][j]))
            C[i][j] = s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A, B): return madd(mmul(A, B), mmul(B, A))
def jdef(A, B):
    AA = jb(A, A); return madd(jb(jb(A, B), AA), mneg(jb(A, jb(B, AA))))
def Xz(o01, o02, o12):
    z = lambda s: E_(s) if s else dict(ZERO)
    return [[dict(ZERO), z(o01), z(o02)],
            [star(E_(o01)) if o01 else dict(ZERO), dict(ZERO), z(o12)],
            [star(E_(o02)) if o02 else dict(ZERO), star(E_(o12)) if o12 else dict(ZERO), dict(ZERO)]]

A = Xz('a','b','c'); Bm = Xz('p', None, None)
D = jdef(A, Bm)

LEAVES = ['a','b','c','p','A','B','C','P']
def L(s): return E_(s)
def ka_vec(x, y, w):
    Sx, Sy, Sw = star(L(x)), star(L(y)), star(L(w))
    yx = mul(L(y), L(x)); SxSy = mul(Sx, Sy)
    return add(mul(mul(Sx, Sw), yx), neg(mul(Sx, mul(Sw, yx))),
               neg(mul(mul(SxSy, L(w)), L(x))), mul(SxSy, mul(L(w), L(x))))

# build ka pool over all leaf/conj triples
inst = []
seen = {}
for x in LEAVES:
    for y in LEAVES:
        for w in LEAVES:
            v = ka_vec(x, y, w)
            if not v: continue
            sig = tuple(sorted((str(m), v[m]) for m in v))
            if sig in seen: continue
            seen[sig] = True
            inst.append((f"ka({x},{y},{w})", v))

def lead(v, order): return min(v, key=lambda m: order[m])
def solve(E, inst):
    monset = set(E)
    for _, v in inst: monset |= set(v)
    order = {m: k for k, m in enumerate(sorted(monset, key=str))}
    pivots = {}
    def reduce_vec(v, prov):
        v = dict(v); prov = dict(prov)
        while v:
            lm = lead(v, order)
            if lm in pivots:
                pv, pprov = pivots[lm]
                f = v[lm]/pv[lm]
                v = add(v, {m: -f*cc for m, cc in pv.items()})
                for k, cc in pprov.items(): prov[k] = prov.get(k, F(0)) - f*cc
            else: return v, prov, lm
        return v, prov, None
    for idx, (nm, v) in enumerate(inst):
        rv, rp, lm = reduce_vec(v, {idx: F(1)})
        if rv: pivots[lm] = (rv, rp)
    rb, bprov, lm = reduce_vec(dict(E), {})
    if rb: return ("NO-SOLUTION", len(inst), len(rb), rb)
    cert = [(inst[k][0], -cc) for k, cc in bprov.items() if cc != 0]
    return ("SOLVED", len(inst), cert)

print(f"ka pool size (distinct): {len(inst)}")
for i in range(3):
    for j in range(3):
        E = D[i][j]
        if not E: print(f"({i},{j}): ZERO"); continue
        res = solve(E, inst)
        if res[0] == "SOLVED":
            print(f"({i},{j}): SOLVED cert={len(res[2])}  ::  " +
                  " ".join(f"{('+' if c>0 else '')}{c}*{nm}" for nm, c in res[2]))
        else:
            print(f"({i},{j}): NO-SOLUTION residual={res[2]} monomials={sorted(map(str,res[3]))[:6]}")
