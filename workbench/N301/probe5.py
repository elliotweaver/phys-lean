"""N301 probe5 — famC(slotC c) exact form (orbit closes back to the diagonal mass sector),
and confirm the trace-isospectrality pieces are clean (rtr(famC A)=0, D rtr(A^2)[famC A]=0)."""
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
def jTr(M): return reQ(M[0,0])+reQ(M[1,1])+reQ(M[2,2])
famC = innerMul(slotA(one_oct()), slotB(one_oct()))
rng=np.random.default_rng(9)
# famC(slotC c) for general c
for lbl,c in [("c=1",one_oct()),("c=u1(imag)",I8[1]),("c=e2",I8[2]),("c=rand",rng.standard_normal(8))]:
    r=famC(slotC(c))
    print("famC(slotC %-10s) diag=(%.3f,%.3f,%.3f) offdiag_norm=%.2e  reQ(c)=%.3f -> Dg(0,2reQc,-2reQc)?"
          % (lbl, r[0,0,0],r[1,1,0],r[2,2,0],
             float(np.abs(np.array([r[0,1],r[0,2],r[1,2]])).max()), reQ(c)))
    exp=Dg(0.0, 2*reQ(c), -2*reQ(c))
    print("     resid vs Dg(0,2reQc,-2reQc) = %.2e" % float(np.abs(r-exp).max()))
# trace-isospectrality
def herm_rand():
    M=zero_mat()
    for i in range(3): M[i,i]=rng.standard_normal()*I8[0]
    for (i,j) in [(0,1),(0,2),(1,2)]:
        a=rng.standard_normal(8); M[i,j]=a; M[j,i]=ostar(a)
    return M
A=herm_rand(); TA=famC(A)
print()
print("rtr(famC A) = %.2e  (D of 1st spectral invariant = trace)" % jTr(TA))
print("2 rtr(A*TA) = %.2e  (D of 2nd trace-power rtr(A*A))" % (2*jTr(mat_mul(A,TA))))
print("rtr(T(A*A)) = %.2e  (=2rtr(A*TA), Leibniz+cyclicity, A*A hermitian -> 0 by N300)" % jTr(famC(mat_mul(A,A))))
