#!/usr/bin/env python3
# Does polarCross2(D,X,Y)=0 for ARBITRARY matrices X,Y when D=diag central+nuclear?
# If yes -> clean abstract matrix lemma (no Xz structure needed). Free non-assoc octonions,
# D-entries central (commute) + nuclear (re-bracket). X,Y FULLY GENERAL 3x3.
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
    # central+nuclear: pull all D out (multiset) + remaining octonion tree, NO alternativity
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
def Mfull(pref):
    M=MZ()
    for i in range(3):
        for j in range(3): M[i][j]=sym(f'{pref}{i}{j}')
    return M
D=Dgm(); X=Mfull('x'); Y=Mfull('y')
def pc2(D,X,Y):
    return Msub(Msub(Madd(J(J(D,Y),J(D,X)), Madd(J(J(D,Y),J(X,D)), J(J(X,Y),J(D,D)))),
                     Madd(J(D,J(Y,J(D,X))), J(D,J(Y,J(X,D)))) ), J(X,J(Y,J(D,D))))
g2=pc2(D,X,Y)
sizes=[[len(nucnf(g2[i][j])) for j in range(3)] for i in range(3)]
print("polarCross2(D,X,Y), D central+nuclear diag, X,Y ARBITRARY full matrices:")
print("  entry nuc-NF sizes:", sizes)
print("  pc2 = 0 for ARBITRARY X,Y (clean abstract lemma):",
      all(sizes[i][j]==0 for i in range(3) for j in range(3)))
