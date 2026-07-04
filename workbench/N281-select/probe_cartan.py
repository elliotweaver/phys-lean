"""
N281 SELECT — DECISIVE test: do the two-handed spinor Cartans L1=leftReg(u1), R1=rightReg(u1)
reproduce the vector-7 charge (Cmat) and isospin (Imat = imRep DI)?
Cmat/Imat are 7x7 on coords e1..e7 (= full-basis positions 1..7). qI convention: row i = output e_{i+1}.
"""
from fractions import Fraction as F
import numpy as np

def R_mul(x,y): return x*y
def R_star(x): return x
def gadd(x,y):
    if isinstance(x,tuple): return (gadd(x[0],y[0]), gadd(x[1],y[1]))
    return x+y
def gsub(x,y):
    if isinstance(x,tuple): return (gsub(x[0],y[0]), gsub(x[1],y[1]))
    return x-y
def make_level(mul, star):
    def lmul(z,w):
        (a,b)=z; (c,d)=w
        return (gsub(mul(a,c), mul(star(d),b)), gadd(mul(d,a), mul(b,star(c))))
    def lstar(z):
        (a,b)=z; return (star(a), lneg(b))
    return lmul, lstar
def neg_gen():
    def n(z):
        if isinstance(z,tuple): return (n(z[0]), n(z[1]))
        return -z
    return n
lneg=neg_gen()
C_mul,C_star=make_level(R_mul,R_star)
H_mul,H_star=make_level(C_mul,C_star)
O_mul,O_star=make_level(H_mul,H_star)
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(e,f)=zc;(g,h)=zd
    return [a,b,c,d,e,f,g,h]
def unflat(v):
    a,b,c,d,e,f,g,h=v; return (((a,b),(c,d)),((e,f),(g,h)))
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return unflat(v)
def octmul(x,y): return O_mul(x,y)
def leftReg(x):
    M=[[F(0)]*8 for _ in range(8)]
    for j in range(8):
        col=flat(octmul(x,basis(j)))
        for i in range(8): M[i][j]=col[i]
    return M
def rightReg(x):
    M=[[F(0)]*8 for _ in range(8)]
    for j in range(8):
        col=flat(octmul(basis(j),x))
        for i in range(8): M[i][j]=col[i]
    return M
def sub7(M):  # positions 1..7 submatrix -> 7x7
    return [[M[i][j] for j in range(1,8)] for i in range(1,8)]
def show7(M):
    for r in M: print(" ".join(f"{int(x):>2}" if x.denominator==1 else str(x) for x in r))

e=[basis(i) for i in range(8)]
L1=leftReg(e[1]); R1=rightReg(e[1])
def madd(A,B): return [[A[i][j]+B[i][j] for j in range(len(A))] for i in range(len(A))]
def msub(A,B): return [[A[i][j]-B[i][j] for j in range(len(A))] for i in range(len(A))]
def mscale(s,A): return [[s*A[i][j] for j in range(len(A))] for i in range(len(A))]

Cmat=[[0,0,0,0,0,0,0],[0,0,-1,0,0,0,0],[0,1,0,0,0,0,0],[0,0,0,0,-1,0,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,1],[0,0,0,0,0,-1,0]]
Imat=[[0,0,0,0,0,0,0],[0,0,-2,0,0,0,0],[0,2,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,-2],[0,0,0,0,0,2,0]]
Cmat=[[F(x) for x in r] for r in Cmat]; Imat=[[F(x) for x in r] for r in Imat]

L1_7=sub7(L1); R1_7=sub7(R1)
print("=== L1 restricted to ImO (coords e1..e7) ==="); show7(L1_7)
print("=== R1 restricted to ImO ==="); show7(R1_7)
print("\n=== (L1 - R1)|ImO  [= ad_u1 = adjoint action] ==="); LR = msub(L1_7,R1_7); show7(LR)
print("compare Imat (isospin T3 = imRep DI):"); show7(Imat)
print(">> (L1-R1)|ImO == Imat ?", LR==Imat)
print(">> (L1-R1)|ImO == 2*Cmat ?", LR==mscale(F(2),Cmat))
print("\n=== (L1 + R1)|ImO ==="); LRp=madd(L1_7,R1_7); show7(LRp)
print(">> (L1+R1)|ImO == 2*Cmat ?", LRp==mscale(F(2),Cmat))
print(">> (L1+R1)|ImO == Cmat ?", LRp==Cmat)

# Also compare with charge Cmat directly
print("\n=== does chargeOp (Cmat) equal any simple L1/R1 combo on ImO? ===")
for name,M in [("L1",L1_7),("R1",R1_7),("L1-R1",LR),("L1+R1",LRp),
               ("(L1-R1)/2",mscale(F(1,2),LR)),("(L1+R1)/2",mscale(F(1,2),LRp))]:
    print(f"  {name} == Cmat ?", M==Cmat, " == Imat ?", M==Imat)

# The colour-neutral core: (L1+R1) on full O should be nonzero only on span{1, u1}
print("\n=== (L1+R1) on FULL O (8-dim): where is it nonzero? ===")
LRpF=madd(L1,R1)
nz=[(i,j) for i in range(8) for j in range(8) if LRpF[i][j]!=0]
print("nonzero entries (i,j):", nz)
print(">> (L1+R1) supported only on coords {0,1} (= span{1,u1}, the fold's ℂ core N266)?",
      all(i in (0,1) and j in (0,1) for i,j in nz))
