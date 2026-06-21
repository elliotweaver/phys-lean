"""
N2d-hard-backward — DECISIVE rich-vocabulary witness search.

Target (cascade-faithful, closes the iff with the banked forward half exactly):
  B [Ring][StarRing], exists p q, p*q != q*p  ==>  exists x y : CD(CD B),
  Nrm(x*y) != Nrm x * Nrm y.   (B = ℍ recovers genNrm_not_mul_at_S; CD B non-assoc
  iff B non-comm by iota_iota_e2_assoc_iff, so this is "base non-assoc => norm fails").

Search x,y in CD(CD B) (4 B-components each), components drawn from a RICH vocabulary
including products, for a witness whose norm defect (an element of CD B, flattened to 2
B-coordinates) has a coordinate equal to a CLEAN nonzero multiple of [p,q]=pq-qp
(no stars), so defect=0 forces p*q=q*p. B = free ASSOCIATIVE *-ring on p,q.
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
def ng(*ss):
    return {tuple(ss):Fr(1)}
NZ={}; nOne={():Fr(1)}
p,q=ng('p'),ng('q')
commK=nsub(nmul(p,q),nmul(q,p))

def A_mul(z,w):
    a,b=z;c,d=w
    return (nsub(nmul(a,c),nmul(nstar(d),b)), nadd(nmul(d,a),nmul(b,nstar(c))))
def A_star(z): return (nstar(z[0]),nneg(z[1]))
def A_sub(z,w): return (nsub(z[0],w[0]),nsub(z[1],w[1]))
def A_add(z,w): return (nadd(z[0],w[0]),nadd(z[1],w[1]))
def C_mul(u,v):
    a,b=u;c,d=v
    return (A_sub(A_mul(a,c),A_mul(A_star(d),b)), A_add(A_mul(d,a),A_mul(b,A_star(c))))
def C_star(u): return (A_star(u[0]),(nneg(u[1][0]),nneg(u[1][1])))
def Nrm(u): return C_mul(u,C_star(u))[0]
def defect(x,y): return A_sub(Nrm(C_mul(x,y)), A_mul(Nrm(x),Nrm(y)))
def A0(z): return (not E(z[0])) and (not E(z[1]))

# rich vocabulary of B-elements
Bvoc={'0':NZ,'1':nOne,'p':p,'q':q,'P':nstar(p),'Q':nstar(q),
      'pq':nmul(p,q),'qp':nmul(q,p)}
bk=list(Bvoc.keys())

def mk(b0,b1,b2,b3): return ((Bvoc[b0],Bvoc[b1]),(Bvoc[b2],Bvoc[b3]))
def clean_comm(s):
    if not E(s): return None
    c1=s.get(('p','q'),Fr(0)); c2=s.get(('q','p'),Fr(0))
    rem={m:v for m,v in s.items() if m not in (('p','q'),('q','p'))}
    if rem: return None
    if c1==-c2 and c1!=0: return c1
    return None

# enumerate witnesses with <=2 nonzero slots to keep it fast
def sparse():
    out=[]
    for pos in range(4):
        for v in bk:
            if v=='0': continue
            c=['0']*4; c[pos]=v; out.append(tuple(c))
    for pos in itertools.combinations(range(4),2):
        for v1 in bk:
            if v1=='0': continue
            for v2 in bk:
                if v2=='0': continue
                c=['0']*4; c[pos[0]]=v1; c[pos[1]]=v2; out.append(tuple(c))
    return out
els=sparse()
print(f"witness components (<=2 nonzero slots): {len(els)}")

hits=[]
for xl in els:
    x=mk(*xl)
    if A0(x[0]) and A0(x[1]): continue
    for yl in els:
        y=mk(*yl)
        if A0(y[0]) and A0(y[1]): continue
        d=defect(x,y)
        if A0(d): continue
        for ci,s in (('re',d[0]),('im',d[1])):
            lam=clean_comm(s)
            if lam is not None:
                hits.append((xl,yl,ci,lam))
print(f"witnesses with a coordinate = lam*[p,q] exactly: {len(hits)}")
hits.sort(key=lambda h:(abs(h[3]), h[0].count('0')+h[1].count('0')))
for xl,yl,ci,lam in hits[:25]:
    print(f"  x={xl} y={yl}  defect.{ci} = {lam}*(pq-qp)")
