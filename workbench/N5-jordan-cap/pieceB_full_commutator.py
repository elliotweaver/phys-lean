#!/usr/bin/env python3
# Is the FULL polarCross(Dg,Xz,Xz) = Dg*W - W*Dg (commutator) for SOME matrix W?
# If yes, and W is off-diagonal-free, diag_comm_offzero kills it. Test at matrix level in
# the faithful alternative model: compute polarCross, and check it's a commutator by solving
# for W entrywise: a commutator [Dg,W] has entries D_i*W_ij - W_ij*D_j. On diagonal (i=i):
# D_i*W_ii - W_ii*D_i = 0 (D central). So a commutator MUST have zero diagonal.
# polarCross diagonal sizes are nonzero (24) => NOT a pure commutator. CONFIRM, then test
# the WEAKER structural claim that motivates pieceA: polarCross = Dg*W - W*Dg + (alternativity-0).
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
def iszeroM(M): return all(isO0(M[i][j]) for i in range(3) for j in range(3))
def Dg(v0,v1,v2):
    M=MZ(); M[0][0]=ocR(v0); M[1][1]=ocR(v1); M[2][2]=ocR(v2); return M
def Xz(a,b,c):
    M=MZ(); A,Bx,Cx=symO(a),symO(b),symO(c)
    M[0][1]=A; M[1][0]=starO(A); M[0][2]=Bx; M[2][0]=starO(Bx); M[1][2]=Cx; M[2][1]=starO(Cx); return M
X=Xz('a','b','c'); Y=Xz('p','q','r')
def polarCross(D,Xm,Ym):
    return Msub(Msub(
        Madd(jb(jb(D,Ym),jb(D,Xm)), Madd(jb(jb(D,Ym),jb(Xm,D)), Madd(jb(jb(D,Ym),jb(Xm,Xm)),
        Madd(jb(jb(Xm,Ym),jb(D,D)), Madd(jb(jb(Xm,Ym),jb(D,Xm)), jb(jb(Xm,Ym),jb(Xm,D))))))),
        Madd(jb(D,jb(Ym,jb(D,Xm))), Madd(jb(D,jb(Ym,jb(Xm,D))), Madd(jb(D,jb(Ym,jb(Xm,Xm))),
        Madd(jb(Xm,jb(Ym,jb(D,D))), Madd(jb(Xm,jb(Ym,jb(D,Xm))), jb(Xm,jb(Ym,jb(Xm,D))))))))),
        zeroO() if False else MZ())
random.seed(5)
allzero=True; diag_nonzero=False
for _ in range(6):
    D=Dg(random.randint(-9,9),random.randint(-9,9),random.randint(-9,9))
    pc=polarCross(D,X,Y)
    if not iszeroM(pc): allzero=False
    for i in range(3):
        if not isO0(pc[i][i]): diag_nonzero=True
print("polarCross(Dg,Xz,Xz) = 0 in faithful model (all 6 trials):", allzero)
print("polarCross has nonzero diagonal entries (=> NOT a commutator [Dg,W]):", diag_nonzero)
