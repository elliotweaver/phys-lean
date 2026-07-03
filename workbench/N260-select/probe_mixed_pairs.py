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
def reQ(z): return o_to_vec(z)[0]
def gForm(x,y): return reQ(o_mul(x,o_star(y)))
def octCrossO(a,b): return o_add(o_mul(a,b), o_from_vec([gForm(a,b)]+[F(0)]*7))
def mat(op):
    A=[[F(0)]*7 for _ in range(7)]
    for jc,j in enumerate(range(1,8)):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(range(1,8)): A[ic][jc]=out[i]
    return A
def crossOp(a): return mat(lambda x,a=a: octCrossO(a,x))
def matmul(A,B): return [[sum(A[r][t]*B[t][c] for t in range(7)) for c in range(7)] for r in range(7)]
def subm(A,B): return [[A[r][c]-B[r][c] for c in range(7)] for r in range(7)]
def comm(A,B): return subm(matmul(A,B),matmul(B,A))
def flat(A): return [A[i][j] for i in range(7) for j in range(7)]
def rank(mats):
    rows=[flat(m)[:] for m in mats]; nr=len(rows); nc=49; rk=0
    for c in range(nc):
        piv=next((i for i in range(rk,nr) if rows[i][c]!=0),None)
        if piv is None: continue
        rows[rk],rows[piv]=rows[piv],rows[rk]; pv=rows[rk][c]; rows[rk]=[x/pv for x in rows[rk]]
        for i in range(nr):
            if i!=rk and rows[i][c]!=0:
                f=rows[i][c]; rows[i]=[rows[i][j]-f*rows[rk][j] for j in range(nc)]
        rk+=1
        if rk==nr: break
    return rk
sevens=[crossOp(E[i]) for i in range(1,8)]
# range imRepL (the 14) numerically = build g2 skew derivations; simpler: 14-part = so(7) minus 7.
# We test "mixed" via: is [crossOp ei, crossOp ej] in range crossEmb (pure 7)? and is it in the 14?
# range crossEmb = span sevens (7). A bracket B is "has 7-part" iff proj onto sevens != 0,
# "has 14-part" iff B not in span sevens. We can detect: B in span(sevens)? and B skew (always).
def in_span(B, basis_list):
    return rank(basis_list+[B])==rank(basis_list)
# Find g2 (14) to detect pure-14. Build derivations numerically (reuse constraint solver).
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
    B2=[]
    for fc in free:
        vec=[F(0)]*ncols; vec[fc]=F(1)
        for c in pivots: vec[c]=-R[col_piv[c]][fc]
        B2.append(vec)
    return B2
def vec_to_mat(v): return [[v[i*7+j] for j in range(7)] for i in range(7)]
def build_g2():
    rows=[]
    for i in range(1,8):
        for j in range(1,8):
            eiej=o_mul(E[i],E[j]); v_eiej=o_to_vec(eiej)
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
print("dim g2 =", len(g2), " dim sevens =", rank(sevens))
# classify each pair
mixed=[]; pure7=[]; pure14=[]; zero=[]
for i in range(1,8):
    for j in range(i+1,8):
        B=comm(crossOp(E[i]),crossOp(E[j]))
        if all(x==0 for r in B for x in r): zero.append((i,j)); continue
        has7 = not in_span(B,g2)   # has a component outside 14 => 7-part present
        has14= not in_span(B,sevens) # component outside 7 => 14-part present
        if has7 and has14: mixed.append((i,j))
        elif has7: pure7.append((i,j))
        elif has14: pure14.append((i,j))
print("MIXED pairs (both proj != 0):", mixed[:6], "...total", len(mixed))
print("pure7 pairs:", pure7[:6], "total", len(pure7))
print("pure14 pairs:", pure14[:6], "total", len(pure14))
print("zero pairs:", zero[:6], "total", len(zero))
# show one explicit mixed witness and its bracket action on e1 (u1) for Lean coordinate check
if mixed:
    i,j=mixed[0]
    B=comm(crossOp(E[i]),crossOp(E[j]))
    print(f"\nWITNESS [crossOp e{i}, crossOp e{j}]: matrix (7x7 on ImO basis e1..e7):")
    for r in B: print("  ", [int(x) if x==int(x) else str(x) for x in r])
    # its value on e1 => first column
    print("acts on e1 ->", [int(B[r][0]) for r in range(7)])
