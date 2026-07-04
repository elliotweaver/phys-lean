"""
N292 — find innerMul(slotB 1)(slotC 1) and innerMul(slotA u1)(slotC 1) as OPERATORS in a
form provable in Lean. And test whether ⁅Lmul(slotA u1), innerMul(slotB 1)(slotC 1)⁆ has a
clean per-Lmul reduction. Key: what is innerMul(slotA u1)(slotC 1)? slots A=(0,1),C=(1,2) share idx 1.
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
def v2m(v): return v.reshape(3,3,8)
def Lmul(A): return np.array([m2v(jb(A,B)) for B in fullbasis]).T
def innerMul(A,B):
    LA,LB=Lmul(A),Lmul(B); return LA@LB-LB@LA
sA=lambda c: slotmat(0,1,c); sB=lambda c: slotmat(0,2,c); sC=lambda c: slotmat(1,2,c)
def comm(X,Y): return X@Y-Y@X
def op_apply(op,M): return v2m(op@m2v(M))
def showslot(M,label):
    parts={}
    for i in range(3):
        if np.max(np.abs(M[i,i]))>1e-9: parts[f"d{i}"]=np.round(M[i,i][:3],2)
    for (i,j),nm in [((0,1),"A"),((0,2),"B"),((1,2),"C")]:
        if np.max(np.abs(M[i,j]))>1e-9: parts[f"slot{nm}"]=np.round(M[i,j][:3],2)
    print(f"  {label}: {parts}")

# innerMul(slotA u1)(slotC 1) as an operator: apply to a probe basis, is it Lmul of something?
imAC=innerMul(sA(u1),sC(I8[0]))
print("innerMul(slotA u1)(slotC 1): is it zero?",np.max(np.abs(imAC)))
# apply to slotB 1
showslot(op_apply(imAC,sB(I8[0])),"imAC(slotB 1)")
showslot(op_apply(imAC,sA(I8[0])),"imAC(slotA 1)")
showslot(op_apply(imAC,sC(u1)),"imAC(slotC u1)")
# innerMul(slotB 1)(slotC 1)=famA-ish
imBC=innerMul(sB(I8[0]),sC(I8[0]))
print("\ninnerMul(slotB 1)(slotC 1) [=famA]: nonzero?",np.max(np.abs(imBC)))
# ⁅Lmul(slotA u1), imBC⁆
b=comm(Lmul(sA(u1)),imBC)
print("⁅Lmul(slotA u1), innerMul(slotB 1)(slotC 1)⁆ max=",np.max(np.abs(b)))
# ⁅Lmul(slotB 1), imAC⁆
b2=comm(Lmul(sB(I8[0])),imAC)
print("⁅Lmul(slotB 1), innerMul(slotA u1)(slotC 1)⁆ max=",np.max(np.abs(b2)))

# KEY IDEA: maybe innerMul(slotA u1)(slotC 1) = Lmul(jb(slotA u1)(slotC 1))-related? NO.
# jb(slotA u1)(slotC 1): slots (0,1) and (1,2) share 1
showslot(jb(sA(u1),sC(I8[0])),"jb(slotA u1)(slotC 1)")
# = slotB (u1 * 1) [jb_slotC_slotA form: jb(slotC c)(slotA a)=slotB(a*c), so jb(slotA a)(slotC c)=slotB(a*c) too?]
showslot(sB(omul(u1,I8[0])),"slotB(u1*1)")
