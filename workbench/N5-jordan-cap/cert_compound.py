"""cert_compound (run 50): the GENUINELY decisive completion test.

Prior span tests instantiated alt/Moufang laws only over LEAF arguments (or closed under
generator-multiplication, which is NOT the same as instantiating a law at a compound arg:
alt_left(g, x*y) != g-multiple of alt_left(g,y)). THIS test instantiates every banked law
DIRECTLY over compound word-arguments up to the degree the entry needs (<=4), in the
post-substitution central-coefficient model (star x = T_x - x; centrals are coefficients).

If an entry's residual hits 0 here -> a FLAT certificate DOES exist over banked-law instances
at compound args -> the Lean proof is `simp [law lemmas at those args]; abel` (tractable, the
whole node closes). If residual stays > 0 with the degree-complete compound pool -> the
classical multi-page manual route is genuinely forced; decompose with that settled.

Sparse incremental pivot; hard 90s wall (W9). NOT the dense cert_ch route.
"""
from fractions import Fraction as F
from collections import defaultdict
import sys, time, itertools
t0=time.time(); WALL=90.0

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
        for my,cy in y.items(): r[tuple(sorted(mx+my))]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
def e_add(*xs):
    out={}
    for x in xs:
        for w,s in x.items(): out[w]=s_add(out.get(w,{}),s)
    return {w:s for w,s in out.items() if s}
def e_neg(x): return {w:s_neg(s) for w,s in x.items()}
def e_sub(x,y): return e_add(x,e_neg(y))
def e_smul(scalar,x): return {w:s_mul(scalar,s) for w,s in x.items() if s_mul(scalar,s)}
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
def maxdeg(elt): return max((wdeg(w) for w in elt), default=0)

# law families
def alt_left(x,y):  return e_sub(e_mul(x,e_mul(x,y)), e_mul(e_mul(x,x),y))
def alt_right(x,y): return e_sub(e_mul(e_mul(x,y),y), e_mul(x,e_mul(y,y)))
def flex(x,y):      return e_sub(e_mul(x,e_mul(y,x)), e_mul(e_mul(x,y),x))
def sw12(x,y,z):    return e_sub(e_add(e_mul(e_mul(x,y),z),e_mul(e_mul(y,x),z)), e_add(e_mul(x,e_mul(y,z)),e_mul(y,e_mul(x,z))))
def sw23(x,y,z):    return e_sub(e_add(e_mul(e_mul(x,y),z),e_mul(e_mul(x,z),y)), e_add(e_mul(x,e_mul(y,z)),e_mul(x,e_mul(z,y))))
def mfL(x,y,z):     return e_sub(e_mul(x,e_mul(y,e_mul(x,z))), e_mul(e_mul(e_mul(x,y),x),z))
def mfR(x,y,z):     return e_sub(e_mul(e_mul(e_mul(z,x),y),x), e_mul(z,e_mul(x,e_mul(y,x))))
def mfM(x,y,z):     return e_sub(e_mul(e_mul(x,y),e_mul(z,x)), e_mul(x,e_mul(e_mul(y,z),x)))
def sq_ch(g):       return e_sub(e_mul(gen_elt(g),gen_elt(g)), e_sub(e_smul(s_leaf(TR[g]),gen_elt(g)), cen_elt(NM[g])))

# argument word set: all left/right associated words in generators up to degree 2
gens=[gen_elt(g) for g in GEN]
deg2=[]
for x in GEN:
    for y in GEN:
        deg2.append(e_mul(gen_elt(x),gen_elt(y)))
args1=gens
args2=gens+deg2

def build_pool():
    pool=[]
    # binary laws: allow args up to deg2, keep result deg<=4
    for x in args2:
        for y in args2:
            for L in (alt_left,alt_right,flex):
                v=L(x,y)
                if v and maxdeg(v)<=4: pool.append(v)
            if time.time()-t0>WALL*0.5: return pool
    # ternary laws over generator triples (deg3) + one compound slot (deg4)
    for x in args1:
        for y in args1:
            for z in args1:
                for L in (sw12,sw23,mfL,mfR,mfM):
                    v=L(x,y,z)
                    if v and maxdeg(v)<=4: pool.append(v)
    # ternary with ONE deg-2 argument (to reach deg-4 mixed words), bounded
    for L in (sw12,sw23,mfL,mfR,mfM):
        for x in args1:
            for y in args1:
                for z in deg2:
                    for argz in (L(x,y,z),):
                        if argz and maxdeg(argz)<=4: pool.append(argz)
                if time.time()-t0>WALL*0.8: return pool
    # sq_ch + generator multiples (left & right) up to deg4
    for g in GEN:
        base=sq_ch(g); pool.append(base)
        for h in GEN:
            for hh in (gen_elt(h),):
                lv=e_mul(hh,base); rv=e_mul(base,hh)
                if lv and maxdeg(lv)<=4: pool.append(lv)
                if rv and maxdeg(rv)<=4: pool.append(rv)
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
print(f"compound-arg pool size {len(pool)} [build t={time.time()-t0:.1f}s]")
for (i,j),name in [((0,0),'diag00'),((0,1),'off01'),((1,2),'off12')]:
    ok,res,rank=in_span(D[i][j],pool)
    if ok is None:
        print(f"  {name}({i},{j}): WALL hit rank {rank} inconclusive [t={time.time()-t0:.1f}s]")
    else:
        print(f"  {name}({i},{j}): IN-SPAN={ok}, residual={res}, rank={rank} [t={time.time()-t0:.1f}s]")
    sys.stdout.flush()
