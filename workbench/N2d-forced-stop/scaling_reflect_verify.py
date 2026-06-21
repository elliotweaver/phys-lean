"""
Verify the two clean scaling-law reflections hold GENERICALLY (many random triples),
and check whether they are H-FREE structural identities or need the scaling law as hyp.

R1:  Lpol(ia, ib*e2; ic*e2)  = -iota([a,b,c]_O)        (re-coordinate)
R2:  Lpol(ia, ib*e2; ic)     = (0, [a,b,c]_O)           (im-coordinate)
where Lpol(x1,x2,y) = L(x1+x2,y)-L(x1,y)-L(x2,y), L(x,y)=x*(star x*y)-iota(Nrm x)*y.

Key question: L itself involves Nrm. If the algebra is alternative (scaling law L=0),
then Lpol=0, hence iota([a,b,c])=0, hence [a,b,c]=0 (iota injective) => base assoc.
So "CD A alternative (L=0 on all x,y) ==> base A associative" is the reflection.
We verify R1/R2 are IDENTITIES in [a,b,c] (so L=0 forces the associator to vanish).
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
def rndK(K): return build([Fr(random.randint(-4,4)) for _ in range(K.dim)])
def eq(K,u,v): return all(x==y for x,y in zip(flatten(u),flatten(v)))
def iota(K,a): return (a, K.zero[0])
e2S=(O.zero,O.one)
def Nrm(K,z): return K.mul(z,K.star(z))[0]
def baseAssoc(a,b,c): return O.sub(O.mul(O.mul(a,b),c), O.mul(a,O.mul(b,c)))
def L(K,x,y): return K.sub(K.mul(x,K.mul(K.star(x),y)), K.mul(iota(K,Nrm(K,x)),y))
def Lpol(K,x1,x2,y): return K.sub(K.sub(L(K,K.add(x1,x2),y),L(K,x1,y)),L(K,x2,y))

random.seed(101)
nR1=nR2=0; T=400
for _ in range(T):
    a=rndK(O); b=rndK(O); c=rndK(O)
    ba=baseAssoc(a,b,c)
    ia,ibe2,ice2,ic = iota(S,a),S.mul(iota(S,b),e2S),S.mul(iota(S,c),e2S),iota(S,c)
    R1=Lpol(S,ia,ibe2,ice2)
    R2=Lpol(S,ia,ibe2,ic)
    if eq(S,R1, iota(S,O.neg(ba))): nR1+=1
    if eq(S,R2, (O.zero,ba)): nR2+=1
print(f"R1: Lpol(ia,ibe2;ice2) == -iota([a,b,c])  : {nR1}/{T}")
print(f"R2: Lpol(ia,ibe2;ic)   == (0,[a,b,c])      : {nR2}/{T}")

# Also: does R2 simplify? Lpol(ia,ibe2;ic). Note L(ia,ic): x=ia (pure base image).
# For pure base image x=ia, star x = iota(star a), Nrm(ia)=a*star a.
# Check L(ia, y) for base-image-only y reduces to base associator structure.
print()
print("=== sanity: scaling law L = 0 on O (alternative) and != 0 on S ===")
for name,K in (("O",O),("S",S)):
    f=sum(1 for _ in range(200) if not eq(K, L(K,rndK(K),rndK(K)), K.zero))
    print(f"  {name}: L fails {f}/200")
