#!/usr/bin/env python3
"""
N257 SELECT probe — the FULL neutral-sector geometry over the derived O ℚ = CD(H ℚ).

Objects (all banked):
  T3     = imRep DI          (isospin Cartan, in adjoint-14 = g₂)
  Q      = crossOp u1        (colour u(1), fundamental-7, u1 = colour-fixed axis)
  Y      = crossOp (κO 1)    (isospin-commuting u(1), fundamental-7, κO 1 = isospin-fixed axis)

Questions (to select the sharpest FORCED, convention-free, words-removable next node):
  1. crossEmb is an isometry(up to scale): does the trace-form geometry of {Q,Y} MIRROR the ImO
     geometry of {u1, κO 1}? (B(Q,Y) ∝ gForm(u1,κO1); |Q|²=|Y|² since |u1|=|κO1|=1)
  2. The Gram matrix of {T3, Q, Y} in the so(7) trace form B(A,C)=tr(A∘C).
  3. Commutators: which of {T3,Q,Y} commute? (probe said [T3,Q]=0, [T3,Y]=0, [Q,Y]≠0)
  4. The electroweak Cartan span{T3,Y} extends to rank-3 Cartan. Is there a natural third element?
  5. Is chargeOp = crossOp u1 (the colour u(1)) expressible via T3 and Y and a 3rd Cartan elt?
  6. GEOMETRIC mixing angle candidates that are CONVENTION-FREE (ratios in the unique so(7) form).
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
u1=(hI,h_zero)               # e1 direction (colour-fixed axis)
kap1=basis(4)                # κO 1 = e4 direction (isospin-fixed axis)
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
def iszero(A): return all(all(x==0 for x in r) for r in A)
def tr(A): return sum(A[i][i] for i in range(7))
def B(A,C): return tr(matmul(A,C))
def ad_H(P,a): return h_add(h_mul(P,a),h_neg(h_mul(a,P)))
def innerDeriv(P,x):
    a,b=x; return (ad_H(P,a),ad_H(P,b))

Q  = mat(lambda x: octCrossO(u1,x))
Yh = mat(lambda x: octCrossO(kap1,x))
DI = mat(lambda x:innerDeriv(hI,x))
DJ = mat(lambda x:innerDeriv(hJ,x))
DK = mat(lambda x:innerDeriv(hK,x))
T3 = DI

# 1. crossEmb isometry mirror
print("=== 1. crossEmb geometry mirrors ImO geometry of {u1, κO 1} ===")
print("  gForm(u1,u1) =",gForm(u1,u1),"  gForm(kap1,kap1) =",gForm(kap1,kap1),"  gForm(u1,kap1) =",gForm(u1,kap1))
print("  B(Q,Q) =",B(Q,Q),"  B(Yh,Yh) =",B(Yh,Yh),"  B(Q,Yh) =",B(Q,Yh))
print("  => |Q|²=|Y|² (both crossOp of unit vec), Q⟂Y (u1⟂κO1). ratio B(Q,Q)/gForm(u1,u1) =",F(B(Q,Q),gForm(u1,u1)))

# 2. Gram matrix of {T3, Q, Y}
print("\n=== 2. Gram matrix of {T3, Q, Y} in so(7) trace form ===")
ops={'T3':T3,'Q':Q,'Y':Yh}
for n1 in ('T3','Q','Y'):
    print("  ",[f"B({n1},{n2})={B(ops[n1],ops[n2])}" for n2 in ('T3','Q','Y')])

# 3. commutators
print("\n=== 3. commutators ===")
print("  [T3,Q]=0:",iszero(comm(T3,Q)),"  [T3,Y]=0:",iszero(comm(T3,Yh)),"  [Q,Y]=0:",iszero(comm(Q,Yh)))

# 4. rank-3 Cartan containing T3, Y; find third
pairs=[(a,b) for a in range(7) for b in range(a+1,7)]
def Xab(a,b):
    M=[[F(0)]*7 for _ in range(7)]; M[a][b]=F(1); M[b][a]=F(-1); return M
basisSO7=[Xab(a,b) for (a,b) in pairs]
def flat(A): return [A[i][j] for i in range(7) for j in range(7)]
def nullspace(M):
    M=[row[:] for row in M]; nr=len(M); nc=len(M[0]) if M else 0
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
        for ri,pc in enumerate(pivots): vec[pc]=-M[ri][fc]
        basis.append(vec)
    return basis
def combo(coeffs):
    R=[[F(0)]*7 for _ in range(7)]
    for k,c in enumerate(coeffs):
        if c!=0:
            for i in range(7):
                for j in range(7): R[i][j]+=c*basisSO7[k][i][j]
    return R
# centralizer of {T3, Y} in so(7)
cols=[]
for k in range(21):
    v=[]
    for G in (T3,Yh): v+=flat(comm(basisSO7[k],G))
    cols.append(v)
M=[[cols[k][r] for k in range(21)] for r in range(len(cols[0]))]
nb=nullspace(M)
print("\n=== 4. centralizer(rank-3 Cartan) of {T3, Y} dim =",len(nb),"===")
cartan=[combo(v) for v in nb]

# 5. Is Q in span of the Cartan? Is chargeOp = a·T3+b·Y+c·(third)?
def solve_span(target, gens):
    tv=flat(target); gv=[flat(g) for g in gens]; ncol=len(gens)
    A=[[gv[j][r] for j in range(ncol)]+[tv[r]] for r in range(len(tv))]
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
    for i in range(nr):
        if all(A[i][c]==0 for c in range(nc)) and A[i][nc]!=0: return None
    # extract
    A2=[[gv[j][rr] for j in range(ncol)]+[tv[rr]] for rr in range(len(tv))]
    r=0; pivots=[]
    for c in range(nc):
        piv=next((i for i in range(r,nr) if A2[i][c]!=0),None)
        if piv is None: continue
        A2[r],A2[piv]=A2[piv],A2[r]; pv=A2[r][c]; A2[r]=[x/pv for x in A2[r]]
        for i in range(nr):
            if i!=r and A2[i][c]!=0:
                f=A2[i][c]; A2[i]=[A2[i][j]-f*A2[r][j] for j in range(nc+1)]
        pivots.append(c); r+=1
        if r==nr: break
    sol=[F(0)]*nc
    for ri,pc in enumerate(pivots): sol[pc]=A2[ri][nc]
    return sol
print("  Q in span(Cartan{T3,Y,...})?",solve_span(Q,cartan))
print("  Q in span{T3,Y}?",solve_span(Q,[T3,Yh]))

# 6. The Gram of {T3, Y} and the geometric angle. Convention-free ratios.
print("\n=== 6. neutral-sector convention-free ratios ===")
print("  B(T3,T3)=",B(T3,T3),"  B(Y,Y)=",B(Yh,Yh),"  B(T3,Y)=",B(T3,Yh))
print("  |Y|²:|T3|² =",F(B(Yh,Yh),B(T3,T3)))
print("  |Q|²:|T3|² =",F(B(Q,Q),B(T3,T3)),"(N253's 3:8)")
# candidate geometric mixing: sin² = |Y|²/(|Y|²+|T3|²) and variants
bYY,bTT=B(Yh,Yh),B(T3,T3)
print("  |Y|²/(|Y|²+|T3|²) =",F(bYY,bYY+bTT))
print("  |T3|²/(|Y|²+|T3|²) =",F(bTT,bYY+bTT))
print("  |Q|²/(|Q|²+|T3|²) =",F(B(Q,Q),B(Q,Q)+bTT))
