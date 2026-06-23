#!/usr/bin/env python3
# RUN 68: BLOCK-1 entry structure. Y = Xz p 0 0 (only y01=p, y10=star p). Hm = Dg + Xz(a,b,c).
# Compute jdef(Hm, Y) per entry. Pull central d_k out. For each entry show:
#   - the Dg-degree-0 part (= bb1 entry, pure octonion, closes by ring)
#   - the Dg-degree-1 part: Sum_k d_k * (pure octonion associator combo A_{entry,k})
# and verify each A_{entry,k} is an octonion identity vanishing by alternativity (faithful model).
from fractions import Fraction
from collections import defaultdict
import sys
sys.path.insert(0, '/Users/elliotweaver/phys-lean/workbench/N5-jordan-cap')
from faithful_cd import symO, starO, addO, negO, mulO, isO0

# ---- symbolic entry algebra: monomial = (dmultiset, octree); d_k central scalars ----
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

def Hm():
    M = mzero()
    M[0][0]=dsym('d0'); M[1][1]=dsym('d1'); M[2][2]=dsym('d2')
    M[0][1]=sym('a'); M[1][0]=sym('a_s')
    M[0][2]=sym('b'); M[2][0]=sym('b_s')
    M[1][2]=sym('c'); M[2][1]=sym('c_s')
    return M
def Yblock1():
    M = mzero(); M[0][1]=sym('p'); M[1][0]=sym('p_s'); return M

Hmat=Hm(); Y=Yblock1()
J = jdef(Hmat, Y)

# group each entry by Dg-degree, and by which single d_k (degree-1 part)
for i in range(3):
    for j in range(3):
        e = J[i][j]
        deg0 = {k:v for k,v in e.items() if len(k[0])==0}
        deg1 = {k:v for k,v in e.items() if len(k[0])==1}
        deghi = {k:v for k,v in e.items() if len(k[0])>=2}
        print(f"entry ({i},{j}): total={len(e)}  deg0(bb)={len(deg0)}  deg1={len(deg1)}  deg>=2={len(deghi)}")
        # split deg1 by d_k
        for dk in ['d0','d1','d2']:
            coeff = {k[1]:v for k,v in deg1.items() if k[0]==(dk,)}
            if coeff:
                print(f"    coeff[{dk}] ({len(coeff)} octonion monomials)")
