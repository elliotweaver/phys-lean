#!/usr/bin/env python3
# Find the ABSTRACT cancellation structure of polarCross2(D,X,Y)=0 for central+nuclear D.
# Work in the FREE non-assoc algebra with D = single central+nuclear symbol set {D0,D1,D2} on
# diagonal. Print each of the 6 terms' nuc-NF and look for pairwise cancellation, so we can
# write a matrix-level Lean proof (jb-rewrites + Dg_assoc + ocR_comm), NOT entry coordinates.
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
# the six terms with signs:
T = {
 '+T1 jb(jbDY)(jbDX)': ('+', J(J(D,Y),J(D,X))),
 '+T2 jb(jbDY)(jbXD)': ('+', J(J(D,Y),J(X,D))),
 '+T3 jb(jbXY)(jbDD)': ('+', J(J(X,Y),J(D,D))),
 '-T4 jbD(jbY(jbDX))': ('-', J(D,J(Y,J(D,X)))),
 '-T5 jbD(jbY(jbXD))': ('-', J(D,J(Y,J(X,D)))),
 '-T6 jbX(jbY(jbDD))': ('-', J(X,J(Y,J(D,D)))),
}
# Insight to test: with D nuclear+central, jb D M = D*M + M*D and D central => = 2-sided.
# Hypothesis A: T1+T2 cancels against T4+T5 (the deg of D split between the two jb-D's), and
#               T3 cancels against T6. Test by entrywise nuc-NF of the partial sums.
def entries_nf(M): return [[nucnf(M[i][j]) for j in range(3)] for i in range(3)]
def show(name, M):
    nz=sum(1 for i in range(3) for j in range(3) if len(nucnf(M[i][j]))>0)
    print(f"  {name}: nonzero entries = {nz}")
print("Partial-sum cancellation structure (central+nuclear D, arbitrary X,Y):")
s12 = Madd(J(J(D,Y),J(D,X)), J(J(D,Y),J(X,D)))      # +T1+T2
s45 = Madd(J(D,J(Y,J(D,X))), J(D,J(Y,J(X,D))))      # T4+T5
show("T1+T2", s12); show("T4+T5", s45)
show("(T1+T2)-(T4+T5)", Msub(s12,s45))
show("T3", J(J(X,Y),J(D,D))); show("T6", J(X,J(Y,J(D,D))))
show("T3-T6", Msub(J(J(X,Y),J(D,D)), J(X,J(Y,J(D,D)))))
# full
full = Msub(Msub(Madd(s12, J(J(X,Y),J(D,D))), s45), J(X,J(Y,J(D,D))))
show("FULL pc2", full)
