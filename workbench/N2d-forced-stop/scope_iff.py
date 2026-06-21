"""
SCOPE PROBE for the polarization core's assembled iff.

Target iff (non-vacuous home): over A = CD B with [Ring B][StarRing B],
   Nrm mult on CD(CD B)  <=>  CD B associative  (<=> B commutative).

Decisive: is "Nrm mult on CD(CD B) => B commutative" TRUE for EVERY
[Ring B][StarRing B], or does it need anisotropy?

Each Alg carries its OWN rnd() and eq() so flat-tuple bases (M2, UT) and
CD-nested bases coexist. CDof wraps any base, treating elements as opaque
pairs (z[0], z[1]).
"""
from fractions import Fraction as Fr
import random

class Alg:
    def __init__(s, add, neg, mul, star, zero, one, rnd, eq, name):
        s.add=add; s.neg=neg; s.mul=mul; s.star=star
        s.zero=zero; s.one=one; s.rnd=rnd; s.eq=eq; s.name=name
    def sub(s,x,y): return s.add(x,s.neg(y))

# ---- Q ----
Q = Alg(lambda a,b:a+b, lambda a:-a, lambda a,b:a*b, lambda a:a,
        Fr(0), Fr(1),
        lambda: Fr(random.randint(-3,3)),
        lambda a,b: a==b, "Q")

# ---- CD wrapper over any base K (elements are pairs) ----
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

# ---- M2(Q), transpose involution: NON-comm associative *-ring ----
def m_add(a,b): return tuple(x+y for x,y in zip(a,b))
def m_neg(a): return tuple(-x for x in a)
def m_mul(a,b):
    return (a[0]*b[0]+a[1]*b[2], a[0]*b[1]+a[1]*b[3],
            a[2]*b[0]+a[3]*b[2], a[2]*b[1]+a[3]*b[3])
def m_star(a): return (a[0],a[2],a[1],a[3])  # transpose
M2 = Alg(m_add, m_neg, m_mul, m_star,
         (Fr(0),)*4, (Fr(1),Fr(0),Fr(0),Fr(1)),
         lambda: tuple(Fr(random.randint(-2,2)) for _ in range(4)),
         lambda a,b: a==b, "M2")

# ---- dual numbers Q[e]/(e^2), trivial star: DEGENERATE form, COMMUTATIVE ----
def d_mul(a,b): return (a[0]*b[0], a[0]*b[1]+a[1]*b[0])
Dual = Alg(lambda a,b:(a[0]+b[0],a[1]+b[1]), lambda a:(-a[0],-a[1]),
           d_mul, lambda a:a, (Fr(0),Fr(0)), (Fr(1),Fr(0)),
           lambda: (Fr(random.randint(-3,3)),Fr(random.randint(-3,3))),
           lambda a,b: a==b, "Dual")

# ---- upper-triangular 2x2 (a00,a01,a11), star(a)=(a11,-a01,a00) anti-auto ----
def ut_mul(a,b): return (a[0]*b[0], a[0]*b[1]+a[1]*b[2], a[2]*b[2])
def ut_star(a): return (a[2], -a[1], a[0])
UT = Alg(lambda a,b:tuple(x+y for x,y in zip(a,b)),
         lambda a:tuple(-x for x in a), ut_mul, ut_star,
         (Fr(0),Fr(0),Fr(0)), (Fr(1),Fr(0),Fr(1)),
         lambda: tuple(Fr(random.randint(-2,2)) for _ in range(3)),
         lambda a,b: a==b, "UT")

def Nrm(K,z): return K.mul(z,K.star(z))[0]

def Nrm_mult_fails(CDCD, base, T=400, seed=11):
    random.seed(seed); c=0
    for _ in range(T):
        x=CDCD.rnd(); y=CDCD.rnd()
        lhs=Nrm(CDCD, CDCD.mul(x,y))
        rhs=base.mul(Nrm(CDCD,x), Nrm(CDCD,y))
        if not base.eq(lhs,rhs): c+=1
    return c,T
def count_noncomm(K, T=400, seed=7):
    random.seed(seed); c=0
    for _ in range(T):
        a=K.rnd(); b=K.rnd()
        if not K.eq(K.mul(a,b), K.mul(b,a)): c+=1
    return c,T
def count_nonassoc(K, T=300, seed=9):
    random.seed(seed); c=0
    for _ in range(T):
        a=K.rnd(); b=K.rnd(); cc=K.rnd()
        if not K.eq(K.mul(K.mul(a,b),cc), K.mul(a,K.mul(b,cc))): c+=1
    return c,T
def star_ok(K, T=200, seed=3):
    random.seed(seed)
    for _ in range(T):
        a=K.rnd(); b=K.rnd()
        if not K.eq(K.star(K.star(a)), a): return False
        if not K.eq(K.star(K.mul(a,b)), K.mul(K.star(b),K.star(a))): return False
        if not K.eq(K.star(K.add(a,b)), K.add(K.star(a),K.star(b))): return False
    return True

print("=== SCOPE: base B -> (B noncomm? CDB nonassoc?) vs Nrm-mult-FAILS on CD(CD B) ===")
print("    iff predicts FAILS>0  <=>  CDB-nonassoc>0  <=>  B-noncomm>0\n")
for B in (Q, Dual, M2, UT):
    if not star_ok(B):
        print(f"  {B.name:5s}: star NOT a valid *-involution -> skip"); continue
    bc,_ = count_noncomm(B)
    CDB = CDof(B)
    cda,_ = count_nonassoc(CDB)
    CDCDB = CDof(CDB)
    nf,T = Nrm_mult_fails(CDCDB, CDB)
    print(f"  {B.name:5s}: B-noncomm {bc:>3}/400 | CDB-nonassoc {cda:>3}/300 "
          f"| Nrm-mult-FAILS {nf:>3}/{T}")
print()
print("READ: a NON-comm B with FAILS=0 would BREAK the clean [Ring B] iff.")
print("      All non-comm B with FAILS>0 => iff holds over [Ring B][StarRing B].")
