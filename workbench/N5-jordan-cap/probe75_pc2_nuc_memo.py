#!/usr/bin/env python3
# FAST: does polarCross2(E,X,Y)=0 from E-NUCLEARITY ALONE (E associates, NOT central)?
# Free magma; E-symbols {E0,E1,E2} nuclear: re-associate around a single E-symbol to a
# canonical RIGHT-normed form, to fixpoint, with MEMOIZATION. X,Y = sparse Xz.
import sys
from collections import defaultdict
sys.setrecursionlimit(10**7)
ESET={'E0','E1','E2'}
def isE(t): return isinstance(t,str) and t in ESET
# memoized canonicalization: rewrite (E*x)*y->x*(E*y) won't help noncentral; the nuclear
# rewrites that PRESERVE order: E*(x*y)->(E*x)*y ; (x*y)*E->x*(y*E) ; (x*E)*y->x*(E*y).
_memo={}
def canon(t):
    if isinstance(t,str): return t
    key=t
    v=_memo.get(key)
    if v is not None: return v
    l=canon(t[1]); r=canon(t[2]); t2=('*',l,r)
    # apply one nuclear rewrite if applicable, then recanon
    changed=True
    while changed:
        changed=False
        a,b=t2[1],t2[2]
        if isE(a) and isinstance(b,tuple):
            t2=('*',('*',a,b[1]),b[2]); changed=True
        elif isE(b) and isinstance(a,tuple):
            t2=('*',a[1],('*',a[2],b)); changed=True
        elif isinstance(a,tuple) and isE(a[2]):
            t2=('*',a[1],('*',a[2],b)); changed=True
        if changed:
            t2=('*',canon(t2[1]),canon(t2[2]))
    _memo[key]=t2
    return t2
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
def nf(P):
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
sizes=[[len(nf(g[i][j])) for j in range(3)] for i in range(3)]
allzero=all(sizes[i][j]==0 for i in range(3) for j in range(3))
print("E nuclear NONcentral; X,Y sparse Xz:")
print("  pc2 nuclear-NF sizes:", sizes)
print("  VANISHES from E-NUCLEARITY ALONE:", allzero)
if not allzero:
    print("  -> pc2 also needs CENTRALITY (not pure nuclearity)")
