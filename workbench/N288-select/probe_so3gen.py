"""
N288 — confirm the gauge-neutral room's THREE generators are innerMul of real-unit slot PAIRS,
their so(3) closure, slot-rotation action, and that their span = centralizer_{f4}(full gauge).
Uses the exact-Fraction octonion table (structure via numpy floats, exact ratios read off).
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True, precision=6)

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
ev=[basis(i) for i in range(8)]; I8=np.eye(8)
T=np.zeros((8,8,8)); Sst=np.zeros((8,8))
for i in range(8):
    for j in range(8):
        cc=flat(O_mul(ev[i],ev[j]))
        for k in range(8): T[i,j,k]=float(cc[k])
    cs=flat(O_star(ev[i]))
    for k in range(8): Sst[i,k]=float(cs[k])
def omul(x,y): return np.einsum('ijk,i,j->k',T,x,y)
def ostar(x): return Sst.T@x

# Der(O), colour, full g2
def adH(q):
    M=np.zeros((8,8))
    for j in range(4): M[:,j]=(omul(I8[q],I8[j])-omul(I8[j],I8[q]))
    a=M[:4,:4]; out=np.zeros((8,8)); out[:4,:4]=a; out[4:,4:]=a; return out
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
rk=int(np.sum(ss>tol)); g2mats=[vt[r].reshape(8,8) for r in range(rk,64)]

# arena 27
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
def matrixify(v):
    M=zero_mat()
    for i in range(3): M[i,i]=v[i]*I8[0]
    idx=3
    for (i,j) in pairs:
        for c in range(8): M[i,j]+=v[idx]*I8[c]; M[j,i]+=v[idx]*ostar(I8[c]); idx+=1
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
    for a in range(N): M[:,a]=mat_to_vec(jprod(Amat,arena_basis[a]))
    return M
def comm(X,Y): return X@Y-Y@X

def realslot(i,j):  # slot(i,j) of real unit 1
    M=zero_mat(); M[i,j]=I8[0]; M[j,i]=I8[0]; return M
sA=realslot(0,1); sB=realslot(0,2); sC=realslot(1,2)
def innerMul(A,B): return comm(Lop(A),Lop(B))
FA=innerMul(sB,sC)   # shares index 2? sB={0,2}, sC={1,2} -> rotates 0,1
FB=innerMul(sC,sA)   # sC={1,2}, sA={0,1} -> rotates 0,2  (order for cyclic)
FC=innerMul(sA,sB)   # sA={0,1}, sB={0,2} -> rotates 1,2  == 4*M0

gauge_lift=[]
def jActL_mat(D):
    Mrep=np.zeros((N,N))
    for a in range(N):
        M=arena_basis[a]; R=zero_mat()
        for i in range(3):
            for j in range(3): R[i,j]=D@M[i,j]
        Mrep[:,a]=mat_to_vec(R)
    return Mrep
gauge_lift=[jActL_mat(D) for D in g2mats]

# (1) each F in derH3 (Jordan derivation)?  and (2) commutes with whole gauge?
def jderiv_defect(Drep):
    m=0
    np.random.seed(3)
    for _ in range(30):
        vx=np.random.randn(N); vy=np.random.randn(N)
        X=matrixify(vx);Y=matrixify(vy)
        lhs=Drep@mat_to_vec(jprod(X,Y))
        rhs=mat_to_vec(jprod(matrixify(Drep@vx),Y)+jprod(X,matrixify(Drep@vy)))
        m=max(m,np.max(np.abs(lhs-rhs)))
    return m
for nm,Fm in [("FA",FA),("FB",FB),("FC",FC)]:
    d=jderiv_defect(Fm)
    g=max(np.max(np.abs(comm(Fm,gg))) for gg in gauge_lift)
    print(f"{nm}: Jordan-deriv defect {d:.1e} | commutes w/ full gauge {g:.1e}")

# (3) so(3) closure structure constants
def coords_in(basisMs, M):
    A=np.array([b.reshape(-1) for b in basisMs]).T
    sol,_,_,_=np.linalg.lstsq(A,M.reshape(-1),rcond=None)
    res=np.max(np.abs(A@sol-M.reshape(-1)))
    return sol,res
fam=[FA,FB,FC]
print("\nso(3) closure (coords in [FA,FB,FC], residual):")
for (nm,X,Y) in [("[FA,FB]",FA,FB),("[FB,FC]",FB,FC),("[FC,FA]",FC,FA)]:
    sol,res=coords_in(fam,comm(X,Y))
    print(f"  {nm} = {sol[0]:+.3f}FA {sol[1]:+.3f}FB {sol[2]:+.3f}FC   resid {res:.1e}")

# (4) span(fam) == centralizer_f4(full gauge) (dim 3)?
# build f4 basis
prod_tensor=np.zeros((N,N,N))
for a in range(N):
    for b in range(N): prod_tensor[a,b]=mat_to_vec(jprod(arena_basis[a],arena_basis[b]))
rows2=[]
for a in range(N):
    for b in range(N):
        for k in range(N):
            row=np.zeros(N*N)
            for p in range(N): row[k*N+p]+=prod_tensor[a,b,p]
            for p in range(N): row[p*N+a]-=prod_tensor[p,b,k]
            for p in range(N): row[p*N+b]-=prod_tensor[a,p,k]
            rows2.append(row)
_,sd,vd=np.linalg.svd(np.array(rows2))
rk2=int(np.sum(sd>1e-7*sd[0])); f4basis=[vd[r].reshape(N,N) for r in range(rk2,N*N)]
print(f"\ndim f4 = {len(f4basis)}")
big=[]
for g in gauge_lift:
    big.append(np.array([comm(b,g).reshape(-1) for b in f4basis]).T)
_,sv,vv=np.linalg.svd(np.vstack(big)); rr=int(np.sum(sv>1e-6*sv[0]))
room=[sum(vv[t][a]*f4basis[a] for a in range(len(f4basis))) for t in range(rr,len(f4basis))]
FAM=np.array([m.reshape(-1) for m in fam]); ROOM=np.array([m.reshape(-1) for m in room])
rf=np.linalg.matrix_rank(FAM,tol=1e-7); both=np.linalg.matrix_rank(np.vstack([FAM,ROOM]),tol=1e-7)
print(f"dim room={len(room)}, rank(fam)={rf}, rank(fam∪room)={both} => span(fam)=room: {both==rf==len(room)}")

# (5) slot-rotation action: FC on slotA(x), slotB(x), slotC(x)
def slotX(i,j,vec8):
    M=zero_mat(); M[i,j]=vec8; M[j,i]=ostar(vec8); return M
np.random.seed(7); x=np.random.randn(8)
def describe(Frep,label):
    for (nm,(i,j)) in [("slotA",(0,1)),("slotB",(0,2)),("slotC",(1,2))]:
        out=matrixify(Frep@mat_to_vec(slotX(i,j,x)))
        # report which slots/diag it lands in
        comps=[]
        for (lab,(p,q)) in [("A",(0,1)),("B",(0,2)),("C",(1,2))]:
            if np.max(np.abs(out[p,q]))>1e-9: comps.append(lab)
        diag=any(np.max(np.abs(out[k,k]))>1e-9 for k in range(3))
        print(f"  {label} {nm}(x) -> slots {comps}{' +diag' if diag else ''}")
print("\nFC=innerMul(slotA1,slotB1) slot action:"); describe(FC,"FC")
print("FA=innerMul(slotB1,slotC1) slot action:"); describe(FA,"FA")

# (6) M0 exact ratio: FC = 4*M0 where M0=innerMul(slotA1,slotB1)=FC itself; and famRot(A12) ratio
print(f"\nFC == innerMul(slotA1,slotB1) (N287 M0) by construction. Ratio check vs index rot done in probe_family (M0=1/4 R12).")
