#!/usr/bin/env python3
# DECISIVE: is the FULL cap jdef(Hm1)(Hm2)=0 true for general Hermitian pair? And exactly
# which decomposition is valid? Test all the relevant defects in the EXACT faithful model.
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
def Dg(d='d'): 
    M=MZ(); M[0][0]=ocR(d+'0'); M[1][1]=ocR(d+'1'); M[2][2]=ocR(d+'2'); return M
def Xz(a,b,c):
    M=MZ(); A,Bx,Cx=symO(a),symO(b),symO(c)
    M[0][1]=A; M[1][0]=starO(A); M[0][2]=Bx; M[2][0]=starO(Bx); M[1][2]=Cx; M[2][1]=starO(Cx); return M
def Hm(d,a,b,c): return Madd(Dg(d), Xz(a,b,c))

D1=Dg('d'); X1=Xz('a','b','c'); H1=Madd(D1,X1)
D2=Dg('e'); X2=Xz('p','q','r'); H2=Madd(D2,X2)

print("=== FULL Jordan defect, general Hermitian pair ===")
print("jdef(Hm1)(Hm2) == 0 :", Miszero(jdef(H1,H2)))
print()
print("=== second-arg additive split jdef(H1)(H2)=jdef(H1)(D2)+jdef(H1)(X2) ===")
print("jdef(H1)(D2) [pieceA] == 0 :", Miszero(jdef(H1,D2)))
print("jdef(H1)(X2) [pieceB] == 0 :", Miszero(jdef(H1,X2)))
print("sum check == jdef(H1)(H2)  :", Miszero(Msub(jdef(H1,H2), Madd(jdef(H1,D2),jdef(H1,X2)))))
print()
print("=== so is the FULL defect zero but pieceB alone NOT? ===")
print("jdef(H1)(H2) zero:", Miszero(jdef(H1,H2)), " pieceA zero:", Miszero(jdef(H1,D2)), " pieceB zero:", Miszero(jdef(H1,X2)))
