#!/usr/bin/env python3
# CORRECTED ocR model: a real scalar = a NUMERIC CONSTANT in the deepest-real (rr) slot.
# Constants are starB-fixed (self-adjoint) and central. Verify centrality, then re-check
# the PROVEN theorems (pieceA=0, jdef_Dg_Xz=0) and finally polarCross=0 / jdef(Hm)(Xz)=0.
from fractions import Fraction as F
import sys
sys.path.insert(0, '/Users/elliotweaver/phys-lean/workbench/N5-jordan-cap')
from faithful_cd import (symO, starO, addO, negO, mulO, zeroO, isO0, pzero)

def ocR(val):   # real scalar = numeric constant in rr slot, all else zero
    return (({(): F(val)}, pzero()), (pzero(), pzero()))

# centrality / self-adjointness sanity
d=ocR(3); x=symO('x'); y=symO('y')
def sub(a,b): return addO(a,negO(b))
print("=== corrected ocR (numeric constant) sanity ===")
print("central d*x==x*d        :", isO0(sub(mulO(d,x),mulO(x,d))))
print("assocL d*(x*y)==(d*x)*y :", isO0(sub(mulO(d,mulO(x,y)),mulO(mulO(d,x),y))))
print("assocM x*(d*y)==(x*d)*y :", isO0(sub(mulO(x,mulO(d,y)),mulO(mulO(x,d),y))))
print("assocR x*(y*d)==(x*y)*d :", isO0(sub(mulO(x,mulO(y,d)),mulO(mulO(x,y),d))))
print("self-adjoint star d==d  :", isO0(sub(starO(d),d)))

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
def Dg(v0,v1,v2):
    M=MZ(); M[0][0]=ocR(v0); M[1][1]=ocR(v1); M[2][2]=ocR(v2); return M
def Xz(a,b,c):
    M=MZ(); A,Bx,Cx=symO(a),symO(b),symO(c)
    M[0][1]=A; M[1][0]=starO(A); M[0][2]=Bx; M[2][0]=starO(Bx); M[1][2]=Cx; M[2][1]=starO(Cx); return M

# distinct real diagonal constants
D1=Dg(3,-2,5); X1=Xz('a','b','c'); H1=Madd(D1,X1)
D2=Dg(7,-1,4); X2=Xz('p','q','r'); H2=Madd(D2,X2)

print("\n=== PROVEN theorems re-checked with corrected ocR ===")
print("jdef(Xz)(Xz)==0   (jdef_Xz_core, banked) :", Miszero(jdef(X1,X2)))
print("jdef(Dg)(Xz)==0   (jdef_Dg_Xz, banked)   :", Miszero(jdef(D1,X2)))
print("jdef(Hm)(Dg)==0   (jdef_Hm_Dg pieceA)    :", Miszero(jdef(H1,D2)))
print("\n=== the TARGET ===")
print("jdef(Hm)(Xz)==0   (pieceB target)        :", Miszero(jdef(H1,X2)))
print("jdef(Hm)(Hm)==0   (FULL cap)             :", Miszero(jdef(H1,H2)))

# polarCross(Dg, Xz, Xz)
D,X,Y=D1,X1,X2
P=MZ()
plus=[jb(jb(D,Y),jb(D,X)),jb(jb(D,Y),jb(X,D)),jb(jb(D,Y),jb(X,X)),
      jb(jb(X,Y),jb(D,D)),jb(jb(X,Y),jb(D,X)),jb(jb(X,Y),jb(X,D))]
minus=[jb(D,jb(Y,jb(D,X))),jb(D,jb(Y,jb(X,D))),jb(D,jb(Y,jb(X,X))),
       jb(X,jb(Y,jb(D,D))),jb(X,jb(Y,jb(D,X))),jb(X,jb(Y,jb(X,D)))]
for T in plus: P=Madd(P,T)
for T in minus: P=Msub(P,T)
print("polarCross(Dg,Xz,Xz)==0                  :", Miszero(P))
