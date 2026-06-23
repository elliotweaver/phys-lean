#!/usr/bin/env python3
# Minimal-hypothesis test for polarCross2 in the FREE non-assoc model.
# Three NF regimes for the diagonal scalar D-set {D0,D1,D2}:
#   (i)  CENTRAL+NUCLEAR : D's commute past everything AND re-associate freely.
#   (ii) NUCLEAR-ONLY    : D's re-associate (assoc(x,y,z)=0 if any is a D-symbol) but do NOT commute.
#   (iii) CENTRAL-ONLY   : D's commute but do NOT re-associate.
# Report pc2 entry sizes under each. This tells us the minimal hypotheses for the Lean lemma.
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
def isDsym(t): return isinstance(t,str) and t in DSET
# nuclear re-association rewrite for single D-symbols (same as pc2_nuclear), to fixpoint
def rew(t):
    if isinstance(t,str): return t,False
    l,lc=rew(t[1]); r,rc=rew(t[2]); ch=lc or rc; t=('*',l,r)
    if isDsym(t[1]) and isinstance(t[2],tuple): return ('*',('*',t[1],t[2][1]),t[2][2]),True
    if isDsym(t[2]) and isinstance(t[1],tuple): return ('*',t[1][1],('*',t[1][2],t[2])),True
    if isinstance(t[1],tuple) and isDsym(t[1][2]): return ('*',t[1][1],('*',t[1][2],t[2])),True
    return t,ch
def nucanon(t):
    while True:
        t2,c=rew(t)
        if not c: return t2
        t=t2
def nf_central_nuclear(P):
    r=defaultdict(int)
    for t,c in P.items(): r[(Dmultiset(t),stripD(t))]+=c   # pull all D out + multiset
    return {k:v for k,v in r.items() if v}
def nf_nuclear_only(P):
    r=defaultdict(int)
    for t,c in P.items(): r[nucanon(t)]+=c   # re-associate around D, but D keeps its POSITION (order matters)
    return {k:v for k,v in r.items() if v}
def nf_central_only(P):
    # D commutes (can move past neighbors) but NOT re-associate: canonicalize by sorting within
    # each multiplication node is wrong (noncomm octonions). Approximate central-only by: pull D
    # to leftmost of its bracket without changing bracket structure. Hard to model cleanly; skip.
    return None
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
g2=pc2(D,X,Y)
def szmat(M,nf): return [[len(nf(M[i][j])) for j in range(3)] for i in range(3)]
print("polarCross2(Dg,Xz,Xz) entry sizes:")
print("  CENTRAL+NUCLEAR NF:", szmat(g2, nf_central_nuclear))
print("  NUCLEAR-ONLY    NF:", szmat(g2, nf_nuclear_only))
