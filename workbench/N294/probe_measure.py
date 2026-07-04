"""
N294 SELECT — MEASURE-FIRST. Weigh theory-native forward beats after N293 completed the
dim-8 simple flavour su(3) = Z_{f4}(colour) = family-so(3)[3] + fold-root-dressed coset[5].

Banked: f4 = Der(H3(O)) = 52 = jActL(g2)[14, colour gauge is 8 of these] + family-so(3)[3] + CROSS[35].
N287 measured Z_{f4}(colour) = a second su(3) (dim 8). N292/293 built + closed it.

CANDIDATE FORWARD BEATS TO WEIGH (theory-native, both lenses):
 A. MUTUAL-CENTRALIZER / RIGIDITY: is Z_{f4}(flavour su(3)) = colour su(3)?  i.e. do colour and
    flavour MUTUALLY determine each other inside f4 (each = the exact centralizer of the other)?
    (the "one cause, mutual determination" — derived F4 >= (SU(3)_c x SU(3)_fl)/Z3 maximal-rank,
     mirrors N252/N256 colour<->charge & isospin<->hypercharge mutual determination.)
 B. CARTAN of flavour su(3): rank 2 (family so(3) is rank 1). The 2nd Cartan generator lives in
    the fold-root-dressed coset. What DIAGONAL (generation-weight) structure does the rank-2 Cartan
    put on the 3 matter slots? Does it give a distinguished generation grading the family so(3)
    (rank 1) could NOT (the ceiling N275/N290 dissolved by the richer su(3))? -> the ★5 texture climb.
 C. The flavour-su(3) MODULE structure of the 3 generation slots (are the 3 slots a fundamental 3?
    weights?), and what the 36-dim complement (52 - 8 - 8) is as a (colour,flavour) bimodule.
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
u1=I8[1].copy()
Mu=np.array([ (m@u1) for m in g2mats ]).T
_,sc,vc=np.linalg.svd(Mu); rc=int(np.sum(sc>1e-8))
colour_coeffs=vc[rc:]
colourmats=[sum(cf[a]*g2mats[a] for a in range(14)) for cf in colour_coeffs]
print("dim g2 =",len(g2mats),"  dim colour=stab_g2(u1) =",len(colourmats))

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
def jActL_mat(D):
    Mrep=np.zeros((N,N))
    for a in range(N):
        M=arena_basis[a]; R=zero_mat()
        for i in range(3):
            for j in range(3): R[i,j]=D@M[i,j]
        Mrep[:,a]=mat_to_vec(R)
    return Mrep
gauge_lift=[jActL_mat(D) for D in g2mats]
colour_lift=[jActL_mat(D) for D in colourmats]
su2L_lift=[jActL_mat(D) for D in [DI,DJ,DK]]
def comm(X,Y): return X@Y-Y@X

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

def rankof(A,t=1e-7): return np.linalg.matrix_rank(A,tol=t)
def proj_res(M, basisFlat):
    v=M.reshape(-1); Q,_=np.linalg.qr(basisFlat.T); return np.max(np.abs(v-Q@(Q.T@v)))

def Lop(Amat):
    M=np.zeros((N,N))
    for a in range(N): M[:,a]=mat_to_vec(jprod(Amat, arena_basis[a]))
    return M
def slot(idx_pair, cval):
    (i,j)=idx_pair; M=zero_mat(); M[i,j]=cval.copy(); M[j,i]=ostar(cval); return M
def innerMul(A,B): return comm(Lop(A),Lop(B))
def slotA(c): return slot((0,1),c)
def slotB(c): return slot((0,2),c)
def slotC(c): return slot((1,2),c)
def Dg(d0,d1,d2):
    M=zero_mat(); M[0,0]=d0*I8[0]; M[1,1]=d1*I8[0]; M[2,2]=d2*I8[0]; return M

famC=innerMul(slotA(I8[0]),slotB(I8[0]))
famA=innerMul(slotB(I8[0]),slotC(I8[0]))
famB=innerMul(slotC(I8[0]),slotA(I8[0]))
kAB=innerMul(slotA(u1),slotB(I8[0]))
kBC=innerMul(slotB(u1),slotC(I8[0]))
kCA=innerMul(slotC(u1),slotA(I8[0]))

GA=np.array([m.reshape(-1) for m in gauge_lift])
CA=np.array([m.reshape(-1) for m in colour_lift])
FAM=np.array([m.reshape(-1) for m in fam])

def centralizer_in_f4(liftlist,tol=1e-6):
    rows=[]
    for L in liftlist:
        for a in range(N):
            for b in range(N):
                row=np.zeros(f4dim)
                for r in range(f4dim):
                    br=f4basis[r]
                    row[r]=(br@L - L@br)[a,b]
                rows.append(row)
    A=np.array(rows)
    _,s2,v2=np.linalg.svd(A); rr=int(np.sum(s2>tol))
    cent=[sum(v2[k][r]*f4basis[r] for r in range(f4dim)) for k in range(rr,f4dim)]
    return cent

# flavour su(3) = Z_{f4}(colour)
flav=centralizer_in_f4(colour_lift)
FL=np.array([m.reshape(-1) for m in flav])
print("\n=== BASELINE ===")
print("dim Z_{f4}(colour) = flavour su(3) =",len(flav),"(expect 8)")
print("family so(3) subset flavour? rank(FL U FAM)=",rankof(np.vstack([FL,FAM])),"(==8 => yes)")
print("colour lift dim =",len(colour_lift))

print("\n=== CANDIDATE A: MUTUAL CENTRALIZER / RIGIDITY ===")
# Z_{f4}(flavour su(3)) =? colour  (mutual determination)
Zflav=centralizer_in_f4(flav)
ZFL=np.array([m.reshape(-1) for m in Zflav])
print("dim Z_{f4}(flavour su(3)) =",len(Zflav),"(if 8 => equals colour dim)")
# is it EXACTLY the colour lift? compare spans
both=np.vstack([ZFL,CA])
print("rank(Z_{f4}(flavour) U jActL(colour)) =",rankof(both),"(==8 => Z_{f4}(flavour)=colour EXACTLY)")
# each colour lift in Z_{f4}(flavour)?
print("each jActL(colour) in Z_{f4}(flavour)? max res =",max(proj_res(m,ZFL) for m in colour_lift))
# colour + flavour dims / intersection
cf=np.vstack([CA,FL]); print("rank(colour U flavour) =",rankof(cf),"(==16 => direct sum, disjoint)")
print("dim f4 - 16 =",f4dim-16,"(the (colour,flavour) bimodule complement)")

print("\n=== CANDIDATE B: CARTAN of flavour su(3) + generation-weight grading ===")
# rank of flavour su(3): max abelian (commuting) subalgebra. su(3) has rank 2.
# family so(3) rank 1: pick one family gen H1; find flavour elements commuting with H1.
H1=famC  # one family so(3) Cartan direction
cent_in_flav=[]
rows=[]
for a in range(N):
    for b in range(N):
        row=np.zeros(len(flav))
        for r,fm in enumerate(flav):
            row[r]=(comm(fm,H1))[a,b]
        rows.append(row)
_,scf,vcf=np.linalg.svd(np.array(rows)); rrr=int(np.sum(scf>1e-6))
cart_candidates=[sum(vcf[k][r]*flav[r] for r in range(len(flav))) for k in range(rrr,len(flav))]
print("dim {X in flavour : [X,H1]=0} =",len(cart_candidates),"(includes H1; rank flavour = size of max abelian)")
# build the actual Cartan: H1 plus a commuting partner H2 from cart_candidates independent of H1
H1f=H1.reshape(-1)
part=[c for c in cart_candidates if proj_res(c,H1f[None,:])>1e-6]
print("Cartan partners of H1 (independent) available:",len(part))
if part:
    H2=part[0]
    print("[H1,H2] max mag =",np.max(np.abs(comm(H1,H2))),"(0 => commute, rank>=2)")
    # H2 in family so(3) or in coset?
    print("H2 in family so(3)? res =",proj_res(H2,FAM),"(nonzero => the 2nd Cartan lives in the fold-root-dressed coset)")
    COSET=np.array([m.reshape(-1) for m in [kAB,kBC,kCA]])
    print("H2 in fold-root-dressed coset span{kAB,kBC,kCA}? res =",proj_res(H2,COSET))
    # THE GENERATION WEIGHTS: diagonal action of H1,H2 on the 3 slots' 'real-unit' directions.
    # Look at action of H1,H2 on slotA/B/C(1) — do they act diagonally (weight) or rotate?
    print("\n  -- H1 (family Cartan) action on slot(1) real-unit generation directions --")
    for nm,S in [("A",slotA(I8[0])),("B",slotB(I8[0])),("C",slotC(I8[0]))]:
        r=H1@mat_to_vec(S); print(f"    H1(slot{nm} 1) nz:",{k:round(r[k],3) for k in range(N) if abs(r[k])>1e-6})
    print("  -- H2 (coset Cartan) action on slot(1) generation directions --")
    for nm,S in [("A",slotA(I8[0])),("B",slotB(I8[0])),("C",slotC(I8[0]))]:
        r=H2@mat_to_vec(S); print(f"    H2(slot{nm} 1) nz:",{k:round(r[k],3) for k in range(N) if abs(r[k])>1e-6})

print("\n=== CANDIDATE C: what the 3 generation slots are as a flavour-su(3) module ===")
# The three matter slots (each 8-dim = O). Consider the 'generation index' 3-space spanned by
# {slotA(c),slotB(c),slotC(c)} for fixed c. Does flavour su(3) act irreducibly = fundamental 3 on the index?
# Test: pick c=1 (real unit). The index-3 space span{slotA1,slotB1,slotC1}. flavour action closed on it?
idx3=[mat_to_vec(slotA(I8[0])),mat_to_vec(slotB(I8[0])),mat_to_vec(slotC(I8[0]))]
IDX=np.array(idx3)
for r,fm in enumerate(flav):
    imgs=[fm@v for v in idx3]
    res=max(proj_res(im.reshape(1,-1).reshape(3,3,8) if False else im, IDX) for im in imgs)
print("(index-3 closure test skipped-detail; see per-gen below)")
# per flavour gen, does it map the index-3 real-unit space into itself + the u1-dressed index?
allslots=[]
for c in [I8[0],u1]:
    for S in [slotA,slotB,slotC]:
        allslots.append(mat_to_vec(S(c)))
SL=np.array(allslots)  # 6-dim: {slotX 1, slotX u1}
closed=True
for fm in flav:
    for v in allslots:
        if proj_res(fm@v, SL)>1e-6: closed=False
print("flavour su(3) closes on span{slotX 1, slotX u1 : X=A,B,C} (6-dim)? ",closed)
print("  (=> the 3 generations x {1,u1} carry a flavour-su(3) module = the fundamental 3 x C)")
print("\nDONE")
