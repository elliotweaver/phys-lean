"""
N292 — de-risk the CLOSURE Lean route. The closure needs, as operators:
  [kAB, L_C] = L_{kAB . C}   for C = slotB u1 (Herm), arbitrary X  (the mixed Leibniz)
If TRUE, then Jacobi gives [kAB, innerMul C D] = innerMul(kAB C)(D)+innerMul(C)(kAB D).
Test whether the mixed Leibniz [kAB, L_C] X = jb(kAB C) X holds for ALL X (kAB C computed).
Also test the DIRECT bracket-of-innerMuls Leibniz identity as OPERATORS.
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True, precision=4, linewidth=200)
def make_level(mul,star,add,sub):
    def lmul(z,w):
        (a,b)=z;(c,d)=w
        return (sub(mul(a,c),mul(star(d),b)),add(mul(d,a),mul(b,star(c))))
    def lstar(z):
        (a,b)=z; return (star(a),lneg(b))
    def ladd(z,w):
        (a,b)=z;(c,d)=w; return (add(a,c),add(b,d))
    def lsub(z,w):
        (a,b)=z;(c,d)=w; return (sub(a,c),sub(b,d))
    return lmul,lstar,ladd,lsub
def lneg(z): return (lneg(z[0]),lneg(z[1])) if isinstance(z,tuple) else -z
Cc=make_level(lambda x,y:x*y,lambda x:x,lambda x,y:x+y,lambda x,y:x-y)
Hl=make_level(*Cc); Ol=make_level(*Hl); O_mul,O_star,_,_=Ol
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def unflat(v):
    a,b,c,d,ee,f,g,h=v; return (((a,b),(c,d)),((ee,f),(g,h)))
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return unflat(v)
e=[basis(i) for i in range(8)]; I8=np.eye(8)
T=np.zeros((8,8,8)); Sst=np.zeros((8,8))
for i in range(8):
    for j in range(8):
        cc=flat(O_mul(e[i],e[j]))
        for k in range(8): T[i,j,k]=float(cc[k])
    cs=flat(O_star(e[i]))
    for k in range(8): Sst[i,k]=float(cs[k])
def omul(x,y): return np.einsum('ijk,i,j->k',T,x,y)
def ostar(x): return Sst.T@x
u1=I8[1].copy()
pairs=[(0,1),(0,2),(1,2)]; N=27
def zero_mat(): return np.zeros((3,3,8))
arena_basis=[]
for i in range(3):
    M=zero_mat(); M[i,i]=I8[0]; arena_basis.append(M)
for (i,j) in pairs:
    for c in range(8):
        M=zero_mat(); M[i,j]=I8[c]; M[j,i]=ostar(I8[c]); arena_basis.append(M)
def mat_to_vec(M):
    v=np.zeros(N)
    for i in range(3): v[i]=M[i,i,0]
    idx=3
    for (i,j) in pairs:
        for c in range(8): v[idx]=M[i,j,c]; idx+=1
    return v
def vec_to_mat(v):
    M=zero_mat()
    for i in range(3): M[i,i]=v[i]*I8[0]
    idx=3
    for (i,j) in pairs:
        for c in range(8): M[i,j]+=v[idx]*I8[c]; M[j,i]+=v[idx]*ostar(I8[c]); idx+=1
    return M
def mat_mul(A,B):
    R=zero_mat()
    for i in range(3):
        for j in range(3):
            for k in range(3): R[i,j]+=omul(A[i,k],B[k,j])
    return R
def jb(A,B): return mat_mul(A,B)+mat_mul(B,A)   # NOTE jb = AB+BA (banked def, NOT halved)
def comm(X,Y): return X@Y-Y@X
def Lop(Amat):  # L_A X = jb A X
    M=np.zeros((N,N))
    for a in range(N): M[:,a]=mat_to_vec(jb(Amat, arena_basis[a]))
    return M
def slot(pair,c):
    (i,j)=pair; M=zero_mat(); M[i,j]=c.copy(); M[j,i]=ostar(c); return M
def innerMul(A,B): return comm(Lop(A),Lop(B))
sA=lambda c: slot((0,1),c); sB=lambda c: slot((0,2),c); sC=lambda c: slot((1,2),c)
def op_apply(op,Amat): return vec_to_mat(op@mat_to_vec(Amat))

kAB=innerMul(sA(u1),sB(I8[0]))
C=sB(u1)   # Hermitian slotB u1
# kAB . C
kABC=op_apply(kAB, C)
print("kAB . (slotB u1) =", {k:round(mat_to_vec(kABC)[k],3) for k in range(N) if abs(mat_to_vec(kABC)[k])>1e-6})
# test [kAB, L_C] X == L_{kAB C} X for ALL basis X ?
LC=Lop(C); LkABC=Lop(kABC)
lhs=comm(kAB,LC); rhs=LkABC
print("MIXED LEIBNIZ [kAB,L_C]=L_{kAB C}? max|lhs-rhs| over ops =",np.max(np.abs(lhs-rhs)))
# if FALSE, by how much / on which X?
diff=lhs-rhs
if np.max(np.abs(diff))>1e-9:
    for a in range(N):
        d=diff[:,a]
        if np.max(np.abs(d))>1e-9:
            print(f"  fails on basis X[{a}]: {[round(x,3) for x in d if abs(x)>1e-6][:5]}")
            break

# The DIRECT operator identity used in the numeric closure route:
kBC=innerMul(sB(u1),sC(I8[0]))
famB=innerMul(sC(I8[0]),sA(I8[0]))
sBu1=sB(u1); sC1=sC(I8[0])
kAB_sBu1=op_apply(kAB,sBu1); kAB_sC1=op_apply(kAB,sC1)
route=innerMul(kAB_sBu1,sC1)+innerMul(sBu1,kAB_sC1)
print("\nDIRECT closure identity [kAB,kBC]=innerMul(kAB sBu1)(sC1)+innerMul(sBu1)(kAB sC1)?")
print("  max|[kAB,kBC]-route| =",np.max(np.abs(comm(kAB,kBC)-route)))
print("  [kAB,kBC]=c*famB, c=",round(float(np.linalg.lstsq(famB.reshape(-1,1),comm(kAB,kBC).reshape(-1),rcond=None)[0][0]),4))
print("  (jb here = AB+BA unhalved; coefficient may differ from halved-jb probes)")
