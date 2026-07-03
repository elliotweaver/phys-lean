#!/usr/bin/env python3
"""
N255 SELECT probe 2 — the FULL centralizer of weak isospin su(2)_L in the gather so(7),
and the joint (Q,T3) weight structure of the fundamental 7.

so(7) w.r.t. gForm: in the imaginary-unit basis e1..e7, gForm(ei,ej)=delta_ij (positive definite),
so so(7) = ordinary ANTISYMMETRIC 7x7 matrices. Centralizer of {DI,DJ,DK} = antisym X with
[X,DI]=[X,DJ]=[X,DK]=0. Solve the linear system; report dim + a basis + whether Q, T3 lie in it.
"""
from fractions import Fraction as F
def dbl_mul(z,w): return (z[0]*w[0]-z[1]*w[1], z[0]*w[1]+z[1]*w[0])
def dbl_star(z): return (z[0],-z[1])
def dbl_add(z,w): return (z[0]+w[0], z[1]+w[1])
def dbl_neg(z): return (-z[0],-z[1])
DZ=(F(0),F(0))
def make_CD(mul,star,add,neg,zero):
    def cd_mul(z,w):
        zr,zi=z; wr,wi=w
        return (add(mul(zr,wr),neg(mul(star(wi),zi))), add(mul(wi,zr),mul(zi,star(wr))))
    def cd_star(z): return (star(z[0]),neg(z[1]))
    def cd_add(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
    def cd_neg(z): return (neg(z[0]),neg(z[1]))
    return cd_mul,cd_star,cd_add,cd_neg,(zero,zero)
h_mul,h_star,h_add,h_neg,h_zero=make_CD(dbl_mul,dbl_star,dbl_add,dbl_neg,DZ)
o_mul,o_star,o_add,o_neg,o_zero=make_CD(h_mul,h_star,h_add,h_neg,h_zero)
def o_from_vec(v):
    def dbl(b): return (v[b+0],v[b+1])
    def h(b): return (dbl(b+0),dbl(b+2))
    return (h(0),h(4))
def o_to_vec(z):
    v=[None]*8
    for oi in (0,1):
        H=z[oi]
        for hi in (0,1):
            D=H[hi]
            for di in (0,1): v[oi*4+hi*2+di]=D[di]
    return v
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return o_from_vec(v)
E=[basis(i) for i in range(8)]
ImO=list(range(1,8))
hI=((F(0),F(1)),(F(0),F(0))); hJ=((F(0),F(0)),(F(1),F(0))); hK=h_mul(hI,hJ)
u1=(hI,h_zero)
def reQ(z): return o_to_vec(z)[0]
def gForm(x,y): return reQ(o_mul(x,o_star(y)))
def octCrossO(a,b): return o_add(o_mul(a,b), o_from_vec([gForm(a,b)]+[F(0)]*7))
def mat(op):
    A=[[F(0)]*7 for _ in range(7)]
    for jc,j in enumerate(ImO):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(ImO): A[ic][jc]=out[i]
    return A
def matmul(A,B): return [[sum(A[r][t]*B[t][c] for t in range(len(B))) for c in range(len(B[0]))] for r in range(len(A))]
def sub(A,B): return [[A[r][c]-B[r][c] for c in range(len(A[0]))] for r in range(len(A))]
def comm(A,B): return sub(matmul(A,B),matmul(B,A))
def ad_H(P,a): return h_add(h_mul(P,a),h_neg(h_mul(a,P)))
def innerDeriv(P,x):
    a,b=x; return (ad_H(P,a),ad_H(P,b))
chargeM=mat(lambda x: octCrossO(u1,x))
DI=mat(lambda x:innerDeriv(hI,x)); DJ=mat(lambda x:innerDeriv(hJ,x)); DK=mat(lambda x:innerDeriv(hK,x))

# verify DI,DJ,DK antisymmetric and chargeM antisymmetric in e-basis
def is_antisym(A): return all(A[i][j]==-A[j][i] for i in range(7) for j in range(7))
print("antisym: DI",is_antisym(DI),"DJ",is_antisym(DJ),"DK",is_antisym(DK),"Q",is_antisym(chargeM))

# antisymmetric basis of so(7): X_{ab} = E_ab - E_ba for a<b  (21 of them)
pairs=[(a,b) for a in range(7) for b in range(a+1,7)]
def Xab(a,b):
    M=[[F(0)]*7 for _ in range(7)]; M[a][b]=F(1); M[b][a]=F(-1); return M
basisSO7=[Xab(a,b) for (a,b) in pairs]

# unknown X = sum c_k basisSO7[k]; impose [X,DI]=[X,DJ]=[X,DK]=0 -> linear in c
# build rows: for each generator G in {DI,DJ,DK}, [basisSO7[k],G] flattened gives columns
def flat(A): return [A[i][j] for i in range(7) for j in range(7)]
cols=[]
for k in range(21):
    v=[]
    for G in (DI,DJ,DK):
        v+=flat(comm(basisSO7[k],G))
    cols.append(v)
# solve for null space of the matrix whose columns are cols (dim 21 unknowns, rows=3*49=147)
nrows=len(cols[0]); ncols=21
# Build matrix M[r][k]=cols[k][r]
M=[[cols[k][r] for k in range(ncols)] for r in range(nrows)]
# gaussian elimination to find rank and nullspace dimension
def nullspace(M):
    M=[row[:] for row in M]; nr=len(M); nc=len(M[0])
    pivots=[]; r=0
    for c in range(nc):
        piv=next((i for i in range(r,nr) if M[i][c]!=0),None)
        if piv is None: continue
        M[r],M[piv]=M[piv],M[r]; pv=M[r][c]; M[r]=[x/pv for x in M[r]]
        for i in range(nr):
            if i!=r and M[i][c]!=0:
                f=M[i][c]; M[i]=[M[i][j]-f*M[r][j] for j in range(nc)]
        pivots.append(c); r+=1
        if r==nr: break
    free=[c for c in range(nc) if c not in pivots]
    basis=[]
    for fc in free:
        vec=[F(0)]*nc; vec[fc]=F(1)
        for ri,pc in enumerate(pivots):
            vec[pc]=-M[ri][fc]
        basis.append(vec)
    return basis,pivots,free
nb,piv,free=nullspace(M)
print(f"\nCENTRALIZER of su(2)_L={{DI,DJ,DK}} in so(7): dim = {len(nb)}")
# express each null vector as a 7x7 matrix
def combo(coeffs):
    R=[[F(0)]*7 for _ in range(7)]
    for k,c in enumerate(coeffs):
        if c!=0:
            for i in range(7):
                for j in range(7): R[i][j]+=c*basisSO7[k][i][j]
    return R
cent=[combo(v) for v in nb]
# Is Q in the centralizer span? Is T3=DI? check by solving linear membership
def in_span(target, gens):
    # solve sum a_i gens_i = target
    rows=[]; 
    tv=flat(target)
    gv=[flat(g) for g in gens]
    # least squares over Q: set up augmented and gaussian
    ncol=len(gens)
    A=[[gv[j][r] for j in range(ncol)]+[tv[r]] for r in range(len(tv))]
    # gaussian
    r=0; nr=len(A); nc=ncol
    for c in range(nc):
        piv=next((i for i in range(r,nr) if A[i][c]!=0),None)
        if piv is None: continue
        A[r],A[piv]=A[piv],A[r]; pv=A[r][c]; A[r]=[x/pv for x in A[r]]
        for i in range(nr):
            if i!=r and A[i][c]!=0:
                f=A[i][c]; A[i]=[A[i][j]-f*A[r][j] for j in range(nc+1)]
        r+=1
        if r==nr: break
    # check consistency
    for i in range(nr):
        if all(A[i][c]==0 for c in range(nc)) and A[i][nc]!=0: return False
    return True
print("  Q (chargeOp) in centralizer of su(2)_L?", in_span(chargeM,cent), "  (physics: NO — Q doesn't commute with T1,T2)")
print("  DI (T3) in centralizer of su(2)_L?", in_span(DI,cent), "  (physics: NO — T3 doesn't commute with T1,T2)")

# The centralizer of su(2)_L: what is it? Print its dimension and check if it contains colour-like elements.
# Also: centralizer of the full weak isospin should be the 'neutral under weak' subalgebra.
# Compare: centralizer of ONLY DI (the Cartan) in so(7):
cols1=[]
for k in range(21):
    cols1.append(flat(comm(basisSO7[k],DI)))
M1=[[cols1[k][r] for k in range(21)] for r in range(49)]
nb1,_,_=nullspace(M1)
print(f"\nFor contrast: centralizer of ONLY DI (the isospin Cartan) in so(7): dim = {len(nb1)}")
print("  Q in centralizer of DI alone?", in_span(chargeM,[combo(v) for v in nb1]))

# ---- joint (Q,T3) weight structure: common invariant 2-planes ----
print("\n=== joint (Q,T3) weight structure of the 7 (both commute) ===")
Q2=matmul(chargeM,chargeM)
def diag(A): return [A[i][i] for i in range(7)]
# The commuting skew pair block-diagonalizes. Q^2 = -I on the 6 charged dims, 0 on 1.
# T3^2 = -4 on 4 dims, 0 on 3. joint: read the (q^2,t3^2) pair per common eigen-plane by
# looking at where DI acts (rows) vs Q. Simplest: report the multiset of (Q^2 diag, T3^2 diag)
# is not basis-invariant; instead compute rank of Q on ker(T3) and vice versa.
def rank(A):
    M=[row[:] for row in A]; n=len(M);m=len(M[0]);r=0
    for c in range(m):
        piv=next((i for i in range(r,n) if M[i][c]!=0),None)
        if piv is None: continue
        M[r],M[piv]=M[piv],M[r]; pv=M[r][c]; M[r]=[x/pv for x in M[r]]
        for i in range(n):
            if i!=r and M[i][c]!=0:
                f=M[i][c]; M[i]=[M[i][j]-f*M[r][j] for j in range(m)]
        r+=1
    return r
def kernel_basis(A):
    nb,_,_=nullspace([[A[i][j] for j in range(7)] for i in range(7)])
    return nb
kerT3=kernel_basis(DI)   # dim should be 3
kerQ=kernel_basis(chargeM) # dim 1
print("  dim ker T3 =",len(kerT3),"  dim ker Q =",len(kerQ))
# Q restricted to ker T3: does Q preserve ker T3 (it commutes with T3 so yes) and what's its rank there?
# build projector onto ker T3 span and restrict Q
# Simpler: Q maps ker T3 -> ker T3 (commute). rank of Q on ker(T3):
# assemble ker T3 as columns, compute Q*basis, express back — just get rank of [Q applied to kerT3 vectors]
def apply(A,v): return [sum(A[i][j]*v[j] for j in range(7)) for i in range(7)]
imgs=[apply(chargeM,v) for v in kerT3]
# rank of these images within R^7
Mi=[[imgs[j][i] for j in range(len(imgs))] for i in range(7)]
print("  rank of Q restricted to ker(T3) (dim3, the isospin-neutral space):", rank(Mi))
print("   -> isospin-neutral space splits under Q into charged+neutral: this is the misalignment (N254) as a weight count")
