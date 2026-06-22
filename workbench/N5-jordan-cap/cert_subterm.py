"""cert_subterm (run 50): the DECISIVE viability test for a FLAT linear_combination route.

Key correction to the run-48/49 reasoning: after substituting star x = T_x - x (T_x central,
DEFINITIONAL), the sq_ch degree-lowering becomes simply 'T_x commutes with x'. So the entry
SHOULD be a flat ℚ-combination of:
  - alt-law instances (re-associate within an atom-multiset), AND
  - centrality-law instances of T_x=x+star x, N_x=x*star x, and the diagonals d
    (these BRIDGE atom-multisets: T_x mixes 'A' and 'a').
The earlier cert_span used alt-only (NO). cert_freeword added centrality but only over
LEAF args (NO, residual 210). cert_ch used a dense generic pool (HUNG). NONE instantiated
the laws over the actual COMPOUND subterms that appear in the entry — which is exactly what
the Lean `linear_combination` would reference. THIS solver does, sparse + hard-bounded.

If IN-SPAN over compound-subterm instances -> each entry closes as ONE linear_combination
(norm:=abel) over banked lemmas: the whole node collapses to tractable. If NO -> the manual
sequenced rewrite is genuinely required; decompose with that confirmed.
"""
from fractions import Fraction as F
from collections import defaultdict
import sys, time
t0=time.time()
TIMECAP=45.0  # hard wall (W9): if we approach this, bail with a partial verdict.

GEN=['a','b','c','p','q','r']
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R'}
for k,v in list(STAR.items()): STAR[v]=k
DIAG=['d0','d1','d2','e0','e1','e2']
for d in DIAG: STAR[d]=d
def is_leaf(m): return isinstance(m,str)
def star_tree(m):
    if is_leaf(m): return STAR[m]
    l,r=m; return (star_tree(r), star_tree(l))
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
def E(m): return {m:F(1)}
ZERO={}
def mz(n): return [[dict(ZERO) for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mneg(A): return [[neg(x) for x in row] for row in A]
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=dict(ZERO)
            for k in range(n): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def Hm(diag,off):
    d0,d1,d2=diag; o01,o02,o12=off
    return [[E(d0),E(o01),E(o02)],
            [E(STAR[o01]),E(d1),E(o12)],
            [E(STAR[o02]),E(STAR[o12]),E(d2)]]
A=Hm(('d0','d1','d2'),('a','b','c')); B=Hm(('e0','e1','e2'),('p','q','r'))
D=jdef(A,B)

def subterms(x, maxleaves=3):
    s=set()
    def nleaves(m):
        if is_leaf(m): return 1
        return nleaves(m[0])+nleaves(m[1])
    def rec(m):
        if nleaves(m)<=maxleaves: s.add(m)
        if not is_leaf(m): rec(m[0]); rec(m[1])
    for m in x: rec(m)
    return s

def T(g): return add(E(g),E(STAR[g]))
def Nn(g): return mul(E(g),E(STAR[g]))
# law families as 0-vectors (lhs-rhs), distributed into trees
def alt_left(x,y):  return sub(mul(x,mul(x,y)), mul(mul(x,x),y))
def alt_right(x,y): return sub(mul(mul(x,y),y), mul(x,mul(y,y)))
def flex(x,y):      return sub(mul(x,mul(y,x)), mul(mul(x,y),x))
def sw12(x,y,z):    return sub(add(mul(mul(x,y),z),mul(mul(y,x),z)), add(mul(x,mul(y,z)),mul(y,mul(x,z))))
def sw23(x,y,z):    return sub(add(mul(mul(x,y),z),mul(mul(x,z),y)), add(mul(x,mul(y,z)),mul(x,mul(z,y))))
def cen_comm(t,x):  return sub(mul(t,x), mul(x,t))
def cen_aL(t,x,y):  return sub(mul(t,mul(x,y)), mul(mul(t,x),y))
def cen_aM(t,x,y):  return sub(mul(mul(x,t),y), mul(x,mul(t,y)))
def cen_aR(t,x,y):  return sub(mul(mul(x,y),t), mul(x,mul(y,t)))

def build_pool(entry):
    subs=list(subterms(entry, maxleaves=3))
    # arg set for laws: single leaves + the compound subterms actually appearing
    leaves=[E(g) for g in GEN]+[E(STAR[g]) for g in GEN]
    args=leaves+[{m:F(1)} for m in subs if not is_leaf(m)]
    centrals=[T(g) for g in GEN]+[Nn(g) for g in GEN]+[E(d) for d in DIAG]
    pool=[]
    def push(v):
        if v: pool.append(v)
    # alt laws over arg pairs/triples (bounded: leaves + appearing subterms)
    for x in args:
        for y in args:
            push(alt_left(x,y)); push(alt_right(x,y)); push(flex(x,y))
    # alt linearized triples — only over LEAVES (triples over all subterms explode)
    for x in leaves:
        for y in leaves:
            for z in leaves:
                push(sw12(x,y,z)); push(sw23(x,y,z))
    # centrality of each central over ALL arg pairs (these are the bridges)
    for t in centrals:
        for x in args:
            push(cen_comm(t,x))
            for y in args:
                push(cen_aL(t,x,y)); push(cen_aM(t,x,y)); push(cen_aR(t,x,y))
        if time.time()-t0>TIMECAP*0.6: break
    return pool

def in_span(target, pool):
    basis=[]
    def reduce(vec):
        vec=dict(vec)
        changed=True
        # single pass (pivots are distinct atoms); good enough for membership
        for piv,row in basis:
            if piv in vec and vec[piv]!=0:
                c=vec[piv]/row[piv]
                for m,val in row.items():
                    nv=vec.get(m,F(0))-c*val
                    if nv==0: vec.pop(m,None)
                    else: vec[m]=nv
        return vec
    for v in pool:
        if time.time()-t0>TIMECAP: return (None, -1, len(basis))
        rv=reduce(v)
        if rv:
            piv=next(iter(rv))
            basis.append((piv,rv))
    rt=reduce(target)
    return (len(rt)==0, len(rt), len(basis))

for (i,j),name in [((0,1),'off01'),((0,0),'diag00')]:
    entry=D[i][j]
    pool=build_pool(entry)
    ok,res,rank=in_span(entry,pool)
    if ok is None:
        print(f"entry {name}: TIMECAP hit, pool partial (rank {rank}) — inconclusive [t={time.time()-t0:.1f}s]")
    else:
        print(f"entry {name} ({i},{j}): pool={len(pool)}, basis-rank={rank}, IN-SPAN={ok}, residual={res} [t={time.time()-t0:.1f}s]")
    sys.stdout.flush()
