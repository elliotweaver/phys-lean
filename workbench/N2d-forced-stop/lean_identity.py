"""
N2d-hard — EXTRACT THE EXACT LEAN IDENTITY for the easy direction.

Free ASSOCIATIVE *-ring A (monomials = flat tuples of (gen,conj) factors; products
flatten => associativity is built in). star is the anti-automorphism with star(g_i)
a fresh generator gc_i (NO imaginary assumption — general involutive star).

D(x,y) = Nrm(xy) - Nrm(x)Nrm(y), x=(a,b) y=(c,d).
Nrm(z)= z.re*star(z.re) + star(z.im)*z.im.
CD product (a,b)(c,d) = (a c - star(d) b, d a + b star(c)).

Goal: show D, under associativity, is a sum of terms each of which is a COMMUTATOR
of a self-overlap (u*u or u u*) with another element — so that imposing
'self-overlaps are central' kills D. Print the residual and factor it.
"""
from collections import defaultdict

# monomials: tuple of factors; factor = (k, conj_bool). ONE = ()
def gen(k): return {((k,False),):1}
def aadd(x,y):
    r=defaultdict(int,x)
    for m,c in y.items():
        r[m]+=c
        if r[m]==0: del r[m]
    return dict(r)
def aneg(x): return {m:-c for m,c in x.items()}
def asub(x,y): return aadd(x,aneg(y))
def amul(x,y):
    r=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items():
            key=mx+my            # flat concat => associative
            r[key]+=cx*cy
            if r[key]==0: del r[key]
    return dict(r)
def star_fac(f): return (f[0], not f[1])
def astar(x):
    r=defaultdict(int)
    for m,c in x.items():
        sm=tuple(star_fac(f) for f in reversed(m))
        r[sm]+=c
        if r[sm]==0: del r[sm]
    return dict(r)
def cd_mul(z,w):
    a,b=z;c,d=w
    return (asub(amul(a,c),amul(astar(d),b)), aadd(amul(d,a),amul(b,astar(c))))
def Nrm(z):
    a,b=z; return aadd(amul(a,astar(a)), amul(astar(b),b))
def D_of(x,y): return asub(Nrm(cd_mul(x,y)), amul(Nrm(x),Nrm(y)))

a,b,c,d = gen(0),gen(1),gen(2),gen(3)
D = D_of((a,b),(c,d))
print(f"D term count (associative, flat): {len(D)}")
print("Terms:")
def fmt(m): return '·'.join(f"{'*' if f[1] else ''}{chr(97+f[0])}" for f in m) if m else "1"
for m,co in sorted(D.items(), key=lambda kv: str(kv[0])):
    print(f"   {co:+d} {fmt(m)}")

# Now: self-overlap centrality. The self-overlaps appearing are b*b (=star(b) b),
# d*d, etc. Impose: for any generator u, u*u and u u* are CENTRAL (commute with all),
# AND u*u = u u* (symmetric). Model by declaring the scalar so(u) and replacing the
# adjacent pair (u*,u) or (u,u*) by central scalar 'so_u', then check D collapses.
#
# Concretely the 12 residual terms (from identity.py) are commutators
# [self-overlap, x]. Let's verify: collect terms, pair them as s*y - y*s.
print()
# Build the centrality reduction: a monomial containing a contiguous (gen u*)(gen u)
# or (gen u)(gen u*) pair can have that pair pulled to the front (central). Then
# two monomials differing only by the POSITION of a self-overlap pair are equal.
SOPAIRS = set()
for k in range(4):
    SOPAIRS.add(((k,True),(k,False)))   # u* u
    SOPAIRS.add(((k,False),(k,True)))   # u u*
def canon_central(m):
    """pull any self-overlap pair (u*u or u u*) to the FRONT; both forms => same scalar
       so also identify u*u ~ u u* by sorting pair to (u*,u)."""
    m=list(m)
    pulled=[]
    changed=True
    while changed:
        changed=False
        for i in range(len(m)-1):
            if (m[i],m[i+1]) in SOPAIRS:
                # extract, normalize to (u*,u)
                k=m[i][0]
                pulled.append(((k,True),(k,False)))
                del m[i:i+2]
                changed=True
                break
    pulled.sort()
    return (tuple(pulled), tuple(m))
red=defaultdict(int)
for m,co in D.items():
    red[canon_central(m)]+=co
    if red[canon_central(m)]==0: del red[canon_central(m)]
print("D after imposing self-overlap centrality (pairs central & u*u=u u*):")
if not red:
    print("   == 0   ✅  => associativity + central self-overlaps  ⟹  Nrm multiplicative")
else:
    print(f"   {len(red)} terms remain:")
    for (p,m),co in red.items():
        print(f"   {co:+d}  SO{p} · {fmt(m)}")
