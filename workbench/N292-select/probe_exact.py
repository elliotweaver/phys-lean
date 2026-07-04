"""
N292 — FINAL: exact structure constants with the BANKED jb convention (jb = A*B + B*A, unhalved,
per Lmul_apply). Fix the exact closure identity for the ticket. Also confirm the
FULL 8-dim su(3) closure residual (all 28 brackets) to decide scope.
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
def jb(A,B): return mat_mul(A,B)+mat_mul(B,A)   # BANKED convention (unhalved)
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
famA=innerMul(sB(I8[0]),sC(I8[0])); famB=innerMul(sC(I8[0]),sA(I8[0])); famC=innerMul(sA(I8[0]),sB(I8[0]))
kAB=innerMul(sA(u1),sB(I8[0])); kBC=innerMul(sB(u1),sC(I8[0])); kCA=innerMul(sC(u1),sA(I8[0]))

# N289's banked family closure convention: check [famA,famB]=? famC (banked coefficient)
print("=== banked family so(3) structure (N289): ===")
F3=np.array([famA.reshape(-1),famB.reshape(-1),famC.reshape(-1)])
for nm,br in [("[famA,famB]",comm(famA,famB)),("[famB,famC]",comm(famB,famC)),("[famC,famA]",comm(famC,famA))]:
    c=np.linalg.lstsq(F3.T,br.reshape(-1),rcond=None)[0]
    print(f"  {nm} = {np.round(c,3)} . [famA,famB,famC]")
print("\n=== coset closure (the su(3)/so(3) symmetric-pair) ===")
for nm,br in [("[kAB,kBC]",comm(kAB,kBC)),("[kBC,kCA]",comm(kBC,kCA)),("[kCA,kAB]",comm(kCA,kAB))]:
    c=np.linalg.lstsq(F3.T,br.reshape(-1),rcond=None)[0]
    res=np.max(np.abs(br-(c[0]*famA+c[1]*famB+c[2]*famC)))
    print(f"  {nm} = {np.round(c,3)} . [famA,famB,famC]   res={res:.1e}")
print("\n=== the closed-form INTERMEDIATE (the tractable route) ===")
def op_apply(op,M): return (op@m2v(M)).reshape(3,3,8)
kAB_sBu1=op_apply(kAB, sB(u1))
kAB_sC1 =op_apply(kAB, sC(I8[0]))
print("kAB.(slotB u1) == -slotA 1 ?", np.max(np.abs(kAB_sBu1 + sA(I8[0])))<1e-9)
print("kAB.(slotC 1) == 0 ?", np.max(np.abs(kAB_sC1))<1e-9)
# so [kAB,kBC] = [kAB, innerMul(sB u1)(sC 1)] = innerMul(kAB.sBu1)(sC1) + innerMul(sBu1)(kAB.sC1)
#             = innerMul(-slotA 1)(slotC 1) + 0 = -innerMul(slotA 1)(slotC 1)
lhs=comm(kAB,kBC)
rhs=-innerMul(sA(I8[0]),sC(I8[0]))
print("[kAB,kBC] == -innerMul(slotA 1)(slotC 1) ?", np.max(np.abs(lhs-rhs))<1e-9)
# and -innerMul(slotA 1)(slotC 1) = innerMul(slotC 1)(slotA 1) = famB  (antisymmetry)
print("-innerMul(slotA1)(slotC1) == innerMul(slotC1)(slotA1) == famB ?",
      np.max(np.abs(-innerMul(sA(I8[0]),sC(I8[0])) - famB))<1e-9)
