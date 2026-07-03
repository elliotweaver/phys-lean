#!/usr/bin/env python3
"""N259 SELECT probe 5 — is the derived SM gauge algebra g_SM = su(3)_c + su(2)_L + u(1)_Y
bracket-CLOSED (a genuine Lie subalgebra), or do colour + isospin GENERATE more (they don't
commute, don't normalize each other)? This decides whether 'g_SM as one Lie object' is clean.

Also: the EXACT dimension of g_SM as a subspace (accounting for the T3 overlap), and the dim of
the Lie algebra colour+isospin generate inside g2 (rank-2 => can't hold su3,su2 independently).
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
def addm(A,B): return [[A[r][c]+B[r][c] for c in range(7)] for r in range(7)]
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
def dim_span(mats): return rank_of(mats)
def nullspace(rows,ncols):
    R=[r[:] for r in rows]; nr=len(R); pivots=[]; r=0; col_piv={}
    for c in range(ncols):
        piv=next((i for i in range(r,nr) if R[i][c]!=0),None)
        if piv is None: continue
        R[r],R[piv]=R[piv],R[r]; pv=R[r][c]; R[r]=[x/pv for x in R[r]]
        for i in range(nr):
            if i!=r and R[i][c]!=0:
                f=R[i][c]; R[i]=[R[i][j]-f*R[r][j] for j in range(ncols)]
        col_piv[c]=r; pivots.append(c); r+=1
        if r==nr: break
    free=[c for c in range(ncols) if c not in col_piv]
    B=[]
    for fc in free:
        vec=[F(0)]*ncols; vec[fc]=F(1)
        for c in pivots: vec[c]=-R[col_piv[c]][fc]
        B.append(vec)
    return B
def vec_to_mat(v): return [[v[i*7+j] for j in range(7)] for i in range(7)]
def build_g2_basis():
    rows=[]
    for ia in range(1,8):
        for ib in range(1,8):
            a=E[ia]; b=E[ib]; ab=o_mul(a,b)
            imag_ab=o_to_vec(ab)[1:8]; imag_a=o_to_vec(a)[1:8]; imag_b=o_to_vec(b)[1:8]
            per_unknown=[]
            for p in range(7):
                for q in range(7):
                    dab=[F(0)]*8; dab[p+1]=imag_ab[q]; dab_o=o_from_vec(dab)
                    da=[F(0)]*8; da[p+1]=imag_a[q]; da_o=o_from_vec(da)
                    db=[F(0)]*8; db[p+1]=imag_b[q]; db_o=o_from_vec(db)
                    expr=o_add(o_add(dab_o, o_neg(o_mul(da_o,b))), o_neg(o_mul(a,db_o)))
                    per_unknown.append(o_to_vec(expr))
            for comp in range(8):
                row=[per_unknown[k][comp] for k in range(49)]
                if any(x!=0 for x in row): rows.append(row)
    return nullspace(rows,49)
g2mats=[vec_to_mat(v) for v in build_g2_basis()]
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
def colour_centralizer():
    n=len(g2mats); rows=[]; commmats=[comm(M,Q) for M in g2mats]
    for comp in range(49):
        row=[flat(commmats[a])[comp] for a in range(n)]
        if any(x!=0 for x in row): rows.append(row)
    ns=nullspace(rows,n); cmats=[]
    for v in ns:
        M=[[F(0)]*7 for _ in range(7)]
        for a in range(n):
            if v[a]!=0: M=addm(M,scal(v[a],g2mats[a]))
        cmats.append(M)
    return cmats
su3=colour_centralizer()
su2=[DI,DJ,DK]

def lie_closure_dim(gens, cap=25):
    cur=[g for g in gens]; d=dim_span(cur)
    while True:
        new=list(cur)
        for i in range(len(cur)):
            for j in range(i+1,len(cur)): new.append(comm(cur[i],cur[j]))
        nd=dim_span(new)
        if nd==d: break
        d=nd; cur=new
        if d>=cap: break
    return d

print("=== dimensions of the pieces ===")
print("dim colourImg su(3)_c =", dim_span(su3))
print("dim isospinImg su(2)_L =", dim_span(su2))
print("dim(colour ⊓ isospin) =", dim_span(su3)+dim_span(su2)-dim_span(su3+su2), "(=1 => share T3=DI)")
print("dim(colourImg + isospinImg as SUBSPACE) =", dim_span(su3+su2), "(8+3-1 = 10)")

print("\n=== (KEY) is colour+isospin bracket-CLOSED, or do they generate more? ===")
print("dim ⟨colour ∪ isospin⟩_Lie (generated subalgebra of g2) =", lie_closure_dim(su3+su2), " (g2=14)")
print("  => if 14, colour+isospin GENERATE ALL of g2 (not a clean su3⊕su2 subalgebra).")
print("  => if 10, colour+isospin IS bracket-closed (g_SM^ss a genuine subalgebra).")

print("\n=== full g_SM = colour + isospin + hyperLine(Y): subspace dim & closure ===")
gSM = su3+su2+[Yh]
print("dim(g_SM subspace: colour+isospin+Y) =", dim_span(gSM), " (10 + 1 for Y in the 7)")
print("dim ⟨g_SM⟩_Lie generated =", lie_closure_dim(gSM, cap=30))

print("\n=== including the colour-charge line Q too (both full reductive factors) ===")
both = su3+[Q]+su2+[Yh]
print("dim(both factors subspace) =", dim_span(both))
print("dim ⟨both⟩_Lie generated =", lie_closure_dim(both, cap=30), " (so(7)=21)")

print("\n=== VERDICT SUMMARY ===")
d_ci = lie_closure_dim(su3+su2)
print(f"colour+isospin generate dim {d_ci} inside g2(14): "
      + ("ALL of g2 (NOT a clean subalgebra — they don't close)" if d_ci==14 else f"closes at {d_ci}"))
