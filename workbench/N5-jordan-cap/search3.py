"""
Find a clean n=4 witness: X = two off-diagonal Hermitian pairs forming a path,
Y = one pair, with basis-unit octonion entries. Trace defect to an associator.
"""
import itertools
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
            for k in range(n): s=oadd(s,omul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def mdiff(A,B): return [[osub(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mz(A): return all(ois0(A[i][j]) for i in range(n) for j in range(n))
def addpair(A,i,j,a):
    A[i][j]=oadd(A[i][j],a); A[j][i]=oadd(A[j][i],ostar(a)); return A
def defect(X,Y): return mdiff(jb(jb(X,Y),jb(X,X)), jb(X,jb(Y,jb(X,X))))

# canonical non-associating imaginary triple
for a,b,c in [(1,2,4),(1,2,3),(1,4,6)]:
    print(f"assoc[e{a},e{b},e{c}] =", assoc(E[a],E[b],E[c]))

print("\n--- search: X = pair(0,1)=e_p1 + pair(2,3)=e_p2 ; Y = pair(1,2)=e_q ---")
best=None
for p1 in range(1,8):
    for p2 in range(1,8):
        for q in range(1,8):
            X=mzero(); addpair(X,0,1,E[p1]); addpair(X,2,3,E[p2])
            Y=mzero(); addpair(Y,1,2,E[q])
            D=defect(X,Y)
            if not mz(D):
                nz=[(i,j) for i in range(n) for j in range(n) if not ois0(D[i][j])]
                if best is None:
                    best=(p1,p2,q,D,nz)
                    print(f"  FOUND X:(0,1)=e{p1},(2,3)=e{p2}  Y:(1,2)=e{q}  defect slots {nz}")
if best:
    p1,p2,q,D,nz=best
    print("\nCHOSEN witness defect entries:")
    for (i,j) in nz:
        print(f"  D[{i}][{j}] = {D[i][j]}")
else:
    print("  none with this layout")
