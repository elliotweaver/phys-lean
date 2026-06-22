"""verify_run64h: characterize pieceB (the hard part) and confirm the full assembly plan.

DECOMPOSITION (Hm1 = D+X, Hm2 = E+Y; D,E central diag; X,Y zero-diag Herm):
  jdef(Hm1, Hm2) = jdef(Hm1, E) + jdef(Hm1, Y)          [jdef_add_right]
  pieceA jdef(Hm1, E) = 2(E*G - G*E),  G=comm(Hm1, Hm1*Hm1)   [MASTER IDENTITY, clean]
         = 0  iff  G off-diagonal = 0  (diag killed by n_i-n_j=0 coeff & central commute)
  pieceB jdef(Hm1, Y) =? jdef(X, Y) = 0 (banked jdef_Xz_core)

Q1: is pieceA's G off-diag entry reducible to G_X off-diag (drop central D)? -> reuse machinery
Q2: pieceB structure: jdef(Hm1,Y) directly 0? and how heavy per entry?
Q3: ALT-clean check: does jdef(Hm1,Y) = jdef(X,Y) hold? (the reduction we need)
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
def comm(A,B): return msub(mmul(A,B),mmul(B,A))
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdefM(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA),mneg(jb(A,jb(B,AA))))
def Dm(d): return [[Es(d[0]),dict(ZERO),dict(ZERO)],[dict(ZERO),Es(d[1]),dict(ZERO)],[dict(ZERO),dict(ZERO),Es(d[2])]]
def Xz(o):
    a,b,c=o; return [[dict(ZERO),Eo(a),Eo(b)],[Eo(STAR[a]),dict(ZERO),Eo(c)],[Eo(STAR[b]),Eo(STAR[c]),dict(ZERO)]]
def tot(M): return sum(len(M[i][j]) for i in range(3) for j in range(3))
def grid(M): return [[len(M[i][j]) for j in range(3)] for i in range(3)]

D=Dm(['d0','d1','d2']); E=Dm(['e0','e1','e2'])
X=Xz(('a','b','c')); Y=Xz(('p','q','r'))
Hm1=madd(D,X)

G1=comm(Hm1, mmul(Hm1,Hm1))   # G_Hm1
GX=comm(X, mmul(X,X))          # G_X
print("Q1: G_Hm1 vs G_X off-diagonal (free residual):")
print("  G_Hm1:", grid(G1))
print("  G_X  :", grid(GX))
print("  G_Hm1 - G_X off-diag residual:", tot(msub(G1,GX)) , "(0 => G_Hm1 off-diag == G_X off-diag, central D drops)")
print()
print("Q2/Q3: pieceB jdef(Hm1, Y):")
print("  jdef(Hm1,Y) per-entry:", grid(jdefM(Hm1,Y)))
print("  jdef(X,Y)   per-entry:", grid(jdefM(X,Y)))
cb=msub(jdefM(Hm1,Y), jdefM(X,Y))
print("  jdef(Hm1,Y) - jdef(X,Y) [D-cross, ALT burden]:", tot(cb), grid(cb))
print()
# Is the D-cross a sum of central-scaled X-associators? Check: does it vanish when X-entries
# are made ALTERNATIVE? We can't easily switch model here, but the run-62 ladder already
# showed Zorn(alternative)=0. Confirm the per-building-block reduction (3.p/q/r):
def bblock(which,o):
    a,b,c=o; M=mz()
    if which=='p': M[0][1]=Eo(a); M[1][0]=Eo(STAR[a])
    if which=='q': M[0][2]=Eo(b); M[2][0]=Eo(STAR[b])
    if which=='r': M[1][2]=Eo(c); M[2][1]=Eo(STAR[c])
    return M
print("pieceB per building-block (jdef(Hm1, block) - jdef(X, block)) free residual:")
for nm in ['p','q','r']:
    Yb=bblock(nm, ('p','q','r'))
    print(f"  block {nm}: {tot(msub(jdefM(Hm1,Yb), jdefM(X,Yb)))}")
