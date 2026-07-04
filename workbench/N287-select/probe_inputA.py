"""
N287 SELECT — MEASURE-FIRST step 4: THE INPUT-A PAYOFF.
Reuse arena/f4 machinery. Lift octonion derivations into f4 via jActL (entrywise on the 27-dim
Hermitian arena). Then measure inside the DERIVED f4=Der(H3(O)):
  A) centralizer of colour(8) in f4: dim? simple su(3)? (the F4 ⊃ su(3)_c ⊕ su(3)_ew = A2⊕A2 pattern)
  B) is su(2)_L = jActL{DI,DJ,DK} inside that centralizer?
  C) does the centralizer contain a colour-neutral generator commuting with su(2)_L -> u(1)_Y ?
This is the structural question the whole N281->N286 ascent was built to answer, posit-free.
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True,precision=4)

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
T=np.zeros((8,8,8)); S=np.zeros((8,8))
for i in range(8):
    for j in range(8):
        c=flat(O_mul(e[i],e[j]))
        for k in range(8): T[i,j,k]=float(c[k])
    cs=flat(O_star(e[i]))
    for k in range(8): S[i,k]=float(cs[k])
def omul(x,y): return np.einsum('ijk,i,j->k',T,x,y)
def ostar(x): return S.T@x

def adH(qidx):
    M=np.zeros((8,8)); qv=I8[qidx]
    for j in range(4):
        M[:,j]=(omul(qv,I8[j])-omul(I8[j],qv))
    a=M[:4,:4]; out=np.zeros((8,8)); out[:4,:4]=a; out[4:,4:]=a
    return out
DI=adH(1);DJ=adH(2);DK=adH(3)
# Der(O) basis + colour
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
uu,ss,vt=np.linalg.svd(np.array(rows)); tol=1e-8
rank=int(np.sum(ss>tol)); g2mats=[vt[r].reshape(8,8) for r in range(rank,64)]
u1=I8[1]
crow=np.array([[ (g2mats[k]@u1)[i] for k in range(14)] for i in range(8)])
_,cs2,cv=np.linalg.svd(crow); cr=int(np.sum(cs2>tol))
colourmats=[sum(cv[r][k]*g2mats[k] for k in range(14)) for r in range(cr,14)]

# arena
def zero_mat(): return np.zeros((3,3,8))
arena_basis=[]
for i in range(3):
    M=zero_mat(); M[i,i]=I8[0]; arena_basis.append(M)
pairs=[(0,1),(0,2),(1,2)]
for (i,j) in pairs:
    for c in range(8):
        M=zero_mat(); M[i,j]=I8[c]; M[j,i]=ostar(I8[c]); arena_basis.append(M)
N=len(arena_basis)
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
# jActL(D): entrywise apply D to each octonion entry. On Hermitian preserves? check.
def jActL_mat(D):
    Mrep=np.zeros((N,N))
    for a in range(N):
        M=arena_basis[a]; R=zero_mat()
        for i in range(3):
            for j in range(3): R[i,j]=D@M[i,j]
        Mrep[:,a]=mat_to_vec(R)
    return Mrep
def jActL_preserves_herm(D):
    for a in range(N):
        M=arena_basis[a]; R=zero_mat()
        for i in range(3):
            for j in range(3): R[i,j]=D@M[i,j]
        # check Hermitian
        for i in range(3):
            for j in range(3):
                if np.max(np.abs(R[i,j]-ostar(R[j,i])))>1e-8: return False
    return True
print("jActL(DI) preserves Herm?",jActL_preserves_herm(DI))
LI=jActL_mat(DI);LJ=jActL_mat(DJ);LK=jActL_mat(DK)
colour_lift=[jActL_mat(D) for D in colourmats]

# f4 basis (recompute)
Jtab=np.load('/Users/elliotweaver/phys-lean/workbench/N287-select/Jtab.npy')
f4basis=np.load('/Users/elliotweaver/phys-lean/workbench/N287-select/f4basis.npy')  # (52,27,27)
print("f4 basis:",f4basis.shape)

# verify LI in f4 (is a derivation)? project onto f4 span and check residual
F4flat=f4basis.reshape(52,-1)      # 52 x 729
Q,_=np.linalg.qr(F4flat.T)         # 729 x 52 orthonormal cols spanning f4
def in_f4(Mrep):
    v=Mrep.reshape(-1)
    proj=Q@(Q.T@v)
    return np.max(np.abs(v-proj))
print("LI in f4? residual",in_f4(LI)," colour[0] in f4?",in_f4(colour_lift[0]))

# centralizer of colour in f4: X in span(f4basis) with [X, colour_k]=0 for all k
def commutator(X,Y): return X@Y-Y@X
def centralizer_in_f4(gens):
    # unknown t (52), X=sum t_a f4basis[a]. condition [X,g]=0 => sum_a t_a [f4basis[a],g]=0
    rows=[]
    for g in gens:
        for a in range(52):
            rows.append(commutator(f4basis[a],g).reshape(-1))
        # this is wrong orientation: we need columns per unknown. Fix below.
    # Build matrix M (rows = conditions, cols=52): entry = [f4basis[a],g] flattened stacked over g
    big=[]
    for g in gens:
        blocks=[commutator(f4basis[a],g).reshape(-1) for a in range(52)]  # each 729
        Bm=np.array(blocks).T   # 729 x 52
        big.append(Bm)
    Mbig=np.vstack(big)  # (729*len(gens)) x 52
    _,sv,_=np.linalg.svd(Mbig)
    r=int(np.sum(sv>1e-6*sv[0]))
    return 52-r,Mbig
dim_cent_colour,Mc=centralizer_in_f4(colour_lift)
print("\n=== dim centralizer_{f4}(colour[8]) =",dim_cent_colour,"===")
# is su(2)_L inside centralizer of colour? check [LI,colour_k]=0
def commutes_all(X,gens): return all(np.max(np.abs(commutator(X,g)))<1e-6 for g in gens)
print("su(2)_L commutes with colour?  LI:",commutes_all(LI,colour_lift),
      " LJ:",commutes_all(LJ,colour_lift)," LK:",commutes_all(LK,colour_lift))

# joint centralizer of colour AND su(2)_L in f4:
dim_joint,_=centralizer_in_f4(colour_lift+[LI,LJ,LK])
print("=== dim JOINT centralizer_{f4}(colour + su(2)_L) =",dim_joint,"===")
# centralizer of su(2)_L alone in f4:
dim_su2,_=centralizer_in_f4([LI,LJ,LK])
print("=== dim centralizer_{f4}(su(2)_L alone) =",dim_su2,"===")
