"""
N292 — is innerMul(slotA u1)(slotB 1) a FULL-OPERATOR jb-derivation (Leibniz for ALL args,
not just Hermitian)? If YES, the mixed Leibniz [kAB,Lmul C]=Lmul(kAB C) is a clean
full-operator lemma provable like N287's innerMul_gauge_leibniz. Test Leibniz over the
FULL 72x72 basis (non-Hermitian A,B included).
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
def op_apply(op,M): return v2m(op@m2v(M))
kAB=innerMul(sA(u1),sB(I8[0]))

print("=== Is kAB a FULL-OPERATOR jb-derivation? Leibniz over ALL 72x72 basis pairs ===")
bad=0; worst=0
for a in range(72):
    for b in range(72):
        X=fullbasis[a]; Y=fullbasis[b]
        lhs=op_apply(kAB, jb(X,Y))
        rhs=jb(op_apply(kAB,X),Y)+jb(X,op_apply(kAB,Y))
        d=np.max(np.abs(lhs-rhs))
        worst=max(worst,d)
        if d>1e-9: bad+=1
print(f"Leibniz failures over FULL 72x72 = {bad}/{72*72}, worst={worst:.2e}")
print(" (0 => kAB is a FULL-OP jb-derivation => the SAME proof shape as innerMul_gauge_leibniz)")

# Compare: is famC (real-real) also a full-op derivation?
famC=innerMul(sA(I8[0]),sB(I8[0]))
bad2=0
for a in range(72):
    for b in range(72):
        X=fullbasis[a]; Y=fullbasis[b]
        d=np.max(np.abs(op_apply(famC,jb(X,Y))-(jb(op_apply(famC,X),Y)+jb(X,op_apply(famC,Y)))))
        if d>1e-9: bad2+=1
print(f"famC full-op Leibniz failures = {bad2}/{72*72}")

# KEY IMPLICATION: if BOTH are full-op derivations, then the general lemma
#   ⁅innerMul A B, Lmul C⁆ = Lmul (innerMul A B C)   -- is this TRUE for ALL A,B,C?
# Test general A,B,C random-ish
def rnd(seed):
    np.random.seed(seed); M=np.zeros((3,3,8))
    for i in range(3):
        for j in range(3): M[i,j]=np.random.randint(-2,3,8).astype(float)
    return M
print("\n=== general ⁅innerMul A B, Lmul C⁆ = Lmul(innerMul A B C)? (random A,B,C) ===")
for s in range(3):
    A,B,C=rnd(s),rnd(s+10),rnd(s+20)
    im=innerMul(A,B)
    lhs=im@Lmul(C)-Lmul(C)@im
    rhs=Lmul(op_apply(im,C))
    print(f"  seed {s}: max|lhs-rhs| = {np.max(np.abs(lhs-rhs)):.2e}")
print(" (0 => the mixed-Leibniz lever is a GENERAL full-op identity => clean abel proof)")
