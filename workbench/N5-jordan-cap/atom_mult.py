"""
Refine the H_3 Jordan-defect structure:
  (a) include REAL (central, scalar) diagonal entries on A and B,
  (b) for each entry of jdef, report the max number of DISTINCT octonion atoms
      (mod conjugation) that ever appear together in a single monomial,
  (c) confirm associative-collapse still gives 0 in every leaf-seq group,
  (d) report per-entry how many distinct octonion atoms participate overall.

If every monomial involves at most 2 distinct off-diagonal octonions, then
Artin's theorem (two-generated subalgebra of an alternative algebra is
associative) + diagonal centrality kills the whole defect from ALTERNATIVITY.
"""
from fractions import Fraction as F
from collections import defaultdict

def leafd(name): return {name: F(1)}
def scal(c, x): return {m: c*v for m, v in x.items()} if c != 0 else {}
def add(*xs):
    r = defaultdict(F)
    for x in xs:
        for m, v in x.items(): r[m] += v
    return {m: v for m, v in r.items() if v != 0}
def neg(x): return scal(F(-1), x)
def mul(x, y):
    r = defaultdict(F)
    for mx, cx in x.items():
        for my, cy in y.items(): r[(mx, my)] += cx*cy
    return {m: v for m, v in r.items() if v != 0}

CONJ = {}; REAL = set()
def reg_pair(g, gc): CONJ[g]=gc; CONJ[gc]=g
def reg_real(g): CONJ[g]=g; REAL.add(g)   # real/central: self-conjugate

def star_mon(m):
    if isinstance(m, str): return CONJ[m]
    l, r = m; return (star_mon(r), star_mon(l))
def star(x): return {star_mon(m): v for m, v in x.items()}

ZERO = {}
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

def base_atom(a):     # strip conjugation: map gc->g
    return a if a in REAL or not a.endswith('c') else a[:-1]

# off-diagonal octonions
reg_pair('p','pc'); reg_pair('q','qc'); reg_pair('r','rc')   # A: (0,1),(0,2),(1,2)
reg_pair('s','sc'); reg_pair('t','tc'); reg_pair('u','uc')   # B: (0,1),(0,2),(1,2)
# real diagonals
for g in ['a0','a1','a2','b0','b1','b2']: reg_real(g)

def herm3(d0,d1,d2,o01,o02,o12):
    return [[leafd(d0), o01, o02],
            [star(o01), leafd(d1), o12],
            [star(o02), star(o12), leafd(d2)]]

A = herm3('a0','a1','a2', leafd('p'), leafd('q'), leafd('r'))
B = herm3('b0','b1','b2', leafd('s'), leafd('t'), leafd('u'))

print("=== H_3 Jordan defect (WITH real diagonals), atom-multiplicity ===")
D = jdef(A,B)
global_max = 0
for i in range(3):
    for j in range(3):
        E = D[i][j]
        if not E: 
            print(f"  entry({i},{j}): identically 0 (free algebra)"); continue
        # associative collapse
        grp = defaultdict(F)
        for m,v in E.items(): grp[leaves(m)] += v
        badgrp = sum(1 for v in grp.values() if v!=0)
        # distinct octonion (non-real) atom multiplicity per monomial
        maxdist = 0
        atomset = set()
        for m in E:
            atoms = [base_atom(a) for a in leaves(m) if base_atom(a) not in REAL]
            ds = set(atoms); maxdist=max(maxdist,len(ds)); atomset|=ds
        global_max=max(global_max,maxdist)
        print(f"  entry({i},{j}): terms={len(E)} assoc-collapse-bad-groups={badgrp} "
              f"max-distinct-octonions-in-a-monomial={maxdist} octonions-involved={sorted(atomset)}")
print(f"GLOBAL max distinct octonions in any single monomial: {global_max}")
