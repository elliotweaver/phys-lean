"""verify_run64g: find the exact MATRIX-LEVEL form of the master identity, to enable a
structural Lean proof (no entrywise octonion bash). Candidates for jdef(A,E), E=diag(n_i) central:
  cand1: 2*(E*G - G*E)         G = A*(A*A)-(A*A)*A
  cand2: 2*(E*G - G*E)         G = A*AA - AA*A, AA=A*A   (same)
  cand3: jb(E,?) forms
Test for general A (free model, abstract central n_i) AND exact Zorn (A=Hm).
Goal: a clean matrix identity provable by matrix distributivity + centrality of E's entries.
"""
from fractions import Fraction as F
from collections import defaultdict
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R',
      'm00':'M00','m01':'M01','m02':'M02','m10':'M10','m11':'M11','m12':'M12','m20':'M20','m21':'M21','m22':'M22'}
def smul(s1,s2): return tuple(sorted(s1+s2))
def Eo(atom): return {((),atom):F(1)}
def Es(s): return {((s,),'1'):F(1)}
ZERO={}
def vadd(*vs):
    r=defaultdict(F)
    for v in vs:
        for k,c in v.items(): r[k]+=c
    return {k:c for k,c in r.items() if c!=0}
def vneg(v): return {k:-c for k,c in v.items()}
def tmul(t1,t2):
    if t1=='1': return t2
    if t2=='1': return t1
    return ('*',t1,t2)
def vmul(a,b):
    r=defaultdict(F)
    for (s1,t1),c1 in a.items():
        for (s2,t2),c2 in b.items():
            r[(smul(s1,s2),tmul(t1,t2))]+=c1*c2
    return {k:c for k,c in r.items() if c!=0}
def mz(): return [[dict(ZERO) for _ in range(3)] for _ in range(3)]
def madd(*Ms):
    R=mz()
    for M in Ms:
        for i in range(3):
            for j in range(3): R[i][j]=vadd(R[i][j],M[i][j])
    return R
def mneg(A): return [[vneg(x) for x in row] for row in A]
def msub(A,B): return madd(A,mneg(B))
def mscalar2(A): return [[vadd(x,x) for x in row] for row in A]
def mmul(A,B):
    C=mz()
    for i in range(3):
        for j in range(3):
            s=dict(ZERO)
            for k in range(3): s=vadd(s,vmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdefM(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA),mneg(jb(A,jb(B,AA))))
def comm(A,B): return msub(mmul(A,B),mmul(B,A))
def tot(M): return sum(len(M[i][j]) for i in range(3) for j in range(3))
def Em(n): return [[Es(n[0]),dict(ZERO),dict(ZERO)],[dict(ZERO),Es(n[1]),dict(ZERO)],[dict(ZERO),dict(ZERO),Es(n[2])]]
def Agen():  # fully general 3x3 octonion (free)
    nm=[['m00','m01','m02'],['m10','m11','m12'],['m20','m21','m22']]
    return [[Eo(nm[i][j]) for j in range(3)] for i in range(3)]

E=Em(['n0','n1','n2'])
A=Agen()
AA=mmul(A,A)
G=msub(mmul(A,AA), mmul(AA,A))    # A*(A*A) - (A*A)*A
cand1=mscalar2(comm(E,G))          # 2*(E*G - G*E)
print("FREE model, A fully general. residual 0 => clean matrix identity (distrib+centrality):")
print(f"  jdef(A,E) - 2*(E*G - G*E),  G=A(AA)-(AA)A   : {tot(msub(jdefM(A,E), cand1))}")
# also try G' = comm(A,AA) = A*AA - AA*A  (same as G). and 2*(G*E - E*G) sign check
cand2=mscalar2(comm(G,E))
print(f"  jdef(A,E) - 2*(G*E - E*G)  (opposite sign)   : {tot(msub(jdefM(A,E), cand2))}")
print()
print("Per-entry monomials of jdef(A,E) (general A) and of G:")
print("  jdef(A,E):", [[len(jdefM(A,E)[i][j]) for j in range(3)] for i in range(3)])
print("  G        :", [[len(G[i][j]) for j in range(3)] for i in range(3)])
print()
# CONCLUSION target: jdef(A,E) = 2*(E*G - G*E). Then jdef(Hm,Dm)=2(Dm*G_Hm - G_Hm*Dm).
# If G_Hm is DIAGONAL and Dm diagonal central -> comm=0. So pieceA reduces to: G_Hm off-diag=0.
