#!/usr/bin/env python3
# run67: split the MATRIX-level pieceB drop by Dg-degree to isolate the exact hard kernel.
# Reuses pieceB_central_decisive's entry-algebra (D entries distinct central scalars d0,d1,d2;
# X,Y free nonassoc octonion, zero-diag Hermitian). Delta = jdef(Dg+X, Y) - jdef(X, Y).
# Split each surviving entry monomial by its Dg-degree (# of d-symbols in the dmultiset).
from fractions import Fraction
from collections import defaultdict, Counter

def emul(A, B):
    r = defaultdict(Fraction)
    for (dA, tA), cA in A.items():
        for (dB, tB), cB in B.items():
            dm = tuple(sorted(dA + dB))
            t = tB if tA is None else (tA if tB is None else ('*', tA, tB))
            r[(dm, t)] += cA * cB
    return {k: v for k, v in r.items() if v != 0}
def eadd(*As):
    r = defaultdict(Fraction)
    for A in As:
        for k, v in A.items(): r[k] += v
    return {k: v for k, v in r.items() if v != 0}
def eneg(A): return {k: -v for k, v in A.items()}
def esub(A, B): return eadd(A, eneg(B))
def sym(s): return {((), s): Fraction(1)}
def dsym(d): return {((d,), None): Fraction(1)}

STAR = {}
def declare_pair(a, b): STAR[a] = b; STAR[b] = a
for nm in ['x01','x02','x12','y01','y02','y12']:
    declare_pair(nm, nm+'_s')
ZERO = {}
def mzero(): return [[dict(ZERO) for _ in range(3)] for _ in range(3)]
def Hmat(pfx):
    M = mzero()
    M[0][1]=sym(pfx+'01'); M[1][0]=sym(pfx+'01_s')
    M[0][2]=sym(pfx+'02'); M[2][0]=sym(pfx+'02_s')
    M[1][2]=sym(pfx+'12'); M[2][1]=sym(pfx+'12_s')
    return M
def Dmat():
    M = mzero(); M[0][0]=dsym('d0'); M[1][1]=dsym('d1'); M[2][2]=dsym('d2'); return M
def madd(A,B): return [[eadd(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def mmul(A,B):
    C=mzero()
    for i in range(3):
        for j in range(3):
            acc=dict(ZERO)
            for k in range(3): acc=eadd(acc, emul(A[i][k],B[k][j]))
            C[i][j]=acc
    return C
def msub(A,B): return [[esub(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return msub(jb(jb(A,B),AA), jb(A,jb(B,AA)))

X=Hmat('x'); Y=Hmat('y'); D=Dmat()
Delta = msub(jdef(madd(D,X),Y), jdef(X,Y))

# overall Dg-degree distribution
allmon = []
for i in range(3):
    for j in range(3):
        for (dm,t),c in Delta[i][j].items():
            allmon.append((i,j,len(dm),dm,t,c))
deg = Counter(m[2] for m in allmon)
print("pieceB matrix-drop Delta: total surviving monomials:", len(allmon))
print("Dg-degree distribution:", dict(deg))

# per entry, per Dg-degree count
print("\nper-entry Dg-degree breakdown:")
for i in range(3):
    for j in range(3):
        c = Counter(len(dm) for (dm,t),v in Delta[i][j].items())
        if c: print(f"  ({i},{j}): {dict(c)}  total={sum(c.values())}")

# show the degree-1 (linear in Dg) terms for entry (0,1) -- the candidate easy kernel
print("\nDg-degree-1 monomials at entry (0,1) (the linear-in-diagonal cross terms):")
for (dm,t),v in Delta[0][1].items():
    if len(dm)==1:
        print(f"   {v}  d={dm[0]}  tree={t}")
print("\nDg-degree-2 monomials at entry (0,1):")
for (dm,t),v in Delta[0][1].items():
    if len(dm)==2:
        print(f"   {v}  d={dm}  tree={t}")
