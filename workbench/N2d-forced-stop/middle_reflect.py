"""
N2d MIDDLE third — find the cleanest STRUCTURAL reflection:
  some alternator/associator of CD(A) elements built from iota(a),iota(b),iota(c),e2
  that EQUALS a clean multiple of the base associator [a,b,c]_A := (a*b)*c - a*(b*c).

If found with coefficient ±1 in one coordinate (the other coord 0), then:
  "CD A alternative (that alternator = 0) ==> A associative"
is a clean Lean reflection lemma, H-free (like Part B's iota_assoc_iff), and the
middle third reduces to "H ==> CD A alternative", the genuine polarization core.

We work concretely in S = CD(O), O = CD(H) non-associative, exact rational.
"""
from fractions import Fraction as Fr
import random, itertools

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
def rndK(K): return build([Fr(random.randint(-3,3)) for _ in range(K.dim)])
def eq(K,u,v): return all(x==y for x,y in zip(flatten(u),flatten(v)))
def iota(K,a):  # a is base element of K=CD(base)
    bz = K.zero[0]
    return (a, bz)
def e2(K):
    return (K.zero[0], K.one[0] if not isinstance(K.zero[0],tuple) else _one_of(K.zero[0]))
def _one_of(z):  # one of a base type matching structure of zero z
    if isinstance(z,Fr): return Fr(1)
    return (_one_of(z[0]), z[1])
# e2 in S = CD(O): (0_O, 1_O)
e2S = (O.zero, O.one)

def assoc(K,X,Y,Z): return K.sub(K.mul(K.mul(X,Y),Z), K.mul(X,K.mul(Y,Z)))
def baseAssoc(a,b,c): return O.sub(O.mul(O.mul(a,b),c), O.mul(a,O.mul(b,c)))

random.seed(11)
print("=== reflections: CD(A)-associator at iota/e2 args vs base associator [a,b,c]_O ===")
# choose base octonion triple with nonzero associator
trials=0
while True:
    a=rndK(O); b=rndK(O); c=rndK(O); trials+=1
    ba=baseAssoc(a,b,c)
    if not eq(O,ba,O.zero): break
print(f"  picked a,b,c with [a,b,c]_O != 0 (after {trials} draws)")
ia,ib,ic = iota(S,a),iota(S,b),iota(S,c)
ibe2 = S.mul(ib, e2S); ice2 = S.mul(ic, e2S); iae2=S.mul(ia,e2S)
iotaBA = iota(S, ba)

# candidate associator expressions (X,Y,Z) built from {ia,ib,ic,e2,iae2,ibe2,ice2}
cands = {
  "[ia,ib,ic]":            (ia,ib,ic),
  "[ia,ib,ice2]":          (ia,ib,ice2),
  "[ia,ibe2,ic]":          (ia,ibe2,ic),
  "[iae2,ib,ic]":          (iae2,ib,ic),
  "[ia,ib,e2] (comm-refl)":(ia,ib,e2S),
  "[ia,ibe2,ice2]":        (ia,ibe2,ice2),
  "[iae2,ibe2,ic]":        (iae2,ibe2,ic),
  "[ia,ib*ic,e2]":         (ia,S.mul(ib,ic),e2S),
}
for name,(X,Y,Z) in cands.items():
    D=assoc(S,X,Y,Z)
    # compare to multiples of iota(ba): is D = k*iota(ba) for small k? check coordinatewise
    fb=flatten(iotaBA); fd=flatten(D)
    # find scalar k s.t. fd = k*fb (where fb nonzero)
    ks=set()
    ok=True
    for x,y in zip(fd,fb):
        if y!=0: ks.add(x/y)
        elif x!=0: ok=False
    clean = ok and len(ks)==1
    kval = next(iter(ks)) if ks else None
    nz = sum(1 for x in fd if x!=0)
    print(f"  {name:26s}: =k*iota[a,b,c]? {clean}  k={kval}  (nonzero coords {nz})")

print()
print("=== LEFT-alternative defect [X,X,Y] and base-associator content ===")
def leftAlt(K,X,Y): return K.sub(K.mul(K.mul(X,X),Y), K.mul(X,K.mul(X,Y)))
def rightAlt(K,X,Y): return K.sub(K.mul(K.mul(Y,X),X), K.mul(Y,K.mul(X,X)))
# Try X = ia + e2, Y = various; see if leftAlt surfaces [a,?,?]
for desc,X,Y in [
    ("X=ia+e2, Y=ib",  S.add(ia,e2S), ib),
    ("X=ia+e2, Y=ibe2", S.add(ia,e2S), ibe2),
    ("X=iae2,  Y=ib",  iae2, ib),
    ("X=ia,    Y=ibe2", ia, ibe2),
]:
    L=leftAlt(S,X,Y); R=rightAlt(S,X,Y)
    print(f"  {desc:20s}: leftAlt nonzero coords {sum(1 for x in flatten(L) if x!=0)}, rightAlt {sum(1 for x in flatten(R) if x!=0)}")
