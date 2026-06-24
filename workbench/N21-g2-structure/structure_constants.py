#!/usr/bin/env python3
"""
N21 numerics — INDEPENDENT reconstruction of the 14 derivations D0E..D13E directly
from the banked Lean definitions in Phys/Algebra/DerivationLowerBound.lean (NOT from
nullbasis.pkl — W6 independent re-verify), then:
  (1) verify each is a genuine derivation of the EXACT octonion product,
  (2) verify rank 14 (independent),
  (3) compute every bracket [Di,Dj] = Di@Dj - Dj@Di as an 8x8 matrix,
  (4) solve  sum_k c^k Dk = [Di,Dj]  over ℚ to read off the structure constants.

Reconnaissance only (NOT the deliverable). Everything EXACT (Fraction).
"""
from fractions import Fraction as F
from itertools import product

# ---------- exact octonion product (mirrors model.py / the banked Lean) ----------
def dbl_mul(z, w): return (z[0]*w[0] - z[1]*w[1], z[0]*w[1] + z[1]*w[0])
def dbl_star(z):   return (z[0], -z[1])
def dbl_add(z, w): return (z[0]+w[0], z[1]+w[1])
def dbl_neg(z):    return (-z[0], -z[1])
DBL_ZERO = (F(0), F(0))

def make_CD(mul, star, add, neg, zero):
    def cd_mul(z, w):
        zr, zi = z; wr, wi = w
        re = add(mul(zr, wr), neg(mul(star(wi), zi)))
        im = add(mul(wi, zr), mul(zi, star(wr)))
        return (re, im)
    def cd_star(z): return (star(z[0]), neg(z[1]))
    def cd_add(z, w): return (add(z[0], w[0]), add(z[1], w[1]))
    def cd_neg(z): return (neg(z[0]), neg(z[1]))
    return cd_mul, cd_star, cd_add, cd_neg, (zero, zero)

h_mul, h_star, h_add, h_neg, h_zero = make_CD(dbl_mul, dbl_star, dbl_add, dbl_neg, DBL_ZERO)
o_mul, o_star, o_add, o_neg, o_zero = make_CD(h_mul, h_star, h_add, h_neg, h_zero)

# coord index = oct_im*4 + h_im*2 + dbl_im
def o_from_vec(v):
    def dbl(b): return (v[b+0], v[b+1])
    def h(b):   return (dbl(b+0), dbl(b+2))
    return (h(0), h(4))
def o_to_vec(z):
    v = [None]*8
    for oi in (0,1):
        H = z[oi]
        for hi in (0,1):
            D = H[hi]
            for di in (0,1):
                v[oi*4 + hi*2 + di] = D[di]
    return v
def basis(i):
    v = [F(0)]*8; v[i] = F(1); return o_from_vec(v)
E = [basis(i) for i in range(8)]

# ---------- the 14 maps, transcribed from DerivationLowerBound.lean ----------
# Each entry: out[i] += coeff * c[j]  where c0..c7 are input coords.
# Lean output ⟨⟨⟨a,b⟩,⟨c,d⟩⟩,⟨⟨e,f⟩,⟨g,h⟩⟩⟩  ->  out = [a,b,c,d,e,f,g,h] in coord layout.
# row = output coord index, col = input coord index.
DMAPS = {
 0:  {2:(5,-1), 3:(4,1), 4:(3,-1), 5:(2,1)},
 1:  {2:(4,-1), 3:(5,-1), 4:(2,1), 5:(3,1)},
 2:  {2:(3,1), 3:(2,-1), 4:(5,-1), 5:(4,1)},
 3:  {1:(6,-1), 3:(4,-1), 4:(3,1), 6:(1,1)},
 4:  {1:(5,1), 2:(6,-1), 5:(1,-1), 6:(2,1)},
 5:  {1:(4,1), 3:(6,-1), 4:(1,-1), 6:(3,1)},
 6:  {1:(3,-1), 3:(1,1), 4:(6,-1), 6:(4,1)},
 7:  {1:(2,-1), 2:(1,1), 5:(6,-1), 6:(5,1)},
 8:  {1:(7,-1), 2:(4,1), 4:(2,-1), 7:(1,1)},
 9:  {1:(4,-1), 2:(7,-1), 4:(1,1), 7:(2,1)},
 10: {1:(5,1), 3:(7,-1), 5:(1,-1), 7:(3,1)},
 11: {1:(2,1), 2:(1,-1), 4:(7,-1), 7:(4,1)},
 12: {1:(3,-1), 3:(1,1), 5:(7,-1), 7:(5,1)},
 13: {2:(3,-1), 3:(2,1), 6:(7,-1), 7:(6,1)},
}
def to_matrix(spec):
    M = [[F(0)]*8 for _ in range(8)]
    for row, (col, coeff) in spec.items():
        M[row][col] = F(coeff)
    return M
D = [to_matrix(DMAPS[k]) for k in range(14)]

def apply(M, vec):
    return [sum(M[i][j]*vec[j] for j in range(8)) for i in range(8)]

# ---------- (1) each is a genuine derivation of the EXACT product ----------
def is_derivation(M):
    for i in range(8):
        for j in range(8):
            xy = o_to_vec(o_mul(E[i], E[j]))
            lhs = apply(M, xy)
            Dei = o_from_vec(apply(M, o_to_vec(E[i])))
            Dej = o_from_vec(apply(M, o_to_vec(E[j])))
            rhs = o_to_vec(o_add(o_mul(Dei, E[j]), o_mul(E[i], Dej)))
            if lhs != rhs:
                return False, (i, j)
    return True, None

print("=== (1) derivation check (EXACT octonion product) ===")
all_der = True
for k in range(14):
    ok, bad = is_derivation(D[k])
    if not ok:
        all_der = False
        print(f"  D{k}: NOT a derivation, fails at e{bad[0]}*e{bad[1]}")
print("  all 14 are genuine derivations:", all_der)

# ---------- (2) rank 14 (flatten to 64-vectors) ----------
def flat(M): return [M[i][j] for i in range(8) for j in range(8)]
def rank(rows):
    rows = [r[:] for r in rows]
    r = 0; ncol = len(rows[0])
    for c in range(ncol):
        piv = None
        for i in range(r, len(rows)):
            if rows[i][c] != 0: piv = i; break
        if piv is None: continue
        rows[r], rows[piv] = rows[piv], rows[r]
        pv = rows[r][c]
        rows[r] = [x/pv for x in rows[r]]
        for i in range(len(rows)):
            if i != r and rows[i][c] != 0:
                f = rows[i][c]
                rows[i] = [a - f*b for a,b in zip(rows[i], rows[r])]
        r += 1
        if r == len(rows): break
    return r
print("\n=== (2) independence ===")
print("  rank of the 14 flattened matrices:", rank([flat(D[k]) for k in range(14)]), "(expect 14)")

# ---------- bracket and structure-constant solve ----------
def matmul(A, B):
    return [[sum(A[i][k]*B[k][j] for k in range(8)) for j in range(8)] for i in range(8)]
def matsub(A, B):
    return [[A[i][j]-B[i][j] for j in range(8)] for i in range(8)]
def bracket(A, B):
    return matsub(matmul(A, B), matmul(B, A))

# basis as columns of a 64x14 matrix; solve coords for a target 64-vector.
BASIS_COLS = [flat(D[k]) for k in range(14)]  # 14 rows of length 64
def solve_in_basis(target):
    """Return list of 14 Fractions c s.t. sum c_k D_k = target, or None."""
    # Solve  A^T c = target  where A^T is 64x14. Use augmented [A^T | target], 64 eqns.
    # Build rows: for each of 64 coords, [D0[coord],...,D13[coord], target[coord]]
    rows = []
    for coord in range(64):
        rows.append([BASIS_COLS[k][coord] for k in range(14)] + [target[coord]])
    # Gaussian elimination over 14 unknowns
    r = 0
    pivcols = []
    for c in range(14):
        piv = None
        for i in range(r, len(rows)):
            if rows[i][c] != 0: piv = i; break
        if piv is None: continue
        rows[r], rows[piv] = rows[piv], rows[r]
        pv = rows[r][c]
        rows[r] = [x/pv for x in rows[r]]
        for i in range(len(rows)):
            if i != r and rows[i][c] != 0:
                f = rows[i][c]
                rows[i] = [a - f*b for a,b in zip(rows[i], rows[r])]
        pivcols.append(c); r += 1
    # check consistency: any row with all-zero coeff but nonzero rhs -> no solution
    for i in range(len(rows)):
        if all(rows[i][c] == 0 for c in range(14)) and rows[i][14] != 0:
            return None
    c = [F(0)]*14
    for idx, col in enumerate(pivcols):
        c[col] = rows[idx][14]
    return c

print("\n=== (3)(4) structure constants  [Di,Dj] = sum_k c^k Dk ===")
table = {}
closed = True
for i in range(14):
    for j in range(i+1, 14):
        Bk = bracket(D[i], D[j])
        c = solve_in_basis(flat(Bk))
        if c is None:
            closed = False
            print(f"  [D{i},D{j}] NOT in span(D)!")
            continue
        terms = [(k, c[k]) for k in range(14) if c[k] != 0]
        table[(i,j)] = terms
        s = " + ".join(f"({v})*D{k}" for k,v in terms) if terms else "0"
        print(f"  [D{i},D{j}] = {s}")
print("\n  bracket closes in span(D):", closed)

# integrality + count of nonzero structure constants
import collections
coeffvals = collections.Counter()
for terms in table.values():
    for _, v in terms:
        coeffvals[v] += 1
print("  distinct nonzero structure-constant values:", dict(coeffvals))
print("  number of nonzero brackets:", sum(1 for t in table.values() if t))
