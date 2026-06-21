"""
N2d-hard-backward — DECISIVE numeric test of the alternativity chain.

We test, over CONCRETE cascade algebras (exact rational), the two-step Hurwitz chain:
  (S2)  CD A alternative  <=>  A associative   [pure computation -- contrapositive
        A non-assoc => CD A NOT alternative is what we need; CLEAN if true]
  (S1)  Nrm multiplicative (global) => CD A alternative   [polarization]

Concrete: A = O (octonions, NON-associative), CD A = S (sedenions).
Also A = H (assoc), CD A = O (alternative).  A = C (assoc,comm), CD A = H.

Left-alternative:  x*(x*y) = (x*x)*y   for all x,y.
Right-alternative: (y*x)*x = y*(x*x).
Flexible:          (x*y)*x = x*(y*x).

Key question for GO-FULL: when A is non-associative, is CD A NON-(left)alternative,
and can the FAILURE be pinned to a CLEAN witness x = iota(a) + e2-ish built from a
base associator?  If x*(x*y) != (x*x)*y has a witness with x in the BASE image only,
then left-alternativity restricted to base elements already detects A non-assoc.
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
def build(K,vs):
    if len(vs)==1: return vs[0]
    h=len(vs)//2; return (build(None,vs[:h]),build(None,vs[h:]))
def rnd(K,lo=-3,hi=3):
    return build(K,[Fr(random.randint(lo,hi)) for _ in range(K.dim)])
def eq(K,u,v): return all(a==b for a,b in zip(flatten(u),flatten(v)))

def left_alt_fail(K):
    """count failures of x(xy)=(xx)y on random pairs; return a witness if any."""
    fails=0; wit=None
    for _ in range(300):
        x=rnd(K); y=rnd(K)
        lhs=K.mul(x,K.mul(x,y)); rhs=K.mul(K.mul(x,x),y)
        if not eq(K,lhs,rhs):
            fails+=1
            if wit is None: wit=(x,y)
    return fails,wit

def right_alt_fail(K):
    fails=0
    for _ in range(300):
        x=rnd(K); y=rnd(K)
        lhs=K.mul(K.mul(y,x),x); rhs=K.mul(y,K.mul(x,x))
        if not eq(K,lhs,rhs): fails+=1
    return fails

def flex_fail(K):
    fails=0
    for _ in range(300):
        x=rnd(K); y=rnd(K)
        lhs=K.mul(K.mul(x,y),x); rhs=K.mul(x,K.mul(y,x))
        if not eq(K,lhs,rhs): fails+=1
    return fails

random.seed(1)
print("Algebra :  left-alt-fails  right-alt-fails  flex-fails   (out of 300)")
for name,K in (("C(=CD R)",C),("H(=CD C)",H),("O(=CD H)",O),("S(=CD O)",S)):
    lf,_=left_alt_fail(K); rf=right_alt_fail(K); ff=flex_fail(K)
    print(f"  {name:10s}:  {lf:6d}        {rf:6d}        {ff:6d}")

print()
print("=> S (=CD O, base O NON-assoc) should FAIL alternativity; O,H,C should PASS.")
print()

# Now: is left-alternativity DETECTABLE with x in the BASE image (x=iota(a)) only?
# In CD A, iota(a) = (a,0). left-alt with x=iota(a): iota(a)*(iota(a)*y) vs (iota(a)*iota(a))*y
def iota(K, a):  # a in base of K ; here K=S, base=O
    return (a, O.zero)
def test_base_leftalt(reps=300):
    fails=0; wit=None
    for _ in range(reps):
        a=rnd(O)          # base element (octonion)
        y=rnd(S)          # full sedenion
        x=iota(S,a)
        lhs=S.mul(x,S.mul(x,y)); rhs=S.mul(S.mul(x,x),y)
        if not eq(S,lhs,rhs):
            fails+=1
            if wit is None: wit=(a,y)
    return fails,wit
bf,_=test_base_leftalt()
print(f"S left-alt with x=iota(octonion): {bf}/300 fails (0 => base-only x can't detect)")

# left-alt with x = iota(a) + lam*e2 ?  e2 of S = (0, 1_O)
def test_mixed_leftalt(reps=400):
    fails=0; wit=None
    for _ in range(reps):
        a=rnd(O); 
        e2=(O.zero, O.one)
        x=S.add(iota(S,a), e2)   # iota(a)+e2
        y=rnd(S)
        lhs=S.mul(x,S.mul(x,y)); rhs=S.mul(S.mul(x,x),y)
        if not eq(S,lhs,rhs):
            fails+=1
            if wit is None: wit=(a,y)
    return fails,wit
mf,_=test_mixed_leftalt()
print(f"S left-alt with x=iota(a)+e2:     {mf}/400 fails")
