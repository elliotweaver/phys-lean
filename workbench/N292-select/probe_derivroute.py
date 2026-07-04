"""
N292 SELECT — DE-RISK the symmetric-pair closure via the DERIVATION-PROPERTY Jacobi route.
CLAIM: since kAB in derH3 is a Jordan derivation, [kAB, innerMul A B] (=[kAB,[L_A,L_B]])
       = innerMul(kAB.A)(B) + innerMul(A)(kAB.B)   (Jacobi + [D,L_X]=L_{DX}).
Then kAB.(sBu1), kAB.(sC1) are single-entry slot elements => tractable closed form.
Verify numerically that this route reproduces [kAB,kBC] = c.famB (no coordinate bash).
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
C=make_level(lambda x,y:x*y,lambda x:x,lambda x,y:x+y,lambda x,y:x-y)
Hl=make_level(*C); Ol=make_level(*Hl); O_mul,O_star,_,_=Ol
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
def jprod(A,B): return 0.5*(mat_mul(A,B)+mat_mul(B,A))
def comm(X,Y): return X@Y-Y@X
def Lop(Amat):
    M=np.zeros((N,N))
    for a in range(N): M[:,a]=mat_to_vec(jprod(Amat, arena_basis[a]))
    return M
def slot(pair,c):
    (i,j)=pair; M=zero_mat(); M[i,j]=c.copy(); M[j,i]=ostar(c); return M
def innerMul(A,B): return comm(Lop(A),Lop(B))
sA=lambda c: slot((0,1),c); sB=lambda c: slot((0,2),c); sC=lambda c: slot((1,2),c)
def op_apply(op, Amat): return vec_to_mat(op@mat_to_vec(Amat))

famB=innerMul(sC(I8[0]),sA(I8[0]))
kAB=innerMul(sA(u1),sB(I8[0])); kBC=innerMul(sB(u1),sC(I8[0]))

# direct bracket
direct=comm(kAB,kBC)

# derivation-property route: [kAB, innerMul(sBu1,sC1)]
#   = innerMul(kAB.(sBu1))(sC1) + innerMul(sBu1)(kAB.(sC1))
sBu1=sB(u1); sC1=sC(I8[0])
kAB_sBu1 = op_apply(kAB, sBu1)   # kAB applied to slotB u1
kAB_sC1  = op_apply(kAB, sC1)    # kAB applied to slotC 1
route = innerMul(kAB_sBu1, sC1) + innerMul(sBu1, kAB_sC1)

print("=== VERIFY the derivation-property Jacobi route ===")
print("max|direct - route| =", np.max(np.abs(direct-route)), " (0 => route valid)")
print("kAB(slotB u1) nonzero entries:", {k:round(mat_to_vec(kAB_sBu1)[k],3) for k in range(N) if abs(mat_to_vec(kAB_sBu1)[k])>1e-6})
print("kAB(slotC 1) nonzero entries:", {k:round(mat_to_vec(kAB_sC1)[k],3) for k in range(N) if abs(mat_to_vec(kAB_sC1)[k])>1e-6})
# so [kAB,kBC] = innerMul(kAB.sBu1)(sC1) + innerMul(sBu1)(kAB.sC1); if kAB.sC1=0, single term.
print("\n=== if kAB(slotC 1)=0, the closure = innerMul(kAB.sBu1)(sC1) single term ===")
print("kAB.sC1 == 0 ?", np.max(np.abs(kAB_sC1))<1e-9)
single=innerMul(kAB_sBu1,sC1)
print("max|direct - innerMul(kAB.sBu1)(sC1)| =",np.max(np.abs(direct-single)))
# what is kAB.sBu1 in slot language? it looked like a slotA member
v=mat_to_vec(kAB_sBu1)
print("kAB(slotB u1) =", {k:round(v[k],3) for k in range(N) if abs(v[k])>1e-6})

# now compare to c.famB
coef=np.linalg.lstsq(famB.reshape(-1,1),direct.reshape(-1),rcond=None)[0]
print("\n[kAB,kBC] = c.famB, c =",round(float(coef[0]),4),"  residual:",np.max(np.abs(direct-coef[0]*famB)))

# Also confirm kAB is a derivation (Leibniz on jb): D(jb X Y)=jb(DX)Y+jb X(DY)
print("\n=== confirm kAB is a Jordan derivation (Leibniz) — basis check ===")
bad=0
for a in range(N):
    for b in range(N):
        X=arena_basis[a]; Y=arena_basis[b]
        lhs=op_apply(kAB, jprod(X,Y))
        rhs=jprod(op_apply(kAB,X),Y)+jprod(X,op_apply(kAB,Y))
        if np.max(np.abs(mat_to_vec(lhs)-mat_to_vec(rhs)))>1e-9: bad+=1
print("Leibniz failures over 27x27 basis pairs:",bad,"(0 => kAB is a genuine Jordan derivation)")
