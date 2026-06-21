"""
N2d-hard-backward — DECISIVE probe: extract the BASE associator from CD A's
alternative-law defect.  (The 2nd Hurwitz step: CD A alternative => A associative.)

A = O (concrete octonions, genuinely NON-associative).  CD A = S (sedenions).
We compute alternative-law defects in S for X,Y drawn from {iota a, iota b, e2, ...}
with a,b,c octonions, and ask whether any clean instance equals iota([a,b,c]) where
[a,b,c] = (a*b)*c - a*(b*c) is the octonion associator.  A clean match => the Lean
step "CD A (left/right)-alternative => A associative" has an explicit short witness.
"""
from fractions import Fraction as Fr
import random

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
C=CD(Rr); H=CD(C); O=CD(H); S=CD(O)
def flatten(z):
    if isinstance(z,Fr): return [z]
    return flatten(z[0])+flatten(z[1])
def build(vs):
    if len(vs)==1: return vs[0]
    h=len(vs)//2; return (build(vs[:h]),build(vs[h:]))
def rndO(): return build([Fr(random.randint(-3,3)) for _ in range(8)])
def eqA(K,u,v): return all(a==b for a,b in zip(flatten(u),flatten(v)))

def assocO(a,b,c): return O.sub(O.mul(O.mul(a,b),c), O.mul(a,O.mul(b,c)))

def iota(a): return (a, O.zero)         # iota : O -> S
e2S = (O.zero, O.one)                    # e2 of S

# left-alt defect L(X,Y) = X(XY) - (XX)Y  in S
def L(X,Y): return S.sub(S.mul(X,S.mul(X,Y)), S.mul(S.mul(X,X),Y))
# right-alt defect Rt(X,Y) = (YX)X - Y(XX)
def Rt(X,Y): return S.sub(S.mul(S.mul(Y,X),X), S.mul(Y,S.mul(X,X)))
# the FULL associator in S
def AS(X,Y,Z): return S.sub(S.mul(S.mul(X,Y),Z), S.mul(X,S.mul(Y,Z)))

random.seed(3)

# Try: associator of (iota a, iota b, e2) in S  -- mirrors banked iota_iota_e2_assoc_iff
# but here base is O (non-assoc). Expect to surface [a,b]-type or [a,b,c]?
print("=== S-associator [iota a, iota b, e2] vs base data ===")
for _ in range(3):
    a=rndO(); b=rndO()
    D=AS(iota(a),iota(b),e2S)
    # compare D to iota(commutator) and iota(0)
    comm=O.sub(O.mul(a,b),O.mul(b,a))
    print("  D.re == iota? re:",flatten(D[0])[:8])
    print("     -[a,b] (im of D) matches comm:", eqA(O, D[1], O.neg(comm)) or eqA(O,D[1],comm))

# Now the REAL target: an S-associator/alt-defect that surfaces the OCTONION associator [a,b,c].
print()
print("=== search S-associators [X,Y,Z], X,Y,Z in {ia,ib,ic, e2, ia*e2,...} for iota([a,b,c]) ===")
a=rndO(); b=rndO(); c=rndO()
base_assoc=assocO(a,b,c)
print("  base [a,b,c] nonzero:", not eqA(O,base_assoc,O.zero))
ia,ib,ic=iota(a),iota(b),iota(c)
ae2=S.mul(ia,e2S); be2=S.mul(ib,e2S); ce2=S.mul(ic,e2S)
pool={'ia':ia,'ib':ib,'ic':ic,'e2':e2S,'ae2':ae2,'be2':be2,'ce2':ce2}
keys=list(pool)
def match_iota_assoc(D):
    # is D == iota(k*[a,b,c]) for some rational k? i.e. D[1]==0 and D[0]==k*base_assoc
    if not eqA(O,D[1],O.zero): return None
    fa=flatten(base_assoc); fd=flatten(D[0])
    ks=set()
    for x,y in zip(fd,fa):
        if y==0:
            if x!=0: return None
        else:
            ks.add(x/y)
    if len(ks)==1:
        k=ks.pop()
        if k!=0: return k
    return None
hits=[]
for X in keys:
 for Y in keys:
  for Z in keys:
    D=AS(pool[X],pool[Y],pool[Z])
    if eqA(S,D,S.zero): continue
    k=match_iota_assoc(D)
    if k is not None:
        hits.append((X,Y,Z,k)); print(f"  [{X},{Y},{Z}] == iota({k}*[a,b,c])  <-- CLEAN")
print(f"clean iota([a,b,c]) associator witnesses: {len(hits)}")

# Also: do the left/right alt defects L,Rt surface [a,b,c]?
print()
print("=== left/right alt defects surfacing iota([a,b,c]) ===")
hits2=[]
for X in keys:
 for Y in keys:
    for tag,DF in (("L",L(pool[X],pool[Y])),("Rt",Rt(pool[X],pool[Y]))):
        if eqA(S,DF,S.zero): continue
        k=match_iota_assoc(DF)
        if k is not None:
            hits2.append((tag,X,Y,k)); print(f"  {tag}({X},{Y}) == iota({k}*[a,b,c])  <-- CLEAN")
print(f"clean alt-defect witnesses: {len(hits2)}")
