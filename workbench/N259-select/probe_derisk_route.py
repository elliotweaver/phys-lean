#!/usr/bin/env python3
"""N259 SELECT probe 4 — DE-RISK the exact proof route for  chargeColourLie ∩ electroweakLie = span{T3}.
Verify each sub-fact the Lean proof needs (all at derivation / End level, NO octonion coordinate bash):
 (F1) ⊇: imRep DI in both (DI in colourCentralizer via [DI,Q]=0; DI in isospinSpan trivial).
 (F2) 7-part reduction: Q, Y linearly independent in the 7 (N257 orthogonality + nonzero).
 (F3) at the derivation level, colourCentralizer ∩ isospinSpan = span{DI}:
        an isospin element a·DI+b·DJ+c·DK commutes with Q  ⟺  b=c=0.
        Needs: [DI,Q]=0 and {[DJ,Q],[DK,Q]} linearly independent (7x7 matrices).
 (F4) imRepL injective => colourImg ∩ isospinImg = imRepL(colourCentralizer ∩ isospinSpan).
Reuse model.
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
def matmul(A,B): return [[sum(A[r][t]*B[t][c] for t in range(7)) for c in range(7)] for r in range(7)]
def subm(A,B): return [[A[r][c]-B[r][c] for c in range(7)] for r in range(7)]
def scal(c,A): return [[c*A[r][cc] for cc in range(7)] for r in range(7)]
def comm(A,B): return subm(matmul(A,B),matmul(B,A))
def iszero(A): return all(all(x==0 for x in r) for r in A)
def flat(A): return [A[i][j] for i in range(7) for j in range(7)]
Q  = mat(lambda x: octCrossO(u1,x))
Yh = mat(lambda x: octCrossO(kap1,x))
def innerD(P): return mat(lambda x,P=P:(h_add(h_mul(P,x[0]),h_neg(h_mul(x[0],P))),h_add(h_mul(P,x[1]),h_neg(h_mul(x[1],P)))))
DI=innerD(hI); DJ=innerD(hJ); DK=innerD(hK)
def rank_of(mats):
    rows=[flat(m)[:] for m in mats]; nr=len(rows); nc=49; rank=0
    for c in range(nc):
        piv=next((i for i in range(rank,nr) if rows[i][c]!=0),None)
        if piv is None: continue
        rows[rank],rows[piv]=rows[piv],rows[rank]; pv=rows[rank][c]
        rows[rank]=[x/pv for x in rows[rank]]
        for i in range(nr):
            if i!=rank and rows[i][c]!=0:
                f=rows[i][c]; rows[i]=[rows[i][j]-f*rows[rank][j] for j in range(nc)]
        rank+=1
        if rank==nr: break
    return rank

print("=== (F1) ⊇ : imRep DI in both factors ===")
print("[DI,Q]==0 (DI in colourCentralizer):", iszero(comm(DI,Q)))
print("DI is an isospin generator (in isospinSpan): True by construction")

print("\n=== (F2) Q, Y linearly independent in the 7 ===")
print("dim span{Q,Y} =", rank_of([Q,Yh]), "(2 => independent)")
print("B(Q,Y)=tr(QY)=", sum(matmul(Q,Yh)[i][i] for i in range(7)), " (N257: 0 => orthogonal, and both nonzero)")

print("\n=== (F3) colourCentralizer ∩ isospinSpan = span{DI} at the DERIVATION level ===")
print("[DI,Q]==0:", iszero(comm(DI,Q)))
print("[DJ,Q]==0:", iszero(comm(DJ,Q)), "  [DK,Q]==0:", iszero(comm(DK,Q)))
print("dim span{[DJ,Q],[DK,Q]} =", rank_of([comm(DJ,Q),comm(DK,Q)]), " (2 => independent => b=c=0 forced)")
# explicit: a DI + b DJ + c DK commutes with Q  <=>  b[DJ,Q]+c[DK,Q]=0  <=> b=c=0 (indep). a free.
print("check: for random a,b,c, [aDI+bDJ+cDK, Q]=0 forces b=c=0:")
import itertools
ok=True
for a,b,c in itertools.product([F(0),F(1),F(2),F(-1)],repeat=3):
    M=[[a*DI[i][j]+b*DJ[i][j]+c*DK[i][j] for j in range(7)] for i in range(7)]
    commutes=iszero(comm(M,Q))
    if commutes and (b!=0 or c!=0): ok=False; print("   COUNTEREXAMPLE",a,b,c)
print("   no counterexample (commutes => b=c=0):", ok)

print("\n=== (F4) imRepL injective on isospinSpan (DI,DJ,DK independent as End) ===")
print("dim span{DI,DJ,DK} =", rank_of([DI,DJ,DK]), "(3 => imRepL injective on the isospin span)")

print("\n=== HEADLINE re-confirm: chargeColour ∩ electroweak = span{DI}, dim 1 ===")
# already confirmed in probe_intersection; restate the reduced form:
print("intersection reduces to colourImg∩isospinImg (7-parts vanish since Q⟂Y indep),")
print("= imRepL(colourCentralizer∩isospinSpan) = imRepL(span{DI}) = span{imRep DI}. dim 1. QED route clean.")

print("\n=== BONUS: the one-cause u1. DI(u1)=0 => [DI, crossOp u1]=crossOp(DI u1)=0. ===")
DIu1 = innerD(hI)  # DI as map; apply to u1=hI as octonion:
# DI(u1): innerD(hI) applied to u1=(hI,h_zero). commutator hI*hI - hI*hI = 0.
val = (h_add(h_mul(hI,u1[0]),h_neg(h_mul(u1[0],hI))), h_add(h_mul(hI,u1[1]),h_neg(h_mul(u1[1],hI))))
print("DI(u1) = [hI,u1] as octonion =", o_to_vec((val[0],val[1])), " (all zero => DI annihilates u1)")
