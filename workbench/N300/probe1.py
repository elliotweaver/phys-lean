"""
N300 MEASURE-FIRST. Confirm the STRUCTURAL decomposition of trace_H(Lmul C) = 18*rtr C.

Hand-derivation to verify:
  hermSub = diag(3) ⊕ slot01(8) ⊕ slot02(8) ⊕ slot12(8), dim 27.
  For C Hermitian with real diagonal (c0,c1,c2) and off-diag α@(0,1), β@(0,2), γ@(1,2):
  the OPERATOR TRACE of Lmul C : X ↦ CX + XC on the 27-dim Hermitian arena is a sum of
  DIAGONAL-BLOCK traces (off-blocks don't count):
    · diag→diag block  = diag(2c0, 2c1, 2c2)          trace = 2·rtr C
    · slot(i,j)→slot(i,j) block = (c_i+c_j)·id_8        trace = 8(c_i+c_j)   [SCALAR — only C's diag]
  Total = 2·rtr C + 8[(c0+c1)+(c0+c2)+(c1+c2)] = 2 + 16 = 18·rtr C.
  C's OFF-diagonal (α,β,γ) only appear in OFF-blocks (slot→other-slot, slot→diag) — trace 0.

MEASURES:
 (1) reconfirm trace_H(Lmul C) = 18·rtr C.
 (2) the diagonal-block trace = 2·rtr C exactly (independent of α,β,γ).
 (3) each slot-diagonal-block π_k∘Lmul C∘ι_k = (c_i+c_j)·id_8 EXACTLY (scalar, no octonion table).
 (4) trace independent of C's off-diagonal (α,β,γ): set them to random, trace unchanged.
 (5) full-arena V (dim 72): trace_V(Lmul C) = 48·rtr C (the left+right-mult lever, for the record).
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True, precision=6, linewidth=200)

# ---- octonion (Cayley-Dickson) machinery (float; exact structure is integer-valued) ----
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
def jTr(M): return M[0,0]+M[1,1]+M[2,2]
def reQ(o): return o[0]
def rtr(M): return reQ(jTr(M))
def Lmul(Cm): return lambda X: jb_mat(Cm,X)

rng=np.random.default_rng(7)
def real_diag(c): 
    M=zero_mat(); M[0,0]=c[0]*I8[0]; M[1,1]=c[1]*I8[0]; M[2,2]=c[2]*I8[0]; return M
def herm_C(c, off=True):
    M=real_diag(c)
    if off:
        for (i,j) in [(0,1),(0,2),(1,2)]:
            a=rng.standard_normal(8); M[i,j]=a; M[j,i]=ostar(a)
    return M

# ---- 27-dim Hermitian basis adapted to diag ⊕ slot01 ⊕ slot02 ⊕ slot12 ----
herm_basis=[]
for i in range(3):
    B=zero_mat(); B[i,i]=I8[0]; herm_basis.append(B)      # 3 diagonal
offpos=[(0,1),(0,2),(1,2)]
for (i,j) in offpos:
    for m in range(8):
        B=zero_mat(); B[i,j]=I8[m]; B[j,i]=ostar(I8[m]); herm_basis.append(B)  # 24 off-diag
NB=len(herm_basis)
def herm_ip(X,Y):    # Frobenius real inner product = Σ_ij X_ij·Y_ij (Re(star a b)=a·b)
    return sum(float(np.dot(X[i,j],Y[i,j])) for i in range(3) for j in range(3))
gram=np.array([[herm_ip(a,b) for b in herm_basis] for a in herm_basis])
graminv=np.linalg.inv(gram)
def op_matrix_on_herm(op):
    cols=[]
    for b in herm_basis:
        v=op(b); proj=np.array([herm_ip(a,v) for a in herm_basis]); cols.append(graminv@proj)
    return np.array(cols).T   # M[a,b]: op(basis_b)=Σ_a M[a,b] basis_a
def op_trace_on_herm(op):
    M=op_matrix_on_herm(op); return np.trace(M), M

print("=== (0) sanity: NB, gram invertible ===")
print("  NB =",NB," (expect 27)   gram det =",np.linalg.det(gram))

print("\n=== (1) trace_H(Lmul C) = 18·rtr C ? ===")
for _ in range(5):
    c=rng.standard_normal(3); Cm=herm_C(c,off=True)
    tr,_=op_trace_on_herm(Lmul(Cm))
    print(f"  c={np.round(c,3)}  tr_H={tr:.6f}  18·rtr={18*rtr(Cm):.6f}  ratio={tr/rtr(Cm):.6f}")

print("\n=== (2) diagonal-block trace = 2·rtr C (first 3 diag entries of M) ===")
c=rng.standard_normal(3); Cm=herm_C(c,off=True)
_,M=op_trace_on_herm(Lmul(Cm))
print("  M[0,0],M[1,1],M[2,2] =",np.round([M[0,0],M[1,1],M[2,2]],4),"  expect 2c =",np.round(2*c,4))
print("  diag-block trace =",round(M[0,0]+M[1,1]+M[2,2],6),"  2·rtr C =",round(2*rtr(Cm),6))

print("\n=== (3) slot-diagonal-block = (c_i+c_j)·id_8 (block M-entries for each slot) ===")
# slot01 basis indices 3..10, slot02 11..18, slot12 19..26
slots={'01':(3,11,c[0]+c[1]),'02':(11,19,c[0]+c[2]),'12':(19,27,c[1]+c[2])}
for name,(lo,hi,expect) in slots.items():
    blk=M[lo:hi,lo:hi]
    offdiag=blk-np.diag(np.diag(blk))
    print(f"  slot{name}: diag(block)={np.round(np.diag(blk),4)}  expect {expect:.4f}  "
          f"max|offdiag in-block|={np.max(np.abs(offdiag)):.2e}  trace={np.trace(blk):.4f} (expect {8*expect:.4f})")

print("\n=== (4) trace independent of C's off-diagonal (α,β,γ) ===")
c=rng.standard_normal(3)
tr_off,_=op_trace_on_herm(Lmul(herm_C(c,off=True)))
tr_no ,_=op_trace_on_herm(Lmul(herm_C(c,off=False)))
print(f"  tr(with off-diag)={tr_off:.6f}   tr(diag-only C)={tr_no:.6f}   both 18·rtr={18*rtr(real_diag(c)):.6f}")

print("\n=== (5) full-arena V (dim 72): trace_V(Lmul C) = 48·rtr C ===")
# basis of V: e_m at (i,j) for all i,j,m (72 elements), Frobenius orthonormal
Vbasis=[]
for i in range(3):
    for j in range(3):
        for m in range(8):
            B=zero_mat(); B[i,j]=I8[m]; Vbasis.append(B)
def vip(X,Y): return sum(float(np.dot(X[i,j],Y[i,j])) for i in range(3) for j in range(3))
def op_trace_V(op):
    s=0.0
    for b in Vbasis:  # orthonormal, so trace = Σ <b, op b>
        s+=vip(b,op(b))
    return s
c=rng.standard_normal(3); Cm=herm_C(c,off=True)
print(f"  trace_V(Lmul C)={op_trace_V(Lmul(Cm)):.6f}   48·rtr C={48*rtr(Cm):.6f}")

print("\nDONE probe1")
