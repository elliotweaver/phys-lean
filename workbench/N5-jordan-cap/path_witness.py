"""
Hand-constructed n=4 witness on a path 1-2-3-4 (0-indexed 0-1-2-3).
Goal: show the defect entry equals (up to sign/known factor) an octonion
ASSOCIATOR  [a,b,c] = (a b) c - a (b c)  of three basis units -> ONE-CAUSE link.

X has off-diagonal entries linking 0-1 and 2-3; Y links 1-2.
Then products X Y X etc. chain across all 4 indices 0-1-2-3, forcing the
triple product of the three octonion entries to appear with two bracketings.
"""
from fractions import Fraction as F
from cd import mul, add, sub, neg, star, Ozero, Oone, eq, is_zero, from_coords, basis, flatten

n=4
def mzero(): return [[Ozero() for _ in range(n)] for _ in range(n)]
def madd(A,B): return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    C=mzero()
    for i in range(n):
        for j in range(n):
            s=Ozero()
            for k in range(n): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def mdiff(A,B): return [[sub(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def E(i,j,a):
    A=mzero(); A[i][j]=a; A[j][i]=star(a); return A
def assoc(a,b,c): return sub(mul(mul(a,b),c), mul(a,mul(b,c)))
def show(o): return flatten(o)

EE=[basis(k) for k in range(8)]
# use imaginary units e1=i, e2=j, e4=l type; pick three that don't associate
a=EE[1]; b=EE[2]; c=EE[4]
print("assoc[e1,e2,e4] =", show(assoc(a,b,c)))

X = madd(E(0,1,a), E(2,3,c))
Y = E(1,2,b)
D = mdiff(jb(jb(X,Y),jb(X,X)), jb(X,jb(Y,jb(X,X))))
print("defect nonzero?:", any(not is_zero(D[i][j]) for i in range(n) for j in range(n)))
for i in range(n):
    for j in range(n):
        if not is_zero(D[i][j]):
            print(f"  D[{i}][{j}] =", show(D[i][j]))
