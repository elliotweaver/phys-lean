#!/usr/bin/env python3
# run69: per-BLOCK L1 monomial counts. Block-k sets Y to a single generator.
# Determines the real per-entry certificate size for the actual pieceB blocks.
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
def Xmat():
    M = mzero()
    M[0][1]=sym('a'); M[1][0]=sym('a_s')
    M[0][2]=sym('b'); M[2][0]=sym('b_s')
    M[1][2]=sym('c'); M[2][1]=sym('c_s')
    return M
def Dmat():
    M = mzero(); M[0][0]=dsym('d0'); M[1][1]=dsym('d1'); M[2][2]=dsym('d2'); return M
def Yblock(k):
    M = mzero()
    if k==1: M[0][1]=sym('p'); M[1][0]=sym('p_s')
    if k==2: M[1][2]=sym('q'); M[2][1]=sym('q_s')
    if k==3: M[0][2]=sym('r'); M[2][0]=sym('r_s')
    return M
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

X=Xmat(); D=Dmat()
for k in (1,2,3):
    Y=Yblock(k)
    full = jdef(madd(D,X), Y)   # this is what entrysimp sees per block (D opaque)
    print(f"=== BLOCK {k} : jdef(Dg+X, Yblock{k}) ===")
    for i in range(3):
        for j in range(3):
            byd = Counter(len(dm) for (dm,t),v in full[i][j].items())
            n = sum(full[i][j].values().__class__ and 1 for _ in full[i][j])
            print(f"  ({i},{j}): total monos={len(full[i][j])}  Dg-deg dist={dict(byd)}")
