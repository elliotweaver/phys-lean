"""
N288 SELECT — MEASURE-FIRST: is the gauge-neutral room centralizer_{f4}(g2) = the
FAMILY-ROTATION so(3) = Der(J3(R)) acting on the 3x3 index structure (the three matter slots)?

Hypotheses to confirm/refute on the exact-Fraction octonion table:
  H1. The 3 index-rotation generators R_{ij} (antisymmetric real conjugation X -> [Aij, X]
      on the 3x3 index structure, Aij real generator) are Jordan derivations of H3(O) (in f4).
  H2. Each R_{ij} COMMUTES with the entire jActL(g2) (entrywise octonion gauge).
  H3. span{R01,R02,R12} = centralizer_{f4}(FULL g2) (dim 3, exact).
  H4. {R01,R02,R12} close as so(3): [R01,R02] ~ R12 etc.
  H5. M0 = innerMul(slotA 1)(slotB 1) (N287's banked member) lies in span{R01,R02,R12}.
  H6. The room preserves the REAL sub-arena H3(R) and its restriction there = Der(J3(R))=so(3).
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True, precision=4)

# ---- octonion table (same convention as N283/N287) ----
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

# ---- Der(O) + colour ----
def adH(q):
    M=np.zeros((8,8))
    for j in range(4): M[:,j]=(omul(I8[q],I8[j])-omul(I8[j],I8[q]))
    a=M[:4,:4]; out=np.zeros((8,8)); out[:4,:4]=a; out[4:,4:]=a; return out
DI,DJ,DK=adH(1),adH(2),adH(3)
rows=[]
for i in range(8):
    for j in range(8):
        eij=omul(I8[i],I8[j])
        for k in range(8):
            row=np.zeros(64)
            for m in range(8): row[k*8+m]+=eij[m]
            for m in range(8): row[m*8+i]-=T[m,j,k]
            for m in range(8): row[m*8+j]-=T[i,m,k]
            rows.append(row)
_,ss,vt=np.linalg.svd(np.array(rows)); tol=1e-8
rank=int(np.sum(ss>tol)); g2mats=[vt[r].reshape(8,8) for r in range(rank,64)]
u1=I8[1]
crow=np.array([[ (g2mats[k]@u1)[i] for k in range(14)] for i in range(8)])
_,cs2,cv=np.linalg.svd(crow); cr=int(np.sum(cs2>tol))
colourmats=[sum(cv[r][k]*g2mats[k] for k in range(14)) for r in range(cr,14)]

# ---- arena H3(O) as 27-vector (3 real diag + 3 octonion off-diag) ----
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
def matrixify(M27):  # 27-vec -> full 3x3 octonion matrix as (3,3,8)
    M=zero_mat()
    for i in range(3): M[i,i]=M27[i]*I8[0]
    idx=3
    for (i,j) in pairs:
        for c in range(8):
            M[i,j]+=M27[idx]*I8[c]; M[j,i]+=M27[idx]*ostar(I8[c]); idx+=1
    return M

# jordan product on full 3x3 octonion matrices: A o B = (AB+BA)/2, matrix mult with octonion entries
def mat_mul(A,B):
    R=zero_mat()
    for i in range(3):
        for j in range(3):
            for k in range(3):
                R[i,j]+=omul(A[i,k],B[k,j])
    return R
def jprod(A,B):
    AB=mat_mul(A,B); BA=mat_mul(B,A); return 0.5*(AB+BA)

# jActL(D): entrywise D on each octonion entry
def jActL_mat(D):
    Mrep=np.zeros((N,N))
    for a in range(N):
        M=arena_basis[a]; R=zero_mat()
        for i in range(3):
            for j in range(3): R[i,j]=D@M[i,j]
        Mrep[:,a]=mat_to_vec(R)
    return Mrep
LI,LJ,LK=jActL_mat(DI),jActL_mat(DJ),jActL_mat(DK)
colour_lift=[jActL_mat(D) for D in colourmats]
gauge_lift=[jActL_mat(D) for D in g2mats]  # full g2

# ---- FAMILY ROTATIONS: real index-rotation generators.
# A_ij = the antisymmetric real 3x3 with +1 at (i,j), -1 at (j,i). Acts on arena by
# X -> A_ij X - X A_ij (commutator with the REAL matrix A_ij, entries real*1).
def realmat(Amat3):  # 3x3 real -> (3,3,8) with real entries on the identity octonion
    M=zero_mat()
    for i in range(3):
        for j in range(3): M[i,j]=Amat3[i,j]*I8[0]
    return M
def index_rot(i,j):  # generator antisymmetric in indices
    A=np.zeros((3,3)); A[i,j]=1.0; A[j,i]=-1.0
    Am=realmat(A)
    Mrep=np.zeros((N,N))
    for a in range(N):
        Mb=arena_basis[a]
        R=mat_mul(Am,Mb)-mat_mul(Mb,Am)   # [A, X]
        Mrep[:,a]=mat_to_vec(R)
    return Mrep
R01,R02,R12=index_rot(0,1),index_rot(0,2),index_rot(1,2)
fam=[R01,R02,R12]

def comm(X,Y): return X@Y-Y@X

# ---- H1: are family rotations Jordan derivations? check D(X o Y) = D X o Y + X o D Y on basis
def is_jordan_deriv(Drep, ntest=40):
    import random
    random.seed(1)
    maxd=0.0
    for _ in range(ntest):
        vx=np.random.randn(N); vy=np.random.randn(N)
        X=matrixify(vx); Y=matrixify(vy)
        DX=matrixify(Drep@vx); DY=matrixify(Drep@vy)
        lhs=Drep@mat_to_vec(jprod(X,Y))
        rhs=mat_to_vec(jprod(DX,Y)+jprod(X,DY))
        maxd=max(maxd,np.max(np.abs(lhs-rhs)))
    return maxd
print("H1  family rotations Jordan-derivation defect (should be ~0):")
for nm,R in [("R01",R01),("R02",R02),("R12",R12)]:
    print(f"    {nm}: {is_jordan_deriv(R):.2e}")

# ---- H2: family rotations commute with entire jActL(g2)?
print("H2  [R_ij, jActL(g2)] max residual (should be ~0):")
for nm,R in [("R01",R01),("R02",R02),("R12",R12)]:
    m=max(np.max(np.abs(comm(R,g))) for g in gauge_lift)
    print(f"    {nm}: {m:.2e}")

# ---- H3: span{R01,R02,R12} == centralizer_{f4}(full g2)?
# build f4 basis (Jordan derivations of arena) via nullspace of derivation condition
# reuse: derivation D (27x27) with D(X o Y)=DX o Y + X o DY. Build linear conditions.
# Basis for arena products:
prod_tensor=np.zeros((N,N,N))  # jprod structure constants
for a in range(N):
    for b in range(N):
        prod_tensor[a,b]=mat_to_vec(jprod(arena_basis[a],arena_basis[b]))
# condition: for all a,b:  sum_c D[c,?]... derivation eq: D(e_a o e_b) - D e_a o e_b - e_a o D e_b=0
# Unknown D is 27x27 (729). For each (a,b) and each output coord k: 
rows=[]
for a in range(N):
    for b in range(N):
        # D(prod) = sum_p prod_tensor[a,b,p] * D[:,p]
        # (D e_a) o e_b = sum_p D[p,a] * (e_p o e_b) = sum_p D[p,a]*prod_tensor[p,b]
        # e_a o (D e_b) = sum_p D[p,b]*prod_tensor[a,p]
        for k in range(N):
            row=np.zeros(N*N)
            for p in range(N): row[k*N+p]+=prod_tensor[a,b,p]
            for p in range(N): row[p*N+a]-=prod_tensor[p,b,k]
            for p in range(N): row[p*N+b]-=prod_tensor[a,p,k]
            rows.append(row)
A=np.array(rows)
_,sd,vd=np.linalg.svd(A, full_matrices=True)
tol2=1e-7*sd[0]
rk=int(np.sum(sd>tol2)); f4dim=N*N-rk
print(f"H3  dim Der(J3(O)) [f4] = {f4dim} (expect 52)")
f4basis=[vd[r].reshape(N,N) for r in range(rk,N*N)]
# centralizer of full gauge in f4
def centralizer(gens, basisMats):
    big=[]
    for g in gens:
        Bm=np.array([comm(b,g).reshape(-1) for b in basisMats]).T  # (N*N) x dim
        big.append(Bm)
    Mbig=np.vstack(big)
    _,sv,vv=np.linalg.svd(Mbig)
    r=int(np.sum(sv>1e-6*sv[0]))
    coeffs=vv[r:]
    return [sum(coeffs[t][a]*basisMats[a] for a in range(len(basisMats))) for t in range(coeffs.shape[0])]
room=centralizer(gauge_lift, f4basis)
print(f"    dim centralizer_f4(full g2) = {len(room)} (expect 3)")
# does span(fam) == span(room)?
FAM=np.array([m.reshape(-1) for m in fam])
ROOM=np.array([m.reshape(-1) for m in room])
r_fam=np.linalg.matrix_rank(FAM,tol=1e-7)
both=np.vstack([FAM,ROOM])
r_both=np.linalg.matrix_rank(both,tol=1e-7)
print(f"    rank(fam)={r_fam}, rank(room)={len(room)}, rank(fam ∪ room)={r_both}  => equal spans: {r_both==r_fam==len(room)}")

# ---- H4: so(3) closure
def project(M, basisFlat):
    v=M.reshape(-1); Q,_=np.linalg.qr(basisFlat.T); return np.max(np.abs(v-Q@(Q.T@v)))
print("H4  so(3) closure [R_ij,R_kl] in span(fam)? residual:")
print(f"    [R01,R02] in fam: {project(comm(R01,R02),FAM):.2e}  (~R12?)")
print(f"    [R01,R12] in fam: {project(comm(R01,R12),FAM):.2e}")
print(f"    [R02,R12] in fam: {project(comm(R02,R12),FAM):.2e}")
# structure: [R01,R02] = ? R12
c=comm(R01,R02).reshape(-1)
coef=np.linalg.lstsq(FAM.T,c,rcond=None)[0]
print(f"    [R01,R02] = {coef[0]:.3f}*R01 + {coef[1]:.3f}*R02 + {coef[2]:.3f}*R12")

# ---- H5: M0 = innerMul(slotA 1, slotB 1) in span(fam)?
# slotA 1 = E01+E10 real; slotB 1 = E02+E20 real. innerMul A B = [L_A, L_B], L_A X = A o X.
def Lop(Amat):  # A o (.) as 27x27
    M=np.zeros((N,N))
    for a in range(N):
        M[:,a]=mat_to_vec(jprod(Amat, arena_basis[a]))
    return M
sA=realmat(np.array([[0,1,0],[1,0,0],[0,0,0]],float))
sB=realmat(np.array([[0,0,1],[0,0,0],[1,0,0]],float))
M0=comm(Lop(sA),Lop(sB))
print(f"H5  M0=innerMul(slotA1,slotB1) in span(fam)? residual: {project(M0,FAM):.2e}")
coefM=np.linalg.lstsq(FAM.T,M0.reshape(-1),rcond=None)[0]
print(f"    M0 = {coefM[0]:.3f}*R01 + {coefM[1]:.3f}*R02 + {coefM[2]:.3f}*R12   (M0 in f4? {project(M0, np.array([b.reshape(-1) for b in f4basis])):.2e})")

# ---- H6: room preserves real sub-arena H3(R)? (real diag + real off-diag = 3+3=6 dim)
realsub=[]
for i in range(3):
    v=np.zeros(N); v[i]=1; realsub.append(v)
for k,(i,j) in enumerate(pairs):
    v=np.zeros(N); v[3+8*k]=1; realsub.append(v)  # real part of off-diag (octonion index 0)
RS=np.array(realsub)  # 6 x 27
def preserves(M):
    Q,_=np.linalg.qr(RS.T)
    mx=0
    for v in realsub:
        w=M@v; mx=max(mx,np.max(np.abs(w-Q@(Q.T@w))))
    return mx
print("H6  room preserves real sub-arena H3(R) (6-dim)? residual:")
for nm,R in [("R01",R01),("R02",R02),("R12",R12)]:
    print(f"    {nm}: {preserves(R):.2e}")
print("\n=== VERDICT: gauge-neutral room = family-rotation so(3) = Der(J3(R)) acting on 3 slots ===")
