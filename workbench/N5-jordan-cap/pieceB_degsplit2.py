#!/usr/bin/env python3
# Dg-degree split of polarCross(Dg,Xz,Xz). Use a SYMBOLIC central self-adjoint real for d_k:
# model it as a numeric constant tagged with a formal degree marker so we can separate
# Dg-degree-1 vs Dg-degree-2 contributions. Approach: run polarCross TWICE with Dg scaled by
# t (t=1 and a second independent diagonal) is messy; instead, directly classify each of the 12
# polarCross terms by how many Dg factors it carries, and test each GROUP's vanishing.
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
def Miszero(M): return all(isO0(M[i][j]) for i in range(3) for j in range(3))
def Dg(v0,v1,v2):
    M=MZ(); M[0][0]=ocR(v0); M[1][1]=ocR(v1); M[2][2]=ocR(v2); return M
def Xz(a,b,c):
    M=MZ(); A,Bx,Cx=symO(a),symO(b),symO(c)
    M[0][1]=A; M[1][0]=starO(A); M[0][2]=Bx; M[2][0]=starO(Bx); M[1][2]=Cx; M[2][1]=starO(Cx); return M

X=Xz('a','b','c'); Y=Xz('p','q','r')

# The 12 polarCross terms, tagged by Dg-degree (count of D in the term):
#  +jb(jb D Y)(jb D X)  deg2 ;  +jb(jb D Y)(jb X D) deg2 ; +jb(jb D Y)(jb X X) deg1
#  +jb(jb X Y)(jb D D)  deg2 ;  +jb(jb X Y)(jb D X) deg1 ; +jb(jb X Y)(jb X D) deg1
#  -jb D (jb Y (jb D X)) deg2 ; -jb D (jb Y (jb X D)) deg2 ; -jb D (jb Y (jb X X)) deg1
#  -jb X (jb Y (jb D D)) deg2 ; -jb X (jb Y (jb D X)) deg1 ; -jb X (jb Y (jb X D)) deg1
def termlist(D):
    return [
      ('+', 2, jb(jb(D,Y),jb(D,X))),
      ('+', 2, jb(jb(D,Y),jb(X,D))),
      ('+', 1, jb(jb(D,Y),jb(X,X))),
      ('+', 2, jb(jb(X,Y),jb(D,D))),
      ('+', 1, jb(jb(X,Y),jb(D,X))),
      ('+', 1, jb(jb(X,Y),jb(X,D))),
      ('-', 2, jb(D,jb(Y,jb(D,X)))),
      ('-', 2, jb(D,jb(Y,jb(X,D)))),
      ('-', 1, jb(D,jb(Y,jb(X,X)))),
      ('-', 2, jb(X,jb(Y,jb(D,D)))),
      ('-', 1, jb(X,jb(Y,jb(D,X)))),
      ('-', 1, jb(X,jb(Y,jb(X,D)))),
    ]
def group(D, deg):
    P=MZ()
    for sgn,dg,T in termlist(D):
        if dg!=deg: continue
        P = Madd(P,T) if sgn=='+' else Msub(P,T)
    return P

random.seed(3)
for trial in range(3):
    D=Dg(random.randint(-9,9),random.randint(-9,9),random.randint(-9,9))
    g1=group(D,1); g2=group(D,2)
    print(f"trial {trial}: Dg-deg1 group zero={Miszero(g1)}  Dg-deg2 group zero={Miszero(g2)}  total zero={Miszero(Madd(g1,g2))}")
