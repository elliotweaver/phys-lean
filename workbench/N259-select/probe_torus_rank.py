#!/usr/bin/env python3
"""N259 SELECT probe 2 — the RANK / maximal-torus structure of so(7) and the forced neutral relation.

Theory-native hypothesis to TEST (not assume): so(7) has rank 3; the naive SM neutral sector
(colour Cartan rank 2 + T3 + Y + Q) over-counts, so a linear relation among the neutral generators
is FORCED by the rank of so(7). Is that the 'richer structure' the mixing angle needs?

Reuse the exact-ℚ octonion model + g2/su3 builders from probe_joint_structure.py.
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
def eq(A,B): return iszero(subm(A,B))
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
    basis=[]
    for fc in free:
        vec=[F(0)]*ncols; vec[fc]=F(1)
        for c in pivots: vec[c]=-R[col_piv[c]][fc]
        basis.append(vec)
    return basis
def vec_to_mat(v): return [[v[i*7+j] for j in range(7)] for i in range(7)]

# build g2 basis
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

# ------- build a full basis of so(7) (skew-adjoint wrt gForm; here gForm Gram = I so skew=antisym) -------
# so(7): antisymmetric 7x7. basis E_{ij}-E_{ji}, i<j. 21 of them.
def so7_basis():
    B=[]
    for i in range(7):
        for j in range(i+1,7):
            M=[[F(0)]*7 for _ in range(7)]; M[i][j]=F(1); M[j][i]=F(-1); B.append(M)
    return B
so7=so7_basis()
print("dim so(7) =", dim_span(so7), "(expect 21)")

# ------- RANK: maximal abelian (torus) dimension. Greedy: find max mutually-commuting independent set. -------
# Test known candidate tori.
def commuting_set(mats):
    return all(iszero(comm(mats[i],mats[j])) for i in range(len(mats)) for j in range(i+1,len(mats)))

print("\n=== RANK of so(7) via candidate maximal tori ===")
# g2 Cartan: two commuting elements of g2. Find a maximal commuting subset of g2 (rank 2 expected).
# Colour Cartan: maximal commuting subset of su3 (rank 2 expected).
def max_torus(basis, extra=[]):
    # greedy maximal set of mutually-commuting independent matrices drawn from basis (+ forced extra first)
    chosen=[]
    for m in extra:
        if all(iszero(comm(m,c)) for c in chosen):
            if dim_span(chosen+[m])>dim_span(chosen): chosen.append(m)
    for m in basis:
        if all(iszero(comm(m,c)) for c in chosen):
            if dim_span(chosen+[m])>dim_span(chosen): chosen.append(m)
    return chosen
t_g2=max_torus(g2mats)
print("max torus of g2 (rank):", dim_span(t_g2))
t_so7=max_torus(so7)
print("max torus of so(7) (rank):", dim_span(t_so7))

# Does Q commute with a rank-2 g2/colour Cartan, giving a rank-3 so(7) torus?
t_colour=max_torus(su3)
print("max torus of colour su(3)_c (rank):", dim_span(t_colour))
print("Q commutes with the whole colour Cartan:", all(iszero(comm(Q,c)) for c in t_colour))
torusQ=t_colour+[Q]
print("dim span(colour Cartan + Q):", dim_span(torusQ), " mutually commuting:", commuting_set(torusQ))
print("  => is (colour Cartan + Q) a maximal rank-3 torus of so(7)?", dim_span(torusQ)==dim_span(t_so7) and commuting_set(torusQ))

print("\n=== where do T3=DI and Y sit relative to that torus? ===")
print("DI in colour su(3)_c:", in_span(DI,su3))
print("DI commutes with colour Cartan:", all(iszero(comm(DI,c)) for c in t_colour), " (=> DI in colour Cartan?)")
print("DI in span(colour Cartan):", in_span(DI,t_colour))
print("Y commutes with colour Cartan:", all(iszero(comm(Yh,c)) for c in t_colour))
print("Y commutes with Q:", iszero(comm(Yh,Q)))
print("Y in span(colour Cartan + Q):", in_span(Yh, torusQ) if commuting_set(torusQ) else "n/a")

print("\n=== the neutral (mutually commuting) generators available and forced relations ===")
# Candidate neutral generators that pairwise commute with Q and T3:
neutrals={'h1':t_colour[0] if len(t_colour)>0 else None,'h2':t_colour[1] if len(t_colour)>1 else None,'Q':Q,'DI(T3)':DI,'Y':Yh}
names=[n for n in neutrals if neutrals[n] is not None]
print("pairwise commutators among {colour Cartan h1,h2, Q, T3=DI, Y}:")
for i in range(len(names)):
    for j in range(i+1,len(names)):
        c=iszero(comm(neutrals[names[i]],neutrals[names[j]]))
        if not c: print(f"   [{names[i]},{names[j]}] != 0")
# maximal commuting subset including Q and T3
print("\ncommuting subset {h1,h2,Q,T3}: dim / relation")
sset=[t_colour[0],t_colour[1],Q,DI]
print("  mutually commuting:", commuting_set(sset), " dim span:", dim_span(sset), " (4 gens in rank-3 torus => 1 relation if all in torus)")
print("  is span{h1,h2,Q,T3} inside the rank-3 torus? dim=",dim_span(sset))
# The forced relation: if these 4 commuting neutrals live in a rank-3 torus, dim<4 => a linear relation.
