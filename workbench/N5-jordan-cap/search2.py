"""
Fast n=4 witness search + defect-to-associator trace.
Uses fast.py octonion table (verified == banked CD).
"""
import itertools
from fractions import Fraction as F
from fast import (omul,oadd,osub,oneg,ostar,oz,oeq,ois0,E,assoc)

n=4
def mzero(): return [[oz() for _ in range(n)] for _ in range(n)]
def madd(A,B): return [[oadd(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    C=mzero()
    for i in range(n):
        for j in range(n):
            s=oz()
            for k in range(n): s=oadd(s,omul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def mdiff(A,B): return [[osub(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mz(A): return all(ois0(A[i][j]) for i in range(n) for j in range(n))
def Eij(i,j,a):
    A=mzero(); A[i][j]=a[:]; A[j][i]=ostar(a); return A
def defect(X,Y): return mdiff(jb(jb(X,Y),jb(X,X)), jb(X,jb(Y,jb(X,X))))

# Single-pair witness search: X at (i,j) entry e_p, Y at (k,l) entry e_q
results=[]
for (i,j) in itertools.combinations(range(n),2):
    for (k,l) in itertools.combinations(range(n),2):
        for p in range(1,8):
            for q in range(1,8):
                X=Eij(i,j,E[p]); Y=Eij(k,l,E[q])
                D=defect(X,Y)
                if not mz(D):
                    span=len(set([i,j,k,l]))
                    results.append((span,(i,j,p),(k,l,q),D))
results.sort(key=lambda r:r[0])
print("nonzero single-pair witnesses:",len(results))
if results:
    print("min span:",results[0][0])
    span_min=results[0][0]
    smallest=[r for r in results if r[0]==span_min]
    print(f"witnesses at min span {span_min}: {len(smallest)}")
    # pick the lexicographically simplest
    r=smallest[0]
    print("CHOSEN witness:")
    print("  X = E[%d,%d]=e%d (+ herm)"%(r[1][0],r[1][1],r[1][2]))
    print("  Y = E[%d,%d]=e%d (+ herm)"%(r[2][0],r[2][1],r[2][2]))
    D=r[3]
    for i in range(n):
        for j in range(n):
            if not ois0(D[i][j]):
                print(f"    defect[{i}][{j}] = {D[i][j]}")
    # any single-pair witness inside indices {0,1,2}? (would break the n=3 claim if so)
    in3=[x for x in results if max(x[1][0],x[1][1],x[2][0],x[2][1])<=2]
    print("single-pair witnesses inside 3x3 block:",len(in3))
