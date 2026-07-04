"""
N292 SELECT — focused structure + tractability for the candidate forward beats.

CONFIRMED (probe_measure): Z_{f4}(colour) = su(3)_2 (dim 8) = family-so(3)[3] (+) coset[5];
[Mc_ab,Mc_bc] in family (symmetric pair su(3)/so(3)); su(2)_L acts (DI fixes, DJ/DK move).

Now measure the EXACT structure to choose + de-risk the Lean route:
 A. The full coset (5-dim): what are the 2 non-off-diagonal directions? diagonal-difference u1-slots?
 B. Symmetric-pair closure structure constants: [k_i,k_j] = c_ijk h_k exactly? (fold-root u1^2=-1 cause)
 C. Isospin (su(2)_L) rep of the coset: does it decompose into definite su(2) irreps? Casimir?
 D. TRACTABILITY: does the coset bracket collapse via a nuclear-like route, or is u1 non-central
    (=> harder)? Measure whether [Mc_ab,Mc_bc] has a clean closed form in slot language.
 E. Is Z_{f4}(colour) = span{ family(3) + u1-dressed-offdiag(3) + u1-dressed-diagonal-diff(2) }?
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
def adH(q):
    M=np.zeros((8,8))
    for j in range(4): M[:,j]=(omul(I8[q],I8[j])-omul(I8[j],I8[q]))
    a=M[:4,:4]; out=np.zeros((8,8)); out[:4,:4]=a; out[4:,4:]=a; return out
DI,DJ,DK=adH(1),adH(2),adH(3)
u1=I8[1].copy()
# g2, colour
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
_,ss,vt=np.linalg.svd(np.array(rows)); rank=int(np.sum(ss>1e-8))
g2mats=[vt[r].reshape(8,8) for r in range(rank,64)]
Mu=np.array([ (m@u1) for m in g2mats ]).T
_,sc,vc=np.linalg.svd(Mu); rc=int(np.sum(sc>1e-8))
colourmats=[sum(cf[a]*g2mats[a] for a in range(14)) for cf in vc[rc:]]

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
def mat_mul(A,B):
    R=zero_mat()
    for i in range(3):
        for j in range(3):
            for k in range(3): R[i,j]+=omul(A[i,k],B[k,j])
    return R
def jprod(A,B): return 0.5*(mat_mul(A,B)+mat_mul(B,A))
def jActL_mat(D):
    Mrep=np.zeros((N,N))
    for a in range(N):
        M=arena_basis[a]; R=zero_mat()
        for i in range(3):
            for j in range(3): R[i,j]=D@M[i,j]
        Mrep[:,a]=mat_to_vec(R)
    return Mrep
def comm(X,Y): return X@Y-Y@X
gauge_lift=[jActL_mat(D) for D in g2mats]
colour_lift=[jActL_mat(D) for D in colourmats]
su2=[jActL_mat(D) for D in [DI,DJ,DK]]
# f4
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
def rankof(A,t=1e-7): return np.linalg.matrix_rank(A,tol=t)
def proj_res(M, B):
    v=M.reshape(-1); Q,_=np.linalg.qr(B.T); return np.max(np.abs(v-Q@(Q.T@v)))
def Lop(Amat):
    M=np.zeros((N,N))
    for a in range(N): M[:,a]=mat_to_vec(jprod(Amat, arena_basis[a]))
    return M
def slot(pair,c):
    (i,j)=pair; M=zero_mat(); M[i,j]=c.copy(); M[j,i]=ostar(c); return M
def innerMul(A,B): return comm(Lop(A),Lop(B))
sA=lambda c: slot((0,1),c); sB=lambda c: slot((0,2),c); sC=lambda c: slot((1,2),c)
def Dg(d0,d1,d2):
    M=zero_mat(); M[0,0]=d0*I8[0]; M[1,1]=d1*I8[0]; M[2,2]=d2*I8[0]; return M

def centralizer_in_f4(liftlist):
    rows=[]
    for L in liftlist:
        for a in range(N):
            for b in range(N):
                row=np.zeros(f4dim)
                for r in range(f4dim):
                    br=f4basis[r]; row[r]=(br@L - L@br)[a,b]
                rows.append(row)
    _,s2,v2=np.linalg.svd(np.array(rows)); rr=int(np.sum(s2>1e-6))
    return [sum(v2[k][r]*f4basis[r] for r in range(f4dim)) for k in range(rr,f4dim)]
Zc=centralizer_in_f4(colour_lift)
ZC=np.array([m.reshape(-1) for m in Zc])
famC=innerMul(sA(I8[0]),sB(I8[0])); famA=innerMul(sB(I8[0]),sC(I8[0])); famB=innerMul(sC(I8[0]),sA(I8[0]))
FAM=np.array([famA.reshape(-1),famB.reshape(-1),famC.reshape(-1)])

print("=== A: build the full 5-dim coset ===")
# candidate coset generators: u1-dressed off-diagonal + u1-dressed against diagonal?
cands={
 "iC_ab":innerMul(sA(u1),sB(I8[0])),   # Mc (N291)
 "iA_bc":innerMul(sB(u1),sC(I8[0])),
 "iB_ca":innerMul(sC(u1),sA(I8[0])),
 "iC_ab'":innerMul(sA(I8[0]),sB(u1)),
 "iA_bc'":innerMul(sB(I8[0]),sC(u1)),
 "iB_ca'":innerMul(sC(I8[0]),sA(u1)),
 # diagonal-difference u1 members: innerMul(slotA u1)(slotA 1)?
 "dAA":innerMul(sA(u1),sA(I8[0])),
 "dBB":innerMul(sB(u1),sB(I8[0])),
 "dCC":innerMul(sC(u1),sC(I8[0])),
}
names=list(cands); mats=[cands[n] for n in names]
M=np.array([m.reshape(-1) for m in mats])
print("rank of all 9 candidate coset members =",rankof(M))
# project off family
Qf,_=np.linalg.qr(FAM.T)
cosetvecs=[]
for n,m in cands.items():
    v=m.reshape(-1); w=v-Qf@(Qf.T@v)
    inZc=proj_res(m,ZC)
    print(f"  {n}: in Z_c? {inZc:.1e}  coset-part mag={np.max(np.abs(w)):.3f}")
    cosetvecs.append(w)
CV=np.array(cosetvecs)
print("rank of coset-parts =",rankof(CV),"(want 5)")

print("\n=== B: symmetric-pair closure [k,k] subset h(family)? structure constants ===")
klist=[cands["iC_ab"],cands["iA_bc"],cands["iB_ca"]]
knames=["iC_ab","iA_bc","iB_ca"]
for a in range(3):
    for b in range(a+1,3):
        br=comm(klist[a],klist[b])
        rf=proj_res(br,FAM); rz=proj_res(br,ZC)
        # coords onto family
        coefs=np.linalg.lstsq(FAM.T, br.reshape(-1), rcond=None)[0]
        print(f"  [{knames[a]},{knames[b]}]: in family? {rf:.1e}  fam-coords={np.round(coefs,3)}  mag={np.max(np.abs(br)):.3f}")

print("\n=== C: su(2)_L isospin rep of the coset ===")
# Cartan DI acts how on the coset? eigenvalues (weights)
# Build a 5-dim coset basis
u2,sv,_=np.linalg.svd(CV.T)
kbasis_flat=u2[:, :5].T  # 5 x 729 orthonormal coset basis
kmats=[v.reshape(N,N) for v in kbasis_flat]
# DI action matrix on coset
def action_matrix(L, basisflat, basismats):
    n=len(basismats); A=np.zeros((n,n))
    Q,_=np.linalg.qr(basisflat.T)
    for c in range(n):
        br=comm(L,basismats[c]).reshape(-1)
        A[:,c]=Q.T@br
    return A
ADI=action_matrix(su2[0],kbasis_flat,kmats)
print("DI (Cartan) eigenvalues on coset:",np.round(np.linalg.eigvals(ADI),3))
# su(2) casimir on coset = DI^2+DJ^2+DK^2 as action
def act(L,m): return comm(L,m)
# casimir action matrix
Qk,_=np.linalg.qr(kbasis_flat.T)
Cas=np.zeros((5,5))
for c in range(5):
    tot=np.zeros(N*N)
    for L in su2:
        tot+=comm(L,comm(L,kmats[c])).reshape(-1)
    Cas[:,c]=Qk.T@tot
print("Casimir eigenvalues on coset:",np.round(np.linalg.eigvals(Cas),3))
print(" (su(2) irrep j has casimir -4j(j+1) in this normalization; check family too)")
# family casimir for reference
Qfam,_=np.linalg.qr(FAM.T)
Casf=np.zeros((3,3)); fammats=[famA,famB,famC]
for c in range(3):
    tot=np.zeros(N*N)
    for L in su2:
        tot+=comm(L,comm(L,fammats[c])).reshape(-1)
    Casf[:,c]=Qfam.T@tot
print("Casimir eigenvalues on FAMILY so(3):",np.round(np.linalg.eigvals(Casf),3))

print("\n=== D: tractability — closed form of [Mc_ab, Mc_bc] in slot language ===")
br=comm(cands["iC_ab"],cands["iA_bc"])
print("[iC_ab,iA_bc] onto family coords:",np.round(np.linalg.lstsq(FAM.T,br.reshape(-1),rcond=None)[0],4))
# is it = c * famB (since ab,bc -> ca closure)?
for n,m in [("famA",famA),("famB",famB),("famC",famC)]:
    print(f"   residual onto span({n}) alone:", proj_res(br, m.reshape(1,-1)))

print("\n=== E: does Z_c = span{family + 6 offdiag-dressed}? or need diagonal-diff (2 more)? ===")
off6=[cands[n] for n in ["iC_ab","iA_bc","iB_ca","iC_ab'","iA_bc'","iB_ca'"]]
O6=np.array([m.reshape(-1) for m in off6])
print("rank(family + 6 offdiag-dressed) =",rankof(np.vstack([FAM,O6])),"(if 8 => that's all of Z_c)")
diag2=[cands[n] for n in ["dAA","dBB","dCC"]]
D3=np.array([m.reshape(-1) for m in diag2])
print("rank(family + 6 offdiag + 3 diag-dressed) =",rankof(np.vstack([FAM,O6,D3])))
print("rank of Z_c basis =",rankof(ZC))
print("does {family + all 9} span Z_c? rank(union with ZC) =",rankof(np.vstack([ZC,FAM,O6,D3])))
