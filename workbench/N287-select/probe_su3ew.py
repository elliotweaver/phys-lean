"""
N287 SELECT — MEASURE-FIRST step 5: CHARACTERIZE the colour-commuting second su(3) in f4.
The centralizer of derived colour su(3) inside derived f4 is 8-dim. Verify it is a GENUINE
second su(3) forming a maximal-rank su(3)_c + su(3)_ew subalgebra:
  1. dim = 8
  2. commutes ENTIRELY with colour (colour + cent a commuting pair)
  3. colour ∩ cent = 0 (genuine direct sum, dim 16)
  4. cent is a SUBALGEBRA (bracket-closed) and NON-abelian (semisimple, not toral)
  5. cent is SIMPLE su(3): its own centre is 0, its Killing form nondegenerate; rank 2
  6. cent contains a rank-2 abelian Cartan -> a colour-neutral u(1) commuting with an su(2) INSIDE cent
This is INPUT A: one simple ambient f4 supplies a colour-commuting su(3)_ew with su(2)+u(1).
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True,precision=3)

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
def basis(i):
    v=[F(0)]*8; v[i]=F(1)
    a,b,c,d,ee,f,g,h=v; return (((a,b),(c,d)),((ee,f),(g,h)))
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

def zero_mat(): return np.zeros((3,3,8))
arena_basis=[]
for i in range(3):
    M=zero_mat(); M[i,i]=I8[0]; arena_basis.append(M)
pairs=[(0,1),(0,2),(1,2)]
for (i,j) in pairs:
    for c in range(8):
        M=zero_mat(); M[i,j]=I8[c]; M[j,i]=ostar(I8[c]); arena_basis.append(M)
N=27
def mat_to_vec(M):
    v=np.zeros(N); 
    for i in range(3): v[i]=M[i,i,0]
    idx=3
    for (i,j) in pairs:
        for c in range(8): v[idx]=M[i,j,c]; idx+=1
    return v
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
f4basis=np.load('/Users/elliotweaver/phys-lean/workbench/N287-select/f4basis.npy')
def comm(X,Y): return X@Y-Y@X

# centralizer of colour in f4 -> basis
def centralizer_basis(gens):
    big=[]
    for g in gens:
        Bm=np.array([comm(f4basis[a],g).reshape(-1) for a in range(52)]).T  # 729x52
        big.append(Bm)
    Mbig=np.vstack(big)
    _,sv,vv=np.linalg.svd(Mbig)
    r=int(np.sum(sv>1e-6*sv[0]))
    nullcoeffs=vv[r:]   # each length 52 -> f4 coords
    return [sum(nullcoeffs[t][a]*f4basis[a] for a in range(52)) for t in range(nullcoeffs.shape[0])]
cent=centralizer_basis(colour_lift)
print("dim centralizer_{f4}(colour) =",len(cent))

# 2. commutes entirely with colour (by construction) -- verify
maxc=max(np.max(np.abs(comm(X,g))) for X in cent for g in colour_lift)
print("cent commutes with colour? maxresidual",maxc)

# 3. colour ∩ cent = 0 ?  span(colour_lift) ∩ span(cent)
CL=np.array([m.reshape(-1) for m in colour_lift])   # 8x729
CE=np.array([m.reshape(-1) for m in cent])          # 8x729
both=np.vstack([CL,CE])
r_both=np.linalg.matrix_rank(both,tol=1e-6)
print("dim(colour)+dim(cent)=",len(colour_lift)+len(cent)," dim(colour+cent)=",r_both,
      " => intersection dim",len(colour_lift)+len(cent)-r_both)

# 4. cent bracket-closed & nonabelian
# project [cent_a,cent_b] back onto cent span; measure residual + count nonzero brackets
Qc,_=np.linalg.qr(CE.T)  # 729 x 8
def resid_in_cent(M):
    v=M.reshape(-1); return np.max(np.abs(v-Qc@(Qc.T@v)))
closed=max(resid_in_cent(comm(cent[a],cent[b])) for a in range(len(cent)) for b in range(len(cent)))
nz=sum(1 for a in range(len(cent)) for b in range(a+1,len(cent)) if np.max(np.abs(comm(cent[a],cent[b])))>1e-6)
print("cent bracket-closed? maxresid",closed," nonzero brackets:",nz,"(nonabelian if >0)")

# 5. simple su(3): compute Killing form on cent, check nondegenerate; centre=0
def ad_on_cent(X):
    # matrix of ad_X in cent basis (8x8): [X,cent_b] expressed in cent coords
    M=np.zeros((len(cent),len(cent)))
    for b in range(len(cent)):
        v=comm(X,cent[b]).reshape(-1)
        coord=Qc.T@v  # 8 coords in orthonormal Qc basis... but cent basis != Qc basis
        M[:,b]=np.linalg.lstsq(CE.T,v,rcond=None)[0]
    return M
Kill=np.zeros((8,8))
adm=[ad_on_cent(cent[a]) for a in range(8)]
for a in range(8):
    for b in range(8):
        Kill[a,b]=np.trace(adm[a]@adm[b])
print("Killing form rank on cent:",np.linalg.matrix_rank(Kill,tol=1e-6*np.max(np.abs(Kill))),"(8=semisimple)")
# centre of cent: X in cent with [X,cent]=0
big=[]
for b in range(8):
    Bm=np.array([comm(cent[a],cent[b]).reshape(-1) for a in range(8)]).T
    big.append(Bm)
_,svc,_=np.linalg.svd(np.vstack(big)); centre_dim=8-int(np.sum(svc>1e-6*svc[0]))
print("centre(cent) dim:",centre_dim,"(0=semisimple, simple su(3) has 0)")

# 6. rank-2 Cartan inside cent: max abelian subalgebra. find a generic element's centralizer-in-cent dim = rank
X0=sum((t+1)*cent[t] for t in range(8))
Bm=np.array([comm(cent[a],X0).reshape(-1) for a in range(8)]).T
_,svr,_=np.linalg.svd(Bm); rank_cent=8-int(np.sum(svr>1e-6*svr[0]))
print("rank(cent) [dim generic centralizer in cent]:",rank_cent,"(su(3) has rank 2)")

# Does cent contain an su(2) and a commuting u(1)? i.e. within cent, pick a Cartan H (rank2),
# the two Cartan generators: one can serve as T3 (in an su(2) subalgebra) and one as u(1)_Y.
# Simply: cent is su(3) => it manifestly contains su(2)xu(1) (a Levi/regular subalgebra). Report rank=2 suffices.
print("\n=== VERDICT: colour-commuting second su(3) in f4 ===")
print("dim=",len(cent),"| commutes with colour:",maxc<1e-6,"| colour∩cent=0:",(len(colour_lift)+len(cent)-r_both)==0,
      "| closed:",closed<1e-6,"| nonabelian:",nz>0,"| centre0:",centre_dim==0,"| rank:",rank_cent)
# is su(2)_L (g2 isospin) inside cent?
def in_span(M,basisMs):
    A=np.array([b.reshape(-1) for b in basisMs]).T
    v=M.reshape(-1)
    sol,res,_,_=np.linalg.lstsq(A,v,rcond=None)
    return np.max(np.abs(A@sol-v))
print("g2-isospin LI in cent(su3_ew)? residual",in_span(LI,cent),"(large => isospin NOT the ew-su3, expected)")
