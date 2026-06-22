"""cert_altideal (run 50): DECISIVE & DIFFERENT from the dead routes.

Model = the INTENDED Lean proof model, NOT the dead Zorn-block model:
  * every off-diagonal star x is substituted T_x - x  (T_x central) BEFORE anything;
  * central scalars {T_*, N_*, d_*, e_*} are COEFFICIENTS (auto commute+associate = the
    banked nuclearity tr_*/nrm_*/ocR_*), factored out of word structure;
  * generators {a,b,c,p,q,r} are the only non-central leaves; words = binary trees.
Question (never decided before — runs 48/49 used the pre-substitution block model, cert_ch
used a dense generic pool): is each jdef(Hm,Hm) entry in the ℚ[central]-span of
  (alt-law instances closed under left/right generator multiplication up to degree 4)
  ∪ (sq_ch degree-lowering instances, also closed)?
If YES, alternative+nuclear SUFFICES via a flat combo in this model -> a Lean route exists.
If NO even with the degree-COMPLETE pool, the classical multi-page manual route is forced.
Hard 75s wall (W9). Sparse incremental pivot basis (NOT dense — cert_ch's failure mode).
"""
from fractions import Fraction as F
from collections import defaultdict
import sys, time
t0=time.time(); WALL=75.0

GEN=['a','b','c','p','q','r']
TR={g:'T'+g for g in GEN}; NM={g:'N'+g for g in GEN}
DIAGS=['d0','d1','d2','e0','e1','e2']

def s_const(c): return {():F(c)} if c!=0 else {}
def s_leaf(n): return {(n,):F(1)}
def s_add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def s_neg(x): return {m:-v for m,v in x.items()}
def s_mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items():
            r[tuple(sorted(mx+my))]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}

def e_add(*xs):
    out={}
    for x in xs:
        for w,s in x.items(): out[w]=s_add(out.get(w,{}),s)
    return {w:s for w,s in out.items() if s}
def e_neg(x): return {w:s_neg(s) for w,s in x.items()}
def e_sub(x,y): return e_add(x,e_neg(y))
def e_smul(scalar,x):
    return {w:s_mul(scalar,s) for w,s in x.items() if s_mul(scalar,s)}
def e_mul(x,y):
    out={}
    for wx,sx in x.items():
        for wy,sy in y.items():
            s=s_mul(sx,sy)
            if not s: continue
            if wx==() and wy==(): w=()
            elif wx==(): w=wy
            elif wy==(): w=wx
            else: w=(wx,wy)
            out[w]=s_add(out.get(w,{}),s)
    return {w:s for w,s in out.items() if s}
def gen_elt(g): return {g:s_const(1)}
def star_elt(g): return e_sub({():s_leaf(TR[g])}, gen_elt(g))
def cen_elt(n): return {():s_leaf(n)}

def mz(n): return [[{} for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[e_add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mneg(A): return [[e_neg(x) for x in row] for row in A]
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s={}
            for k in range(n): s=e_add(s,e_mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
A=[[cen_elt('d0'),gen_elt('a'),gen_elt('b')],
   [star_elt('a'),cen_elt('d1'),gen_elt('c')],
   [star_elt('b'),star_elt('c'),cen_elt('d2')]]
B=[[cen_elt('e0'),gen_elt('p'),gen_elt('q')],
   [star_elt('p'),cen_elt('e1'),gen_elt('r')],
   [star_elt('q'),star_elt('r'),cen_elt('e2')]]
D=jdef(A,B)

def wdeg(w):
    if w==(): return 0
    if isinstance(w,str): return 1
    return wdeg(w[0])+wdeg(w[1])

# law instances (each == 0 element)
def alt_left(x,y):  return e_sub(e_mul(x,e_mul(x,y)), e_mul(e_mul(x,x),y))
def alt_right(x,y): return e_sub(e_mul(e_mul(x,y),y), e_mul(x,e_mul(y,y)))
def flex(x,y):      return e_sub(e_mul(x,e_mul(y,x)), e_mul(e_mul(x,y),x))
def sw12(x,y,z):    return e_sub(e_add(e_mul(e_mul(x,y),z),e_mul(e_mul(y,x),z)), e_add(e_mul(x,e_mul(y,z)),e_mul(y,e_mul(x,z))))
def sw23(x,y,z):    return e_sub(e_add(e_mul(e_mul(x,y),z),e_mul(e_mul(x,z),y)), e_add(e_mul(x,e_mul(y,z)),e_mul(x,e_mul(z,y))))
def sq_ch(g):       return e_sub(e_mul(gen_elt(g),gen_elt(g)), e_sub(e_smul(s_leaf(TR[g]),gen_elt(g)), cen_elt(NM[g])))

def maxdeg(elt): return max((wdeg(w) for w in elt), default=0)

def build_pool():
    gens=[gen_elt(g) for g in GEN]
    base=[]
    # alt laws over generator pairs (deg up to 3)
    for x in gens:
        for y in gens:
            for L in (alt_left,alt_right,flex):
                v=L(x,y)
                if v: base.append(v)
    # linearized swaps over generator triples (deg 3)
    for x in gens:
        for y in gens:
            for z in gens:
                for L in (sw12,sw23):
                    v=L(x,y,z)
                    if v: base.append(v)
    # sq_ch (deg 2)
    for g in GEN:
        base.append(sq_ch(g))
    # CLOSE under left/right generator multiplication up to degree 4
    pool=list(base)
    frontier=list(base)
    while frontier and time.time()-t0<WALL*0.7:
        nxt=[]
        for v in frontier:
            if maxdeg(v)>=4: continue
            for g in gens:
                lv=e_mul(g,v)
                if lv and maxdeg(lv)<=4: nxt.append(lv); pool.append(lv)
                rv=e_mul(v,g)
                if rv and maxdeg(rv)<=4: nxt.append(rv); pool.append(rv)
        frontier=nxt
    return pool

def elt_to_vec(elt):
    v=defaultdict(F)
    for w,s in elt.items():
        for cm,co in s.items(): v[(w,cm)]+=co
    return {k:c for k,c in v.items() if c}

def in_span(target,pool):
    basis=[]
    def reduce(vec):
        vec=dict(vec)
        for piv,row,inv in basis:
            c=vec.get(piv)
            if c:
                for m,val in row.items():
                    nv=vec.get(m,F(0))-c*inv*val
                    if nv==0: vec.pop(m,None)
                    else: vec[m]=nv
        return vec
    for v in pool:
        if time.time()-t0>WALL: return (None,-1,len(basis))
        rv=reduce(elt_to_vec(v))
        if rv:
            piv=next(iter(rv)); inv=F(1)/rv[piv]
            basis.append((piv,rv,inv))
    rt=reduce(elt_to_vec(target))
    return (len(rt)==0,len(rt),len(basis))

pool=build_pool()
print(f"degree-complete pool size {len(pool)}  [build t={time.time()-t0:.1f}s]")
for (i,j),name in [((0,0),'diag00'),((0,1),'off01'),((1,2),'off12')]:
    ok,res,rank=in_span(D[i][j],pool)
    if ok is None:
        print(f"  {name}({i},{j}): WALL hit (rank {rank}) inconclusive [t={time.time()-t0:.1f}s]")
    else:
        print(f"  {name}({i},{j}): IN-SPAN={ok}, residual={res}, basis-rank={rank} [t={time.time()-t0:.1f}s]")
    sys.stdout.flush()
