"""
N2d-hard-backward — SKEW-ADJOINT witness search (the cascade insight).

In the cascade bases, non-commutativity lives among the SKEW-adjoint (imaginary)
elements: star p = -p (e.g. i,j in H). With p,q skew-adjoint, star only flips sign,
so the norm defect D(x,y) over CD(CD B) becomes a polynomial in p,q ALONE (no
conjugation), and a clean commutator coordinate can appear.

Target: B [Ring][StarRing], exists skew-adjoint p,q with p*q != q*p
   ==> exists x y : CD(CD B), Nrm(x*y) != Nrm x * Nrm y.
Search a witness whose defect has a flat coordinate = lam*(p*q - q*p) exactly, under
the relations star p = -p, star q = -q (imposed symbolically).
"""
from collections import defaultdict
from fractions import Fraction as Fr
import itertools

# free ASSOCIATIVE ring on p,q with star p=-p, star q=-q (skew). monomials = tuples of 'p','q'.
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
    # anti-automorphism; star p=-p, star q=-q => star(m)=(-1)^len * reverse(m)
    r=defaultdict(Fr)
    for m,c in x.items():
        sign=(-1)**len(m)
        r[tuple(reversed(m))]+=c*sign
    return E(dict(r))
def ng(s): return {(s,):Fr(1)}
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

Bvoc={'0':NZ,'1':nOne,'p':p,'q':q}
bk=list(Bvoc.keys())
def mk(b0,b1,b2,b3): return ((Bvoc[b0],Bvoc[b1]),(Bvoc[b2],Bvoc[b3]))
def clean_comm(s):
    if not E(s): return None
    c1=s.get(('p','q'),Fr(0)); c2=s.get(('q','p'),Fr(0))
    rem={m:v for m,v in s.items() if m not in (('p','q'),('q','p'))}
    if rem: return None
    if c1==-c2 and c1!=0: return c1
    return None

# all witnesses with up to 3 nonzero slots
def gen_elems(maxnz=3):
    out=[]
    slots=range(4)
    for nz in range(1,maxnz+1):
        for pos in itertools.combinations(slots,nz):
            for vals in itertools.product([v for v in bk if v!='0'],repeat=nz):
                comps=['0']*4
                for s,v in zip(pos,vals): comps[s]=v
                out.append(tuple(comps))
    return out
els=gen_elems(2)
print(f"witnesses (<=2 nonzero slots, skew p,q): {len(els)}")
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
                hits.append((xl,yl,ci,lam,d))
print(f"witnesses with a coordinate = lam*[p,q] (skew-adjoint p,q): {len(hits)}")
def fmt_n(x):
    if not E(x): return '0'
    return ''.join(f'{c:+g}{"".join(m) if m else "1"}' for m,c in sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))
hits.sort(key=lambda h:(abs(h[3]), h[0].count('0')+h[1].count('0')))
for xl,yl,ci,lam,d in hits[:15]:
    print(f"  x={xl} y={yl}  D.{ci}={lam}*[p,q]   full D=<{fmt_n(d[0])}|{fmt_n(d[1])}>")
