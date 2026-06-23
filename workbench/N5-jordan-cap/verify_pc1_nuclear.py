"""Is pc1(D)(X)(Y)=0 when D is NUCLEAR (e.g. projector / central-diagonal), for various X,Y?
Test: (1) D=Proj_k, X,Y arbitrary (NOT Hermitian); (2) D=Proj_k, X,Y = Xz (Hermitian);
(3) D = central real diagonal numeric, X,Y arbitrary.
If pc1(nuclear D) = 0 for ARBITRARY X,Y, there is a clean abstract structural lemma
(like jdef_nuc_first) avoiding coordinate work."""
import random
from fractions import Fraction as F
from cd import mul, add, sub, star, Ozero, Oone, from_coords, is_zero

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
def randmat():
    return [[rand_oct() for _ in range(3)] for _ in range(3)]
def pc1(D,X,Y):
    t1 = jb(jb(D,Y), jb(X,X)); t2 = jb(jb(X,Y), jb(D,X)); t3 = jb(jb(X,Y), jb(X,D))
    t4 = jb(D, jb(Y, jb(X,X))); t5 = jb(X, jb(Y, jb(D,X))); t6 = jb(X, jb(Y, jb(X,D)))
    return matsub(matsub(matsub(matadd(matadd(t1,t2),t3), t4), t5), t6)

def allzero(M):
    return all(is_zero(M[i][j]) for i in range(3) for j in range(3))

if __name__ == "__main__":
    random.seed(11)
    # (1) D=Proj_k, X,Y ARBITRARY (not Hermitian)
    for k in range(3):
        bad = set()
        for _ in range(40):
            X, Y = randmat(), randmat()
            M = pc1(Proj(k), X, Y)
            for i in range(3):
                for j in range(3):
                    if not is_zero(M[i][j]): bad.add((i,j))
        print(f"(1) pc1(Proj{k}, ARBITRARY X,Y): bad entries = {sorted(bad)}")
    # (2) D=Proj_k, X,Y = Xz Hermitian
    for k in range(3):
        bad = set()
        for _ in range(40):
            a,b,c,p,q,r = [rand_oct() for _ in range(6)]
            M = pc1(Proj(k), Xz(a,b,c), Xz(p,q,r))
            for i in range(3):
                for j in range(3):
                    if not is_zero(M[i][j]): bad.add((i,j))
        print(f"(2) pc1(Proj{k}, Xz, Xz): bad entries = {sorted(bad)}")
    # (3) X = Xz Hermitian, Y arbitrary
    for k in range(3):
        bad = set()
        for _ in range(40):
            a,b,c = [rand_oct() for _ in range(3)]
            Y = randmat()
            M = pc1(Proj(k), Xz(a,b,c), Y)
            for i in range(3):
                for j in range(3):
                    if not is_zero(M[i][j]): bad.add((i,j))
        print(f"(3) pc1(Proj{k}, Xz, ARBITRARY Y): bad entries = {sorted(bad)}")
