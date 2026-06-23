#!/usr/bin/env python3
# pc2 hypothesis pin: does polarCross2(Dg,X,Y)=0 need X,Y zero-diagonal, or arbitrary?
# Exact octonion (O Q) arithmetic from cd.py. Dg = real central diagonal (ocR d_i).
import sys, random
from fractions import Fraction as F
sys.path.insert(0, "workbench/N5-jordan-cap")
from cd import add, neg, sub, star, mul, zero

LV = 3  # O = CD(CD(Dbl Q)) = 3 doublings => 8 rationals

def rnd_oct():
    def build(level):
        if level == 0:
            return F(random.randint(-4,4))
        return (build(level-1), build(level-1))
    return build(LV)

def ocR(r):  # real scalar embedding: r in deepest-real slot, rest zero
    z = zero(LV)
    # set the very bottom real component to r
    def setbot(x, val):
        if isinstance(x, F):
            return val
        return (setbot(x[0], val), x[1])
    return setbot(z, F(r))

Z = zero(LV)
def Mzero(): return [[Z,Z,Z],[Z,Z,Z],[Z,Z,Z]]
def Madd(A,B): return [[add(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def Msub(A,B): return [[sub(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def Mmul(A,B):
    C=Mzero()
    for i in range(3):
        for j in range(3):
            acc=Z
            for k in range(3): acc=add(acc, mul(A[i][k],B[k][j]))
            C[i][j]=acc
    return C
def J(A,B): return Madd(Mmul(A,B),Mmul(B,A))

def Dgm(d0,d1,d2):
    M=Mzero(); M[0][0]=ocR(d0); M[1][1]=ocR(d1); M[2][2]=ocR(d2); return M
def Xz(a,b,c):  # zero-diagonal Hermitian
    M=Mzero()
    M[0][1]=a; M[1][0]=star(a); M[0][2]=b; M[2][0]=star(b); M[1][2]=c; M[2][1]=star(c)
    return M
def Mfull():  # arbitrary full matrix (random octonion entries)
    return [[rnd_oct() for _ in range(3)] for _ in range(3)]

def pc2(D,X,Y):
    return Msub(Msub(Madd(J(J(D,Y),J(D,X)), Madd(J(J(D,Y),J(X,D)), J(J(X,Y),J(D,D)))),
                     Madd(J(D,J(Y,J(D,X))), J(D,J(Y,J(X,D)))) ), J(X,J(Y,J(D,D))))

def isZero(M): return all(M[i][j]==zero(LV) for i in range(3) for j in range(3))
def nzcount(M): return sum(0 if M[i][j]==zero(LV) else 1 for i in range(3) for j in range(3))

random.seed(7)
# Case A: Xz zero-diagonal X and Y (the actual pieceB case)
okA=True
for _ in range(40):
    D=Dgm(random.randint(-4,4),random.randint(-4,4),random.randint(-4,4))
    X=Xz(rnd_oct(),rnd_oct(),rnd_oct()); Y=Xz(rnd_oct(),rnd_oct(),rnd_oct())
    if not isZero(pc2(D,X,Y)): okA=False; print("  A FAIL nz=",nzcount(pc2(D,X,Y))); break
print("Case A (X,Y zero-diag Hermitian):  pc2==0 over 40 trials:", okA)

# Case B: arbitrary full X,Y
okB=True; lastnz=0
for _ in range(40):
    D=Dgm(random.randint(-4,4),random.randint(-4,4),random.randint(-4,4))
    X=Mfull(); Y=Mfull()
    m=pc2(D,X,Y)
    if not isZero(m): okB=False; lastnz=nzcount(m)
print("Case B (X,Y ARBITRARY full):       pc2==0 over 40 trials:", okB, "(lastnz=%d)"%lastnz)

# Case C: arbitrary X,Y but D=arbitrary diagonal (still central). already central. 
# Case D: does B (no centrality) i.e. D nuclear noncentral break it? Skip (symbolic already showed needs centrality).
print()
print("VERDICT: pc2 lemma hypothesis on X,Y =>", "ARBITRARY (clean abstract)" if okB else "needs zero-diagonal Hermitian")
