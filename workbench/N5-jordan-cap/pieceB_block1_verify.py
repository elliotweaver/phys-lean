#!/usr/bin/env python3
# RUN 68: verify each block-1 L1 coefficient A_{ij,k} (4 octonion monomials) is IDENTICALLY
# ZERO in the faithful CD octonion model, and print the monomials for ka-matching.
from fractions import Fraction
from collections import defaultdict
import sys
sys.path.insert(0, '/Users/elliotweaver/phys-lean/workbench/N5-jordan-cap')
import faithful_cd as F

# symbolic entry algebra (d central)
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
    M[0][1]=sym('a'); M[1][0]=sym('a_s'); M[0][2]=sym('b'); M[2][0]=sym('b_s')
    M[1][2]=sym('c'); M[2][1]=sym('c_s'); return M
def Yb1():
    M = mzero(); M[0][1]=sym('p'); M[1][0]=sym('p_s'); return M

# faithful-model evaluation of an octree
SY = {n: F.symO(n) for n in ['a','b','c','p']}
def SYM(n):
    if n.endswith('_s'):
        return F.starO(SY[n[:-2]])
    return SY[n]
def ev(t):
    if t is None: return ((F.pzero(),F.pzero()),(F.pzero(),F.pzero()))  # scalar 1 placeholder; won't appear alone
    if isinstance(t, str): return SYM(t)
    return F.mulO(ev(t[1]), ev(t[2]))
def evcoeff(coeff):  # coeff: {octree: Fraction}
    acc = F.zeroO()
    for t,v in coeff.items():
        term = ev(t)
        # scale by integer v
        n = int(v); 
        for _ in range(abs(n)):
            acc = F.addO(acc, term) if n>0 else F.addO(acc, F.negO(term))
    return acc

J = jdef(Hm(), Yb1())
allzero = True
for i in range(3):
    for j in range(3):
        deg1 = {k:v for k,v in J[i][j].items() if len(k[0])==1}
        for dk in ['d0','d1','d2']:
            coeff = {k[1]:v for k,v in deg1.items() if k[0]==(dk,)}
            if coeff:
                val = evcoeff(coeff)
                z = F.isO0(val)
                allzero = allzero and z
                print(f"({i},{j}) coeff[{dk}]: {'ZERO' if z else 'NONZERO!!'}  monomials:")
                for t,v in coeff.items():
                    print(f"      {v:+}  {t}")
print("="*50)
print("ALL block-1 L1 coefficients vanish by alternativity:", allzero)
