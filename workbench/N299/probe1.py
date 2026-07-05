"""
N299 MEASURE-FIRST. Route-finder (W1 step 2): does "derH3 kills jTr" (the full abstract
predicate) follow from the banked structure WITHOUT the heavy Chevalley-Schafer innerness
theorem Der(H3O)=InnDer?

THE CANDIDATE REFRAME (operator-trace dissolution):
  N296 banked  [T, Lmul A] B = Lmul(T A) B  for T in derH3, Hermitian A,B (equivariance).
  The OPERATOR TRACE over the 27-dim Hermitian arena of a COMMUTATOR vanishes (Mathlib:
  LinearMap.trace of X*Y - Y*X = 0). So
      tr_Herm(Lmul(T A)) = tr_Herm([T, Lmul A]) = 0.
  IF  tr_Herm(Lmul C) = k * rtr(C)  with k != 0, then rtr(T A) = 0 for ALL T in derH3,
  WITHOUT proving innerness.  (rtr = reQ . jTr, the deep-real trace.)

MEASURES:
 (1) reconfirm equivariance  [T, Lmul A] B = Lmul(T A) B  for T=famC (in derH3), Herm A,B.
 (2) tr_Herm(Lmul C): build a Q-basis of the 27-dim Hermitian arena, compute the operator
     trace of Lmul C in it; check tr_Herm(Lmul C) = k * rtr(C). FIND k.  (crucial: k != 0.)
 (3) tr_Herm([T, Lmul A]) = 0 directly (operator trace of the commutator over Herm), and
     rtr(T A) = 0 for T=famC and random Hermitian A (the full-predicate target on generators).
 (4) skewness <=> target circularity reconfirm (N298 diagnosis): jTr(T A) is jTraceForm-skew.
 (5) the innerness-span ALTERNATIVE: does span{innerMul(b_i,b_j)} over a Herm basis EQUAL
     derH3 (dim 52)?  (measures whether the ticket's route is a clean spanning argument.)
 (6) does tr_Herm(Lmul .) as a FUNCTIONAL equal the FULL octonion jTr composed with reQ, i.e.
     is the operator trace literally 3*rtr? (the diagonal count).  Determines the exact k.
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True, precision=4, linewidth=200)

# ---- octonion (Cayley-Dickson) exact machinery ----
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
def mat_add(A,B): return A+B
def jb_mat(A,B): return mat_mul(A,B)+mat_mul(B,A)
def jTr(M): return M[0,0]+M[1,1]+M[2,2]
def reQ(o): return o[0]
def rtr(M): return reQ(jTr(M))            # deep-real trace
def Lmul(C): return lambda X: jb_mat(C,X)

rng=np.random.default_rng(11)
def rand_full():
    M=zero_mat()
    for i in range(3):
        for j in range(3): M[i,j]=rng.standard_normal(8)
    return M
def rand_herm():
    M=zero_mat()
    for i in range(3): M[i,i]=rng.standard_normal(1)[0]*I8[0]
    for (i,j) in [(0,1),(0,2),(1,2)]:
        a=rng.standard_normal(8); M[i,j]=a; M[j,i]=ostar(a)
    return M

# ---- the 27-dim Hermitian arena Q-basis + real inner product ----
# diagonal: E_ii real (3);  off-diag: for p in {(0,1),(0,2),(1,2)} and m in 0..7:
#   e_m at p, star(e_m) at p^T  (24).  Total 27.
herm_basis=[]
for i in range(3):
    B=zero_mat(); B[i,i]=I8[0]; herm_basis.append(B)
offpos=[(0,1),(0,2),(1,2)]
for (i,j) in offpos:
    for m in range(8):
        B=zero_mat(); B[i,j]=I8[m]; B[j,i]=ostar(I8[m]); herm_basis.append(B)
NB=len(herm_basis)
def herm_ip(X,Y):   # real inner product <X,Y> = sum_ij Re(star(X_ij) Y_ij)
    s=0.0
    for i in range(3):
        for j in range(3): s+=float(np.dot(ostar(X[i,j]),Y[i,j]))  # Re(star a . b)=a.b
    return s
# note Re(star(a)*b) = sum_k a_k b_k = dot(a,b); so herm_ip = Frobenius real dot.
def herm_ip2(X,Y):
    return sum(float(np.dot(X[i,j],Y[i,j])) for i in range(3) for j in range(3))
gram=np.array([[herm_ip2(a,b) for b in herm_basis] for a in herm_basis])
graminv=np.linalg.inv(gram)

def op_trace_on_herm(op):
    # trace of linear op restricted to Herm, in the herm_basis (using dual via gram inverse)
    # matrix M[a,b] s.t. op(basis_b) = sum_a M[a,b] basis_a ; trace = sum_a M[a,a]
    # coords of v in basis: c = graminv @ (<basis_a, v>)_a
    cols=[]
    for b in herm_basis:
        v=op(b)
        proj=np.array([herm_ip2(a,v) for a in herm_basis])
        c=graminv@proj
        cols.append(c)
    M=np.array(cols).T   # M[a,b]
    return np.trace(M), M

print("=== (0) sanity: herm_basis size, gram invertible ===")
print("  NB =",NB,"  (expect 27)   gram det =",np.linalg.det(gram))

print("\n=== (2) tr_Herm(Lmul C) = k * rtr(C) ?  find k ===")
ratios=[]
for _ in range(8):
    Cm=rand_herm()
    tr,_=op_trace_on_herm(Lmul(Cm))
    r=rtr(Cm)
    if abs(r)>1e-9:
        ratios.append(tr/r)
print("  tr_Herm(Lmul C)/rtr(C) samples:", [round(x,6) for x in ratios])
print("  => k ~", round(np.mean(ratios),6) if ratios else "n/a")
# also test on basis elements
print("  on diagonal basis E_00: tr_Herm(Lmul E00)=",round(op_trace_on_herm(Lmul(herm_basis[0]))[0],6),
      " rtr(E00)=",rtr(herm_basis[0]))

print("\n=== (6) does Lmul C act on Herm with tr = k*rtr including on GENERAL (non-herm real-trace) C? ===")
# Lmul must map Herm->Herm only for Hermitian C; test C=slotA-like off-diagonal (traceless) too
for name,Cm in [("herm-random",rand_herm())]:
    tr,_=op_trace_on_herm(Lmul(Cm))
    print(f"  {name}: tr_Herm(Lmul C)={round(tr,6)}  k*rtr(C) with k=6 ->",round(6*rtr(Cm),6))

# ---- concrete famC = innerMul(slotA 1, slotB 1) in derH3 ----
u1=I8[1]  # the fold root (0,1,0,...) as octonion imaginary unit e_1
def slotA(a):
    M=zero_mat(); M[0,1]=a; M[1,0]=ostar(a); return M
def slotB(b):
    M=zero_mat(); M[0,2]=b; M[2,0]=ostar(b); return M
def slotC(c):
    M=zero_mat(); M[1,2]=c; M[2,1]=ostar(c); return M
one=I8[0]
def innerMul(A,B): return lambda X: jb_mat(A,jb_mat(B,X))-jb_mat(B,jb_mat(A,X))
famC=innerMul(slotA(one),slotB(one))

print("\n=== (1) reconfirm equivariance [T,Lmul A]B = Lmul(T A)B for T=famC, Herm A,B ===")
mx=0.0
for _ in range(20):
    A=rand_herm(); Bm=rand_herm()
    lhs=famC(jb_mat(A,Bm))-jb_mat(A,famC(Bm))       # [T,Lmul A]B = T(A*B+B*A) - (A*(TB)+ (TB)*A)... careful
    # [T, Lmul A] B = T(Lmul A B) - Lmul A (T B) = T(jb A B) - jb A (T B)
    lhs=famC(jb_mat(A,Bm))-jb_mat(A,famC(Bm))
    TA=famC(A)
    rhs=jb_mat(TA,Bm)
    mx=max(mx,np.max(np.abs(lhs-rhs)))
print("  max ||[T,Lmul A]B - Lmul(T A)B|| =",mx,"(~0 => equivariance reconfirmed)")

print("\n=== (3) tr_Herm([T,Lmul A])=0 and rtr(T A)=0 for T=famC, random Herm A ===")
mxop=0.0; mxrtr=0.0
for _ in range(12):
    A=rand_herm()
    # operator [T, Lmul A] on Herm:
    def comm(X, A=A): return famC(jb_mat(A,X)) - jb_mat(A,famC(X))
    tr,_=op_trace_on_herm(comm)
    mxop=max(mxop,abs(tr))
    mxrtr=max(mxrtr,abs(rtr(famC(A))))
print("  max |tr_Herm([T,Lmul A])| =",mxop,"(~0 => commutator trace vanishes)")
print("  max |rtr(T A)| for T=famC =",mxrtr,"(~0 => generator kills the trace)")

print("\n=== (3b) does rtr(T A)=0 hold for ALL Herm A with T=famC?  (the full-predicate on a generator) ===")
# already measured above; also test with a random derH3 element = random combo of innerMul generators
gens=[innerMul(herm_basis[a],herm_basis[b]) for a in range(6) for b in range(a+1,6)]
coeffs=rng.standard_normal(len(gens))
def Trandom(X):
    acc=zero_mat()
    for c,g in zip(coeffs,gens): acc=acc+c*g(X)
    return acc
mxr=0.0
for _ in range(12):
    A=rand_herm(); mxr=max(mxr,abs(rtr(Trandom(A))))
print("  max |rtr(T A)| for random T in span{innerMul} =",mxr,"(~0 => holds on inner derivations)")

print("\n=== (4) skewness: jTraceForm(T A, B)+jTraceForm(A, T B) =? 0 for T=famC (invariance form) ===")
def jTF(A,B): return rtr(jb_mat(A,B))
mxsk=0.0
for _ in range(12):
    A=rand_herm(); Bm=rand_herm()
    mxsk=max(mxsk,abs(jTF(famC(A),Bm)+jTF(A,famC(Bm))))
print("  max |jTF(T A,B)+jTF(A,T B)| =",mxsk,"(~0 => T is trace-form-skew, consistent with N298)")

print("\n=== (5) innerness-span: rank of span{innerMul(b_i,b_j)} as operators on 27-dim Herm ===")
# build all innerMul(b_i,b_j) i<j over herm_basis, vectorize each as its 27x27 matrix on Herm
def op_matrix_on_herm(op):
    cols=[]
    for b in herm_basis:
        v=op(b); proj=np.array([herm_ip2(a,v) for a in herm_basis]); cols.append(graminv@proj)
    return np.array(cols).T.reshape(-1)
gen_ops=[]
for a in range(NB):
    for b in range(a+1,NB):
        gen_ops.append(op_matrix_on_herm(innerMul(herm_basis[a],herm_basis[b])))
Gmat=np.array(gen_ops)
rank=np.linalg.matrix_rank(Gmat,tol=1e-8)
print("  #innerMul generators:",len(gen_ops),"  rank of their span (as End Herm) =",rank,"(expect 52 = dim f4)")

print("\nDONE probe1")
