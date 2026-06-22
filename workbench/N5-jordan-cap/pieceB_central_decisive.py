#!/usr/bin/env python3
# run67 DECISIVE TEST: does pieceB  jdef(D+X, Y) - jdef(X, Y) = 0  vanish using ONLY
#   - D entries REAL/CENTRAL (commute + associate with everything)
#   - X, Y entries FREE NON-ASSOCIATIVE octonion symbols (NO alternativity imposed)
#   - X, Y zero-diagonal HERMITIAN (M_ji = star M_ij, M_ii = 0)
# If ALL 9 entries vanish -> pieceB closes by D-CENTRALITY/NUCLEARITY ALONE (clean abstract
# lemma, like gmat_drop) -- NO octonion alternativity needed. If nonzero -> needs alt.
#
# Entry-algebra element: dict { (dmultiset, octree) : rational_coeff }
#   dmultiset = sorted tuple of central d-symbols (commutative coefficient)
#   octree    = None (pure scalar) | base-symbol str | ('*', octree, octree)  (free nonassoc)
# Central d's are kept as a separate COMMUTATIVE multiset coefficient => d associates+commutes
# with everything automatically. X,Y trees multiply by the FREE nonassoc product ('*', a, b).

from fractions import Fraction
from collections import defaultdict

def emul(A, B):
    r = defaultdict(Fraction)
    for (dA, tA), cA in A.items():
        for (dB, tB), cB in B.items():
            dm = tuple(sorted(dA + dB))
            if tA is None:
                t = tB
            elif tB is None:
                t = tA
            else:
                t = ('*', tA, tB)
            r[(dm, t)] += cA * cB
    return {k: v for k, v in r.items() if v != 0}

def eadd(*As):
    r = defaultdict(Fraction)
    for A in As:
        for k, v in A.items():
            r[k] += v
    return {k: v for k, v in r.items() if v != 0}

def eneg(A):
    return {k: -v for k, v in A.items()}

def esub(A, B):
    return eadd(A, eneg(B))

# base octonion symbols (free nonassoc). star maps sym -> sym' (distinct), star(star)=id.
def sym(s):
    return {((), s): Fraction(1)}
def dsym(d):  # central diagonal symbol
    return {((d,), None): Fraction(1)}

def star_tree(t):
    # antiautomorphism on octree; star of base sym toggles via STAR map; star(d)=d handled at dmultiset
    if t is None:
        return None
    if isinstance(t, str):
        return STAR[t]
    # star(a*b) = star(b)*star(a)
    return ('*', star_tree(t[2]), star_tree(t[1]))

def estar(A):
    r = defaultdict(Fraction)
    for (dm, t), c in A.items():
        # d's are real -> star fixes them; multiset unchanged
        r[(dm, star_tree(t))] += c
    return {k: v for k, v in r.items() if v != 0}

# declare base symbols and their stars
STAR = {}
def declare_pair(a, b):
    STAR[a] = b
    STAR[b] = a

for nm in ['x01','x02','x12','y01','y02','y12']:
    declare_pair(nm, nm+'_s')   # nm_s := star(nm)

ZERO = {}

# Matrices as 3x3 lists of entry-algebra elements
def mzero():
    return [[dict(ZERO) for _ in range(3)] for _ in range(3)]

def Hmat(prefix):
    M = mzero()
    M[0][1] = sym(prefix+'01'); M[1][0] = sym(prefix+'01_s')
    M[0][2] = sym(prefix+'02'); M[2][0] = sym(prefix+'02_s')
    M[1][2] = sym(prefix+'12'); M[2][1] = sym(prefix+'12_s')
    return M

def Dmat():
    M = mzero()
    M[0][0] = dsym('d0'); M[1][1] = dsym('d1'); M[2][2] = dsym('d2')
    return M

def madd(A, B):
    return [[eadd(A[i][j], B[i][j]) for j in range(3)] for i in range(3)]

def mmul(A, B):
    C = mzero()
    for i in range(3):
        for j in range(3):
            acc = dict(ZERO)
            for k in range(3):
                acc = eadd(acc, emul(A[i][k], B[k][j]))
            C[i][j] = acc
    return C

def msub(A, B):
    return [[esub(A[i][j], B[i][j]) for j in range(3)] for i in range(3)]

def jb(A, B):
    return madd(mmul(A, B), mmul(B, A))

def jdef(A, B):
    AA = jb(A, A)
    return msub(jb(jb(A, B), AA), jb(A, jb(B, AA)))

X = Hmat('x')
Y = Hmat('y')
D = Dmat()
DpX = madd(D, X)

lhs = jdef(DpX, Y)
rhs = jdef(X, Y)
diff = msub(lhs, rhs)

nonzero = 0
total_terms = 0
for i in range(3):
    for j in range(3):
        e = diff[i][j]
        total_terms += len(e)
        if e:
            nonzero += 1
            print(f"  entry ({i},{j}): {len(e)} surviving monomials")
            for k, v in list(e.items())[:6]:
                print(f"      {v}  d={k[0]}  tree={k[1]}")

print("="*60)
if nonzero == 0:
    print("RESULT: jdef(D+X,Y) - jdef(X,Y) = 0  in EVERY entry.")
    print("=> pieceB closes by D-CENTRALITY/NUCLEARITY ALONE. NO octonion alternativity.")
    print("=> CLEAN abstract structural lemma is available. N5g closable this run.")
else:
    print(f"RESULT: {nonzero}/9 entries NONZERO, {total_terms} total surviving monomials.")
    print("=> pieceB GENUINELY needs octonion alternativity on X,Y (D-centrality insufficient).")
