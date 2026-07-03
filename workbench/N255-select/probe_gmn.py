#!/usr/bin/env python3
"""
N255 SELECT probe 3 — CHARACTERIZE the forced hypercharge Y (the 1-dim centralizer of su(2)_L in so(7)),
and test the Gell-Mann-Nishijima relation Q = a*T3 + b*Y (is chargeOp in span{DI, Y}? with what ratio?).

This is the crux for selection. If Y is forced (1-dim, DERIVED) and Q = a*DI + b*Y with a FORCED ratio,
that would DERIVE the structural form of Gell-Mann-Nishijima from the gather object. Honesty: the SCALE
of Y is free (normalization stays scoped out); but the DIRECTION of Y and the RATIO structure may be forced.
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
def addM(A,B): return [[A[r][c]+B[r][c] for c in range(len(A[0]))] for r in range(len(A))]
def comm(A,B): return sub(matmul(A,B),matmul(B,A))
def iszero(A): return all(all(x==0 for x in r) for r in A)
def ad_H(P,a): return h_add(h_mul(P,a),h_neg(h_mul(a,P)))
def innerDeriv(P,x):
    a,b=x; return (ad_H(P,a),ad_H(P,b))
chargeM=mat(lambda x: octCrossO(u1,x))
DI=mat(lambda x:innerDeriv(hI,x)); DJ=mat(lambda x:innerDeriv(hJ,x)); DK=mat(lambda x:innerDeriv(hK,x))

pairs=[(a,b) for a in range(7) for b in range(a+1,7)]
def Xab(a,b):
    M=[[F(0)]*7 for _ in range(7)]; M[a][b]=F(1); M[b][a]=F(-1); return M
basisSO7=[Xab(a,b) for (a,b) in pairs]
def flat(A): return [A[i][j] for i in range(7) for j in range(7)]
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
    return basis
def combo(coeffs):
    R=[[F(0)]*7 for _ in range(7)]
    for k,c in enumerate(coeffs):
        if c!=0:
            for i in range(7):
                for j in range(7): R[i][j]+=c*basisSO7[k][i][j]
    return R
# centralizer of su(2)_L
cols=[]
for k in range(21):
    v=[]
    for G in (DI,DJ,DK): v+=flat(comm(basisSO7[k],G))
    cols.append(v)
nrows=len(cols[0])
M=[[cols[k][r] for k in range(21)] for r in range(nrows)]
nb=nullspace(M)
assert len(nb)==1, f"expected 1-dim, got {len(nb)}"
Y=combo(nb[0])
print("=== THE FORCED HYPERCHARGE Y = unique(up-to-scale) so(7)-generator commuting with ALL su(2)_L ===")
print("Y as antisym 7x7 (rows, e1..e7):")
for row in Y: print("  ",[str(x) for x in row])
print("Y commutes with DI,DJ,DK:", iszero(comm(Y,DI)),iszero(comm(Y,DJ)),iszero(comm(Y,DK)))
print("rank(Y) =", 7-len(nullspace([[Y[i][j] for j in range(7)] for i in range(7)])))
Y2=matmul(Y,Y)
print("diag(Y^2):",[str(Y2[i][i]) for i in range(7)])

# Which e-planes does Y rotate? read nonzero (a,b)
print("Y nonzero entries (a<b):",[(a,b,str(Y[a][b])) for (a,b) in pairs if Y[a][b]!=0])
print("Q (chargeOp) nonzero entries (a<b):",[(a,b,str(chargeM[a][b])) for (a,b) in pairs if chargeM[a][b]!=0])
print("DI (T3) nonzero entries (a<b):",[(a,b,str(DI[a][b])) for (a,b) in pairs if DI[a][b]!=0])

# Do Q, DI, Y mutually commute?
print("\n[Q,DI]==0:",iszero(comm(chargeM,DI)),"  [Q,Y]==0:",iszero(comm(chargeM,Y)),"  [DI,Y]==0:",iszero(comm(DI,Y)))

# Is Q in span{DI, Y}?  (Gell-Mann-Nishijima structural test)
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
    # extract solution
    sol=[F(0)]*nc; r=0
    # re-run to read pivots
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
    for ri,pc in enumerate(pivots): sol[pc]=A2[ri][nc]
    return sol
sol=solve_span(chargeM,[DI,Y])
print("\n=== Gell-Mann-Nishijima structural test: Q in span{T3=DI, Y}? ===")
print("  Q = a*DI + b*Y  solution:", sol if sol else "NOT in span{DI,Y}")
# also try span{DI, Y, DJ, DK, ...}? no — physics: Q must be in span{T3, Y}
# Also test if Q in span{Y} alone, DI in span{Y} alone (should be no)
print("  Q in span{Y}?", solve_span(chargeM,[Y]))
print("  DI in span{Y}?", solve_span(DI,[Y]))

# What's the maximal torus containing DI? rank of so(7)=3. Y, DI, and one more commuting.
# Cartan = span of mutually commuting. Check dim of centralizer of {DI,Y} (the neutral torus).
cols2=[]
for k in range(21):
    v=[]
    for G in (DI,Y): v+=flat(comm(basisSO7[k],G))
    cols2.append(v)
M2=[[cols2[k][r] for k in range(21)] for r in range(len(cols2[0]))]
nb2=nullspace(M2)
print("\n  centralizer of {DI,Y} (the neutral torus) dim =",len(nb2))
print("  Q in that centralizer?", solve_span(chargeM,[combo(v) for v in nb2]) is not None)

# invariant length of Y in the fundamental-7 trace form B(A,C)=tr(A@C)  (N253 form)
def tr(A): return sum(A[i][i] for i in range(7))
BYY=tr(matmul(Y,Y)); BYT=tr(matmul(Y,DI)); BYQ=tr(matmul(Y,chargeM))
print("\n=== invariant lengths (N253 trace form) with the un-normalized Y just found ===")
print("  B(Y,Y)=",BYY,"  B(Y,DI)=",BYT,"  B(Y,Q)=",BYQ)
print("  (recall B(Q,Q)=-6, B(DI,DI)=-16 from N253)")
print("  B(Q,DI)=",tr(matmul(chargeM,DI)))
