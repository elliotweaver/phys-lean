"""
N2d-hard-backward — probe the FULL extraction: does Nrm multiplicative on CD A force
A associative (hence, for A=CD B, B commutative)?

The classical Hurwitz/alternativity chain (what we'd build in Lean):
  mult ==> P1: bilin(xz,yz) = bilin(x,y) Nrm z
         ==> P2: bilin(xy,xz) = Nrm x bilin(y,z)
  From P1/P2 + bilin nondegenerate ==> the "scaling/conjugation" identities
         ==> A alternative ==> for a Cayley-Dickson double A=CD B, A alternative <=> B associative+comm
But we don't NEED full alternativity. The cleanest target for OUR setting:
  We want: mult on CD A  ==>  A associative.   (A = CD B; A assoc <=> B comm by the
  banked iota_iota_e2_assoc_iff applied to A=CD B's structure... wait A=CD B, A assoc
  <=> B commutative is iota_iota_e2_assoc_iff at base B.)

KEY simplification for Lean: we already have, BANKED,
  iota_iota_e2_assoc_iff (base B): (iota a * iota b)*e2 = iota a*(iota b * e2)  <=>  a*b=b*a.
So "A=CD B non-associative" is WITNESSED by the specific triple (iota p, iota q, e2) for
any non-commuting p,q. We need: mult on CD A ==> that triple associates ==> p*q=q*p.

So the real extraction is:  mult on CD A  ==>  A is associative ON THE WITNESS TRIPLE
(iota p, iota q, e2_A) for all p,q.  Probe: is there a SHORT identity expressing the
associator of three A-elements via bilin/Nrm composition identities that mult kills?

The Moufang/alternative route gives: in a composition algebra the associator [u,v,w] is
related to bilin and Nrm. Test numerically on A=O (NON-mult, base H... wait need A where
mult holds to see the identity, vs A=O where it should still hold as polarization).

Simplest decisive probe: verify the identity (TRUE in any *-ring with selfMul):
   bilin(u*v, w) + bilin(v, u_bar? ...)  -- find the linear identity that, combined with
   mult, forces the associator to vanish. We SEARCH for an identity of the form
     associator-related quantity = sum of (defect terms that vanish under mult).
"""
from fractions import Fraction as Fr
import itertools, random

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
    if isinstance(z,(Fr,int)): return [Fr(z)]
    return flatten(z[0])+flatten(z[1])
def build(vs):
    if len(vs)==1: return vs[0]
    h=len(vs)//2; return (build(vs[:h]),build(vs[h:]))

# Work on A=CD B with B=H so A=O, CD A = S. Nrm on S, want to detect: does mult fail
# EXACTLY because the witness triple (iota p, iota q, e2) in A=O fails to associate?
# We already KNOW mult fails on S (banked). The cleanest LEAN target avoids re-deriving
# the whole Hurwitz chain: instead show CONTRAPOSITIVE via the banked concrete failure +
# a GENERIC reduction. Let's test the cleanest generic statement we CAN prove:
#
# THEOREM (generic, provable): if Nrm is multiplicative on CD A then for all a,b:A,
#   (iota a * iota b) and the new gen e2 satisfy the associativity needed, i.e.
#   bilin detects (a*b - b*a). Probe whether mult ==> Nrm(comm-related elt)=0 ==> a*b=b*a.

A=O; CDA=S
def Nrm(z): return CDA.mul(z,CDA.star(z))[0]
def iotaA(a): return (a, A.zero)         # A -> CD A
e2A=(A.zero, A.one)                       # e2 of CD A
def mult_holds_pair(x,y):
    return all(p==q for p,q in zip(flatten(Nrm(CDA.mul(x,y))), flatten(A.mul(Nrm(x),Nrm(y)))))

# Among the WITNESS-shaped pairs that detect non-commutativity of base A=O:
# test pair x = iota(p)+ iota(q)*e2A type. Search for a 2-term x,y whose mult-failure
# is equivalent to p,q (in A=O) not commuting, for random NONcommuting p,q in O.
def randO():
    return build([Fr(random.randint(-2,2)) for _ in range(8)])
random.seed(1)
# count how often a witness pair detects: x=iota p + (iota q) e2A ; y = iota r + (iota s) e2A
# but we want the cleanest. Test: x=(iota p)*e2A, y = iota q  -> does mult fail iff [p,q]_O !=0?
fails_iff=0; tot=0
for _ in range(300):
    p,q=randO(),randO()
    x=CDA.mul(iotaA(p),e2A); y=iotaA(q)
    nz=not mult_holds_pair(x,y)
    noncomm=any(a!=b for a,b in zip(flatten(A.mul(p,q)),flatten(A.mul(q,p))))
    tot+=1
    if nz==noncomm: fails_iff+=1
print(f"x=(iota p)e2, y=iota q : mult-fails iff [p,q]_O != 0  on {fails_iff}/{tot}")

# also: x = iota p, y=(iota q)e2
f2=0
for _ in range(300):
    p,q=randO(),randO()
    x=iotaA(p); y=CDA.mul(iotaA(q),e2A)
    nz=not mult_holds_pair(x,y)
    noncomm=any(a!=b for a,b in zip(flatten(A.mul(p,q)),flatten(A.mul(q,p))))
    if nz==noncomm: f2+=1
print(f"x=iota p, y=(iota q)e2 : mult-fails iff [p,q]_O != 0  on {f2}/300")
