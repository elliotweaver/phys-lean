#!/usr/bin/env python3
# Does the Dg-deg2 group vanish by CENTRALITY+NUCLEARITY ALONE (no alternativity)? Test in the
# FREE non-associative model (octonions = free magma, no alternative law) but Dg still central+
# nuclear. If deg2 group=0 in FREE model => provable abstractly (centrality+nuclearity), the
# cheap structural part. If deg1 needs alternativity, it's the asw_star/ka kernel.
from collections import defaultdict
# free non-assoc model: octonion monomials are binary trees of base symbols; star reverses+conjugates.
# Dg central+nuclear: represent d_k as a CENTRAL NUCLEAR formal scalar 'D' that commutes & associates.
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
def jb(P,Q): return padd(pmul(P,Q),pmul(Q,P))
# central+nuclear normal form for a SINGLE central symbol 'D' (the diagonal scalar): pull all D's
# out (commute) and collapse associativity around them; D is a free scalar otherwise.
def flatten(t):
    if isinstance(t,str): return (t,)
    return flatten(t[1])+flatten(t[2])
def stripD(t):
    if isinstance(t,str): return None if t=='D' else t
    l=stripD(t[1]); r=stripD(t[2])
    if l is None and r is None: return None
    if l is None: return r
    if r is None: return l
    return ('*',l,r)
def countD(t):
    if isinstance(t,str): return 1 if t=='D' else 0
    return countD(t[1])+countD(t[2])
def nucnf(P):
    # D central+nuclear: key = (D-count, octonion-tree-with-D-removed). NO alternativity applied.
    r=defaultdict(int)
    for t,c in P.items(): r[(countD(t),stripD(t))]+=c
    return {k:v for k,v in r.items() if v}

D={'D':1}; 
# X,Y are FREE octonion matrices; but to test the abstract deg2 vanishing we work at the
# single-entry symbol level is wrong (matrices needed). Instead reuse the matrix machinery but
# with FREE octonion entries (no alternativity). Represent entries as free polynomials in tree form.
import itertools
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
def Dgm():  # central D on diagonal; use SAME 'D' (degree counts D-factors; entries differ by name but all central)
    M=MZ(); M[0][0]=sym('D'); M[1][1]=sym('D'); M[2][2]=sym('D'); return M
def starname(n): return n[:-1] if n.endswith('s') else n+'s'
def streefree(t):
    if isinstance(t,str): return starname(t)
    return ('*',streefree(t[2]),streefree(t[1]))
def Xz(a,b,c):
    M=MZ()
    M[0][1]=sym(a); M[1][0]={('*'if False else a+'s'):1}
    M[0][1]=sym(a); M[1][0]=sym(a+'s')
    M[0][2]=sym(b); M[2][0]=sym(b+'s')
    M[1][2]=sym(c); M[2][1]=sym(c+'s')
    return M
D_=Dgm(); X=Xz('a','b','c'); Y=Xz('p','q','r')
def jb(A,B): return Mjb(A,B)
def group(deg):
    terms=[('+',2,jb(jb(D_,Y),jb(D_,X))),('+',2,jb(jb(D_,Y),jb(X,D_))),('+',1,jb(jb(D_,Y),jb(X,X))),
           ('+',2,jb(jb(X,Y),jb(D_,D_))),('+',1,jb(jb(X,Y),jb(D_,X))),('+',1,jb(jb(X,Y),jb(X,D_))),
           ('-',2,jb(D_,jb(Y,jb(D_,X)))),('-',2,jb(D_,jb(Y,jb(X,D_)))),('-',1,jb(D_,jb(Y,jb(X,X)))),
           ('-',2,jb(X,jb(Y,jb(D_,D_)))),('-',1,jb(X,jb(Y,jb(D_,X)))),('-',1,jb(X,jb(Y,jb(X,D_))))]
    P=MZ()
    for sgn,dg,T in terms:
        if dg!=deg: continue
        P=Madd(P,T) if sgn=='+' else Msub(P,T)
    return P
def entry_nucnf_zero(M):
    return all(len(nucnf(M[i][j]))==0 for i in range(3) for j in range(3))
g1=group(1); g2=group(2)
print("FREE non-assoc octonions, D central+nuclear ONLY (no alternativity):")
print("  Dg-deg2 group zero (centrality+nuclearity alone):", entry_nucnf_zero(g2))
print("  Dg-deg1 group zero (centrality+nuclearity alone):", entry_nucnf_zero(g1))
for i in range(3):
    for j in range(3):
        print(f"    deg1 ({i},{j}) nuc-NF size: {len(nucnf(g1[i][j]))}   deg2 ({i},{j}) nuc-NF size: {len(nucnf(g2[i][j]))}")
