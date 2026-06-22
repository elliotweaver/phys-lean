"""verify_run64b: per-entry free-model residual + polarization structure for the run-62
decomposition targets (2) jdef(D+X,E) and (3) jdef(D+X,Y)-jdef(X,Y).

Polarize first arg A=D+X by # of X's: jdef(D+X,B)=T0(B)+T1(B)+T2(B)+T3(B), Tk = k copies of X.
We verified T0(B)=jdef(D,B)=0 (clean) and T3(B)=jdef(X,B). So:
  jdef(D+X,B) - jdef(X,B) = T1(B)+T2(B).
(3) reduction: T1(Y)+T2(Y) = 0  (Y zero-diag).
(2): jdef(D+X,E) = jdef(X,E)+T1(E)+T2(E); jdef(X,E)=0 (b); so need T1(E)+T2(E)=0.

We use the FREE non-assoc model (scalars central, octonions free) entrywise: residual 0 = a
given entry is provable by CENTRALITY + ADDITIVE alone (no alternativity); residual>0 = needs alt.
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
def ent(M): return [[len(M[i][j]) for j in range(3)] for i in range(3)]

D=Dm(['d0','d1','d2']); E=Dm(['e0','e1','e2'])
X=Xz(('a','b','c')); Y=Xz(('p','q','r'))
DX=madd(D,X)

print("FREE model per-entry residual (0=centrality+additive clean; >0=needs alternativity):")
print()
J2=jdefM(DX,E)
print("(2) jdef(D+X, E)  [E central diagonal]:")
for row in ent(J2): print("   ",row)
print()
J3=msub(jdefM(DX,Y), jdefM(X,Y))
print("(3) jdef(D+X, Y) - jdef(X,Y)  [Y zero-diag]:")
for row in ent(J3): print("   ",row)
print()
# polarization cross terms alone (should equal J2 and J3 since T0=0,T3 cancels)
# Verify: jdef(D+X,B)-jdef(X,B) == jdef(D+X,B)-jdef(X,B). For (2): jdef(X,E)=0, so J2 == cross only.
JXE=jdefM(X,E)
print("(b check) jdef(X,E) per-entry residual (expect all 0):")
for row in ent(JXE): print("   ",row)
print()
# For (3), is the residual concentrated off-diagonal? print which entries nonzero
print("Summary: (2) nonzero entries:", [(i,j) for i in range(3) for j in range(3) if len(J2[i][j])>0])
print("         (3) nonzero entries:", [(i,j) for i in range(3) for j in range(3) if len(J3[i][j])>0])
