"""
N2d-hard — find the GENERAL contrapositive witness.

Requirement (the link is ASSOCIATIVITY not commutativity):
  witness x,y(components in {0,1,a,b,c,a*,b*,c*}) such that the defect
  D(x,y) = Nrm(xy)-Nrm(x)Nrm(y)
    - VANISHES for ALL choices of a,b,c in the ASSOCIATIVE-noncommutative base H
      (so it's NOT a commutativity obstruction), AND
    - is NONZERO for some a,b,c in the NON-associative base O (the stop cause).

If found, D is a pure associativity obstruction => clean general contrapositive.
Prefer the SMALLEST witness (fewest nonzero components).
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
def one_(k): return Fr(1) if k==0 else (one_(k-1),z0(k-1))

def make(kb):
    def Nrm(z):
        a,b=z; return radd(rmul(a,rstar(a,kb),kb), rmul(rstar(b,kb),b,kb), kb)
    def cd_mul(z,w):
        a,b=z;c,d=w
        return (rsub(rmul(a,c,kb),rmul(rstar(d,kb),b,kb),kb),
                radd(rmul(d,a,kb),rmul(b,rstar(c,kb),kb),kb))
    def D(x,y): return rsub(Nrm(cd_mul(x,y)), rmul(Nrm(x),Nrm(y),kb), kb)
    return D, (lambda x:is0(x,kb))

def randel(kb,units,lo=-1,hi=1):
    v=z0(kb)
    for i in units:
        v=radd(v, scale(Fr(random.randint(lo,hi)),basis(kb,i),kb),kb)
    return v

# Base H is level 2 (CD twice: dim4), base O is level 3 (dim8).
DH,is0H=make(2)
DO,is0O=make(3)

def comps(kb,a,b,c):
    return {'0':z0(kb),'1':one_(kb),'a':a,'b':b,'c':c,
            'A':rstar(a,kb),'B':rstar(b,kb),'C':rstar(c,kb)}
keys=['0','1','a','b','c','A','B','C']

# pre-generate H test triples and O non-associating triples
random.seed(1)
Htrip=[(randel(2,range(1,4)),randel(2,range(1,4)),randel(2,range(1,4))) for _ in range(12)]
def assocO(a,b,c):
    return rsub(rmul(rmul(a,b,3),c,3),rmul(a,rmul(b,c,3),3),3)
Otrip=[]
while len(Otrip)<12:
    a,b,c=randel(3,range(1,8)),randel(3,range(1,8)),randel(3,range(1,8))
    if not is0O(assocO(a,b,c)): Otrip.append((a,b,c))

results=[]
for fa in itertools.product(keys,repeat=4):
    nz=sum(1 for t in fa if t!='0')
    if nz<2: continue
    # must vanish on ALL H triples
    okH=True
    for (a,b,c) in Htrip:
        cm=comps(2,a,b,c); x=(cm[fa[0]],cm[fa[1]]); y=(cm[fa[2]],cm[fa[3]])
        if not is0H(DH(x,y)): okH=False; break
    if not okH: continue
    # must be nonzero on SOME O triple
    bitesO=False
    for (a,b,c) in Otrip:
        cm=comps(3,a,b,c); x=(cm[fa[0]],cm[fa[1]]); y=(cm[fa[2]],cm[fa[3]])
        if not is0O(DO(x,y)): bitesO=True; break
    if bitesO:
        results.append((nz,fa))

results.sort()
print(f"GENERAL contrapositive witnesses (vanish on assoc H, bite on non-assoc O): {len(results)}")
for nz,fa in results[:25]:
    print(f"   nz={nz}  x=({fa[0]},{fa[1]}) y=({fa[2]},{fa[3]})")
