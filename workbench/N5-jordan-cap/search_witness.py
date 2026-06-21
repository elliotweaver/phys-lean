"""
Find the SIMPLEST n=4 Hermitian witness violating the Jordan identity,
and trace the defect octonion to an ASSOCIATOR [a,b,c] = (ab)c - a(bc)
of octonion basis elements -> the ONE-CAUSE link to non-associativity.

Strategy: use matrices supported on single off-diagonal Hermitian pairs with
BASIS-octonion entries. Try to localize the defect to 3 distinct off-diagonal
slots forming a path 1-2-3-4 (needs 4 indices => impossible inside a 3x3 block).
"""
import itertools
from fractions import Fraction as F
from cd import mul, add, sub, neg, star, Ozero, Oone, eq, is_zero, from_coords, basis, flatten

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
def mdiff(A,B):
    n=len(A); return [[sub(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mzero_p(A):
    n=len(A); return all(is_zero(A[i][j]) for i in range(n) for j in range(n))

def herm_unit(n, i, j, a):
    """Hermitian matrix with (i,j)=a, (j,i)=star(a), else 0 (i!=j)."""
    A=mzero(n); A[i][j]=a; A[j][i]=star(a); return A

def defect(X,Y):
    return mdiff(jb(jb(X,Y),jb(X,X)), jb(X,jb(Y,jb(X,X))))

def assoc(a,b,c):
    return sub(mul(mul(a,b),c), mul(a,mul(b,c)))

def coords(o): return flatten(o)

# octonion basis e0=1, e1..e7 imaginary
E = [basis(k) for k in range(8)]

if __name__ == "__main__":
    n=4
    # Search: X = single Hermitian pair at (i,j) with basis entry e_p,
    #         Y = single Hermitian pair at (k,l) with basis entry e_q.
    # Find combos with NONZERO defect, minimizing index span.
    found=[]
    for (i,j) in itertools.combinations(range(n),2):
        for (k,l) in itertools.combinations(range(n),2):
            for p in range(1,8):
                for q in range(1,8):
                    X=herm_unit(n,i,j,E[p])
                    Y=herm_unit(n,k,l,E[q])
                    D=defect(X,Y)
                    if not mzero_p(D):
                        # which indices does the witness touch
                        idxs=set([i,j,k,l])
                        found.append((len(idxs),(i,j,p),(k,l,q)))
    found.sort()
    print("total nonzero single-pair witnesses:", len(found))
    print("min index-span among them:", found[0][0] if found else None)
    # show a few with the smallest span
    for rec in found[:8]:
        print(rec)

    # Does any single-pair witness exist using only indices {0,1,2} (a 3x3 block)?
    in3=[r for r in found if max(max(r[1][0],r[1][1]),max(r[2][0],r[2][1]))<=2]
    print("single-pair witnesses living inside 3x3 block (indices<=2):", len(in3))
