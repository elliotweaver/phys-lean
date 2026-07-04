"""
N291 SELECT — MEASURE-FIRST: the GAUGE-FAMILY COUPLING (cross-term) of f4 = Der(H3(O)).

N287 measured the full f4 structure; N288-290 banked ONLY the family-so(3) piece.
This probe measures the UNBANKED piece: the complement of (jActL(g2) + family-so(3)) in f4.

Hypotheses (theory-native forward beat for star5, the family-symmetry-BREAKING object):
  M1. dim f4 = 52; dim jActL(g2) = 14; dim family-so(3) = 3; they are disjoint (sum 17).
  M2. the complement in f4 has dim 35 = 7 x 5  (the (7,5) = Im(O) (x) traceless-real cross term).
  M3. a CONCRETE cross member Mc = innerMul(slotA v)(slotB 1), v imaginary octonion, is
      nonzero, in f4, and lies OUTSIDE jActL(g2)+family (neither gauge nor family).
  M4. COUPLING teeth: [jActL D, Mc] != 0 (Mc is NOT gauge-neutral, unlike family) and it
      lands back in the complement (g2-covariant); [famX, Mc] != 0 and lands in complement
      (family rotates Mc between slots) -- so Mc COUPLES gauge and family.
  M5. FAMILY-VISIBLE (the star5 point): the complement is NOT in N290's family-blind core;
      the family so(3) acts NONTRIVIALLY on it. Contrast: family-blind core = scalar unit (N290).
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True, precision=4)

# ---- octonion table (N283/N287/N288 convention) ----
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

# ---- Der(O)=g2 (14) + colour(8) ----
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
print("dim Der(O)=g2 =",len(g2mats))

# ---- arena H3(O), 27-dim ----
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
def matrixify(w):
    M=zero_mat()
    for i in range(3): M[i,i]=w[i]*I8[0]
    idx=3
    for (i,j) in pairs:
        for c in range(8):
            M[i,j]+=w[idx]*I8[c]; M[j,i]+=w[idx]*ostar(I8[c]); idx+=1
    return M
def mat_mul(A,B):
    R=zero_mat()
    for i in range(3):
        for j in range(3):
            for k in range(3): R[i,j]+=omul(A[i,k],B[k,j])
    return R
def jprod(A,B):
    return 0.5*(mat_mul(A,B)+mat_mul(B,A))
def jActL_mat(D):
    Mrep=np.zeros((N,N))
    for a in range(N):
        M=arena_basis[a]; R=zero_mat()
        for i in range(3):
            for j in range(3): R[i,j]=D@M[i,j]
        Mrep[:,a]=mat_to_vec(R)
    return Mrep
gauge_lift=[jActL_mat(D) for D in g2mats]   # jActL(g2), 14 mats 27x27
def comm(X,Y): return X@Y-Y@X

# ---- f4 = Der(J3(O)) basis (52) ----
prod_tensor=np.zeros((N,N,N))
for a in range(N):
    for b in range(N):
        prod_tensor[a,b]=mat_to_vec(jprod(arena_basis[a],arena_basis[b]))
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
print("dim f4 = Der(J3(O)) =",f4dim)
F4=np.array([b.reshape(-1) for b in f4basis])   # 52 x 729

# ---- family so(3): index rotations R_ij (real conjugation) ----
def realmat(A3):
    M=zero_mat()
    for i in range(3):
        for j in range(3): M[i,j]=A3[i,j]*I8[0]
    return M
def index_rot(i,j):
    A=np.zeros((3,3)); A[i,j]=1.0; A[j,i]=-1.0; Am=realmat(A)
    Mrep=np.zeros((N,N))
    for a in range(N):
        Mb=arena_basis[a]; R=mat_mul(Am,Mb)-mat_mul(Mb,Am)
        Mrep[:,a]=mat_to_vec(R)
    return Mrep
R01,R02,R12=index_rot(0,1),index_rot(0,2),index_rot(1,2)
fam=[R01,R02,R12]
FAM=np.array([m.reshape(-1) for m in fam])

def rankof(A,t=1e-7): return np.linalg.matrix_rank(A,tol=t)

# ==== M1: dims + disjoint ====
GA=np.array([m.reshape(-1) for m in gauge_lift])
print("\n=== M1 dims ===")
print("rank jActL(g2) =",rankof(GA),"  rank family =",rankof(FAM))
GF=np.vstack([GA,FAM])
print("rank(jActL(g2) U family) =",rankof(GF),"(expect 14+3=17 if disjoint)")

# ==== M2: complement dim in f4 ====
print("\n=== M2 complement ===")
print("rank(f4) =",rankof(F4))
allmat=np.vstack([GA,FAM])
# complement dim = dim f4 - dim(g2+fam) IF g2+fam subset f4
allf4=np.vstack([F4,GA,FAM])
print("rank(f4 U g2 U fam) =",rankof(allf4),"(== dim f4 => g2,fam ⊂ f4)")
print("=> complement dim =", rankof(F4)-rankof(GF), "(expect 35 = 7x5)")

# ==== M3: concrete cross member Mc = innerMul(slotA v)(slotB 1), v = u1 (imaginary) ====
print("\n=== M3 concrete cross member Mc ===")
def Lop(Amat):
    M=np.zeros((N,N))
    for a in range(N): M[:,a]=mat_to_vec(jprod(Amat, arena_basis[a]))
    return M
def slot(idx_pair, cval):  # slot with octonion value cval (8-vec) at off-diag pair
    (i,j)=idx_pair; M=zero_mat(); M[i,j]=cval.copy(); M[j,i]=ostar(cval); return M
u1=I8[1].copy()
sA_u1=slot((0,1),u1)          # slotA u1
sB_1 =slot((0,2),I8[0].copy())# slotB 1
Mc=comm(Lop(sA_u1),Lop(sB_1))
def proj_res(M, basisFlat):
    v=M.reshape(-1); Q,_=np.linalg.qr(basisFlat.T); return np.max(np.abs(v-Q@(Q.T@v)))
print("Mc nonzero? max|Mc| =",np.max(np.abs(Mc)))
print("Mc in f4? residual =",proj_res(Mc,F4))
print("Mc in jActL(g2)? residual =",proj_res(Mc,GA)," (nonzero => NOT gauge)")
print("Mc in family so(3)? residual =",proj_res(Mc,FAM)," (nonzero => NOT family)")
print("Mc in g2+family? residual =",proj_res(Mc,GF)," (nonzero => in the CROSS complement)")

# ==== M4: coupling teeth ====
print("\n=== M4 coupling teeth ===")
# gauge bracket: pick D in g2 with D u1 != 0 (e.g. DJ)
for nm,D in [("DJ",DJ),("DK",DK),("DI",DI)]:
    br=comm(jActL_mat(D),Mc)
    print(f"[jActL {nm}, Mc]: max = {np.max(np.abs(br)):.3f}  in complement? res={proj_res(br,F4):.1e}, in g2+fam? res={proj_res(br,GF):.1e}")
# family bracket
for nm,R in [("R01",R01),("R02",R02),("R12",R12)]:
    br=comm(R,Mc)
    print(f"[{nm}, Mc]: max = {np.max(np.abs(br)):.3f}  in f4? res={proj_res(br,F4):.1e}, in g2+fam? res={proj_res(br,GF):.1e}")

# ==== M5: family-VISIBLE (contrast N290 family-blind core = scalar unit) ====
print("\n=== M5 family acts nontrivially on the complement (family-VISIBLE) ===")
# does any family generator move Mc? (already in M4). Summary:
famacts=max(np.max(np.abs(comm(R,Mc))) for R in fam)
gaugeacts=max(np.max(np.abs(comm(jActL_mat(D),Mc))) for D in [DI,DJ,DK])
print("max family action on Mc =",f"{famacts:.3f}"," (>0 => family-VISIBLE, breaks N290 blindness)")
print("max gauge  action on Mc =",f"{gaugeacts:.3f}"," (>0 => gauge-COUPLED, unlike family so(3))")

# ==== module character: is complement = (7,5)? check g2 acts as 7 copies, so(3) as 5 ====
print("\n=== module character of the complement ===")
# Build complement basis: f4 vectors orthogonal to (g2+fam)
Qgf,_=np.linalg.qr(GF.T)
comp=[]
for b in f4basis:
    v=b.reshape(-1); w=v-Qgf@(Qgf.T@v)
    if np.max(np.abs(w))>1e-6: comp.append(w)
Comp=np.array(comp)
print("raw complement vectors:",Comp.shape[0]," rank:",rankof(Comp))
