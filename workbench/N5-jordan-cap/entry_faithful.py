"""entry_faithful (run 59): rebuild the BB1 entry decomposition in the FAITHFUL CD model.
Recompute jdef(Xz a b c)(Xz p 0 0) entries with the EXACT repo product, group monomials by
atom-word, test which groups are individually zero (provable by ext;cdsimp;ring) and find the
minimal cancelling combination of the rest. Replaces the split-Zorn group_levers (wrong model).
"""
from fractions import Fraction as F
from collections import defaultdict
import sys, itertools
from faithful_cd import (symO, starO, addO, negO, mulO, zeroO, isO0)

# We need named symbolic octonions a,b,c,p and to track which FREE monomial each contributes.
# Strategy: compute the entry in the faithful model, but to GROUP we need the free-word identity
# of each contribution. We instead do: (1) build the entry as a FREE-algebra polynomial (nested
# tuples over a,b,c,p,A,B,C,P) — reuse decomp machinery — then (2) evaluate any free vector in
# the faithful model to test zero. This gives correct (model-faithful) zero tests on free pieces.

def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def fmul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
CONJ={'a':'A','b':'B','c':'C','p':'P'}
for k,v in list(CONJ.items()): CONJ[v]=k
def star_mon(m):
    if isinstance(m,str): return CONJ[m]
    l,r=m; return (star_mon(r),star_mon(l))
def fstar(x): return {star_mon(m):v for m,v in x.items()}
def E_(x): return {x:F(1)}
Z0={}
def mzero(): return [[dict(Z0) for _ in range(3)] for _ in range(3)]
def madd(A,B): return [[add(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def mmul(A,B):
    C=mzero()
    for i in range(3):
        for j in range(3):
            s=dict(Z0)
            for k in range(3): s=add(s,fmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def Xz(o01,o02,o12):
    z=lambda s: E_(s) if s else dict(Z0)
    return [[dict(Z0), z(o01), z(o02)],
            [fstar(E_(o01)) if o01 else dict(Z0), dict(Z0), z(o12)],
            [fstar(E_(o02)) if o02 else dict(Z0), fstar(E_(o12)) if o12 else dict(Z0), dict(Z0)]]
A=Xz('a','b','c'); Bm=Xz('p',None,None)
D=jdef(A,Bm)

def flat(m):
    if isinstance(m,str): return (m,)
    return flat(m[0])+flat(m[1])

# faithful-model evaluation of a free monomial
SYM={s:symO(s) for s in ['a','b','c','p']}
for s in ['a','b','c','p']: SYM[CONJ[s]]=starO(SYM[s])
def ev(m):
    if isinstance(m,str): return SYM[m]
    return mulO(ev(m[0]), ev(m[1]))
def ev_vec(vec):
    acc=zeroO()
    for m,c in vec.items():
        t=ev(m)
        # scale t by rational c
        sc=(( {k:c*v for k,v in t[0][0].items()}, {k:c*v for k,v in t[0][1].items()} ),
            ( {k:c*v for k,v in t[1][0].items()}, {k:c*v for k,v in t[1][1].items()} ))
        acc=addO(acc, sc)
    return acc
def vec_is0(vec): return isO0(ev_vec(vec))

def lean_mon(m):
    if isinstance(m,str):
        return {'a':'a','b':'b','c':'c','p':'p','A':'star a','B':'star b','C':'star c','P':'star p'}[m]
    l,r=m
    return f"({lean_mon(l)} * {lean_mon(r)})"
def lean_vec(vec):
    parts=[]
    for m,c in sorted(vec.items(),key=str):
        s=lean_mon(m)
        if c==1: parts.append(f"+ {s}")
        elif c==-1: parts.append(f"- {s}")
        elif c>0: parts.append(f"+ {c} * {s}")
        else: parts.append(f"- {abs(c)} * {s}")
    return " ".join(parts)

def decompose(i,j,verbose=False):
    E=D[i][j]
    if not E: return ("ZERO",)
    if not vec_is0(E):
        return ("ENTRY-NONZERO-IN-FAITHFUL!!",)
    groups=defaultdict(dict)
    for m,v in E.items(): groups[flat(m)][m]=v
    words=sorted(groups,key=str)
    gvec={w:dict(groups[w]) for w in words}
    indiv0=[w for w in words if vec_is0(gvec[w])]
    rest=[w for w in words if w not in indiv0]
    levers=[("g["+''.join(w)+"]",gvec[w]) for w in indiv0]
    # match rest into zero-summing pairs (try signs too: +/-)
    radj=defaultdict(list)
    for x in range(len(rest)):
        for y in range(x+1,len(rest)):
            if vec_is0(add(gvec[rest[x]], gvec[rest[y]])):
                radj[x].append(y); radj[y].append(x)
    def match(rem):
        if not rem: return []
        x=min(rem)
        for y in radj[x]:
            if y in rem:
                sub=match(rem-{x,y})
                if sub is not None: return [(x,y)]+sub
        return None
    m=match(frozenset(range(len(rest))))
    if m is None:
        # try larger cancelling combos (triples/quads) greedily
        return ("NO-PAIR", len(rest), levers, [rest[x] for x in range(len(rest))], gvec)
    for (x,y) in m:
        levers.append(("p["+''.join(rest[x])+"+"+''.join(rest[y])+"]", add(gvec[rest[x]],gvec[rest[y]])))
    # verify
    tot={}
    for _,v in levers: tot=add(tot,v)
    return ("OK", len(levers), levers, add(tot,neg(E))=={})

todo=[(int(sys.argv[1]),int(sys.argv[2]))] if len(sys.argv)>2 else [(i,j) for i in range(3) for j in range(3)]
for (i,j) in todo:
    r=decompose(i,j)
    if r[0]=="ZERO": print(f"({i},{j}): ZERO"); continue
    if r[0].startswith("ENTRY-NONZERO"): print(f"({i},{j}): {r[0]}"); continue
    if r[0]=="NO-PAIR":
        print(f"({i},{j}): NO PERFECT PAIRING among {r[1]} groups: {[''.join(w) for w in r[3]]}")
        continue
    _,n,levers,sumok=r
    print(f"({i},{j}): {n} pieces, sum==entry={sumok}")
    if len(sys.argv)>2:
        for lab,v in levers: print(f"    {lab}:  {lean_vec(v)}")
