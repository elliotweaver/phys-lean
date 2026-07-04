"""
N290 SELECT — the FAMILY-INVARIANT (joint kernel of famA,famB,famC) of the arena J3(O),
and the full family-so(3) module decomposition. The family analogue of the banked
gauge-neutral-core nodes (N252/N266/N271: joint kernels of the gauge).
"""
from fractions import Fraction as F
import itertools
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
Hl=make_level(*C); Ol=make_level(*Hl)
O_mul,O_star,O_add,O_sub=Ol
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def unflat(v):
    a,b,c,d,e,f,g,h=v; return (((a,b),(c,d)),((e,f),(g,h)))
ZERO=unflat([F(0)]*8); ONE=unflat([F(1)]+[F(0)]*7)
def mget(M,i,j): return M.get((i,j),ZERO)
def mmul(A,B):
    R={}
    for i in range(3):
        for j in range(3):
            acc=ZERO
            for k in range(3): acc=O_add(acc,O_mul(mget(A,i,k),mget(B,k,j)))
            R[(i,j)]=acc
    return R
def madd(A,B): return {(i,j):O_add(mget(A,i,j),mget(B,i,j)) for i in range(3) for j in range(3)}
def msub(A,B): return {(i,j):O_sub(mget(A,i,j),mget(B,i,j)) for i in range(3) for j in range(3)}
def jprod(A,B): return madd(mmul(A,B),mmul(B,A))
def slot(i,j,x): return {(i,j):x,(j,i):O_star(x)}
def osc(z,r): return z*r if isinstance(z,F) else (osc(z[0],r),osc(z[1],r))
def Dg(d0,d1,d2): return {(0,0):osc(ONE,d0),(1,1):osc(ONE,d1),(2,2):osc(ONE,d2)}
sA1=slot(0,1,ONE); sB1=slot(0,2,ONE); sC1=slot(1,2,ONE)
def FC(X): return msub(jprod(sA1,jprod(sB1,X)),jprod(sB1,jprod(sA1,X)))
def FA(X): return msub(jprod(sB1,jprod(sC1,X)),jprod(sC1,jprod(sB1,X)))
def FB(X): return msub(jprod(sC1,jprod(sA1,X)),jprod(sA1,jprod(sC1,X)))

# ---- 27-dim basis of the Hermitian arena J3(O): 3 diagonal (real) + 3 slots x 8 octonion units ----
def ebasis(k):
    v=[F(0)]*8; v[k]=F(1); return unflat(v)
BASIS=[]  # each is (kind, data) with a matrix
def diagM(i):
    M={}; M[(i,i)]=ONE; return M
for i in range(3): BASIS.append(("Dg%d"%i, diagM(i)))
for (i,j,nm) in [(0,1,"A"),(0,2,"B"),(1,2,"C")]:
    for k in range(8):
        BASIS.append(("slot%s_e%d"%(nm,k), slot(i,j,ebasis(k))))
N=len(BASIS)
assert N==27, N

def vecify(M):
    # flatten a Hermitian matrix into its 27 real coords in the BASIS ordering
    out=[]
    # diagonal reals
    for i in range(3): out.append(flat(mget(M,i,i))[0])
    for (i,j) in [(0,1),(0,2),(1,2)]:
        out.extend(flat(mget(M,i,j)))
    return out  # length 3+24=27

# sanity: reconstruct is linear; build matrices of FA,FB,FC in this basis
def opmatrix(op):
    cols=[]
    for (_,M) in BASIS:
        cols.append(vecify(op(M)))
    # cols[c] = image of basis c ; matrix acting on coord vectors: rows=27, so M[r][c]
    return cols  # list of 27 columns each len 27

import numpy as np
def to_np(cols):
    A=np.zeros((27,27))
    for c,col in enumerate(cols):
        for r,val in enumerate(col):
            A[r,c]=float(val)
    return A
MA=to_np(opmatrix(FA)); MB=to_np(opmatrix(FB)); MC=to_np(opmatrix(FC))

print("=== family-so(3) generator matrices in the 27-dim arena basis ===")
print("rank FA,FB,FC:", np.linalg.matrix_rank(MA), np.linalg.matrix_rank(MB), np.linalg.matrix_rank(MC))

# JOINT KERNEL = family-invariant subspace
Stack=np.vstack([MA,MB,MC])
# nullspace of Stack
u,s,vh=np.linalg.svd(Stack)
tol=1e-9
null_mask = s < tol
# vh rows corresponding to small singular values are the nullspace basis (right-singular vectors)
ns_dim = 27 - np.sum(s>tol)
print("dim JOINT KERNEL (family-invariant subspace of the 27-dim arena):", ns_dim)
# extract nullspace vectors
V=vh[np.sum(s>tol):]  # (ns_dim, 27)
for row in V:
    # round
    r=np.round(row,4)
    nz={i:r[i] for i in range(27) if abs(r[i])>1e-4}
    labels={i:BASIS[i][0] for i in nz}
    print("   invariant vec (nonzero coords):", {labels[i]:float(nz[i]) for i in nz})

print()
print("=== The family Casimir eigenstructure on the 27-dim arena ===")
Cas = MA@MA + MB@MB + MC@MC
ev=np.linalg.eigvals(Cas)
ev=sorted(np.round(ev.real,4))
from collections import Counter
print("Casimir eigenvalues (with multiplicity):", dict(Counter(ev)))
# so(3) Casimir eigenvalue on spin-j is -j(j+1)*(2)^2 scale; multiplicities give the irreps
