"""
N2d-hard-backward — pin the EXACT CD-A alternative-law instance that surfaces the
base associator, over CONCRETE octonions (A=O non-assoc, CD A = S).

Classical Hurwitz step: CD A alternative => A associative.  We find the explicit
witness: a left/right alternative-law defect in S, with arguments built from iota(a)
and e2, that equals iota(k*[a,b,c]) for the octonion associator [a,b,c].  This is the
algebraic identity the Lean step formalizes.  We probe MIXED arguments (iota + e2)
since pure-iota alternative defects vanish trivially (iota is a ring hom).
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
def rndO(): return build([Fr(random.randint(-4,4)) for _ in range(8)])
def eq(K,u,v): return all(x==y for x,y in zip(flatten(u),flatten(v)))
def assocO(a,b,c): return O.sub(O.mul(O.mul(a,b),c), O.mul(a,O.mul(b,c)))
def iota(a): return (a, O.zero)
e2=(O.zero, O.one)

random.seed(11)
a=rndO(); b=rndO(); c=rndO()
base_assoc=assocO(a,b,c)
print("base [a,b,c] nonzero:", not eq(O,base_assoc,O.zero))

def match(D, target):
    """is D (in S) == iota(k*target) for rational k? returns k or None."""
    if not eq(O, D[1], O.zero): return None
    ft=flatten(target); fd=flatten(D[0])
    ks=set()
    for x,y in zip(fd,ft):
        if y==0:
            if x!=0: return None
        else: ks.add(x/y)
    if len(ks)==1:
        k=ks.pop()
        return k if k!=0 else None
    return None

# associator in S
def AS(x,y,z): return S.sub(S.mul(S.mul(x,y),z), S.mul(x,S.mul(y,z)))

ia,ib,ic=iota(a),iota(b),iota(c)
# build a pool of mixed args
pool={
 'ia':ia,'ib':ib,'ic':ic,'e2':e2,
 'ia+e2':S.add(ia,e2),'ib+e2':S.add(ib,e2),'ic+e2':S.add(ic,e2),
 'ia*e2':S.mul(ia,e2),'ib*e2':S.mul(ib,e2),'ic*e2':S.mul(ic,e2),
 'e2*ic':S.mul(e2,ic),
}
keys=list(pool)
print("\n=== associators [X,Y,Z] in S surfacing iota(k*[a,b,c]) ===")
hits=[]
for X in keys:
 for Y in keys:
  for Z in keys:
    D=AS(pool[X],pool[Y],pool[Z])
    if eq(S,D,S.zero): continue
    k=match(D, base_assoc)
    if k is not None:
        hits.append((X,Y,Z,k))
print(f"clean iota([a,b,c]) associators: {len(hits)}")
for X,Y,Z,k in hits[:15]:
    print(f"  [{X},{Y},{Z}] == iota({k}*[a,b,c])")

# left-alt L(x,y)=(x x)y - x(x y); right-alt R(x,y)=(y x)x - y(x x) surfacing assoc
def L(x,y): return S.sub(S.mul(S.mul(x,x),y), S.mul(x,S.mul(x,y)))
def Rt(x,y): return S.sub(S.mul(S.mul(y,x),x), S.mul(y,S.mul(x,x)))
print("\n=== left/right alt-law defects surfacing iota(k*[a,b,c]) ===")
hits2=[]
for X in keys:
 for Y in keys:
   for tag,D in (("L",L(pool[X],pool[Y])),("Rt",Rt(pool[X],pool[Y]))):
     if eq(S,D,S.zero): continue
     k=match(D, base_assoc)
     if k is not None: hits2.append((tag,X,Y,k))
print(f"clean iota([a,b,c]) alt-defects: {len(hits2)}")
for tag,X,Y,k in hits2[:15]:
    print(f"  {tag}({X},{Y}) == iota({k}*[a,b,c])")
