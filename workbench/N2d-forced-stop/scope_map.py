"""
SCOPE MAP — pin the TRUE non-vacuous theorem and its typeclass home.

Predicates at the doubling step A -> CD A:
  P(A): A associative
  Q(A): scaling law holds on CD A:  forall x y, x*(star x*y) = iota(Nrm x)*y
  R(A): Nrm multiplicative on CD A:  forall x y, Nrm(x*y)=Nrm x * Nrm y

Banked:  assoc_of_scaling = (Q => P) over [NonAssocRing A][StarRing A].
         Nrm_mul_of_doubled_base = (A = CD B, B CommRing) => R(A).

Test each implication over a panel of bases:
  Q  (=CD Q): CommRing, anisotropic  -> A=Q assoc, A=C=CDQ assoc...
  We vary the BASE A directly and check P,Q,R(A).

Bases A to test (each an associative *-ring unless noted):
  Qbase    : Q                       (comm, anisotropic)
  C        : CD Q                    (comm, anisotropic)
  H        : CD(CD Q)                (assoc noncomm, anisotropic)   <- doubled double
  O        : CD(CD(CD Q))            (NON-assoc, anisotropic)
  M2       : M2(Q), transpose        (assoc noncomm, NON-central self-overlap)
  UT       : upper-tri 2x2           (assoc noncomm, DEGENERATE form / radical)
  CDUT     : CD UT                   (NON-assoc, degenerate)
  Dual     : Q[e]/e^2                (comm, degenerate)
For each: P(A)=A assoc?  Q(A)=scaling on CD A?  R(A)=Nrm mult on CD A?
Then read which implications are universally true / where they break.
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
    Z=(K.zero,K.zero); one=(K.one,K.zero)
    def add(z,w): return (K.add(z[0],w[0]), K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]), K.neg(z[1]))
    def mul(z,w):
        a,b=z; c,d=w
        return (K.sub(K.mul(a,c), K.mul(K.star(d),b)),
                K.add(K.mul(d,a), K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]), K.neg(z[1]))
    def rnd(): return (K.rnd(), K.rnd())
    def eq(z,w): return K.eq(z[0],w[0]) and K.eq(z[1],w[1])
    return Alg(add,neg,mul,star,Z,one,rnd,eq, name or ("CD("+K.name+")"))

# M2(Q), transpose
def m_mul(a,b):
    return (a[0]*b[0]+a[1]*b[2], a[0]*b[1]+a[1]*b[3],
            a[2]*b[0]+a[3]*b[2], a[2]*b[1]+a[3]*b[3])
M2 = Alg(lambda a,b:tuple(x+y for x,y in zip(a,b)), lambda a:tuple(-x for x in a),
         m_mul, lambda a:(a[0],a[2],a[1],a[3]), (Fr(0),)*4,
         (Fr(1),Fr(0),Fr(0),Fr(1)),
         lambda: tuple(Fr(random.randint(-2,2)) for _ in range(4)),
         lambda a,b:a==b, "M2")
# UT (a00,a01,a11), star=(a11,-a01,a00)
UT = Alg(lambda a,b:tuple(x+y for x,y in zip(a,b)), lambda a:tuple(-x for x in a),
         lambda a,b:(a[0]*b[0], a[0]*b[1]+a[1]*b[2], a[2]*b[2]),
         lambda a:(a[2],-a[1],a[0]), (Fr(0),)*3, (Fr(1),Fr(0),Fr(1)),
         lambda: tuple(Fr(random.randint(-2,2)) for _ in range(3)),
         lambda a,b:a==b, "UT")
# Dual Q[e]/e^2, trivial star
Dual = Alg(lambda a,b:(a[0]+b[0],a[1]+b[1]), lambda a:(-a[0],-a[1]),
           lambda a,b:(a[0]*b[0], a[0]*b[1]+a[1]*b[0]), lambda a:a,
           (Fr(0),Fr(0)), (Fr(1),Fr(0)),
           lambda:(Fr(random.randint(-3,3)),Fr(random.randint(-3,3))),
           lambda a,b:a==b, "Dual")

C  = CDof(Qb,"C"); H = CDof(C,"H"); O = CDof(H,"O")
CDUT = CDof(UT,"CDUT")

def iota(K,a): return (a, K.zero[0])
def Nrm(K,z): return K.mul(z,K.star(z))[0]

def P_assoc(A,T=400,seed=4):
    random.seed(seed); c=0
    for _ in range(T):
        a,b,cc=A.rnd(),A.rnd(),A.rnd()
        if not A.eq(A.mul(A.mul(a,b),cc),A.mul(a,A.mul(b,cc))): c+=1
    return c==0
def Q_scaling(A,T=400,seed=5):
    CDA=CDof(A); random.seed(seed); c=0
    for _ in range(T):
        x,y=CDA.rnd(),CDA.rnd()
        if not CDA.eq(CDA.mul(x,CDA.mul(CDA.star(x),y)), CDA.mul(iota(CDA,Nrm(CDA,x)),y)): c+=1
    return c==0
def R_nrmmult(A,T=400,seed=6):
    CDA=CDof(A); random.seed(seed); c=0
    for _ in range(T):
        x,y=CDA.rnd(),CDA.rnd()
        if not A.eq(Nrm(CDA,CDA.mul(x,y)), A.mul(Nrm(CDA,x),Nrm(CDA,y))): c+=1
    return c==0
def aniso(A,T=600,seed=8):
    # anisotropic: no nonzero a with a*star a = 0 (Nrm faithful at base level on A)
    # test: exists nonzero a with bilin_A radical? approximate by a*star a=0 for nonzero a
    random.seed(seed)
    for _ in range(T):
        a=A.rnd()
        if A.eq(a,A.zero): continue
        if A.eq(A.mul(a,A.star(a)), A.zero): return False
    return True

print(f"{'A':6s} {'P:assoc':>8} {'Q:scaling':>10} {'R:Nrm-mult':>11} {'aniso':>7}")
for A in (Qb,C,H,O,M2,UT,CDUT,Dual):
    print(f"{A.name:6s} {str(P_assoc(A)):>8} {str(Q_scaling(A)):>10} {str(R_nrmmult(A)):>11} {str(aniso(A)):>7}")
print()
print("IMPLICATIONS to read off:")
print("  Q=>P  (assoc_of_scaling, banked): should hold everywhere (no row with Q & not P)")
print("  P=>Q  : holds where? (A assoc => scaling). Look for assoc rows with Q true.")
print("  P=>R  : A assoc => Nrm mult. breaks at M2/UT? (need anisotropy/doubled)")
print("  R=>P  : Nrm mult => A assoc. breaks at CDUT (R true, P false)? = general iff FALSE")
print("  R=>Q  (Hcore): breaks at CDUT (R true, Q false)? = Hcore needs anisotropy")
print("  Over ANISOTROPIC bases: do P<=>Q<=>R all coincide?")
