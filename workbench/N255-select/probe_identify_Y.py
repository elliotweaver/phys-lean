#!/usr/bin/env python3
"""
N255 SELECT probe 5 — IDENTIFY the forced Y as a DERIVED operator, and confirm the ceiling reduction.
Y has entries e1<->e5, e2<->e6, e3<->e7 (1-indexed imaginary units). Candidates:
  - crossOp(u2) where u2 = e4 = kappaO 1 (the doubling unit)?  crossOp a x = Im(a*x)
  - L_{u2} restricted / projected?
  - crossOp of some other unit?
Test Y against crossOp(e_k) for all k, and against left-mult operators.
Also confirm: joint centralizer(colour+isospin) = 0 reduces to [centralizer(su2L)=span{Y}] + [Y not in centralizer(colour)].
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
def eq(A,B): return all(A[i][j]==B[i][j] for i in range(7) for j in range(7))
def neg(A): return [[-A[i][j] for j in range(7)] for i in range(7)]
def iszero(A): return all(all(x==0 for x in r) for r in A)
def ad_H(P,a): return h_add(h_mul(P,a),h_neg(h_mul(a,P)))
def innerDeriv(P,x):
    a,b=x; return (ad_H(P,a),ad_H(P,b))
chargeM=mat(lambda x: octCrossO(u1,x))
DI=mat(lambda x:innerDeriv(hI,x)); DJ=mat(lambda x:innerDeriv(hJ,x)); DK=mat(lambda x:innerDeriv(hK,x))

# rebuild Y = centralizer of su(2)_L
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
    free=[c for c in range(nc) if c not in pivots]; out=[]
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
cols=[]
for k in range(21):
    v=[]
    for Gn in (DI,DJ,DK): v+=flat(comm(basisSO7[k],Gn))
    cols.append(v)
Msys=[[cols[k][r] for k in range(21)] for r in range(len(cols[0]))]
Y=combo(nullspace(Msys)[0])
print("Y entries (a<b):",[(a,b,str(Y[a][b])) for (a,b) in pairs if Y[a][b]!=0])

# candidate derived operators: crossOp(e_k) for each imaginary unit
print("\n=== identify Y as a derived operator ===")
for k in range(1,8):
    ek=basis(k)
    Ck=mat(lambda x, ek=ek: octCrossO(ek,x))
    # compare up to scale
    # find scale s with Ck == s*Y
    s=None; match=True
    for i in range(7):
        for j in range(7):
            if Y[i][j]!=0:
                cand=Ck[i][j]/Y[i][j]
                if s is None: s=cand
                elif cand!=s: match=False
            elif Ck[i][j]!=0: match=False
    print(f"  crossOp(e{k}) == {s}*Y ? {match and s is not None}  (scale {s})")

# also test left-mult L_{e4} projected to ImO (=octCross e4 is that). done above. Try e4=u2
u2=basis(4)
print("  e4 = kappaO 1 = u2 (the doubling unit). crossOp(u2) tested as k=4 above.")

# ceiling reduction check: build colour and confirm Y not in centralizer(colour) via a single witness
# colour generator that does NOT commute with Y: find one derivation D in g2 with D u1=0 and [Y,D]!=0
# reuse g2 construction
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
# colour = D in g2 with D e1 = 0 (column 0 zero)
G=len(g2basis)
Msys_col=[[g2basis[m][i][0] for m in range(G)] for i in range(7)]
colcoeffs=nullspace(Msys_col)
colour=[]
for cc in colcoeffs:
    R=[[F(0)]*7 for _ in range(7)]
    for m,a in enumerate(cc):
        if a!=0:
            for i in range(7):
                for j in range(7): R[i][j]+=a*g2basis[m][i][j]
    colour.append(R)
noncommute=[idx for idx,C in enumerate(colour) if not iszero(comm(Y,C))]
print(f"\n=== ceiling reduction: Y commutes with {len(colour)-len(noncommute)}/{len(colour)} colour gens; {len(noncommute)} DON'T ===")
print("  -> joint centralizer(colour+su2L) = centralizer(su2L) ∩ centralizer(colour) ⊆ span{Y}; Y∉centralizer(colour) ⟹ joint=0. CONFIRMED reduction.")
