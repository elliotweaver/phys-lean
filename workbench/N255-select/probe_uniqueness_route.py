#!/usr/bin/env python3
"""
N255 SELECT probe 6 — confirm the UNIQUENESS route structure:
centralizer(su2L) in so(7) = [Z_{g2}(su2L) in the 14] (+) [Fix_{su2L}(7) in the 7].
Need: (a) Z_{g2}(su2L) = 0 ; (b) Fix_{su2L}(7) = span{kappaO 1} (dim 1). Then total = 1, = span{crossOp u2}.
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
hI=((F(0),F(1)),(F(0),F(0))); hJ=((F(0),F(0)),(F(1),F(0))); hK=h_mul(hI,hJ)
def ad_H(P,a): return h_add(h_mul(P,a),h_neg(h_mul(a,P)))
def innerDeriv(P,x):
    a,b=x; return (ad_H(P,a),ad_H(P,b))
def matO(op):
    A=[[F(0)]*7 for _ in range(7)]
    for jc,j in enumerate(range(1,8)):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(range(1,8)): A[ic][jc]=out[i]
    return A
DI=matO(lambda x:innerDeriv(hI,x)); DJ=matO(lambda x:innerDeriv(hJ,x)); DK=matO(lambda x:innerDeriv(hK,x))
def matmul(A,B): return [[sum(A[r][t]*B[t][c] for t in range(len(B))) for c in range(len(B[0]))] for r in range(len(A))]
def sub(A,B): return [[A[r][c]-B[r][c] for c in range(len(A[0]))] for r in range(len(A))]
def comm(A,B): return sub(matmul(A,B),matmul(B,A))
def flat(A): return [A[i][j] for i in range(7) for j in range(7)]
def nullspace(M):
    M=[row[:] for row in M]; nr=len(M); nc=len(M[0]); pivots=[]; r=0
    for c in range(nc):
        piv=next((i for i in range(r,nr) if M[i][c]!=0),None)
        if piv is None: continue
        M[r],M[piv]=M[piv],M[r]; pv=M[r][c]; M[r]=[x/pv for x in M[r]]
        for i in range(nr):
            if i!=r and M[i][c]!=0:
                f=M[i][c]; M[i]=[M[i][j]-f*M[r][j] for j in range(nc)]
        pivots.append(c); r+=1
        if r==nr: break
    free=[c for c in range(nc) if c not in pivots]; out=[]
    for fc in free:
        vec=[F(0)]*nc; vec[fc]=F(1)
        for ri,pc in enumerate(pivots): vec[pc]=-M[ri][fc]
        out.append(vec)
    return out

# (b) Fix_{su2L}(7): vectors v in R^7 with DI v = DJ v = DK v = 0
rowsF=[]
for G in (DI,DJ,DK):
    for i in range(7): rowsF.append(G[i])
Fix=nullspace(rowsF)
print("Fix_{su2L}(7) = ker(DI)∩ker(DJ)∩ker(DK): dim =",len(Fix))
for v in Fix: print("  fixed vector (e1..e7):",[str(x) for x in v]," -> this is e4 = kappaO 1 (the diagonal singlet)")

# (a) Z_{g2}(su2L): build g2, then centralizer of su2L within it
pairs=[(a,b) for a in range(7) for b in range(a+1,7)]
def Xab(a,b):
    M=[[F(0)]*7 for _ in range(7)]; M[a][b]=F(1); M[b][a]=F(-1); return M
basisSO7=[Xab(a,b) for (a,b) in pairs]
def combo(coeffs):
    R=[[F(0)]*7 for _ in range(7)]
    for k,c in enumerate(coeffs):
        if c!=0:
            for i in range(7):
                for j in range(7): R[i][j]+=c*basisSO7[k][i][j]
    return R
def Xact_on_O(Xc, z):
    v=o_to_vec(z); im=[v[i] for i in range(1,8)]
    Xim=[sum(Xc[i][j]*im[j] for j in range(7)) for i in range(7)]
    return o_from_vec([F(0)]+Xim)
def deriv_defect(Xc):
    d=[]; B8=[basis(i) for i in range(8)]
    for i in range(8):
        for j in range(8):
            lhs=Xact_on_O(Xc,o_mul(B8[i],B8[j]))
            rhs=o_add(o_mul(Xact_on_O(Xc,B8[i]),B8[j]), o_mul(B8[i],Xact_on_O(Xc,B8[j])))
            d+=o_to_vec(o_add(lhs,o_neg(rhs)))
    return d
Cmat=[deriv_defect(basisSO7[k]) for k in range(21)]
Msys_g2=[[Cmat[k][r] for k in range(21)] for r in range(len(Cmat[0]))]
g2basis=[combo(v) for v in nullspace(Msys_g2)]
print("\ndim g2 =",len(g2basis))
# Z_{g2}(su2L): D = sum a_m g2basis[m], impose [D,DI]=[D,DJ]=[D,DK]=0
G=len(g2basis)
rowsZ=[]
for Gn in (DI,DJ,DK):
    for r in range(49):
        rowsZ.append([comm(g2basis[m],Gn)[r//7][r%7] for m in range(G)])
Znull=nullspace(rowsZ)
print("Z_{g2}(su2L) = centralizer of weak isospin INSIDE g2: dim =",len(Znull))
print("\n=> centralizer(su2L) in so(7) = Z_g2 (14-part, dim %d) (+) crossOp(Fix) (7-part, dim %d) = %d"%(len(Znull),len(Fix),len(Znull)+len(Fix)))
print("   The unique hypercharge = crossOp(kappaO 1) = crossOp u2. Route: 14-part vanishes, 7-part=singlet=1.")
