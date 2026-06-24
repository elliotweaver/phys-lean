#!/usr/bin/env python3
"""
N16 — derivation linear system over O ℚ. EXACT rational rank/nullity.

A derivation D is a ℚ-linear endo (8x8 matrix M, D(e_i)=sum_a M[a,i] e_a)
satisfying the Leibniz law on all basis pairs:
  D(e_i e_j) = D(e_i) e_j + e_i D(e_j),  for all i,j.

Coordinate b of the equation for pair (i,j):
  sum_k C[i,j,k] M[b,k]  -  sum_a M[a,i] C[a,j,b]  -  sum_a M[a,j] C[i,a,b]  =  0
512 equations, 64 unknowns M[a,i].  Compute rank & nullity (expect nullity 14).
"""
from fractions import Fraction as F
from model import C  # structure constants, exact

N = 8
# unknown index: u(a,i) = a*8 + i
def u(a, i): return a*N + i
NU = N*N  # 64

rows = []
for i in range(N):
    for j in range(N):
        for b in range(N):
            row = [F(0)]*NU
            # + sum_k C[i][j][k] M[b][k]
            for k in range(N):
                row[u(b, k)] += C[i][j][k]
            # - sum_a M[a][i] C[a][j][b]
            for a in range(N):
                row[u(a, i)] -= C[a][j][b]
            # - sum_a M[a][j] C[i][a][b]
            for a in range(N):
                row[u(a, j)] -= C[i][a][b]
            if any(c != 0 for c in row):
                rows.append(row)

print(f"raw nonzero equations: {len(rows)}  unknowns: {NU}")

# Gaussian elimination over ℚ -> rank, and a basis of the null space.
def rref(M, ncols):
    M = [r[:] for r in M]
    pivots = []
    r = 0
    for c in range(ncols):
        piv = None
        for rr in range(r, len(M)):
            if M[rr][c] != 0:
                piv = rr; break
        if piv is None: continue
        M[r], M[piv] = M[piv], M[r]
        inv = F(1)/M[r][c]
        M[r] = [x*inv for x in M[r]]
        for rr in range(len(M)):
            if rr != r and M[rr][c] != 0:
                f = M[rr][c]
                M[rr] = [a - f*b for a,b in zip(M[rr], M[r])]
        pivots.append(c)
        r += 1
        if r == len(M): break
    return M, pivots

R, pivots = rref(rows, NU)
rank = len(pivots)
nullity = NU - rank
print(f"rank = {rank}   nullity = {nullity}")
print(f"==> dim Der(O ℚ) = {nullity}")

# Build explicit null-space basis (each free variable -> one derivation matrix)
pivset = set(pivots)
free = [c for c in range(NU) if c not in pivset]
# express pivot vars in terms of free vars from R
nullbasis = []
for fcol in free:
    vec = [F(0)]*NU
    vec[fcol] = F(1)
    for ri, pc in enumerate(pivots):
        # row ri: pivot col pc = - sum_{free} R[ri][f]*x_f
        s = F(0)
        for fc in free:
            s += R[ri][fc]*vec[fc]
        vec[pc] = -s
    nullbasis.append(vec)

print(f"null basis size: {len(nullbasis)}")

# sanity: each null vector really satisfies all equations
for vec in nullbasis:
    for row in rows:
        assert sum(a*b for a,b in zip(row, vec)) == 0
print("all null basis vectors verified to satisfy the derivation equations.")

# reshape into 8x8 matrices, report sparsity
def asmat(vec):
    return [[vec[u(a,i)] for i in range(N)] for a in range(N)]
mats = [asmat(v) for v in nullbasis]

# Check column 0 (D(e0)=D(1)) is zero for all -> derivations kill the unit
allunit0 = all(all(m[a][0]==0 for a in range(N)) for m in mats)
print(f"D(1)=0 for every basis derivation: {allunit0}")
# Check the imaginary block is preserved: row 0 (e0-component of D(e_i)) zero for i>=1?
preserve_imag = all(all(m[0][i]==0 for i in range(1,N)) for m in mats)
print(f"D preserves imaginary subspace (e0-row 0 for i>=1): {preserve_imag}")

import pickle
with open("nullbasis.pkl","wb") as fh:
    pickle.dump({"mats":[[[str(x) for x in row] for row in m] for m in mats],
                 "C":[[[str(x) for x in C[i][j]] for j in range(8)] for i in range(8)]}, fh)
print("saved nullbasis.pkl")
