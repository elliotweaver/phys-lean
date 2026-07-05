"""
N297 MEASURE-FIRST. Theory-native target (S2/S4): the DILATION/TRACELESS SPLIT of the
spectrum-moving sector L, graded by the linear trace (the trace-zero Cartan hyperplane).

The story: f4 = Der(H3(O)) FIXES the degenerate spectral point 1 = diag(1,1,1) (T 1 = 0).
The Jordan left-mults Lmul MOVE it (Lmul A 1 = 2A). We measure the SPLITTING structure:

 (1) DILATION IS f4-CENTRAL:  [T, Lmul 1] = Lmul(T 1) = Lmul 0 = 0  for every T in f4.
     (Immediate from N296 equivariance + derH3_kills_one.)  Lmul 1 = 2*id (pure scaling).
 (2) DIAGONAL MOVERS SPLIT:   Lmul(Dg t0 t1 t2) 1 = 2*Dg t0 t1 t2 = Dg(2t0)(2t1)(2t2):
     the degenerate eigenvalues {1,1,1} of 1 get displacement 2*(t0,t1,t2).
 (3) TRACE GRADING:  jTr(Lmul(Dg) 1) = 2*(t0+t1+t2); the SPLITTING (trace-free displacement)
     lives EXACTLY on t0+t1+t2 = 0 (the N213 charge hyperplane / N214 jTF_one_Dg_zero_iff).
 (4) W8 non-vacuity: Lmul(Dg 1 -1 0) 1 = Dg 2 -2 0 != 0, traceless (jTr=0), distinct from dilation.

 CHILD-SCOPE DECISIONS (measure whether cheap enough to include this run):
 (5) "innerMul kills jTr":  trace(innerMul A B M) = trace([[A,B],M]) = 0  (trace of a
     commutator) -- measure exactness. This is the CLEAN generator-level route.
 (6) abstract "derH3 kills jTr": over the SVD-computed f4 basis, is jTr(T A) ~ 0 for all T?
     (Confirms the fact is TRUE so the childed f4-submodule refinement is real, not a mirage.)
 (7) jS behaviour under the split (the quadratic invariant / eigenvalue discriminant), to see
     if a jS observation belongs in this node or the child.
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True, precision=4, linewidth=200)

# ---- octonion (Cayley-Dickson) exact machinery ----
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
e=[basis(i) for i in range(8)]
T=np.zeros((8,8,8)); Sst=np.zeros((8,8))
for i in range(8):
    for j in range(8):
        cc=flat(O_mul(e[i],e[j]))
        for k in range(8): T[i,j,k]=float(cc[k])
    cs=flat(O_star(e[i]))
    for k in range(8): Sst[i,k]=float(cs[k])
def omul(x,y): return np.einsum('ijk,i,j->k',T,x,y)
def ostar(x): return Sst.T@x
I8=np.eye(8)

# ---- arena J3(O)=H3(O): 27-dim ----
pairs=[(0,1),(0,2),(1,2)]
def zero_mat(): return np.zeros((3,3,8))
arena_basis=[]
for i in range(3):
    M=zero_mat(); M[i,i]=I8[0]; arena_basis.append(M)
for (i,j) in pairs:
    for c in range(8):
        M=zero_mat(); M[i,j]=I8[c]; M[j,i]=ostar(I8[c]); arena_basis.append(M)
N=27
def mat_to_vec(M):
    v=np.zeros(N)
    for i in range(3): v[i]=M[i,i,0]
    idx=3
    for (i,j) in pairs:
        for c in range(8): v[idx]=M[i,j,c]; idx+=1
    return v
def mat_mul(A,B):
    R=zero_mat()
    for i in range(3):
        for j in range(3):
            for k in range(3): R[i,j]+=omul(A[i,k],B[k,j])
    return R
def full_mat_mul(A,B):  # general 3x3 octonion matrices (not necessarily Hermitian)
    return mat_mul(A,B)
def jb_mat(A,B): return mat_mul(A,B)+mat_mul(B,A)         # jb A B = A*B + B*A (banked)
def Lop(Amat):    # L_A X = jb A X, matrix of the endomorphism on arena_basis
    M=np.zeros((N,N))
    for a in range(N): M[:,a]=mat_to_vec(jb_mat(Amat, arena_basis[a]))
    return M
def vec_to_mat(v):
    M=zero_mat()
    for i in range(3): M[i,i]=v[i]*I8[0]
    idx=3
    for (i,j) in pairs:
        for c in range(8):
            M[i,j]+=v[idx]*I8[c]; idx+=1
        M[j,i]=ostar(M[i,j])
    return M

IdM=zero_mat()
for i in range(3): IdM[i,i]=I8[0]
def Dg(t0,t1,t2):
    M=zero_mat(); M[0,0]=t0*I8[0]; M[1,1]=t1*I8[0]; M[2,2]=t2*I8[0]; return M
def slotA(a): M=zero_mat(); M[0,1]=a; M[1,0]=ostar(a); return M
def slotB(b): M=zero_mat(); M[0,2]=b; M[2,0]=ostar(b); return M
def jTr(M):  # linear trace = sum of diagonal (real) parts; return the octonion trace
    return M[0,0]+M[1,1]+M[2,2]
def comm(X,Y): return X@Y-Y@X

# ---- f4 = Der(J3(O)) via jb-derivation SVD ----
prod_tensor=np.zeros((N,N,N))
for a in range(N):
    for b in range(N):
        prod_tensor[a,b]=mat_to_vec(jb_mat(arena_basis[a],arena_basis[b]))
rows=[]
for a in range(N):
    for b in range(N):
        for k in range(N):
            row=np.zeros(N*N)
            for p in range(N): row[k*N+p]+=prod_tensor[a,b,p]
            for p in range(N): row[p*N+a]-=prod_tensor[p,b,k]
            for p in range(N): row[p*N+b]-=prod_tensor[a,p,k]
            rows.append(row)
_,sd,vd=np.linalg.svd(np.array(rows)); tol2=1e-7*sd[0]
rk=int(np.sum(sd>tol2)); f4dim=N*N-rk
f4basis=[vd[r].reshape(N,N) for r in range(rk,N*N)]
print("dim f4 = Der(J3(O)) =",f4dim,"(expect 52)")

L1 = Lop(IdM)  # the dilation Lmul 1
print("\n=== (1) DILATION IS f4-CENTRAL: [T, Lmul 1] = 0 for every T in f4 ? ===")
mx=0.0
for Dm in f4basis:
    mx=max(mx, np.max(np.abs(comm(Dm, L1))))
print("  max || [T, Lmul 1] || over f4 basis =",mx,"(~0 => dilation is f4-central)")
print("  Lmul 1 == 2*id ? max|L1 - 2I| =",np.max(np.abs(L1-2*np.eye(N))),"(0 => Lmul 1 = 2*id, pure scaling)")

print("\n=== (2) DIAGONAL MOVERS SPLIT: Lmul(Dg t0 t1 t2) 1 = Dg(2t0)(2t1)(2t2) ? ===")
t0,t1,t2 = 1,-1,0
disp = jb_mat(Dg(t0,t1,t2), IdM)   # Lmul(Dg) applied to 1
target = Dg(2*t0,2*t1,2*t2)
print("  || Lmul(Dg 1 -1 0) 1 - Dg 2 -2 0 || =",np.max(np.abs(disp-target)),"(0 => displacement = 2*(t0,t1,t2))")

print("\n=== (3) TRACE GRADING: jTr(Lmul(Dg) 1) = 2*(t0+t1+t2) ; splitting <=> trace-zero ===")
for (a,b,c) in [(1,-1,0),(1,1,1),(2,3,5),(1,0,-1)]:
    d=jb_mat(Dg(a,b,c),IdM)
    tr=jTr(d)[0]   # real part of the octonion trace
    print(f"  Dg({a},{b},{c}): jTr(Lmul 1)={tr}  2*(sum)={2*(a+b+c)}  traceless<=>sum0: sum={a+b+c}")

print("\n=== (4) W8: Lmul(Dg 1 -1 0) 1 traceless & != 0 & distinct from dilation ===")
d=jb_mat(Dg(1,-1,0),IdM)
print("  jTr =",jTr(d)[0],"(0 => traceless splitting)")
print("  || Lmul(Dg 1 -1 0) 1 || =",np.linalg.norm(mat_to_vec(d)),"(!=0 => genuine split)")
# distinct from any multiple of the dilation direction (=identity): displacement is diag(2,-2,0), not prop to 1
print("  is it a multiple of the identity direction? diag =",[d[i,i,0] for i in range(3)],"(not all equal => not a dilation)")

print("\n=== (5) innerMul kills jTr:  trace(innerMul A B M) = trace([[A,B],M]) = 0 ? ===")
rng=np.random.default_rng(3)
def rand_arena(): return vec_to_mat(rng.standard_normal(N))
mx5=0.0; mxcomm=0.0
for _ in range(30):
    A=rand_arena(); B=rand_arena(); M=rand_arena()
    im = jb_mat(A,jb_mat(B,M)) - jb_mat(B,jb_mat(A,M))    # innerMul A B M
    mx5=max(mx5, abs(jTr(im)[0]))
    # compare to [[A,B],M] where [X,Y]=XY-YX associative
    AB = mat_mul(A,B)-mat_mul(B,A)
    cc = mat_mul(AB,M)-mat_mul(M,AB)
    mxcomm=max(mxcomm, np.max(np.abs((im-cc).reshape(-1))))
print("  max |jTr(innerMul A B M)| =",mx5,"(~0 => innerMul kills the trace)")
print("  max || innerMul A B M - [[A,B],M] || =",mxcomm,"(~0 => innerMul A B M = [[A,B],M], trace-of-commutator route EXACT)")

print("\n=== (6) abstract: over the SVD f4 basis, jTr(T A) ~ 0 for all T ? ===")
mx6=0.0
for Dm in f4basis:
    for _ in range(3):
        Av=rng.standard_normal(N)
        TA=Dm@Av
        mx6=max(mx6, abs(jTr(vec_to_mat(TA))[0]))
print("  max |jTr(T A)| over f4 x arena =",mx6,"(~0 => derH3 kills jTr is TRUE; the childed submodule refinement is real)")

print("\n=== (7) jS under the split (quadratic invariant / eigenvalue discriminant) ===")
def jS_diag(t0,t1,t2): return t0*t1+t0*t2+t1*t2
print("  jS(1,1,1)=",jS_diag(1,1,1),"(degenerate point)")
for eps in [F(1,10)]:
    # displaced point 1 + eps*(2*Dg t) along traceless t=(1,-1,0): eigenvalues 1+2eps, 1-2eps, 1
    p=(1+2*eps, 1-2*eps, 1)
    print(f"  displaced 1+eps*Lmul(Dg 1 -1 0)1 (eps={eps}): eigs~{[float(x) for x in p]}, jS={float(jS_diag(*p))} (< 3 => degeneracy lifted)")

print("\nDONE probe1")
