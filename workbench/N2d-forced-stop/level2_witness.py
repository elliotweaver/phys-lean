"""
N2d-hard-backward — SINGLE-CAUSE witness at the CORRECT level (full-close attempt).

Cascade base A = CD C, C = free COMMUTATIVE *-ring on c (star c = cbar). A is
NON-commutative <=> c != cbar (banked iota_e2_comm_iff at base C). A is the
non-associative base whose double CD A = CD(CD C) should LOSE the norm law.

Target: x, y in CD A = CD(CD C), uniform in c, with norm defect (valued in A = CD C)
NONZERO <=> c != cbar. If found, the single cause c != cbar (== J != star J) forces
the loss, FULLY closing the backward for cascade bases A = CD C.

CD A = CD(CD C): element = (Z, W), Z,W in A=CD C; each = (z0,z1), z0,z1 in C.
=> 4 C-coords. Nrm valued in A = CD C => 2 C-coords. Defect: 2 C-polys.
"""
from collections import defaultdict
from fractions import Fraction as Fr
import itertools

# C = free commutative *-ring on c; monomial (i,j) = c^i cbar^j (commutative); star swaps.
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
    for (i,j),v in x.items(): r[(j,i)]+=v
    return E(dict(r))
CZ={}; cOne={(0,0):Fr(1)}; cc={(1,0):Fr(1)}; ccb={(0,1):Fr(1)}
cause=csub(cc,ccb)

class Lev:
    def __init__(s,add,neg,mul,star,zero,one):
        s.add=add;s.neg=neg;s.mul=mul;s.star=star;s.zero=zero;s.one=one
    def sub(s,x,y): return s.add(x,s.neg(y))
Cl=Lev(lambda x,y:cadd(x,y),cneg,cmul,cstar,CZ,cOne)
def mkCD(K):
    Z=(K.zero,K.zero); one=(K.one,K.zero)
    def add(z,w): return (K.add(z[0],w[0]),K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]),K.neg(z[1]))
    def mul(z,w):
        a,b=z;c_,d=w
        return (K.sub(K.mul(a,c_),K.mul(K.star(d),b)), K.add(K.mul(d,a),K.mul(b,K.star(c_))))
    def star(z): return (K.star(z[0]),K.neg(z[1]))
    return Lev(add,neg,mul,star,Z,one)
A=mkCD(Cl)        # A = CD C
T=mkCD(A)         # T = CD A = CD(CD C)
def Nrm(u): return T.mul(u,T.star(u))[0]   # valued in A = CD C
def defect(x,y): return A.sub(Nrm(T.mul(x,y)), A.mul(Nrm(x),Nrm(y)))
def A0(z): return (not E(z[0])) and (not E(z[1]))

# A-element building blocks from c
def iC(x): return (x,CZ)         # C -> A (iota)
e2A=(CZ,cOne)                     # e2 of A
ic=iC(cc)                         # iota_C c  in A
icb=A.star(ic)                    # star(iota c) = iota cbar
ce2=A.mul(ic,e2A)                 # (iota c)*e2_A
poolA={'0':A.zero,'1':A.one,'ic':ic,'icb':icb,'e2A':e2A,'ce2':ce2,
       'cbe2':A.mul(icb,e2A)}
keysA=list(poolA.keys())
def mkT(r,i): return (poolA[r],poolA[i])

def clean_cause(s):  # s in C; is it lam*(c-cbar)?
    if not E(s): return None
    a=s.get((1,0),Fr(0)); b=s.get((0,1),Fr(0))
    rem={m:v for m,v in s.items() if m not in ((1,0),(0,1))}
    if rem: return None
    if a==-b and a!=0: return a
    return None

def fmt_c(s):
    if not E(s): return '0'
    return ''.join(f'{v:+g}c^{i}cb^{j}' for (i,j),v in sorted(s.items())) 

hits=[]; nz=[]
for r in keysA:
  for i in keysA:
    x=mkT(r,i)
    if T.is0(x) if hasattr(T,'is0') else (A0(x[0]) and A0(x[1])): continue
    for r2 in keysA:
      for i2 in keysA:
        y=mkT(r2,i2)
        if A0(y[0]) and A0(y[1]): continue
        d=defect(x,y)
        if A0(d): continue
        nz.append((len(E(d[0]))+len(E(d[1])),(r,i),(r2,i2),d))
        for ci,s in enumerate((d[0],d[1])):
            lam=clean_cause(s)
            if lam is not None: hits.append(((r,i),(r2,i2),ci,lam,d))
print(f"witnesses with a coord = lam*(c-cbar): {len(hits)}")
seen=set()
for xf,yf,ci,lam,d in hits:
    if (xf,yf) in seen: continue
    seen.add((xf,yf))
    print(f"  x=<{xf[0]}|{xf[1]}> y=<{yf[0]}|{yf[1]}>  coord{ci}={lam}*(c-cbar)  D=[{fmt_c(d[0])} ; {fmt_c(d[1])}]")
    if len(seen)>=15: break
print(f"\nsimplest nonzero defects:")
nz.sort(key=lambda t:t[0])
seen2=set()
for n,xf,yf,d in nz:
    if (xf,yf) in seen2: continue
    seen2.add((xf,yf))
    print(f"  ({n}) x=<{xf[0]}|{xf[1]}> y=<{yf[0]}|{yf[1]}>  D=[{fmt_c(d[0])} ; {fmt_c(d[1])}]")
    if len(seen2)>=12: break
