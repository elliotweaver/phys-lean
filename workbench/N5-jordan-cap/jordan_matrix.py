"""
Hermitian matrix Jordan tower over the octonions O ℚ, testing the CAP at n=3.

Carrier H_n(O): n×n matrices M with entries in O, M_ji = star(M_ij), diagonal real.
Matrix product (non-associative entries): (AB)_ij = sum_k A_ik * B_kj.
UNSCALED symmetric (Jordan) bracket:  jb(A,B) = A*B + B*A   (avoids 1/2).
Jordan identity (homogeneous form):
    jb( jb(X,Y), jb(X,X) )  ==  jb( X, jb(Y, jb(X,X)) )

We test:
  (i)  n=3: identity holds for ALL Hermitian X,Y (random sampling, exact ℚ)
  (ii) n=4: identity FAILS on a concrete Hermitian witness
  and trace the n=4 defect to a NON-ASSOCIATOR of the octonion entries.
"""
import random
from fractions import Fraction as F
from cd import (mul, add, sub, neg, star, Ozero, Oone, eq, is_zero,
                from_coords, basis, flatten)

# ---- matrices as list-of-lists of octonions ----
def mzero(n):
    return [[Ozero() for _ in range(n)] for _ in range(n)]

def madd(A, B):
    n = len(A)
    return [[add(A[i][j], B[i][j]) for j in range(n)] for i in range(n)]

def mmul(A, B):
    n = len(A)
    C = mzero(n)
    for i in range(n):
        for j in range(n):
            s = Ozero()
            for k in range(n):
                s = add(s, mul(A[i][k], B[k][j]))
            C[i][j] = s
    return C

def jb(A, B):
    """unscaled Jordan bracket A*B + B*A"""
    return madd(mmul(A, B), mmul(B, A))

def meq(A, B):
    n = len(A)
    return all(eq(A[i][j], B[i][j]) for i in range(n) for j in range(n))

def is_hermitian(A):
    n = len(A)
    for i in range(n):
        for j in range(n):
            if not eq(A[j][i], star(A[i][j])):
                return False
    return True

# ---- random Hermitian octonion matrix ----
def rand_oct(rng):
    return from_coords([F(rng.randint(-2, 2)) for _ in range(8)])

def rand_real_oct(rng):
    """a real (scalar) octonion = rational * 1"""
    return from_coords([F(rng.randint(-2, 2))] + [F(0)] * 7)

def rand_herm(n, rng):
    A = mzero(n)
    for i in range(n):
        A[i][i] = rand_real_oct(rng)          # diagonal real
        for j in range(i + 1, n):
            x = rand_oct(rng)
            A[i][j] = x
            A[j][i] = star(x)
    return A

def jordan_identity_holds(X, Y):
    lhs = jb(jb(X, Y), jb(X, X))
    rhs = jb(X, jb(Y, jb(X, X)))
    return meq(lhs, rhs)

if __name__ == "__main__":
    rng = random.Random(20260621)

    # sanity: Jordan bracket of Hermitians is Hermitian
    for _ in range(50):
        X = rand_herm(3, rng); Y = rand_herm(3, rng)
        assert is_hermitian(X) and is_hermitian(Y)
        assert is_hermitian(jb(X, Y)), "Jordan bracket not Hermitian!"

    # (i) n=3 : identity holds for all sampled Hermitian X, Y
    print("=== n=3 : Jordan identity over H_3(O) ===")
    fails3 = 0
    for _ in range(3000):
        X = rand_herm(3, rng); Y = rand_herm(3, rng)
        if not jordan_identity_holds(X, Y):
            fails3 += 1
    print(f"  n=3 Jordan-identity failures in 3000 random Hermitian pairs: {fails3}")

    # also n=1, n=2 (should hold) and n=3 again with bigger entries
    for n in (1, 2, 3):
        fn = 0
        for _ in range(2000):
            X = rand_herm(n, rng); Y = rand_herm(n, rng)
            if not jordan_identity_holds(X, Y):
                fn += 1
        print(f"  n={n}: failures in 2000 = {fn}")

    # (ii) n>=4 : the identity FAILS
    print("=== n=4 : Jordan identity over H_4(O) ===")
    for n in (4, 5):
        fn = 0
        first = None
        for _ in range(4000):
            X = rand_herm(n, rng); Y = rand_herm(n, rng)
            if not jordan_identity_holds(X, Y):
                fn += 1
                if first is None:
                    first = (X, Y)
        print(f"  n={n}: failures in 4000 = {fn}")
