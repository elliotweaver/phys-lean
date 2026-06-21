"""
N2d-hard-backward — THE DECISIVE multi-witness span test OVER THE CONCRETE CASCADE.

Bare-ring linear extraction is refuted. THE ONE LAW: the cascade base is NOT bare --
it carries central self-overlap (Born). Test over the ACTUAL octonions O = CD(H):

  Pick a non-associating triple (u,v,w) in O (associator assoc(u,v,w) != 0).
  Question: is assoc(u,v,w) in the Q-LINEAR SPAN of norm-defects
     D(x,y) = Nrm(xy) - Nrm(x)Nrm(y),  x,y in CD O, components in a rich O-vocabulary?
  If YES: extract the finite combination -> a concrete multi-witness backward proof
          (Nrm mult => all D=0 => associator=0 => contradiction).
  If NO : even over the real cascade structure there is no linear extraction;
          the only route is the full polarization/alternative-identity argument.

This distinguishes "linear (mechanizable) witness" from "genuine nonlinear Hurwitz".
"""
from fractions import Fraction as Fr
import itertools, random

def Radd(a,b): return a+b
class Alg:
    def __init__(s,add,neg,mul,star,zero,one,dim):
        s.add=add;s.neg=neg;s.mul=mul;s.star=star;s.zero=zero;s.one=one;s.dim=dim
    def sub(s,x,y): return s.add(x,s.neg(y))
Rr=Alg(lambda a,b:a+b,lambda a:-a,lambda a,b:a*b,lambda a:a,Fr(0),Fr(1),1)
def CD(K):
    Z=(K.zero,K.zero); one=(K.one,K.zero)
    def add(z,w): return (K.add(z[0],w[0]),K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]),K.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return (K.sub(K.mul(a,c),K.mul(K.star(d),b)), K.add(K.mul(d,a),K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]),K.neg(z[1]))
    return Alg(add,neg,mul,star,Z,one,2*K.dim)
C=CD(Rr); H=CD(C); O=CD(H)
def flatten(z):
    if isinstance(z,(Fr,int)): return [Fr(z)]
    return flatten(z[0])+flatten(z[1])
def build(vs):
    if len(vs)==1: return vs[0]
    h=len(vs)//2; return (build(vs[:h]),build(vs[h:]))
def Obasis(k):
    v=[Fr(0)]*8; v[k]=Fr(1); return build(v)
def assoc(u,v,w): return O.sub(O.mul(O.mul(u,v),w), O.mul(u,O.mul(v,w)))

# find a non-associating octonion triple among basis imaginary units
eO=[Obasis(k) for k in range(8)]
triple=None
for i,j,k in itertools.combinations(range(1,8),3):
    a=assoc(eO[i],eO[j],eO[k])
    if any(x!=0 for x in flatten(a)):
        triple=(i,j,k); target=a; break
print(f"non-associating octonion triple: e{triple[0]},e{triple[1]},e{triple[2]}")
print(f"associator flat = {flatten(target)}")

# CD over O
COA=CD(O)
def Nrm(u): return COA.mul(u,COA.star(u))[0]    # element of O
def D(x,y): return O.sub(Nrm(COA.mul(x,y)), O.mul(Nrm(x),Nrm(y)))

# rich vocabulary of O-elements: basis units + their products
voc=[O.zero, O.one] + eO[1:]
# also add a few products to enrich
for i,j in itertools.combinations(range(1,8),2):
    voc.append(O.mul(eO[i],eO[j]))
# CD O elements: (re,im), re,im in voc. Build sparse witnesses (one of each slot in voc).
# To bound size, restrict witness components to basis units + 0 + 1.
small=[O.zero,O.one]+eO[1:]
wit=[]
for r in range(len(small)):
    for i in range(len(small)):
        x=(small[r],small[i])
        if all(v==0 for v in flatten(x[0])+flatten(x[1])): continue
        wit.append(x)
print(f"witness elements in CD O: {len(wit)}")

defs=[]
seen=set()
for x in wit:
    for y in wit:
        d=D(x,y)
        fd=tuple(flatten(d))
        if all(v==0 for v in fd): continue
        if fd in seen: continue
        seen.add(fd); defs.append(fd)
print(f"distinct nonzero defect vectors: {len(defs)}")

# is target in Q-span of defs (each an 8-vector)?
tgt=flatten(target)
# Gaussian: solve sum lam_i defs[i] = tgt over 8 coords
ndef=len(defs); ncol=8
M=[[defs[i][j] for i in range(ndef)]+[tgt[j]] for j in range(ncol)]
pr=0
for col in range(ndef):
    piv=None
    for r in range(pr,ncol):
        if M[r][col]!=0: piv=r;break
    if piv is None: continue
    M[pr],M[piv]=M[piv],M[pr]
    pv=M[pr][col]; M[pr]=[x/pv for x in M[pr]]
    for r in range(ncol):
        if r!=pr and M[r][col]!=0:
            f=M[r][col]; M[r]=[M[r][k]-f*M[pr][k] for k in range(ndef+1)]
    pr+=1
    if pr==ncol: break
incons=any(all(M[r][k]==0 for k in range(ndef)) and M[r][ndef]!=0 for r in range(ncol))
print()
if incons:
    print("[NO] associator NOT in Q-span of norm-defects over the concrete octonions.")
else:
    print("[YES] associator IS in Q-span of norm-defects -> a linear multi-witness backward exists.")
