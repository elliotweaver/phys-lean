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
# bilin of K (returns base elt = K's base): (x*star y + y*star x).re
def bilin(K,x,y): return K.add(K.mul(x,K.star(y)), K.mul(y,K.star(x)))[0]
random.seed(909); T=500
# adjoint over CD A: A = base of K. Test K=C(A=R),H(A=C),O(A=H),S(A=O)
for nm,K in (("C(A=R)",C),("H(A=C)",H),("O(A=H)",O),("S(A=O)",S)):
    f=0
    for _ in range(T):
        u,v,w=rndK(K),rndK(K),rndK(K)
        lhs=bilin(K,K.mul(u,v),w); rhs=bilin(K,v,K.mul(K.star(u),w))
        if lhs!=rhs: f+=1
    print(f"  adjoint bilin(uv,w)=bilin(v,star u*w) on {nm}: fails {f}/{T}")
