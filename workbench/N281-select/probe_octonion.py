"""
N281 SELECT — numerical probe on the fold's ACTUAL octonion table (exact CD convention).

CD convention (Phys/Cascade/Double.lean):
  (z*w).re = z.re*w.re - star(w.im)*z.im
  (z*w).im = w.im*z.re + z.im*star(w.re)
  star(z) = (star(z.re), -z.im)

O = CD(H), H = CD(C), C = CD(R). Flat basis [a,b,c,d,e,f,g,h] = [1,u1,e2O,e3O,e4O,e5O,e6O,e7O]
  where e0=1, e1=u1=i, e2=j, e3=k(=i*j) span ImH; e4=ℓ; e5,e6,e7 span ℓ·ImH.
"""
import numpy as np
from fractions import Fraction as F

# ---- recursive CD product on nested tuples ----
def mkmul(base_mul, base_star):
    def mul(z, w):
        (a, b) = z; (c, d) = w
        re = base_mul(a, c) - base_mul(base_star(d), b)  # actually order matters; use exact:
        # exact: z.re*w.re - star(w.im)*z.im ; im = w.im*z.re + z.im*star(w.re)
        re = base_sub(base_mul(a, c), base_mul(base_star(d), b))
        im = base_add(base_mul(d, a), base_mul(b, base_star(c)))
        return (re, im)
    return mul

# We'll implement with explicit real arithmetic on nested tuples of Fractions.
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

def neg_gen(neg):
    def n(z):
        if isinstance(z, tuple):
            return (n(z[0]), n(z[1]))
        return -z
    return n
lneg = neg_gen(None)

# Build C, H, O levels
C_mul, C_star, C_add, C_sub = make_level(R_mul, R_star, R_add, R_sub)
H_mul, H_star, H_add, H_sub = make_level(C_mul, C_star, C_add, C_sub)
O_mul, O_star, O_add, O_sub = make_level(H_mul, H_star, H_add, H_sub)

# flatten/unflatten octonion <-> 8-vector
def flat(z):
    ((za, zb), (zc, zd)) = z  # z = (p,q), p=(z0,w0), q=(z1,w1); each = (re,im) reals
    (a, b) = za; (c, d) = zb; (e, f) = zc; (g, h) = zd
    return [a, b, c, d, e, f, g, h]

def unflat(v):
    a, b, c, d, e, f, g, h = v
    return (((a, b), (c, d)), ((e, f), (g, h)))

def basis(i):
    v = [F(0)] * 8
    v[i] = F(1)
    return unflat(v)

# verify multiplication table quick: e1*e1 should be -1
def octmul(x, y): return O_mul(x, y)

# left/right regular matrices (8x8) over Fractions
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

def matmul(A, B):
    n = 8
    C = [[F(0)] * n for _ in range(n)]
    for i in range(n):
        for k in range(n):
            if A[i][k] == 0: continue
            for j in range(n):
                C[i][j] += A[i][k] * B[k][j]
    return C

def matadd(A, B): return [[A[i][j] + B[i][j] for j in range(8)] for i in range(8)]
def matsub(A, B): return [[A[i][j] - B[i][j] for j in range(8)] for i in range(8)]
def matscale(s, A): return [[s * A[i][j] for j in range(8)] for i in range(8)]
def comm(A, B): return matsub(matmul(A, B), matmul(B, A))
def ident(): return [[F(1) if i == j else F(0) for j in range(8)] for i in range(8)]
def iszero(A): return all(A[i][j] == 0 for i in range(8) for j in range(8))
def matstr(A):
    return "\n".join(" ".join(f"{int(A[i][j]) if A[i][j].denominator==1 else A[i][j]:>3}" for j in range(8)) for i in range(8))

# sanity: e1^2 = -1, e1*e2 = e3 (check octonion table)
e = [basis(i) for i in range(8)]
print("e1*e1 =", flat(octmul(e[1], e[1])), "(expect -1 at pos0)")
print("e1*e2 =", flat(octmul(e[1], e[2])), "(e3?)")
print("e2*e1 =", flat(octmul(e[2], e[1])), "(-e3?)")
print("e4*e1 =", flat(octmul(e[4], e[1])), "  e1*e4 =", flat(octmul(e[1], e[4])))

# ================= su(2)_L = leftReg{e1,e2,e3}, su(2)_R = rightReg{e1,e2,e3} =================
L1, L2, L3 = leftReg(e[1]), leftReg(e[2]), leftReg(e[3])
R1, R2, R3 = rightReg(e[1]), rightReg(e[2]), rightReg(e[3])

print("\n=== su(2)_L closure/Casimir on FULL O ===")
c12 = comm(L1, L2)          # expect relate to L3
print("[L1,L2] - 2 L3 zero on O?", iszero(matsub(c12, matscale(F(2), L3))))
casL = matadd(matadd(matmul(L1, L1), matmul(L2, L2)), matmul(L3, L3))
print("Casimir_L = ", "-3*I ?", casL == matscale(F(-3), ident()))

print("\n=== su(2)_R closure/Casimir ===")
c12r = comm(R1, R2)
print("[R1,R2] + 2 R3 zero on O?", iszero(matadd(c12r, matscale(F(2), R3))))
casR = matadd(matadd(matmul(R1, R1), matmul(R2, R2)), matmul(R3, R3))
print("Casimir_R = -3*I ?", casR == matscale(F(-3), ident()))

# ================= DIRECTION A: parity / asymmetry of the two hands =================
print("\n=== DIRECTION A: is there a fold-derived asymmetry between L and R hands? ===")
# JO = leftReg(e1) = the colour complex structure (N201/N266). Test how each hand relates to JO.
JO = L1
print("[JO, L2] (=L on e1*e2 sort) zero?", iszero(comm(JO, L2)))
print("[JO, R2] zero?", iszero(comm(JO, R2)))
# The 'orientation': L closes +2, R closes -2. Check the mixed [L_i,R_j] on O (should be nonzero = assoc)
print("[L1,R2] zero on O?", iszero(comm(L1, R2)), " [L2,R3] zero?", iszero(comm(L2, R3)))
# Is there ANY operator built from the fold that commutes with one hand but not the other?
# The doubling map ell = leftReg(e4)? test.
