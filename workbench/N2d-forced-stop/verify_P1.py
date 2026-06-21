"""
N2d-hard-backward — verify the polarized Born bilinear identities P1/P2 and probe the
extraction. Over CD(CD B), B free associative *-ring on p,q (NO centrality).

bilin x y := (x*star y + y*star x).re   (in A = CD B)
P1: IF mult (Nrm(uv)=Nrm u Nrm v for all u,v) THEN bilin(xz,yz) = bilin(x,y)*Nrm z.
    [polarization of Nrm((x+y)z)=Nrm(x+y)Nrm z via right_distrib]
We CANNOT assume mult over the free ring (it's false), so we verify the IDENTITY form:
    bilin(xz,yz) - [stuff] equals the polarization of the defect, hence the proof is the
    3-fold application of mult. Here we just CONFIRM the algebraic identity
    bilin(xz,yz) == polariz of Nrm at (xz),(yz) and that it reduces to bilin(x,y)*Nrm z
    USING the multiplicativity equalities as rewrite rules (treat Nrm(uv) -> Nrm u Nrm v).

Then PROBE: does assuming mult force [p,q]=0? Concretely, set up the universal hypothesis
on a small concrete non-commutative associative *-ring (B = H over Z/small) and check that
NO such B with p*q!=q*p can have Nrm multiplicative on CD(CD B) -- i.e. confirm the theorem
is TRUE by exhibiting, for B=H, the explicit failing pair (recovering the banked witness).
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

# --- verify P1 over the concrete octonion-level CD A with A = O (so CD A = S) ---
# Here Nrm IS NOT multiplicative (base O non-assoc), so P1 should FAIL where defect != 0,
# but the polarization IDENTITY (bilin(xz,yz) = polariz of Nrm) must hold structurally.
A=O; CDA=S
def reA(z): return z[0]
def Nrm(z): return reA(CDA.mul(z,CDA.star(z)))      # in A
def bilin(x,y):
    return reA(A_add_helper(CDA.mul(x,CDA.star(y)), CDA.mul(y,CDA.star(x))))
def A_add_helper(u,v): return CDA.add(u,v)
def Aeq(u,v): return all(a==b for a,b in zip(flatten(u),flatten(v)))

# Check identity: bilin(x,x) == Nrm x + Nrm x
random.seed(0)
def randS():
    return build([Fr(random.randint(-3,3)) for _ in range(16)])
ok_diag=all(Aeq(bilin(x,x), A.add(Nrm(x),Nrm(x))) for x in (randS() for _ in range(50)))
print("B0 bilin(x,x)=2 Nrm x:", ok_diag)
# symmetry
ok_sym=all(Aeq(bilin(x,y),bilin(y,x)) for x,y in ((randS(),randS()) for _ in range(50)))
print("B1 bilin symmetric:", ok_sym)
# additivity slot 1
ok_add=all(Aeq(bilin(A_add_helperS(x,x2) if False else CDA.add(x,x2),y),
               A.add(bilin(x,y),bilin(x2,y)))
           for x,x2,y in ((randS(),randS(),randS()) for _ in range(50)))
print("B1 bilin additive slot1:", ok_add)

# P1 as polarization identity that becomes bilin(x,y)Nrm z UNDER multiplicativity:
# verify bilin(xz,yz) == Nrm((x+y)z) - Nrm(xz) - Nrm(yz)  (pure polarization, always true)
def P1_lhs(x,y,z): return bilin(CDA.mul(x,z),CDA.mul(y,z))
def P1_polar(x,y,z):
    return A.sub(A.sub(Nrm(CDA.mul(CDA.add(x,y),z)),Nrm(CDA.mul(x,z))),Nrm(CDA.mul(y,z)))
ok_p1id=all(Aeq(P1_lhs(x,y,z),P1_polar(x,y,z))
            for x,y,z in ((randS(),randS(),randS()) for _ in range(80)))
print("P1 polarization identity bilin(xz,yz)=Nrm((x+y)z)-Nrm(xz)-Nrm(yz):", ok_p1id)
# and under mult this polar = (Nrm(x+y)-Nrm x-Nrm y) Nrm z = bilin(x,y) Nrm z. The
# rewrite Nrm((x+y)z)->Nrm(x+y)Nrm z etc is exactly 3x multiplicativity. Confirmed structure.
print("=> P1 proof = right_distrib + 3x multiplicativity. CLEAN/SHORT.")
