#!/usr/bin/env python3
"""N19/N20 lower-bound analysis (W6 re-verify + plan the Lean independence route).

Re-verifies the 14-element integer-sparse basis from nullbasis.pkl against the
EXACT octonion product (model.py's structure constants C), confirms rank 14, and
finds the unitriangular-functional route that avoids a 14x14 determinant in Lean.
"""
import pickle, sys, os, io, contextlib
from fractions import Fraction as F

HERE = os.path.dirname(os.path.abspath(__file__))
N16 = os.path.join(HERE, '..', 'N16-g2-dimension')
os.chdir(N16)
sys.path.insert(0, N16)

# import model.py (it prints a table on import; suppress it)
with contextlib.redirect_stdout(io.StringIO()):
    import model
C = model.C   # C[i][j][k]: e_i*e_j = sum_k C[i][j][k] e_k
N = 8

d = pickle.load(open('nullbasis.pkl', 'rb'))
mats = [[[F(x) for x in row] for row in m] for m in d['mats']]
print(f"loaded {len(mats)} basis matrices {len(mats[0])}x{len(mats[0][0])}")

def is_derivation(M):
    # Leibniz: M(e_i e_j) = (M e_i) e_j + e_i (M e_j), columns = images of basis
    for i in range(N):
        for j in range(N):
            # LHS = M applied to (e_i e_j) = sum_k C[i][j][k] * (M e_k); M e_k = column k
            lhs = [F(0)]*N
            for k in range(N):
                cij = C[i][j][k]
                if cij:
                    for a in range(N):
                        lhs[a] += cij * M[a][k]
            # RHS = (M e_i) e_j + e_i (M e_j); M e_i = column i = [M[a][i]]
            rhs = [F(0)]*N
            for a in range(N):
                mi = M[a][i]
                if mi:
                    for k in range(N):
                        rhs[k] += mi * C[a][j][k]
                mj = M[a][j]
                if mj:
                    for k in range(N):
                        rhs[k] += mj * C[i][a][k]
            if lhs != rhs:
                return False
    return True

all_der = all(is_derivation(M) for M in mats)
print(f"all {len(mats)} are derivations of the EXACT octonion product: {all_der}")

# rank over Q (flatten 8x8 -> 64)
rows = [[m[a][i] for a in range(N) for i in range(N)] for m in mats]
def rank_Q(rows):
    rows = [r[:] for r in rows]; nr = len(rows); nc = len(rows[0]); r = 0; pivots = []
    for c in range(nc):
        piv = next((rr for rr in range(r, nr) if rows[rr][c] != 0), None)
        if piv is None: continue
        rows[r], rows[piv] = rows[piv], rows[r]
        pv = rows[r][c]; rows[r] = [x/pv for x in rows[r]]
        for rr in range(nr):
            if rr != r and rows[rr][c] != 0:
                f = rows[rr][c]; rows[rr] = [a-f*b for a,b in zip(rows[rr], rows[r])]
        pivots.append(c); r += 1
        if r == nr: break
    return r, pivots
rk, piv = rank_Q(rows)
print(f"rank (flattened 64-dim, col index a*8+i): {rk}, pivots: {piv}")

# unitriangular-functional route: a coord (out a, in i) where M_k is the UNIQUE nonzero
print("\n--- unitriangular functional route ---")
ucoords = []
for k in range(len(mats)):
    found = None
    for a in range(N):
        for i in range(N):
            if mats[k][a][i] != 0 and all(mats[j][a][i] == 0 for j in range(len(mats)) if j != k):
                found = (a, i, mats[k][a][i]); break
        if found: break
    ucoords.append(found)
    print(f"D{k}: unique (out={found[0]}, in={found[1]}) val {found[2]}" if found else f"D{k}: NONE")
if all(u is not None for u in ucoords):
    print("\n==> every Dk has a coord where it is the unique nonzero among the 14.")
    print("    phi_k(D):=(D e_{in})_{out} => phi_k(D_j)=c_k delta_kj (diagonal) => independent => dim>=14.")
    print("    (out,in) coords:", [(u[0], u[1]) for u in ucoords])
