"""
N2d-hard-backward — GO-FULL feasibility: can P1/P2 + structure CLOSE to base-comm?

We have (Lean-banked-able):
  Nrm_add, bilin (symm, biadditive), P1: bilin(xz,yz)=bilin(x,y)Nrm z,
                                     P2: bilin(zx,zy)=Nrm z bilin(x,y).
Target: H (Nrm mult on CD A) => for the cascade base A = CD B, B commutative.
Equivalent: H => A associative on (ia,ib,e2) triples => (banked iff) B commutative.

Classical Hurwitz uses P1/P2 to derive the SCALING law x(star x y)=Nrm(x) y, then
alternativity, then base associativity.  We test whether a SHORTER bilinear identity
closes it: evaluate, over CD A with A = CD B (B free assoc *-ring on p,q), the
quantity that H forces to zero and that equals (under injectivity) a base commutator.

Concretely test the SCALING defect under H. Over the cascade, H is FALSE when B
non-comm, so we can't "assume H" numerically. Instead we verify the IDENTITY that
under H would give 0, and check it equals a base-commutator-driven term:

  Define T(x,y) := bilin(x*?, ...) ... 

Better: directly test the classical chain element
  K(x,y,z) := bilin(x*y, z) - bilin(y, star x * z)   [the ADJOINT/associativity bridge]
Over CD A this is a PURE identity (no H). Question: is K identically 0 over CD A for
A associative, and NONZERO (surfacing base non-assoc) for A = CD B with B non-comm?
If K=0 always (even A non-assoc), it's a free lemma; if K surfaces non-assoc, it's the
obstruction carrier.
"""
from collections import defaultdict

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

# A = CD B  (B free assoc *-ring, non-comm)
aadd,aneg,asub,amul,astar,azero = mkCD(b_add,b_neg,b_sub,b_mul,b_star,Z)
def Are(z): return z[0]
def Nrm(z): return Are(amul(z,astar(z)))         # in B
def bilin(x,y): return Are(aadd(amul(x,astar(y)), amul(y,astar(x))))  # in B

def fmt1(x):
    if not E(x): return '0'
    return ' '.join(f'{c:+d}{"".join(m) if m else "1"}' for m,c in
                    sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))

# atoms in A = CD B
ip=(p,Z); iq=(q,Z); e2=(Z,oneB); one=(oneB,Z)
pool={'ip':ip,'iq':iq,'e2':e2,'1':one,'ipe2':amul(ip,e2),'iqe2':amul(iq,e2)}
keys=list(pool)

# K(x,y,z) := bilin(x*y, z) - bilin(y, star x * z)   [adjoint identity]
def K(x,y,z):
    return b_sub(bilin(amul(x,y),z), bilin(y, amul(astar(x),z)))
# K2: bilin(x*y,z) - bilin(x, z * star y)  (right adjoint)
def K2(x,y,z):
    return b_sub(bilin(amul(x,y),z), bilin(x, amul(z,astar(y))))

print("=== adjoint identity K(x,y,z)=bilin(xy,z)-bilin(y,star x * z) over A=CD B ===")
nzK=0; allzK=True
for X in keys:
 for Y in keys:
  for Zk in keys:
    v=K(pool[X],pool[Y],pool[Zk])
    if E(v):
        nzK+=1; allzK=False
        if nzK<=8: print(f"  K({X},{Y},{Zk}) = {fmt1(v)}")
print(f"  nonzero K instances: {nzK}  (allzero={allzK})")
print()
print("=== right adjoint K2(x,y,z)=bilin(xy,z)-bilin(x, z*star y) ===")
nzK2=0
for X in keys:
 for Y in keys:
  for Zk in keys:
    v=K2(pool[X],pool[Y],pool[Zk])
    if E(v):
        nzK2+=1
        if nzK2<=8: print(f"  K2({X},{Y},{Zk}) = {fmt1(v)}")
print(f"  nonzero K2 instances: {nzK2}")
