from fractions import Fraction as Fr
import random
class Alg:
    def __init__(s,add,neg,mul,star,zero,one,dim):
        s.add=add;s.neg=neg;s.mul=mul;s.star=star;s.zero=zero;s.one=one;s.dim=dim
    def sub(s,x,y): return s.add(x,s.neg(y))
Rr=Alg(lambda a,b:a+b,lambda a:-a,lambda a,b:a*b,lambda a:a,Fr(0),Fr(1),1)
def CD(K):
    def add(z,w): return (K.add(z[0],w[0]),K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]),K.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return (K.sub(K.mul(a,c),K.mul(K.star(d),b)), K.add(K.mul(d,a),K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]),K.neg(z[1]))
    return Alg(add,neg,mul,star,(K.zero,K.zero),(K.one,K.zero),2*K.dim)
C=CD(Rr); H=CD(C); O=CD(H); S=CD(O)
def flatten(z):
    if isinstance(z,Fr): return [z]
    return flatten(z[0])+flatten(z[1])
def build(vs):
    if len(vs)==1: return vs[0]
    h=len(vs)//2; return (build(vs[:h]),build(vs[h:]))
def rndK(K): return build([Fr(random.randint(-3,3)) for _ in range(K.dim)])
def isz(z): return all(c==0 for c in flatten(z))
def bilin(K,x,y): return K.add(K.mul(x,K.star(y)),K.mul(y,K.star(x)))[0]
def projre(K,z):  # full projection to R
    while isinstance(z,tuple): z=z[0]
    return z
# The Born scalar form g(v,w) := projre_A( bilin_{CD A}(v,w) ) on CD A... 
# but cleanest: the scalar trace form T(v,w) = projre(v * star w + w * star v) over the WHOLE tower.
def T(K,v,w): return projre(K, K.add(K.mul(v,K.star(w)),K.mul(w,K.star(v))))
# Is T the standard inner product (2*sum v_i w_i)? Then nondegenerate trivially.
random.seed(5)
for nm,K in (("O",O),("S",S)):
    ok=True
    for _ in range(100):
        v=rndK(K); w=rndK(K)
        fv=flatten(v); fw=flatten(w)
        if T(K,v,w) != 2*sum(a*b for a,b in zip(fv,fw)): ok=False;break
    print(f"  {nm}: scalar trace form T(v,w) == 2*<v,w> (Euclidean): {ok}")
