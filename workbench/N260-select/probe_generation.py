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
u1=(hI,h_zero); kap1=basis(4)
def reQ(z): return o_to_vec(z)[0]
def gForm(x,y): return reQ(o_mul(x,o_star(y)))
def octCrossO(a,b): return o_add(o_mul(a,b), o_from_vec([gForm(a,b)]+[F(0)]*7))
def mat(op):
    A=[[F(0)]*7 for _ in range(7)]
    for jc,j in enumerate(range(1,8)):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(range(1,8)): A[ic][jc]=out[i]
    return A
def innerD(P): return mat(lambda x,P=P:(h_add(h_mul(P,x[0]),h_neg(h_mul(x[0],P))),h_add(h_mul(P,x[1]),h_neg(h_mul(x[1],P)))))
DI=innerD(hI); DJ=innerD(hJ); DK=innerD(hK)
def crossOp(a): return mat(lambda x,a=a: octCrossO(a,x))
Q=crossOp(u1); Yh=crossOp(kap1)
def matmul(A,B): return [[sum(A[r][t]*B[t][c] for t in range(7)) for c in range(7)] for r in range(7)]
def subm(A,B): return [[A[r][c]-B[r][c] for c in range(7)] for r in range(7)]
def addm(A,B): return [[A[r][c]+B[r][c] for c in range(7)] for r in range(7)]
def scal(c,A): return [[c*A[r][cc] for cc in range(7)] for r in range(7)]
def comm(A,B): return subm(matmul(A,B),matmul(B,A))
def flat(A): return [A[i][j] for i in range(7) for j in range(7)]
def rank(mats):
    rows=[flat(m)[:] for m in mats]; nr=len(rows); nc=49; rk=0
    for c in range(nc):
        piv=next((i for i in range(rk,nr) if rows[i][c]!=0),None)
        if piv is None: continue
        rows[rk],rows[piv]=rows[piv],rows[rk]; pv=rows[rk][c]
        rows[rk]=[x/pv for x in rows[rk]]
        for i in range(nr):
            if i!=rk and rows[i][c]!=0:
                f=rows[i][c]; rows[i]=[rows[i][j]-f*rows[rk][j] for j in range(nc)]
        rk+=1
        if rk==nr: break
    return rk
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
# g2 = derivations: solve Leibniz D(xy)=D(x)y+xD(y) for 7x7 skew on ImO. Build via constraints.
def build_g2():
    # unknown 7x7 matrix M (49 unknowns), acting on ImO basis E[1..7], extended to O by M(1)=0.
    # constraint: for all i,j in 1..7: M(ei*ej) = M(ei)*ej + ei*M(ej)  (real+imag comps, 8 each)
    rows=[]
    for i in range(1,8):
        for j in range(1,8):
            eiej=o_mul(E[i],E[j])
            # coefficient of unknown M[p][q] (p,q in 0..6 meaning ImO index p+1 <- from q+1)
            per=[None]*49
            for k in range(49): per[k]=[F(0)]*8
            # M(ei*ej): ei*ej = sum_c coeff_c e_c (c=0..7). M kills real part, on imaginary maps e_{q+1}->sum_p M[p][q] e_{p+1}
            v_eiej=o_to_vec(eiej)
            for q in range(7):
                cq=v_eiej[q+1]
                for p in range(7):
                    # M[p][q] contributes cq * e_{p+1}
                    per[p*7+q][p+1]+=cq
            # -M(ei)*ej: M(ei)= sum_p M[p][i-1] e_{p+1}; times ej
            for p in range(7):
                mp_ej=o_mul(E[p+1],E[j]); v=o_to_vec(mp_ej)
                for comp in range(8):
                    per[p*7+(i-1)][comp]-=v[comp]
            # -ei*M(ej): M(ej)=sum_p M[p][j-1] e_{p+1}; ei times
            for p in range(7):
                ei_mp=o_mul(E[i],E[p+1]); v=o_to_vec(ei_mp)
                for comp in range(8):
                    per[p*7+(j-1)][comp]-=v[comp]
            for comp in range(8):
                row=[per[k][comp] for k in range(49)]
                if any(x!=0 for x in row): rows.append(row)
    ns=nullspace(rows,49)
    return [vec_to_mat(v) for v in ns]
g2=build_g2()
print("dim Der(O)=g2 =", len(g2))
# colour = centralizer of Q in g2
def centralizer(gens_basis, T):
    n=len(gens_basis); rows=[]
    cm=[comm(M,T) for M in gens_basis]
    for comp in range(49):
        row=[flat(cm[a])[comp] for a in range(n)]
        if any(x!=0 for x in row): rows.append(row)
    ns=nullspace(rows,n); out=[]
    for v in ns:
        M=[[F(0)]*7 for _ in range(7)]
        for a in range(n):
            if v[a]!=0: M=addm(M,scal(v[a],g2[a]))
        out.append(M)
    return out
su3=centralizer(g2,Q)
print("dim colourCentralizer su3 =", len(su3))
def apply_to(M, vec):  # M is 7x7 on ImO, vec is O-vector; returns O-vector of M applied (imag)
    inv=[vec[k+1] for k in range(7)]
    out=[F(0)]*8
    for p in range(7):
        s=sum(M[p][q]*inv[q] for q in range(7))
        out[p+1]=s
    return out
# (G1): span{ Q } ∪ { crossOp(D kap1) : D in su3 }  -> does it span the 7 (range crossEmb)?
kap1v=o_to_vec(kap1)
orbit_k=[]
for D in su3:
    Dk=apply_to(D,kap1v)
    orbit_k.append(crossOp(o_from_vec(Dk)))
print("(G1) rank{ Q } ∪ crossOp(su3·kap1) =", rank([Q]+orbit_k), " (target 7 = full fundamental in C)")
# is Vsub=3+3bar colour-irreducible: does su3·kap1 span the 6-dim charged part?
orbit_vecs=[apply_to(D,kap1v) for D in su3]
print("dim su3·kap1 (charged orbit) =", rank([vec_to_mat([ov[i*7+0] if False else F(0) for i in range(49)])] ) if False else "", end="")
def rankvecs(vs):
    rows=[[v[k] for k in range(1,8)] for v in vs]; nr=len(rows); nc=7; rk=0
    for c in range(nc):
        piv=next((i for i in range(rk,nr) if rows[i][c]!=0),None)
        if piv is None: continue
        rows[rk],rows[piv]=rows[piv],rows[rk]; pv=rows[rk][c]; rows[rk]=[x/pv for x in rows[rk]]
        for i in range(nr):
            if i!=rk and rows[i][c]!=0:
                f=rows[i][c]; rows[i]=[rows[i][j]-f*rows[rk][j] for j in range(nc)]
        rk+=1
    return rk
print("dim su3·kap1 =", rankvecs(orbit_vecs), "(if 6 => colour sweeps the charged part; +u1 => full 7)")
# (G2): [7,7] projections. sevens = crossOp basis
sevens=[crossOp(E[i]) for i in range(1,8)]
bb=[comm(sevens[i],sevens[j]) for i in range(7) for j in range(i+1,7)]
# project onto 14 (range imRepL = span g2) vs 7 (range crossEmb = span sevens)
allg2=g2; alls=sevens
def in_span_dim(target_list, basis_list):
    return rank(basis_list+target_list)-rank(basis_list)
print("(G2) rank[7,7] =", rank(bb))
print("(G2) does [7,7] hit the 14? extra dim beyond sevens:", rank(sevens+bb)-rank(sevens), "(want 14)")
print("(G2) does [7,7] hit the 7?  rank(bb ∩ 7-part) proxy: rank(sevens+bb) =", rank(sevens+bb))
# overall re-validate ⟨both factors⟩ minimal generating rank after 2 bounded layers
gens = su3+[Q]+[DI,DJ,DK]+[Yh]
lay1=list(gens)
for i in range(len(gens)):
    for j in range(len(gens)):
        if i<j: lay1.append(comm(gens[i],gens[j]))
r1=rank(lay1)
lay2=list(lay1)
for X in lay1[:len(gens)]:
    for Ymat in lay1:
        lay2.append(comm(X,Ymat))
print("⟨both factors⟩ after layer1 =", r1, " after ~layer2 =", rank(lay2), "(target 21)")
