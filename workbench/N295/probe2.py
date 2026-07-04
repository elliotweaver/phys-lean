"""
N295 probe2 — the LINCHPIN measurement (clean, no cubic finite-diff noise).

CLAIM to test: the traceless left-multiplications L_0(J) MOVE the spectrum (change the
LINEAR trace jTr = sum of eigenvalues, and the quadratic spur jS = sum of pairwise
products) while every derivation D in f4 PRESERVES all of jTr, jS, jN.

jTr is LINEAR and jS is QUADRATIC, so their first variations are EXACT (no finite-diff
noise). The first variation of an invariant I along generator X at element v is I'(v)[Xv]:
 - jTr linear:   dI = jTr(X v)
 - jS quadratic: dI = 2*jS_bilinear(v, X v)   (measured via symmetric finite diff, exact for quadratic)

If L_0 moves jTr (eigenvalue SUM) but preserves jN (eigenvalue PRODUCT / determinant),
that is EXACTLY a spectrum-splitting boost with fixed determinant = the mass-texture
generator the star5 front needs and f4 (N269) provably cannot supply.
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True, precision=5, linewidth=200)

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
def oreal(x): return x[0]
def onorm2(x): return float(x@x)

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
def vec_to_mat(v):
    M=zero_mat()
    for i in range(3): M[i,i]=v[i]*I8[0]
    idx=3
    for (i,j) in pairs:
        cc=np.zeros(8)
        for c in range(8): cc[c]=v[idx]; idx+=1
        M[i,j]=cc; M[j,i]=ostar(cc)
    return M
def mat_mul(A,B):
    R=zero_mat()
    for i in range(3):
        for j in range(3):
            for k in range(3): R[i,j]+=omul(A[i,k],B[k,j])
    return R
def jprod(A,B): return 0.5*(mat_mul(A,B)+mat_mul(B,A))
def Lop(Amat):
    M=np.zeros((N,N))
    for a in range(N): M[:,a]=mat_to_vec(jprod(Amat, arena_basis[a]))
    return M

# spectral invariants
def jTr(v): return v[0]+v[1]+v[2]
def entries(v):
    return v[0],v[1],v[2],v[3:11],v[11:19],v[19:27]
def jN(v):
    d0,d1,d2,a,b,c=entries(v)
    return d0*d1*d2 - d0*onorm2(c) - d1*onorm2(b) - d2*onorm2(a) + 2.0*oreal(omul(a,omul(c,ostar(b))))
def jS(v):
    # spur = sum of principal 2x2 reduced determinants = d0 d1 + d1 d2 + d0 d2 - |a|^2-|b|^2-|c|^2
    d0,d1,d2,a,b,c=entries(v)
    return d0*d1+d1*d2+d0*d2 - onorm2(a)-onorm2(b)-onorm2(c)

# derivations f4
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
print("dim f4 =",f4dim)

rng=np.random.default_rng(1)
tests=[rng.standard_normal(N) for _ in range(8)]

def dinv_lin(I, X, v):        # exact for linear I
    return I(X@v)
def dinv_quad(I, X, v, h=1e-5): # exact-ish for quadratic (finite diff)
    return (I(v+h*(X@v))-I(v-h*(X@v)))/(2*h)
def dinv_cub(I, X, v, h=1e-4):  # cubic: use larger sampling and report
    return (I(v+h*(X@v))-I(v-h*(X@v)))/(2*h)

print("\n=== f4 (derivations): preserve jTr, jS, jN? ===")
mT=max(abs(dinv_lin(jTr,D,v)) for D in f4basis for v in tests)
mS=max(abs(dinv_quad(jS,D,v)) for D in f4basis for v in tests)
mNf=max(abs(dinv_cub(jN,D,v)) for D in f4basis for v in tests)
print(f" max |d jTr| ={mT:.2e}  max |d jS| ={mS:.2e}  max |d jN| ={mNf:.2e}   (all ~0 => f4 preserves the WHOLE spectrum)")

# traceless left-multiplications L_0
L0_gens=[]
Ad1=zero_mat(); Ad1[0,0]=I8[0]; Ad1[1,1]=-I8[0]; L0_gens.append(("Dg(1,-1,0)",Ad1))
Ad2=zero_mat(); Ad2[1,1]=I8[0]; Ad2[2,2]=-I8[0]; L0_gens.append(("Dg(0,1,-1)",Ad2))
for (i,j) in pairs:
    M=zero_mat(); M[i,j]=I8[0]; M[j,i]=ostar(I8[0]); L0_gens.append((f"slot{i}{j}(1)",M))

print("\n=== L_0 (traceless left-mults): MOVE jTr / jS but PRESERVE jN? ===")
for label,A in L0_gens[:5]:
    L=Lop(A)
    dT=max(abs(dinv_lin(jTr,L,v)) for v in tests)
    dS=max(abs(dinv_quad(jS,L,v)) for v in tests)
    dNv=max(abs(dinv_cub(jN,L,v)) for v in tests)
    print(f"  A={label:12s}: max|d jTr|={dT:.3e}  max|d jS|={dS:.3e}  max|d jN|={dNv:.3e}")

print("\n=== THE DEGENERATE POINT: identity 1, spectrum {1,1,1}. Split it with L_0. ===")
IdM=zero_mat()
for i in range(3): IdM[i,i]=I8[0]
Idv=mat_to_vec(IdM)
print(" jTr(1)=",jTr(Idv)," jS(1)=",jS(Idv)," jN(1)=",jN(Idv),"(spectrum roots of x^3-3x^2+3x-1=(x-1)^3, triple 1)")
A=Ad1  # traceless diagonal Dg(1,-1,0)
L=Lop(A)
for t in [0.0,0.1,0.3]:
    vt=Idv+t*(L@Idv)  # infinitesimal-ish flow sample
    # eigenvalues via companion of x^3 - jTr x^2 + jS x - jN
    coeffs=[1.0,-jTr(vt),jS(vt),-jN(vt)]
    roots=np.roots(coeffs)
    print(f"  t={t}: jTr={jTr(vt):.3f} jS={jS(vt):.3f} jN={jN(vt):.3f}  eigs={np.sort(np.real(roots))}")

print("\n=== is str0 = f4 (+) L_0 the norm-preserving (jN) sub-generators? measure jN-preserving subalg of {f4 U L_0} ===")
# The reduced structure algebra e6 preserves jN. f4 preserves jN (measured). Does the FULL
# traceless L_0 preserve jN too? (=> e6 = f4 (+) L_0, dim 78)
allgens=[("f4["+str(i)+"]",f4basis[i]) for i in range(3)]+[(l,Lop(A)) for l,A in L0_gens]
print(" (jN first-variation per generator, larger h to beat cubic noise; ~0 => preserves jN)")
for label,X in allgens[:8]:
    dNv=max(abs((jN(v+3e-3*(X@v))-jN(v-3e-3*(X@v)))/(2*3e-3)) for v in tests)
    print(f"   {label:14s}: max|d jN|={dNv:.2e}")
print("\nDONE probe2")
