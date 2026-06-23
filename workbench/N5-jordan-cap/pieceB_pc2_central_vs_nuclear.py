#!/usr/bin/env python3
# Does polarCross2(D,X,Y)=0 from NUCLEARITY of D alone (no centrality)?
# Model coordinate ring = M2(Q): associative (=> every element nuclear) but NONcommutative.
# D = diagonal(g0,g1,g2) with g_k in M2(Q) arbitrary (nuclear but NOT central).
# X,Y = arbitrary 3x3 over M2(Q). If pc2 != 0 => centrality is REQUIRED (not pure nuclearity).
from fractions import Fraction as F
import random
# 2x2 matrix arithmetic over Q
def m2(a,b,c,d): return (F(a),F(b),F(c),F(d))
def madd(A,B): return tuple(x+y for x,y in zip(A,B))
def mneg(A): return tuple(-x for x in A)
def msub(A,B): return madd(A,mneg(B))
def mmul(A,B):
    a,b,c,d=A; e,f,g,h=B
    return (a*e+b*g, a*f+b*h, c*e+d*g, c*f+d*h)
Z2=(F(0),F(0),F(0),F(0))
def iszero2(A): return all(x==0 for x in A)
# 3x3 matrices over M2(Q)
def MZ(): return [[Z2 for _ in range(3)] for _ in range(3)]
def Madd(A,B): return [[madd(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def Mneg(A): return [[mneg(A[i][j]) for j in range(3)] for i in range(3)]
def Msub(A,B): return Madd(A,Mneg(B))
def Mmul(A,B):
    C=MZ()
    for i in range(3):
        for j in range(3):
            acc=Z2
            for k in range(3): acc=madd(acc, mmul(A[i][k],B[k][j]))
            C[i][j]=acc
    return C
def J(A,B): return Madd(Mmul(A,B),Mmul(B,A))
def Miszero(M): return all(iszero2(M[i][j]) for i in range(3) for j in range(3))
def randm2(): return tuple(F(random.randint(-4,4)) for _ in range(4))
def randM():
    return [[randm2() for _ in range(3)] for _ in range(3)]
def Dg(g0,g1,g2):
    M=MZ(); M[0][0]=g0; M[1][1]=g1; M[2][2]=g2; return M
def pc2(D,X,Y):
    return Msub(Msub(Madd(J(J(D,Y),J(D,X)), Madd(J(J(D,Y),J(X,D)), J(J(X,Y),J(D,D)))),
                     Madd(J(D,J(Y,J(D,X))), J(D,J(Y,J(X,D)))) ), J(X,J(Y,J(D,D))))
def pc1(D,X,Y):
    return Msub(Msub(Madd(J(J(D,Y),J(X,X)), Madd(J(J(X,Y),J(D,X)), J(J(X,Y),J(X,D)))),
                     Madd(J(D,J(Y,J(X,X))), J(X,J(Y,J(D,X)))) ), J(X,J(Y,J(X,D))))
random.seed(7)
pc2_nonzero=False; pc1_nonzero=False
for _ in range(5):
    D=Dg(randm2(),randm2(),randm2())   # nuclear (assoc ring) but NOT central
    X=randM(); Y=randM()
    if not Miszero(pc2(D,X,Y)): pc2_nonzero=True
    if not Miszero(pc1(D,X,Y)): pc1_nonzero=True
print("Coordinate ring M2(Q): associative (all nuclear), NONcommutative; D=diag(g_k) noncentral.")
print("  polarCross2 NONZERO for some trial (=> needs CENTRALITY, not just nuclearity):", pc2_nonzero)
print("  polarCross1 NONZERO for some trial:", pc1_nonzero)
# Also: with D CENTRAL (scalar multiples of identity) in M2(Q):
def scal(x): return (F(x),F(0),F(0),F(x))
pc2_c=False
for _ in range(5):
    D=Dg(scal(random.randint(-4,4)),scal(random.randint(-4,4)),scal(random.randint(-4,4)))
    X=randM(); Y=randM()
    if not Miszero(pc2(D,X,Y)): pc2_c=True
print("  polarCross2 with D CENTRAL (scalar) in assoc ring nonzero:", pc2_c, "(expect False)")
