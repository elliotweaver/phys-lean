#!/usr/bin/env python3
"""
N255 SELECT probe 4 — HONESTY grounding. Does the forced Y (centralizer of su(2)_L) ALSO commute
with colour su(3)? What is the joint centralizer of BOTH colour and isospin? And the su(2)_L
branching of the 7 (to understand the uniqueness route for Lean).
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
def iszero(A): return all(all(x==0 for x in r) for r in A)
def ad_H(P,a): return h_add(h_mul(P,a),h_neg(h_mul(a,P)))
def innerDeriv(P,x):
    a,b=x; return (ad_H(P,a),ad_H(P,b))
chargeM=mat(lambda x: octCrossO(u1,x))
DI=mat(lambda x:innerDeriv(hI,x)); DJ=mat(lambda x:innerDeriv(hJ,x)); DK=mat(lambda x:innerDeriv(hK,x))

# derivations of O: g2 has dim 14. Build a spanning set of Der(O) via all innerDeriv on ImH basis
# and all the other families to get colour = stabilizer of u1 within g2.
# Simplest: colour su(3) = {D in g2 : D u1 = 0}. Build g2 numerically as antisym X with X being a derivation.
pairs=[(a,b) for a in range(7) for b in range(a+1,7)]
def Xab(a,b):
    M=[[F(0)]*7 for _ in range(7)]; M[a][b]=F(1); M[b][a]=F(-1); return M
basisSO7=[Xab(a,b) for (a,b) in pairs]
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
    free=[c for c in range(nc) if c not in pivots]
    out=[]
    for fc in free:
        vec=[F(0)]*nc; vec[fc]=F(1)
        for ri,pc in enumerate(pivots): vec[pc]=-M[ri][fc]
        out.append(vec)
    return out
def combo(coeffs):
    R=[[F(0)]*7 for _ in range(7)]
    for k,c in enumerate(coeffs):
        if c!=0:
            for i in range(7):
                for j in range(7): R[i][j]+=c*basisSO7[k][i][j]
    return R

# g2 = derivations = antisym X such that X is a derivation of O. Impose Leibniz on basis:
# X(e_i * e_j) = X e_i * e_j + e_i * X e_j  for the 8-dim algebra. Build as linear constraints on the 21 coeffs.
# Represent X action on ImO; extend to O by X(1)=0 (derivations kill identity).
def Xact_on_O(Xcoeff, z):  # z in O; X acts as 0 on real part, as the antisym matrix on ImO
    v=o_to_vec(z); im=[v[i] for i in range(1,8)]
    Xim=[sum(Xcoeff[i][j]*im[j] for j in range(7)) for i in range(7)]
    out=[F(0)]+Xim
    return o_from_vec(out)
# derivation constraints
rows=[]
for k in range(21):
    Xc=basisSO7[k]
    r=[]
    for i in range(8):
        for j in range(8):
            lhs=Xact_on_O(Xc,o_mul(E8:=basis(i) if False else None, None)) if False else None
    # do it directly below
# simpler: build constraint matrix
def deriv_defect(Xc):
    d=[]
    B8=[basis(i) for i in range(8)]
    for i in range(8):
        for j in range(8):
            lhs=Xact_on_O(Xc,o_mul(B8[i],B8[j]))
            rhs=o_add(o_mul(Xact_on_O(Xc,B8[i]),B8[j]), o_mul(B8[i],Xact_on_O(Xc,B8[j])))
            d+=o_to_vec(o_add(lhs,o_neg(rhs)))
    return d
Cmat=[deriv_defect(basisSO7[k]) for k in range(21)]  # each is a long vector, linear in coeff k
nr=len(Cmat[0])
Msys=[[Cmat[k][r] for k in range(21)] for r in range(nr)]
g2basis=nullspace(Msys)
print("dim Der(O) (g2) =",len(g2basis))
g2=[combo(v) for v in g2basis]
# colour = {D in g2 : D u1 = 0}. u1 = e1 => D e1 = 0 => first column zero. impose on g2 span
def apply(A,vidx):  # A times unit e_{vidx+1} (ImO index vidx) -> column vidx
    return [A[i][vidx] for i in range(7)]
# u1=e1 -> ImO index 0
colour_constraints=[]
# express D = sum a_m g2[m]; D e1 = 0 is 7 equations linear in a
G=len(g2)
Msys2=[[g2[m][i][0] for m in range(G)] for i in range(7)]  # column 0 (=action on e1) must vanish
colour_coeffs=nullspace(Msys2)
colour=[]
for cc in colour_coeffs:
    R=[[F(0)]*7 for _ in range(7)]
    for m,a in enumerate(cc):
        if a!=0:
            for i in range(7):
                for j in range(7): R[i][j]+=a*g2[m][i][j]
    colour.append(R)
print("dim colour (stab u1 in g2) =",len(colour)," (expect 8)")

# forced Y = centralizer of su(2)_L in so(7)
cols=[]
for k in range(21):
    v=[]
    for Gn in (DI,DJ,DK): v+=flat(comm(basisSO7[k],Gn))
    cols.append(v)
Msys3=[[cols[k][r] for k in range(21)] for r in range(len(cols[0]))]
Ynb=nullspace(Msys3); Y=combo(Ynb[0])
print("\ndim centralizer(su(2)_L) in so(7) =",len(Ynb))
# does Y commute with all colour?
print("Y commutes with ALL colour su(3)?", all(iszero(comm(Y,C)) for C in colour))
print("  per-colour commute flags (first 8):",[iszero(comm(Y,C)) for C in colour][:8])
# does chargeOp commute with all colour? (yes, N245) and with su(2)_L? (no)
print("chargeOp commutes with ALL colour?", all(iszero(comm(chargeM,C)) for C in colour))
print("chargeOp commutes with su(2)_L (DI,DJ,DK)?", iszero(comm(chargeM,DI)),iszero(comm(chargeM,DJ)),iszero(comm(chargeM,DK)))

# JOINT centralizer of BOTH colour su(3) AND isospin su(2)_L:
gens_all=[DI,DJ,DK]+colour
cols4=[]
for k in range(21):
    v=[]
    for Gn in gens_all: v+=flat(comm(basisSO7[k],Gn))
    cols4.append(v)
Msys4=[[cols4[k][r] for k in range(21)] for r in range(len(cols4[0]))]
joint=nullspace(Msys4)
print("\ndim JOINT centralizer of (colour su(3) + isospin su(2)_L) in so(7) =",len(joint))

# su(2)_L Casimir decomposition of the 7 (understand branching for uniqueness route)
Cas=matmul(DI,DI)
Cas=[[Cas[i][j]+matmul(DJ,DJ)[i][j]+matmul(DK,DK)[i][j] for j in range(7)] for i in range(7)]
def diag(A): return [A[i][i] for i in range(7)]
# Casimir eigenvalues: for spin-s, C = -4 s(s+1) in this normalization (DI has ±2 eigenvalues)
# just report the characteristic: distinct eigenvalues via minimal polynomial-ish (diagonal if diagonalized)
print("\nsu(2)_L Casimir (DI^2+DJ^2+DK^2) diagonal:",[str(x) for x in diag(Cas)])
# eigen multiplicities via rank of (Cas - lambda I) for candidate lambda in {0,-8,-16,-32}
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
def II(): return [[F(1) if i==j else F(0) for j in range(7)] for i in range(7)]
for lam in [F(0),F(-8),F(-16),F(-32),F(-4),F(-12)]:
    A=[[Cas[i][j]-(lam if i==j else F(0)) for j in range(7)] for i in range(7)]
    mult=7-rank(A)
    if mult>0: print(f"   Casimir eigenvalue {lam}: multiplicity {mult}")
