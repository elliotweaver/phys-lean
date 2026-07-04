"""
N292 SELECT — final decisive measurement: the closed subalgebra structure + tractability.
1. {family(3) + offdiag-dressed(3)} = 6-dim closed? what algebra (so(4)? su(3) subalg?)?
2. Full Z_c (8) = su(3): clean structure constants from family + all 5 coset.
3. Slot-action tables of kAB,kBC,kCA to confirm slot-lemma tractability (no coord bash).
4. The 2 diagonal coset directions: what are they in slot language?
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
DI,DJ,DK=adH(1),adH(2),adH(3); u1=I8[1].copy()
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
def Dg(d0,d1,d2):
    M=zero_mat(); M[0,0]=d0*I8[0]; M[1,1]=d1*I8[0]; M[2,2]=d2*I8[0]; return M
famC=innerMul(sA(I8[0]),sB(I8[0])); famA=innerMul(sB(I8[0]),sC(I8[0])); famB=innerMul(sC(I8[0]),sA(I8[0]))
kAB=innerMul(sA(u1),sB(I8[0])); kBC=innerMul(sB(u1),sC(I8[0])); kCA=innerMul(sC(u1),sA(I8[0]))
# alt offdiag-dressed (u1 in 2nd slot)
kAB2=innerMul(sA(I8[0]),sB(u1)); kBC2=innerMul(sB(I8[0]),sC(u1)); kCA2=innerMul(sC(I8[0]),sA(u1))
# diagonal-dressed
dAA=innerMul(sA(u1),sA(I8[0])); dBB=innerMul(sB(u1),sB(I8[0])); dCC=innerMul(sC(u1),sC(I8[0]))

six=[famA,famB,famC,kAB,kBC,kCA]; six_n=["famA","famB","famC","kAB","kBC","kCA"]
S6=np.array([m.reshape(-1) for m in six])
print("=== 1. {family + 3 offdiag-dressed} closure ===")
maxr=0; brs={}
for i in range(6):
    for j in range(i+1,6):
        b=comm(six[i],six[j]); r=proj_res(b,S6); maxr=max(maxr,r)
        coef=np.linalg.lstsq(S6.T,b.reshape(-1),rcond=None)[0]
        if np.max(np.abs(b))>1e-9:
            brs[(six_n[i],six_n[j])]=(np.round(coef,3),round(float(np.max(np.abs(b))),3))
print("6-dim closed? max residual =",maxr)
for k,v in brs.items(): print(f"  [{k[0]},{k[1]}] = {v[0]}  mag={v[1]}")

print("\n=== 2. relate kAB2 to kAB (is u1-in-2nd-slot = -u1-in-1st?) ===")
print("kAB2 res onto span{kAB}:",proj_res(kAB2,kAB.reshape(1,-1)),"  (0 => same direction)")
print("kAB+kAB2 mag:",np.max(np.abs(kAB+kAB2))," kAB-kAB2 mag:",np.max(np.abs(kAB-kAB2)))

print("\n=== 3. slot-action tables (tractability: single-entry rational?) ===")
def show(op,name):
    for an,A in [("sA1",sA(I8[0])),("sB1",sB(I8[0])),("sC1",sC(I8[0])),
                 ("sAu1",sA(u1)),("sBu1",sB(u1)),("sCu1",sC(u1)),
                 ("Dg100",Dg(1,0,0)),("Dg010",Dg(0,1,0)),("Dg001",Dg(0,0,1))]:
        r=op@mat_to_vec(A)
        nz={k:round(r[k],3) for k in range(N) if abs(r[k])>1e-6}
        if nz: print(f"  {name}({an}) -> {nz}")
show(kAB,"kAB")
print("  ---")
show(kBC,"kBC")

print("\n=== 4. diagonal coset members in slot language ===")
for nm,d in [("dAA",dAA),("dBB",dBB),("dCC",dCC)]:
    print(f"  {nm}: mag={np.max(np.abs(d)):.3f}")
    r=d@mat_to_vec(sA(u1)); nz={k:round(r[k],3) for k in range(N) if abs(r[k])>1e-6}
    print(f"     {nm}(sA u1) -> {nz}")
# is dAA a combination of the offdiag/family? or genuinely new (diagonal)?
print("dAA res onto span(6-dim)=",proj_res(dAA,S6))
# span of everything
ALL=np.array([m.reshape(-1) for m in [famA,famB,famC,kAB,kBC,kCA,kAB2,kBC2,kCA2,dAA,dBB,dCC]])
print("rank of {fam3 + off6 + diag3} =",rankof(ALL),"(expect 8 = full Z_c)")
# minimal spanning set for Z_c: fam(3)+kAB,kBC,kCA(3)+2 diag
mini=np.array([famA.reshape(-1),famB.reshape(-1),famC.reshape(-1),
               kAB.reshape(-1),kBC.reshape(-1),kCA.reshape(-1),
               dAA.reshape(-1),dBB.reshape(-1)])
print("rank {fam3 + kAB,kBC,kCA + dAA,dBB} =",rankof(mini),"(want 8)")

print("\n=== 5. does the 6-dim {fam+koff} include the diagonal coset? or is it a proper subalg? ===")
print("rank(6-dim fam+koff) =",rankof(S6))
# if 6-dim is closed & proper, it's a subalgebra so(4) or su(2)+su(2). Check simplicity via [.,.] rank
# structure: [k,k] -> family only? [fam,k]->k only?
print("[kAB,kBC] onto family only? res=",proj_res(comm(kAB,kBC),np.array([famA.reshape(-1),famB.reshape(-1),famC.reshape(-1)])))
print("[famA,kBC] onto koff only? res=",proj_res(comm(famA,kBC),np.array([kAB.reshape(-1),kBC.reshape(-1),kCA.reshape(-1)])))
