"""
N298 MEASURE-FIRST. Route-finder (W1 step 2): the abstract "derH3 kills jTr" is CIRCULAR from
the predicate (skewness <=> trace-killing, neither follows from Leibniz alone). The FORCED,
theory-native lever is the INVARIANCE / ASSOCIATIVITY of the derived Cartan-Killing trace form,
which rests on the octonion reQ-trace CYCLICITY (reQ_mul_comm) + reQ-trace ASSOCIATIVITY
(reQ_mul_assoc3). From it, the inner derivations innerMul = [Lmul A, Lmul B] (the f4-generators)
KILL the linear trace jTr.

MEASURE (exact + numeric):
 (1) reQ-trace CYCLICITY:  reQ(trace(X*Y)) = reQ(trace(Y*X))  for octonion matrices.
 (2) reQ-trace ASSOCIATIVITY: reQ(trace((X*Y)*Z)) = reQ(trace(X*(Y*Z))).
 (3) TRACE-FORM INVARIANCE (in reQ): reQ(trace(jb(jb A B) C)) = reQ(trace(jb A (jb B C))),
     i.e. jTraceForm(jb A B, C) = jTraceForm(A, jb B C) in reQ.
 (4) FULL (not reQ) trace-form assoc: does trace(jb(jb A B)C) = trace(jb A (jb B C)) hold as a
     FULL octonion equality, or only in reQ?  (Determines whether we need Hermitian reality.)
 (5) innerMul KILLS jTr via invariance: jTr(innerMul A B M) = jTraceForm(A, jb B M) -
     jTraceForm(B, jb A M) = jTraceForm(jb A B, M) - jTraceForm(jb B A, M) = 0  (jb symmetric).
     Measure jTr(innerMul A B M) for GENERAL args (reQ) and for HERMITIAN args (full).
 (6) For Hermitian A, T=innerMul: is jTr(T A) fully REAL (so reQ=0 => full=0)?
 (7) The false route reconfirm: innerMul A B M != [[A,B],M] (residual big) -- non-assoc.
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
def jb_mat(A,B): return mat_mul(A,B)+mat_mul(B,A)
def jTr(M): return M[0,0]+M[1,1]+M[2,2]         # octonion trace (8-vector)
def reQ(o): return o[0]                          # real part
def reQtr(M): return reQ(jTr(M))
def jTF(A,B): return jTr(jb_mat(A,B))            # trace form (octonion)

# ---- random general octonion 3x3 matrix and Hermitian one ----
rng=np.random.default_rng(7)
def rand_full():
    M=zero_mat()
    for i in range(3):
        for j in range(3): M[i,j]=rng.standard_normal(8)
    return M
def rand_herm():
    M=zero_mat()
    for i in range(3): M[i,i]=rng.standard_normal(1)[0]*I8[0]   # real diagonal
    for (i,j) in [(0,1),(0,2),(1,2)]:
        a=rng.standard_normal(8); M[i,j]=a; M[j,i]=ostar(a)
    return M

print("=== (1) reQ-trace CYCLICITY: reQ tr(X*Y) = reQ tr(Y*X) ===")
mx=0.0
for _ in range(40):
    X=rand_full(); Y=rand_full()
    mx=max(mx, abs(reQtr(mat_mul(X,Y))-reQtr(mat_mul(Y,X))))
print("  max |reQtr(XY)-reQtr(YX)| =",mx,"(~0 => reQ-trace is cyclic)")

print("\n=== (2) reQ-trace ASSOCIATIVITY: reQ tr((X*Y)*Z) = reQ tr(X*(Y*Z)) ===")
mx=0.0
for _ in range(40):
    X=rand_full(); Y=rand_full(); Z=rand_full()
    mx=max(mx, abs(reQtr(mat_mul(mat_mul(X,Y),Z))-reQtr(mat_mul(X,mat_mul(Y,Z)))))
print("  max |reQtr((XY)Z)-reQtr(X(YZ))| =",mx,"(~0 => reQ-trace triple is associative)")

print("\n=== (3) TRACE-FORM INVARIANCE (reQ): reQ tr(jb(jb A B)C) = reQ tr(jb A (jb B C)) ===")
mx=0.0
for _ in range(40):
    A=rand_full(); B=rand_full(); Cm=rand_full()
    mx=max(mx, abs(reQtr(jb_mat(jb_mat(A,B),Cm))-reQtr(jb_mat(A,jb_mat(B,Cm)))))
print("  max |reQ jTF(jb A B,C) - reQ jTF(A,jb B C)| =",mx,"(~0 => trace form is invariant/associative in reQ)")

print("\n=== (4) FULL trace-form assoc: trace(jb(jb A B)C)=trace(jb A(jb B C)) as FULL octonion? ===")
mxfull=0.0
for _ in range(40):
    A=rand_full(); B=rand_full(); Cm=rand_full()
    d=jTr(jb_mat(jb_mat(A,B),Cm))-jTr(jb_mat(A,jb_mat(B,Cm)))
    mxfull=max(mxfull, np.max(np.abs(d)))
print("  max ||full diff|| =",mxfull,"(if >>0 => only reQ holds, need Hermitian reality for full)")

print("\n=== (5) innerMul KILLS jTr via invariance ===")
# general args (reQ)
mxg=0.0
for _ in range(40):
    A=rand_full(); B=rand_full(); M=rand_full()
    im=jb_mat(A,jb_mat(B,M))-jb_mat(B,jb_mat(A,M))
    mxg=max(mxg, abs(reQtr(im)))
print("  general args: max |reQ jTr(innerMul A B M)| =",mxg,"(~0)")
# Hermitian args (full)
mxh=0.0; mximag=0.0
for _ in range(40):
    A=rand_herm(); B=rand_herm(); M=rand_herm()
    im=jb_mat(A,jb_mat(B,M))-jb_mat(B,jb_mat(A,M))
    t=jTr(im)
    mxh=max(mxh, np.max(np.abs(t)))          # full octonion trace
    mximag=max(mximag, np.max(np.abs(t[1:]))) # imaginary part
print("  Hermitian args: max ||full jTr(innerMul A B M)|| =",mxh,"(~0 => kills jTr fully)")
print("  Hermitian args: max ||imag part of jTr|| =",mximag,"(~0 => jTr already real, reQ=0 suffices)")

print("\n=== (6) reality: for Hermitian A and T=innerMul(H,H), is T A Hermitian => jTr real? ===")
A=rand_herm(); B1=rand_herm(); B2=rand_herm()
TA=jb_mat(B1,jb_mat(B2,A))-jb_mat(B2,jb_mat(B1,A))
# check Hermitian: TA[j,i] == star(TA[i,j])
mxherm=0.0
for i in range(3):
    for j in range(3):
        mxherm=max(mxherm, np.max(np.abs(TA[j,i]-ostar(TA[i,j]))))
print("  max ||TA[j,i]-star(TA[i,j])|| =",mxherm,"(~0 => T A Hermitian => diagonal real => jTr real)")

print("\n=== (7) false route reconfirm: innerMul A B M vs [[A,B],M] (associative commutator) ===")
mxc=0.0
for _ in range(20):
    A=rand_herm(); B=rand_herm(); M=rand_herm()
    im=jb_mat(A,jb_mat(B,M))-jb_mat(B,jb_mat(A,M))
    AB=mat_mul(A,B)-mat_mul(B,A); cc=mat_mul(AB,M)-mat_mul(M,AB)
    mxc=max(mxc, np.max(np.abs(im-cc)))
print("  max ||innerMul - [[A,B],M]|| =",mxc,"(>>0 => commutator route FALSE, confirming N297)")

print("\nDONE probe1")
