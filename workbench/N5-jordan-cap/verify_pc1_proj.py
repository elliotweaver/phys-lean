"""D-linearity route for pc1. P_k = diagonal projector (1 at k, 0 else, genuine ring 1/0).
   Verify pc1(P_k, Xz(a,b,c), Xz(p,q,r)) is entrywise zero for each k -- the pure-octonion
   pieces that the coordinate route should close (no ocR literals)."""
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
    random.seed(3)
    for k in range(3):
        bad = set()
        for _ in range(40):
            a,b,c = rand_oct(),rand_oct(),rand_oct()
            p,q,r = rand_oct(),rand_oct(),rand_oct()
            M = pc1(Proj(k), Xz(a,b,c), Xz(p,q,r))
            for i in range(3):
                for j in range(3):
                    if not is_zero(M[i][j]): bad.add((i,j))
        print(f"pc1(Proj({k}), Xz, Xz): bad entries = {sorted(bad)}")
    # ALSO with single-Y-gen (the bb-scale split), to see if coordinate route stays small
    for k in range(3):
        bad = set()
        for _ in range(40):
            a,b,c = rand_oct(),rand_oct(),rand_oct()
            p = rand_oct()
            M = pc1(Proj(k), Xz(a,b,c), Xz(p,Ozero(),Ozero()))
            for i in range(3):
                for j in range(3):
                    if not is_zero(M[i][j]): bad.add((i,j))
        print(f"pc1(Proj({k}), Xz(abc), Xz(p,0,0)): bad entries = {sorted(bad)}")
