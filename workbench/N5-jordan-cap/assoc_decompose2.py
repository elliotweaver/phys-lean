"""
Explicit associator decomposition of each H_3 Jordan-defect entry (real central
diagonals, octonion off-diagonals), so we can write the alternativity-route Lean
proof: show each entry = sum of associators that vanish by the alternating laws.

We reduce in the FREE alternative *-algebra: model octonion entries as free leaves,
real diagonals as a CENTRAL commuting symbol. Then rewrite every degree-4 monomial
into a canonical fully-LEFT-associated normal form modulo associators, tracking the
associator remainder, and check the remainder is killed by:
  - alt repeats: [x,x,y]=[x,y,y]=[x,y,x]=0
  - antisymmetry: [x,y,z] = -[y,x,z] = -[x,z,y]
"""
from fractions import Fraction as F
from collections import defaultdict

def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
def leaf(n): return {n:F(1)}

CONJ={}
def reg(g,gc): CONJ[g]=gc; CONJ[gc]=g
def star_mon(m):
    if isinstance(m,str): return CONJ[m]
    l,r=m; return (star_mon(r),star_mon(l))
def star(x): return {star_mon(m):v for m,v in x.items()}

ZERO={}
def mzero(n): return [[dict(ZERO) for _ in range(n)] for _ in range(n)]
def madd(A,B):
    n=len(A); return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mzero(n)
    for i in range(n):
        for j in range(n):
            s=dict(ZERO)
            for k in range(n): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))

def leaves(m):
    if isinstance(m,str): return (m,)
    return leaves(m[0])+leaves(m[1])

# real central diagonals: model as symbols that COMMUTE and ASSOCIATE with all.
# To capture centrality in the free model, we treat diagonal symbols 'a0','a1','a2',
# 'b0','b1','b2' as self-conjugate central scalars. We'll mark them and, in the
# normal-form reducer, allow them to move freely (commute + associate).
REALS={'a0','a1','a2','b0','b1','b2'}
for r in REALS: CONJ[r]=r

reg('p','pc'); reg('q','qc'); reg('r','rc')   # A off-diagonals (0,1),(0,2),(1,2)
reg('s','sc'); reg('t','tc'); reg('u','uc')   # B off-diagonals

def herm3(d, o01,o02,o12):
    return [[leaf(d[0]), o01, o02],
            [star(o01), leaf(d[1]), o12],
            [star(o02), star(o12), leaf(d[2])]]

A=herm3(('a0','a1','a2'), leaf('p'),leaf('q'),leaf('r'))
B=herm3(('b0','b1','b2'), leaf('s'),leaf('t'),leaf('u'))
D=jdef(A,B)

# Normal form modulo associativity + centrality of reals:
# represent each monomial by (multiset-free) the SEQUENCE of non-real leaves in order,
# with real leaves pulled out as a commutative coefficient (since central).
def split_reals(m):
    """Return (real_multiset (sorted tuple), word of non-real leaves in left-to-right order)."""
    seq=leaves(m)
    reals=tuple(sorted(x for x in seq if x in REALS))
    word=tuple(x for x in seq if x not in REALS)
    return reals, word

# Associative+central collapse: group by (reals, word). In an ASSOCIATIVE algebra
# with central reals every group sums to 0 (since assoc+comm-of-reals makes the
# product depend only on (reals,word)). The RESIDUAL after this is the associator
# content -- but for the FULL associative collapse we just check it's 0.
print("=== associative+central collapse per entry (should be 0 in assoc algebra) ===")
allzero=True
for i in range(3):
    for j in range(3):
        E=D[i][j]
        g=defaultdict(F)
        for m,v in E.items():
            key=split_reals(m); g[key]+=v
        bad={k:v for k,v in g.items() if v!=0}
        if bad: allzero=False
        print(f"  entry({i},{j}): {len(E)} terms -> {len(bad)} nonzero (reals,word) groups")
print("associative+central collapse all zero:", allzero)
