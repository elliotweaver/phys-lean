"""reduction_free (run 62): which reduction sub-claims hold in the FREE non-associative
model (scalars central, octonions free)? Those are provable in Lean by centrality ALONE
(cheap: ocR_comm/assoc + abel, no associator algebra). Claims that need Model B
(alternative) only are the heavy associator pieces.

Reuse the free-magma model from measure_reduction.py structure.
"""
from fractions import Fraction as F
from collections import defaultdict

SCAL={'d0','d1','d2','e0','e1','e2'}
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R'}
for k,v in list(STAR.items()): STAR[v]=k

def smul(s1,s2): return tuple(sorted(s1+s2))
def Eo(atom): return {((),atom):F(1)}
def Es(s): return {((s,),'1'):F(1)}   # central scalar as coefficient on unit '1'
ZERO={}
def vadd(*vs):
    r=defaultdict(F)
    for v in vs:
        for k,c in v.items(): r[k]+=c
    return {k:c for k,c in r.items() if c!=0}
def vneg(v): return {k:-c for k,c in v.items()}
def vsub(a,b): return vadd(a,vneg(b))
def tmul(t1,t2):
    # tree multiply; '1' is unit
    if t1=='1': return t2
    if t2=='1': return t1
    return ('*',t1,t2)
def vmul(a,b):
    r=defaultdict(F)
    for (s1,t1),c1 in a.items():
        for (s2,t2),c2 in b.items():
            r[(smul(s1,s2),tmul(t1,t2))]+=c1*c2
    return {k:c for k,c in r.items() if c!=0}
def viszero(v): return len(v)==0
# matrices
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
def miszero(A): return all(viszero(A[i][j]) for i in range(3) for j in range(3))
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdefM(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA),mneg(jb(A,jb(B,AA))))
def Dm(d): return [[Es(d[0]),dict(ZERO),dict(ZERO)],[dict(ZERO),Es(d[1]),dict(ZERO)],[dict(ZERO),dict(ZERO),Es(d[2])]]
def Xz(o):
    a,b,c=o; return [[dict(ZERO),Eo(a),Eo(b)],[Eo(STAR[a]),dict(ZERO),Eo(c)],[Eo(STAR[b]),Eo(STAR[c]),dict(ZERO)]]

D=Dm(['d0','d1','d2']); E=Dm(['e0','e1','e2'])
X=Xz(('a','b','c')); Y=Xz(('p','q','r'))
DX=madd(D,X)

def report(name,M):
    tot=sum(len(M[i][j]) for i in range(3) for j in range(3))
    print(f"  {name}: residual monomials = {tot}  ({'CENTRALITY-CLEAN' if tot==0 else 'needs alternativity'})")

print("FREE non-assoc model (scalars central). residual=0 => provable by centrality alone:")
report("(2) jdef(D+X, E)            ", jdefM(DX, E))
report("(3) jdef(D+X, Y) - jdef(X,Y)", msub(jdefM(DX,Y), jdefM(X,Y)))
# finer pieces of (3): expand jdef(D+X,Y) by trilinearity? jdef is NOT linear in 1st arg.
# Try: jdef(D, Y), and cross. Just report jdef(D,Y) and jdef over pure diagonal first arg.
report("(2a) jdef(D, E) pure diag   ", jdefM(D, E))
report("(2b) jdef(D, Y)             ", jdefM(D, Y))
report("(3b) jdef(D+X,Y)-jdef(D,Y)-jdef(X,Y) cross", msub(msub(jdefM(DX,Y),jdefM(D,Y)),jdefM(X,Y)))
