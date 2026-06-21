"""
Grab a concrete small n=4 failing witness with BASIS-UNIT entries, then sparsify
(zero out entries while keeping the defect nonzero) to get the simplest witness
whose defect traces to an octonion ASSOCIATOR.
"""
import itertools, random
from fractions import Fraction as F
from fast import (omul,oadd,osub,oneg,ostar,oz,oeq,ois0,E,assoc)

n=4
def mzero(): return [[oz() for _ in range(n)] for _ in range(n)]
def madd(A,B): return [[oadd(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    C=mzero()
    for i in range(n):
        for j in range(n):
            s=oz()
            for k in range(n):
                if any(A[i][k]) and any(B[k][j]):
                    s=oadd(s,omul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def mdiff(A,B): return [[osub(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mz(A): return all(ois0(A[i][j]) for i in range(n) for j in range(n))
def defect(X,Y):
    M2=mmul(X,X)
    return mdiff(jb(X,jb(M2,Y)), jb(M2,jb(X,Y)))

offdiag=[(i,j) for i in range(n) for j in range(i+1,n)]  # 6 positions

def build(assign):
    """assign: dict (i,j)->basis index (1..7) for off-diag (upper); herm completes."""
    A=mzero()
    for (i,j),p in assign.items():
        if p==0: continue
        A[i][j]=E[p][:]; A[j][i]=ostar(E[p])
    return A

# Search: X uses a SUBSET of off-diag positions all = e1; Y uses a subset all = e2.
# Try increasing support until defect nonzero, then minimize.
found=None
units_for_X=1; units_for_Y=2
for kx in range(2,7):
    for posX in itertools.combinations(offdiag,kx):
        X=build({pos:units_for_X for pos in posX})
        for ky in range(1,4):
            for posY in itertools.combinations(offdiag,ky):
                Y=build({pos:units_for_Y for pos in posY})
                if not mz(defect(X,Y)):
                    found=(posX,posY); break
            if found: break
        if found: break
    if found: break
print("found (X=e1 on posX, Y=e2 on posY):", found)
