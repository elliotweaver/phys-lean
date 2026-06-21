"""
Lock the cleanest n=4 witness and verify with the STANDARD Jordan identity.
Witness:  X[0][1]=e1, X[0][2]=e2 (Hermitian);  Y[1][3]=e4 (Hermitian).
Map basis units to explicit O ℚ coordinate vectors (leaf order = banked CD nesting):
  leaf order [r.r.r, r.r.i, r.i.r, r.i.i, i.r.r, i.r.i, i.i.r, i.i.i].
"""
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
def setp(A,i,j,a): A[i][j]=a[:]; A[j][i]=ostar(a)

X=mzero(); setp(X,0,1,E[1]); setp(X,0,2,E[2])
Y=mzero(); setp(Y,1,3,E[4])
XX=jb(X,X)
L=jb(jb(X,Y),XX)
Rt=jb(X,jb(Y,XX))
D=mdiff(L,Rt)
print("defect nonzero slots:")
for i in range(n):
    for j in range(n):
        if not ois0(D[i][j]):
            print(f"  D[{i}][{j}] = {[v for v in D[i][j]]}")
# the (0,3) entry, coordinate-by-coordinate
print("\nL[0][3] =", [v for v in L[0][3]])
print("R[0][3] =", [v for v in Rt[0][3]])

# basis literals
def lit(k):
    v=E[k]
    return v
names={1:'e1',2:'e2',4:'e4'}
for k in (1,2,4):
    print(f"{names[k]} coords:", [int(x) for x in E[k]])
