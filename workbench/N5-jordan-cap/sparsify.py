"""
Get a concrete n=4 Hermitian witness violating the Jordan identity with BASIS-UNIT
entries, then greedily sparsify (zero entries / shrink) keeping defect nonzero.
Standard Jordan identity:  (X∘Y)∘(X∘X) = X∘(Y∘(X∘X)), unscaled bracket jb.
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
                if any(A[i][k]) and any(B[k][j]): s=oadd(s,omul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def mdiff(A,B): return [[osub(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mz(A): return all(ois0(A[i][j]) for i in range(n) for j in range(n))
def defect(X,Y):
    XX=jb(X,X)
    return mdiff(jb(jb(X,Y),XX), jb(X,jb(Y,XX)))

offU=[(i,j) for i in range(n) for j in range(i+1,n)]
def setpair(A,i,j,a):
    A[i][j]=a[:]; A[j][i]=ostar(a)

# random basis-unit Hermitian (off-diag e_p, diagonal 0)
def rand_witness(rng):
    X=mzero(); Y=mzero()
    for (i,j) in offU:
        if rng.random()<0.6: setpair(X,i,j,E[rng.randint(1,7)])
        if rng.random()<0.6: setpair(Y,i,j,E[rng.randint(1,7)])
    return X,Y

rng=random.Random(7)
X=Y=None
for _ in range(5000):
    Xc,Yc=rand_witness(rng)
    if not mz(defect(Xc,Yc)):
        X,Y=Xc,Yc; break
assert X is not None, "no basis-unit witness found"
print("got a basis-unit witness; sparsifying...")

# represent as dicts pos->p for printing/manipulation
def to_assign(M):
    d={}
    for (i,j) in offU:
        if any(M[i][j]):
            # recover basis index
            nz=[k for k in range(8) if M[i][j][k]!=0]
            d[(i,j)]=M[i][j][:]  # keep raw (could be starred form, but upper is e_p)
    return d

def from_assign(d):
    M=mzero()
    for (i,j),a in d.items(): setpair(M,i,j,a)
    return M

dX=to_assign(X); dY=to_assign(Y)
# greedily remove entries
changed=True
while changed:
    changed=False
    for d,other,isX in [(dX,dY,True),(dY,dX,False)]:
        for pos in list(d.keys()):
            saved=d.pop(pos)
            XX=from_assign(dX); YY=from_assign(dY)
            if mz(defect(XX,YY)):
                d[pos]=saved   # restore, needed
            else:
                changed=True   # successfully removed
print("minimal X positions:", {p:[k for k in range(8) if dX[p][k]!=0] for p in dX})
print("minimal Y positions:", {p:[k for k in range(8) if dY[p][k]!=0] for p in dY})
XX=from_assign(dX); YY=from_assign(dY)
D=defect(XX,YY)
print("defect entries:")
for i in range(n):
    for j in range(n):
        if not ois0(D[i][j]):
            print(f"  D[{i}][{j}] = { [v for v in D[i][j]] }")
