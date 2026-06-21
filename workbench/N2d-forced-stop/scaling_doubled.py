"""
Test: does the LEFT SCALING LAW  x*(star x * y) = iota(Nrm x)*y  hold UNCONDITIONALLY
on CD(CD(CD B)) where the base CD(CD B) is associative (a double of a double)?

If YES on the doubled-double structure (the cascade's actual home up to O), then I can
prove the scaling law there the SAME way Nrm_mul_of_doubled_base was proved (direct
ext+ring over the concrete doubled structure), WITHOUT needing bilin nondegeneracy.

Recall: Nrm_mul_of_doubled_base proves Nrm mult on CD(CD B) by ext+ring. The scaling law
on CD A is an identity in A; if A = CD(CD B) it should likewise be ext+ring-provable.

Structure of cascade: Dbl Q = CD-with-trivial-star? Actually rung1 = Dbl, then H=CD(Dbl),
O=CD(H)=CD(CD(Dbl)), S=CD(O)=CD(CD(CD(Dbl))).
The scaling law on CD A with A = O = CD(CD(Dbl)) is what we need for the S-level reflection.
But the reflection assoc_of_scaling concludes "A associative" from "scaling law on CD A".
For the cascade we want: H (Nrm mult on CD A) => scaling law on CD A.

KEY QUESTION for closing the iff at the cascade's structure:
Does the scaling law on CD A hold whenever A is itself a double CD(CD B)?  i.e. is the
scaling law UNCONDITIONALLY true on CD(CD(CD B))?  (mirrors Nrm_mul_of_doubled_base)
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

C=CD(Rr); H=CD(C); O=CD(H); S=CD(O); SS=CD(S)
def flatten(z):
    if isinstance(z,Fr): return [z]
    return flatten(z[0])+flatten(z[1])
def build(vs):
    if len(vs)==1: return vs[0]
    h=len(vs)//2; return (build(vs[:h]),build(vs[h:]))
def rndK(K): return build([Fr(random.randint(-3,3)) for _ in range(K.dim)])
def eq(K,u,v): return all(x==y for x,y in zip(flatten(u),flatten(v)))
def iota(K,a): return (a, K.zero[0])
def Nrm(K,z): return K.mul(z,K.star(z))[0]
# scaling law on CD-of-base K (K=CD A), checking x*(star x*y)==iota(Nrm x)*y
def scaling_holds(K, T=300):
    c=0
    for _ in range(T):
        x=rndK(K); y=rndK(K)
        lhs=K.mul(x, K.mul(K.star(x), y))
        rhs=K.mul(iota(K, Nrm(K,x)), y)
        if not eq(K, lhs, rhs): c+=1
    return c

random.seed(909)
print("Scaling law  x*(star x*y) = iota(Nrm x)*y  on each rung (CD A, A = base):")
print(f"  C  = CD(R),  base R  assoc-comm     : fails {scaling_holds(C)}/300")
print(f"  H  = CD(C),  base C  assoc-comm     : fails {scaling_holds(H)}/300")
print(f"  O  = CD(H),  base H  assoc-noncomm  : fails {scaling_holds(O)}/300")
print(f"  S  = CD(O),  base O  NON-assoc      : fails {scaling_holds(S)}/300")
print(f"  SS = CD(S),  base S  NON-assoc      : fails {scaling_holds(SS)}/300")
print()
print("So scaling law on CD A holds  iff  A associative (matches assoc_of_scaling direction).")
print("For the forward (H => scaling on CD A): it holds on C,H,O (A=R,C,H assoc) automatically.")
print("The point: on O=CD(H), base H=CD(C)=CD(CD R) is a DOUBLE-of-DOUBLE -> scaling holds")
print("UNCONDITIONALLY (no H hypothesis needed), provable by ext+ring like Nrm_mul_of_doubled_base.")
