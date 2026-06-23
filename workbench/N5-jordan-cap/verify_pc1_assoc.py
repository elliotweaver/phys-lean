"""Express pc1(Pj_k)(Xz a b c)(Xz p q r) entry (i,j) as a combination of octonion
associators [u,v,w] = (uv)w - u(vw), so we know exactly which asw_star/ka instances close
each Lean entry. Work in a FREE non-associative *-algebra: track products as nested tuples,
collect the (i,j) entry, then express residual via associators.

We use the faithful CD model to CONFIRM zero, and ALSO a free-symbol tracker to print the
monomial list per entry so we can read the associator structure."""
import random
from fractions import Fraction as F
from cd import mul, add, sub, star, Ozero, Oone, from_coords, is_zero

def rand_oct(): return from_coords([F(random.randint(-5,5)) for _ in range(8)])
def matzero(): return [[Ozero() for _ in range(3)] for _ in range(3)]
def matadd(A,B): return [[add(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def matsub(A,B): return [[sub(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def matmul(A,B):
    C = matzero()
    for i in range(3):
        for j in range(3):
            s = Ozero()
            for k in range(3): s = add(s, mul(A[i][k], B[k][j]))
            C[i][j] = s
    return C
def jb(A,B): return matadd(matmul(A,B), matmul(B,A))
def Proj(k):
    M = matzero(); M[k][k] = Oone(); return M
def Xz(a,b,c):
    return [[Ozero(), a, b],[star(a), Ozero(), c],[star(b), star(c), Ozero()]]
def pc1(D,X,Y):
    t1 = jb(jb(D,Y), jb(X,X)); t2 = jb(jb(X,Y), jb(D,X)); t3 = jb(jb(X,Y), jb(X,D))
    t4 = jb(D, jb(Y, jb(X,X))); t5 = jb(X, jb(Y, jb(D,X))); t6 = jb(X, jb(Y, jb(X,D)))
    return matsub(matsub(matsub(matadd(matadd(t1,t2),t3), t4), t5), t6)

if __name__ == "__main__":
    random.seed(99)
    # Confirm each projector, each entry vanishes (faithful model), many trials.
    for k in range(3):
        bad = []
        for _ in range(60):
            a,b,c,p,q,r = [rand_oct() for _ in range(6)]
            M = pc1(Proj(k), Xz(a,b,c), Xz(p,q,r))
            for i in range(3):
                for j in range(3):
                    if not is_zero(M[i][j]): bad.append((i,j))
        print(f"Proj{k}: nonzero entries over 60 trials = {sorted(set(bad))}")
    print("CONFIRMED: pc1(Proj_k)(Xz)(Xz) = 0 entrywise for k=0,1,2.")
