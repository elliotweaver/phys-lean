"""
(1) Confirm: in an ASSOCIATIVE ring, unscaled jb(a,b)=ab+ba satisfies the Jordan
    identity  jb(jb(X,Y),jb(X,X)) = jb(X,jb(Y,jb(X,X)))  -- test on 2x2 rational matrices.
(2) Find an octonion basis associator equal to defect[0][1] = -4 e4 (lands on e4).
"""
import itertools, random
from fractions import Fraction as F
from fast import omul,oadd,osub,oneg,ostar,oz,ois0,E,assoc

# (1) 2x2 rational matrices (associative, noncommutative)
def mm(A,B):
    return [[sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)] for i in range(2)]
def ma(A,B): return [[A[i][j]+B[i][j] for j in range(2)] for i in range(2)]
def jbm(A,B): return ma(mm(A,B),mm(B,A))
def meq(A,B): return all(A[i][j]==B[i][j] for i in range(2) for j in range(2))
rng=random.Random(3); bad=0
for _ in range(2000):
    X=[[F(rng.randint(-3,3)) for _ in range(2)] for _ in range(2)]
    Y=[[F(rng.randint(-3,3)) for _ in range(2)] for _ in range(2)]
    L=jbm(jbm(X,Y),jbm(X,X)); R=jbm(X,jbm(Y,jbm(X,X)))
    if not meq(L,R): bad+=1
print(f"(1) associative-ring unscaled Jordan identity failures/2000: {bad}")

# (2) basis associators landing on e4
print("(2) basis triples (a,b,c in 1..7) with assoc on e4 only:")
for a,b,c in itertools.product(range(1,8),repeat=3):
    v=assoc(E[a],E[b],E[c])
    if v[4]!=0 and all(v[k]==0 for k in range(8) if k!=4):
        print(f"   [e{a},e{b},e{c}] = {v[4]} e4")
