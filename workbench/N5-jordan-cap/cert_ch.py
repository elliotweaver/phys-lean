"""cert_ch: THE decisive span test. Represent the H3 defect over LOWERCASE atoms only
(eliminate conjugates via star x = Tx - x, Tx a CENTRAL scalar), and include the
Cayley-Hamilton degree-lowering relation x*x = Tx*x - Nx (Nx central scalar) as columns,
plus alternativity and full centrality of every central symbol. If each entry is in the
ℚ-span of these columns, an abel-closable certificate EXISTS and ports to Lean as
  linear_combination (norm := abel) Σ cᵢ·lawᵢ
after rewriting stars/squares. If NO-SOLUTION, the flat-certificate route is dead and the
honest path is a sequenced rewriting proof (a deeper dissolution).

basis element = (central_multiset, lowercase_tree_or_None).
"""
from fractions import Fraction as F
from collections import defaultdict
import time, sys

ATOMS=['a','b','c','p','q','r']
DIAG=['d0','d1','d2','e0','e1','e2']     # central diagonal scalars
TR={x:'T_'+x for x in ATOMS}            # central trace scalars
NM={x:'N_'+x for x in ATOMS}            # central norm scalars
CENTRALS=set(DIAG)|set(TR.values())|set(NM.values())

def is_leaf(m): return isinstance(m,str)

# element: dict[(central_tuple, tree)] -> coeff ; tree over lowercase atoms or None
def ckey(*cs):
    out=[]
    for c in cs: out+=list(c)
    return tuple(sorted(out))
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for k,v in x.items(): r[k]+=v
    return {k:v for k,v in r.items() if v!=0}
def neg(x): return {k:-v for k,v in x.items()}
def sub(x,y): return add(x,neg(y))
def mul(x,y):
    r=defaultdict(F)
    for (c1,t1),v1 in x.items():
        for (c2,t2),v2 in y.items():
            c=ckey(c1,c2)
            if t1 is None and t2 is None: t=None
            elif t1 is None: t=t2
            elif t2 is None: t=t1
            else: t=(t1,t2)
            r[(c,t)]+=v1*v2
    return {k:v for k,v in r.items() if v!=0}
def central(name): return {((name,),None):F(1)}
def atom(x): return {((),x):F(1)}
def starx(x,Tname): return sub(central(Tname), atom(x))   # star x = Tx - x

ZERO={}
def mz(n): return [[dict(ZERO) for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=dict(ZERO)
            for k in range(n): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))

def Hm(diag, off):
    (d0,d1,d2)=diag; (o01,o02,o12)=off
    return [[central(d0), atom(o01), atom(o02)],
            [starx(o01,TR[o01]), central(d1), atom(o12)],
            [starx(o02,TR[o02]), starx(o12,TR[o12]), central(d2)]]
def Hm_zero(off):
    (o01,o02,o12)=off
    return [[dict(ZERO), atom(o01), atom(o02)],
            [starx(o01,TR[o01]), dict(ZERO), atom(o12)],
            [starx(o02,TR[o02]), starx(o12,TR[o12]), dict(ZERO)]]

# ---- degrees / subtrees over lowercase trees ----
def tdeg(t):
    if t is None: return 0
    if is_leaf(t): return 1
    return tdeg(t[0])+tdeg(t[1])
def subtrees(t,acc):
    if t is None: return
    acc.add(t)
    if not is_leaf(t): subtrees(t[0],acc); subtrees(t[1],acc)

def Et(t,c=()): return {(tuple(sorted(c)),t):F(1)}
def assoc(x,y,z,c=()):  # [x,y,z] in central context c
    return sub(Et(((x,y),z),c), Et((x,(y,z)),c))

def gen_laws(target):
    # collect lowercase trees & central keys present
    trees=set(); ckeys=set()
    for (c,t) in target:
        ckeys.add(c)
        subtrees(t,trees)
    pool=sorted(trees,key=str)
    # also include atom singletons
    for a in ATOMS: pool.append(a)
    pool=sorted(set(pool),key=str)
    laws=[]
    def take(lab,vec):
        if vec: laws.append((lab,vec))
    # central contexts to instantiate alt-laws in: all central keys present + empty
    ctxs=set(ckeys)|{()}
    # also single-central contexts (T_x, N_x, diag) so a central scalar can multiply an alt law
    for cs in list(CENTRALS):
        ctxs.add((cs,))
    ctxs=sorted(ctxs)
    # alternative laws in each context
    for c in ctxs:
        for x in pool:
            for y in pool:
                # left/flex deg 2dx+dy ; right dx+2dy -- but keep all; solver picks
                take(("altL",c,x,y), assoc(x,x,y,c))
                take(("altR",c,x,y), assoc(x,y,y,c))
                take(("altF",c,x,y), assoc(x,y,x,c))
        for x in pool:
            for y in pool:
                for z in pool:
                    take(("sw12",c,x,y,z), add(assoc(x,y,z,c),assoc(y,x,z,c)))
                    take(("sw23",c,x,y,z), add(assoc(x,y,z,c),assoc(x,z,y,c)))
    # Cayley-Hamilton: x*x = Tx*x - Nx, in each context (as columns), all positions via alt
    for x in ATOMS:
        for c in ctxs:
            # x*x (context c)  -  Tx*x (context c)  +  Nx (context c) = 0
            v=add(Et((x,x),c), neg(Et(x, ckey(c,(TR[x],)))), Et(None, ckey(c,(NM[x],))))
            take(("CH",c,x), v)
    # centrality reordering of central scalars is AUTOMATIC in this representation
    # (central multiset is order-free), so no extra columns needed for commuting/assoc.
    # dedupe
    seen={}; uniq=[]
    for lab,v in laws:
        sig=tuple(sorted((str(k),val) for k,val in v.items()))
        if not sig or sig in seen: continue
        seen[sig]=True; uniq.append((lab,v))
    return uniq

def lead(v,order): return min(v,key=lambda k:order[k])
def solve_entry(E_):
    if not E_: return ("ZERO",)
    laws=gen_laws(E_)
    monset=set(E_)
    for _,v in laws: monset|=set(v)
    order={m:k for k,m in enumerate(sorted(monset,key=str))}
    pivots={}
    def reduce_vec(v):
        v=dict(v)
        while v:
            lm=lead(v,order)
            if lm in pivots:
                pv=pivots[lm]; f=v[lm]/pv[lm]
                v=add(v,{m:-f*c for m,c in pv.items()})
            else: return v,lm
        return v,None
    for _,v in laws:
        rv,lm=reduce_vec(v)
        if rv: pivots[lm]=rv
    rb,_=reduce_vec(dict(E_))
    return (("SOLVED" if not rb else "NO-SOLUTION"), len(laws), len(monset), len(rb))

if __name__=="__main__":
    mode=sys.argv[1] if len(sys.argv)>1 else "zero"
    only=sys.argv[2] if len(sys.argv)>2 else None
    if mode=="zero":
        A=Hm_zero(('a','b','c')); B=Hm_zero(('p','q','r'))
    else:
        A=Hm(('d0','d1','d2'),('a','b','c')); B=Hm(('e0','e1','e2'),('p','q','r'))
    D=jdef(A,B)
    t0=time.time()
    for i in range(3):
        for j in range(3):
            if only and f"{i}{j}"!=only: continue
            r=solve_entry(D[i][j])
            print(f"entry({i},{j}): {len(D[i][j])} terms -> {r}   [{time.time()-t0:.1f}s]")
    print(f"total {time.time()-t0:.1f}s")
