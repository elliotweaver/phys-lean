"""
Express each H_3 Jordan-defect entry (zero diagonals) as an explicit linear
combination of ASSOCIATORS [a,b,c]=(ab)c-a(bc) of the entry-letters, and verify
it reduces to 0 under the ALTERNATING relations (the moat lemma set).

This tells us EXACTLY which alternative-law instances the H_3 identity consumes,
and how many — to size the moat (alternativity) Lean proof vs the brute route.
"""
from fractions import Fraction as F
from collections import defaultdict

# ---- free non-associative algebra: monomial = leaf str or (l,r) tuple ----
def leaf(n): return {n: F(1)}
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}

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

# ---- reduce a monomial-tree of 3 leaves into assoc-normal form ----
# We only need: every entry is a sum of DEGREE-3 monomials (3 leaves) when
# diagonals are 0? check the degree distribution first.
def leaves(m):
    if isinstance(m,str): return (m,)
    return leaves(m[0])+leaves(m[1])

reg('p','pc'); reg('q','qc'); reg('r','rc')
reg('s','sc'); reg('t','tc'); reg('u','uc')
def herm3(o01,o02,o12):
    return [[dict(ZERO),o01,o02],
            [star(o01),dict(ZERO),o12],
            [star(o02),star(o12),dict(ZERO)]]
A=herm3(leaf('p'),leaf('q'),leaf('r'))
B=herm3(leaf('s'),leaf('t'),leaf('u'))
D=jdef(A,B)

# degree distribution
for i in range(3):
    for j in range(3):
        E=D[i][j]
        if not E: continue
        degs=defaultdict(int)
        for m in E: degs[len(leaves(m))]+=1
        print(f"entry({i},{j}): {len(E)} terms, degrees={dict(degs)}")

# For a degree-3 entry, express in assoc form: each pair of monomials with the
# same leaf-seq differing by association is an associator. Count distinct
# leaf-seqs per entry (each contributes an associator family).
print("\n--- leaf-seq multiplicity per entry (each = one associator to kill) ---")
for i in range(3):
    for j in range(3):
        E=D[i][j]
        if not E: continue
        groups=defaultdict(list)
        for m,v in E.items(): groups[leaves(m)].append((m,v))
        # an alternating associator kills a leaf-seq group iff within the group
        # the two associations (ab)c and a(bc) appear with opposite coeff AND
        # the leaf-seq has a repeat or can be antisymmetrized to 0.
        multi=[k for k,g in groups.items() if len(g)>1]
        print(f"entry({i},{j}): {len(groups)} leaf-seqs, {len(multi)} have both associations")
