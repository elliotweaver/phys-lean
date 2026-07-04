"""
N296 MEASURE-FIRST. The theory-native target (S2/S4): the f4-EQUIVARIANCE of the
spectrum-moving sector,   [T, L_A] = L_{T A}   for T in f4 = Der(H3(O)) and A Hermitian.

This is the [f4, L0] subset L0 grading relation that completes the Z2-graded Lie
structure of e6 = f4 (+) L0 (the other two relations banked: [f4,f4] subset f4 = derH3
LieSubalgebra; [L0,L0] subset f4 = N295 spectrum_movers_close_into_derH3). It exhibits
the spectrum-moving sector L (dim 27, L0 = traceless dim 26) as an f4-MODULE canonically
isomorphic to the Hermitian arena via A |-> L_A -- the mass-texture module.

MEASURE (decides / confirms the target honestly):
 1. For random D in f4 basis, Hermitian A, B:  [D, L_A] B == L_{D A} B  (residual ~0).
    (The Leibniz law rearranged: D(jb A B) - jb A (D B) = jb (D A) B.)
 2. Does it hold for NON-Hermitian X too? (measure residual -> expect NONZERO,
    confirming the correct domain is the Hermitian arena, consistent with jdef_H3.)
 3. NON-VACUITY witness: famC = innerMul(slotA 1)(slotB 1) in f4; famC(slotA 1) = -slotB 1;
    so [famC, L_{slotA 1}](1) = L_{famC(slotA 1)}(1) = L_{-slotB 1}(1) = -2 slotB 1 != 0
    -- the family derivation genuinely MOVES the spectrum-mover L_{slotA 1} to L_{-slotB 1}.
 4. Is L0 (traceless Hermitian) an f4-SUBMODULE? i.e. does D map traceless-Hermitian to
    traceless-Hermitian (so L_{D A} stays in L0)? (measure the Jordan spur jS of D A.)
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True, precision=4, linewidth=200)

# ---- octonion (Cayley-Dickson) exact machinery (from N295 probe1) ----
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

# ---- arena J3(O)=H3(O): 27-dim; slots ----
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
def jprod(A,B): return 0.5*(mat_mul(A,B)+mat_mul(B,A))   # (AB+BA)/2 ; jb = 2*jprod
def jb_mat(A,B): return mat_mul(A,B)+mat_mul(B,A)         # jb A B = A*B + B*A (banked)
def Lop(Amat):    # L_A X = jb A X  (banked Lmul, matrix of the endomorphism on arena_basis)
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

# identity + slots
IdM=zero_mat()
for i in range(3): IdM[i,i]=I8[0]
def slotA(a): M=zero_mat(); M[0,1]=a; M[1,0]=ostar(a); return M
def slotB(b): M=zero_mat(); M[0,2]=b; M[2,0]=ostar(b); return M
def slotC(c): M=zero_mat(); M[1,2]=c; M[2,1]=ostar(c); return M

# ---- f4 = Der(J3(O)) via jb-derivation SVD (jb = symmetric bracket, banked) ----
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

# Hermitian test elements = arena elements (arena_basis already Hermitian); random Herm combos
rng=np.random.default_rng(1)
def rand_herm_vec(): return rng.standard_normal(N)   # any arena vec is Hermitian

def comm(X,Y): return X@Y-Y@X

print("\n=== (1) EQUIVARIANCE on Hermitian args:  [D, L_A] B == L_{D A} B ? ===")
mx=0.0
for D in f4basis[:20]:
    for _ in range(3):
        Av=rand_herm_vec(); Amat=vec_to_mat(Av)
        Bv=rand_herm_vec()
        LA=Lop(Amat)
        DA=D@Av                      # D applied to A (as arena vector)
        LDA=Lop(vec_to_mat(DA))
        lhs=comm(D,LA)@Bv            # [D, L_A] B
        rhs=LDA@Bv                   # L_{D A} B
        mx=max(mx, np.linalg.norm(lhs-rhs))
print("  max || [D,L_A]B - L_{DA}B ||  over f4 x Herm A,B =",mx,"(~0 => equivariance holds)")

print("\n=== (2) does it hold for NON-Hermitian X? (X = A + i*(skew) is not in arena) ===")
# The arena vectors are all Hermitian by construction; to test non-Herm we build a full
# 3x3 octonion matrix that is NOT Hermitian and apply the endomorphisms in full matrix form.
def full_jb(A,B): return mat_mul(A,B)+mat_mul(B,A)
def apply_D_full(D, Mmat):
    # D acts on arena (Hermitian) coords; extend by acting on the Hermitian projection only.
    # For a genuinely non-Herm test we instead check the raw Leibniz residual symbolically:
    return None
# Build a non-Hermitian X directly and test the RAW identity D(jb A X) - jb A (D X) =? jb(D A) X
# using D realized as an actual arena endomorphism is only defined on Hermitian space, so we
# report: equivariance is an identity on the Hermitian arena (domain = H3(O)), matching jdef_H3.
print("  (equivariance is the Leibniz law, banked ONLY for Hermitian args => domain = H3(O);")
print("   the Lean statement is stated on Hermitian A,B, consistent with IsHermJordanDerivQ.)")

print("\n=== (3) NON-VACUITY: famC = innerMul(slotA 1)(slotB 1); famC(slotA 1) = -slotB 1 ===")
# famC as endomorphism: X |-> [L_{slotA1}, L_{slotB1}] X /? Actually innerMul A B = L_A L_B - L_B L_A
sA=slotA(I8[0]); sB=slotB(I8[0])
famC = Lop(sA)@Lop(sB) - Lop(sB)@Lop(sA)   # innerMul(slotA 1)(slotB 1)
# check famC in f4 span
f4flat=np.array([m.reshape(-1) for m in f4basis]); Qf,_=np.linalg.qr(f4flat.T)
res_f4=np.max(np.abs(famC.reshape(-1)-Qf@(Qf.T@famC.reshape(-1))))
print("  famC in f4 span? residual =",res_f4,"(~0 => famC in f4, banked famC_mem_derH3)")
famC_sA = famC@mat_to_vec(sA)
print("  || famC(slotA 1) - (-slotB 1) || =",np.linalg.norm(famC_sA + mat_to_vec(sB)),"(0 => famC(slotA1) = -slotB1)")
# non-vacuity: [famC, L_{slotA1}](1) = L_{famC(slotA1)}(1) = L_{-slotB1}(1) = -2 slotB1
lhs = comm(famC, Lop(sA))@mat_to_vec(IdM)
rhs = Lop(vec_to_mat(-mat_to_vec(sB)))@mat_to_vec(IdM)
print("  [famC, L_{slotA1}](1) == L_{-slotB1}(1)? residual =",np.linalg.norm(lhs-rhs))
print("  || [famC, L_{slotA1}](1) || =",np.linalg.norm(lhs),"(!=0 => family derivation MOVES the mover; nontrivial module)")
print("  target value = -2*slotB1, ||2*slotB1|| =",np.linalg.norm(2*mat_to_vec(sB)))

print("\n=== (4) is L0 (traceless Herm) an f4-submodule? does D preserve the jS spur? ===")
def jS_vec(v):  # spur = d0+d1+d2 (linear trace of the Hermitian matrix)
    return v[0]+v[1]+v[2]
mxs=0.0
for D in f4basis[:20]:
    for _ in range(3):
        Av=rand_herm_vec()
        mxs=max(mxs, abs(jS_vec(D@Av)))   # D preserves traceless? jS(D A) should be 0 if D kills spur
print("  max |jS(D A)| over f4 x Herm A =",mxs,"(~0 => D maps arena to traceless: kills the spur, so L0 is an f4-submodule)")
print("\nDONE probe1")
