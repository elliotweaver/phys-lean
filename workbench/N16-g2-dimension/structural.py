#!/usr/bin/env python3
"""
N16 — structural analysis of Der(O ℚ): which clean trunk-lemmas hold for EVERY
derivation? Designs the bankable Lean core. EXACT rational.
"""
from fractions import Fraction as F
from model import C, E, o_to_vec, o_mul, o_star, o_add, o_neg, basis
import pickle

N = 8
with open("nullbasis.pkl","rb") as fh:
    data = pickle.load(fh)
mats = [[[F(x) for x in row] for row in m] for m in data["mats"]]  # 14 matrices 8x8, D(e_i)=col i

def apply(M, vec):  # M is 8x8 (rows=output coord, col=input), vec=8 coords
    return [sum(M[a][i]*vec[i] for i in range(N)) for a in range(N)]

# Born bilinear form on coords: bilin(x,y) = (x*star y + y*star x).re  -> here returns full octonion;
# but the trunk bilin lands in base H; numerically the .re-of-octonion scalar part is the symmetric inner product.
# The standard inner product on this basis is <e_i,e_j> = delta (since e_i e_i = -1 for i>=1, e0=1).
# Verify: g(x,y) := sum x_i y_i is the polarization of Nrm. Check D skew wrt g.
def g(x,y): return sum(x[i]*y[i] for i in range(N))

print("=== Check 1: D(1)=0 (col 0 zero) ===")
print(all(all(M[a][0]==0 for a in range(N)) for M in mats))

print("=== Check 2: D skew wrt standard inner product g (g(Dx,y)+g(x,Dy)=0) ===")
# equivalent to M + M^T = 0
skew = True
for M in mats:
    for a in range(N):
        for b in range(N):
            if M[a][b] + M[b][a] != 0:
                skew = False
print("every basis derivation is skew-symmetric (M = -M^T):", skew)

print("=== Check 3: D preserves imaginary subspace AND kills e0 (so D in so(7) on Im) ===")
imag_ok = all(all(M[0][i]==0 and M[i][0]==0 for i in range(N)) for M in mats)
print(imag_ok)

# star (conjugation) on coords: star e0 = e0, star e_i = -e_i (i>=1). So star = diag(1,-1,...,-1).
print("=== Check 4: D commutes with star (conjugation) ===")
def star_vec(v): return [v[0]] + [-v[i] for i in range(1,N)]
comm = True
for M in mats:
    for i in range(N):
        col = [M[a][i] for a in range(N)]
        # D(star e_i) vs star(D e_i)
        ei = [F(1) if k==i else F(0) for k in range(N)]
        lhs = apply(M, star_vec(ei))
        rhs = star_vec(apply(M, ei))
        if lhs != rhs:
            comm = False
print("D commutes with conjugation:", comm)

# Now: the explicit 14-dim basis. Show sparsity & integrality.
print("\n=== The 14 basis derivation matrices (rows=out coord, cols=in coord) ===")
for idx,M in enumerate(mats):
    nz = sum(1 for a in range(N) for b in range(N) if M[a][b]!=0)
    allint = all(M[a][b].denominator==1 for a in range(N) for b in range(N))
    print(f"D{idx}: nnz={nz} integer={allint}")

# independence: rank of the 14 flattened vectors in Q^64
def flatten(M): return [M[a][b] for a in range(N) for b in range(N)]
vs = [flatten(M) for M in mats]
def rank(rows):
    rows=[r[:] for r in rows]; r=0; pivc=[]
    for c in range(len(rows[0])):
        piv=None
        for rr in range(r,len(rows)):
            if rows[rr][c]!=0: piv=rr;break
        if piv is None: continue
        rows[r],rows[piv]=rows[piv],rows[r]
        inv=F(1)/rows[r][c]; rows[r]=[x*inv for x in rows[r]]
        for rr in range(len(rows)):
            if rr!=r and rows[rr][c]!=0:
                f=rows[rr][c]; rows[rr]=[a-f*b for a,b in zip(rows[rr],rows[r])]
        pivc.append(c); r+=1
        if r==len(rows): break
    return r,pivc
rk,pc = rank(vs)
print(f"\nrank of the 14 flattened basis derivations = {rk} (expect 14)")
print("pivot columns (a*8+b):", pc)

# Are the lifted-quaternion inner derivations (N6 innerDeriv q) among these? 
# innerDeriv lifts ad_q on base H=CD(Dbl). Base imaginary directions in H: the 3 imaginary quaternion units.
# This is reconnaissance for the lower bound construction.
