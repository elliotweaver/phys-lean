#!/usr/bin/env python3
"""N259 SELECT probe — the JOINT structure of the two derived reductive factors inside so(7).
Determine, over exact ℚ, the FORCED relationship between colour su(3)_c and weak-isospin su(2)_L
(both subalgebras of the rank-2 g₂ = Der O), and the full internal symmetry algebra they generate.

Key theory-native questions:
 (Q1) Is T3 = imRep DI actually a colour generator (DI in colourCentralizer, i.e. [DI,Q]=0)?
 (Q2) su(2)_L ∩ su(3)_c dimension = ? (rank collision: does the isospin Cartan lie in colour su(3)?)
 (Q3) Do su(3)_c and su(2)_L commute? (they CANNOT if both rank>0 and rank-collide in rank-2 g₂)
 (Q4) The full join g_SM = (su(3)_c ⊕ span Q) + (su(2)_L ⊕ span Y): dim as a subspace, and the
      dim of the Lie algebra it GENERATES (closure under bracket) — is it a proper subalgebra of so(7)
      or all of it? Is it reductive?
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
def sub(A,B): return [[A[r][c]-B[r][c] for c in range(7)] for r in range(7)]
def add(A,B): return [[A[r][c]+B[r][c] for c in range(7)] for r in range(7)]
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

# ---------- linear algebra over ℚ on flattened 49-vectors ----------
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

# ---------- build the FULL derivation algebra g2 = Der(O) as 7x7 matrices on ImO ----------
# A derivation D: D(1)=0, D(imag)=M*imag (7x7 M), and D(xy)=D(x)y + x D(y) for all octonions.
# impose on imaginary basis pairs e_i,e_j (i,j in 1..7). Build linear constraints on the 49 entries of M.
# We treat M as acting on ImO (index 0..6 <-> e1..e7).
def apply_M_to_o(M, z):
    # z octonion; return derivation image using M on imaginary part, 0 on real part
    v=o_to_vec(z)
    im=v[1:8]
    out=[F(0)]*8
    for i in range(7):
        s=F(0)
        for j in range(7): s+=M[i][j]*im[j]
        out[i+1]=s
    return o_from_vec(out)
# Constraint: for each imaginary basis pair (a,b) in E[1..7], D(a*b)=D(a)*b+a*D(b).
# Each is an octonion equation (8 comps). Collect as linear constraints in the 49 unknowns M[i][j].
# unknown index: u(i,j)=i*7+j
def build_g2_basis():
    rows=[]  # each row: length 49 coefficients =0 constraint, one per output component per pair
    for ia in range(1,8):
        for ib in range(1,8):
            a=E[ia]; b=E[ib]
            ab=o_mul(a,b)
            # D(ab) - D(a)b - a D(b) = 0 ; all linear in M entries.
            # D(ab): ab has real+imag; D(real)=0, D(imag)=M*imag(ab)
            # Represent each side's dependence on M[i][j] by 8-comp octonion coefficient.
            # We'll build 8 constraint rows (one per octonion output component).
            # coefficient of unknown M[p][q] in the expression:
            #   term1 = D(ab): imag(ab)_q contributes to output comp (p+1) with +imag(ab)_q
            #   term2 = -D(a)b : D(a)=M*imag(a); (M*imag(a)) is octonion with comps; times b.
            #   term3 = -a D(b): similar.
            # Easiest: for each unknown, compute the octonion value of expression with M=E_{pq} (unit).
            per_unknown=[]
            imag_ab=o_to_vec(ab)[1:8]
            for p in range(7):
                for q in range(7):
                    # M = unit at (p,q): M*imvec has comp p = imvec[q]
                    # D(ab) with this unit: imag part of ab -> vector w where w[p]=imag_ab[q], else 0
                    dab=[F(0)]*8; dab[p+1]=imag_ab[q]; dab_o=o_from_vec(dab)
                    # D(a): imag(a)-> vec with comp p = imag_a[q]
                    imag_a=o_to_vec(a)[1:8]; da=[F(0)]*8; da[p+1]=imag_a[q]; da_o=o_from_vec(da)
                    imag_b=o_to_vec(b)[1:8]; db=[F(0)]*8; db[p+1]=imag_b[q]; db_o=o_from_vec(db)
                    expr=o_add(o_add(dab_o, o_neg(o_mul(da_o,b))), o_neg(o_mul(a,db_o)))
                    per_unknown.append(o_to_vec(expr))
            # per_unknown[k] is 8-vector; constraint: sum_k M_k * per_unknown[k][comp]=0 for each comp
            for comp in range(8):
                row=[per_unknown[k][comp] for k in range(49)]
                if any(x!=0 for x in row): rows.append(row)
    # nullspace of rows (49 unknowns) = g2 basis
    return nullspace(rows,49)
def nullspace(rows,ncols):
    # gaussian elim, return basis of nullspace as list of 49-vectors
    R=[r[:] for r in rows]; nr=len(R); pivots=[]
    r=0
    col_piv={}
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
    basis=[]
    for fc in free:
        vec=[F(0)]*ncols; vec[fc]=F(1)
        for c in pivots:
            vec[c]=-R[col_piv[c]][fc]
        basis.append(vec)
    return basis
def vec_to_mat(v): return [[v[i*7+j] for j in range(7)] for i in range(7)]

g2basis=build_g2_basis()
g2mats=[vec_to_mat(v) for v in g2basis]
print("=== g2 = Der(O) ===")
print("dim Der(O) =", len(g2basis), "(expect 14)")
print("DI in g2:", in_span(DI,g2mats), " DJ in g2:", in_span(DJ,g2mats), " DK in g2:", in_span(DK,g2mats))
# g2 rank check via commuting subspace? skip. Confirm su(2)_L subset.

# ---------- colour su(3)_c = { D in g2 : [D, Q] = 0 } ----------
# solve within g2: general element sum x_a g2basis[a]; impose [M,Q]=0 (49 eqns), linear in x_a (14 unknowns)
def colour_centralizer():
    n=len(g2mats)
    # constraint rows in x_a: comm(sum x_a M_a, Q) = 0 -> for each of 49 comps
    rows=[]
    commmats=[comm(M,Q) for M in g2mats]  # linear: comm is linear in M
    for comp in range(49):
        row=[flat(commmats[a])[comp] for a in range(n)]
        if any(x!=0 for x in row): rows.append(row)
    ns=nullspace(rows,n)
    # each null vector -> derivation matrix
    cmats=[]
    for v in ns:
        M=[[F(0)]*7 for _ in range(7)]
        for a in range(n):
            if v[a]!=0:
                M=add(M,scal(v[a],g2mats[a]))
        cmats.append(M)
    return cmats
su3=colour_centralizer()
print("\n=== colour su(3)_c = centralizer of Q in g2 ===")
print("dim su(3)_c =", dim_span(su3), "(expect 8)")

print("\n=== (Q1) is the isospin Cartan T3=DI a colour generator? ===")
print("[DI,Q]==0:", iszero(comm(DI,Q)), "  => DI in su(3)_c:", in_span(DI,su3))
print("[DJ,Q]==0:", iszero(comm(DJ,Q)), "  => DJ in su(3)_c:", in_span(DJ,su3))
print("[DK,Q]==0:", iszero(comm(DK,Q)), "  => DK in su(3)_c:", in_span(DK,su3))

print("\n=== (Q2) su(2)_L ∩ su(3)_c dimension ===")
su2=[DI,DJ,DK]
d_su2=dim_span(su2); d_su3=dim_span(su3); d_sum=dim_span(su2+su3)
print("dim su(2)_L =",d_su2," dim su(3)_c =",d_su3," dim(su2+su3 as subspace) =",d_sum)
print("dim(su(2)_L ∩ su(3)_c) = d_su2+d_su3 - d_sum =", d_su2+d_su3-d_sum)

print("\n=== (Q3) do su(3)_c and su(2)_L commute? ===")
noncomm=[(i,j) for i,A in enumerate(su2) for j,Bm in enumerate(su3) if not iszero(comm(A,Bm))]
print("number of non-commuting (su2 gen, su3 gen) pairs:", len(noncomm), "(0 => they commute)")

print("\n=== (Q4) the full internal algebra generated by both reductive factors ===")
# generators: su(3)_c basis (8) + Q  (colour-charge factor, dim 9) ; su(2)_L (3) + Y (electroweak, dim 4)
gens=su3+[Q]+su2+[Yh]
print("dim of the SUBSPACE spanned by all generators =", dim_span(gens))
# close under bracket
def lie_closure(gens, cap=60):
    cur=[g for g in gens]
    d=dim_span(cur)
    while True:
        new=list(cur)
        # add brackets of a spanning set: reduce first
        for i in range(len(cur)):
            for j in range(i+1,len(cur)):
                new.append(comm(cur[i],cur[j]))
        nd=dim_span(new)
        if nd==d: break
        d=nd; cur=new
        if d>=cap: break
    return d
print("dim of the Lie algebra GENERATED (bracket closure) =", lie_closure(gens))
print("dim so(7) = 21 (for reference)")

print("\n=== structure of the two u(1)s in the 7 ===")
print("[Q,Y] == 0 ?", iszero(comm(Q,Yh)), " BB(Q,Y)=",BB(Q,Yh)," BB(Q,Q)=",BB(Q,Q)," BB(Y,Y)=",BB(Yh,Yh))
print("[Q,Y] in g2 (the 14)?", in_span(comm(Q,Yh),g2mats), " (bracket of two 7-elements lands in 14?)")
