"""
CLEANER FRAMING: with selfMul (x*star x = iota(Nrm x)), the scaling defect
  L(x,y) = x*(star x*y) - iota(Nrm x)*y = x*(star x*y) - (x*star x)*y = [x, star x, y]
is the LEFT ASSOCIATOR of (x, star x, y). The scaling law IS left-alternativity:
  x*(star x*y) = (x*star x)*y.

So Hcore = "H => CD A is left-alternative on (x, star x, y)".
Test: does the chain bilin([x,star x,y], w) = 0 hold (=> via aniso => associator=0)?
And crucially, is bilin(associator, w) reachable via the ADJOINT (unconditional on
doubled base) + P2 (H) WITHOUT the iota-central lemma?

bilin((x*star x)*y, w) via adjoint (u = x*star x):
   = bilin(y, star(x*star x) * w) = bilin(y, (x * star x) * w)   [since star(x*star x)=x*star x, self-conj]
bilin(x*(star x*y), w) via adjoint (u=x):
   = bilin(star x*y, star x*w)
   = [P2, z=star x, H]  Nrm(star x)*bilin(y,w)
And bilin((x*star x)*y,w): adjoint(u=x*star x): = bilin(y, (x*star x)*w)
   hmm need to relate to Nrm x * bilin(y,w). (x*star x)*w = iota(Nrm x)*w.
   bilin(y, iota(Nrm x)*w) =? Nrm x * bilin(y,w)  -- iota-RIGHT central, t=Nrm x.
So still need an iota-central step but for t=Nrm x (which we showed holds). Fine.

ALTERNATIVE cleaner: just compute bilin(L,w) and confirm = (Nrm(star x)-Nrm x)*bilin(y,w)=0,
then w=L => Nrm L=0 => L=0. Test the WHOLE thing symbolically to confirm the route.
"""
from fractions import Fraction as Fr
import random
class Alg:
    def __init__(s,add,neg,mul,star,zero,one,rnd,eq,name):
        s.add=add;s.neg=neg;s.mul=mul;s.star=star;s.zero=zero;s.one=one
        s.rnd=rnd;s.eq=eq;s.name=name
    def sub(s,x,y): return s.add(x,s.neg(y))
Qb=Alg(lambda a,b:a+b,lambda a:-a,lambda a,b:a*b,lambda a:a,Fr(0),Fr(1),
       lambda:Fr(random.randint(-3,3)),lambda a,b:a==b,"Q")
def CDof(K,name=None):
    Z=(K.zero,K.zero)
    def add(z,w):return(K.add(z[0],w[0]),K.add(z[1],w[1]))
    def neg(z):return(K.neg(z[0]),K.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return(K.sub(K.mul(a,c),K.mul(K.star(d),b)),K.add(K.mul(d,a),K.mul(b,K.star(c))))
    def star(z):return(K.star(z[0]),K.neg(z[1]))
    def rnd():return(K.rnd(),K.rnd())
    def eq(z,w):return K.eq(z[0],w[0]) and K.eq(z[1],w[1])
    return Alg(add,neg,mul,star,Z,(K.one,K.zero),rnd,eq,name or("CD("+K.name+")"))
C=CDof(Qb);H=CDof(C);O=CDof(H);S=CDof(O)
def Nrm(K,z):return K.mul(z,K.star(z))[0]
def iota(K,a):return(a,K.zero[0])
def bilin(K,x,y):return K.add(K.mul(x,K.star(y)),K.mul(y,K.star(x)))[0]

for nm,CDA,base in (("H",H,C),("O",O,H),("S",S,O)):
    random.seed(2)
    # L as left-associator [x,star x,y]
    assoc_eq=0; Lscal_eq=0
    for _ in range(300):
        x=CDA.rnd(); y=CDA.rnd()
        L1=CDA.sub(CDA.mul(x,CDA.mul(CDA.star(x),y)), CDA.mul(CDA.mul(x,CDA.star(x)),y)) # associator
        L2=CDA.sub(CDA.mul(x,CDA.mul(CDA.star(x),y)), CDA.mul(iota(CDA,Nrm(CDA,x)),y))    # scaling defect
        if not CDA.eq(L1,L2): assoc_eq+=1
    print(f"{nm}: [x,star x,y] == scaling defect L : differ {assoc_eq}/300 (expect 0 via selfMul)")
