"""
N292 — pin the CLEANEST PROVABLE route for [kAB,kBC]=famB.
Test on FULL 72-dim space (all X, not just Hermitian):
 R1. mixed Leibniz: [kAB, Lmul C] = Lmul(kAB C) for C=slotB u1, slotC 1  (full-op?)
 R2. the general innerMul-derivation Leibniz for arbitrary args (full-op?)
 R3. direct: is [kAB,kBC] provable as LinearMap.ext without bash, via [kAB, Lmul(sBu1)]&[kAB,Lmul(sC1)]?
The Jacobi identity ⁅kAB,⁅L C,L D⁆⁆ = ⁅⁅kAB,L C⁆,L D⁆+⁅L C,⁅kAB,L D⁆⁆ is ALWAYS true (Lie).
So I need ⁅kAB, Lmul C⁆ for C=slotB u1 and C=slotC 1 as clean operators.
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
def Lmul(A): return np.array([m2v(jb(A,B)) for B in fullbasis]).T
def innerMul(A,B):
    LA,LB=Lmul(A),Lmul(B); return LA@LB-LB@LA
sA=lambda c: slotmat(0,1,c); sB=lambda c: slotmat(0,2,c); sC=lambda c: slotmat(1,2,c)
def comm(X,Y): return X@Y-Y@X
def op_apply(op,M): return (op@m2v(M)).reshape(3,3,8)
kAB=innerMul(sA(u1),sB(I8[0])); kBC=innerMul(sB(u1),sC(I8[0]))

print("=== R1: mixed Leibniz [kAB, Lmul C] = Lmul(kAB C) on FULL 72-dim ===")
for nm,C in [("slotB u1",sB(u1)),("slotC 1",sC(I8[0])),("slotA u1",sA(u1)),("slotB 1",sB(I8[0]))]:
    kABC=op_apply(kAB,C)
    lhs=comm(kAB,Lmul(C)); rhs=Lmul(kABC)
    print(f"  C={nm}: max|[kAB,Lmul C]-Lmul(kAB C)| = {np.max(np.abs(lhs-rhs)):.2e}  (kAB C nonzero? {np.max(np.abs(kABC)):.2f})")

print("\n=== R3: build [kAB,kBC] via Jacobi (always true) ===")
# innerMul C D = [Lmul C, Lmul D], C=slotB u1, D=slotC 1
C=sB(u1); D=sC(I8[0])
# Jacobi: [kAB, [LC,LD]] = [[kAB,LC],LD] + [LC,[kAB,LD]]
LC,LD=Lmul(C),Lmul(D)
jac = comm(comm(kAB,LC),LD) + comm(LC,comm(kAB,LD))
print("Jacobi reconstruction == [kAB,kBC]?",np.max(np.abs(jac-comm(kAB,kBC))))
# with mixed Leibniz: [kAB,LC]=Lmul(kAB C), [kAB,LD]=Lmul(kAB D)=Lmul(0)=0
kABC=op_apply(kAB,C); kABD=op_apply(kAB,D)
route = comm(Lmul(kABC),LD) + comm(LC,Lmul(kABD))
print("route (Lmul(kAB C),LD)+(LC,Lmul(kAB D)) == [kAB,kBC]?",np.max(np.abs(route-comm(kAB,kBC))))
print("  kAB C = kAB(slotB u1):",{k:round(m2v(kABC)[k],2) for k in range(72) if abs(m2v(kABC)[k])>1e-6})
print("  kAB D = kAB(slotC 1) zero?",np.max(np.abs(kABD))<1e-9)
# so [kAB,kBC] = [Lmul(kAB C), LD] = innerMul(kAB C) D. kAB C = -slotA 1.
print("[kAB,kBC] == innerMul(kAB C)(slotC 1)?",np.max(np.abs(comm(Lmul(kABC),LD)-comm(kAB,kBC))))
print("kAB C == -slotA 1?",np.max(np.abs(kABC+sA(I8[0])))<1e-9)
# final: innerMul(-slotA 1)(slotC 1) = -innerMul(slotA 1)(slotC 1) = innerMul(slotC 1)(slotA 1)
print("[kAB,kBC] == innerMul(slotC 1)(slotA 1)?",np.max(np.abs(comm(kAB,kBC)-innerMul(sC(I8[0]),sA(I8[0])))))
