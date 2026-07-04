"""
N292 SELECT — MEASURE-FIRST. Weigh theory-native forward beats around N291's Mc.

Banked: f4 = Der(H3(O)) = 52 = jActL(g2)[14] + family-so(3)[3] + CROSS[35].
N287 measured Z_{f4}(colour) = a second su(3) (dim 8), disjoint from jActL(g2).
N288-290 built family-so(3) = Z_{f4}(FULL g2) (dim 3).
N291 built Mc = innerMul(slotA u1)(slotB 1): colour-neutral, isospin-covariant, family-visible.

QUESTIONS (to choose the forward beat):
 Q1. Confirm Z_{f4}(colour) = su(3)_2 (dim 8). Is family-so(3) (dim 3) INSIDE it? coset = 5?
 Q2. Is Mc IN Z_{f4}(colour)?  Is the 5-dim coset = the u1-dressed family generators?
 Q3. THE su(2)_L (isospin) action on the colour-neutral coset: what module?
     Is the colour-neutral family-breaking sector a definite isospin rep? (Yukawa<->EW joint)
 Q4. WHAT DOES Mc DO to the 3 generation slots? (the texture-seed action structure)
 Q5. Symmetric-space closure: [coset,coset] subset family-so(3)? [family,coset] subset coset?
     (su(3)/so(3) structure) -- and tractability signal (does non-assoc bite?).
 Q6. Relation Mc ~ u1-complexification of a family generator? (fold-root enhancement)
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True, precision=4, linewidth=200)

# ---- octonion table (N283/N287/N288/N291 convention) ----
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

# ---- Der(O)=g2 (14), su(2)_L={DI,DJ,DK}, colour = stab(u1) ----
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
# colour = elements of g2 commuting with L_{u1}? colour = stab_{g2}(u1): D u1 = 0.
u1=I8[1].copy()
colour=[]
for D in g2mats:
    # colour = D with D(u1)=0  (stabilizer of the u1 axis) -- N201
    if np.max(np.abs(D@u1))<1e-7: colour.append(D)
# refine: colour is the 8-dim subspace of g2 killing u1; build by nullspace within g2
G2=np.array([m.reshape(-1) for m in g2mats])  # 14 x 64
# constraint D u1 = 0 : for D=sum c_a g2mats[a], (sum c_a g2mats[a]) u1 = 0
Mu=np.array([ (m@u1) for m in g2mats ]).T   # 8 x 14
_,sc,vc=np.linalg.svd(Mu); rc=int(np.sum(sc>1e-8))
colour_coeffs=vc[rc:]   # (14-rc) x 14
colourmats=[sum(cf[a]*g2mats[a] for a in range(14)) for cf in colour_coeffs]
print("dim colour = stab_g2(u1) =",len(colourmats),"(expect 8)")

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
print("dim f4 =",f4dim)
F4=np.array([b.reshape(-1) for b in f4basis])

# ---- family so(3): index rotations ----
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

# ---- slot / inner-mult machinery ----
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

famC=innerMul(slotA(I8[0]),slotB(I8[0]))   # N288 famC
famA=innerMul(slotB(I8[0]),slotC(I8[0]))
famB=innerMul(slotC(I8[0]),slotA(I8[0]))
Mc=innerMul(slotA(u1),slotB(I8[0]))        # N291 Mc

GA=np.array([m.reshape(-1) for m in gauge_lift])   # jActL(g2) 14
CA=np.array([m.reshape(-1) for m in colour_lift])  # jActL(colour) 8
FAM=np.array([m.reshape(-1) for m in fam])         # family 3

print("\n=== Q1: Z_{f4}(colour) = su(3)_2? ===")
# centralizer of jActL(colour) inside f4:  X in f4 with [X, jActL(D)]=0 for all colour D
# solve in the 52-dim f4 coordinates
def centralizer_in_f4(liftlist):
    # X = sum_r x_r f4basis[r]; constraint [X, L]=0 for each L in liftlist
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
    _,s2,v2=np.linalg.svd(A); rr=int(np.sum(s2>1e-6))
    cent=[sum(v2[k][r]*f4basis[r] for r in range(f4dim)) for k in range(rr,f4dim)]
    return cent
Zc=centralizer_in_f4(colour_lift)
print("dim Z_{f4}(colour) =",len(Zc),"(N287: expect 8)")
ZC=np.array([m.reshape(-1) for m in Zc])
Zg=centralizer_in_f4(gauge_lift)
print("dim Z_{f4}(FULL g2) =",len(Zg),"(family: expect 3)")
# family so(3) inside Z_c?
famin=np.vstack([ZC,FAM])
print("rank(Z_c U family) =",rankof(famin),"(==8 => family subset Z_c)")
# coset dim
print("coset dim (Z_c minus family) =",len(Zc)-rankof(FAM))

print("\n=== Q2: Mc in Z_c? coset = u1-dressed family? ===")
print("Mc in Z_c (colour-centralizer)? res =",proj_res(Mc,ZC),"(0 => yes)")
print("Mc in family? res =",proj_res(Mc,FAM),"(nonzero => in coset)")
# u1-dressed family generators: innerMul(slotX u1)(slotY 1) etc.
Mc_ab=innerMul(slotA(u1),slotB(I8[0]))
Mc_bc=innerMul(slotB(u1),slotC(I8[0]))
Mc_ca=innerMul(slotC(u1),slotA(I8[0]))
Mc_ab2=innerMul(slotA(I8[0]),slotB(u1))
Mc_bc2=innerMul(slotB(I8[0]),slotC(u1))
Mc_ca2=innerMul(slotC(I8[0]),slotA(u1))
dressed=[Mc_ab,Mc_bc,Mc_ca,Mc_ab2,Mc_bc2,Mc_ca2]
D6=np.array([m.reshape(-1) for m in dressed])
print("rank of 6 u1-dressed members =",rankof(D6))
# are they all in Z_c?
for nm,m in [("ab",Mc_ab),("bc",Mc_bc),("ca",Mc_ca),("ab2",Mc_ab2),("bc2",Mc_bc2),("ca2",Mc_ca2)]:
    print(f"  dressed[{nm}] in Z_c? res={proj_res(m,ZC):.1e}  in family? res={proj_res(m,FAM):.1e}")
# do dressed span the coset (5)?
cosetplus=np.vstack([D6,FAM])
print("rank(dressed U family) =",rankof(cosetplus),"(==8 => dressed fill the coset)")

print("\n=== Q3: su(2)_L (isospin) action on Z_c and on the coset ===")
# is Z_c invariant under jActL(su(2)_L)?  [su2L, Z_c] subset Z_c ?
for nm,L in [("DI",su2L_lift[0]),("DJ",su2L_lift[1]),("DK",su2L_lift[2])]:
    brs=[comm(L,m) for m in Zc]
    maxres=max(proj_res(b,ZC) for b in brs)
    maxmag=max(np.max(np.abs(b)) for b in brs)
    print(f"  [jActL {nm}, Z_c]: max mag={maxmag:.3f}  stays in Z_c? res={maxres:.1e}")
# isospin action on Mc specifically
for nm,L in [("DI",su2L_lift[0]),("DJ",su2L_lift[1]),("DK",su2L_lift[2])]:
    br=comm(L,Mc)
    print(f"  [jActL {nm}, Mc]: mag={np.max(np.abs(br)):.3f}  in Z_c? res={proj_res(br,ZC):.1e}  in coset? res={proj_res(br,np.vstack([D6])):.1e}")

print("\n=== Q4: WHAT Mc DOES to the generation slots (texture-seed action) ===")
def show_action(op,name,args):
    for an,A in args:
        r=op@mat_to_vec(A)
        # decompose r onto slot/diag basis
        print(f"  {name}({an}) -> vec nonzero entries:", {k:round(r[k],3) for k in range(N) if abs(r[k])>1e-6})
show_action(Mc,"Mc",[("slotA 1",slotA(I8[0])),("slotB 1",slotB(I8[0])),("slotC 1",slotC(I8[0])),
                     ("slotA u1",slotA(u1)),("slotB u1",slotB(u1)),("slotC u1",slotC(u1)),
                     ("Dg(1,0,0)",Dg(1,0,0)),("Dg(0,1,0)",Dg(0,1,0)),("Dg(0,0,1)",Dg(0,0,1))])
print("  --- contrast famC (N288) ---")
show_action(famC,"famC",[("slotA 1",slotA(I8[0])),("slotB 1",slotB(I8[0])),("slotC 1",slotC(I8[0]))])

print("\n=== Q5: symmetric-space closure su(3)/so(3) ===")
# k = coset (dressed, 5-dim), h = family so(3)
# [k,k] subset h ?   [h,k] subset k ?
Kbasis=[]  # build 5-dim coset basis from dressed projected off family
Qf,_=np.linalg.qr(FAM.T)
for m in dressed:
    v=m.reshape(-1); w=v-Qf@(Qf.T@v)
    if np.max(np.abs(w))>1e-6: Kbasis.append(w)
Kmat=np.array(Kbasis); 
print("coset k rank =",rankof(Kmat))
# pick two coset members, bracket, check in h(=family)
b1=comm(Mc_ab,Mc_bc); print("[Mc_ab,Mc_bc] in family(h)? res=",proj_res(b1,FAM)," in Z_c? res=",proj_res(b1,ZC)," mag=",np.max(np.abs(b1)))
b2=comm(Mc_ab,Mc_ca); print("[Mc_ab,Mc_ca] in family(h)? res=",proj_res(b2,FAM)," in Z_c? res=",proj_res(b2,ZC))
b3=comm(R12,Mc);       print("[family R12, Mc] in coset(k)? res=",proj_res(b3, Kmat.T if False else D6)," in Z_c? res=",proj_res(b3,ZC))

print("\n=== Q6: Mc ~ u1-complexification of famC? ===")
# is Mc related to famC by a fold-root operation? e.g. Mc = [J-structure, famC]?
# left-mult by u1 in slotA: does jActL(some) or L_{u1-slot} map famC->Mc?
print("Mc vs famC: is Mc = innerMul(slotA u1)(slotB 1), famC = innerMul(slotA 1)(slotB 1) -- u1 dressing of first slot.")
print("res(Mc onto span{famC}) =",proj_res(Mc, famC.reshape(1,-1)),"(nonzero => independent, as expected)")
