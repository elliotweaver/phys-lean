"""
Scout TRACTABLE genuine partials of the H_3 Jordan identity (concrete octonions, fast table).
Which restricted configurations make jdef = 0, to pick the strongest cheap bankable slice?

  (P1) A = real diagonal (central), B = general Hermitian.
  (P2) A,B entries all in a 2-generated octonion subalgebra (Artin -> associative).
  (P3) A general, B = real diagonal.
  (P4) one off-diagonal slot active (a single octonion direction) on each.
"""
from fractions import Fraction as F
import random
from fast import omul, oadd, osub, oneg, ostar, oz, ois0, E

def mzero(n): return [[oz() for _ in range(n)] for _ in range(n)]
def madd(A,B):
    n=len(A); return [[oadd(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mzero(n)
    for i in range(n):
        for j in range(n):
            s=oz()
            for k in range(n):
                if any(A[i][k]) and any(B[k][j]): s=oadd(s,omul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[oneg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def is0(A): return all(ois0(A[i][j]) for i in range(len(A)) for j in range(len(A)))

def rand_oct(rng): return [F(rng.randint(-2,2)) for _ in range(8)]
def rand_real(rng):
    v=oz(); v[0]=F(rng.randint(-2,2)); return v
def rand_in_subalg(rng, gens):
    # random integer combo of products of two generators (2-generated subalgebra)
    import itertools
    sub=[E[0]]+[g[:] for g in gens]
    sub.append(omul(gens[0],gens[1]))
    v=oz()
    for b in sub:
        c=F(rng.randint(-2,2)); v=oadd(v,[c*x for x in b])
    return v

def herm(n, rng, diag_real=True, entry=None):
    A=mzero(n)
    for i in range(n):
        A[i][i]= rand_real(rng) if diag_real else rand_oct(rng)
        for j in range(i+1,n):
            x=entry(rng) if entry else rand_oct(rng)
            A[i][j]=x; A[j][i]=ostar(x)
    return A

rng=random.Random(11)
n=3
# P1: A real diagonal, B general
f=0
for _ in range(300):
    A=mzero(n)
    for i in range(n): A[i][i]=rand_real(rng)
    B=herm(n,rng)
    if not is0(jdef(A,B)): f+=1
print(f"P1 (A real diagonal, B general Hermitian): jdef!=0 in {f}/300")

# P3: A general, B real diagonal
f=0
for _ in range(300):
    A=herm(n,rng)
    B=mzero(n)
    for i in range(n): B[i][i]=rand_real(rng)
    if not is0(jdef(A,B)): f+=1
print(f"P3 (A general Hermitian, B real diagonal): jdef!=0 in {f}/300")

# P2: entries in a single 2-generated subalgebra (Artin => associative)
f=0
for _ in range(200):
    g1=rand_oct(rng); g2=rand_oct(rng)
    ent=lambda r: rand_in_subalg(r,[g1,g2])
    A=herm(n,rng,entry=ent); B=herm(n,rng,entry=ent)
    if not is0(jdef(A,B)): f+=1
print(f"P2 (entries in one 2-generated subalgebra, Artin-assoc): jdef!=0 in {f}/200")

# P4: only ONE octonion direction across all off-diagonals (e.g. all entries scalar multiples of a fixed unit + reals)
f=0
for _ in range(200):
    u=rand_oct(rng)
    ent=lambda r: [F(r.randint(-2,2))*x for x in u]
    A=herm(n,rng,entry=ent); B=herm(n,rng,entry=ent)
    if not is0(jdef(A,B)): f+=1
print(f"P4 (all off-diag entries in span(1,u) one direction): jdef!=0 in {f}/200")
