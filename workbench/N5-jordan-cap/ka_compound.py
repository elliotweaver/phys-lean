"""ka_compound (run 59): find ka-family instances (allowing COMPOUND args from the entry's
subterms) whose ℚ-combination equals the p-piece. ka is BANKED; linear_combination accepts
ka at compound args (it's a theorem ka : ∀ x y w, ...). Each p-piece should be 1-2 ka instances.

ka(x,y,w): (Sx·Sw)·(y·x) − Sx·(Sw·(y·x)) − (Sx·Sy)·w·x ... but ka's statement is in terms of
star x, star y, star w. We model ka as a FREE-vector generator over arg-expressions and test
span membership of each p-piece. Faithful CD model verifies ka itself is zero (already shown).
"""
from fractions import Fraction as F
from collections import defaultdict
import sys
from faithful_cd import symO, starO, addO, negO, mulO, zeroO, isO0

# free monomials over leaves a,b,c,p + conj; but now allow ka args to be ANY expression we build.
# We work directly in free-word space for the span solve, with faithful-model zero as ground truth.
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
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

# ka as a free vector: ka takes EXPRESSIONS X,Y,W (free vectors) and uses star of them.
# Statement (Building.lean): (star X * star W)*(Y*X) - star X*(star W*(Y*X))
#   = (star X * star Y)*W*X  -- careful: ((star X * star Y)*W)*X - (star X * star Y)*(W*X)
def ka_vec(X,Y,W):
    sX,sY,sW=fstar(X),fstar(Y),fstar(W)
    YX=fmul(Y,X); sXsY=fmul(sX,sY)
    return add(fmul(fmul(sX,sW),YX), neg(fmul(sX,fmul(sW,YX))),
               neg(fmul(fmul(sXsY,W),X)), fmul(sXsY,fmul(W,X)))

# p-piece (0,2): -a(Sp(ac)) + (aSp)(ac) + (pSa)(ac) - (p(Sa a))c   [factor 2 dropped]
a,c,p=E_('a'),E_('c'),E_('p')
Sa,Sp=fstar(a),fstar(p)
ac=fmul(a,c)
piece=add(neg(fmul(a,fmul(Sp,ac))), fmul(fmul(a,Sp),ac),
          fmul(fmul(p,Sa),ac), neg(fmul(fmul(p,fmul(Sa,a)),c)))

# faithful zero-test of a free vector
SYM={s:symO(s) for s in ['a','b','c','p']}
for s in ['a','b','c','p']: SYM[CONJ[s]]=starO(SYM[s])
def ev(m):
    if isinstance(m,str): return SYM[m]
    return mulO(ev(m[0]),ev(m[1]))
def ev_vec(vec):
    acc=zeroO()
    for m,co in vec.items():
        t=ev(m)
        sc=(({k:co*v for k,v in t[0][0].items()},{k:co*v for k,v in t[0][1].items()}),
            ({k:co*v for k,v in t[1][0].items()},{k:co*v for k,v in t[1][1].items()}))
        acc=addO(acc,sc)
    return acc
def vfree0(vec): return isO0(ev_vec(vec))
print("p-piece zero (faithful):", vfree0(piece))

# candidate ka instances: args drawn from {a,b,c,p, ac, Sa*a, ...} the entry subterms.
# We want ka(X,Y,W) to reproduce the piece. Note star X appears, so to get a bare 'a' factor
# leftmost we likely need star X = a => X = star a => X = Sa.
# Try systematically X,Y,W over a small expression set; print which single ka matches +-piece.
import itertools
EXPRS={
 'a':a,'b':E_('b'),'c':c,'p':p,
 'Sa':Sa,'Sc':fstar(c),'Sp':Sp,
}
names=list(EXPRS)
def veq(u,w): return add(u,neg(w))=={}
found=[]
for nx,ny,nw in itertools.product(names,repeat=3):
    k=ka_vec(EXPRS[nx],EXPRS[ny],EXPRS[nw])
    if not k: continue
    for sgn in (1,-1):
        if veq({m:sgn*v for m,v in k.items()}, piece):
            found.append((sgn,nx,ny,nw))
print("single-ka matches:", found)
# pair of ka
if not found:
    insts=[]
    for nx,ny,nw in itertools.product(names,repeat=3):
        k=ka_vec(EXPRS[nx],EXPRS[ny],EXPRS[nw])
        if k: insts.append((f"ka({nx},{ny},{nw})",k))
    # span solve piece over insts
    monset=set(piece)
    for _,v in insts: monset|=set(v)
    order={m:i for i,m in enumerate(sorted(monset,key=str))}
    def lead(v): return min(v,key=lambda m:order[m])
    piv={}
    def red(v,prov):
        v=dict(v);prov=dict(prov)
        while v:
            lm=lead(v)
            if lm in piv:
                pv,pp=piv[lm];f=v[lm]/pv[lm]
                v=add(v,{m:-f*cc for m,cc in pv.items()})
                for k2,cc in pp.items(): prov[k2]=prov.get(k2,F(0))-f*cc
            else: return v,prov,lm
        return v,prov,None
    for idx,(nm,v) in enumerate(insts):
        rv,rp,lm=red(v,{idx:F(1)})
        if rv: piv[lm]=(rv,rp)
    rb,bp,lm=red(dict(piece),{})
    if rb: print("piece NOT in ka-compound span, residual",len(rb))
    else:
        cert=[(insts[k2][0],-cc) for k2,cc in bp.items() if cc!=0]
        print("piece = ka-combo:",cert)
