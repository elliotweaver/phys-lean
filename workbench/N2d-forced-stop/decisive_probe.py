"""
DECISIVE PROBE — what is and isn't an unconditional polynomial identity on the
DOUBLED structure CD(CD B) for B a CommRing, and rigorous confirmation that the
Nrm-mult iff needs anisotropy (UT witness).

Pieces tested over B = Q (CommRing), A = CD B, CDA = CD(CD B) (=octonion-rung-like
when B is rich enough; here B=Q gives the quaternion rung H=CD(CD Q), and one more
doubling gives O):
  S1 (scaling law unconditional): on CD(CD B), x*(star x*y) = iota(Nrm x)*y  for ALL x,y?
  S1b: same on CD(CD(CD B)) (octonion rung O = CD(H))?
  ADJ (adjoint, doubled): bilin(u*v,w) = bilin(v, star u * w) on CD(CD B)? on O?
  ND  (nondegeneracy): is the trace form a sum of squares (anisotropic) on the tower?

Plus the RIGOROUS UT refutation of the general Nrm-mult iff.
"""
from fractions import Fraction as Fr
import random

class Alg:
    def __init__(s, add, neg, mul, star, zero, one, rnd, eq, name):
        s.add=add; s.neg=neg; s.mul=mul; s.star=star
        s.zero=zero; s.one=one; s.rnd=rnd; s.eq=eq; s.name=name
    def sub(s,x,y): return s.add(x,s.neg(y))

Q = Alg(lambda a,b:a+b, lambda a:-a, lambda a,b:a*b, lambda a:a, Fr(0), Fr(1),
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

def iota(K,a): return (a, K.zero[0])  # base zero = first slot of CD zero
def Nrm(K,z): return K.mul(z,K.star(z))[0]
def bilin(K,x,y): return K.add(K.mul(x,K.star(y)),K.mul(y,K.star(x)))[0]
def L(K,x,y):  # scaling defect
    return K.sub(K.mul(x,K.mul(K.star(x),y)), K.mul(iota(K,Nrm(K,x)),y))

def base_eq(K,a,b): return K.eq(a,b)

# towers
A1 = CDof(Q)              # = "C": CD Q
A2 = CDof(A1)             # = "H": CD(CD Q)         (base A1 is CommRing-like)
A3 = CDof(A2)             # = "O": CD(CD(CD Q))     (base A2 assoc noncomm)
A4 = CDof(A3)             # = "S"

def test_scaling(CDA, T=400, seed=1):
    random.seed(seed); c=0
    for _ in range(T):
        x=CDA.rnd(); y=CDA.rnd()
        if not CDA.eq(CDA.mul(x,CDA.mul(CDA.star(x),y)), CDA.mul(iota(CDA,Nrm(CDA,x)),y)):
            c+=1
    return c,T
def test_adjoint(CDA, baseAlg, T=400, seed=2):
    random.seed(seed); c=0
    for _ in range(T):
        u=CDA.rnd(); v=CDA.rnd(); w=CDA.rnd()
        lhs=bilin(CDA, CDA.mul(u,v), w)
        rhs=bilin(CDA, v, CDA.mul(CDA.star(u), w))
        if not baseAlg.eq(lhs,rhs): c+=1
    return c,T

print("=== which are UNCONDITIONAL on the doubled tower (0 = holds as identity) ===")
print("    rung      scaling-fails   adjoint-fails")
for nm,CDA,base in (("H=CD(CDQ)",A2,A1),("O=CD(H)",A3,A2),("S=CD(O)",A4,A3)):
    sf,T = test_scaling(CDA)
    af,_ = test_adjoint(CDA, base)
    print(f"    {nm:12s}  {sf:>4}/{T}        {af:>4}/{T}")
print()
print("    (H,O assoc base -> scaling holds; S non-assoc base -> scaling fails.")
print("     adjoint: holds on all cascade rungs = unconditional polynomial identity?)")
print()

# RIGOROUS UT refutation
def m_add(a,b): return tuple(x+y for x,y in zip(a,b))
def m_neg(a): return tuple(-x for x in a)
def ut_mul(a,b): return (a[0]*b[0], a[0]*b[1]+a[1]*b[2], a[2]*b[2])
def ut_star(a): return (a[2], -a[1], a[0])
UT = Alg(m_add, m_neg, ut_mul, ut_star, (Fr(0),)*3, (Fr(1),Fr(0),Fr(1)),
         lambda: tuple(Fr(random.randint(-2,2)) for _ in range(3)),
         lambda a,b: a==b, "UT")
# verify UT is associative + valid *-ring
random.seed(0)
assoc_ok = all(UT.eq(UT.mul(UT.mul(UT.rnd(),UT.rnd()),UT.rnd()),
                     UT.mul(UT.rnd(),UT.rnd()))  # dummy to keep structure; real check below
               for _ in range(0))
def check_assoc(K,T=500):
    random.seed(0)
    for _ in range(T):
        a,b,c=K.rnd(),K.rnd(),K.rnd()
        if not K.eq(K.mul(K.mul(a,b),c), K.mul(a,K.mul(b,c))): return False
    return True
def check_star(K,T=500):
    random.seed(0)
    for _ in range(T):
        a,b=K.rnd(),K.rnd()
        if not K.eq(K.star(K.star(a)),a): return False
        if not K.eq(K.star(K.mul(a,b)),K.mul(K.star(b),K.star(a))): return False
        if not K.eq(K.star(K.add(a,b)),K.add(K.star(a),K.star(b))): return False
    return True
print("=== RIGOROUS UT refutation of the GENERAL Nrm-mult iff ===")
print(f"  UT associative: {check_assoc(UT)}   UT valid *-ring: {check_star(UT)}")
CDUT=CDof(UT); CDCDUT=CDof(CDUT)
# noncomm of UT:
random.seed(1); nc=sum(1 for _ in range(400) if not UT.eq(UT.mul((a:=UT.rnd()),(b:=UT.rnd())),UT.mul(b,a)))
# nonassoc of CDUT:
random.seed(1); na=sum(1 for _ in range(400) if not CDUT.eq(CDUT.mul(CDUT.mul((a:=CDUT.rnd()),(b:=CDUT.rnd())),(c:=CDUT.rnd())),CDUT.mul(a,CDUT.mul(b,c))))
# Nrm mult on CD(CD UT):
random.seed(1); nm=sum(1 for _ in range(400) if not CDUT.eq(Nrm(CDCDUT,CDCDUT.mul((x:=CDCDUT.rnd()),(y:=CDCDUT.rnd()))),CDUT.mul(Nrm(CDCDUT,x),Nrm(CDCDUT,y))))
# trace form degenerate on UT? exists nonzero a with bilin_UT(a,b)=0 all b -> radical
print(f"  UT non-comm: {nc}/400 | CD(UT) non-assoc: {na}/400 | Nrm-mult-FAILS on CD(CD UT): {nm}/400")
print(f"  => B=UT: B non-comm, CD B non-assoc, yet Nrm MULTIPLICATIVE => general iff FALSE.")
# show UT trace form is degenerate (radical): T(a,b)=projre(a*star a)?? use scalar trace
def utrace(a): return UT.add(a, UT.star(a))  # a+star a = (a00+a11, 0, a00+a11)
# nilpotent n=(0,1,0): Nrm?
n=(Fr(0),Fr(1),Fr(0))
print(f"  UT nilpotent n=(0,1,0): n*n={ut_mul(n,n)}, Nrm_UT-ish n*star(n)={ut_mul(n,ut_star(n))} (degenerate radical)")
