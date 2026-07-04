"""
N292 SELECT — TRACTABILITY of the symmetric-pair closure [k,k] subset family.
The crux: is [innerMul(sA u1)(sB 1), innerMul(sB u1)(sC 1)] = (1/4) famB provable cleanly,
or does non-associativity bite (u1 is imaginary, NOT central, unlike N289's real-unit slots)?

Strategy: mimic N289's tractability test.
 T1. Does the identity hold STRUCTURALLY (free *-ring / over any base), or is it octonion-specific?
     Test over H (associative) and over the free level -- if it needs octonion-specific u1^2=-1,
     that's fine (fold-root), but if it needs full non-assoc coordinate expansion, that's W9.
 T2. Is there a clean intermediate: e.g. does Mc = [jActL(something), famC]? i.e. is the coset
     the image of the family under a gauge/u1 operation, so closure inherits from family closure?
 T3. The FULL Z_c closure: is it genuinely su(3) (dim 8, simple)? Killing form signature?
 T4. Alternative lighter target: covariance law for the coset member analogous to N291.
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
def Lop(Amat):
    M=np.zeros((N,N))
    for a in range(N): M[:,a]=mat_to_vec(jprod(Amat, arena_basis[a]))
    return M
def slot(pair,c):
    (i,j)=pair; M=zero_mat(); M[i,j]=c.copy(); M[j,i]=ostar(c); return M
def innerMul(A,B): return comm(Lop(A),Lop(B))
sA=lambda c: slot((0,1),c); sB=lambda c: slot((0,2),c); sC=lambda c: slot((1,2),c)
def rankof(A,t=1e-7): return np.linalg.matrix_rank(A,tol=t)
def proj_res(M, B):
    v=M.reshape(-1); Q,_=np.linalg.qr(B.T); return np.max(np.abs(v-Q@(Q.T@v)))

famC=innerMul(sA(I8[0]),sB(I8[0])); famA=innerMul(sB(I8[0]),sC(I8[0])); famB=innerMul(sC(I8[0]),sA(I8[0]))
FAM=np.array([famA.reshape(-1),famB.reshape(-1),famC.reshape(-1)])
Mc_ab=innerMul(sA(u1),sB(I8[0]))
Mc_bc=innerMul(sB(u1),sC(I8[0]))
Mc_ca=innerMul(sC(u1),sA(I8[0]))

print("=== T2: is the coset the IMAGE of family under a u1/gauge operation? ===")
# Hypothesis: Mc_ab = [jActL(some g2 elt), famC]? or Mc = L_{u1-related} of famC?
# Test: is Mc_ab in span of [jActL(D), famC] over D in g2? That would make closure inherit.
brs=[comm(jActL_mat(D),famC) for D in g2mats]
BR=np.array([b.reshape(-1) for b in brs])
print("rank {[jActL D, famC] : D in g2} =",rankof(BR))
print("Mc_ab in span{[jActL D, famC]}? res=",proj_res(Mc_ab,BR))
# also try: does jActL(DI) (DI=ad u1) map famC to Mc? 
print("[jActL DI, famC] res onto Mc_ab:",proj_res(comm(jActL_mat(DI),famC), Mc_ab.reshape(1,-1)),
      " mag [jActL DI,famC]=",np.max(np.abs(comm(jActL_mat(DI),famC))))
# Key: is there ANY g2 elt D with [jActL D, famC] ~ Mc_ab (up to scale)?
best=None
for idx,D in enumerate(g2mats):
    b=comm(jActL_mat(D),famC)
    if np.max(np.abs(b))>1e-6:
        r=proj_res(Mc_ab, b.reshape(1,-1))
        if best is None or r<best[0]: best=(r,idx,np.max(np.abs(b)))
print("best single [jActL D, famC] approx to Mc_ab: res=",best)

print("\n=== T3: full Z_c closure -> su(3)? (dim 8, simple, Killing signature) ===")
def centralizer_in_f4(liftlist,f4basis,f4dim):
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
colour_lift=[jActL_mat(D) for D in colourmats]
Zc=centralizer_in_f4(colour_lift,f4basis,f4dim)
print("dim Z_c =",len(Zc))
# closure: is Z_c bracket-closed? (should be, it's a centralizer)
ZC=np.array([m.reshape(-1) for m in Zc])
maxres=0
for i in range(len(Zc)):
    for j in range(i+1,len(Zc)):
        maxres=max(maxres,proj_res(comm(Zc[i],Zc[j]),ZC))
print("Z_c bracket-closed? max residual =",maxres)
# Killing form on Z_c (ad in the 8-dim adjoint): signature -> compact su(3) = all negative
n=len(Zc)
struct=np.zeros((n,n,n))
Q,_=np.linalg.qr(ZC.T)
for i in range(n):
    for j in range(n):
        struct[i,j]=Q.T@comm(Zc[i],Zc[j]).reshape(-1)
Kill=np.zeros((n,n))
for a in range(n):
    for b in range(n):
        Kill[a,b]=sum(struct[a,c,d]*struct[b,d,c] for c in range(n) for d in range(n))
ev=np.linalg.eigvalsh(Kill)
print("Killing form eigenvalues on Z_c:",np.round(ev,2))
print("  (all same sign & nondegenerate => simple compact su(3); rank should be 2)")
# rank = dim of maximal abelian
# quick: is it simple? det Killing != 0
print("Killing det nonzero (semisimple)?",abs(np.linalg.det(Kill))>1e-6)

print("\n=== T4: closure structure constants exact (Fraction check on the decisive bracket) ===")
# [Mc_ab, Mc_bc] = ? famB coefficient. Confirm = 1/4 exactly via rational reconstruction.
br=comm(Mc_ab,Mc_bc)
coef=np.linalg.lstsq(FAM.T,br.reshape(-1),rcond=None)[0]
print("[Mc_ab,Mc_bc] = ",np.round(coef,4)," . [famA,famB,famC]   (expect [0,1/4,0])")
print("residual after family projection:",proj_res(br,FAM))
# and [famC, Mc_ab] -> should be in coset (h acts on k)
bh=comm(famC,Mc_ab)
KMAT=np.array([Mc_ab.reshape(-1),Mc_bc.reshape(-1),Mc_ca.reshape(-1),
               innerMul(sA(I8[0]),sB(u1)).reshape(-1),innerMul(sB(I8[0]),sC(u1)).reshape(-1)])
print("[famC, Mc_ab] in coset(k)? res=",proj_res(bh,KMAT)," mag=",np.max(np.abs(bh)))
