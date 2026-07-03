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
def crossOp(a): return mat(lambda x,a=a: octCrossO(a,x))
def matmul(A,B): return [[sum(A[r][t]*B[t][c] for t in range(7)) for c in range(7)] for r in range(7)]
def tr(A): return sum(A[i][i] for i in range(7))
def traceForm(X,Y): return tr(matmul(X,Y))
# g2 basis
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
def build_g2():
    rows=[]
    for i in range(1,8):
        for j in range(1,8):
            v_eiej=o_to_vec(o_mul(E[i],E[j]))
            per=[[F(0)]*8 for _ in range(49)]
            for q in range(7):
                cq=v_eiej[q+1]
                for p in range(7): per[p*7+q][p+1]+=cq
            for p in range(7):
                v=o_to_vec(o_mul(E[p+1],E[j]))
                for comp in range(8): per[p*7+(i-1)][comp]-=v[comp]
            for p in range(7):
                v=o_to_vec(o_mul(E[i],E[p+1]))
                for comp in range(8): per[p*7+(j-1)][comp]-=v[comp]
            for comp in range(8):
                row=[per[k][comp] for k in range(49)]
                if any(x!=0 for x in row): rows.append(row)
    return [vec_to_mat(v) for v in nullspace(rows,49)]
g2=build_g2()
sevens=[crossOp(E[i]) for i in range(1,8)]
# Test: traceForm(crossOp e_i, D) for all D in g2, i in 1..7 -> all zero?
allzero=True
maxabs=0
for i in range(1,8):
    for D in g2:
        v=traceForm(crossOp(E[i]),D)
        if v!=0: allzero=False; maxabs=max(maxabs,abs(v))
print("traceForm(range crossEmb, range imRepL) identically 0 ?", allzero)
# also inside 14: traceForm(D,D) for D in g2 (should be nonzero -> form nondegenerate on 14)
print("sample traceForm(g2[0],g2[0]) =", traceForm(g2[0],g2[0]))
