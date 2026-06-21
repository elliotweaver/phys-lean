"""
What EXACTLY is bilin(iota t * y, w) on CD A?  Find the correct iota-left law.
Candidates: t*bilin(y,w) ; bilin(y,w)*t ; star t * bilin(y,w) ; needs t central/self-conj.
The chain only needs it for t = Nrm x (central, self-conjugate). Test both the
GENERAL t and the SPECIALIZED t=Nrm x over the cascade.
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
def iota(K,a):return(a,K.zero[0])
def Nrm(K,z):return K.mul(z,K.star(z))[0]
def bilin(K,x,y):return K.add(K.mul(x,K.star(y)),K.mul(y,K.star(x)))[0]

for nm,CDA,base in (("H",H,C),("O",O,H),("S",S,O)):
    random.seed(1)
    # general t
    g_tL=g_Lt=g_startL=0
    for _ in range(300):
        t=base.rnd(); y=CDA.rnd(); w=CDA.rnd()
        lhs=bilin(CDA, CDA.mul(iota(CDA,t),y), w)
        if not base.eq(lhs, base.mul(t,bilin(CDA,y,w))): g_tL+=1
        if not base.eq(lhs, base.mul(bilin(CDA,y,w),t)): g_Lt+=1
        if not base.eq(lhs, base.mul(base.star(t),bilin(CDA,y,w))): g_startL+=1
    # specialized t = Nrm x
    s_tL=0
    for _ in range(300):
        x=CDA.rnd(); y=CDA.rnd(); w=CDA.rnd(); t=Nrm(CDA,x)
        lhs=bilin(CDA, CDA.mul(iota(CDA,t),y), w)
        if not base.eq(lhs, base.mul(t,bilin(CDA,y,w))): s_tL+=1
    print(f"{nm}: GEN t*L fails {g_tL}/300, L*t fails {g_Lt}/300, (star t)*L fails {g_startL}/300 | SPEC t=Nrm x, t*L fails {s_tL}/300")
