"""
N2d-hard-backward — CASCADE-FAITHFUL witness search (return to the trunk).

Clean iff matching the banked forward half exactly:
  Forward (Nrm_mul_of_doubled_base): B [CommRing] => Nrm mult on CD(CD B).
  The first NON-commutative base is B = CD C with C commutative and (exists c, c != star c)
  (iota_e2_comm_iff). Then CD(CD B) = CD(CD(CD C)) is the sedenion level.
  Backward (THIS node): exists c : C, c != star c  =>  Nrm NOT mult on CD(CD(CD C)).

The SINGLE CAUSE is c != star c -- EXACTLY the complex unit J != star J that also
causes non-commutativity (rung 2) and non-associativity (rung 3). One seed, every
termination.

C = free COMMUTATIVE *-ring on one generator c (star c = cbar; c,cbar central & commute).
Build the generic CD tower B=CD C, A=CD B, T=CD A. Search uniform witnesses x,y in T
whose norm defect (in A=CD(CD C)) has a flat coordinate = lam*(c - cbar) exactly.
"""
from collections import defaultdict
from fractions import Fraction as Fr
import itertools

# ---- C = free commutative *-ring on c. monomial = (i,j) meaning c^i * cbar^j. ----
def E(d): return {m:v for m,v in d.items() if v}
def cadd(*xs):
    r=defaultdict(Fr)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return E(dict(r))
def cneg(x): return {m:-v for m,v in x.items()}
def csub(x,y): return cadd(x,cneg(y))
def cmul(x,y):
    r=defaultdict(Fr)
    for (i1,j1),v1 in x.items():
        for (i2,j2),v2 in y.items(): r[(i1+i2,j1+j2)]+=v1*v2
    return E(dict(r))
def cstar(x):
    r=defaultdict(Fr)
    for (i,j),v in x.items(): r[(j,i)]+=v   # star c = cbar
    return E(dict(r))
CZ={}; cOne={(0,0):Fr(1)}; cc={(1,0):Fr(1)}; ccbar={(0,1):Fr(1)}
cause=csub(cc,ccbar)   # c - cbar : the single cause

class R:
    def __init__(s,add,neg,mul,star,zero,one,is0):
        s.add=add;s.neg=neg;s.mul=mul;s.star=star;s.zero=zero;s.one=one;s.is0=is0
    def sub(s,x,y): return s.add(x,s.neg(y))
Cring=R(cadd,cneg,cmul,cstar,CZ,cOne,lambda x:not E(x))

def CD(Rg):
    Z=(Rg.zero,Rg.zero); one=(Rg.one,Rg.zero)
    def add(z,w): return (Rg.add(z[0],w[0]),Rg.add(z[1],w[1]))
    def neg(z): return (Rg.neg(z[0]),Rg.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return (Rg.sub(Rg.mul(a,c),Rg.mul(Rg.star(d),b)), Rg.add(Rg.mul(d,a),Rg.mul(b,Rg.star(c))))
    def star(z): return (Rg.star(z[0]),Rg.neg(z[1]))
    def is0(z): return Rg.is0(z[0]) and Rg.is0(z[1])
    return R(add,neg,mul,star,Z,one,is0)

B=CD(Cring)   # B = CD C  (first noncommutative when c != cbar)
A=CD(B)       # A = CD B  (first nonassociative)
T=CD(A)       # T = CD A  (where the law should fail)

def Nrm(u): return T.mul(u,T.star(u))[0]    # element of A
def defect(x,y): return A.sub(Nrm(T.mul(x,y)), A.mul(Nrm(x),Nrm(y)))

# flatten an A-element to 8 C-polys (A = CD(CD(CD C)), depth 3 => 2^3 = 8 leaves)
def flatB(z):  # z in B = CD C -> [c-poly, c-poly]
    return [z[0],z[1]]
def flatA_(z): # z in A = CD B -> 4 c-polys
    return flatB(z[0])+flatB(z[1])
def is_lam_cause(poly):
    if not E(poly): return None
    cv=poly.get((1,0),Fr(0)); cb=poly.get((0,1),Fr(0))
    rem={m:v for m,v in poly.items() if m not in ((1,0),(0,1))}
    if rem: return None
    if cv==-cb and cv!=0: return cv
    return None

# building blocks at each level
def iB(x): return (x,CZ)              # C -> B
def iA(x): return (x,B.zero)          # B -> A
def iT(x): return (x,A.zero)          # A -> T
e2B=(CZ,cOne)                          # e2 of B
e2A=(B.zero,B.one)                     # e2 of A  (1_B=(cOne,CZ))
e2T=(A.zero,A.one)                     # e2 of T

# base A-elements built from c
c_in_A = iA(iB(cc))                    # iota_A(iota_B c)
poolA={
 '0':A.zero,'1':A.one,
 'c':c_in_A,
 'cb':A.star(c_in_A),
 'ce2B':iA(B.mul(iB(cc),e2B)),         # iota_A((iota_B c)*e2_B)
 'e2A':e2A,
 'e2Ae2':A.mul(e2A,e2A),
}
keysA=list(poolA.keys())
def mkT(r,i): return (poolA[r],poolA[i])

hits=[]
cnt=0
for r in keysA:
  for i in keysA:
    x=mkT(r,i)
    if T.is0(x): continue
    for r2 in keysA:
      for i2 in keysA:
        y=mkT(r2,i2)
        if T.is0(y): continue
        cnt+=1
        d=defect(x,y)
        if A.is0(d): continue
        for ci,poly in enumerate(flatA_(d)):
            lam=is_lam_cause(poly)
            if lam is not None:
                hits.append(((r,i),(r2,i2),ci,lam))
print(f"tested {cnt} witness pairs over the cascade-faithful tower")
print(f"witnesses with a flat coord = lam*(c - cbar): {len(hits)}")
seen=set()
for xf,yf,ci,lam in hits:
    if (xf,yf) in seen: continue
    seen.add((xf,yf))
    print(f"  x=<{xf[0]}|{xf[1]}> y=<{yf[0]}|{yf[1]}>  Acoord{ci} = {lam}*(c-cbar)")
    if len(seen)>=30: break
