"""
N292 CRITICAL: does [kAB,kBC]=famB hold as a FULL-OPERATOR identity (ALL matrices),
or only on the HERMITIAN arena? innerMul is a LinearMap on the full space; derH3 members
are only Leibniz on Hermitian args. Test over NON-Hermitian basis too.
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
# FULL matrix space: 3x3 x 8 = 72-dim (NO Hermitian restriction)
def mat_mul(A,B):
    R=np.zeros((3,3,8))
    for i in range(3):
        for j in range(3):
            for k in range(3): R[i,j]+=omul(A[i,k],B[k,j])
    return R
def jb(A,B): return mat_mul(A,B)+mat_mul(B,A)
def slotmat(i,j,c):
    M=np.zeros((3,3,8)); M[i,j]=c.copy(); M[j,i]=ostar(c); return M
def Dgmat(d0,d1,d2):
    M=np.zeros((3,3,8)); M[0,0]=d0*I8[0]; M[1,1]=d1*I8[0]; M[2,2]=d2*I8[0]; return M
# full 72-dim basis (all 9 positions x 8 comps, NOT symmetrized)
fullbasis=[]
for i in range(3):
    for j in range(3):
        for c in range(8):
            M=np.zeros((3,3,8)); M[i,j]=I8[c]; fullbasis.append(M)
def m2v(M): return M.reshape(-1)
def v2m(v): return v.reshape(3,3,8)
def Lmul(A):
    cols=[]
    for B in fullbasis: cols.append(m2v(jb(A,B)))
    return np.array(cols).T   # 72x72
def innerMul(A,B):
    LA,LB=Lmul(A),Lmul(B); return LA@LB-LB@LA
sA=lambda c: slotmat(0,1,c); sB=lambda c: slotmat(0,2,c); sC=lambda c: slotmat(1,2,c)
kAB=innerMul(sA(u1),sB(I8[0])); kBC=innerMul(sB(u1),sC(I8[0]))
famB=innerMul(sC(I8[0]),sA(I8[0])); famA=innerMul(sB(I8[0]),sC(I8[0])); famC=innerMul(sA(I8[0]),sB(I8[0]))
br=kAB@kBC-kBC@kAB
print("=== FULL-OPERATOR test (72-dim, non-Hermitian included) ===")
print("[kAB,kBC] vs famB: max|br - famB| =",np.max(np.abs(br-famB)))
# maybe it's a combo of family + something on non-herm?
F3=np.array([famA.reshape(-1),famB.reshape(-1),famC.reshape(-1)])
coef=np.linalg.lstsq(F3.T,br.reshape(-1),rcond=None)[0]
print("[kAB,kBC] onto family coords (full):",np.round(coef,4)," residual:",np.max(np.abs(br-(coef[0]*famA+coef[1]*famB+coef[2]*famC))))
# restrict to Hermitian arena action only
# Hermitian arena basis
pairs=[(0,1),(0,2),(1,2)]
herm=[]
for i in range(3):
    M=np.zeros((3,3,8)); M[i,i]=I8[0]; herm.append(M)
for (i,j) in pairs:
    for c in range(8):
        M=np.zeros((3,3,8)); M[i,j]=I8[c]; M[j,i]=ostar(I8[c]); herm.append(M)
Hb=np.array([m2v(h) for h in herm])  # 27 x 72
# does br agree with famB on Hermitian subspace only?
diffs=[np.max(np.abs((br-famB)@m2v(h))) for h in herm]
print("max|(br-famB) applied to Hermitian basis| =",max(diffs)," (0 => agree on Hermitian only)")
# how big is the discrepancy on NON-hermitian inputs?
nonh=[M for M in fullbasis]
allmax=max(np.max(np.abs((br-famB)@m2v(M))) for M in fullbasis)
print("max|(br-famB) applied to FULL basis| =",allmax," (if >0 => full-op identity FAILS, only Herm-restricted holds)")
