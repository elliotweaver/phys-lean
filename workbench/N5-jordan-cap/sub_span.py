"""sub_span (run 59): THE post-substitution span finder for BUILDING-BLOCK entries (NEW —
run-50's dead test was on the full core; the BB split is a run-57 discovery, untested here).

Route modelled: rewrite every conjugate letter X = star x  ->  Tx - x, where Tx := x+star x
is CENTRAL (banked tr_comm/tr_assoc: traces commute & associate freely). A central element
factors out as a commuting scalar, so after substitution each monomial = (product of central
Tx's) * (word in lowercase a,b,c,p only). Group the entry by the central T-monomial; each
group's coefficient is a CONJUGATE-FREE word-polynomial in {a,b,c,p}. Each such coefficient
must vanish in the FREE ALTERNATIVE algebra -> expressible as a ℚ-combination of the alt-law
instances (swap12/swap23/left/right/flex/Moufang) on its subterms. Those alt laws are BANKED
(Alternative.lean), each a bounded ext;ring lever. If every T-coefficient closes over the
alt-law span, the entry closes in Lean by: rw conjugates to traces, push traces out
(tr_comm/tr_assoc), linear_combination (norm:=abel) over the alt-law instances.

Reports per BB1 entry: per-T-group residual after alt-law span reduction.
"""
from fractions import Fraction as F
from collections import defaultdict
import sys

# ---------- free *-algebra with central trace symbols ----------
# A monomial = (cen, word) where cen = sorted tuple of central symbols ('Ta',...) with mult,
# word = a nested-tuple binary tree over lowercase leaves 'a','b','c','p' (NO conjugates left).
# We represent a polynomial as dict: key=(cen_tuple, word) -> Fraction.
LEAVES = ['a','b','c','p']
CONJ = {'a':'A','b':'B','c':'C','p':'P'}
for k,v in list(CONJ.items()): CONJ[v]=k
TR = {'a':'Ta','b':'Tb','c':'Tc','p':'Tp'}

def E_(word, cen=()):  # single monomial poly
    return {(tuple(sorted(cen)), word): F(1)}
def padd(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def pneg(x): return {m:-v for m,v in x.items()}
def psub(x,y): return padd(x,pneg(y))
def pscal(c,x): return {m:c*v for m,v in x.items()} if c!=0 else {}
# multiply two polys: words combine by building a product node; central parts merge (commute)
def pmul(x,y):
    r=defaultdict(F)
    for (c1,w1),v1 in x.items():
        for (c2,w2),v2 in y.items():
            cen=tuple(sorted(c1+c2))
            r[(cen,(w1,w2))]+=v1*v2
    return {m:v for m,v in r.items() if v!=0}

# star on a RAW free monomial over {a..p,A..P}: conj+reverse. Here used BEFORE substitution.
def star_leaf(s): return CONJ[s]
def raw_star(w):
    if isinstance(w,str): return star_leaf(w)
    l,r=w; return (raw_star(r), raw_star(l))

# substitute conjugates: build poly from a RAW word (tree over a..p,A..P), replacing each
# uppercase leaf X by (Tx - x):  as poly,  Tx*1word(x?) ... careful: X is a single element =
# Tx - x.  Tx central scalar (goes into cen with the empty word? no — Tx alone is an element).
# We treat a bare central element Tx as monomial (cen=('Tx',), word=UNIT). Need a UNIT word.
UNIT='1'
def leaf_poly(s):
    if s.islower():
        return E_(s)                      # lowercase element
    # uppercase X = Tx - x  ->  central Tx (as cen with unit word) minus lowercase x
    low=CONJ[s]
    return psub(E_(UNIT, (TR[low],)), E_(low))
def word_to_poly(w):
    if isinstance(w,str): return leaf_poly(w)
    l,r=w; return pmul(word_to_poly(l), word_to_poly(r))

# multiplication must handle UNIT (identity word)
_orig_pmul=pmul
def pmul(x,y):
    r=defaultdict(F)
    for (c1,w1),v1 in x.items():
        for (c2,w2),v2 in y.items():
            cen=tuple(sorted(c1+c2))
            if w1==UNIT: w=w2
            elif w2==UNIT: w=w1
            else: w=(w1,w2)
            r[(cen,w)]+=v1*v2
    return {m:v for m,v in r.items() if v!=0}

# ---------- build the entry in RAW free algebra (conjugates as uppercase leaves) ----------
def radd(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def rneg(x): return {m:-v for m,v in x.items()}
def rmul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
def rstar(x): return {raw_star(m):v for m,v in x.items()}
def rE(s): return {s:F(1)}
RZ={}
def mz(): return [[dict(RZ) for _ in range(3)] for _ in range(3)]
def madd(A,B): return [[radd(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def mmul(A,B):
    C=mz()
    for i in range(3):
        for j in range(3):
            s=dict(RZ)
            for k in range(3): s=radd(s,rmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[rneg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def Xz(o01,o02,o12):
    z=lambda s: rE(s) if s else dict(RZ)
    return [[dict(RZ), z(o01), z(o02)],
            [rstar(rE(o01)) if o01 else dict(RZ), dict(RZ), z(o12)],
            [rstar(rE(o02)) if o02 else dict(RZ), rstar(rE(o12)) if o12 else dict(RZ), dict(RZ)]]
A=Xz('a','b','c'); Bm=Xz('p',None,None)
D=jdef(A,Bm)

# ---------- alt-law instances on conjugate-free words ----------
def subtrees(w,acc):
    acc.add(w)
    if isinstance(w,tuple): subtrees(w[0],acc); subtrees(w[1],acc)
def wmul(a,b): return (a,b)
def deg(w): return 1 if isinstance(w,str) else deg(w[0])+deg(w[1])
def pE(w): return {(tuple(),w):F(1)}   # conjugate-free single word poly (no central)
def Aswap12(x,y,z): return psub(padd(pE(((x,y),z)),pE(((y,x),z))), padd(pE((x,(y,z))),pE((y,(x,z)))))
def Aswap23(x,y,z): return psub(padd(pE(((x,y),z)),pE(((x,z),y))), padd(pE((x,(y,z))),pE((x,(z,y)))))
def Aleft(x,y):  return psub(pE((x,(x,y))), pE(((x,x),y)))
def Aright(x,y): return psub(pE(((x,y),y)), pE((x,(y,y))))
def Aflex(x,y):  return psub(pE((x,(y,x))), pE(((x,y),x)))
def AmL(x,y,z):  return psub(pE((x,(y,(x,z)))), pE((((x,y),x),z)))
def AmR(x,y,z):  return psub(pE((((z,x),y),x)), pE((z,(x,(y,x)))))
def AmM(x,y,z):  return psub(pE(((x,y),(z,x))), pE((x,((y,z),x))))

def gen_alt_pool(words):
    # words: set of conjugate-free subterm trees present in this T-group
    g=[w for w in words]
    # also include raw leaves
    leaves=[s for s in LEAVES]
    allw=sorted(set(g+leaves), key=str)
    tgt=None
    inst=[]; seen=set()
    def push(nm,v,tgtdeg):
        if not v: return
        # all monomials same degree
        if any(deg(w)!=tgtdeg for (_,w) in v): return
        sig=tuple(sorted((str(w),val) for (_,w),val in v.items()))
        if sig in seen: return
        seen.add(sig); inst.append((nm,v))
    return allw,push

def degw(poly):
    return deg(next(iter(poly))[1])

def span_reduce(target, inst):
    monset=set(target)
    for _,v in inst: monset|=set(v)
    order={m:k for k,m in enumerate(sorted(monset,key=str))}
    def lead(v): return min(v,key=lambda m:order[m])
    pivots={}
    def red(v,prov):
        v=dict(v); prov=dict(prov)
        while v:
            lm=lead(v)
            if lm in pivots:
                pv,pp=pivots[lm]; f=v[lm]/pv[lm]
                v=padd(v,{m:-f*c for m,c in pv.items()})
                for k,c in pp.items(): prov[k]=prov.get(k,F(0))-f*c
            else: return v,prov,lm
        return v,prov,None
    for idx,(nm,v) in enumerate(inst):
        rv,rp,lm=red(v,{idx:F(1)})
        if rv: pivots[lm]=(rv,rp)
    rb,bp,lm=red(dict(target),{})
    if rb: return ("NO",len(rb),rb)
    cert=[(inst[k][0],-c) for k,c in bp.items() if c!=0]
    return ("OK",len(cert),cert)

i,j=int(sys.argv[1]),int(sys.argv[2])
raw=D[i][j]
# substitute conjugates -> central-trace poly
sub=defaultdict(F)
for m,v in raw.items():
    pm=word_to_poly(m)
    for mm,vv in pm.items(): sub[mm]+=v*vv
sub={m:v for m,v in sub.items() if v!=0}
# group by central T-monomial
groups=defaultdict(dict)
for (cen,w),v in sub.items():
    groups[cen][(tuple(),w)]=v
print(f"entry ({i},{j}): {len(raw)} raw monomials -> {len(sub)} post-sub -> {len(groups)} central-T groups")
for cen in sorted(groups, key=str):
    g=groups[cen]
    if all(w==UNIT for (_,w) in g):  # pure scalar group (no algebra) -> must be 0 already
        s=sum(g.values()); print(f"  T{cen}: scalar coeff sum={s}"); continue
    d=degw(g)
    # build alt-law pool over subterms present + leaves, degree-matched
    words=set()
    for (_,w) in g: subtrees(w,words)
    allw=sorted(set(list(words)+LEAVES),key=str)
    inst=[]; seen=set()
    def push(nm,v):
        if not v: return
        if any(deg(w)!=d for (_,w) in v): return
        sig=tuple(sorted((str(w),val) for (_,w),val in v.items()))
        if sig in seen: return
        seen.add(sig); inst.append((nm,v))
    for x in allw:
        for y in allw:
            push("left",Aleft(x,y)); push("right",Aright(x,y)); push("flex",Aflex(x,y))
    for x in allw:
        for y in allw:
            for z in allw:
                if deg(x)+deg(y)+deg(z)!=d: continue
                push("sw12",Aswap12(x,y,z)); push("sw23",Aswap23(x,y,z))
                push("mL",AmL(x,y,z)); push("mR",AmR(x,y,z)); push("mM",AmM(x,y,z))
    res=span_reduce(g, inst)
    if res[0]=="OK":
        fams=sorted(set(nm for nm,_ in res[2]))
        print(f"  T{cen}: deg{d}, {len(g)} words SOLVED over alt-laws (pool {len(inst)}, cert {res[1]}, fams={fams})")
    else:
        print(f"  T{cen}: deg{d}, {len(g)} words NO-SOLUTION (pool {len(inst)}, residual {res[1]})")
