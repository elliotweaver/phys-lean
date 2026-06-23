#!/usr/bin/env python3
# DECISIVE: does polarCross2(E,X,Y)=0 from MATRIX-NUCLEARITY of E ALONE (E associates in
# all 3 positions), WITHOUT entry-centrality? Model E's entries as nuclear-but-NONCOMMUTATIVE
# symbols (associate with everything, but do NOT commute). If pc2 reduces to 0 -> pure
# nuclearity (clean abstract matrix lemma). If residue survives -> needs ocR-centrality too.
from collections import defaultdict
# Symbols: 'E0','E1','E2' are E-entries (nuclear: associate in any position, but NOT central).
# Octonion entries a,b,c,p,q,r,as,bs,... are free (nonassoc, noncomm).
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
# Nuclear normal form: repeatedly RE-ASSOCIATE so that any product touching an E-symbol is
# left-normed in a canonical way. Concretely: a tree is in NF if no node has the shape that
# an E-associativity rewrite could change. We canonicalize by fully LEFT-associating around
# E factors. Implement: flatten the tree to a list of "atoms" w.r.t. a chosen association,
# but only E may move across brackets. We model nuclearity by: an associator [A,B,C] = 0
# whenever ANY of A,B,C is "E-pure" (a product of only E-symbols) OR contains... no.
# CORRECT model: E-entries are nuclear ELEMENTS: assoc(x,y,z)=0 if any of x,y,z is an
# E-entry (single symbol). That's the matrix-nuclearity hypothesis lifted to entries.
# We canonicalize trees modulo the rewrite (x*E)*y -> x*(E*y), E*(x*y)->(E*x)*y, (x*y)*E->x*(y*E)
# for SINGLE E-symbols E in ESET. Apply to fixpoint, then compare canonical forms.
def isEsym(t): return isinstance(t,str) and t in ESET
def rewrite(t):
    # one bottom-up rewrite pass; returns (newtree, changed)
    if isinstance(t,str): return t,False
    l,lc=rewrite(t[1]); r,rc=rewrite(t[2]); ch=lc or rc
    t=('*',l,r)
    # E*(x*y) -> (E*x)*y
    if isEsym(t[1]) and isinstance(t[2],tuple):
        return ('*',('*',t[1],t[2][1]),t[2][2]),True
    # (x*y)*E -> x*(y*E)
    if isEsym(t[2]) and isinstance(t[1],tuple):
        return ('*',t[1][1],('*',t[1][2],t[2])),True
    # (x*E)*y -> x*(E*y)
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
def Em():  # E with DISTINCT noncommutative nuclear entries on the diagonal
    M=MZ(); M[0][0]=sym('E0'); M[1][1]=sym('E1'); M[2][2]=sym('E2'); return M
def Mfull(prefix):
    M=MZ()
    for i in range(3):
        for j in range(3): M[i][j]=sym(f'{prefix}{i}{j}')
    return M
def pc2(E,X,Y):
    return Msub(Msub(Madd(J(J(E,Y),J(E,X)), Madd(J(J(E,Y),J(X,E)), J(J(X,Y),J(E,E)))),
                     Madd(J(E,J(Y,J(E,X))), J(E,J(Y,J(X,E)))), ), J(X,J(Y,J(E,E))))
def szmat(M): return [[len(nucnf(M[i][j])) for j in range(3)] for i in range(3)]
def iszero(M): return all(len(nucnf(M[i][j]))==0 for i in range(3) for j in range(3))
E=Em(); Xg=Mfull('x'); Yg=Mfull('y')
print("E nuclear (associates) but entries NON-central; X,Y fully general free matrices:")
print("  polarCross2(E,X,Y) nuc-NF sizes:", szmat(pc2(E,Xg,Yg)))
print("  polarCross2 vanishes by MATRIX-NUCLEARITY of E ALONE (no centrality):", iszero(pc2(E,Xg,Yg)))
