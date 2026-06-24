#!/usr/bin/env python3
"""
N22 route-deciding numerics (reconnaissance, NOT the deliverable).

Reuses the BANKED 14 derivations D0E..D13E (transcribed from DerivationLowerBound.lean,
identical to workbench/N21-g2-structure/structure_constants.py — W6 independent re-verify)
and the proved bracket table. Decides the honest TRUE target for N22:

  (1) the structure-constant table c^k_{ij}  (= the banked br_* table)
  (2) the Killing form K(X,Y) = tr(ad X . ad Y) on the 14-dim basis; its rank
      (nondegenerate => semisimple, Cartan) and definiteness (definite => COMPACT
      form => NOT the split Serre g₂ ℚ — so a literal LieEquiv to LieAlgebra.g₂ ℚ
      would be FALSE; the true invariant is simple/compact-type-G₂).
  (3) the 7-dim representation on Im(O ℚ): each Dk maps Im->Im (row/col 0 are zero),
      restrict to the 7 imaginary coords, check the restriction is FAITHFUL (the 14
      restricted 7x7 matrices are still independent) => the G₂ fundamental 7-rep.
"""
from fractions import Fraction as F
import collections

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
def o_from_vec(v):
    def dbl(b): return (v[b+0], v[b+1])
    def h(b):   return (dbl(b+0), dbl(b+2))
    return (h(0), h(4))
def o_to_vec(z):
    v=[None]*8
    for oi in (0,1):
        H=z[oi]
        for hi in (0,1):
            D=H[hi]
            for di in (0,1):
                v[oi*4+hi*2+di]=D[di]
    return v
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return o_from_vec(v)
E=[basis(i) for i in range(8)]

# ---------- the 14 maps (transcribed from DerivationLowerBound.lean) ----------
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
    M=[[F(0)]*8 for _ in range(8)]
    for row,(col,coeff) in spec.items():
        M[row][col]=F(coeff)
    return M
D=[to_matrix(DMAPS[k]) for k in range(14)]
def apply(M,vec): return [sum(M[i][j]*vec[j] for j in range(8)) for i in range(8)]
def flat(M): return [M[i][j] for i in range(8) for j in range(8)]
def matmul(A,B,n): return [[sum(A[i][k]*B[k][j] for k in range(n)) for j in range(n)] for i in range(n)]
def matsub(A,B,n): return [[A[i][j]-B[i][j] for j in range(n)] for i in range(n)]
def bracket8(A,B): return matsub(matmul(A,B,8),matmul(B,A,8),8)

# verify derivations + rank 14 (sanity / W6)
def is_derivation(M):
    for i in range(8):
        for j in range(8):
            xy=o_to_vec(o_mul(E[i],E[j])); lhs=apply(M,xy)
            Dei=o_from_vec(apply(M,o_to_vec(E[i]))); Dej=o_from_vec(apply(M,o_to_vec(E[j])))
            rhs=o_to_vec(o_add(o_mul(Dei,E[j]),o_mul(E[i],Dej)))
            if lhs!=rhs: return False
    return True
def rank(rows):
    rows=[r[:] for r in rows]; r=0; ncol=len(rows[0])
    for c in range(ncol):
        piv=None
        for i in range(r,len(rows)):
            if rows[i][c]!=0: piv=i; break
        if piv is None: continue
        rows[r],rows[piv]=rows[piv],rows[r]; pv=rows[r][c]
        rows[r]=[x/pv for x in rows[r]]
        for i in range(len(rows)):
            if i!=r and rows[i][c]!=0:
                f=rows[i][c]; rows[i]=[a-f*b for a,b in zip(rows[i],rows[r])]
        r+=1
        if r==len(rows): break
    return r

print("=== sanity (W6) ===")
print("  all 14 derivations:", all(is_derivation(D[k]) for k in range(14)))
print("  rank(14 flattened) :", rank([flat(D[k]) for k in range(14)]), "(expect 14)")

# ---------- structure constants table  [Di,Dj] = sum_k c^k Dk ----------
BASIS=[flat(D[k]) for k in range(14)]
def solve_in_basis(target):
    rows=[[BASIS[k][coord] for k in range(14)]+[target[coord]] for coord in range(64)]
    r=0; pivcols=[]
    for c in range(14):
        piv=None
        for i in range(r,len(rows)):
            if rows[i][c]!=0: piv=i; break
        if piv is None: continue
        rows[r],rows[piv]=rows[piv],rows[r]; pv=rows[r][c]
        rows[r]=[x/pv for x in rows[r]]
        for i in range(len(rows)):
            if i!=r and rows[i][c]!=0:
                f=rows[i][c]; rows[i]=[a-f*b for a,b in zip(rows[i],rows[r])]
        pivcols.append(c); r+=1
    for i in range(len(rows)):
        if all(rows[i][c]==0 for c in range(14)) and rows[i][14]!=0: return None
    c=[F(0)]*14
    for idx,col in enumerate(pivcols): c[col]=rows[idx][14]
    return c
# c[i][j] = list of 14 fractions s.t. [Di,Dj]=sum c Dk ; antisymmetric.
C=[[None]*14 for _ in range(14)]
for i in range(14):
    C[i][i]=[F(0)]*14
for i in range(14):
    for j in range(i+1,14):
        cc=solve_in_basis(flat(bracket8(D[i],D[j])))
        assert cc is not None, (i,j)
        C[i][j]=cc
        C[j][i]=[-v for v in cc]

# ---------- ad matrices: (ad Di)_{k j} = c^k_{i j} ----------
def adM(i):
    return [[C[i][j][k] for j in range(14)] for k in range(14)]  # 14x14, col j -> [Di,Dj]
AD=[adM(i) for i in range(14)]

# ---------- Killing form K(i,j) = tr(adi . adj) ----------
def trace(M,n): return sum(M[i][i] for i in range(n))
K=[[trace(matmul(AD[i],AD[j],14),14) for j in range(14)] for i in range(14)]
print("\n=== Killing form K(Di,Dj) = tr(adDi . adDj) ===")
diag=[K[i][i] for i in range(14)]
print("  diagonal:", diag)
print("  rank(K) :", rank([row[:] for row in K]), "(14 => nondegenerate => semisimple by Cartan)")
# definiteness: K is symmetric; check sign of K(x,x) on basis (proportional to compactness).
# For the compact real form the Killing form is NEGATIVE definite.
print("  all diagonal entries negative:", all(d<0 for d in diag),
      " (NEG-definite signature => COMPACT form => NOT split Serre g₂ over ℚ)")
# full definiteness check via leading principal minors of -K (should be >0 for neg-def K)
def submat(M,k): return [[M[i][j] for j in range(k)] for i in range(k)]
def det(M):
    M=[[F(x) for x in row] for row in M]; n=len(M); d=F(1)
    for c in range(n):
        piv=None
        for r in range(c,n):
            if M[r][c]!=0: piv=r; break
        if piv is None: return F(0)
        if piv!=c: M[c],M[piv]=M[piv],M[c]; d=-d
        d*=M[c][c]
        inv=M[c][c]
        for r in range(c+1,n):
            f=M[r][c]/inv
            M[r]=[M[r][j]-f*M[c][j] for j in range(n)]
    return d
negK=[[-K[i][j] for j in range(14)] for i in range(14)]
minors=[det(submat(negK,k)) for k in range(1,15)]
print("  leading principal minors of -K all > 0:", all(m>0 for m in minors), "(=> -K pos-def => K neg-def)")
print("  det(K):", det(K))

# ---------- the 7-dim representation on Im(O ℚ): drop coord 0 ----------
# each Dk: does it preserve Im (kill coord 0 in & out)?
def preserves_im(M):
    if any(M[0][j]!=0 for j in range(8)): return False   # output real part always 0
    if any(M[i][0]!=0 for i in range(8)): return False   # kills the unit
    return True
print("\n=== 7-dim rep on Im(O ℚ) (coords 1..7) ===")
print("  every Dk preserves Im (row0=col0=0):", all(preserves_im(D[k]) for k in range(14)))
def restrict7(M): return [[M[i][j] for j in range(1,8)] for i in range(1,8)]
D7=[restrict7(D[k]) for k in range(14)]
def flat7(M): return [M[i][j] for i in range(7) for j in range(7)]
print("  rank of 14 restricted 7x7 matrices:", rank([flat7(D7[k]) for k in range(14)]),
      "(14 => the 7-rep is FAITHFUL)")
# check the restriction is a Lie hom: [D7i,D7j] = restrict7([Di,Dj]) (auto since restriction of algebra hom)
ok=True
for i in range(14):
    for j in range(i+1,14):
        lhs=matsub(matmul(D7[i],D7[j],7),matmul(D7[j],D7[i],7),7)
        # restrict7 of the 8x8 bracket
        rhs=restrict7(bracket8(D[i],D[j]))
        if lhs!=rhs: ok=False
print("  restriction respects bracket ([D7i,D7j]=restrict[Di,Dj]):", ok)

# ---------- is the Killing form DIAGONAL in this basis? ----------
offdiag_nonzero = [(i,j,K[i][j]) for i in range(14) for j in range(14) if i!=j and K[i][j]!=0]
print("\n=== Killing form diagonality ===")
print("  number of nonzero OFF-diagonal entries:", len(offdiag_nonzero))
if offdiag_nonzero[:5]:
    print("  sample off-diagonals:", offdiag_nonzero[:5])
print("  K == -16 * I_14 :", all(K[i][j]==(F(-16) if i==j else F(0)) for i in range(14) for j in range(14)))
