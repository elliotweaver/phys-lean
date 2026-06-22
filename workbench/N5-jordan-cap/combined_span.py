"""combined_span (run 59): find the EXACT linear_combination certificate for each
building-block-1 entry of jdef(Xz a b c)(Xz p 0 0), over the UNION of BANKED lever
families as RAW monomial (L-R) vectors — exactly what `linear_combination (norm:=abel)`
consumes (products opaque, star = conj+reverse, no assoc/comm of * assumed).

This is NOT automation-probing (W9.7): it COMPUTES the proof certificate, the same way
bb_cert computed the ka cert that banked e22. The building-block entries (single 2nd
generator, <=20 monomials) are SMALLER than the full core run-50 tested NO-SOLUTION;
this is a new computation on the right (post-jdef_add_right-split) target.

Banked levers used as hypotheses h: L=R, contributing (L-R), optionally LEFT/RIGHT
multiplied by a monomial (linear_combination allows m*h and h*m):
  ka(x,y,w)            [Building.lean]   degree 4 with leaf/conj args
  nrm_comm(g) * ctx, ctx * nrm_comm(g)  [CompCentral]  Na=g*Sg central, Na commutes
  nrm_assocL/M/R(g,..)                   [CompCentral]
  tr_comm(g)*ctx, ctx*tr_comm(g)         [CompCentral]  Tg=g+Sg central
  tr_assocL/M/R(g,..)                    [CompCentral]
  sq_ch(g) left/right-multiplied         [CompCentral]  degree-lowering
  alt laws (swap12/23,left,right,flex,Moufang) [Alternative] at sub-args
Report SOLVED+cert / NO-SOLUTION+residual per entry.
"""
from fractions import Fraction as F
from collections import defaultdict
import sys

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

def degree(m): return 1 if isinstance(m, str) else degree(m[0])+degree(m[1])
def subtrees(m, acc):
    acc.add(m)
    if isinstance(m, tuple): subtrees(m[0], acc); subtrees(m[1], acc)
L = lambda s: E_(s)
LEAVES = ['a','b','c','p']
ARGS8 = ['a','b','c','p','A','B','C','P']  # leaves + conjugates

def ka_vec(x, y, w):
    Sx, Sy, Sw = star(L(x)), star(L(y)), star(L(w))
    yx = mul(L(y), L(x)); SxSy = mul(Sx, Sy)
    return add(mul(mul(Sx, Sw), yx), neg(mul(Sx, mul(Sw, yx))),
               neg(mul(mul(SxSy, L(w)), L(x))), mul(SxSy, mul(L(w), L(x))))

# central levers as (L-R) vectors (raw form). g a leaf; ctx a monomial vector.
def Na(g): return mul(L(g), star(L(g)))           # g * star g
def Tg(g): return add(L(g), star(L(g)))           # g + star g
def nrm_comm(g, x): return sub(mul(Na(g), x), mul(x, Na(g)))
def nrm_assocL(g, x, y): return sub(mul(Na(g), mul(x, y)), mul(mul(Na(g), x), y))
def nrm_assocM(g, x, y): return sub(mul(mul(x, Na(g)), y), mul(x, mul(Na(g), y)))
def nrm_assocR(g, x, y): return sub(mul(mul(x, y), Na(g)), mul(x, mul(y, Na(g))))
def tr_comm(g, x): return sub(mul(Tg(g), x), mul(x, Tg(g)))
def tr_assocL(g, x, y): return sub(mul(Tg(g), mul(x, y)), mul(mul(Tg(g), x), y))
def tr_assocM(g, x, y): return sub(mul(mul(x, Tg(g)), y), mul(x, mul(Tg(g), y)))
def tr_assocR(g, x, y): return sub(mul(mul(x, y), Tg(g)), mul(x, mul(y, Tg(g))))
def nrm_symm(g): return sub(mul(L(g), star(L(g))), mul(star(L(g)), L(g)))
def sq_ch(g): return sub(add(mul(L(g), L(g)), mul(L(g), star(L(g)))), mul(Tg(g), L(g)))
# alt laws
def Lswap12(x,y,z): return sub(add(mul(mul(x,y),z),mul(mul(y,x),z)), add(mul(x,mul(y,z)),mul(y,mul(x,z))))
def Lswap23(x,y,z): return sub(add(mul(mul(x,y),z),mul(mul(x,z),y)), add(mul(x,mul(y,z)),mul(x,mul(z,y))))
def Lleft(x,y):  return sub(mul(x,mul(x,y)), mul(mul(x,x),y))
def Lright(x,y): return sub(mul(mul(x,y),y), mul(x,mul(y,y)))
def Lflex(x,y):  return sub(mul(x,mul(y,x)), mul(mul(x,y),x))
def LmL(x,y,z):  return sub(mul(x,mul(y,mul(x,z))), mul(mul(mul(x,y),x),z))
def LmR(x,y,z):  return sub(mul(mul(mul(z,x),y),x), mul(z,mul(x,mul(y,x))))
def LmM(x,y,z):  return sub(mul(mul(x,y),mul(z,x)), mul(x,mul(mul(y,z),x)))

def gen_pool(E):
    tgt = degree(next(iter(E)))
    acc = set()
    for m in E: subtrees(m, acc)
    sub1 = sorted([m for m in acc if degree(m) == 1], key=str)   # degree-1 subterms (leaves+conj)
    sub2 = sorted([m for m in acc if degree(m) == 2], key=str)
    sub3 = sorted([m for m in acc if degree(m) == 3], key=str)
    args = [E_(m) for m in sub1+sub2+sub3]                        # context multipliers
    a1 = [E_(m) for m in sub1]; a2 = [E_(m) for m in sub2]; a3 = [E_(m) for m in sub3]
    inst = []; seen = set()
    def push(name, v):
        if not v: return
        if any(degree(m) != tgt for m in v): return
        sig = tuple(sorted((str(m), v[m]) for m in v))
        if sig in seen: return
        seen.add(sig); inst.append((name, v))
    # ka over leaf/conj triples (degree 4 already)
    for x in ARGS8:
        for y in ARGS8:
            for w in ARGS8:
                push(f"ka({x},{y},{w})", ka_vec(x, y, w))
    # nrm/tr levers, left- and right-multiplied by a degree-(tgt-base) context
    for g in LEAVES:
        # nrm_comm degree 2 -> need ctx degree (tgt-2)=2
        for c2 in a2:
            push(f"L*nrmC({g})", mul(c2, nrm_comm(g, E_('a'))) if False else None) if False else None
        # cleaner: nrm_comm(g, x) is degree 2+deg(x); choose x so total=tgt
        for x in a2:  # deg2 -> nrm_comm deg 4
            push(f"nrmC({g},{_lab(x)})", nrm_comm(g, x))
        for x in a1:
            for y in a1:
                push(f"nrmAL({g})", nrm_assocL(g, x, y))
                push(f"nrmAM({g})", nrm_assocM(g, x, y))
                push(f"nrmAR({g})", nrm_assocR(g, x, y))
        for x in a3:  # tr_comm deg 1+3=4
            push(f"trC({g})", tr_comm(g, x))
        for x in a1:
            for y in a2:
                push(f"trAL({g})", tr_assocL(g, x, y)); push(f"trAM({g})", tr_assocM(g, x, y)); push(f"trAR({g})", tr_assocR(g, x, y))
            for y in a1:
                # deg 1+1+? tr_assoc needs deg(x)+deg(y)=tgt-1=3
                pass
        for x in a2:
            for y in a1:
                push(f"trAL2({g})", tr_assocL(g, x, y)); push(f"trAM2({g})", tr_assocM(g, x, y)); push(f"trAR2({g})", tr_assocR(g, x, y))
        # sq_ch(g) deg2, multiply by deg-2 ctx on left/right
        sc = sq_ch(g)
        for c2 in a2:
            push(f"L*sq({g})", mul(c2, sc)); push(f"sq*R({g})", mul(sc, c2))
        # nrm_symm deg2 * deg2 ctx
        ns = nrm_symm(g)
        for c2 in a2:
            push(f"L*ns({g})", mul(c2, ns)); push(f"ns*R({g})", mul(ns, c2))
    # alt laws over subterms, degree-matched
    allg = a1 + a2
    for xv in allg:
        for yv in allg:
            push("left", Lleft(xv, yv)); push("right", Lright(xv, yv)); push("flex", Lflex(xv, yv))
    for xv in allg:
        for yv in allg:
            for zv in allg:
                push("sw12", Lswap12(xv, yv, zv)); push("sw23", Lswap23(xv, yv, zv))
                push("mL", LmL(xv, yv, zv)); push("mR", LmR(xv, yv, zv)); push("mM", LmM(xv, yv, zv))
    return inst

def _lab(x): return str(next(iter(x)))

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
    if rb: return ("NO-SOLUTION", len(inst), len(rb))
    cert = [(inst[k][0], -cc) for k, cc in bprov.items() if cc != 0]
    return ("SOLVED", len(inst), cert)

todo = [(int(sys.argv[1]), int(sys.argv[2]))] if len(sys.argv) > 2 else [(i,j) for i in range(3) for j in range(3)]
for (i, j) in todo:
    E = D[i][j]
    if not E:
        print(f"({i},{j}): ZERO"); continue
    pool = gen_pool(E)
    res = solve(E, pool)
    if res[0] == "SOLVED":
        fams = defaultdict(F)
        for nm, c in res[2]: fams[nm.split('(')[0]] += abs(c)
        print(f"({i},{j}): SOLVED pool={res[1]} certlen={len(res[2])} families={dict(fams)}")
        for nm, c in sorted(res[2], key=lambda t: str(t[0])):
            print(f"      {c:+}  {nm}")
    else:
        print(f"({i},{j}): NO-SOLUTION pool={res[1]} residual={res[2]}")
