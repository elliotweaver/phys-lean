"""
N292 — nail down the SLOT-LEVEL closed forms needed for the closure proof.
Closure: [kAB, kBC] = innerMul(kAB.sBu1)(sC1) + innerMul(sBu1)(kAB.sC1).
Need closed forms:  kAB.(slotB u1) = ?  and  kAB.(slotC 1) = ?  in slot/Dg language.
And identify [kAB,kBC] as which family generator, exactly (Fraction).
Confirm the WHOLE su(3): all three coset brackets -> family (cyclic), family acts on coset.
"""
import numpy as np
from fractions import Fraction as F
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
Cc=make_level(lambda x,y:x*y,lambda x:x,lambda x,y:x+y,lambda x,y:x-y)
Hl=make_level(*Cc); Ol=make_level(*Hl); O_mul,O_star,_,_=Ol
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
u1=I8[1].copy()
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
def vec_to_mat(v):
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
def jb(A,B): return mat_mul(A,B)+mat_mul(B,A)
def comm(X,Y): return X@Y-Y@X
def Lop(Amat):
    M=np.zeros((N,N))
    for a in range(N): M[:,a]=mat_to_vec(jb(Amat, arena_basis[a]))
    return M
def slot(pair,c):
    (i,j)=pair; M=zero_mat(); M[i,j]=c.copy(); M[j,i]=ostar(c); return M
def innerMul(A,B): return comm(Lop(A),Lop(B))
sA=lambda c: slot((0,1),c); sB=lambda c: slot((0,2),c); sC=lambda c: slot((1,2),c)
def op_apply(op,Amat): return vec_to_mat(op@mat_to_vec(Amat))
def show(M,label):
    v=mat_to_vec(M); slotnames=["d0","d1","d2"]+[f"{p}[{c}]" for p in ["A","B","C"] for c in range(8)]
    print(f"  {label}:", {slotnames[k]:round(v[k],3) for k in range(N) if abs(v[k])>1e-6})

kAB=innerMul(sA(u1),sB(I8[0])); kBC=innerMul(sB(u1),sC(I8[0])); kCA=innerMul(sC(u1),sA(I8[0]))
famA=innerMul(sB(I8[0]),sC(I8[0])); famB=innerMul(sC(I8[0]),sA(I8[0])); famC=innerMul(sA(I8[0]),sB(I8[0]))

print("=== slot-level actions needed for closure ===")
show(op_apply(kAB,sB(u1)),"kAB.(slotB u1)")
show(op_apply(kAB,sC(I8[0])),"kAB.(slotC 1)")
# kAB.(slotB u1) = -slotA 1 ?
print("  kAB.(slotB u1) == -slotA 1 ?", np.max(np.abs(op_apply(kAB,sB(u1))+sA(I8[0])))<1e-9)

print("\n=== the three coset brackets (unhalved jb; famC=innerMul(sA1)(sB1)) ===")
def famcoef(br):
    F3=np.array([famA.reshape(-1),famB.reshape(-1),famC.reshape(-1)])
    return np.round(np.linalg.lstsq(F3.T,br.reshape(-1),rcond=None)[0],4), np.max(np.abs(br-vec_to_mat(0*mat_to_vec(br)).reshape(N,N)))
for nm,br in [("[kAB,kBC]",comm(kAB,kBC)),("[kBC,kCA]",comm(kBC,kCA)),("[kCA,kAB]",comm(kCA,kAB))]:
    c=np.linalg.lstsq(np.array([famA.reshape(-1),famB.reshape(-1),famC.reshape(-1)]).T,br.reshape(-1),rcond=None)[0]
    print(f"  {nm} = {np.round(c,4)} . [famA,famB,famC]")

print("\n=== family acts on coset: [famC,kAB]=? (in coset) ===")
K3=np.array([kAB.reshape(-1),kBC.reshape(-1),kCA.reshape(-1)])
for nm,br in [("[famC,kAB]",comm(famC,kAB)),("[famA,kBC]",comm(famA,kBC)),("[famB,kCA]",comm(famB,kCA))]:
    c=np.linalg.lstsq(K3.T,br.reshape(-1),rcond=None)[0]
    print(f"  {nm} = {np.round(c,4)} . [kAB,kBC,kCA]  res={np.max(np.abs(br-vec_to_mat(np.zeros(N)).reshape(N,N))):.3f}")
