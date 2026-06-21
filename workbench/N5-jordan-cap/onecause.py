"""
Confirm the ONE-CAUSE link structure for the minimal n=4 witness:
  X[1][2]=e1, X[1][3]=e7 (+herm);  Y[0][2]=e5 (+herm).
  defect[0][1] = -4 e4.

(a) If entries are drawn from an ASSOCIATIVE subalgebra (quaternions H = span{1,e1,e2,e3}),
    the Jordan identity should HOLD (defect=0) -> associativity forces Jordan.
    We can't use e5,e7 (octonionic) in H, but we test the CLAIM "assoc entries => holds"
    by checking the witness layout with associative entries.
(b) Express defect[0][1] exactly as an octonion associator of the entries.
"""
import itertools, random
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
            for k in range(n):
                if any(A[i][k]) and any(B[k][j]): s=oadd(s,omul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def mdiff(A,B): return [[osub(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def setp(A,i,j,a): A[i][j]=a[:]; A[j][i]=ostar(a)
def defect(X,Y):
    XX=jb(X,X)
    return mdiff(jb(jb(X,Y),XX), jb(X,jb(Y,XX)))

# (a) test: replace octonion mul with an ASSOCIATIVE product on the SAME 8 coords
#     i.e. use a generic associative algebra. Quaternions sit in coords {0,1,2,3}.
#     Build a quaternion-only analogue of the witness (map e1->e1, e7->e2, e5->e3 inside H).
Xq=mzero(); setp(Xq,1,2,E[1]); setp(Xq,1,3,E[2])
Yq=mzero(); setp(Yq,0,2,E[3])
# but H={1,e1,e2,e3} closed? e1*e2=e3 etc. Check defect with quaternion entries:
Dq=defect(Xq,Yq)
print("quaternion-entry witness defect all zero (assoc => Jordan holds)?",
      all(ois0(Dq[i][j]) for i in range(n) for j in range(n)))

# (b) the real octonion witness
X=mzero(); setp(X,1,2,E[1]); setp(X,1,3,E[7])
Y=mzero(); setp(Y,0,2,E[5])
D=defect(X,Y)
print("octonion witness defect[0][1] =", [v for v in D[0][1]])
print("octonion witness defect[1][0] =", [v for v in D[1][0]])
# associator candidates among {e5,e1,e7} and conjugates
print("assoc(e5,e1,e7) =", [v for v in assoc(E[5],E[1],E[7])])
print("-2*assoc(e5,e1,e7) =", [-2*v for v in assoc(E[5],E[1],E[7])])
# does defect[0][1] == -2*assoc(e5,e1,e7)?
target=[-2*v for v in assoc(E[5],E[1],E[7])]
print("defect[0][1] == -2*assoc(e5,e1,e7)?", D[0][1]==target)
