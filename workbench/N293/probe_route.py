"""
N293 — pin the EXACT Lean reduction chain for ⁅kAB,kBC⁆=famB (cyclic). Exact Fraction.
Reuses the proven make_level Cayley-Dickson builder (as in N292 probes), numpy-free, exact.
"""
from fractions import Fraction as F

def lneg(z): return (lneg(z[0]),lneg(z[1])) if isinstance(z,tuple) else -z
def make_level(mul,star,add,sub):
    def lmul(z,w):
        (a,b)=z;(c,d)=w
        return (sub(mul(a,c),mul(star(d),b)), add(mul(d,a),mul(b,star(c))))
    def lstar(z):
        (a,b)=z; return (star(a),lneg(b))
    def ladd(z,w):
        (a,b)=z;(c,d)=w; return (add(a,c),add(b,d))
    def lsub(z,w):
        (a,b)=z;(c,d)=w; return (sub(a,c),sub(b,d))
    return lmul,lstar,ladd,lsub
Cc=make_level(lambda x,y:x*y, lambda x:x, lambda x,y:x+y, lambda x,y:x-y)
Hl=make_level(*Cc); Ol=make_level(*Hl)
O_mul,O_star,O_add,O_sub=Ol
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def unflat(v):
    a,b,c,d,ee,f,g,h=v; return (((a,b),(c,d)),((ee,f),(g,h)))
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return unflat(v)
E=[basis(i) for i in range(8)]
O0=unflat([F(0)]*8)
one=E[0]; u1=E[1]
def oadd(x,y): return O_add(x,y)
def osub(x,y): return O_sub(x,y)
def omul(x,y): return O_mul(x,y)
def ostar(x): return O_star(x)
def oneg(x): return lneg(x)
def ofromvec(v):
    r=O0
    for i in range(8):
        if v[i]!=0: r=oadd(r,unflat([v[i] if k==i else F(0) for k in range(8)]))
    return r
# 3x3 matrices over O
def M0(): return [[O0 for _ in range(3)] for _ in range(3)]
def mmul(A,B):
    R=M0()
    for i in range(3):
        for j in range(3):
            s=O0
            for k in range(3): s=oadd(s,omul(A[i][k],B[k][j]))
            R[i][j]=s
    return R
def madd(A,B): return [[oadd(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def msub(A,B): return [[osub(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def slot(i,j,c):
    M=M0(); M[i][j]=c; M[j][i]=ostar(c); return M
sA=lambda c: slot(0,1,c); sB=lambda c: slot(0,2,c); sC=lambda c: slot(1,2,c)
DIM=72
def m2v(M):
    out=[]
    for i in range(3):
        for j in range(3): out+=flat(M[i][j])
    return out
basisM=[]
for i in range(3):
    for j in range(3):
        for c in range(8):
            M=M0(); M[i][j]=E[c]; basisM.append(M)
def op_cols(func): return [m2v(func(B)) for B in basisM]
def apply_cols(cols,v):
    res=[F(0)]*DIM
    for k in range(DIM):
        if v[k]!=0:
            ck=cols[k]
            for r in range(DIM): res[r]+=v[k]*ck[r]
    return res
def compose(P,Q): return [apply_cols(P,Q[k]) for k in range(DIM)]
def comm_cols(P,Q):
    PQ=compose(P,Q); QP=compose(Q,P)
    return [[PQ[k][r]-QP[k][r] for r in range(DIM)] for k in range(DIM)]
def Lmul(A): return op_cols(lambda X: jb(A,X))
def innerMul(A,B): return comm_cols(Lmul(A),Lmul(B))
def cols_eq(P,Q): return all(P[k][r]==Q[k][r] for k in range(DIM) for r in range(DIM))
def cols_zero(P): return all(P[k][r]==0 for k in range(DIM) for r in range(DIM))
def cols_scale(P,s): return [[P[k][r]*s for r in range(DIM)] for k in range(DIM)]
def cols_sub(P,Q): return [[P[k][r]-Q[k][r] for r in range(DIM)] for k in range(DIM)]
def innerMul_apply(A,B,X): return msub(jb(A,jb(B,X)), jb(B,jb(A,X)))
def mat_eq(A,B): return all(flat(A[i][j])==flat(B[i][j]) for i in range(3) for j in range(3))
def mat_zero(A): return all(flat(A[i][j])==[F(0)]*8 for i in range(3) for j in range(3))

kAB=innerMul(sA(u1),sB(one))
kBC=innerMul(sB(u1),sC(one))
kCA=innerMul(sC(u1),sA(one))
famA=innerMul(sB(one),sC(one))
famB=innerMul(sC(one),sA(one))
famC=innerMul(sA(one),sB(one))

print("(0) closure (operator identities):")
print("  ⁅kAB,kBC⁆ == famB ?", cols_eq(comm_cols(kAB,kBC), famB))
print("  ⁅kBC,kCA⁆ == famC ?", cols_eq(comm_cols(kBC,kCA), famC))
print("  ⁅kCA,kAB⁆ == -famA?", cols_eq(comm_cols(kCA,kAB), cols_scale(famA,F(-1))))

print("(2) mixed-Leibniz operator lemmas (kAB, cyclic BC leg):")
M2=comm_cols(kAB, Lmul(sC(one)))
M1=comm_cols(kAB, Lmul(sB(u1)))
print("  ⁅kAB,L(slotC 1)⁆ == 0 ?", cols_zero(M2))
print("  ⁅kAB,L(slotB u1)⁆ == L(-slotA 1) ?", cols_eq(M1, Lmul(sA(oneg(one)))))
print("  matrix: kAB·(slotC 1)==0 ?", mat_zero(innerMul_apply(sA(u1),sB(one),sC(one))))
print("  matrix: kAB·(slotB u1)==-slotA 1 ?", mat_eq(innerMul_apply(sA(u1),sB(one),sB(u1)), sA(oneg(one))))
print("  ⁅kAB,L(slotC1)⁆==L(kAB·slotC1) ?", cols_eq(M2, Lmul(innerMul_apply(sA(u1),sB(one),sC(one)))))
print("  ⁅kAB,L(slotBu1)⁆==L(kAB·slotBu1) ?", cols_eq(M1, Lmul(innerMul_apply(sA(u1),sB(one),sB(u1)))))

# THE KEY QUESTION: is the mixed-Leibniz ⁅innerMul A B, L C⁆ = L(innerMul A B (C)) true for
# ANY C when A,B,C Hermitian? (that's exactly innerMul∈derH3 Leibniz, but as OPERATOR).
# innerMul_leibniz_herm gives: innerMul A B (jb X Y) = jb(innerMul A B X) Y + jb X (innerMul A B Y)
# which is EXACTLY ⁅innerMul A B, L Y⁆ X = L(innerMul A B (Y)) X  for Hermitian X (all X? test).
# ⁅D, L C⁆ X = D(jb C X) - jb C (D X). Leibniz: D(jb C X)= jb(D C) X + jb C (D X) => ⁅D,LC⁆X = jb(D C) X = L(D C) X.
# So mixed-Leibniz operator lemma == derivation Leibniz. But innerMul_leibniz_herm requires X Herm.
# TEST: does ⁅innerMul(sA u1)(sB 1), L(sC 1)⁆ = L(innerMul(...)(sC 1)) hold as FULL operator (all X, incl non-Herm)?
print("(3) Is mixed-Leibniz a FULL-operator identity (all X) for these slots?")
for (Cname,C) in [("slotC 1",sC(one)),("slotB u1",sB(u1)),("slotB 1",sB(one)),("slotA 1",sA(one)),("slotA u1",sA(u1)),("slotC u1",sC(u1))]:
    lhs=comm_cols(kAB, Lmul(C))
    rhs=Lmul(innerMul_apply(sA(u1),sB(one),C))
    print(f"  ⁅kAB,L({Cname})⁆ == L(kAB·{Cname}) all-X ? {cols_eq(lhs,rhs)}")
