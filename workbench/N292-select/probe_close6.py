"""
N292 — clean closure check: is {family3 + offdiag-dressed3} a CLOSED 6-dim Lie algebra,
or does it leak into the diagonal coset (=> minimal closed object is full su(3) dim 8)?
Also identify the 6-dim algebra (Killing signature) if closed.
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
def mat_mul(A,B):
    R=np.zeros((3,3,8))
    for i in range(3):
        for j in range(3):
            for k in range(3): R[i,j]+=omul(A[i,k],B[k,j])
    return R
def jb(A,B): return mat_mul(A,B)+mat_mul(B,A)
def slotmat(i,j,c):
    M=np.zeros((3,3,8)); M[i,j]=c.copy(); M[j,i]=ostar(c); return M
fullbasis=[]
for i in range(3):
    for j in range(3):
        for c in range(8):
            M=np.zeros((3,3,8)); M[i,j]=I8[c]; fullbasis.append(M)
def m2v(M): return M.reshape(-1)
def Lmul(A):
    return np.array([m2v(jb(A,B)) for B in fullbasis]).T
def innerMul(A,B):
    LA,LB=Lmul(A),Lmul(B); return LA@LB-LB@LA
sA=lambda c: slotmat(0,1,c); sB=lambda c: slotmat(0,2,c); sC=lambda c: slotmat(1,2,c)
famA=innerMul(sB(I8[0]),sC(I8[0])); famB=innerMul(sC(I8[0]),sA(I8[0])); famC=innerMul(sA(I8[0]),sB(I8[0]))
kAB=innerMul(sA(u1),sB(I8[0])); kBC=innerMul(sB(u1),sC(I8[0])); kCA=innerMul(sC(u1),sA(I8[0]))
dAA=innerMul(sA(u1),sA(I8[0])); dBB=innerMul(sB(u1),sB(I8[0])); dCC=innerMul(sC(u1),sC(I8[0]))
def comm(X,Y): return X@Y-Y@X
def rankof(A,t=1e-7): return np.linalg.matrix_rank(A,tol=t)

six=[famA,famB,famC,kAB,kBC,kCA]; names=["famA","famB","famC","kAB","kBC","kCA"]
S6=np.array([m.reshape(-1) for m in six])
print("rank of 6 =",rankof(S6))
print("=== is {fam3 + koff3} closed? ===")
maxres=0; leaks=[]
for i in range(6):
    for j in range(i+1,6):
        b=comm(six[i],six[j]); r=np.linalg.norm(b.reshape(-1)-np.linalg.qr(S6.T)[0]@(np.linalg.qr(S6.T)[0].T@b.reshape(-1)),np.inf)
        # proj residual
        Q,_=np.linalg.qr(S6.T); res=np.max(np.abs(b.reshape(-1)-Q@(Q.T@b.reshape(-1))))
        maxres=max(maxres,res)
        if res>1e-9: leaks.append((names[i],names[j],round(res,4)))
print("max residual =",round(maxres,4))
print("leaks (bracket, residual):",leaks[:10])
# where do leaks go? diagonal coset?
if leaks:
    i,j=names.index(leaks[0][0]),names.index(leaks[0][1])
    b=comm(six[i],six[j])
    D3=np.array([dAA.reshape(-1),dBB.reshape(-1),dCC.reshape(-1)])
    S6D=np.vstack([S6,D3])
    Q,_=np.linalg.qr(S6D.T)
    print("leak lands in {6 + diag3}? residual=",np.max(np.abs(b.reshape(-1)-Q@(Q.T@b.reshape(-1)))))

print("\n=== full Z_c = 8-dim su(3): is {fam3+koff3+diag2} closed? ===")
eight=[famA,famB,famC,kAB,kBC,kCA,dAA,dBB]
E8=np.array([m.reshape(-1) for m in eight])
print("rank of 8 =",rankof(E8))
Q8,_=np.linalg.qr(E8.T)
maxr8=0
for i in range(8):
    for j in range(i+1,8):
        b=comm(eight[i],eight[j])
        maxr8=max(maxr8,np.max(np.abs(b.reshape(-1)-Q8@(Q8.T@b.reshape(-1)))))
print("{fam3+koff3+dAA+dBB} closed? max residual =",round(maxr8,4))
# Killing signature of the 8
struct=np.zeros((8,8,8))
for i in range(8):
    for j in range(8):
        struct[i,j]=Q8.T@comm(eight[i],eight[j]).reshape(-1)
Kill=np.zeros((8,8))
for a in range(8):
    for b_ in range(8):
        Kill[a,b_]=sum(struct[a,c,d]*struct[b_,d,c] for c in range(8) for d in range(8))
ev=np.linalg.eigvalsh(Kill)
print("Killing eigenvalues (8):",np.round(ev,3))
print("all-negative (compact su(3))?",np.all(ev<-1e-6)," semisimple?",abs(np.linalg.det(Kill))>1e-9)
