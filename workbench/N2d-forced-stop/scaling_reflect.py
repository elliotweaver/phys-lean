"""
N2d MIDDLE third — the SCALING-LAW reflection probe.

The scaling law (left):  L(x,y) := x*(star x * y) - iota(Nrm x)*y
is base-associativity-equivalent (scaling_law.py: =0 on O, !=0 300/300 on S).

GOAL: find a CLEAN evaluation x = f(a,b), y = g(c) (built from iota's and e2) such
that the scaling-law defect L(x,y) equals a clean +/-1 multiple of iota([a,b,c]_A)
in ONE coordinate (other coord 0). Then:
   "scaling law holds on CD A  ==>  A associative"
is a clean H-FREE structural reflection (the alternativity analogue of Part B),
narrowing the middle third to the pure polarization core "H ==> scaling law".

Work in S = CD(O), O = CD(H) non-associative, exact rational. a,b,c in O.
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
def rndK(K): return build([Fr(random.randint(-3,3)) for _ in range(K.dim)])
def eq(K,u,v): return all(x==y for x,y in zip(flatten(u),flatten(v)))
def iota(K,a): return (a, K.zero[0])
e2S = (O.zero, O.one)
def Nrm(K,z): return K.mul(z,K.star(z))[0]   # base element
def baseAssoc(a,b,c): return O.sub(O.mul(O.mul(a,b),c), O.mul(a,O.mul(b,c)))
def L(K,x,y):  # left scaling defect
    return K.sub(K.mul(x, K.mul(K.star(x), y)), K.mul(iota(K,Nrm(K,x)), y))

def clean_multiple_of(D, target):  # is flatten(D) = k*flatten(target), single k?
    fb=flatten(target); fd=flatten(D); ks=set(); ok=True
    for x,y in zip(fd,fb):
        if y!=0: ks.add(x/y)
        elif x!=0: ok=False
    return (ok and len(ks)==1), (next(iter(ks)) if ks else None), sum(1 for x in fd if x!=0)

random.seed(7)
# pick base triple with nonzero associator
while True:
    a=rndK(O); b=rndK(O); c=rndK(O)
    ba=baseAssoc(a,b,c)
    if not eq(O,ba,O.zero): break
ia,ib,ic=iota(S,a),iota(S,b),iota(S,c)
iotaBA=iota(S,ba)
print("=== scaling-law defect L(x,y) at e2-mixing args vs iota([a,b,c]_O) ===")
# x must mix base and e2 so star x interacts; try x = ia + e2, and bilinearize in a.
# But L is quadratic in x. Use the POLARIZED scaling: L(x1+x2,y)-L(x1,y)-L(x2,y) is bilinear in x1,x2.
def Lpolar(K,x1,x2,y):
    return K.sub(K.sub(K.sub(L(K,K.add(x1,x2),y), L(K,x1,y)), L(K,x2,y)), K.zero)
cands = {
  "Lpol(ia, e2; ib)":      (ia, e2S, ib),
  "Lpol(ia, e2; ibe2)":    (ia, e2S, S.mul(ib,e2S)),
  "Lpol(ia, ibe2; ic)":    (ia, S.mul(ib,e2S), ic),
  "Lpol(ia, e2; e2)":      (ia, e2S, e2S),
  "Lpol(iae2, e2; ib)":    (S.mul(ia,e2S), e2S, ib),
  "Lpol(ia, ib; ce2)":     (ia, ib, S.mul(ic,e2S)),
  "Lpol(ia, ibe2; ice2)":  (ia, S.mul(ib,e2S), S.mul(ic,e2S)),
}
for name,(x1,x2,y) in cands.items():
    D=Lpolar(S,x1,x2,y)
    clean,k,nz=clean_multiple_of(D,iotaBA)
    print(f"  {name:24s}: =k*iota[a,b,c]? {clean}  k={k}  nz={nz}")

print()
print("=== which Lpolar surface [a,b,c] in IM coordinate (e2-part)? try targets ===")
# target could be iota(ba) OR e2*iota(ba) OR (ba in im slot)
tgt_im = (O.zero, ba)   # element with associator in the e2 component
for name,(x1,x2,y) in cands.items():
    D=Lpolar(S,x1,x2,y)
    c1,k1,nz1=clean_multiple_of(D,iotaBA)
    c2,k2,nz2=clean_multiple_of(D,tgt_im)
    if nz1>0:
        print(f"  {name:24s}: vs iota(ba) clean={c1} k={k1}; vs (0,ba) clean={c2} k={k2}; nz={nz1}")
