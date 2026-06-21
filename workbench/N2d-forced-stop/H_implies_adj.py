"""
DECISIVE: does H (Nrm mult on CD A) IMPLY the adjoint bilin(uv,w)=bilin(v,star u*w),
or does the adjoint need extra centrality H cannot supply?

If H => adjoint UNIVERSALLY, the chain closes from H alone (no posited adjoint).
The remaining trunk input is ONLY anisotropy.

Test across the cascade AND degenerate H-algebras (CD UT, CD Dual where H holds):
  for each CD A: does H hold?  does adjoint hold?  (look for H-true & adjoint-false)
Also test the trace-centrality the bric-route needs: is bilin(u,1) central in A,
on algebras where H holds?
"""
from fractions import Fraction as Fr
import random

class Alg:
    def __init__(s, add, neg, mul, star, zero, one, rnd, eq, name):
        s.add=add; s.neg=neg; s.mul=mul; s.star=star
        s.zero=zero; s.one=one; s.rnd=rnd; s.eq=eq; s.name=name
    def sub(s,x,y): return s.add(x,s.neg(y))
Qb = Alg(lambda a,b:a+b, lambda a:-a, lambda a,b:a*b, lambda a:a, Fr(0), Fr(1),
         lambda: Fr(random.randint(-3,3)), lambda a,b:a==b, "Q")
def CDof(K, name=None):
    Z=(K.zero,K.zero)
    def add(z,w): return (K.add(z[0],w[0]), K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]), K.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return (K.sub(K.mul(a,c), K.mul(K.star(d),b)), K.add(K.mul(d,a), K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]), K.neg(z[1]))
    def rnd(): return (K.rnd(), K.rnd())
    def eq(z,w): return K.eq(z[0],w[0]) and K.eq(z[1],w[1])
    return Alg(add,neg,mul,star,Z,(K.one,K.zero),rnd,eq, name or ("CD("+K.name+")"))
def m_mul(a,b):
    return (a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3])
M2=Alg(lambda a,b:tuple(x+y for x,y in zip(a,b)),lambda a:tuple(-x for x in a),m_mul,
       lambda a:(a[0],a[2],a[1],a[3]),(Fr(0),)*4,(Fr(1),Fr(0),Fr(0),Fr(1)),
       lambda:tuple(Fr(random.randint(-2,2)) for _ in range(4)),lambda a,b:a==b,"M2")
UT=Alg(lambda a,b:tuple(x+y for x,y in zip(a,b)),lambda a:tuple(-x for x in a),
       lambda a,b:(a[0]*b[0],a[0]*b[1]+a[1]*b[2],a[2]*b[2]),lambda a:(a[2],-a[1],a[0]),
       (Fr(0),)*3,(Fr(1),Fr(0),Fr(1)),
       lambda:tuple(Fr(random.randint(-2,2)) for _ in range(3)),lambda a,b:a==b,"UT")
Dual=Alg(lambda a,b:(a[0]+b[0],a[1]+b[1]),lambda a:(-a[0],-a[1]),
         lambda a,b:(a[0]*b[0],a[0]*b[1]+a[1]*b[0]),lambda a:a,(Fr(0),Fr(0)),(Fr(1),Fr(0)),
         lambda:(Fr(random.randint(-3,3)),Fr(random.randint(-3,3))),lambda a,b:a==b,"Dual")

C=CDof(Qb,"C"); H=CDof(C,"H"); O=CDof(H,"O")
def Nrm(K,z): return K.mul(z,K.star(z))[0]
def bilin(K,x,y): return K.add(K.mul(x,K.star(y)),K.mul(y,K.star(x)))[0]
def one_base(A): return A.one

def H_holds(CDA, base, T=400, seed=1):
    random.seed(seed)
    for _ in range(T):
        x,y=CDA.rnd(),CDA.rnd()
        if not base.eq(Nrm(CDA,CDA.mul(x,y)), base.mul(Nrm(CDA,x),Nrm(CDA,y))): return False
    return True
def adjoint_holds(CDA, base, T=400, seed=2):
    random.seed(seed)
    for _ in range(T):
        u,v,w=CDA.rnd(),CDA.rnd(),CDA.rnd()
        if not base.eq(bilin(CDA,CDA.mul(u,v),w), bilin(CDA,v,CDA.mul(CDA.star(u),w))): return False
    return True
def trace_central(A, T=400, seed=3):
    # bilin_? no; trace = u + star u in A; is it central in A?
    random.seed(seed)
    for _ in range(T):
        u,b=A.rnd(),A.rnd()
        t=A.add(u,A.star(u))
        if not A.eq(A.mul(t,b),A.mul(b,t)): return False
    return True

print(f"{'CD A':8s} {'H?':>6} {'adjoint?':>9} {'A-trace-central?':>17}")
panel=[("C(over Q)",C,Qb,Qb),("H(over C)",H,C,C),("O(over H)",O,H,H),
       ("CD M2",CDof(M2),M2,M2),("CD Dual",CDof(Dual),Dual,Dual),
       ("CD UT",CDof(UT),UT,UT),("CD(CD UT)",CDof(CDof(UT)),CDof(UT),CDof(UT))]
for nm,CDA,base,A in panel:
    h=H_holds(CDA,base); a=adjoint_holds(CDA,base); tc=trace_central(A)
    flag = "  <-- H&¬adj!" if (h and not a) else ""
    print(f"{nm:8s} {str(h):>6} {str(a):>9} {str(tc):>17}{flag}")
print()
print("If NO row has H true & adjoint false => H (with the structure) gives adjoint.")
print("If trace-central tracks adjoint => the brics-route (star_add_self+P2_polar)")
print("needs trace-centrality, which the doubled cascade supplies.")
