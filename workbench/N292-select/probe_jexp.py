"""
N292 — the Jacobi-expansion route for the mixed Leibniz, measuring the intermediate innerMuls.
⁅kAB, Lmul(slotC 1)⁆ = ⁅Lmul(slotA u1), innerMul(slotB 1)(slotC 1)⁆ - ⁅Lmul(slotB 1), innerMul(slotA u1)(slotC 1)⁆
(lie_lie). Measure innerMul(slotB 1)(slotC 1)=famA-ish, innerMul(slotA u1)(slotC 1)=?
and whether the whole thing is 0.
Similarly ⁅kAB, Lmul(slotB u1)⁆ = Lmul(-slotA 1).
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
def showslot(op,label):
    # decompose operator into innerMul basis? just report if it's 0 or a known innerMul
    print(f"  {label}: max|op|={np.max(np.abs(op)):.3f}")

kAB=innerMul(sA(u1),sB(I8[0]))
# ⁅kAB, Lmul(slotC 1)⁆
mixC=comm(kAB, Lmul(sC(I8[0])))
print("⁅kAB, Lmul(slotC 1)⁆ max =",np.max(np.abs(mixC)),"(expect 0)")
# lie_lie expansion: ⁅⁅La,Lb⁆,Lc⁆ = ⁅La,⁅Lb,Lc⁆⁆ - ⁅Lb,⁅La,Lc⁆⁆
La,Lb,Lc=Lmul(sA(u1)),Lmul(sB(I8[0])),Lmul(sC(I8[0]))
t1=comm(La,comm(Lb,Lc))   # ⁅La,innerMul(slotB1)(slotC1)⁆
t2=comm(Lb,comm(La,Lc))   # ⁅Lb,innerMul(slotAu1)(slotC1)⁆
print("lie_lie: ⁅kAB,Lc⁆ == t1-t2?",np.max(np.abs(mixC-(t1-t2))))
print("  innerMul(slotB 1)(slotC 1) = famA-type; ⁅La, that⁆ max=",np.max(np.abs(t1)))
print("  innerMul(slotA u1)(slotC 1) max=",np.max(np.abs(comm(La,Lc))),"; ⁅Lb, that⁆ max=",np.max(np.abs(t2)))
# what is innerMul(slotA u1)(slotC 1)? disjoint slots (A=01, C=12) share index... 0,1 and 1,2 share 1
print("  innerMul(slotA u1)(slotC 1) applied to slotB 1:", 
      {k:round(m2v(comm(La,Lc)@m2v(sB(I8[0])))[k],2) for k in range(72) if abs(m2v(comm(La,Lc)@m2v(sB(I8[0])))[k])>1e-6})

# ⁅kAB, Lmul(slotB u1)⁆ = Lmul(-slotA 1)?
mixB=comm(kAB, Lmul(sB(u1)))
tgt=Lmul(-sA(I8[0]))
print("\n⁅kAB, Lmul(slotB u1)⁆ == Lmul(-slotA 1)?",np.max(np.abs(mixB-tgt)))
# via lie_lie
La2,Lb2,Lc2=Lmul(sA(u1)),Lmul(sB(I8[0])),Lmul(sB(u1))
print("  lie_lie t1-t2:",np.max(np.abs(mixB-(comm(La2,comm(Lb2,Lc2))-comm(Lb2,comm(La2,Lc2))))))
print("  innerMul(slotB1)(slotB u1) [same slot B] max=",np.max(np.abs(comm(Lb2,Lc2))))
print("  innerMul(slotA u1)(slotB u1) max=",np.max(np.abs(comm(La2,Lc2))))
