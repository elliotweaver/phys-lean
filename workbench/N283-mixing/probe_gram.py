"""
N283 — the ★2 mixing-angle route-finding probe.

Compute, EXACT (Fraction) on the fold's real octonion table, the trace-form Gram
B(A,C) = trace(A ∘ C) on the 8-dim matter SPINOR O ℚ of the electroweak generators:
  su(2)_L = leftReg{u1,e2O,e3O} = {L1,L2,L3}
  su(2)_R = rightReg{u1,e2O,e3O} = {R1,R2,R3}
  neutral torus: L1, R1, foldVec=L1+R1, foldAx=L1-R1
  charge/hyper (gather ops lifted to the spinor): crossOpO(u1), crossOpO(e4O=κO1)

Then test whether a convention-free RATIO among the neutral generators pins the weak
mixing angle WITHOUT a posit. Identify the single simple ambient (so(8)?) whose invariant
form makes the ratio convention-free.

CD convention (Phys/Cascade/Double.lean):
  (z*w).re = z.re*w.re - star(w.im)*z.im
  (z*w).im = w.im*z.re + z.im*star(w.re)
  star(z) = (star(z.re), -z.im)
Flat basis [1, u1, e2O, e3O, e4O, e5O, e6O, e7O]; κO1 = e4O = basis(4).
"""
from fractions import Fraction as F

# ---- recursive CD arithmetic on nested tuples of Fractions ----
def R_mul(x, y): return x * y
def R_star(x): return x
def R_add(x, y): return x + y
def R_sub(x, y): return x - y

def make_level(mul, star, add, sub):
    def lmul(z, w):
        (a, b) = z; (c, d) = w
        re = sub(mul(a, c), mul(star(d), b))
        im = add(mul(d, a), mul(b, star(c)))
        return (re, im)
    def lstar(z):
        (a, b) = z
        return (star(a), lneg(b))
    def ladd(z, w):
        (a, b) = z; (c, d) = w
        return (add(a, c), add(b, d))
    def lsub(z, w):
        (a, b) = z; (c, d) = w
        return (sub(a, c), sub(b, d))
    return lmul, lstar, ladd, lsub

def neg_gen():
    def n(z):
        if isinstance(z, tuple):
            return (n(z[0]), n(z[1]))
        return -z
    return n
lneg = neg_gen()

C_mul, C_star, C_add, C_sub = make_level(R_mul, R_star, R_add, R_sub)
H_mul, H_star, H_add, H_sub = make_level(C_mul, C_star, C_add, C_sub)
O_mul, O_star, O_add, O_sub = make_level(H_mul, H_star, H_add, H_sub)

def flat(z):
    ((za, zb), (zc, zd)) = z
    (a, b) = za; (c, d) = zb; (e, f) = zc; (g, h) = zd
    return [a, b, c, d, e, f, g, h]

def unflat(v):
    a, b, c, d, e, f, g, h = v
    return (((a, b), (c, d)), ((e, f), (g, h)))

def basis(i):
    v = [F(0)] * 8
    v[i] = F(1)
    return unflat(v)

def octmul(x, y): return O_mul(x, y)
def octstar(x): return O_star(x)
e = [basis(i) for i in range(8)]

# ---- 8x8 regular representation matrices over Fractions ----
def leftReg(x):
    M = [[F(0)] * 8 for _ in range(8)]
    for j in range(8):
        col = flat(octmul(x, basis(j)))
        for i in range(8):
            M[i][j] = col[i]
    return M

def rightReg(x):
    M = [[F(0)] * 8 for _ in range(8)]
    for j in range(8):
        col = flat(octmul(basis(j), x))
        for i in range(8):
            M[i][j] = col[i]
    return M

# gForm(x,y) = reQ(x * star y) = real part of x*star(y)
def gForm(x, y):
    return flat(octmul(x, octstar(y)))[0]

# crossOpO(a): y |-> a*y + gForm(a,y)*1
def crossOpO(a):
    M = [[F(0)] * 8 for _ in range(8)]
    for j in range(8):
        bj = basis(j)
        col = flat(octmul(a, bj))
        g = gForm(a, bj)
        col[0] += g  # + gForm*1  (1 is basis(0))
        for i in range(8):
            M[i][j] = col[i]
    return M

def matmul(A, B):
    n = 8
    Cc = [[F(0)] * n for _ in range(n)]
    for i in range(n):
        for k in range(n):
            if A[i][k] == 0: continue
            aik = A[i][k]
            for j in range(n):
                Cc[i][j] += aik * B[k][j]
    return Cc

def matadd(A, B): return [[A[i][j] + B[i][j] for j in range(8)] for i in range(8)]
def matsub(A, B): return [[A[i][j] - B[i][j] for j in range(8)] for i in range(8)]
def matscale(s, A): return [[s * A[i][j] for j in range(8)] for i in range(8)]
def comm(A, B): return matsub(matmul(A, B), matmul(B, A))
def trace(A): return sum(A[i][i] for i in range(8))
def iszero(A): return all(A[i][j] == 0 for i in range(8) for j in range(8))
def approxeq(A, B): return iszero(matsub(A, B))

# trace form B(A,C) = trace(A ∘ C)
def B(A, Cc): return trace(matmul(A, Cc))

u1 = e[1]; e2O = e[2]; e3O = e[3]; e4O = e[4]

# su(2)_L, su(2)_R
L1, L2, L3 = leftReg(u1), leftReg(e2O), leftReg(e3O)
R1, R2, R3 = rightReg(u1), rightReg(e2O), rightReg(e3O)
foldVec = matadd(L1, R1)
foldAx  = matsub(L1, R1)
Qc = crossOpO(u1)    # charge op lifted to spinor
Yc = crossOpO(e4O)   # hyper op lifted to spinor (κO1 = e4O)

print("=== sanity: octonion table ===")
print("u1*u1 =", flat(octmul(u1,u1)), "(expect -1 at 0)")
print("u1*e2O=", flat(octmul(u1,e2O)), "(e3O?)")
print("gForm(u1,u1)=", gForm(u1,u1), " gForm(e4O,e4O)=", gForm(e4O,e4O))

print("\n=== spinor trace-form self-lengths B(X,X) ===")
gens = {'L1':L1,'L2':L2,'L3':L3,'R1':R1,'R2':R2,'R3':R3,
        'foldVec':foldVec,'foldAx':foldAx,'Q=cross(u1)':Qc,'Y=cross(e4O)':Yc}
for name,M in gens.items():
    print(f"  B({name},{name}) = {B(M,M)}")

print("\n=== task-declared checks ===")
print("B(L1,L1)=", B(L1,L1), " B(R1,R1)=", B(R1,R1), " B(L1,R1)=", B(L1,R1), "(expect -8,-8,4)")
print("B(foldVec,foldVec)=", B(foldVec,foldVec), " B(foldAx,foldAx)=", B(foldAx,foldAx),
      " B(foldVec,foldAx)=", B(foldVec,foldAx), "(expect -8,-24,0)")

print("\n=== which neutral generators commute with ALL of su(2)_L on the spinor? ===")
for name,M in {'L1':L1,'R1':R1,'foldVec':foldVec,'foldAx':foldAx,'Q':Qc,'Y':Yc}.items():
    c1 = iszero(comm(M,L1)); c2 = iszero(comm(M,L2)); c3 = iszero(comm(M,L3))
    print(f"  {name}: [.,L1]=0?{c1} [.,L2]=0?{c2} [.,L3]=0?{c3}  -> commutes with su(2)_L? {c1 and c2 and c3}")

print("\n=== Gell-Mann-Nishijima on the spinor: is Q in span{T3=L1, Y-candidates}? ===")
# test Q = a*L1 + b*R1 solvable (operator identity) — Q ∈ span{L1,R1}?
# build linear system on the 64 matrix entries.
def flatten(M): return [M[i][j] for i in range(8) for j in range(8)]
import itertools
def in_span(target, basisMs):
    # solve least/exact via gaussian elim over Fractions
    A = [flatten(M) for M in basisMs]  # rows = basis vectors (len 64)
    t = flatten(target)
    # solve A^T c = t  (find c). Set up augmented columns.
    m = len(basisMs); n = 64
    # Build n x (m+1) matrix [A^T | t]
    mat = [[A[k][r] for k in range(m)] + [t[r]] for r in range(n)]
    # gaussian elim
    row = 0
    pivcols = []
    for col in range(m):
        piv = None
        for r in range(row, n):
            if mat[r][col] != 0: piv = r; break
        if piv is None: continue
        mat[row], mat[piv] = mat[piv], mat[row]
        pv = mat[row][col]
        mat[row] = [x / pv for x in mat[row]]
        for r in range(n):
            if r != row and mat[r][col] != 0:
                f = mat[r][col]
                mat[r] = [mat[r][j] - f*mat[row][j] for j in range(m+1)]
        pivcols.append(col); row += 1
        if row == n: break
    # check consistency: any row all-zero in first m but nonzero in last -> inconsistent
    consistent = True
    for r in range(n):
        if all(mat[r][j]==0 for j in range(m)) and mat[r][m] != 0:
            consistent = False; break
    return consistent

print("Q ∈ span{L1,R1}?", in_span(Qc, [L1,R1]))
print("Q ∈ span{L1,foldVec}?", in_span(Qc, [L1,foldVec]))
print("Q ∈ span{L1,Y}?", in_span(Qc, [L1,Yc]))
print("foldVec ∈ span{L1,R1}?", in_span(foldVec, [L1,R1]))
print("Y ∈ span{L1,R1}?", in_span(Yc, [L1,R1]))
print("Y ∈ span{foldVec,foldAx}?", in_span(Yc, [foldVec,foldAx]))

print("\n=== full neutral-torus Gram {L1,R1} and {foldVec,foldAx} ===")
print("Gram{L1,R1} = [[%s,%s],[%s,%s]]" % (B(L1,L1),B(L1,R1),B(R1,L1),B(R1,R1)))
print("Gram{foldVec,foldAx} = [[%s,%s],[%s,%s]]" % (B(foldVec,foldVec),B(foldVec,foldAx),B(foldAx,foldVec),B(foldAx,foldAx)))
