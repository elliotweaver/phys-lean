"""
N2d-hard-backward — EXACT symbolic norm-defect on CD A over a general base.

Compute D(x,y) := Nrm(x*y) - Nrm(x)*Nrm(y) for x=(p,q), y=(r,s) in CD A, with the
base A a FREE ASSOCIATIVE *-ring on generators p,q,r,s (and their stars P,Q,R,S),
NON-commutative.  Nrm on CD A : Nrm(z) = z.re*star z.re + star z.im * z.im  (in A).

Goal: get the EXACT defect polynomial in A, and express it via base COMMUTATORS
[x,y]=xy-yx.  This reveals what obstruction actually drives the loss and whether a
clean witness/identity closes the backward direction.

CD product: (a,b)(c,d) = (a c - star d * b, d a + b star c).
star(a,b) = (star a, -b).
"""
from collections import defaultdict

# Free associative *-ring on p,q,r,s ; star: p<->P etc, reverses order.
STAR={}
for x in 'pqrs': STAR[x]=x.upper(); STAR[x.upper()]=x
def E(d): return {m:v for m,v in d.items() if v}
def add(*xs):
    R=defaultdict(int)
    for x in xs:
        for m,v in x.items(): R[m]+=v
    return E(dict(R))
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def mul(x,y):
    R=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items(): R[mx+my]+=cx*cy
    return E(dict(R))
def star(x):
    R=defaultdict(int)
    for m,c in x.items():
        R[''.join(STAR[s] for s in reversed(m))]+=c
    return E(dict(R))
def g(s): return {s:1}
Z={}
p,q,r,s = g('p'),g('q'),g('r'),g('s')

# CD A over associative base
def cmul(z,w):
    a,b=z;c,d=w
    return (sub(mul(a,c), mul(star(d),b)), add(mul(d,a), mul(b,star(c))))
def cstar(z): return (star(z[0]), neg(z[1]))
def Nrm(z):
    # z.re*star z.re + star(z.im)*z.im
    a,b=z
    return add(mul(a,star(a)), mul(star(b),b))

x=(p,q); y=(r,s)
xy=cmul(x,y)
D=sub(Nrm(xy), mul(Nrm(x),Nrm(y)))

def fmt(x):
    if not E(x): return '0'
    return ' '.join(f'{c:+d}{m if m else "1"}' for m,c in
                    sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))
print("Nrm(x) =", fmt(Nrm(x)))
print("Nrm(y) =", fmt(Nrm(y)))
print()
print("DEFECT D = Nrm(xy) - Nrm(x)Nrm(y)  over a general ASSOCIATIVE base:")
print("  ", fmt(D))
print(f"  ({len(E(D))} terms)")
print()
# Try to express D as a sum of commutator-driven terms. A defect that vanishes when
# the base is commutative should be a combination of [.,.] commutators.
# Check: set base commutative (collapse order) -> does D vanish?
def commutative_image(x):
    R=defaultdict(int)
    for m,c in x.items():
        key=tuple(sorted(m))
        R[key]+=c
    return E(dict(R))
print("D under base-commutative collapse:", fmt({''.join(k):v for k,v in commutative_image(D).items()}) or "0")
print()
# Now over a general associative base it's NOT commutative; the cascade base before
# the stop is associative-noncommutative (H) and Nrm STILL multiplicative there
# (banked Nrm_mul_of_doubled_base). So D must VANISH for base=H. Confirm associative
# base alone is NOT enough to kill D (need the doubling structure) -- i.e. D != 0 here.
