#!/usr/bin/env python3
# Decide the Lean route for polarCross(Dg)(Xz)(Xz)=0.
# (A) Is polarCross2(Dg)(X)(Y)=0 for ARBITRARY 3x3 X,Y (free octonions), Dg central+nuclear diagonal?
#     If yes => abstract structural lemma (no Xz, no alternativity).
# (B) Is polarCross1(Dg)(Xz)(Xz) a commutator Dg*K - K*Dg with K OFF-DIAGONAL-FREE?
#     If yes => reuse pieceA diag_comm_offzero; alternativity only to show K off-diag-free.
from collections import defaultdict
DSET={'D0','D1','D2'}
def pmul(P,Q):
    r=defaultdict(int)
    for ta,ca in P.items():
        for tb,cb in Q.items(): r[('*',ta,tb)]+=ca*cb
    return {k:v for k,v in r.items() if v}
def padd(*Ps):
    r=defaultdict(int)
    for P in Ps:
        for k,v in P.items(): r[k]+=v
    return {k:v for k,v in r.items() if v}
def pneg(P): return {k:-v for k,v in P.items()}
def psub(A,B): return padd(A,pneg(B))
def flatten(t):
    if isinstance(t,str): return (t,)
    return flatten(t[1])+flatten(t[2])
def stripD(t):
    if isinstance(t,str): return None if t in DSET else t
    l=stripD(t[1]); r=stripD(t[2])
    if l is None and r is None: return None
    if l is None: return r
    if r is None: return l
    return ('*',l,r)
def Dmultiset(t): return tuple(sorted(x for x in flatten(t) if x in DSET))
def nucnf(P):
    # D central + nuclear: factor D's out (commute+associate); key by D-multiset + stripped octonion tree.
    r=defaultdict(int)
    for t,c in P.items(): r[(Dmultiset(t),stripD(t))]+=c
    return {k:v for k,v in r.items() if v}
def MZ(): return [[dict() for _ in range(3)] for _ in range(3)]
def Madd(A,B): return [[padd(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def Msub(A,B): return [[psub(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def Mmul(A,B):
    C=MZ()
    for i in range(3):
        for j in range(3):
            acc=dict()
            for k in range(3): acc=padd(acc,pmul(A[i][k],B[k][j]))
            C[i][j]=acc
    return C
def J(A,B): return Madd(Mmul(A,B),Mmul(B,A))
def sym(s): return {s:1}
def Dgm():
    M=MZ(); M[0][0]=sym('D0'); M[1][1]=sym('D1'); M[2][2]=sym('D2'); return M
def Xz(a,b,c):
    M=MZ()
    M[0][1]=sym(a); M[1][0]=sym(a+'s'); M[0][2]=sym(b); M[2][0]=sym(b+'s')
    M[1][2]=sym(c); M[2][1]=sym(c+'s'); return M
def Mfull(prefix):  # fully general 3x3 free-octonion matrix
    M=MZ()
    for i in range(3):
        for j in range(3):
            M[i][j]=sym(f'{prefix}{i}{j}')
    return M
def pc1(D,X,Y):
    return Msub(Msub(Madd(J(J(D,Y),J(X,X)), Madd(J(J(X,Y),J(D,X)), J(J(X,Y),J(X,D)))),
                     Madd(J(D,J(Y,J(X,X))), J(X,J(Y,J(D,X))))), J(X,J(Y,J(X,D))))
def pc2(D,X,Y):
    return Msub(Msub(Madd(J(J(D,Y),J(D,X)), Madd(J(J(D,Y),J(X,D)), J(J(X,Y),J(D,D)))),
                     Madd(J(D,J(Y,J(D,X))), J(D,J(Y,J(X,D))))), J(X,J(Y,J(D,D))))
def szmat(M): return [[len(nucnf(M[i][j])) for j in range(3)] for i in range(3)]
def iszero(M): return all(len(nucnf(M[i][j]))==0 for i in range(3) for j in range(3))

D=Dgm()
# (A) polarCross2 with ARBITRARY X,Y (fully general free matrices):
Xg=Mfull('x'); Yg=Mfull('y')
print("(A) polarCross2(Dg, ARBITRARY X, ARBITRARY Y) nuc-NF sizes:", szmat(pc2(D,Xg,Yg)))
print("    => abstract (central+nuclear D, any X,Y) vanish:", iszero(pc2(D,Xg,Yg)))
# also with X=Y=Xz to compare
Xz_=Xz('a','b','c'); Yz_=Xz('p','q','r')
print("    polarCross2(Dg,Xz,Xz) sizes:", szmat(pc2(D,Xz_,Yz_)), "zero:", iszero(pc2(D,Xz_,Yz_)))

# (B) Is polarCross1(Dg)(Xz)(Xz) = Dg*K - K*Dg for off-diag-free K?
g1=pc1(D,Xz_,Yz_)
print("\n(B) polarCross1(Dg,Xz,Xz) nuc-NF sizes:", szmat(g1))
# Commutator with diagonal Dg: (Dg*K - K*Dg)[i][j] = D_i*K[i][j] - K[i][j]*D_j.
# On diagonal i=j: D_i*K_ii - K_ii*D_i = 0 (D central). So a commutator's DIAGONAL is 0.
# But polarCross1 diagonal sizes are 24 (nonzero). So polarCross1 is NOT a pure commutator
# of Dg with arbitrary K. Check whether the DIAGONAL entries are individually zero:
print("    diagonal entries zero (commutator would need this):",
      [iszero_e:=len(nucnf(g1[i][i]))==0 for i in range(3)])
