#!/usr/bin/env python3
# FAST pc2 grouping finder. D = central diagonal scalars d0,d1,d2 (commute + associate with
# everything). X,Y free noncommutative nonassociative matrices. Represent each octonion
# expression term as (coeff:int, dscalars:sorted tuple of d-indices, tree) where tree is the
# bracketed product of X/Y atoms (D never appears in a tree -- it is always a pulled-out
# central scalar). This sidesteps the slow nuclear-NF fixpoint.
from collections import defaultdict
from itertools import product as iproduct

# A polynomial is dict: key=(dmultiset:tuple_sorted, tree) -> coeff
def pmul(P, Q):
    # (d1, t1)*(d2, t2) = (d1+d2 sorted, ('*',t1,t2)).  central scalars merge; trees concatenate.
    r = defaultdict(int)
    for (d1, t1), c1 in P.items():
        for (d2, t2), c2 in Q.items():
            if t1 is None and t2 is None:
                tree = None
            elif t1 is None:
                tree = t2
            elif t2 is None:
                tree = t1
            else:
                tree = ('*', t1, t2)
            dm = tuple(sorted(d1 + d2))
            r[(dm, tree)] += c1 * c2
    return {k: v for k, v in r.items() if v}
def padd(*Ps):
    r = defaultdict(int)
    for P in Ps:
        for k, v in P.items(): r[k] += v
    return {k: v for k, v in r.items() if v}
def pneg(P): return {k: -v for k, v in P.items()}
def psub(A, B): return padd(A, pneg(B))

def atom(name): return {((), name): 1}          # an X/Y entry, tree=name string
def dscalar(i): return {((i,), None): 1}         # central scalar d_i, no tree

def MZ(): return [[dict() for _ in range(3)] for _ in range(3)]
def Madd(A, B): return [[padd(A[i][j], B[i][j]) for j in range(3)] for i in range(3)]
def Msub(A, B): return [[psub(A[i][j], B[i][j]) for j in range(3)] for i in range(3)]
def Mmul(A, B):
    C = MZ()
    for i in range(3):
        for j in range(3):
            acc = dict()
            for k in range(3): acc = padd(acc, pmul(A[i][k], B[k][j]))
            C[i][j] = acc
    return C
def J(A, B): return Madd(Mmul(A, B), Mmul(B, A))

def Dg():  # central scalar diagonal
    M = MZ(); M[0][0] = dscalar(0); M[1][1] = dscalar(1); M[2][2] = dscalar(2); return M
def Mfull(p):
    M = MZ()
    for i in range(3):
        for j in range(3): M[i][j] = atom(f'{p}{i}{j}')
    return M

D = Dg(); X = Mfull('x'); Y = Mfull('y')
T1 = J(J(D,Y), J(D,X))
T2 = J(J(D,Y), J(X,D))
T3 = J(J(X,Y), J(D,D))
T4 = J(D, J(Y, J(D,X)))
T5 = J(D, J(Y, J(X,D)))
T6 = J(X, J(Y, J(D,D)))

def nz(M): return sum(1 for i in range(3) for j in range(3) if M[i][j])
def show(name, M): print(f"  {name}: nonzero entries = {nz(M)}")

print("pc2 = T1+T2+T3 -T4-T5-T6.  D = CENTRAL scalar diagonal, X,Y arbitrary free.")
full = Msub(Msub(Madd(T1, Madd(T2, T3)), Madd(T4, T5)), T6)
show("FULL pc2", full)
print("  pc2 identically zero (central scalars + free nonassoc, NO nuclearity-as-tree):", nz(full) == 0)
print()
print("Pairing probes (which sub-combinations are identically zero):")
show("T1 - T4", Msub(T1, T4))
show("T2 - T5", Msub(T2, T5))
show("T3 - T6", Msub(T3, T6))
show("(T1+T2) - (T4+T5)", Msub(Madd(T1,T2), Madd(T4,T5)))
show("(T1+T2+T3)-(T4+T5+T6) [=full]", full)
show("T1 - T6", Msub(T1, T6))
show("T1+T2+T3", Madd(T1, Madd(T2, T3)))
show("T4+T5+T6", Madd(T4, Madd(T5, T6)))
show("(T1+T2+T3) - (T4+T5+T6)", Msub(Madd(T1,Madd(T2,T3)), Madd(T4,Madd(T5,T6))))
