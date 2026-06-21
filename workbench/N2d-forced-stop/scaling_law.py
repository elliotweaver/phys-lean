"""
N2d-hard-backward — the SCALING LAW route to alternativity & base-associativity.

Classical Hurwitz fact: in a composition *-algebra the identity
   x * (star x * y) = iota(Nrm x) * y        (left scaling)
   (y * star x) * x = y * iota(Nrm x)        (right scaling)
hold, and they are equivalent to alternativity; combined with the CD structure they
force the base to be associative.

We test, over the CONCRETE cascade (exact rational):
 (A) left/right scaling HOLD on O (=CD H, base H associative, Nrm multiplicative);
 (B) they FAIL on S (=CD O, base O non-associative, Nrm NOT multiplicative);
 (C) the failure of left-scaling on S, with x = iota a + e2 etc., surfaces the base
     octonion associator [a,b,c] (so the Lean step is a clean extraction).
Also test whether scaling is a POLARIZED consequence of Nrm-mult (so step S1 is short).
"""
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
def rnd(K): return build([Fr(random.randint(-3,3)) for _ in range(K.dim)])
def eq(K,u,v): return all(x==y for x,y in zip(flatten(u),flatten(v)))

def Nrm(K,z):   # for K=CD(base); returns base element
    return K.mul(z,K.star(z))[0]
def iotaK(K, baseval):  # iota into K = CD(base): (baseval, 0_base)
    return (baseval, K.star(baseval) if False else _zero_of(K))
def _zero_of(K): return K.zero[0]   # zero of the base = first comp of K.zero... 
# simpler: iota a in CD(base) = (a, base_zero)
def iota(K, a):  # a is base element
    bz = K.zero[0]
    return (a, bz)

def left_scaling_defect(K, x, y):
    # x*(star x * y) - iota(Nrm x)*y
    lhs = K.mul(x, K.mul(K.star(x), y))
    rhs = K.mul(iota(K, Nrm(K,x)), y)
    return K.sub(lhs, rhs)
def right_scaling_defect(K, x, y):
    lhs = K.mul(K.mul(y, K.star(x)), x)
    rhs = K.mul(y, iota(K, Nrm(K,x)))
    return K.sub(lhs, rhs)

random.seed(5)
print("=== left/right SCALING laws on each rung (should HOLD on O, FAIL on S) ===")
for name,K in (("H",H),("O",O),("S",S)):
    lf=sum(1 for _ in range(300) if not eq(K, left_scaling_defect(K,rnd(K),rnd(K)), K.zero))
    rf=sum(1 for _ in range(300) if not eq(K, right_scaling_defect(K,rnd(K),rnd(K)), K.zero))
    print(f"  {name}: left-scaling fails {lf}/300, right-scaling fails {rf}/300")

print()
print("=== does left-scaling defect on S surface the octonion associator? ===")
# x = iota(a) (base element a in O); y full
def assocO(a,b,c): return O.sub(O.mul(O.mul(a,b),c), O.mul(a,O.mul(b,c)))
# Try x = iota a, and look at scaling vs base. For x=iota a, star x = iota(star a),
# x*(star x*y): with y = iota b * e2 patterns. Let's instead directly probe whether
# the associator [iota a, iota b, iota c] in S = iota([a,b,c]) (re-confirm at S level).
def AS(K,X,Y,Z): return K.sub(K.mul(K.mul(X,Y),Z), K.mul(X,K.mul(Y,Z)))
a=rnd(O); b=rnd(O); c=rnd(O)
D=AS(S, iota(S,a), iota(S,b), iota(S,c))
ba=assocO(a,b,c)
print("  [iota a, iota b, iota c]_S == iota([a,b,c]_O):",
      eq(S, D, iota(S,ba)), " (base assoc nonzero:", not eq(O,ba,O.zero),")")

# CONFIRM iota is a ring hom at S level: iota(a*b)=iota a*iota b
print("  iota(a*b)=iota a*iota b on S:",
      all(eq(S, iota(S,O.mul(rndab[0],rndab[1])),
              S.mul(iota(S,rndab[0]),iota(S,rndab[1])))
          for rndab in [(rnd(O),rnd(O)) for _ in range(50)]))
