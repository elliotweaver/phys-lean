"""verify_run64c: decide the exact decomposition. Polarize first arg A=D+X.
jdef cubic in A => jdef(D+X,B) = T0+T1+T2+T3, T0=jdef(D,B)=0(clean), T3=jdef(X,B).
Question per 2nd-arg type: are the CROSS terms T1(B)+T2(B) clean (centrality only, free=0)
or do they need alternativity?

We compute, in BOTH free (scalars central, octonions free) and exact Zorn:
  CA := jdef(D+X,E) - jdef(X,E)      [= T1(E)+T2(E), central 2nd arg]
  CB := jdef(D+X,Y) - jdef(X,Y)      [= T1(Y)+T2(Y), zero-diag 2nd arg]
free residual 0 => provable by centrality+additive ALONE (no alt). >0 => needs alt.
Also report jdef(X,E) and jdef(X,Y) free residuals for reference (the core's burden).
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
def tot(M): return sum(len(M[i][j]) for i in range(3) for j in range(3))

D=Dm(['d0','d1','d2']); E=Dm(['e0','e1','e2'])
X=Xz(('a','b','c')); Y=Xz(('p','q','r'))
DX=madd(D,X)

print("FREE model residuals (0=centrality+additive clean, no alt needed):")
CA=msub(jdefM(DX,E), jdefM(X,E))
CB=msub(jdefM(DX,Y), jdefM(X,Y))
print(f"  CA = jdef(D+X,E)-jdef(X,E)  [central 2nd-arg cross] total={tot(CA)}  entries={ent(CA)}")
print(f"  CB = jdef(D+X,Y)-jdef(X,Y)  [zerodiag 2nd-arg cross] total={tot(CB)}  entries={ent(CB)}")
print(f"  jdef(X,E)  [core burden, central 2nd] total={tot(jdefM(X,E))}  entries={ent(jdefM(X,E))}")
print(f"  jdef(X,Y)  [banked core] total={tot(jdefM(X,Y))}  entries={ent(jdefM(X,Y))}")
print()
# If CA and CB are clean (free=0), the WHOLE reduction is centrality+additive and only
# jdef(X,E)=0 + jdef(X,Y)=0(banked) carry the alt. jdef(X,E)=0 off-diag = A_X associator.
# If CA/CB NOT clean, the cross terms themselves carry alt -> heavier.
