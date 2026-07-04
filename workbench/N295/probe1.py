"""
N295 SELECT — MEASURE-FIRST. The decision: (A) bank the mutual-centralizer rigidity
Z_{f4}(flavour)=colour (lateral, inside spectrum-preserving f4), vs (B) FOLLOW THE
REPEATED-DEFERRAL SIGNAL and redirect to the spectrum-MOVING sector beyond f4.

THE CEILING (proved, N269/N275): every element of f4=Der(H3(O)) preserves the arena's
cubic norm jN (the spectrum). So NO f4 element can split the degenerate eigenvalues that
the mass texture (star5) needs. star2/star5 have been route-not-yet-found ~10 nodes for
this SAME reason. Per SOUL REPEATED-DEFERRAL SIGNAL: NAME the ceiling, CHILD the climb to
the richer (spectrum-moving) structure -- derived FORWARD from the trunk, not posited.

THE CANDIDATE RICHER STRUCTURE (theory-native): the arena J3(O) is a MULTIPLICATION
algebra. Its DERIVATIONS f4 = inner-part [L_A,L_B] (=innerMul, banked) preserve everything.
But the Jordan LEFT-MULTIPLICATIONS L_A themselves (banked as Lop) are the fold's own
dynamical operation -- and for A != 0 they MOVE the identity: L_A(1) = A != 0, whereas every
derivation kills the identity D(1)=0. The identity is the maximally-degenerate spectral
point (eigenvalues 1,1,1); moving it BREAKS spectral degeneracy. The traceless part
L_0(J) = {L_A : tr A = 0} is the norm-preserving spectrum-MOVING sector; {f4, L_0(J)} should
close to e6 = Der(J) (+) L_0(J), dim 78 = 52 + 26.

MEASURE (decides A vs B honestly):
 1. dim f4 = 52; f4 fixes identity + preserves jN (validate the jN formula).
 2. L_A(1) = A  (moves identity for A!=0)  -- the spectrum-moving witness f4 lacks.
 3. Does L_A (traceless A) MOVE the spectrum?  (first variation of jN along L_A nonzero,
    contrast f4's first-variation-zero N269).
 4. dim Lie-span{f4 U L_0(J)} =? 78 (e6, the reduced structure algebra).
 5. Does L_0(J) preserve jN (=> e6 = norm-preserving spectrum-moving), i.e. is the
    spectrum-moving sector still norm(determinant)-preserving (total mass conserved,
    splitting redistributes)?
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True, precision=4, linewidth=200)

# ---- octonion (Cayley-Dickson) exact-Fraction machinery (from N294 probes) ----
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
def oconj_re(x): return x[0]                       # Re part
def onorm2(x): return float(x@x)                   # |x|^2 = x x* real part = sum sq (basis orthonormal)

# ---- g2 = Der(O), colour = stab(u1) ----
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
print("dim g2 =",len(g2mats))

# ---- arena J3(O)=H3(O): 27-dim; M=[[d0,a,b],[a*,d1,c],[b*,c*,d2]] ----
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
def jprod(A,B): return 0.5*(mat_mul(A,B)+mat_mul(B,A))
def Lop(Amat):
    M=np.zeros((N,N))
    for a in range(N): M[:,a]=mat_to_vec(jprod(Amat, arena_basis[a]))
    return M

# identity element
IdM=zero_mat()
for i in range(3): IdM[i,i]=I8[0]
Idv=mat_to_vec(IdM)

# ---- f4 = Der(J3(O)) via jprod-derivation SVD ----
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

# ---- cubic norm jN (reduced determinant); validate against jN 0 0 0 1 1 1 = 2 (N269) ----
def entries(v):
    # returns d0,d1,d2 (floats) and a,b,c (8-vectors)
    d0,d1,d2=v[0],v[1],v[2]
    a=v[3:11]; b=v[11:19]; c=v[19:27]
    return d0,d1,d2,a,b,c
def jN_vec(v):
    d0,d1,d2,a,b,c=entries(v)
    # N = d0 d1 d2 - d0|c|^2 - d1|b|^2 - d2|a|^2 + 2 Re(a (c b*))
    term = 2.0*oconj_re(omul(a, omul(c, ostar(b))))
    return d0*d1*d2 - d0*onorm2(c) - d1*onorm2(b) - d2*onorm2(a) + term
# validate
v_test=mat_to_vec(zero_mat()); # 0
w=zero_mat(); w[0,1]=I8[0]; w[1,0]=ostar(I8[0]); w[0,2]=I8[0]; w[2,0]=ostar(I8[0]); w[1,2]=I8[0]; w[2,1]=ostar(I8[0])
print("jN(0,0,0,1,1,1) =",jN_vec(mat_to_vec(w)),"(expect 2, N269 W8)")

# first variation of jN along an endomorphism X at element M:  d/dt jN(v + t X v)|0
def jN_firstvar(X, v, h=1e-6):
    return (jN_vec(v + h*(X@v)) - jN_vec(v - h*(X@v)))/(2*h)

# random Hermitian test elements
rng=np.random.default_rng(0)
def rand_elt():
    return rng.standard_normal(N)
tests=[rand_elt() for _ in range(6)]

print("\n=== CEILING CHECK: f4 preserves jN (first variation ~0)? (N269) ===")
mx=0.0
for D in f4basis:
    for v in tests:
        mx=max(mx, abs(jN_firstvar(D,v)))
print(" max |d jN / dt| over f4 basis x test elts =",mx,"(~0 => f4 preserves spectrum: the ceiling)")

print("\n=== L_A moves the identity (the boost f4 lacks) ===")
# L_A(1) = A. take A = a traceless Hermitian basis elt (slotA(1))
Aslot=zero_mat(); Aslot[0,1]=I8[0]; Aslot[1,0]=ostar(I8[0])
LA=Lop(Aslot)
print(" ||L_A(Id) - A|| =",np.linalg.norm(LA@Idv - mat_to_vec(Aslot)),"(0 => L_A(1)=A)")
print(" ||L_A(Id)|| =",np.linalg.norm(LA@Idv),"(!=0 => L_A MOVES the identity; every D in f4 has D(1)=0)")
mxD1=0.0
for D in f4basis: mxD1=max(mxD1, np.linalg.norm(D@Idv))
print(" max ||D(Id)|| over f4 =",mxD1,"(~0 => every derivation kills the identity)")

print("\n=== L_A (traceless A) MOVES the spectrum (first variation of jN nonzero)? ===")
# traceless Hermitian A: use slotA(1) (already traceless), and a traceless diagonal
Adiag=zero_mat(); Adiag[0,0]=I8[0]; Adiag[1,1]=-I8[0]  # tr=0
for label,Amat in [("slotA(1)",Aslot),("Dg(1,-1,0)",Adiag)]:
    L=Lop(Amat)
    mv=max(abs(jN_firstvar(L,v)) for v in tests)
    print(f"  A={label}: max |d jN/dt along L_A| =",mv,"(!=0 => L_A MOVES the spectrum)")

print("\n=== ASCENT: dim Lie-span{f4 U L_0(J)} =? 78 (e6 = Der (+) L_0) ===")
# L_0(J): left mult by traceless Hermitian basis. Traceless basis of arena:
# diagonal traceless (2) + all off-diagonal slots (24) = 26
L0_gens=[]
# traceless diagonal
Ad1=zero_mat(); Ad1[0,0]=I8[0]; Ad1[1,1]=-I8[0]; L0_gens.append(Ad1)
Ad2=zero_mat(); Ad2[1,1]=I8[0]; Ad2[2,2]=-I8[0]; L0_gens.append(Ad2)
for (i,j) in pairs:
    for c in range(8):
        M=zero_mat(); M[i,j]=I8[c]; M[j,i]=ostar(I8[c]); L0_gens.append(M)
print(" dim L_0(J) generators =",len(L0_gens),"(expect 26)")
L0mats=[Lop(A) for A in L0_gens]
# span of {f4basis} U {L0mats} as 27x27 matrices
allmats=f4basis+L0mats
Aflat=np.array([m.reshape(-1) for m in allmats])
rspan=np.linalg.matrix_rank(Aflat, tol=1e-7)
print(" dim span(f4 U L_0) =",rspan,"(expect 78 = 52+26 if disjoint => e6)")
# closure check: [L_A,L_B] in f4? sample
def comm(X,Y): return X@Y-Y@X
f4flat=np.array([m.reshape(-1) for m in f4basis])
Qf,_=np.linalg.qr(f4flat.T)
def in_f4(X):
    v=X.reshape(-1); return np.max(np.abs(v-Qf@(Qf.T@v)))
mxc=max(in_f4(comm(L0mats[i],L0mats[j])) for i in range(0,6) for j in range(6,12))
print(" sample [L_A,L_B] in f4? max res =",mxc,"(~0 => inner derivations, closure into f4)")

print("\n=== does L_0(J) preserve jN (=> e6 norm-preserving spectrum-moving)? ===")
# The reduced structure algebra e6 preserves jN. Test first variation of jN along L_A for
# traceless A -- but NOTE this measured NONZERO above. The e6 statement is subtler: the
# structure algebra preserves jN only in the combination L_A - (something). Measure the
# RAW first-variation trace to see the structure:
for label,Amat in [("slotA(1)",L0_gens[2]),("Dg(1,-1,0)",L0_gens[0])]:
    L=Lop(Amat)
    # sum over a NONdegenerate basis: <jN', L_A v> ; check if L_A is in the norm-preserving algebra
    # e6 elements X satisfy: jN'(v)[Xv] = (linear functional) -- for pure L_A (traceless) the
    # first variation is 3*(directional) ... just report the pattern
    vals=[jN_firstvar(L,v) for v in tests]
    print(f"  A={label}: jN first-variations =",[round(x,4) for x in vals])
print("\nDONE probe1")
