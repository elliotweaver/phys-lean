"""Verify pc1 = polarCross1(Dg)(Xz)(Xz) = 0 and pc2 = polarCross2(Dg)(Xz)(Xz) = 0
   entrywise in the faithful CD octonion model. Dg = diag(ocR d0, ocR d1, ocR d2) where
   ocR d = numeric constant in the deepest-real slot. Xz = zero-diag Hermitian off-part."""
import random
from fractions import Fraction as F
from cd import mul, add, sub, neg, star, Ozero, from_coords, eq, is_zero, flatten

# ocR d: rational d embedded in deepest-real slot (= d * Oone()), a central constant.
def ocR(d):
    return from_coords([F(d)] + [F(0)]*7)

def rand_oct():
    return from_coords([F(random.randint(-3,3)) for _ in range(8)])

# 3x3 matrices as list-of-lists of octonions.
def matzero():
    return [[Ozero() for _ in range(3)] for _ in range(3)]

def matadd(A,B):
    return [[add(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def matsub(A,B):
    return [[sub(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def matmul(A,B):
    C = matzero()
    for i in range(3):
        for j in range(3):
            s = Ozero()
            for k in range(3):
                s = add(s, mul(A[i][k], B[k][j]))
            C[i][j] = s
    return C

def jb(A,B):
    return matadd(matmul(A,B), matmul(B,A))

def Dg(d0,d1,d2):
    M = matzero()
    M[0][0]=ocR(d0); M[1][1]=ocR(d1); M[2][2]=ocR(d2)
    return M

def Xz(a,b,c):
    return [[Ozero(), a, b],
            [star(a), Ozero(), c],
            [star(b), star(c), Ozero()]]

# polarCross1 (deg-1): jb(jb D Y)(jb X X) + jb(jb X Y)(jb D X) + jb(jb X Y)(jb X D)
#   - jb D (jb Y (jb X X)) - jb X (jb Y (jb D X)) - jb X (jb Y (jb X D))
def pc1(D,X,Y):
    t1 = jb(jb(D,Y), jb(X,X))
    t2 = jb(jb(X,Y), jb(D,X))
    t3 = jb(jb(X,Y), jb(X,D))
    t4 = jb(D, jb(Y, jb(X,X)))
    t5 = jb(X, jb(Y, jb(D,X)))
    t6 = jb(X, jb(Y, jb(X,D)))
    return matsub(matsub(matsub(matadd(matadd(t1,t2),t3), t4), t5), t6)

# polarCross2 (deg-2): jb(jb D Y)(jb D X) + jb(jb D Y)(jb X D) + jb(jb X Y)(jb D D)
#   - jb D (jb Y (jb D X)) - jb D (jb Y (jb X D)) - jb X (jb Y (jb D D))
def pc2(D,X,Y):
    t1 = jb(jb(D,Y), jb(D,X))
    t2 = jb(jb(D,Y), jb(X,D))
    t3 = jb(jb(X,Y), jb(D,D))
    t4 = jb(D, jb(Y, jb(D,X)))
    t5 = jb(D, jb(Y, jb(X,D)))
    t6 = jb(X, jb(Y, jb(D,D)))
    return matsub(matsub(matsub(matadd(matadd(t1,t2),t3), t4), t5), t6)

def check(name, fn, trials=40):
    bad = 0
    badentries = set()
    for _ in range(trials):
        d0,d1,d2 = [random.randint(-3,3) for _ in range(3)]
        a,b,c = rand_oct(), rand_oct(), rand_oct()
        p,q,r = rand_oct(), rand_oct(), rand_oct()
        D = Dg(d0,d1,d2)
        X = Xz(a,b,c)
        Y = Xz(p,q,r)
        M = fn(D,X,Y)
        for i in range(3):
            for j in range(3):
                if not is_zero(M[i][j]):
                    bad += 1
                    badentries.add((i,j))
    print(f"{name}: {trials} trials, nonzero-entry-instances={bad}, bad entries={sorted(badentries)}")

if __name__ == "__main__":
    random.seed(1)
    check("pc1 (deg-1, alternativity kernel)", pc1)
    check("pc2 (deg-2, centrality kernel)", pc2)
    # also full polarCross = pc1 + pc2
    def pcfull(D,X,Y):
        return matadd(pc1(D,X,Y), pc2(D,X,Y))
    check("polarCross = pc1+pc2", pcfull)
