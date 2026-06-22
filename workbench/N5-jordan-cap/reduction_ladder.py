"""reduction_ladder (run 62): can claims (2),(3) be built from the BANKED building blocks
(single-second-generator) + centrality-clean diagonal pieces, WITHOUT new heavy coordinate
proofs? Test additive decompositions that reduce to pieces already proven or centrality-clean.

(2) jdef(D+X, E):  E = Dm(e0,e1,e2) is a SUM of central diagonal slots. Is jdef(D+X, E)
    additive in E's slots and each slot central => reduces to jdef(D+X, single central)?
    jdef is NOT linear in 2nd arg's... wait, jdef_add_right IS additive in 2nd arg. So
    E = Es0 + Es1 + Es2 (diagonal slots) and jdef(D+X, E) = sum jdef(D+X, slot_i).
    Each slot is a single central scalar on the diagonal. Test if jdef(D+X, Es_i)=0 in FREE.

(3) jdef(D+X, Y) where Y zero-diagonal: split Y = Yp+Yq+Yr (building-block second args).
    jdef_add_right => jdef(D+X,Y) = jdef(D+X,Yp)+jdef(D+X,Yq)+jdef(D+X,Yr). And we want
    each = jdef(X, Yp) etc. Test jdef(D+X, Yp) - jdef(X, Yp) in FREE (per building block).
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
def vsub(a,b): return vadd(a,vneg(b))
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
def slot(i,val): # diagonal matrix with val at (i,i)
    M=mz(); M[i][i]=val; return M
def Dm(d): return madd(slot(0,Es(d[0])),slot(1,Es(d[1])),slot(2,Es(d[2])))
def Xz(o):
    a,b,c=o; M=mz()
    M[0][1]=Eo(a); M[1][0]=Eo(STAR[a]); M[0][2]=Eo(b); M[2][0]=Eo(STAR[b]); M[1][2]=Eo(c); M[2][1]=Eo(STAR[c])
    return M
def bblock(which,o):  # zero-diag with single second-generator slot
    a,b,c=o; M=mz()
    if which=='p': M[0][1]=Eo(a); M[1][0]=Eo(STAR[a])
    if which=='q': M[0][2]=Eo(b); M[2][0]=Eo(STAR[b])
    if which=='r': M[1][2]=Eo(c); M[2][1]=Eo(STAR[c])
    return M
def tot(M): return sum(len(M[i][j]) for i in range(3) for j in range(3))

D=Dm(['d0','d1','d2']); X=Xz(('a','b','c')); DX=madd(D,X)
print("FREE model. residual=0 => centrality-clean / reduces to banked block:")
# (2) per central slot
for i in range(3):
    s=slot(i,Es(f'e{i}'))
    print(f"  (2.{i}) jdef(D+X, slot{i} central)        : {tot(jdefM(DX,s))}")
# (3) per building block: jdef(D+X, block) - jdef(X, block)
Yp=bblock('p',('p','x','y')); Yq=bblock('q',('x','q','y')); Yr=bblock('r',('x','y','r'))
for nm,Yb in [('p',Yp),('q',Yq),('r',Yr)]:
    print(f"  (3.{nm}) jdef(D+X, block_{nm}) - jdef(X, block_{nm}) : {tot(msub(jdefM(DX,Yb), jdefM(X,Yb)))}")
