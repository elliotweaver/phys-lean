#!/usr/bin/env python3
# SANITY: directly compute jdef(Hm)(Xz pqr) and jdef(Xz abc)(Xz pqr) in the EXACT faithful
# split-octonion model, and compare with polarCross(Dg,Xz,Xz). Hm = Dg + Xz.
from collections import defaultdict
import sys
sys.path.insert(0, '/Users/elliotweaver/phys-lean/workbench/N5-jordan-cap')
from faithful_cd import (symO, starO, addO, negO, mulO, zeroO, isO0, pvar, pzero)

def ocR(name): return ((pvar(name), pzero()), (pzero(), pzero()))
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
def jdef(A,B):
    AA=jb(A,A); return Msub(jb(jb(A,B),AA), jb(A,jb(B,AA)))
def Miszero(M): return all(isO0(M[i][j]) for i in range(3) for j in range(3))

def Dg(): 
    M=MZ(); M[0][0]=ocR('d0'); M[1][1]=ocR('d1'); M[2][2]=ocR('d2'); return M
def Xz(a,b,c):
    M=MZ(); A,Bx,Cx=symO(a),symO(b),symO(c)
    M[0][1]=A; M[1][0]=starO(A); M[0][2]=Bx; M[2][0]=starO(Bx); M[1][2]=Cx; M[2][1]=starO(Cx); return M

D=Dg(); X=Xz('a','b','c'); Y=Xz('p','q','r')
Hm=Madd(D,X)

print("jdef(Xz abc)(Xz pqr) == 0 (the zero-diagonal core, BANKED):", Miszero(jdef(X,Y)))
print("jdef(Dg)(Xz pqr)     == 0 (nuclear first arg, BANKED)     :", Miszero(jdef(D,Y)))
print("jdef(Hm)(Xz pqr)     == 0 (pieceB, the TARGET)            :", Miszero(jdef(Hm,Y)))

# polarCross(D,X,Y)
P=MZ()
plus=[jb(jb(D,Y),jb(D,X)),jb(jb(D,Y),jb(X,D)),jb(jb(D,Y),jb(X,X)),
      jb(jb(X,Y),jb(D,D)),jb(jb(X,Y),jb(D,X)),jb(jb(X,Y),jb(X,D))]
minus=[jb(D,jb(Y,jb(D,X))),jb(D,jb(Y,jb(X,D))),jb(D,jb(Y,jb(X,X))),
       jb(X,jb(Y,jb(D,D))),jb(X,jb(Y,jb(D,X))),jb(X,jb(Y,jb(X,D)))]
for T in plus: P=Madd(P,T)
for T in minus: P=Msub(P,T)
print("polarCross(Dg,Xz,Xz) == 0                                :", Miszero(P))
# cross-check the proven reduction jdef(Hm)(Xz) == jdef(Xz)(Xz)+jdef(Dg)(Xz)+polarCross
rhs=Madd(Madd(jdef(X,Y),jdef(D,Y)),P)
print("jdef(Hm)(Xz) - (jdef(Xz)+jdef(Dg)+polarCross) == 0       :", Miszero(Msub(jdef(Hm,Y),rhs)))
