#!/usr/bin/env python3
"""N257 SELECT probe 2 — [Q,Y] structure + the crossEmb isometry generality + what generates."""
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
u1=(hI,h_zero); kap1=basis(4)
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
def BB(A,C): return tr(matmul(A,C))
def ad_H(P,a): return h_add(h_mul(P,a),h_neg(h_mul(a,P)))
def innerDeriv(P,x):
    a,b=x; return (ad_H(P,a),ad_H(P,b))
Q  = mat(lambda x: octCrossO(u1,x))
Yh = mat(lambda x: octCrossO(kap1,x))
DI = mat(lambda x:innerDeriv(hI,x)); DJ=mat(lambda x:innerDeriv(hJ,x)); DK=mat(lambda x:innerDeriv(hK,x))

# --- [Q,Y]: is it a derivation (in g₂)? or in the fundamental 7? ---
QY=comm(Q,Yh)
print("[Q,Y] nonzero entries (a<b):",[(a,b,str(QY[a][b])) for a in range(7) for b in range(a+1,7) if QY[a][b]!=0])
print("[Q,Y] antisymmetric:",all(QY[i][j]==-QY[j][i] for i in range(7) for j in range(7)))
# is [Q,Y] a g₂ element (a derivation)? test: g₂ = span of DL basis. Simpler: is it in span of crossOp images (fund 7) or imRep images (adj 14)?
# crossOp image = {crossOp(e_i)}; imRep image = derivations. Build both spans, decompose.
crossB=[mat(lambda x,a=basis(i): octCrossO(a,x)) for i in range(1,8)]
def flat(A): return [A[i][j] for i in range(7) for j in range(7)]
# g₂ basis via inner derivations: 14-dim. Use DL from many P. Just test membership in crossOp-span first.
def in_span(target,gens):
    tv=flat(target); gv=[flat(g) for g in gens]; nc=len(gens)
    A=[[gv[j][r] for j in range(nc)]+[tv[r]] for r in range(len(tv))]
    r=0;nr=len(A)
    for c in range(nc):
        piv=next((i for i in range(r,nr) if A[i][c]!=0),None)
        if piv is None: continue
        A[r],A[piv]=A[piv],A[r];pv=A[r][c];A[r]=[x/pv for x in A[r]]
        for i in range(nr):
            if i!=r and A[i][c]!=0:
                f=A[i][c];A[i]=[A[i][j]-f*A[r][j] for j in range(nc+1)]
        r+=1
        if r==nr:break
    for i in range(nr):
        if all(A[i][c]==0 for c in range(nc)) and A[i][nc]!=0: return False
    return True
print("[Q,Y] in crossOp-span (fundamental 7)?", in_span(QY,crossB))
print("BB([Q,Y],[Q,Y]) =",BB(QY,QY))
# decompose so(7)=14+7: build 14 (derivations) via a spanning set of inner derivs
Ps=[hI,hJ,hK,((F(1),F(0)),(F(0),F(0)))]
# better: derivations D_{a,b} not needed; test if [Q,Y] commutes with what Q,Y do.
print("[Q,Y] commutes with DI?",iszero(comm(QY,DI)),"  with T3=DI already; [Q,Y] vs Q:",iszero(comm(QY,Q)),"  vs Y:",iszero(comm(QY,Yh)))

# --- isometry generality: B(crossOp a, crossOp b) == -6 gForm(a,b) for ALL basis pairs? ---
print("\n=== crossEmb scaled-isometry check over ALL ImO basis pairs ===")
ok=True
for i in range(1,8):
    for j in range(1,8):
        lhs=BB(mat(lambda x,a=basis(i):octCrossO(a,x)), mat(lambda x,b=basis(j):octCrossO(b,x)))
        rhs=-6*gForm(basis(i),basis(j))
        if lhs!=rhs: ok=False; print("  MISMATCH",i,j,lhs,rhs)
print("  B(crossOp e_i, crossOp e_j) == -6·gForm(e_i,e_j) for ALL i,j in 1..7:",ok)

# --- also: B(imRep D, imRep D') proportional to Killing/derivation form? and B(14,7)=0 always? ---
print("\n=== 14 ⟂ 7 (adjoint vs fundamental summand) trace-orthogonality ===")
allcross=[mat(lambda x,a=basis(i):octCrossO(a,x)) for i in range(1,8)]
o14=all(BB(D,C)==0 for D in (DI,DJ,DK) for C in allcross)
print("  B(imRep D{I,J,K}, crossOp e_j) == 0 for all j:",o14)
