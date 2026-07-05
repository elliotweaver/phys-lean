"""N303 SELECT probe 2 — nail the EXACT complex-mixing structure & the su(3)_flavour Cartan."""
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
def Lmul(A): return lambda X: jb_mat(A,X)
def innerMul(A,B): return lambda X: jb_mat(A, jb_mat(B,X)) - jb_mat(B, jb_mat(A,X))
def jTr(M): return reQ(M[0,0])+reQ(M[1,1])+reQ(M[2,2])
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

# 1) exact form of kAB(Dg t)
print("=== 1) kAB(Dg t0 t1 t2) exact ===")
for (t0,t1,t2) in [(0.3,-0.7,1.1),(1,0,0),(0,1,0),(0,0,1)]:
    v = kAB(Dg(t0,t1,t2))
    # candidate slotC((t1-t2)•u1):
    cand = slotC((t1-t2)*u1v)
    print("  t=(%.0f,%.0f,%.0f) [or frac]: kAB(Dg) vs slotC((t1-t2)•u1) resid=%.2e  | famC(Dg)=slotC((t2-t1)•1)?" 
          % (t0,t1,t2, np.abs(v-cand).max()))

# confirm famC leg too (N301): famC(Dg t)=slotC((t2-t1)•1)
print("=== famC(Dg) recheck ===")
for (t0,t1,t2) in [(0.3,-0.7,1.1)]:
    v = famC(Dg(t0,t1,t2)); cand = slotC((t2-t1)*one_oct())
    print("  famC(Dg) vs slotC((t2-t1)•1) resid=%.2e" % np.abs(v-cand).max())

# 2) reverse legs: famC(slotC(r•1)) and kAB(slotC(r•u1)) -> back to diagonal?
print("=== 2) reverse legs (back to diagonal split) ===")
r=1.0
famC_sC1 = famC(slotC(r*one_oct()))
print("  famC(slotC(1)) diag:", [np.round(famC_sC1[i,i],3)[:2] for i in range(3)])
kAB_sCu1 = kAB(slotC(r*u1v))
print("  kAB(slotC(u1)) diag:", [np.round(kAB_sCu1[i,i],3)[:2] for i in range(3)])
kAB_sC1 = kAB(slotC(r*one_oct()))
print("  kAB(slotC(1))  nonzero:")
for i in range(3):
    for j in range(3):
        if np.abs(kAB_sC1[i,j]).max()>1e-9: print("     (%d,%d):"%(i,j), np.round(kAB_sC1[i,j],3)[:2])

# 3) su(3) Cartan bracket H := ⁅famC,kAB⁆ — its action rotates real<->imag mixing?
print("=== 3) H := ⁅famC,kAB⁆ acts on the mixing line {slotC 1, slotC u1} ===")
H = commutator(famC, kAB)
for lbl,elt in [("slotC(1)",slotC(one_oct())),("slotC(u1)",slotC(u1v))]:
    r_ = H(elt)
    print("  H(%s) nonzero:" % lbl)
    for i in range(3):
        for j in range(3):
            if np.abs(r_[i,j]).max()>1e-9: print("     (%d,%d):"%(i,j), np.round(r_[i,j],3)[:2])
# H on slotA/slotB
for lbl,elt in [("slotA(1)",slotA(one_oct())),("slotB(1)",slotB(one_oct()))]:
    r_ = H(elt)
    print("  H(%s) nonzero:" % lbl)
    for i in range(3):
        for j in range(3):
            if np.abs(r_[i,j]).max()>1e-9: print("     (%d,%d):"%(i,j), np.round(r_[i,j],3)[:2])

# 4) is the mixing line {slotC(1),slotC(u1)} a COMPLEX line closed under H? (phase rotation)
print("=== 4) H rotates the complex mixing line (phase germ)? ===")
# H(slotC 1) should be ~ ±2 slotC(u1) and H(slotC u1) ~ ∓2 slotC 1 for a genuine complex structure
Hc1 = H(slotC(one_oct())); target1 = slotC(u1v)
Hcu = H(slotC(u1v)); target2 = slotC(one_oct())
# find scalar
import numpy as _np
def ratio(a,b):
    bn=_np.abs(b).max()
    if bn<1e-12: return None
    idx=_np.unravel_index(_np.argmax(_np.abs(b)),b.shape); return a[idx]/b[idx]
print("  H(slotC 1) = c1 • slotC(u1)?  c1=", ratio(Hc1,target1), " resid=%.2e"%_np.abs(Hc1-ratio(Hc1,target1)*target1).max() if ratio(Hc1,target1) is not None else None)
print("  H(slotC u1)= c2 • slotC(1)?   c2=", ratio(Hcu,target2), " resid=%.2e"%_np.abs(Hcu-ratio(Hcu,target2)*target2).max() if ratio(Hcu,target2) is not None else None)
