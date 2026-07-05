"""
N301 MEASURE-FIRST. Test the candidate: the derived family symmetry ROTATES the
diagonal mass-splitting movers (Lmul(Dg t), t traceless) into the off-diagonal
generation-mixing movers (Lmul(slotC v)) inside the ONE spectrum-moving module L0.

Reuses the N300 exact-Fraction octonion + numpy harness.

Candidate headline (to confirm numerically):
  famC := innerMul(slotA 1)(slotB 1)  (family generator, N288, in derH3)
  For Hermitian B:  [famC, Lmul(Dg t0 t1 t2)] B = Lmul( slotC( (t2-t1) . 1 ) ) B
  because  famC(Dg t) = innerMul(slotA 1)(slotB 1)(Dg t) = slotC((t2-t1).(star 1 * 1)) = slotC((t2-t1).1)
  (N274 innerMul_slot_diag with a=b=1) and N296 equivariance [T,Lmul A]B = Lmul(TA)B.

MEASURES:
 (1) famC(Dg t) = slotC((t2-t1).1)                    [the arena action, N274 instance]
 (2) [famC, Lmul(Dg t)] B = Lmul(slotC((t2-t1).1)) B  on B=1 and random Hermitian B
 (3) [famC, Lmul 1] B = 0  (dilation = universal mass = family singlet, FIXED)
 (4) famC(slotA a) = -slotB a ; famC(slotC c) = ?     [the full L0 rotation cycle]
 (5) the weight coefficient is (t2 - t1), the A2 family root functional (N275).
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True, precision=6, linewidth=200)

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
Tt=np.zeros((8,8,8))
Sst=np.zeros((8,8))
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
def Lmul(Cm): return lambda X: jb_mat(Cm,X)
def innerMul(A,B): return lambda X: jb_mat(A, jb_mat(B,X)) - jb_mat(B, jb_mat(A,X))

def one_oct(): 
    v=np.zeros(8); v[0]=1.0; return v
def Dg(t0,t1,t2):
    M=zero_mat(); M[0,0]=t0*I8[0]; M[1,1]=t1*I8[0]; M[2,2]=t2*I8[0]; return M
def slotA(a):
    M=zero_mat(); M[0,1]=a; M[1,0]=ostar(a); return M
def slotB(b):
    M=zero_mat(); M[0,2]=b; M[2,0]=ostar(b); return M
def slotC(c):
    M=zero_mat(); M[1,2]=c; M[2,1]=ostar(c); return M
ID3=zero_mat(); ID3[0,0]=I8[0]; ID3[1,1]=I8[0]; ID3[2,2]=I8[0]

rng=np.random.default_rng(11)
def herm_rand():
    M=zero_mat()
    for i in range(3): M[i,i]=rng.standard_normal()*I8[0]
    for (i,j) in [(0,1),(0,2),(1,2)]:
        a=rng.standard_normal(8); M[i,j]=a; M[j,i]=ostar(a)
    return M

famC = innerMul(slotA(one_oct()), slotB(one_oct()))

def nrm(M): return float(np.abs(M).max())

# (1) famC(Dg t) = slotC((t2-t1).1)
t0,t1,t2 = 2.0,-3.0,5.0
lhs1 = famC(Dg(t0,t1,t2))
rhs1 = slotC((t2-t1)*one_oct())
print("(1) famC(Dg t) = slotC((t2-t1).1)     resid=%.2e" % nrm(lhs1-rhs1))

# (2) [famC, Lmul(Dg t)] B = Lmul(slotC((t2-t1).1)) B
def comm_op(T, LA):   # (T*LA - LA*T) applied
    return lambda X: T(LA(X)) - LA(T(X))
LDg = Lmul(Dg(t0,t1,t2))
LHS = comm_op(famC, LDg)
RHS = Lmul(slotC((t2-t1)*one_oct()))
for label,B in [("B=1",ID3),("B=rand herm",herm_rand())]:
    print("(2) [famC,Lmul(Dg t)]B = Lmul(slotC((t2-t1)1))B  %-12s resid=%.2e" % (label, nrm(LHS(B)-RHS(B))))

# (3) [famC, Lmul 1] B = 0  (dilation fixed)
L1 = Lmul(ID3)
C3 = comm_op(famC, L1)
for label,B in [("B=1",ID3),("B=rand herm",herm_rand())]:
    print("(3) [famC,Lmul 1]B = 0            %-12s resid=%.2e" % (label, nrm(C3(B))))

# (4) famC(slotA a) = -slotB a ; famC(slotC c) = ?
a = rng.standard_normal(8)
print("(4a) famC(slotA a) = -slotB a          resid=%.2e" % nrm(famC(slotA(a)) - slotB(-a)))
c = rng.standard_normal(8)
fc = famC(slotC(c))
# compare to candidate images: slotA, slotB, Dg-diagonal
print("(4b) famC(slotC c):  max|.|=%.3f   is it diagonal? offdiag_norm=%.2e  diag_norm=%.2e"
      % (nrm(fc),
         float(np.abs(np.array([fc[0,1],fc[0,2],fc[1,2],fc[1,0],fc[2,0],fc[2,1]])).max()),
         float(np.abs(np.array([fc[0,0],fc[1,1],fc[2,2]])).max())))
# is famC(slotC c) a diagonal? check equals Dg of something
if float(np.abs(np.array([fc[0,1],fc[0,2],fc[1,2]])).max())<1e-9:
    print("     famC(slotC c) diag entries re:", fc[0,0,0], fc[1,1,0], fc[2,2,0])

# (5) traceless t: weight (t2-t1); confirm A2 root sum-zero of the three legs via cyclic
#     famA(Dg t)=slotA((t?-t?)1) etc — record the three coefficients
famA = innerMul(slotB(one_oct()), slotC(one_oct()))
famB = innerMul(slotC(one_oct()), slotA(one_oct()))
tt = (2.0,-3.0,5.0)
fa = famA(Dg(*tt)); fb = famB(Dg(*tt)); fcm = famC(Dg(*tt))
print("(5) family gens on Dg t: famC->slotC coeff=%.2f (t2-t1=%.2f)" % (fcm[1,2,0], tt[2]-tt[1]))
print("    famA->slotA coeff=%.2f   famB->slotB coeff=%.2f" % (fa[0,1,0], fb[0,2,0]))
print("    (record the three root functionals for the A2 identification)")
