#!/usr/bin/env python3
# DECISIVE & FAST: does polarCross2(D,X,Y)=0 from MATRIX-NUCLEARITY of D ALONE (D associates
# in all 3 positions as a matrix), with X,Y the SMALL Xz shape (zero diagonal) and FREE
# non-associative, NON-central octonion entries? D's entries D0,D1,D2 are nuclear ELEMENTS
# (assoc(.,.,.)=0 if any slot is a single D-symbol) but do NOT commute.
# If pc2=0 here -> nuclearity of D ALONE suffices (cleanest abstract Lean lemma, fully general,
# reuse Dg_assocL/M/R only, NO ocR_comm). If residue survives -> centrality also needed.
from collections import defaultdict
import sys
sys.setrecursionlimit(1000000)
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
def isDsym(t): return isinstance(t,str) and t in DSET
# nuclear re-association rewrite for single D-symbols, to fixpoint. D keeps ORDER (no commuting).
def rew(t):
    if isinstance(t,str): return t,False
    l,lc=rew(t[1]); r,rc=rew(t[2]); ch=lc or rc; t=('*',l,r)
    # D*(x*y) -> (D*x)*y
    if isDsym(t[1]) and isinstance(t[2],tuple): return ('*',('*',t[1],t[2][1]),t[2][2]),True
    # (x*y)*D -> x*(y*D)
    if isDsym(t[2]) and isinstance(t[1],tuple): return ('*',t[1][1],('*',t[1][2],t[2])),True
    # (x*D)*y -> x*(D*y)
    if isinstance(t[1],tuple) and isDsym(t[1][2]): return ('*',t[1][1],('*',t[1][2],t[2])),True
    return t,ch
def nucanon(t):
    seen=0
    while True:
        t2,c=rew(t)
        if not c: return t2
        t=t2; seen+=1
        if seen>100000: return t
def nucnf(P):
    r=defaultdict(int)
    for t,c in P.items(): r[nucanon(t)]+=c
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
    M=MZ(); M[0][1]=sym(a); M[1][0]=sym(a+'s'); M[0][2]=sym(b); M[2][0]=sym(b+'s')
    M[1][2]=sym(c); M[2][1]=sym(c+'s'); return M
D=Dgm(); X=Xz('a','b','c'); Y=Xz('p','q','r')
def pc2(D,X,Y):
    return Msub(Msub(Madd(J(J(D,Y),J(D,X)), Madd(J(J(D,Y),J(X,D)), J(J(X,Y),J(D,D)))),
                     Madd(J(D,J(Y,J(D,X))), J(D,J(Y,J(X,D)))) ), J(X,J(Y,J(D,D))))
def szmat(M,nf): return [[len(nf(M[i][j])) for j in range(3)] for i in range(3)]
g2=pc2(D,X,Y)
print("polarCross2(Dg,Xz,Xz), D NUCLEAR-ONLY (non-central), free octonions:")
sizes=szmat(g2,nucnf)
print("  NUCLEAR-ONLY NF entry sizes:", sizes)
print("  pc2 vanishes by NUCLEARITY of D ALONE (no centrality):",
      all(sizes[i][j]==0 for i in range(3) for j in range(3)))
