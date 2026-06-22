"""verify_run64f: lock the decomposition. Confirm in the FREE non-assoc model (0 => provable
abstractly by centrality+matrix-distrib+abel, NO alternativity) and locate the alt-burdens.

MASTER IDENTITY (clean): jdef(A, E) = 2 * [(n_i - n_j) entrywise] * comm(A, A*A),
   where comm(A,S) = A*S - S*A (matrix commutator), E = diag(n_i central). ANY A.
=> jdef(A,E)=0  iff  comm(A, A*A) off-diagonal entries vanish (diag killed by n_i-n_i=0).

DECOMPOSITION of the full target jdef(Hm,Hm), Hm = D + X (D central diag, X zero-diag Herm):
  jdef(Hm,Hm) = jdef(Hm,E) + jdef(Hm,Y)         [jdef_add_right, Hm 2nd arg = E + Y]
  pieceA jdef(Hm,E): master id => need comm(Hm, Hm*Hm) off-diag = 0.
  pieceB jdef(Hm,Y): Y zero-diag. Need a separate route.
Report free residuals (per entry) for:
  M1 = master identity defect for A=Hm  (must be free-0 => abstract)
  C_Hm = comm(Hm, Hm*Hm) off-diagonal  (alt burden of pieceA; how many monomials)
  C_X  = comm(X, X*X) off-diagonal     (if we route pieceA via CA->jdef(X,E), pure octonion)
  pieceB direct jdef(Hm,Y) per entry; and jdef(Hm,Y)-jdef(X,Y) (D-cross, alt burden of pieceB)
"""
from fractions import Fraction as F
from collections import defaultdict
SCAL={'d0','d1','d2','e0','e1','e2','n0','n1','n2'}
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
def vscal(c,v): return {k:c*x for k,x in v.items()} if c!=0 else {}
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
def comm(A,B): return msub(mmul(A,B),mmul(B,A))
def Dm(d): return [[Es(d[0]),dict(ZERO),dict(ZERO)],[dict(ZERO),Es(d[1]),dict(ZERO)],[dict(ZERO),dict(ZERO),Es(d[2])]]
def Xz(o):
    a,b,c=o; return [[dict(ZERO),Eo(a),Eo(b)],[Eo(STAR[a]),dict(ZERO),Eo(c)],[Eo(STAR[b]),Eo(STAR[c]),dict(ZERO)]]
def tot(M): return sum(len(M[i][j]) for i in range(3) for j in range(3))
def entgrid(M): return [[len(M[i][j]) for j in range(3)] for i in range(3)]

D=Dm(['d0','d1','d2']); E=Dm(['e0','e1','e2'])
X=Xz(('a','b','c')); Y=Xz(('p','q','r'))
Hm=madd(D,X)

# MASTER IDENTITY check for A=Hm: jdef(Hm,E) - 2*(e_i-e_j)*comm(Hm, Hm*Hm)
CHm=comm(Hm, mmul(Hm,Hm))
def coeffmat(M,e): # 2*(e_i-e_j)*M_ij : multiply entry by scalar token (e_i)-(e_j); represent symbolically
    R=mz()
    for i in range(3):
        for j in range(3):
            # 2*(e_i - e_j) * M_ij  -- multiply M_ij (octonion) by central scalar (e_i - e_j)
            term=dict(ZERO)
            for (s,t),c in M[i][j].items():
                # left-multiply by scalar e_i and e_j on the SCALAR part
                term=vadd(term, {(smul(s,(e[i],)),t): 2*c})
                term=vadd(term, {(smul(s,(e[j],)),t): -2*c})
            R[i][j]=term
    return R
M1=msub(jdefM(Hm,E), coeffmat(CHm,['e0','e1','e2']))
print("FREE model. residual 0 => abstractly provable (centrality + matrix-distrib + abel):")
print(f"  M1 = jdef(Hm,E) - 2(e_i-e_j)comm(Hm,Hm*Hm)  [MASTER IDENTITY] : {tot(M1)}")
print()
print(f"  comm(Hm,Hm*Hm) per-entry monomials (off-diag = pieceA alt burden):")
for row in entgrid(CHm): print("     ",row)
CX=comm(X,mmul(X,X))
print(f"  comm(X,X*X) per-entry monomials (pure octonion, if route via CA):")
for row in entgrid(CX): print("     ",row)
print()
print(f"  CA = jdef(Hm,E)-jdef(X,E)  [clean? drop D from 1st arg, central 2nd]: {tot(msub(jdefM(Hm,E),jdefM(X,E)))}")
print()
print(f"  pieceB jdef(Hm,Y) per-entry monomials:")
for row in entgrid(jdefM(Hm,Y)): print("     ",row)
print(f"  pieceB D-cross jdef(Hm,Y)-jdef(X,Y) [alt burden]: {tot(msub(jdefM(Hm,Y),jdefM(X,Y)))}")
print(f"     per-entry:")
for row in entgrid(msub(jdefM(Hm,Y),jdefM(X,Y))): print("     ",row)
