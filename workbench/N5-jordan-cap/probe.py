"""Fast probe: n=3 holds, n=4 fails, with small counts."""
import random
from fractions import Fraction as F
from cd import mul, add, star, Ozero, eq, from_coords

def mzero(n): return [[Ozero() for _ in range(n)] for _ in range(n)]
def madd(A,B):
    n=len(A); return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mzero(n)
    for i in range(n):
        for j in range(n):
            s=Ozero()
            for k in range(n): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def meq(A,B):
    n=len(A); return all(eq(A[i][j],B[i][j]) for i in range(n) for j in range(n))
def rand_oct(rng): return from_coords([F(rng.randint(-1,1)) for _ in range(8)])
def rand_real(rng): return from_coords([F(rng.randint(-1,1))]+[F(0)]*7)
def rand_herm(n,rng):
    A=mzero(n)
    for i in range(n):
        A[i][i]=rand_real(rng)
        for j in range(i+1,n):
            x=rand_oct(rng); A[i][j]=x; A[j][i]=star(x)
    return A
def jid(X,Y):
    return meq(jb(jb(X,Y),jb(X,X)), jb(X,jb(Y,jb(X,X))))

rng=random.Random(1)
for n in (3,):
    f=sum(0 if jid(rand_herm(n,rng),rand_herm(n,rng)) else 1 for _ in range(200))
    print(f"n={n}: failures/200 = {f}")
rng=random.Random(2)
for n in (4,):
    f=0
    for _ in range(300):
        if not jid(rand_herm(n,rng),rand_herm(n,rng)): f+=1
    print(f"n={n}: failures/300 = {f}")
