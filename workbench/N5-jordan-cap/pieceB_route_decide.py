#!/usr/bin/env python3
# RUN 68: decide the Lean route. Test the abstract levers in the FREE nuclear/central model.
# Model: matrices over a free non-assoc ring; E = a central+nuclear diagonal (scalar n_i per
# diag), X,Y = free zero-diag Hermitian. Reuse pieceB_degsplit's entry algebra.
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
def total(M): return sum(len(M[i][j]) for i in range(3) for j in range(3))

X=Hmat('x'); Y=Hmat('y'); D=Dmat()
# Note: in this model d_i are CENTRAL scalars (they sort into the dmultiset, commute/assoc freely).

# (a) jdef_nuc_first: jdef(D, B) with B = full Hermitian Y. D central+nuclear.
print("(a) jdef(Dg, Y) monomials (nuclear+central E, 1st arg):", total(jdef(D, Y)))
print("    jdef(Dg, X+Y) :", total(jdef(D, madd(X,Y))))

# (b) the DROP Delta = jdef(D+X, Y) - jdef(X, Y); degree structure
Delta = msub(jdef(madd(D,X),Y), jdef(X,Y))
deg = Counter()
for i in range(3):
    for j in range(3):
        for (dm,t),v in Delta[i][j].items(): deg[len(dm)]+=1
print("(b) Delta = jdef(D+X,Y)-jdef(X,Y): total", total(Delta), "Dg-deg dist", dict(deg))

# (c) full pieceB target jdef(D+X, Y) directly (what entrysimp sees, before using jdef(X,Y)=0)
full = jdef(madd(D,X),Y)
degf = Counter()
for i in range(3):
    for j in range(3):
        for (dm,t),v in full[i][j].items(): degf[len(dm)]+=1
print("(c) jdef(Hm,Y)=jdef(D+X,Y) DIRECT: total", total(full), "Dg-deg dist", dict(degf))
print("    => the RAW entry goal has Dg-degree up to", max(degf), "(this is what the coord route expands)")

# (d) jdef(X, Y) alone (the banked-zero core)
print("(d) jdef(Xz,Y) [banked = 0 as matrix, but as free monomials]:", total(jdef(X,Y)))
