"""
N287 SELECT — MEASURE-FIRST step 1: build g2 = Der(O) intrinsically, verify su(2)_L and colour.

Uses the SAME CD octonion table as N283 (Phys/Cascade/Double.lean convention).
Goal: confirm, EXACT (Fraction), the DERIVED objects before the heavy f4 lift:
  - g2 = Der(O) is 14-dim (nullspace of the derivation condition on End(O)).
  - su(2)_L = {DI,DJ,DK}, DI = commutator ad_{u1} = L_{u1} - R_{u1}, are derivations,
    structure constants [DI,DJ]=2DK etc.  (banked struct_ij).
  - colour = stab(u1) = {D in g2 : D u1 = 0} is 8-dim (= su(3) in g2), DI in colour,
    DJ,DK not in colour (banked DI_mem_colour / DJ_not_mem_colour).
"""
from fractions import Fraction as F

# ---- recursive CD arithmetic (identical to N283 probe_gram) ----
def R_mul(x, y): return x * y
def R_star(x): return x
def R_add(x, y): return x + y
def R_sub(x, y): return x - y
def make_level(mul, star, add, sub):
    def lmul(z, w):
        (a, b) = z; (c, d) = w
        return (sub(mul(a, c), mul(star(d), b)), add(mul(d, a), mul(b, star(c))))
    def lstar(z):
        (a, b) = z; return (star(a), lneg(b))
    def ladd(z, w):
        (a, b) = z; (c, d) = w; return (add(a, c), add(b, d))
    def lsub(z, w):
        (a, b) = z; (c, d) = w; return (sub(a, c), sub(b, d))
    return lmul, lstar, ladd, lsub
def neg_gen():
    def n(z): return (n(z[0]), n(z[1])) if isinstance(z, tuple) else -z
    return n
lneg = neg_gen()
C = make_level(R_mul, R_star, R_add, R_sub)
Hl = make_level(C[0], C[1], C[2], C[3])
Ol = make_level(Hl[0], Hl[1], Hl[2], Hl[3])
O_mul, O_star, O_add, O_sub = Ol
def flat(z):
    ((za, zb), (zc, zd)) = z
    (a, b) = za; (c, d) = zb; (e, f) = zc; (g, h) = zd
    return [a, b, c, d, e, f, g, h]
def unflat(v):
    a, b, c, d, e, f, g, h = v
    return (((a, b), (c, d)), ((e, f), (g, h)))
def basis(i):
    v = [F(0)]*8; v[i] = F(1); return unflat(v)
e = [basis(i) for i in range(8)]
def octmul(x, y): return O_mul(x, y)
def octstar(x): return O_star(x)
def gForm(x, y): return flat(octmul(x, octstar(y)))[0]

# left/right regular reps (8x8 over F)
def leftReg(x):
    M = [[F(0)]*8 for _ in range(8)]
    for j in range(8):
        col = flat(octmul(x, e[j]))
        for i in range(8): M[i][j] = col[i]
    return M
def rightReg(x):
    M = [[F(0)]*8 for _ in range(8)]
    for j in range(8):
        col = flat(octmul(e[j], x))
        for i in range(8): M[i][j] = col[i]
    return M

def mm(A, B, n=8):
    Cc = [[F(0)]*n for _ in range(n)]
    for i in range(n):
        Ai = A[i]
        for k in range(n):
            a = Ai[k]
            if a == 0: continue
            Bk = B[k]
            for j in range(n): Cc[i][j] += a*Bk[j]
    return Cc
def ms(A, B, n=8): return [[A[i][j]-B[i][j] for j in range(n)] for i in range(n)]
def ma(A, B, n=8): return [[A[i][j]+B[i][j] for j in range(n)] for i in range(n)]
def comm(A, B, n=8): return ms(mm(A,B,n), mm(B,A,n), n)
def iszero(A, n=8): return all(A[i][j]==0 for i in range(n) for j in range(n))

u1 = e[1]
# hI ~ u1, hJ ~ ? The banked hI=iota(J) embeds as u1=e1. quaternion units in O: e1,e2,e3.
# DI = ad_{e1} = L_{e1}-R_{e1}, DJ = ad_{e2}, DK = ad_{e3}
def adOp(x): return ms(leftReg(x), rightReg(x))
DI = adOp(e[1]); DJ = adOp(e[2]); DK = adOp(e[3])

# ---- derivation condition: D is a derivation iff D(xy) = D(x)y + x D(y) for all basis x,y ----
def is_deriv(D):
    for a in range(8):
        for b in range(8):
            xy = octmul(e[a], e[b])
            Dxy = apply(D, xy)
            Dx_y = octmul(unflat(colvec(D,a)), e[b])
            x_Dy = octmul(e[a], unflat(colvec(D,b)))
            if flat(Dxy) != [Dx_y_i + x_Dy_i for Dx_y_i,x_Dy_i in zip(flat(Dx_y),flat(x_Dy))]:
                return False
    return True
def colvec(D, j): return [D[i][j] for i in range(8)]
def apply(D, x):
    xf = flat(x); out=[F(0)]*8
    for i in range(8):
        s=F(0)
        for j in range(8): s+=D[i][j]*xf[j]
        out[i]=s
    return unflat(out)

print("DI is derivation?", is_deriv(DI), " DJ?", is_deriv(DJ), " DK?", is_deriv(DK))
print("[DI,DJ] = 2 DK ?", iszero(ms(comm(DI,DJ), [[2*DK[i][j] for j in range(8)] for i in range(8)])))
print("DI(u1)=0 (in colour)?", iszero(apply_to_mat(DI, u1)) if False else flat(apply(DI,u1)))
print("DJ(u1):", flat(apply(DJ, u1)), " DK(u1):", flat(apply(DK, u1)))

# ---- g2 = Der(O): nullspace of the derivation condition on End(O)=64-dim ----
# Unknown D as 8x8 = 64 entries D[i][j]. Condition for each (a,b): D(e_a e_b) - D(e_a)e_b - e_a D(e_b) = 0 (8 comps).
# Build linear system rows in the 64 unknowns.
def unknown_index(i,j): return i*8+j
rows = []
for a in range(8):
    for b in range(8):
        eab = flat(octmul(e[a], e[b]))  # coefficients: D(e_a e_b) = sum_m eab[m] * D(.,m)... careful:
        # D applied to vector v = sum_m v_m e_m gives sum_m v_m * (col m of D). Its comp i = sum_m v_m D[i][m].
        # term1_i = sum_m eab[m] D[i][m]
        # term2 = D(e_a) e_b : D(e_a) = col a of D = sum_i D[i][a] e_i ; times e_b (right mult) -> matrix RB=rightReg(e_b)
        RB = rightReg(e[b]); LA = leftReg(e[a])
        # term2_i = sum_i' RB[i][i'] D[i'][a]
        # term3 = e_a D(e_b): D(e_b)=col b; left mult by e_a -> LA. term3_i = sum_i' LA[i][i'] D[i'][b]
        for i in range(8):
            row = [F(0)]*64
            for m in range(8): row[unknown_index(i,m)] += eab[m]
            for ip in range(8): row[unknown_index(ip,a)] -= RB[i][ip]
            for ip in range(8): row[unknown_index(ip,b)] -= LA[i][ip]
            rows.append(row)

def nullspace_dim_and_basis(rows, ncol):
    mat=[r[:] for r in rows]; nrow=len(mat); pivcols=[]; r=0
    for c in range(ncol):
        piv=None
        for rr in range(r,nrow):
            if mat[rr][c]!=0: piv=rr;break
        if piv is None: continue
        mat[r],mat[piv]=mat[piv],mat[r]; pv=mat[r][c]; mat[r]=[x/pv for x in mat[r]]
        for rr in range(nrow):
            if rr!=r and mat[rr][c]!=0:
                f=mat[rr][c]; mat[rr]=[mat[rr][j]-f*mat[r][j] for j in range(ncol)]
        pivcols.append(c); r+=1
    free=[c for c in range(ncol) if c not in pivcols]
    bas=[]
    for fc in free:
        v=[F(0)]*ncol; v[fc]=F(1)
        for i,pc in enumerate(pivcols): v[pc]=-mat[i][fc]
        bas.append(v)
    return len(free), bas
dim_g2, g2basis = nullspace_dim_and_basis(rows, 64)
print("\n=== dim Der(O) =", dim_g2, "(expect 14) ===")

# reconstruct g2 basis as 8x8 matrices
def vec_to_mat(v): return [[v[i*8+j] for j in range(8)] for i in range(8)]
g2mats = [vec_to_mat(v) for v in g2basis]

# colour = {D in g2 : D u1 = 0}: within g2 (14-dim), impose apply(D,u1)=0 (8 conditions on the 14 coords)
def in_g2_coords_constraint():
    # express general g2 elt = sum_k t_k g2mats[k]; condition apply(sum,u1)=0
    crows=[]
    for i in range(8):
        row=[apply(g2mats[k], u1) for k in range(dim_g2)]
        crows.append([flat(row[k])[i] for k in range(dim_g2)])
    return crows
crows = in_g2_coords_constraint()
dim_colour, _ = nullspace_dim_and_basis(crows, dim_g2)
print("=== dim colour = stab_{g2}(u1) =", dim_colour, "(expect 8 = su(3)) ===")

# centralizer of su(2)_L in g2: [X,DI]=[X,DJ]=[X,DK]=0 for X in g2
def centralizer_in_g2(gens):
    crows=[]
    for g in gens:
        for i in range(8):
            for j in range(8):
                crows.append([comm(g2mats[k], g)[i][j] for k in range(dim_g2)])
    d,_ = nullspace_dim_and_basis(crows, dim_g2)
    return d
print("=== dim centralizer_{g2}(su(2)_L) =", centralizer_in_g2([DI,DJ,DK]), "===")
print("=== dim centralizer_{g2}(DI alone) =", centralizer_in_g2([DI]), "===")
