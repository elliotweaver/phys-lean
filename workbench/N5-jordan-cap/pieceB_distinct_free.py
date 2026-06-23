#!/usr/bin/env python3
# DECISIVE: does polarCross(Dg,Xz,Xz) vanish by CENTRALITY+NUCLEARITY ALONE (no alternativity),
# with DISTINCT central-nuclear diagonal entries D0,D1,D2? Free non-assoc octonions; D_i central
# (commute past everything) + nuclear (re-bracket freely). If yes => pure structural proof,
# NO asw_star/ka needed. If deg1 group survives => needs alternativity (asw_star/ka kernel).
from collections import defaultdict
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
# central+nuclear NF for the set {D0,D1,D2}: pull all D_i out (they commute & associate), key by
# the SORTED multiset of D's present and the remaining octonion tree (D's stripped). NO alternativity.
DSET={'D0','D1','D2'}
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
def Dmultiset(t):
    return tuple(sorted(x for x in flatten(t) if x in DSET))
def nucnf(P):
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
def Mjb(A,B): return Madd(Mmul(A,B),Mmul(B,A))
def sym(s): return {s:1}
def Dgm():
    M=MZ(); M[0][0]=sym('D0'); M[1][1]=sym('D1'); M[2][2]=sym('D2'); return M
def Xz(a,b,c):
    M=MZ()
    M[0][1]=sym(a); M[1][0]=sym(a+'s'); M[0][2]=sym(b); M[2][0]=sym(b+'s')
    M[1][2]=sym(c); M[2][1]=sym(c+'s'); return M
D_=Dgm(); X=Xz('a','b','c'); Y=Xz('p','q','r')
def J(A,B): return Mjb(A,B)
def group(deg):
    terms=[('+',2,J(J(D_,Y),J(D_,X))),('+',2,J(J(D_,Y),J(X,D_))),('+',1,J(J(D_,Y),J(X,X))),
           ('+',2,J(J(X,Y),J(D_,D_))),('+',1,J(J(X,Y),J(D_,X))),('+',1,J(J(X,Y),J(X,D_))),
           ('-',2,J(D_,J(Y,J(D_,X)))),('-',2,J(D_,J(Y,J(X,D_)))),('-',1,J(D_,J(Y,J(X,X)))),
           ('-',2,J(X,J(Y,J(D_,D_)))),('-',1,J(X,J(Y,J(D_,X)))),('-',1,J(X,J(Y,J(X,D_))))]
    P=MZ()
    for sgn,dg,T in terms:
        if dg!=deg: continue
        P=Madd(P,T) if sgn=='+' else Msub(P,T)
    return P
def sz(M): return [[len(nucnf(M[i][j])) for j in range(3)] for i in range(3)]
g1=group(1); g2=group(2); gall=Madd(g1,g2)
print("DISTINCT central-nuclear D0,D1,D2; FREE octonions (NO alternativity):")
print("  deg2 group nuc-NF sizes:", sz(g2))
print("  deg1 group nuc-NF sizes:", sz(g1))
print("  FULL polarCross nuc-NF sizes:", sz(gall))
z2=all(len(nucnf(g2[i][j]))==0 for i in range(3) for j in range(3))
z1=all(len(nucnf(g1[i][j]))==0 for i in range(3) for j in range(3))
print("  deg2 vanishes by centrality+nuclearity ALONE:", z2)
print("  deg1 vanishes by centrality+nuclearity ALONE:", z1)
print("  => alternativity needed?:", "NO (pure structural!)" if (z1 and z2) else "YES for the surviving group")
