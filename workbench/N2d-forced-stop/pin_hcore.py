"""
PIN THE EXACT TRUE Hcore statement.

Finding so far: Hcore (H => scaling) is FALSE over a general base (A=CD UT:
H true, scaling false, but CD UT NOT anisotropic). So Hcore needs anisotropy.

Test the candidate true theorem:  H AND anisotropy(Nrm on CD A) => scaling on CD A.
  anisotropy(CD A): forall v in CD A, Nrm v = 0 (in base) => v = 0.

Search a WIDE panel for any counterexample (H true, aniso true, scaling false).
Also report whether the implication is NON-VACUOUS in a meaningful way:
  - cases with H true & aniso true (premise satisfiable)
  - is the scaling conclusion ever non-automatic given the premises?

Panel bases A (we test CD A):
  Q, C, H, O  (cascade, anisotropic; O non-assoc)
  M2 (assoc anisotropic non-double), CD M2
  UT, CD UT, Dual (degenerate / non-aniso)
"""
from fractions import Fraction as Fr
import random

class Alg:
    def __init__(s, add, neg, mul, star, zero, one, rnd, eq, isz, name):
        s.add=add; s.neg=neg; s.mul=mul; s.star=star
        s.zero=zero; s.one=one; s.rnd=rnd; s.eq=eq; s.isz=isz; s.name=name
    def sub(s,x,y): return s.add(x,s.neg(y))
Qb=Alg(lambda a,b:a+b,lambda a:-a,lambda a,b:a*b,lambda a:a,Fr(0),Fr(1),
       lambda:Fr(random.randint(-3,3)),lambda a,b:a==b,lambda a:a==0,"Q")
def CDof(K,name=None):
    Z=(K.zero,K.zero)
    def add(z,w): return (K.add(z[0],w[0]),K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]),K.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return (K.sub(K.mul(a,c),K.mul(K.star(d),b)),K.add(K.mul(d,a),K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]),K.neg(z[1]))
    def rnd(): return (K.rnd(),K.rnd())
    def eq(z,w): return K.eq(z[0],w[0]) and K.eq(z[1],w[1])
    def isz(z): return K.isz(z[0]) and K.isz(z[1])
    return Alg(add,neg,mul,star,Z,(K.one,K.zero),rnd,eq,isz,name or ("CD("+K.name+")"))
def m_mul(a,b):
    return (a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3])
M2=Alg(lambda a,b:tuple(x+y for x,y in zip(a,b)),lambda a:tuple(-x for x in a),m_mul,
       lambda a:(a[0],a[2],a[1],a[3]),(Fr(0),)*4,(Fr(1),Fr(0),Fr(0),Fr(1)),
       lambda:tuple(Fr(random.randint(-2,2)) for _ in range(4)),lambda a,b:a==b,
       lambda a:all(x==0 for x in a),"M2")
UT=Alg(lambda a,b:tuple(x+y for x,y in zip(a,b)),lambda a:tuple(-x for x in a),
       lambda a,b:(a[0]*b[0],a[0]*b[1]+a[1]*b[2],a[2]*b[2]),lambda a:(a[2],-a[1],a[0]),
       (Fr(0),)*3,(Fr(1),Fr(0),Fr(1)),
       lambda:tuple(Fr(random.randint(-2,2)) for _ in range(3)),lambda a,b:a==b,
       lambda a:all(x==0 for x in a),"UT")
Dual=Alg(lambda a,b:(a[0]+b[0],a[1]+b[1]),lambda a:(-a[0],-a[1]),
         lambda a,b:(a[0]*b[0],a[0]*b[1]+a[1]*b[0]),lambda a:a,(Fr(0),Fr(0)),(Fr(1),Fr(0)),
         lambda:(Fr(random.randint(-3,3)),Fr(random.randint(-3,3))),lambda a,b:a==b,
         lambda a:all(x==0 for x in a),"Dual")
C=CDof(Qb,"C");H=CDof(C,"H");O=CDof(H,"O")

def iota(K,a): return (a,K.zero[0])
def Nrm(K,z): return K.mul(z,K.star(z))[0]

def H_holds(CDA,base,T=300,seed=1):
    random.seed(seed)
    for _ in range(T):
        x,y=CDA.rnd(),CDA.rnd()
        if not base.eq(Nrm(CDA,CDA.mul(x,y)),base.mul(Nrm(CDA,x),Nrm(CDA,y))): return False
    return True
def aniso(CDA,base,T=600,seed=2):
    # is there nonzero v in CDA with Nrm v = 0 (in base)?  if yes -> NOT aniso
    random.seed(seed)
    for _ in range(T):
        v=CDA.rnd()
        if base.isz(Nrm(CDA,v)) and not CDA.isz(v): return False
    return True
def scaling(CDA,T=300,seed=3):
    random.seed(seed)
    for _ in range(T):
        x,y=CDA.rnd(),CDA.rnd()
        if not CDA.eq(CDA.mul(x,CDA.mul(CDA.star(x),y)),CDA.mul(iota(CDA,Nrm(CDA,x)),y)): return False
    return True
def assoc(A,T=300,seed=4):
    random.seed(seed)
    for _ in range(T):
        a,b,c=A.rnd(),A.rnd(),A.rnd()
        if not A.eq(A.mul(A.mul(a,b),c),A.mul(a,A.mul(b,c))): return False
    return True

print(f"{'A':9s} {'A-assoc':>8} {'H':>6} {'aniso(CDA)':>11} {'scaling':>8}  CONFLICT?")
panel=[("Q",Qb,Qb),("C",C,Qb),("H",H,C),("O",O,H),
       ("M2",M2,M2),("CD M2",CDof(M2),M2),
       ("UT",UT,UT),("CD UT",CDof(UT),UT),("Dual",Dual,Dual)]
for nm,A,base in panel:
    CDA=CDof(A)
    aa=assoc(A); h=H_holds(CDA,A); an=aniso(CDA,A); sc=scaling(CDA)
    # Hcore-with-aniso conflict: H & aniso & not scaling
    conflict = "  <<< H&aniso&¬scal" if (h and an and not sc) else ""
    print(f"{nm:9s} {str(aa):>8} {str(h):>6} {str(an):>11} {str(sc):>8}{conflict}")
print()
print("If NO conflict row: 'H ∧ aniso(CD A) ⟹ scaling' has no counterexample.")
print("Also: where H & aniso both hold, is A always associative (=> scaling automatic)?")
print("  i.e. is the theorem's non-assoc case vacuous, or does H&aniso admit non-assoc A?")
