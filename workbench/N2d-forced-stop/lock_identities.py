"""
Lock the EXACT identities for the middle-third Lean targets.

Decomposition of bilin(L(x,y),w) where L(x,y)=x*(star x*y)-iota(Nrm x)*y:

  (i)  [H-FREE, =Adj]  bilin(x*(star x*y), w) = bilin(star x*y, star x*w)
  (ii) [H, =banked P2] bilin(star x*y, star x*w) = Nrm(star x)*bilin(y,w)   [P2 with z=star x]
  (iii)[H-FREE]        bilin(iota(Nrm x)*y, w) = Nrm x * bilin(y,w)          [iota-scalar step]
  (iv) [H-FREE]        Nrm(star x) = Nrm x                                    [star-invariance]
  =>   bilin(L(x,y),w) = (Nrm star x - Nrm x)*bilin(y,w) = 0   (only H step is P2).

Also need centrality: Nrm x central in A (so c*bilin = bilin*c interchange is safe).
Verify each over O (H holds) AND S (H fails) to classify H-free vs H-using.
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
random.seed(404); T=300
def report(name, fn, K, B):
    c=sum(1 for _ in range(T) if not fn(K,B))
    print(f"  {name:48s}: fails {c}/{T}")
for nm,K,B in (("O",O,H),("S",S,O)):
    print(f"--- base-double K={nm} (B={'H' if nm=='O' else 'O'}) ---")
    def i_test(K,B):
        x,y,w=rndK(K),rndK(K),rndK(K)
        return eq(B, bilin(K, K.mul(x,K.mul(K.star(x),y)), w), bilin(K, K.mul(K.star(x),y), K.mul(K.star(x),w)))
    report("(i)  Adj-step  bilin(x(x*y),w)=bilin(x*y,x*w)", i_test,K,B)
    def iii_test(K,B):
        x,y,w=rndK(K),rndK(K),rndK(K)
        return eq(B, bilin(K, K.mul(iota(K,Nrm(K,x)),y), w), B.mul(Nrm(K,x), bilin(K,y,w)))
    report("(iii) iota-scalar bilin(i(Nrm x)y,w)=Nrm x*bilin(y,w)", iii_test,K,B)
    def iv_test(K,B):
        x=rndK(K); return eq(B, Nrm(K,K.star(x)), Nrm(K,x))
    report("(iv) Nrm(star x)=Nrm x", iv_test,K,B)
    def cen_test(K,B):
        x=rndK(K); m=rndK(B)  # Nrm x central in B
        return eq(B, B.mul(Nrm(K,x),m), B.mul(m,Nrm(K,x)))
    report("(cen) Nrm x central in base", cen_test,K,B)
    def full(K,B):
        x,y,w=rndK(K),rndK(K),rndK(K)
        Lx = K.sub(K.mul(x,K.mul(K.star(x),y)), K.mul(iota(K,Nrm(K,x)),y))
        return eq(B, bilin(K,Lx,w), B.zero)
    report("(M1) H => bilin(L(x,y),w)=0", full,K,B)
