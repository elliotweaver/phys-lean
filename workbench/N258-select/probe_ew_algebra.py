#!/usr/bin/env python3
"""N258 SELECT probe 2 — verify the electroweak reductive Lie algebra su(2)_L + u(1)_Y structure.
Confirm: su(2)_L closes at dim 3 & is simple; Y not in su2L (dim 4); Y central ideal;
derived subalgebra = su2L; all generators skew-adjoint wrt Born form gForm on ImO."""
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
def sub(A,B): return [[A[r][c]-B[r][c] for c in range(7)] for r in range(7)]
def scal(c,A): return [[c*A[r][cc] for cc in range(7)] for r in range(7)]
def comm(A,B): return sub(matmul(A,B),matmul(B,A))
def iszero(A): return all(all(x==0 for x in r) for r in A)
def eq(A,B): return iszero(sub(A,B))
def tr(A): return sum(A[i][i] for i in range(7))
def BB(A,C): return tr(matmul(A,C))
def flat(A): return [A[i][j] for i in range(7) for j in range(7)]
def transpose(A): return [[A[j][i] for j in range(7)] for i in range(7)]
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

print("=== su(2)_L structure ===")
print("[DI,DJ] =? 2*DK :", eq(comm(DI,DJ),scal(F(2),DK)), " raw:",[(a,b,str(comm(DI,DJ)[a][b])) for a in range(7) for b in range(a+1,7) if comm(DI,DJ)[a][b]!=0])
print("[DJ,DK] =? 2*DI :", eq(comm(DJ,DK),scal(F(2),DI)))
print("[DK,DI] =? 2*DJ :", eq(comm(DK,DI),scal(F(2),DJ)))
print("dim span{DI,DJ,DK} =", rank_of([DI,DJ,DK]))

print("\n=== Y central & independent ===")
print("[DI,Y]==0:",iszero(comm(DI,Yh)),"  [DJ,Y]==0:",iszero(comm(DJ,Yh)),"  [DK,Y]==0:",iszero(comm(DK,Yh)))
print("dim span{DI,DJ,DK,Y} =", rank_of([DI,DJ,DK,Yh]), " (4 => Y independent of su2L)")
print("[Y,Y]==0 (u(1)):",iszero(comm(Yh,Yh)))

print("\n=== the join = su(2)_L (+) u(1)_Y : bracket-closed, dim 4 ===")
# closure already known =4; verify all pairwise brackets stay in span{DI,DJ,DK,Y}
base=[DI,DJ,DK,Yh]
def in_span(t,gens):
    tv=flat(t); gv=[flat(g) for g in gens]; nc=len(gens)
    A=[[gv[j][r] for j in range(nc)]+[tv[r]] for r in range(49)]
    r=0;nr=49
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
closed=all(in_span(comm(base[i],base[j]),base) for i in range(4) for j in range(4))
print("all pairwise brackets in span{DI,DJ,DK,Y}:",closed)

print("\n=== derived subalgebra [g,g] ===")
brackets=[comm(base[i],base[j]) for i in range(4) for j in range(4)]
print("dim [join,join] =", rank_of(brackets), " (=3 => derived subalgebra is su(2)_L; Y lost)")
print("Y in [join,join]?", in_span(Yh,brackets))

print("\n=== central ideal: [x, join]=0 for x in span{Y} only ===")
# center of the join = {x in join : [x, everything]=0}. Should be span{Y} (dim 1).
# param x = a DI + b DJ + c DK + d Y ; solve [x, base_k]=0 for all k
# quick: check Y is central (done) and no combination of DI,DJ,DK (nonzero) is central (su2 centerless)
print("Y central (commutes with all 4 base):", all(iszero(comm(Yh,g)) for g in base))
print("DI central?", all(iszero(comm(DI,g)) for g in base), " (should be False: su(2) centerless)")

print("\n=== skew-adjoint wrt Born form gForm on ImO (=> in so(7)) ===")
# Gram of gForm on imBasis e1..e7 = identity (N257 gForm_imBasis). So so(7) = {A : A^T = -A}.
for name,A in [("DI",DI),("DJ",DJ),("DK",DK),("Y",Yh)]:
    print(f"  {name} skew (A^T=-A):", eq(transpose(A),scal(F(-1),A)))

print("\n=== relation to N247 colour/charge sector (the twin) ===")
print("  [Q,Y] != 0 (electroweak sector does NOT commute with colour-charge Q):", not iszero(comm(Q,Yh)))
print("  Q in span{DI,DJ,DK,Y}?", in_span(Q,base), " (=> Q, the gather charge, is NOT electroweak)")
print("  |Y|^2 = B(Y,Y) =", BB(Yh,Yh), "  |T3=DI|^2 =",BB(DI,DI))
