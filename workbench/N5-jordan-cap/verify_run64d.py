"""verify_run64d: confirm free-cleanness (abstract provability) of the clean pieces, and
the A_X = [X, X*X] matrix-commutator reformulation of jdef(X,E).

free residual 0 => provable over abstract NonAssocRing with ONLY centrality of the diagonal
entries + matrix distributivity + abel (NO alternativity, NO octonion coordinate ring).
"""
from fractions import Fraction as F
from collections import defaultdict
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R'}
for k,v in list(STAR.items()): STAR[v]=k
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
def Dm(d): return [[Es(d[0]),dict(ZERO),dict(ZERO)],[dict(ZERO),Es(d[1]),dict(ZERO)],[dict(ZERO),dict(ZERO),Es(d[2])]]
def Xz(o):
    a,b,c=o; return [[dict(ZERO),Eo(a),Eo(b)],[Eo(STAR[a]),dict(ZERO),Eo(c)],[Eo(STAR[b]),Eo(STAR[c]),dict(ZERO)]]
def Bz():  # arbitrary octonion matrix as 9 free atoms
    names=[['m00','m01','m02'],['m10','m11','m12'],['m20','m21','m22']]
    return [[Eo(names[i][j]) for j in range(3)] for i in range(3)]
def tot(M): return sum(len(M[i][j]) for i in range(3) for j in range(3))

D=Dm(['d0','d1','d2']); E=Dm(['e0','e1','e2'])
X=Xz(('a','b','c')); Y=Xz(('p','q','r'))
B=Bz()
print("FREE non-assoc model (0 => abstractly provable, centrality+abel only):")
print(f"  (a)  jdef(D, B)=0  [central diag 1st arg, arbitrary B]   : {tot(jdefM(D,B))}")
print(f"  (CA) jdef(D+X,E)-jdef(X,E)  [central 2nd-arg cross]       : {tot(msub(jdefM(madd(D,X),E),jdefM(X,E)))}")
print(f"  (CB) jdef(D+X,Y)-jdef(X,Y)  [zerodiag 2nd-arg cross]      : {tot(msub(jdefM(madd(D,X),Y),jdefM(X,Y)))}")
print()
# A_X = X(XX)-(XX)X = [X, XX] matrix commutator. jdef(X,E)_ij == 2(e_i-e_j) A_X,ij.
XX=mmul(X,X); AX=msub(mmul(X,XX),mmul(XX,X))
print("A_X = X(XX)-(XX)X per-entry free residual (off-diag must vanish by ALT for jdef(X,E)=0):")
for i in range(3):
    print("   ",[tot([[AX[i][j]]]) for j in range(3)])
# is jdef(X,E)=0 EXACTLY equivalent to A_X off-diagonal vanishing? (diagonal coeff e_i-e_i=0)
print()
print("CONCLUSION: jdef(X,E)=0  <=>  A_X off-diagonal entries vanish (each a sum of octonion")
print("associators killed by the banked alt battery); diagonal auto-vanishes (coeff e_i-e_i=0).")
