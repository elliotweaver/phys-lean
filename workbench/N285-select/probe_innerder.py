"""
N285 SELECT measure-first probe — the f₄ ⊋ g₂ crux.

Question: is the arena's inner-multiplication commutator
    innerMul A B := [L_A, L_B],   L_A X = jb A X = A*X + X*A
a genuine DERIVATION of the Jordan bracket jb on Matrix(Fin 3)(Fin 3)(O ℚ)?
  D(jb X Y) =? jb (D X) Y + jb X (D Y),   D = innerMul A B.

We test on:
  (a) FULL matrix space (general A,B,X,Y) — classical: only for SPECIAL Jordan
      algebras (associative coords). Over octonions M₃(O) is NOT special, so this
      is expected to FAIL for general matrices.
  (b) HERMITIAN arena H₃(O) (A,B,X,Y self-adjoint) — H₃(O) IS a genuine Jordan
      algebra (jdef=0), so [L_A,L_B] SHOULD be a derivation there.

Also: is innerMul (of Hermitian A,B) OUTSIDE the entrywise gauge g₂?
  g₂ = jAct D acts entrywise and FIXES the diagonal (jAct_Dg = 0).
  N274 innerMul_moves_diagonal already shows innerMul moves the diagonal, so it is
  not entrywise — we reconfirm numerically.

Exact Fraction arithmetic on the fold's real octonion table (CD convention from
Phys/Cascade/Double.lean), reusing N283's octonion multiplication.
"""
from fractions import Fraction as F
import random

# ---- recursive CD arithmetic on nested tuples of Fractions (from N283 probe) ----
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

# octonion zero and basis
def Ozero():
    return ((( F(0),F(0)),(F(0),F(0))), ((F(0),F(0)),(F(0),F(0))))

def flat(z):
    ((za, zb), (zc, zd)) = z
    (a, b) = za; (c, d) = zb; (e, f) = zc; (g, h) = zd
    return [a,b,c,d,e,f,g,h]

def unflat(v):
    a,b,c,d,e,f,g,h = v
    return (((a,b),(c,d)), ((e,f),(g,h)))

def Orand():
    return unflat([F(random.randint(-3,3)) for _ in range(8)])

# ---- 3x3 octonion matrices as list-of-lists ----
N = 3
def Mzero():
    return [[Ozero() for _ in range(N)] for _ in range(N)]

def Madd(A, B):
    return [[O_add(A[i][j], B[i][j]) for j in range(N)] for i in range(N)]
def Msub(A, B):
    return [[O_sub(A[i][j], B[i][j]) for j in range(N)] for i in range(N)]
def Mmul(A, B):
    C = Mzero()
    for i in range(N):
        for j in range(N):
            acc = Ozero()
            for k in range(N):
                acc = O_add(acc, O_mul(A[i][k], B[k][j]))
            C[i][j] = acc
    return C
def Mstar_transpose(A):  # conjugate transpose (Hermitian adjoint)
    return [[O_star(A[j][i]) for j in range(N)] for i in range(N)]

def jb(A, B):
    return Madd(Mmul(A, B), Mmul(B, A))

def Lmul(A):
    return lambda X: jb(A, X)

def innerMul(A, B):
    def D(X):
        return Msub(jb(A, jb(B, X)), jb(B, jb(A, X)))
    return D

def Mrand():
    return [[Orand() for _ in range(N)] for _ in range(N)]

def Mherm_rand():
    # build a self-adjoint (Hermitian) octonion matrix: real diagonal, conj off-diag
    A = Mzero()
    for i in range(N):
        # real diagonal (embed a rational as octonion real part)
        r = F(random.randint(-3,3))
        A[i][i] = unflat([r,F(0),F(0),F(0),F(0),F(0),F(0),F(0)])
    for i in range(N):
        for j in range(i+1, N):
            o = Orand()
            A[i][j] = o
            A[j][i] = O_star(o)
    return A

def Mis_zero(A):
    for i in range(N):
        for j in range(N):
            if any(x != 0 for x in flat(A[i][j])):
                return False
    return True

def deriv_defect(D, X, Y):
    # D(jb X Y) - jb (D X) Y - jb X (D Y)
    lhs = D(jb(X, Y))
    rhs = Madd(jb(D(X), Y), jb(X, D(Y)))
    return Msub(lhs, rhs)

random.seed(12345)

print("=== TEST (a): innerMul a derivation on the FULL matrix space (general A,B,X,Y)? ===")
fails_full = 0
for _ in range(200):
    A, B, X, Y = Mrand(), Mrand(), Mrand(), Mrand()
    D = innerMul(A, B)
    if not Mis_zero(deriv_defect(D, X, Y)):
        fails_full += 1
print(f"  general (non-Hermitian): {fails_full}/200 trials had NONZERO derivation defect")
print(f"  => innerMul is {'NOT' if fails_full>0 else ''} a derivation on the full matrix space")

print()
print("=== TEST (b): innerMul(Hermitian A,B) a derivation on HERMITIAN arguments (H₃(O))? ===")
fails_herm = 0
for _ in range(200):
    A, B, X, Y = Mherm_rand(), Mherm_rand(), Mherm_rand(), Mherm_rand()
    D = innerMul(A, B)
    if not Mis_zero(deriv_defect(D, X, Y)):
        fails_herm += 1
print(f"  Hermitian A,B,X,Y: {fails_herm}/200 trials had NONZERO derivation defect")
print(f"  => innerMul(Herm) IS {'NOT ' if fails_herm>0 else ''}a Jordan derivation on H₃(O)")

print()
print("=== TEST (c): does innerMul(Herm A,B) preserve the Hermitian subspace? ===")
# a derivation of H₃(O) must map Hermitian -> Hermitian
fails_pres = 0
for _ in range(200):
    A, B, X = Mherm_rand(), Mherm_rand(), Mherm_rand()
    DX = innerMul(A, B)(X)
    if not Mis_zero(Msub(DX, Mstar_transpose(DX))):
        fails_pres += 1
print(f"  innerMul(Herm A,B)(Herm X) self-adjoint: {200-fails_pres}/200 preserved Hermitian")

print()
print("=== TEST (d): innerMul moves the diagonal (outside entrywise g₂, which fixes diag)? ===")
# reproduce N274 innerMul_moves_diagonal spirit: a diagonal input -> off-diagonal output
# slotA a = a at (0,1) & star a at (1,0); slotB b at (0,2)&(2,0); Dg d0 d1 d2 = diag
def slot(i, j, a):
    A = Mzero(); A[i][j] = a; A[j][i] = O_star(a); return A
def Dg(d0, d1, d2):
    A = Mzero()
    A[0][0] = unflat([F(d0)]+[F(0)]*7)
    A[1][1] = unflat([F(d1)]+[F(0)]*7)
    A[2][2] = unflat([F(d2)]+[F(0)]*7)
    return A
one = unflat([F(1)]+[F(0)]*7)
A = slot(0,1,one); B = slot(0,2,one); X = Dg(0,0,1)
DX = innerMul(A, B)(X)
print(f"  innerMul(slotA 1)(slotB 1)(Dg 0 0 1) nonzero: {not Mis_zero(DX)} (expect True; moves diag->off-diag)")
# show it is genuinely off-diagonal content at (1,2)/(2,1)
print(f"  entry (1,2) = {flat(DX[1][2])}  entry (2,1) = {flat(DX[2][1])}")

print()
print("=== SUMMARY ===")
print(f"  full-space derivation: {'FAILS (expected — M₃(O) not special)' if fails_full>0 else 'holds'}")
print(f"  Hermitian derivation:  {'HOLDS (H₃(O) is a genuine Jordan algebra)' if fails_herm==0 else 'FAILS (unexpected!)'}")
print(f"  Hermitian preserved:   {'YES' if fails_pres==0 else 'NO'}")
