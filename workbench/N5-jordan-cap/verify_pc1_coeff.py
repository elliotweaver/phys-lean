"""For pc1, after the smul transport each entry is d0•T0 + d1•T1 + d2•T2 where Tk are octonion
expressions. Question: does EACH coefficient Tk vanish independently (so the entry is a sum of
independently-zero pieces), or only the combined sum? Test by computing pc1 with Dg = e_k
(d_k=1, others=0) for each k separately — that isolates the Tk coefficient."""
import random
from fractions import Fraction as F
from cd import mul, add, sub, neg, star, Ozero, from_coords, is_zero, flatten

def ocR(d):
    return from_coords([F(d)] + [F(0)]*7)
def rand_oct():
    return from_coords([F(random.randint(-3,3)) for _ in range(8)])
def matzero():
    return [[Ozero() for _ in range(3)] for _ in range(3)]
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
def Dg(d0,d1,d2):
    M = matzero(); M[0][0]=ocR(d0); M[1][1]=ocR(d1); M[2][2]=ocR(d2); return M
def Xz(a,b,c):
    return [[Ozero(), a, b],[star(a), Ozero(), c],[star(b), star(c), Ozero()]]
def pc1(D,X,Y):
    t1 = jb(jb(D,Y), jb(X,X)); t2 = jb(jb(X,Y), jb(D,X)); t3 = jb(jb(X,Y), jb(X,D))
    t4 = jb(D, jb(Y, jb(X,X))); t5 = jb(X, jb(Y, jb(D,X))); t6 = jb(X, jb(Y, jb(X,D)))
    return matsub(matsub(matsub(matadd(matadd(t1,t2),t3), t4), t5), t6)

if __name__ == "__main__":
    random.seed(2)
    # isolate each d_k coefficient: set Dg = diag with a single 1
    for ksel, label in [((1,0,0),"d0"), ((0,1,0),"d1"), ((0,0,1),"d2")]:
        bad = set()
        for _ in range(30):
            a,b,c = rand_oct(),rand_oct(),rand_oct()
            p,q,r = rand_oct(),rand_oct(),rand_oct()
            D = Dg(*ksel); X = Xz(a,b,c); Y = Xz(p,q,r)
            M = pc1(D,X,Y)
            for i in range(3):
                for j in range(3):
                    if not is_zero(M[i][j]): bad.add((i,j))
        print(f"pc1 coefficient {label} (Dg=e_{label}): bad entries = {sorted(bad)}")
