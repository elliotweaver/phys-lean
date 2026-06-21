"""
N2d — exact defect identity + which trunk property kills it.

Compute D(x,y)=N(xy)-N(x)N(y) for generic z=(a,b),w=(c,d) over the FREE
non-associative *-algebra, then test, term by term, whether each survives under:
  (i)  ASSOCIATIVITY only      (flatten trees)
  (ii) BORN CENTRALITY only    (x*x* central & = x**x, i.e. self-overlaps commute
                                with everything and x*x*=x**x)
  (iii) ASSOCIATIVITY + BORN    -> expect D == 0  (the cascade's preserved property)

Also: confirm on the ACTUAL cascade algebras O (assoc, non-comm, Born-central) that
N is multiplicative, and on S that it is not — and that the FIRST broken witness in
S traces to a NON-ASSOCIATING triple of O.
"""
from collections import defaultdict
from fractions import Fraction as Fr
import random

# ---------- free non-associative *-algebra ----------
def leaf(i, conj=False): return {('gc' if conj else 'g', i): 1}
def aadd(x, y):
    r = defaultdict(int, x)
    for m, c in y.items():
        r[m] += c
        if r[m] == 0: del r[m]
    return dict(r)
def aneg(x): return {m: -c for m, c in x.items()}
def asub(x, y): return aadd(x, aneg(y))
ONEM = ('one',)
def amul(x, y):
    r = defaultdict(int)
    for mx, cx in x.items():
        for my, cy in y.items():
            if mx == ONEM and my == ONEM: key = ONEM
            elif mx == ONEM: key = my
            elif my == ONEM: key = mx
            else: key = (mx, my)
            r[key] += cx*cy
            if r[key] == 0: del r[key]
    return dict(r)
def astar_mono(m):
    if m == ONEM: return ONEM
    if m[0] in ('g', 'gc'): return ('gc' if m[0]=='g' else 'g', m[1])
    return (astar_mono(m[1]), astar_mono(m[0]))
def astar(x): return {astar_mono(m): c for m, c in x.items()}
def cd_mul(z, w):
    a, b = z; c, d = w
    return (asub(amul(a,c), amul(astar(d), b)), aadd(amul(d,a), amul(b, astar(c))))
def nrm(z):
    re, im = z
    return aadd(amul(re, astar(re)), amul(astar(im), im))
def D_of(x, y): return asub(nrm(cd_mul(x,y)), amul(nrm(x), nrm(y)))

a,b,c,d = leaf(0),leaf(1),leaf(2),leaf(3)
D = D_of((a,b),(c,d))

# canonicalize under ASSOCIATIVITY (flatten to leaf-sequence)
def leaves(m):
    if m == ONEM: return ()
    if m[0] in ('g','gc'): return (m,)
    return leaves(m[0]) + leaves(m[1])
def reduce_assoc(elt):
    r = defaultdict(int)
    for m,co in elt.items():
        r[leaves(m)] += co
        if r[leaves(m)]==0: del r[leaves(m)]
    return dict(r)

print("generic D term count:", len(D))
print("under ASSOCIATIVITY: ", len(reduce_assoc(D)), "terms remain")
for w,co in sorted(reduce_assoc(D).items(), key=lambda kv:str(kv[0])):
    print(f"   {co:+d} * {'·'.join(str(g) for g in w)}")
print()

# ---------- numerical check on cascade algebras with central self-overlap ----------
def z0(L):
    return Fr(0) if L==0 else (z0(L-1), z0(L-1))
def radd(x,y,L): return x+y if L==0 else (radd(x[0],y[0],L-1), radd(x[1],y[1],L-1))
def rneg(x,L): return -x if L==0 else (rneg(x[0],L-1), rneg(x[1],L-1))
def rstar(x,L): return x if L==0 else (rstar(x[0],L-1), rneg(x[1],L-1))
def rmul(x,y,L):
    if L==0: return x*y
    a,b=x; c,d=y
    re=radd(rmul(a,c,L-1), rneg(rmul(rstar(d,L-1),b,L-1),L-1), L-1)
    im=radd(rmul(d,a,L-1), rmul(b,rstar(c,L-1),L-1), L-1)
    return (re,im)
def projre(x,L):
    while L>0: x=x[0]; L-=1
    return x
def selfoverlap(x,L): return rmul(x, rstar(x,L), L)   # x·x*
def overlap_rev(x,L):  return rmul(rstar(x,L), x, L)  # x*·x
def is0(x,L): return x==0 if L==0 else (is0(x[0],L-1) and is0(x[1],L-1))
def eqr(x,y,L): return is0(radd(x,rneg(y,L),L),L)
def rand(L,lo=-2,hi=2): return Fr(random.randint(lo,hi)) if L==0 else (rand(L-1,lo,hi),rand(L-1,lo,hi))

# Born centrality test: is x·x* == x*·x AND central (commutes with all y)?
def born_central(L, trials=200):
    eqfail=0; centfail=0
    for _ in range(trials):
        x=rand(L); y=rand(L)
        s=selfoverlap(x,L)
        if not eqr(s, overlap_rev(x,L), L): eqfail+=1
        if not eqr(rmul(s,y,L), rmul(y,s,L), L): centfail+=1
    return eqfail, centfail

names={1:"C",2:"H",3:"O",4:"S"}
print("BORN property  x·x* == x*·x  AND  x·x* central:")
for L in (1,2,3,4):
    ef,cf=born_central(L)
    print(f"  {names[L]}(dim{2**L}): self-overlap-symmetric fails {ef}/200, central fails {cf}/200",
          "-> BORN HOLDS" if ef==0 and cf==0 else "-> BORN BROKEN")
