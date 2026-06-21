"""
FOCUSED: at which structural level do the ADJOINT and SCALING identities become
UNCONDITIONAL (provable by ext+ring, no anisotropy/no H)?

decisive_probe showed adjoint holds 0/400 on H,O,S (bases C,H,O are all DOUBLES)
and adj_structure showed it FAILS on CD(M2) (M2 not a double).

Hypothesis: the adjoint bilin(u*v,w)=bilin(v,star u*w) on CD A is an UNCONDITIONAL
identity when A is itself a DOUBLE A = CD B (self-overlaps central), for ANY *-ring B
-- regardless of whether B is comm/assoc. Test A = CD B for B in {Q,C,H,M2,UT,O}.
Same for the SCALING law x*(star x*y)=iota(Nrm x)*y on CD A.

If adjoint is unconditional on CD(CD B) for all B, it's an ext+ring lemma (cheap,
foundations-only). Then the ONLY genuinely-hard piece is bilin NONDEGENERACY.
"""
from fractions import Fraction as Fr
import random

class Alg:
    def __init__(s, add, neg, mul, star, zero, one, rnd, eq, name):
        s.add=add; s.neg=neg; s.mul=mul; s.star=star
        s.zero=zero; s.one=one; s.rnd=rnd; s.eq=eq; s.name=name
    def sub(s,x,y): return s.add(x,s.neg(y))
Qb = Alg(lambda a,b:a+b, lambda a:-a, lambda a,b:a*b, lambda a:a, Fr(0), Fr(1),
         lambda: Fr(random.randint(-3,3)), lambda a,b: a==b, "Q")
def CDof(K, name=None):
    Z=(K.zero,K.zero)
    def add(z,w): return (K.add(z[0],w[0]), K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]), K.neg(z[1]))
    def mul(z,w):
        a,b=z; c,d=w
        return (K.sub(K.mul(a,c), K.mul(K.star(d),b)),
                K.add(K.mul(d,a), K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]), K.neg(z[1]))
    def rnd(): return (K.rnd(), K.rnd())
    def eq(z,w): return K.eq(z[0],w[0]) and K.eq(z[1],w[1])
    return Alg(add,neg,mul,star,Z,(K.one,K.zero),rnd,eq, name or ("CD("+K.name+")"))
def m_mul(a,b):
    return (a[0]*b[0]+a[1]*b[2], a[0]*b[1]+a[1]*b[3],
            a[2]*b[0]+a[3]*b[2], a[2]*b[1]+a[3]*b[3])
M2 = Alg(lambda a,b:tuple(x+y for x,y in zip(a,b)), lambda a:tuple(-x for x in a),
         m_mul, lambda a:(a[0],a[2],a[1],a[3]), (Fr(0),)*4,
         (Fr(1),Fr(0),Fr(0),Fr(1)),
         lambda: tuple(Fr(random.randint(-2,2)) for _ in range(4)),
         lambda a,b:a==b, "M2")
UT = Alg(lambda a,b:tuple(x+y for x,y in zip(a,b)), lambda a:tuple(-x for x in a),
         lambda a,b:(a[0]*b[0], a[0]*b[1]+a[1]*b[2], a[2]*b[2]),
         lambda a:(a[2],-a[1],a[0]), (Fr(0),)*3, (Fr(1),Fr(0),Fr(1)),
         lambda: tuple(Fr(random.randint(-2,2)) for _ in range(3)),
         lambda a,b:a==b, "UT")
C=CDof(Qb,"C"); H=CDof(C,"H"); O=CDof(H,"O")

def iota(K,a): return (a, K.zero[0])
def Nrm(K,z): return K.mul(z,K.star(z))[0]
def bilin(K,x,y): return K.add(K.mul(x,K.star(y)),K.mul(y,K.star(x)))[0]

def adj_fails(A, T=400, seed=2):
    CDA=CDof(A); random.seed(seed); c=0
    for _ in range(T):
        u,v,w=CDA.rnd(),CDA.rnd(),CDA.rnd()
        if not A.eq(bilin(CDA,CDA.mul(u,v),w), bilin(CDA,v,CDA.mul(CDA.star(u),w))): c+=1
    return c
def scal_fails(A, T=400, seed=3):
    CDA=CDof(A); random.seed(seed); c=0
    for _ in range(T):
        x,y=CDA.rnd(),CDA.rnd()
        if not CDA.eq(CDA.mul(x,CDA.mul(CDA.star(x),y)), CDA.mul(iota(CDA,Nrm(CDA,x)),y)): c+=1
    return c
def selfoverlap_central_fails(A, T=400, seed=4):
    # is a*star a central in A?  (the trunk's central positivity)
    random.seed(seed); c=0
    for _ in range(T):
        a,b=A.rnd(),A.rnd()
        n=A.mul(a,A.star(a))
        if not A.eq(A.mul(n,b), A.mul(b,n)): c+=1
    return c
def trace_central_fails(A, T=400, seed=5):
    random.seed(seed); c=0
    for _ in range(T):
        a,b=A.rnd(),A.rnd()
        t=A.add(a,A.star(a))
        if not A.eq(A.mul(t,b), A.mul(b,t)): c+=1
    return c

print("base A    | A=double? | adj-fails | scal-fails | selfovl-noncentral | trace-noncentral")
panel = [("Q",Qb,False),("C",C,True),("H",H,True),("O",O,True),
         ("M2",M2,False),("CD M2",CDof(M2),True),
         ("UT",UT,False),("CD UT",CDof(UT),True)]
for nm,A,isdbl in panel:
    af=adj_fails(A); sf=scal_fails(A); sc=selfoverlap_central_fails(A); tc=trace_central_fails(A)
    print(f"{nm:9s} | {str(isdbl):>7}   | {af:>4}/400  | {sf:>4}/400   | {sc:>6}/400          | {tc:>6}/400")
print()
print("READ: if adj-fails=0 EXACTLY when A is a double (selfovl/trace central),")
print("      the adjoint is an ext+ring identity over A=CD B (any B) -> cheap in Lean.")
print("      scal-fails=0 EXACTLY when A associative (the real Q<=>P content).")
