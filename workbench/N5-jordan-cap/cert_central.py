"""cert_central (run 50): the DECISIVE reframe — model the proof in its INTENDED form.

Substitute star x = T_x - x for every off-diagonal x BEFORE expanding, where T_x is a
CENTRAL self-adjoint scalar (the trace). Then the only NON-central generators are the 6
off-diagonals a,b,c,p,q,r (NO stars anywhere). Central leaves {T_*, d_i, e_i} commute &
associate freely (modeled exactly by factoring them out of every product word). After this:
  - each monomial = (central scalar polynomial) * (binary-tree word in a,b,c,p,q,r);
  - squares a*a reduce by sq_ch: a*a = T_a*a - N_a (N_a central);  [degree-lowering]
  - the residual word-combination must vanish by alternativity (associators alternating).

TEST: does jdef(Hm,Hm) entry, in this central-scalar-word model, lie in the ℚ[central]-span
of {alt-law instances among the 6 generators} ∪ {sq_ch instances}? If YES over a SMALL pool
-> this IS the Lean certificate (a linear_combination over banked lemmas after the star->trace
simp + sq_ch rewrite), and the whole node is tractable. If NO -> the manual multi-page route
is confirmed and we decompose with this recorded.
"""
from fractions import Fraction as F
from collections import defaultdict
import sys, time
t0=time.time()

GEN=['a','b','c','p','q','r']
# central leaves: traces T*, norms N*, diagonals
TR={g:'T'+g for g in GEN}
NM={g:'N'+g for g in GEN}
DIAGS=['d0','d1','d2','e0','e1','e2']
CENTRAL=set(TR.values())|set(NM.values())|set(DIAGS)

# ---- scalar = polynomial in central leaves: dict[sorted-tuple -> Fraction] ----
def s_const(c): return {():F(c)} if c!=0 else {}
def s_leaf(name): return {(name,):F(1)}
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
            key=tuple(sorted(mx+my)); r[key]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}

# ---- element = dict[word -> scalar]; word = nested tuple over GEN, or () = unit ----
def e_zero(): return {}
def e_add(*xs):
    r=defaultdict(lambda: {})
    out={}
    for x in xs:
        for w,s in x.items():
            out[w]=s_add(out.get(w,{}),s)
    return {w:s for w,s in out.items() if s}
def e_neg(x): return {w:s_neg(s) for w,s in x.items()}
def e_sub(x,y): return e_add(x,e_neg(y))
def e_smul(scalar,x):  # multiply element by a central scalar
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
def gen_elt(g): return {g: s_const(1)}                 # the generator g (word=g string, scalar 1)
def star_elt(g): return e_sub({():s_leaf(TR[g])}, gen_elt(g))  # star g = T_g - g
def cen_elt(name): return {(): s_leaf(name)}              # a central leaf as an element
def unit(): return {(): s_const(1)}

# ---- matrices ----
def mz(n): return [[e_zero() for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[e_add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mneg(A): return [[e_neg(x) for x in row] for row in A]
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=e_zero()
            for k in range(n): s=e_add(s,e_mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))

# Hermitian Hm: diag central d/e; off-diag a,b,c (upper), star below.
A=[[cen_elt('d0'), gen_elt('a'),  gen_elt('b')],
   [star_elt('a'),  cen_elt('d1'), gen_elt('c')],
   [star_elt('b'),  star_elt('c'), cen_elt('d2')]]
B=[[cen_elt('e0'), gen_elt('p'),  gen_elt('q')],
   [star_elt('p'),  cen_elt('e1'), gen_elt('r')],
   [star_elt('q'),  star_elt('r'), cen_elt('e2')]]
D=jdef(A,B)

def words_of(elt): return set(elt.keys())
def wleaves(w,acc):
    if w==(): return
    if isinstance(w,str): acc.append(w); return
    wleaves(w[0],acc); wleaves(w[1],acc)
def wdeg(w):
    acc=[]; wleaves(w,acc); return len(acc)

print("per-entry (central-scalar-word model, star->trace substituted):")
for (i,j),nm in [((0,0),'diag00'),((0,1),'off01'),((1,2),'off12')]:
    E=D[i][j]
    degs=defaultdict(int)
    for w in E: degs[wdeg(w)]+=1
    print(f"  {nm}({i},{j}): {len(E)} words, degree histogram {dict(sorted(degs.items()))}")

# ---- reduction: apply sq_ch to kill squares, then test alt-span on residual ----
# sq_ch as element rewrite: replace word containing a NODE (w,w) [same subtree twice]?
# Simpler: we test SPAN membership. Build pool of law instances as ELEMENTS (=0 vectors),
# allowing left/right multiplication by generators and central-scalar coefficients via the
# linear solver (central monomials are part of the atom). Atom = (word, central_monomial).

def elt_to_vec(elt):
    v=defaultdict(F)
    for w,s in elt.items():
        for cm,co in s.items(): v[(w,cm)]+=co
    return {k:c for k,c in v.items() if c}

# law element generators (each == 0):
def alt_left(x,y):  return e_sub(e_mul(x,e_mul(x,y)), e_mul(e_mul(x,x),y))
def alt_right(x,y): return e_sub(e_mul(e_mul(x,y),y), e_mul(x,e_mul(y,y)))
def flex(x,y):      return e_sub(e_mul(x,e_mul(y,x)), e_mul(e_mul(x,y),x))
def sw12(x,y,z):    return e_sub(e_add(e_mul(e_mul(x,y),z),e_mul(e_mul(y,x),z)), e_add(e_mul(x,e_mul(y,z)),e_mul(y,e_mul(x,z))))
def sw23(x,y,z):    return e_sub(e_add(e_mul(e_mul(x,y),z),e_mul(e_mul(x,z),y)), e_add(e_mul(x,e_mul(y,z)),e_mul(x,e_mul(z,y))))
def sq_ch(g):       # g*g + N_g = T_g*g  -> element  g*g - (T_g*g - N_g) = 0
    return e_sub(e_mul(gen_elt(g),gen_elt(g)), e_sub(e_smul(s_leaf(TR[g]),gen_elt(g)), {():s_leaf(NM[g])}))

def build_pool():
    gens=[gen_elt(g) for g in GEN]
    # degree-2 products as compound args (left-normed)
    deg2=[e_mul(gen_elt(x),gen_elt(y)) for x in GEN for y in GEN]
    args=gens+deg2
    pool=[]; nm=[]
    for ix,x in enumerate(gens):
        for iy,y in enumerate(args):
            for L,t in [(alt_left,'aL'),(alt_right,'aR'),(flex,'fx')]:
                v=L(x,y)
                if v: pool.append(v); nm.append(t)
    for x in gens:
        for y in gens:
            for z in gens:
                for L,t in [(sw12,'s12'),(sw23,'s23')]:
                    v=L(x,y,z)
                    if v: pool.append(v); nm.append(t)
    # sq_ch and its left/right multiples by a generator (to kill squares inside words)
    for g in GEN:
        base=sq_ch(g)
        pool.append(base); nm.append('sq')
        for h in GEN:
            pool.append(e_mul(gen_elt(h),base)); nm.append('Lsq')
            pool.append(e_mul(base,gen_elt(h))); nm.append('Rsq')
    return pool,nm

def in_span(target, pool):
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
        rv=reduce(elt_to_vec(v))
        if rv:
            piv=next(iter(rv)); inv=F(1)/rv[piv]
            basis.append((piv,rv,inv))
    rt=reduce(elt_to_vec(target))
    return len(rt)==0, len(rt), len(basis)

pool,nm=build_pool()
print(f"\npool size {len(pool)}  [t={time.time()-t0:.1f}s]")
for (i,j),name in [((0,0),'diag00'),((0,1),'off01'),((1,2),'off12')]:
    ok,res,rank=in_span(D[i][j],pool)
    print(f"  {name}({i},{j}): IN-SPAN={ok}, residual={res}, basis-rank={rank}  [t={time.time()-t0:.1f}s]")
    sys.stdout.flush()
