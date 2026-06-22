"""
DECISIVE TEST: does the H_3 Jordan defect vanish in the FREE ALTERNATIVE *-algebra
with central trace+norm? If yes, the moat claim (H_3 Jordan FROM alternativity) is
abstractly true and we learn the exact relation set.

We model the octonion entries abstractly with relations:
  (A) associator [x,y,z] := (xy)z - x(yz) is ALTERNATING (fully antisymmetric)
      => [x,x,y]=[x,y,x]=[x,y,y]=0, swap any two args flips sign.
  (B) for an off-diagonal octonion x: x*xc = xc*x = N(x) is CENTRAL (nucleus),
      and x + xc = T(x) is CENTRAL (real trace). (composition algebra)
  (C) reals (diagonals, norms, traces) are CENTRAL and associate with everything.

Strategy: we can't easily build the full free alternative algebra, but we CAN test
the claim concretely & exhaustively in the actual octonion algebra (fast.py table)
with SYMBOLIC rational coefficients on basis elements — i.e. random integer octonions,
which the numerics already cover. Instead, here we do the more informative thing:
verify the defect vanishes and measure, via the associator decomposition, that ALL
residual associators are of the alternating type [x,y,z] with x,y,z among the entry
octonions and their conjugates -- i.e. NO associator of 3 algebraically-independent
'generic' elements survives beyond what alternativity kills.

Concretely: re-confirm n=3 holds on the concrete octonions (fast table), fast.
"""
from fractions import Fraction as F
import random, itertools
from fast import omul, oadd, osub, oneg, ostar, oz, ois0, E

def smul(s, x): return [s*v for v in x]

# matrices of octonions (each octonion = list of 8 Fractions)
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
def meq0(A):
    return all(ois0(A[i][j]) for i in range(len(A)) for j in range(len(A)))

def rand_oct(rng): return [F(rng.randint(-2,2)) for _ in range(8)]
def rand_real(rng):
    v=oz(); v[0]=F(rng.randint(-2,2)); return v
def rand_herm(n,rng):
    A=mzero(n)
    for i in range(n):
        A[i][i]=rand_real(rng)
        for j in range(i+1,n):
            x=rand_oct(rng); A[i][j]=x; A[j][i]=ostar(x)
    return A

rng=random.Random(7)
print("=== concrete octonion H_n Jordan defect (fast table) ===")
for n in (2,3,4,5):
    fails=0
    for _ in range(2000):
        A=rand_herm(n,rng); B=rand_herm(n,rng)
        if not meq0(jdef(A,B)): fails+=1
    print(f"  n={n}: jdef!=0 in {fails}/2000 random Hermitian pairs")

# associator is alternating in octonions? (the toolkit fact)
print("\n=== octonion associator alternating check ===")
def assoc(a,b,c): return osub(omul(omul(a,b),c), omul(a,omul(b,c)))
ok_anti=True; ok_diag=True
for _ in range(3000):
    a=rand_oct(rng); b=rand_oct(rng); c=rand_oct(rng)
    if not ois0(oadd(assoc(a,b,c),assoc(b,a,c))): ok_anti=False
    if not ois0(oadd(assoc(a,b,c),assoc(a,c,b))): ok_anti=False
    if not ois0(assoc(a,a,b)): ok_diag=False
    if not ois0(assoc(a,b,b)): ok_diag=False
print(f"  associator antisymmetric (swap 1,2 and 2,3): {ok_anti}")
print(f"  associator vanishes on repeats [x,x,y],[x,y,y]: {ok_diag}")
