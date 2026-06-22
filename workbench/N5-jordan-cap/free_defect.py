"""
FREE non-associative *-algebra computation of the H_3 Jordan defect.

Goal: expose the ASSOCIATOR structure of jdef for 3x3 Hermitian matrices over a
non-associative *-algebra, so we can read off the MINIMAL alternative-law lemma
set the H_3 Jordan identity actually needs (the moat: H_3 is Jordan BECAUSE the
coordinate algebra is alternative, not associative).

Model: elements = dict {monomial-tree -> Fraction coeff}.
  - a monomial-tree is either a leaf 'name' (str) or a tuple (left, right).
  - star is the conjugation anti-automorphism: star(leaf)=conjugate atom,
    star((l,r)) = (star r, star l).
We compute jdef A B for Hermitian A,B (off-diagonal octonions + their conjugates)
and inspect the result grouped by LEAF-SEQUENCE (so we can see the associator
residual: in any ASSOCIATIVE algebra each leaf-sequence group sums to 0).
"""
from fractions import Fraction as F
from collections import defaultdict
import itertools

# ---------- free non-associative algebra over Q ----------
def leaf(name): return {name: F(1)}
def scal(c, x): return {m: c*v for m, v in x.items()} if c != 0 else {}
def add(*xs):
    r = defaultdict(F)
    for x in xs:
        for m, v in x.items():
            r[m] += v
    return {m: v for m, v in r.items() if v != 0}
def neg(x): return scal(F(-1), x)
def sub(x, y): return add(x, neg(y))
def mul(x, y):
    r = defaultdict(F)
    for mx, cx in x.items():
        for my, cy in y.items():
            r[(mx, my)] += cx*cy
    return {m: v for m, v in r.items() if v != 0}

# conjugation atom table: each octonion generator g has a conjugate gc.
CONJ = {}
def reg_pair(g, gc):
    CONJ[g] = gc; CONJ[gc] = g

def star_mon(m):
    if isinstance(m, str):
        return CONJ[m]
    l, r = m
    return (star_mon(r), star_mon(l))   # anti-automorphism
def star(x):
    return {star_mon(m): v for m, v in x.items()}

# ---------- matrices over the free algebra ----------
ZERO = {}
def mzero(n): return [[dict(ZERO) for _ in range(n)] for _ in range(n)]
def madd(A, B):
    n = len(A); return [[add(A[i][j], B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A, B):
    n = len(A); C = mzero(n)
    for i in range(n):
        for j in range(n):
            s = dict(ZERO)
            for k in range(n):
                s = add(s, mul(A[i][k], B[k][j]))
            C[i][j] = s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A, B): return madd(mmul(A, B), mmul(B, A))
def jdef(A, B):
    AA = jb(A, A)
    return madd(jb(jb(A, B), AA), mneg(jb(A, jb(B, AA))))

# ---------- leaf-sequence of a monomial (the associative collapse key) ----------
def leaves(m):
    if isinstance(m, str): return (m,)
    return leaves(m[0]) + leaves(m[1])

def collapse_check(E, label):
    """Group entries by leaf-sequence; each group must sum to 0 (associative identity)."""
    groups = defaultdict(F)
    for m, v in E.items():
        groups[leaves(m)] += v
    bad = {k: v for k, v in groups.items() if v != 0}
    print(f"  [{label}] terms={len(E)}  distinct leaf-seqs={len(groups)}  "
          f"NONZERO associative-collapse groups={len(bad)}")
    return bad

# ---------- build 3x3 Hermitian matrices (off-diagonal only, diagonals zero) ----------
# A off-diagonals: p=(0,1) q=(0,2) r=(1,2); conjugates pc,qc,rc.
reg_pair('p', 'pc'); reg_pair('q', 'qc'); reg_pair('r', 'rc')
# B off-diagonals: s,t,u with conjugates.
reg_pair('s', 'sc'); reg_pair('t', 'tc'); reg_pair('u', 'uc')

def herm3(o01, o02, o12):
    return [[dict(ZERO), o01, o02],
            [star(o01), dict(ZERO), o12],
            [star(o02), star(o12), dict(ZERO)]]

A = herm3(leaf('p'), leaf('q'), leaf('r'))
B = herm3(leaf('s'), leaf('t'), leaf('u'))

print("=== H_3 Jordan defect over FREE non-associative *-algebra (zero diagonals) ===")
D = jdef(A, B)
for i in range(3):
    for j in range(3):
        E = D[i][j]
        if E:
            bad = collapse_check(E, f"entry({i},{j})")

# total term count
total = sum(len(D[i][j]) for i in range(3) for j in range(3))
print(f"total free-algebra terms across all entries: {total}")
