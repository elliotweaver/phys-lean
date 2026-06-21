"""
Pin the EXACT location of H in the middle chain.

Structural (H-free) facts found:
  Adj:  bilin(u*v,w) = bilin(v, star u * w)   -- holds on O AND S (H-free)
Question: where does multiplicativity H enter?

Test on S (where H FAILS, base O non-associative):
  Q1: bilin(L(x,y), w) =? 0   (if it FAILS on S, then H forces it -> polarization core)
  Q2: Express bilin(L(x,y),w) via Adj + P-identities to see it = (something)*(Nrm-defect).

Also: the cleaner Hurwitz route uses the identity
  bilin(L(x,y),w) = bilin(x*(star x*y), w) - bilin(iota(Nrm x)*y, w)
Using Adj on first term: bilin(x*(star x * y), w) = bilin(star x * y, star x * w)   [Adj with u=x]
                       = bilin(star x * y, star x * w).
Then P2-type (left scaling of bilin by Nrm): bilin(star x * y, star x * w) = Nrm(star x)*bilin(y,w)?
  -- but P2 is bilin(z*a,z*b)=Nrm z * bilin(a,b); here z=star x. Needs H.
And bilin(iota(Nrm x)*y, w): iota(Nrm x) is a base scalar; = Nrm x * bilin(y,w) if Nrm x central.
So bilin(L,w) = Nrm(star x)*bilin(y,w) - Nrm(x)*bilin(y,w) = (Nrm(star x)-Nrm x)*bilin(y,w).
=> need Nrm(star x) = Nrm x  (norm is star-invariant). Check that.
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
def Nrm(K,z): return K.mul(z,K.star(z))[0]
def bilin(K,x,y): return K.add(K.mul(x,K.star(y)), K.mul(y,K.star(x)))[0]
def L(K,x,y): return K.sub(K.mul(x,K.mul(K.star(x),y)), K.mul(iota(K,Nrm(K,x)),y))
random.seed(303); T=300
print("=== Q1: bilin(L(x,y),w)=0 on S (H fails)? ===")
for nm,K,B in (("O",O,H),("S",S,O)):
    c=sum(1 for _ in range(T) if not eq(B, bilin(K,L(K,rndK(K),rndK(K)),rndK(K)), B.zero))
    print(f"  {nm}: bilin(L,w)!=0 {c}/{T}")
print()
print("=== Nrm(star x) == Nrm x (star-invariance of the norm)? structural or H? ===")
for nm,K,B in (("O",O,H),("S",S,O)):
    c=sum(1 for _ in range(T) if not eq(B, Nrm(K,K.star(rndK(K))), Nrm(K,rndK(K))) )
    # careful: must use SAME x
    c=0
    for _ in range(T):
        x=rndK(K)
        if not eq(B, Nrm(K,K.star(x)), Nrm(K,x)): c+=1
    print(f"  {nm}: Nrm(star x)!=Nrm x  {c}/{T}")
print()
print("=== decomposition check on O: bilin(x*(star x*y),w) == bilin(star x*y, star x*w) [Adj,u=x]? ===")
for nm,K,B in (("O",O,H),("S",S,O)):
    c=0
    for _ in range(T):
        x=rndK(K);y=rndK(K);w=rndK(K)
        lhs=bilin(K, K.mul(x,K.mul(K.star(x),y)), w)
        rhs=bilin(K, K.mul(K.star(x),y), K.mul(K.star(x),w))
        if not eq(B,lhs,rhs): c+=1
    print(f"  {nm}: Adj-step fails {c}/{T}")
print()
print("=== P2-step (NEEDS H): bilin(star x*y, star x*w)==Nrm(star x)*bilin(y,w)? ===")
for nm,K,B in (("O",O,H),("S",S,O)):
    c=0
    for _ in range(T):
        x=rndK(K);y=rndK(K);w=rndK(K)
        lhs=bilin(K, K.mul(K.star(x),y), K.mul(K.star(x),w))
        rhs=B.mul(Nrm(K,K.star(x)), bilin(K,y,w))
        if not eq(B,lhs,rhs): c+=1
    print(f"  {nm}: P2-step fails {c}/{T}  (expect 0 on O [H], nonzero on S [no H])")
