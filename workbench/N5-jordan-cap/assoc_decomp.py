"""
Decompose each H_3 Jordan-defect entry into a linear combination of ASSOCIATORS.

Method: in the free non-associative algebra, the difference (tree - leftassoc(tree))
is a sum of associators [x,y,z]=(xy)z-x(yz). Since each entry is associatively 0
(net leftassoc=0), entry == entry - leftassoc(entry) == sum of associators.

We compute, per entry, the multiset of associator "types" keyed by the
(base-atom) leaf-triple of each associator, to find the minimal set of octonion
associator identities the proof needs.
"""
from fractions import Fraction as F
from collections import defaultdict

def leafd(name): return {name: F(1)}
def add(*xs):
    r = defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}

CONJ={}; REAL=set()
def reg_pair(g,gc): CONJ[g]=gc; CONJ[gc]=g
def reg_real(g): CONJ[g]=g; REAL.add(g)
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
def base(a): return a if a in REAL or not a.endswith('c') else a[:-1]

# rewrite a monomial-tree to leftassoc canonical (a*b*c*...) and collect associators.
# Represent the "value" as dict over monomials; we directly compute
# entry - leftassoc(entry) by expanding each tree.
# Simpler: associator content via recursive normalization tracking defects is heavy.
# Instead: classify each MONOMIAL by its leaf-sequence; within a leaf-seq group the
# coeffs sum to 0, so the group is a combination of "shape differences" = associators.
# We report, per leaf-seq, the distinct base-atom multiset and #shapes, to gauge the
# associator identities involved.

reg_pair('p','pc'); reg_pair('q','qc'); reg_pair('r','rc')
reg_pair('s','sc'); reg_pair('t','tc'); reg_pair('u','uc')
for g in ['a0','a1','a2','b0','b1','b2']: reg_real(g)

def herm3(d0,d1,d2,o01,o02,o12):
    return [[leafd(d0),o01,o02],
            [star(o01),leafd(d1),o12],
            [star(o02),star(o12),leafd(d2)]]
A=herm3('a0','a1','a2',leafd('p'),leafd('q'),leafd('r'))
B=herm3('b0','b1','b2',leafd('s'),leafd('t'),leafd('u'))
D=jdef(A,B)

print("=== per-entry leaf-seq groups: base-atom multiset & #distinct shapes ===")
all_triples=set()
for i in range(3):
    for j in range(3):
        E=D[i][j]
        if not E: continue
        grp=defaultdict(list)
        for m,v in E.items(): grp[leaves(m)].append((m,v))
        nontrivial=0
        for ls,items in grp.items():
            shapes={m for m,_ in items}
            bases=tuple(sorted(base(a) for a in ls if base(a) not in REAL))
            if len(shapes)>1:   # genuinely needs associativity to cancel
                nontrivial+=1
                all_triples.add(bases)
        print(f"  entry({i},{j}): groups={len(grp)} nontrivial(>1 shape)={nontrivial}")
print(f"\nDistinct base-octonion multisets appearing in nontrivial (associator) groups:")
for t in sorted(all_triples):
    print("   ", t)
print(f"total distinct octonion-multiset types needing associativity: {len(all_triples)}")
# how many distinct octonions in each
maxd=max(len(set(t)) for t in all_triples)
print("max distinct octonions in such a multiset:", maxd)
