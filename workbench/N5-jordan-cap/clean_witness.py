"""
Find the cleanest n=4 witness whose Jordan defect equals (a scalar multiple of) a
SINGLE octonion associator [a,b,c]=(ab)c-a(bc), giving a pristine one-cause link.

Classical construction: 4 distinct indices on a path. Use matrix units.
Try X = E_{0,1}(a)+E_{2,3}(c) (herm), Y = E_{1,2}(b) (herm)  -- tried, gave 0.
Try other index couplings systematically with single basis units, report defect
as a function of associators of the three units a,b,c.
"""
import itertools
from fractions import Fraction as F
from fast import omul,oadd,osub,oneg,ostar,oz,ois0,E,assoc

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
def setp(A,i,j,a): A[i][j]=a[:]; A[j][i]=ostar(a)
def defect(X,Y):
    XX=jb(X,X)
    return mdiff(jb(jb(X,Y),XX), jb(X,jb(Y,jb(Y,Y)) if False else jb(Y,XX)))

# X has two off-diag pairs, Y has one. Search all index/unit combos for a defect
# supported on a SINGLE off-diagonal slot (cleanest).
best=[]
pairs=[(i,j) for i in range(n) for j in range(i+1,n)]
for (i1,j1),(i2,j2) in itertools.combinations(pairs,2):
    for (ky,ly) in pairs:
        for a in range(1,8):
            for c in range(1,8):
                for b in range(1,8):
                    X=mzero(); setp(X,i1,j1,E[a]); setp(X,i2,j2,E[c])
                    Y=mzero(); setp(Y,ky,ly,E[b])
                    D=defect(X,Y)
                    if mz(D): continue
                    slots=[(i,j) for i in range(n) for j in range(n) if not ois0(D[i][j])]
                    # cleanest: defect on exactly 2 slots (i,j),(j,i) hermitian pair
                    if len(slots)==2:
                        (r,s)=slots[0]
                        v=D[r][s]
                        nzc=[k for k in range(8) if v[k]!=0]
                        if len(nzc)==1:
                            best.append(((i1,j1,a),(i2,j2,c),(ky,ly,b),(r,s),nzc[0],v[nzc[0]]))
    if len(best)>=5: break
print("clean single-slot, single-coordinate defect witnesses (first few):")
for rec in best[:10]:
    print("  X:",rec[0],rec[1]," Y:",rec[2]," defect@",rec[3],"= %s e%d"%(rec[5],rec[4]))
