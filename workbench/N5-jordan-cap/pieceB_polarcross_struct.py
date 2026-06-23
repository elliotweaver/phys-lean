#!/usr/bin/env python3
# Per-entry structure of polarCross(Dg,Xz,Xz) with CORRECT central ocR. To keep d_k symbolic
# AND central+self-adjoint, encode d_k as a single rr-slot variable that we MANUALLY treat as
# starB-fixed: use a name without '~' and verify pstarB maps it to '~' but we substitute back.
# Simpler: confirm per-entry zero for several independent numeric d-assignments AND show the
# octonion-monomial COUNT per entry (structure) using numeric d so the entries are pure octonion
# polynomials. Then report which entries are diagonal vs off-diagonal and their sizes.
from fractions import Fraction as F
import sys, random
sys.path.insert(0, '/Users/elliotweaver/phys-lean/workbench/N5-jordan-cap')
from faithful_cd import (symO, starO, addO, negO, mulO, zeroO, isO0, pzero)
def ocR(val): return (({(): F(val)}, pzero()), (pzero(), pzero()))
def MZ(): return [[zeroO() for _ in range(3)] for _ in range(3)]
def Madd(A,B): return [[addO(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def Mneg(A): return [[negO(A[i][j]) for j in range(3)] for i in range(3)]
def Msub(A,B): return Madd(A, Mneg(B))
def Mmul(A,B):
    C=MZ()
    for i in range(3):
        for j in range(3):
            acc=zeroO()
            for k in range(3): acc=addO(acc, mulO(A[i][k],B[k][j]))
            C[i][j]=acc
    return C
def jb(A,B): return Madd(Mmul(A,B),Mmul(B,A))
def Dg(v0,v1,v2):
    M=MZ(); M[0][0]=ocR(v0); M[1][1]=ocR(v1); M[2][2]=ocR(v2); return M
def Xz(a,b,c):
    M=MZ(); A,Bx,Cx=symO(a),symO(b),symO(c)
    M[0][1]=A; M[1][0]=starO(A); M[0][2]=Bx; M[2][0]=starO(Bx); M[1][2]=Cx; M[2][1]=starO(Cx); return M
def polarCross(D,X,Y):
    P=MZ()
    plus=[jb(jb(D,Y),jb(D,X)),jb(jb(D,Y),jb(X,D)),jb(jb(D,Y),jb(X,X)),
          jb(jb(X,Y),jb(D,D)),jb(jb(X,Y),jb(D,X)),jb(jb(X,Y),jb(X,D))]
    minus=[jb(D,jb(Y,jb(D,X))),jb(D,jb(Y,jb(X,D))),jb(D,jb(Y,jb(X,X))),
           jb(X,jb(Y,jb(D,D))),jb(X,jb(Y,jb(D,X))),jb(X,jb(Y,jb(X,D)))]
    for T in plus: P=Madd(P,T)
    for T in minus: P=Msub(P,T)
    return P

# Multi-assignment zero check (independent random d-vectors) to be sure it's not a numeric fluke
X=Xz('a','b','c'); Y=Xz('p','q','r')
random.seed(1)
ok=True
for _ in range(6):
    D=Dg(random.randint(-9,9),random.randint(-9,9),random.randint(-9,9))
    P=polarCross(D,X,Y)
    z=all(isO0(P[i][j]) for i in range(3) for j in range(3))
    ok=ok and z
print("polarCross(Dg,Xz,Xz)=0 for 6 independent random central-real diagonals:", ok)

# Also: with d0=d1=d2=1 (so Dg = identity scalar), per-entry term counts
D=Dg(1,1,1); P=polarCross(D,X,Y)
print("\nWith Dg=1*I, per-entry residual poly-term counts (should all be 0):")
for i in range(3):
    for j in range(3):
        n=sum(len(p) for p in (P[i][j][0][0],P[i][j][0][1],P[i][j][1][0],P[i][j][1][1]))
        print(f"  ({i},{j}): {n}")
