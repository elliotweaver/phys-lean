"""
N2d-hard-backward — find a witness whose defect has ONE flat coordinate equal to
exactly +/-[p,q]. Keep p,q OUT of the fully-real slot b0 (b0 in {0,1}) so star never
conjugates them: the whole defect is a polynomial in p,q alone (no star p/star q),
and a coordinate = +/-(pq-qp) gives a clean Lean contradiction from pq!=qp.

CD(CD B) flat coords ((b0,b1),(b2,b3)); B = free assoc *-ring on p,q.
"""
from collections import defaultdict
from fractions import Fraction as Fr
import itertools

STAR={'p':'P','q':'Q','P':'p','Q':'q'}
def E(d): return {m:v for m,v in d.items() if v}
def nadd(*xs):
    r=defaultdict(Fr)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return E(dict(r))
def nneg(x): return {m:-v for m,v in x.items()}
def nsub(x,y): return nadd(x,nneg(y))
def nmul(x,y):
    r=defaultdict(Fr)
    for mx,cx in x.items():
        for my,cy in y.items(): r[mx+my]+=cx*cy
    return E(dict(r))
def nstar(x):
    r=defaultdict(Fr)
    for m,c in x.items(): r[tuple(STAR[s] for s in reversed(m))]+=c
    return E(dict(r))
def ng(s): return {(s,):Fr(1)}
NZ={}; nOne={():Fr(1)}
p,q=ng('p'),ng('q')

def A_mul(z,w):
    a,b=z;c,d=w
    return (nsub(nmul(a,c),nmul(nstar(d),b)), nadd(nmul(d,a),nmul(b,nstar(c))))
def A_star(z): return (nstar(z[0]),nneg(z[1]))
def A_sub(z,w): return (nsub(z[0],w[0]),nsub(z[1],w[1]))
def A_add(z,w): return (nadd(z[0],w[0]),nadd(z[1],w[1]))
def C_mul(u,v):
    a,b=u;c,d=v
    re=A_sub(A_mul(a,c),A_mul(A_star(d),b))
    im=A_add(A_mul(d,a),A_mul(b,A_star(c)))
    return (re,im)
def C_star(u): return (A_star(u[0]),(nneg(u[1][0]),nneg(u[1][1])))
def Nrm(u): return C_mul(u,C_star(u))[0]   # element of A=CD B (pair of B)
def defect(x,y): return A_sub(Nrm(C_mul(x,y)), A_mul(Nrm(x),Nrm(y)))

def mk(b0,b1,b2,b3): return ((b0,b1),(b2,b3))
Bvoc={'0':NZ,'1':nOne,'p':p,'q':q}
bk=list(Bvoc.keys())

def clean_pm_comm(s):
    """return +1 if s==pq-qp, -1 if s==qp-pq, else None"""
    if not E(s): return None
    c1=s.get(('p','q'),Fr(0)); c2=s.get(('q','p'),Fr(0))
    rem={m:v for m,v in s.items() if m not in (('p','q'),('q','p'))}
    if rem: return None
    if c1==1 and c2==-1: return 1
    if c1==-1 and c2==1: return -1
    return None

def any_clean(s):
    """return lam!=0 if s==lam*(pq-qp) exactly, else None"""
    if not E(s): return None
    c1=s.get(('p','q'),Fr(0)); c2=s.get(('q','p'),Fr(0))
    rem={m:v for m,v in s.items() if m not in (('p','q'),('q','p'))}
    if rem: return None
    if c1==-c2 and c1!=0: return c1
    return None

def elems():
    out=[]
    for b0 in ['0','1']:
        for b1 in bk:
            for b2 in bk:
                for b3 in bk:
                    x=mk(Bvoc[b0],Bvoc[b1],Bvoc[b2],Bvoc[b3])
                    if all(not E(s) for s in (x[0][0],x[0][1],x[1][0],x[1][1])): continue
                    out.append((x,(b0,b1,b2,b3)))
    return out
els=elems()
print(f"witness pool (b0 in {{0,1}}): {len(els)}")

hits=[]
for x,xl in els:
    for y,yl in els:
        d=defect(x,y)   # (re,im), re,im in B
        for coord,s in (('re',d[0]),('im',d[1])):
            lam=any_clean(s)
            if lam is not None:
                hits.append((xl,yl,coord,lam))
print(f"witnesses with a coordinate = lam*[p,q] exactly: {len(hits)}")
# prefer lam=+/-1, simplest witnesses
hits.sort(key=lambda h:(abs(h[3]), str(h[0]).count('0')*-1))
for xl,yl,coord,lam in hits[:25]:
    print(f"  x={xl} y={yl}  defect.{coord} = {lam}*[p,q]")
