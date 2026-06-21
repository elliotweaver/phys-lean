"""
GO-FULL decision probe — does the Hurwitz chain CLOSE with a SHORT Lean-friendly
identity set?  We test over CD A with A = CD B (B free assoc *-ring p,q) whether the
following identities, which under H (Nrm mult) are forced, COMBINE to force the inner
e2-associator (== base commutator [p,q]) to vanish.

The classical chain:
  P1: bilin(xz,yz) = bilin(x,y) Nrm z
  P2: bilin(zx,zy) = Nrm z bilin(x,y)
  => scaling: x(star x y) = iota(Nrm x) y  AND  (y star x)x = y iota(Nrm x)
  => left/right alternativity
  => CD A alternative => A associative on (ia,ib,e2) => B commutative.

The HARD part for Lean is: scaling law from P1/P2 needs NONDEGENERACY of bilin
(an element annihilating all bilin(.,w) is 0).  Over a general *-ring this nondegeneracy
is FALSE (bilin can be degenerate), so the classical chain DOES NOT directly port --
it needs the specific CD structure.  We TEST: is bilin nondegenerate on CD(CD B)?
i.e. does bilin(u, w)=0 for all w force u=0?  If NO (degenerate), GO-FULL via classical
nondegeneracy is blocked => GO-DECOMPOSE is correct and the child must build the
CD-specific closing (not generic nondegeneracy).
"""
from collections import defaultdict
import itertools

STAR={'p':'P','q':'Q','P':'p','Q':'q'}
def E(d): return {m:v for m,v in d.items() if v}
def b_add(*xs):
    r=defaultdict(int)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return E(dict(r))
def b_neg(x): return {m:-v for m,v in x.items()}
def b_sub(x,y): return b_add(x,b_neg(y))
def b_mul(x,y):
    r=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items(): r[mx+my]+=cx*cy
    return E(dict(r))
def b_star(x):
    r=defaultdict(int)
    for m,c in x.items():
        r[tuple(STAR[s] for s in reversed(m))]+=c
    return E(dict(r))
Z={}; oneB={():1}
def g(s): return {(s,):1}
p,q=g('p'),g('q')

def mkCD(add,neg,sub,mul,star,zero):
    def cadd(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
    def cneg(z): return (neg(z[0]),neg(z[1]))
    def csub(z,w): return cadd(z,cneg(w))
    def cmul(z,w):
        a,b=z;c,d=w
        return (sub(mul(a,c),mul(star(d),b)), add(mul(d,a),mul(b,star(c))))
    def cstar(z): return (star(z[0]),neg(z[1]))
    return cadd,cneg,csub,cmul,cstar,(zero,zero)
L1=mkCD(b_add,b_neg,b_sub,b_mul,b_star,Z)
L2=mkCD(L1[0],L1[1],L1[2],L1[3],L1[4],L1[5])
c1add,_,_,c1mul,c1star,c1zero=L1
c2add,c2neg,c2sub,c2mul,c2star,c2zero=L2
def Nrm(u): return c2mul(u,c2star(u))[0]
def bilin(u,w): return c2add(c2mul(u,c2star(w)), c2mul(w,c2star(u)))[0]  # in CD B
def iszB(z): return (not E(z[0])) and (not E(z[1]))   # CD B element is (B,B)
def isz2(z): return iszB(z[0]) and iszB(z[1])         # CD(CD B) is (CDB,CDB)

# basis-ish probe set of CD(CD B)
ip=(p,Z); iq=(q,Z); e2_1=(Z,oneB); one1=(oneB,Z)
def iA(a): return (a,c1zero)
E2=(c1zero,one1)
atomsA=[ip,iq,e2_1,one1,c1mul(ip,e2_1),c1mul(iq,e2_1)]
probe=[]
for a in atomsA:
    probe.append(iA(a)); probe.append(c2mul(iA(a),E2))
probe.append(E2)

# Is bilin DEGENERATE? find u != 0 with bilin(u,w)=0 for all probe w.
# (numerically necessary condition for nondegeneracy failure)
def fmt(z):
    def f1(x): 
        return '0' if not E(x) else ' '.join(f'{c:+d}{"".join(m) or "1"}' for m,c in sorted(x.items()))
    return f'[{f1(z[0])};{f1(z[1])}]'

print("Testing bilin nondegeneracy on CD(CD B) probe set...")
deg=[]
for u in probe:
    if isz2(u): continue
    if all(iszB(bilin(u,w)) for w in probe):
        deg.append(u)
print(f"probe elements u!=0 with bilin(u,.)=0 on whole probe set: {len(deg)}")
for u in deg[:6]: print("  degenerate u:", fmt(u))
print()
print("=> If degenerate elements exist, generic-nondegeneracy classical chain is BLOCKED;")
print("   GO-DECOMPOSE: child builds the CD-specific closing, not generic nondegeneracy.")
print()
# Also: is bilin nondeg when restricted to the BASE image iota_A(CD B)? The scaling law
# only needs bilin nondeg enough to cancel a base factor. Test bilin on iota-images.
baseimg=[iA(a) for a in atomsA]
degb=[]
for u in baseimg:
    if isz2(u): continue
    if all(iszB(bilin(u,w)) for w in probe):
        degb.append(u)
print(f"base-image u!=0 with bilin(u,.)=0 on probe: {len(degb)}")
