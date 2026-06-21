from fractions import Fraction as Fr
import random
# M2(Q) as flat 4-tuples (a00,a01,a10,a11)
def mmul(a,b):
    return (a[0]*b[0]+a[1]*b[2], a[0]*b[1]+a[1]*b[3],
            a[2]*b[0]+a[3]*b[2], a[2]*b[1]+a[3]*b[3])
def madd(a,b): return (a[0]+b[0],a[1]+b[1],a[2]+b[2],a[3]+b[3])
def mneg(a): return (-a[0],-a[1],-a[2],-a[3])
def mstar(a): return (a[0],a[2],a[1],a[3])
M0=(Fr(0),Fr(0),Fr(0),Fr(0)); M1=(Fr(1),Fr(0),Fr(0),Fr(1))
class Alg:
    def __init__(s,add,neg,mul,star,zero,one):
        s.add=add;s.neg=neg;s.mul=mul;s.star=star;s.zero=zero;s.one=one
M=Alg(madd,mneg,mmul,mstar,M0,M1)
def CDof(K):
    def add(z,w): return (K.add(z[0],w[0]),K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]),K.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return (K.add(K.mul(a,c),K.neg(K.mul(K.star(d),b))), K.add(K.mul(d,a),K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]),K.neg(z[1]))
    return Alg(add,neg,mul,star,(K.zero,K.zero),(K.one,K.zero))
CDM=CDof(M)
def rndM(): return tuple(Fr(random.randint(-2,2)) for _ in range(4))
def rndCDM(): return (rndM(),rndM())
def bilin(K,x,y): return K.add(K.mul(x,K.star(y)),K.mul(y,K.star(x)))[0]
random.seed(1); T=300
f=sum(1 for _ in range(T) if bilin(CDM,CDM.mul((u:=rndCDM()),(v:=rndCDM())),(w:=rndCDM()))!=bilin(CDM,v,CDM.mul(CDM.star(u),w)))
print(f"adjoint on CD(M2(Q),transpose): fails {f}/{T}")
f1=f2=0
for _ in range(T):
    a=rndM(); b=rndM()
    if mmul(madd(a,mstar(a)),b)!=mmul(b,madd(a,mstar(a))): f1+=1
    if mmul(mmul(a,mstar(a)),b)!=mmul(b,mmul(a,mstar(a))): f2+=1
print(f"  trace a+star a central in M2: fails {f1}/{T};  norm a*star a central: fails {f2}/{T}")
