"""
N301 probe2 — the FULL family action on the mass-texture module L0 ≅ H3(O)_traceless.
Via N296 equivariance, famX acts on L0 = {Lmul A} by A ↦ famX(A). Measure famC on the
arena basis to nail how the diagonal mass-splitting sector and the off-diagonal
generation-mixing sector sit in the family-so(3) module.
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
e=[basis(i) for i in range(8)]
Tt=np.zeros((8,8,8)); Sst=np.zeros((8,8))
for i in range(8):
    for j in range(8):
        cc=flat(O_mul(e[i],e[j]))
        for k in range(8): Tt[i,j,k]=float(cc[k])
    cs=flat(O_star(e[i]))
    for k in range(8): Sst[i,k]=float(cs[k])
def omul(x,y): return np.einsum('ijk,i,j->k',Tt,x,y)
def ostar(x): return Sst.T@x
I8=np.eye(8)
def zero_mat(): return np.zeros((3,3,8))
def mat_mul(A,B):
    R=zero_mat()
    for i in range(3):
        for j in range(3):
            for k in range(3): R[i,j]+=omul(A[i,k],B[k,j])
    return R
def jb_mat(A,B): return mat_mul(A,B)+mat_mul(B,A)
def innerMul(A,B): return lambda X: jb_mat(A, jb_mat(B,X)) - jb_mat(B, jb_mat(A,X))
def one_oct():
    v=np.zeros(8); v[0]=1.0; return v
def Dg(t0,t1,t2):
    M=zero_mat(); M[0,0]=t0*I8[0]; M[1,1]=t1*I8[0]; M[2,2]=t2*I8[0]; return M
def slotA(a):
    M=zero_mat(); M[0,1]=a.copy(); M[1,0]=ostar(a); return M
def slotB(b):
    M=zero_mat(); M[0,2]=b.copy(); M[2,0]=ostar(b); return M
def slotC(c):
    M=zero_mat(); M[1,2]=c.copy(); M[2,1]=ostar(c); return M
famC = innerMul(slotA(one_oct()), slotB(one_oct()))
famA = innerMul(slotB(one_oct()), slotC(one_oct()))
famB = innerMul(slotC(one_oct()), slotA(one_oct()))
def descr(M):
    d=[M[0,0,0],M[1,1,0],M[2,2,0]]
    off={'A(01)':M[0,1],'B(02)':M[0,2],'C(12)':M[1,2]}
    parts=[]
    if max(abs(x) for x in d)>1e-9: parts.append("Dg(%.2f,%.2f,%.2f)"%(d[0],d[1],d[2]))
    for k,v in off.items():
        if np.abs(v).max()>1e-9: parts.append("slot%s(re=%.2f,|.|=%.2f)"%(k,v[0],np.abs(v).max()))
    return " + ".join(parts) if parts else "0"
print("famC action on the arena basis (the family-so(3) action on the mass-texture module L0):")
for lbl,M in [("Dg(1,0,0)",Dg(1,0,0)),("Dg(0,1,0)",Dg(0,1,0)),("Dg(0,0,1)",Dg(0,0,1)),
              ("slotA(1)",slotA(one_oct())),("slotB(1)",slotB(one_oct())),("slotC(1)",slotC(one_oct()))]:
    print("  famC(%-10s) = %s" % (lbl, descr(famC(M))))
print()
print("famA action:")
for lbl,M in [("Dg(1,0,0)",Dg(1,0,0)),("Dg(0,1,0)",Dg(0,1,0)),("Dg(0,0,1)",Dg(0,0,1)),
              ("slotA(1)",slotA(one_oct())),("slotB(1)",slotB(one_oct())),("slotC(1)",slotC(one_oct()))]:
    print("  famA(%-10s) = %s" % (lbl, descr(famA(M))))
# specific: famC(slotC 1) exactly
print()
print("famC(slotC 1) diag exact:", famC(slotC(one_oct()))[0,0,0], famC(slotC(one_oct()))[1,1,0], famC(slotC(one_oct()))[2,2,0])
print("   -> compare Dg(0,-2,2)? or Dg(0,-1,1)? traceless split of slotC into the diagonal mass sector")
