"""Does jdef(A,B)=0 hold when A is a real-diagonal (central) matrix and B is ARBITRARY
(not necessarily Hermitian)?  And the symmetric: B real-diagonal, A arbitrary?
This tests the cleanest abstract slice (centrality-forced)."""
from fractions import Fraction as F
import random
from fast import omul, oadd, osub, oneg, ostar, oz, ois0

def mzero(n): return [[oz() for _ in range(n)] for _ in range(n)]
def madd(A,B):
    n=len(A); return [[oadd(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mzero(n)
    for i in range(n):
        for j in range(n):
            s=oz()
            for k in range(n): s=oadd(s,omul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[oneg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def is0(A): return all(ois0(A[i][j]) for i in range(len(A)) for j in range(len(A)))
def rand_oct(rng): return [F(rng.randint(-2,2)) for _ in range(8)]
def real_oct(r): 
    v=oz(); v[0]=F(r); return v

rng=random.Random(99)
for n in (2,3,4,5):
    # A real diagonal central, B arbitrary (full, opaque)
    f=0
    for _ in range(400):
        A=mzero(n)
        for i in range(n): A[i][i]=real_oct(rng.randint(-3,3))
        B=[[rand_oct(rng) for _ in range(n)] for _ in range(n)]
        if not is0(jdef(A,B)): f+=1
    print(f"n={n}: A real-diagonal central, B ARBITRARY: jdef!=0 in {f}/400")
