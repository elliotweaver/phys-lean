"""N303 probe3 — nail kAB(slotC c) general reverse-leg form + the complex-structure square."""
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
def reQ(o): return float(o[0])
I8=np.eye(8); u1v=I8[1]
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
kAB  = innerMul(slotA(u1v),        slotB(one_oct()))
def commutator(T,S): return lambda X: T(S(X)) - S(T(X))

# reverse leg: kAB(slotC c) for c = 1, u1, e2, general
print("=== kAB(slotC c) reverse leg ===")
def reQu1(o): return float(o[1])  # u1-component
for lbl,c in [("1",one_oct()),("u1",u1v),("e2",I8[2]),("e3",I8[3]),("rand",np.random.default_rng(3).standard_normal(8))]:
    v=kAB(slotC(c))
    diag=[reQ(v[0,0]),reQ(v[1,1]),reQ(v[2,2])]
    offmax=max(np.abs(v[0,1]).max(),np.abs(v[0,2]).max(),np.abs(v[1,2]).max())
    print("  c=%s: kAB(slotC c) diag=%s  off-diag-max=%.2e   (-2·u1comp(c)=%.3f)"%(lbl,np.round(diag,4),offmax,-2*reQu1(c)))
# hypothesis: kAB(slotC c) = Dg 0 (-2·u1comp)(2·u1comp) ?  i.e. picks the u1-component
print("  hypothesis: kAB(slotC c) = Dg 0 (2·(u1-part of c))·? ...")

# complex structure square: H=⁅famC,kAB⁆, H² on slotC 1 / slotC u1
H=commutator(famC,kAB)
for lbl,elt in [("slotC 1",slotC(one_oct())),("slotC u1",slotC(u1v))]:
    v=H(H(elt))
    # expect -16 • elt
    print("  H²(%s) = ? vs -16•(%s): resid=%.2e"%(lbl,lbl,np.abs(v+16*elt).max()))

# is H a scalar 'phase' multiple of the fold-root complex structure? H(slotA 1), H(slotB 1)
print("=== H on all three slots (the su(3) Cartan / phase action) ===")
for lbl,elt in [("slotA 1",slotA(one_oct())),("slotB 1",slotB(one_oct())),("slotC 1",slotC(one_oct()))]:
    v=H(elt)
    # try v = k • slot?(u1)
    for sf,sn in [(slotA,"slotA"),(slotB,"slotB"),(slotC,"slotC")]:
        pr=sf(u1v)
        n=np.abs(pr).max()
        if n>1e-9:
            idx=np.unravel_index(np.argmax(np.abs(pr)),pr.shape); k=v[idx]/pr[idx]
            if np.abs(v-k*pr).max()<1e-9:
                print("  H(%s) = %.1f • %s(u1)"%(lbl,k,sn))
