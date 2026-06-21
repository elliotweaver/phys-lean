"""
N2d-hard — DECISIVE span test WITH the full conjugation (trunk) structure imposed.

Conjugation algebra (the trunk's Born structure), imaginary generators a,b,c:
   star(g) = -g                       (imaginary)
   g·g     = -n_g     (central scalar)   [self-overlap central]
   g·h+h·g = -m_gh    (central scalar, distinct g,h)  [polarized norm central]
Non-associativity KEPT (binary-tree magma; products do NOT flatten), but every
adjacent same-or-distinct PAIR of LEAVES reduces to (central scalar) + (reordered).
Actually we impose only: g·g -> -n_g (central). The pair relation g·h+h·g central is
a CONSEQUENCE we ALSO impose to model the true conjugation algebra.

Question: is [a,b,c]=(ab)c-a(bc) in the Q-span of defects D(x,y), x,y components in
{0,a,b,c} (a*=-a so no extra), MODULO these central relations?
If YES -> contrapositive cleanly provable (associator extractable). If NO -> Hurwitz child.
"""
from collections import defaultdict
from fractions import Fraction as Fr
import itertools

# monomial: () unit | ('L',k) | ('N',l,r).  coeff: dict over sorted-tuple of central syms -> Fr
# central syms: ('n',k) for g_k^2=-n_k ; ('m',i,j) for {g_i,g_j}=-m_ij (i<j)
UNIT=()
def Lf(k): return ('L',k)
def cO(): return {():Fr(1)}
def cMul(c1,c2):
    r=defaultdict(Fr)
    for k1,v1 in c1.items():
        for k2,v2 in c2.items():
            r[tuple(sorted(k1+k2))]+=v1*v2
    return {k:v for k,v in r.items() if v!=0}
def cAdd(c1,c2):
    r=defaultdict(Fr,c1)
    for k,v in c2.items(): r[k]+=v
    return {k:v for k,v in r.items() if v!=0}
def cNeg(c): return {k:-v for k,v in c.items()}
def cScal(sym): return {(sym,):Fr(1)}

def E(d): return {m:c for m,c in d.items() if c}
def add(x,y):
    r=defaultdict(dict,{m:dict(c) for m,c in x.items()})
    for m,c in y.items(): r[m]=cAdd(r.get(m,{}),c)
    return E(r)
def neg(x): return {m:cNeg(c) for m,c in x.items()}
def sub(x,y): return add(x,neg(y))
def scaleC(cf,x): return E({m:cMul(cf,c) for m,c in x.items()})

# multiply two LEAVES with reduction:
def leaf_mul(k1,k2):
    if k1==k2:
        return {UNIT: cNeg(cScal(('n',k1)))}        # g g = -n
    # distinct: keep as node, but we will also use the anti-relation when needed
    return {('N',Lf(k1),Lf(k2)): cO()}
def mono_mul(m1,m2):
    if m1==UNIT: return {m2:cO()}
    if m2==UNIT: return {m1:cO()}
    if m1[0]=='L' and m2[0]=='L':
        return leaf_mul(m1[1],m2[1])
    return {('N',m1,m2):cO()}
def mul(x,y):
    r={}
    for m1,c1 in x.items():
        for m2,c2 in y.items():
            for mm,cc in mono_mul(m1,m2).items():
                r=add(r,{mm:cMul(cMul(c1,c2),cc)})
    return r
def star_mono(m):
    if m==UNIT: return {UNIT:cO()}
    if m[0]=='L': return {m:cNeg(cO())}
    return mul(star_mono(m[2]),star_mono(m[1]))
def star(x):
    r={}
    for m,c in x.items(): r=add(r,scaleC(c,star_mono(m)))
    return r
g=lambda k:{Lf(k):cO()}
a,b,c=g(0),g(1),g(2)
def Nrm(z):
    re,im=z; return add(mul(re,star(re)), mul(star(im),im))
def cd_mul(z,w):
    ar,ai=z;cr,ci=w
    return (sub(mul(ar,cr),mul(star(ci),ai)), add(mul(ci,ar),mul(ai,star(cr))))
def D(x,y): return sub(Nrm(cd_mul(x,y)), mul(Nrm(x),Nrm(y)))
def assoc(p,q,r): return sub(mul(mul(p,q),r), mul(p,mul(q,r)))
zero={}
target=assoc(a,b,c)

# Build defect set, components from {0,a,b,c}
vocab={'0':zero,'a':a,'b':b,'c':c}
keys=list(vocab)
defects=[]
for fa in itertools.product(keys,repeat=4):
    if fa.count('0')>=3: continue
    x=(vocab[fa[0]],vocab[fa[1]]); y=(vocab[fa[2]],vocab[fa[3]])
    d=D(x,y)
    if d: defects.append(d)

# coordinates = (monomial, central-sym-tuple)
def coords(elt):
    out={}
    for m,c in elt.items():
        for sym,v in c.items():
            out[(m,sym)]=v
    return out
allc=set(coords(target))
dcoords=[coords(d) for d in defects]
for dc in dcoords: allc|=set(dc)
allc=sorted(allc,key=str)
idx={k:i for i,k in enumerate(allc)}
ncol=len(allc); ndef=len(defects)
print(f"defects: {ndef}, ambient dim: {ncol}, target monomials: {len(target)}")

def vec(dc):
    v=[Fr(0)]*ncol
    for k,val in dc.items(): v[idx[k]]=val
    return v
A=[vec(dc) for dc in dcoords]
tv=vec(coords(target))
# solve sum lam_i A[i] = tv
M=[[A[i][j] for i in range(ndef)] for j in range(ncol)]
aug=[M[j][:]+[tv[j]] for j in range(ncol)]
rows=ncol; cols=ndef; pr=0
for col in range(cols):
    piv=None
    for r_ in range(pr,rows):
        if aug[r_][col]!=0: piv=r_;break
    if piv is None: continue
    aug[pr],aug[piv]=aug[piv],aug[pr]
    pv=aug[pr][col]; aug[pr]=[x/pv for x in aug[pr]]
    for r_ in range(rows):
        if r_!=pr and aug[r_][col]!=0:
            f=aug[r_][col]; aug[r_]=[aug[r_][k]-f*aug[pr][k] for k in range(cols+1)]
    pr+=1
    if pr==rows: break
solvable=all(not (all(aug[r_][k]==0 for k in range(cols)) and aug[r_][cols]!=0) for r_ in range(rows))
print()
if solvable:
    print("✅ [a,b,c] IS in Q-span of defects MODULO conjugation relations.")
    print("   => contrapositive CLEANLY PROVABLE: associator = combination of defects.")
else:
    print("❌ [a,b,c] NOT in Q-span of defects even with conjugation relations.")
    print("   => generic contrapositive is genuine Hurwitz depth -> dissolution child.")
