#!/usr/bin/env python3
# FAST discriminator: does polarCross2(E,X,Y)=0 from MATRIX-NUCLEARITY of E ALONE?
# E = diag(E0,E1,E2) nuclear (associates in all positions) but NONcentral.
# X,Y = sparse Xz (off-diagonal only) — the actual pieceB shape (6 free octonion symbols).
# Nuclear NF: re-associate single E-symbols to fixpoint; E keeps its left/right ORDER (noncentral).
from collections import defaultdict
ESET={'E0','E1','E2'}
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
def isEsym(t): return isinstance(t,str) and t in ESET
def rewrite(t):
    if isinstance(t,str): return t,False
    l,lc=rewrite(t[1]); r,rc=rewrite(t[2]); ch=lc or rc
    t=('*',l,r)
    if isEsym(t[1]) and isinstance(t[2],tuple):
        return ('*',('*',t[1],t[2][1]),t[2][2]),True
    if isEsym(t[2]) and isinstance(t[1],tuple):
        return ('*',t[1][1],('*',t[1][2],t[2])),True
    if isinstance(t[1],tuple) and isEsym(t[1][2]):
        return ('*',t[1][1],('*',t[1][2],t[2])),True
    return t,ch
def canon(t):
    while True:
        t2,ch=rewrite(t)
        if not ch: return t2
        t=t2
def nucnf(P):
    r=defaultdict(int)
    for t,c in P.items(): r[canon(t)]+=c
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
def Em():
    M=MZ(); M[0][0]=sym('E0'); M[1][1]=sym('E1'); M[2][2]=sym('E2'); return M
def Xz(a,b,c):
    M=MZ(); M[0][1]=sym(a); M[1][0]=sym(a+'s'); M[0][2]=sym(b); M[2][0]=sym(b+'s')
    M[1][2]=sym(c); M[2][1]=sym(c+'s'); return M
def pc2(E,X,Y):
    return Msub(Msub(Madd(J(J(E,Y),J(E,X)), Madd(J(J(E,Y),J(X,E)), J(J(X,Y),J(E,E)))),
                     Madd(J(E,J(Y,J(E,X))), J(E,J(Y,J(X,E)))) ), J(X,J(Y,J(E,E))))
E=Em(); X=Xz('a','b','c'); Y=Xz('p','q','r')
g=pc2(E,X,Y)
sizes=[[len(nucnf(g[i][j])) for j in range(3)] for i in range(3)]
allzero=all(sizes[i][j]==0 for i in range(3) for j in range(3))
print("E nuclear (associates) but NONcentral; X,Y = sparse Xz:")
print("  polarCross2 nuc-NF sizes:", sizes)
print("  VANISHES by MATRIX-NUCLEARITY of E ALONE (no centrality):", allzero)
