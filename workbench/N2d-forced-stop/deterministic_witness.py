"""
N2d-hard — DECISIVE: does a DETERMINISTIC witness W(u,v,w) exist with
   D(W(u,v,w)) = 0  ⟺  [u,v,w] = 0     (not necessarily proportional)?
If yes for some clean small W, the generic hard direction (A non-assoc => Nrm not mult)
is Lean-provable: pick the non-associating triple, build W, D(W)!=0.

Test each candidate witness form across MANY random octonion triples (base O, level 3):
for each, check the biconditional  [is0(D)] == [is0(assoc)].
"""
from fractions import Fraction as Fr
import itertools, random

def z0(k): return Fr(0) if k==0 else (z0(k-1),z0(k-1))
def radd(x,y,k): return x+y if k==0 else (radd(x[0],y[0],k-1),radd(x[1],y[1],k-1))
def rneg(x,k): return -x if k==0 else (rneg(x[0],k-1),rneg(x[1],k-1))
def rsub(x,y,k): return radd(x,rneg(y,k),k)
def rstar(x,k): return x if k==0 else (rstar(x[0],k-1),rneg(x[1],k-1))
def rmul(x,y,k):
    if k==0: return x*y
    a,b=x;c,d=y
    return (rsub(rmul(a,c,k-1),rmul(rstar(d,k-1),b,k-1),k-1),
            radd(rmul(d,a,k-1),rmul(b,rstar(c,k-1),k-1),k-1))
def is0(x,k): return x==0 if k==0 else (is0(x[0],k-1) and is0(x[1],k-1))
def basis(k,i):
    if k==0: return Fr(1)
    h=2**(k-1)
    return (basis(k-1,i),z0(k-1)) if i<h else (z0(k-1),basis(k-1,i-h))
def scale(c,x,k): return c*x if k==0 else (scale(c,x[0],k-1),scale(c,x[1],k-1))

L=3
def Nrm(z):
    a,b=z; return radd(rmul(a,rstar(a,L),L), rmul(rstar(b,L),b,L), L)
def cd_mul(z,w):
    a,b=z;c,d=w
    return (rsub(rmul(a,c,L),rmul(rstar(d,L),b,L),L),
            radd(rmul(d,a,L),rmul(b,rstar(c,L),L),L))
def D(x,y): return rsub(Nrm(cd_mul(x,y)), rmul(Nrm(x),Nrm(y),L), L)
def assoc(a,b,c): return rsub(rmul(rmul(a,b,L),c,L), rmul(a,rmul(b,c,L),L), L)
def randoct(lo=-2,hi=2):
    v=z0(L)
    for i in range(8): v=radd(v, scale(Fr(random.randint(lo,hi)),basis(L,i),L),L)
    return v

random.seed(7)
trips=[(randoct(),randoct(),randoct()) for _ in range(150)]

def comps(u,v,w):
    return {'0':z0(L),'u':u,'v':v,'w':w,
            'U':rstar(u,L),'V':rstar(v,L),'W':rstar(w,L),
            'uv':rmul(u,v,L),'vw':rmul(v,w,L),'uw':rmul(u,w,L)}
keys=['0','u','v','w','U','V','W','uv','vw','uw']

best=[]
for fa in itertools.product(keys,repeat=4):
    nz=sum(1 for t in fa if t!='0')
    if nz<2 or nz>3: continue
    ok=True; bitecount=0
    for (u,v,w) in trips:
        cm=comps(u,v,w); x=(cm[fa[0]],cm[fa[1]]); y=(cm[fa[2]],cm[fa[3]])
        dz=is0(D(x,y),L); az=is0(assoc(u,v,w),L)
        if dz!=az: ok=False; break
        if not dz: bitecount+=1
    if ok and bitecount>0:
        best.append((nz,bitecount,fa))
best.sort(key=lambda t:(t[0],-t[1]))
print(f"DETERMINISTIC witnesses with is0(D) == is0([u,v,w]) on all 150 triples: {len(best)}")
for nz,bc,fa in best[:20]:
    print(f"   nz={nz} bites {bc}/150  x=({fa[0]},{fa[1]}) y=({fa[2]},{fa[3]})")
if not best:
    # relax: witness where D=0 is IMPLIED by assoc=0 (one direction: assoc=0 => D=0),
    # AND there EXISTS a triple with assoc!=0 and D!=0 (so contrapositive holds for SOME)
    print("\n  none biconditional. Searching one-directional: (assoc!=0 => sometimes D!=0)")
    cand=[]
    for fa in itertools.product(keys,repeat=4):
        nz=sum(1 for t in fa if t!='0')
        if nz<2 or nz>3: continue
        implies=True; bites=0
        for (u,v,w) in trips:
            cm=comps(u,v,w); x=(cm[fa[0]],cm[fa[1]]); y=(cm[fa[2]],cm[fa[3]])
            dz=is0(D(x,y),L); az=is0(assoc(u,v,w),L)
            if az and not dz: implies=False; break   # assoc=0 but D!=0 -> not clean
            if not dz: bites+=1
        if implies and bites>0:
            cand.append((nz,bites,fa))
    cand.sort(key=lambda t:(t[0],-t[1]))
    print(f"  one-directional (assoc=0 => D=0) witnesses that bite: {len(cand)}")
    for nz,bc,fa in cand[:15]:
        print(f"   nz={nz} bites {bc}/150  x=({fa[0]},{fa[1]}) y=({fa[2]},{fa[3]})")
