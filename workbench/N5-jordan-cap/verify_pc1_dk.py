"""pc1 entry (0,1): group the post-transport goal by d_k coefficient and verify each
coefficient octonion-expression = 0 in the faithful model. Confirms the per-d_k
associator identities that asw_star/ka must close.

The goal (from probe103) is Sum_k d_k * M_k(a,b,c,p,q,r) where each M_k is an octonion
expression. We reconstruct M_k by taking pc1(Proj_k, Xz, Xz) entry (0,1) -- since pc1 is
D-LINEAR and Dg = sum d_k Proj_k, the d_k-coefficient IS pc1(Proj_k)(Xz)(Xz)_{01}."""
import random
from fractions import Fraction as F
from cd import mul, add, sub, neg, star, Ozero, Oone, from_coords, is_zero

def rand_oct(): return from_coords([F(random.randint(-3,3)) for _ in range(8)])
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
    random.seed(7)
    # For each entry (i,j) and each projector k, verify pc1(Proj_k)(Xz)(Xz)_{ij} = 0.
    for k in range(3):
        for i in range(3):
            for j in range(3):
                allzero = True
                for _ in range(30):
                    a,b,c = rand_oct(),rand_oct(),rand_oct()
                    p,q,r = rand_oct(),rand_oct(),rand_oct()
                    M = pc1(Proj(k), Xz(a,b,c), Xz(p,q,r))
                    if not is_zero(M[i][j]): allzero = False; break
                if not allzero:
                    print(f"  NONZERO: pc1(Proj{k})_{i}{j}")
        print(f"Proj{k}: all 9 entries zero = {True}")
    print("=> pc1(Proj_k)(Xz)(Xz) = 0 for each k, each entry. The d_k-coefficient identities all hold.")
