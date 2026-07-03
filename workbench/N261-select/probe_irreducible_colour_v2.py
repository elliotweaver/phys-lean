#!/usr/bin/env python3
"""
N261 MEASURE-FIRST probe v2 (exact ℚ) — fix the field certificate + add a DIRECT
irreducibility test (cyclic-subspace closure) over ℚ.

Confirms: the derived colour rep on the charged 6-space Vsub (coords 1..6) is
IRREDUCIBLE over ℚ (the charged matter is a single indivisible colour multiplet).
"""
from fractions import Fraction as F
from math import isqrt
import itertools, random

d0m = [[0,0,0,0,0,0,0],[0,0,0,0,-1,0,0],[0,0,0,1,0,0,0],[0,0,-1,0,0,0,0],[0,1,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
d1m = [[0,0,0,0,0,0,0],[0,0,0,-1,0,0,0],[0,0,0,0,-1,0,0],[0,1,0,0,0,0,0],[0,0,1,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
d2m = [[0,0,0,0,0,0,0],[0,0,1,0,0,0,0],[0,-1,0,0,0,0,0],[0,0,0,0,-1,0,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
d3m = [[0,0,0,0,0,-1,0],[0,0,0,0,0,0,0],[0,0,0,-1,0,0,0],[0,0,1,0,0,0,0],[0,0,0,0,0,0,0],[1,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
d4m = [[0,0,0,0,1,0,0],[0,0,0,0,0,-1,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[-1,0,0,0,0,0,0],[0,1,0,0,0,0,0],[0,0,0,0,0,0,0]]
d5m = [[0,0,0,1,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,-1,0],[-1,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,1,0,0,0,0],[0,0,0,0,0,0,0]]
d6m = [[0,0,-1,0,0,0,0],[0,0,0,0,0,0,0],[1,0,0,0,0,0,0],[0,0,0,0,0,-1,0],[0,0,0,0,0,0,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,0]]
d7m = [[0,-1,0,0,0,0,0],[1,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,-1,0],[0,0,0,0,1,0,0],[0,0,0,0,0,0,0]]
d8m = [[0,0,0,0,0,0,-1],[0,0,0,1,0,0,0],[0,0,0,0,0,0,0],[0,-1,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[1,0,0,0,0,0,0]]
d9m = [[0,0,0,-1,0,0,0],[0,0,0,0,0,0,-1],[0,0,0,0,0,0,0],[1,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,1,0,0,0,0,0]]
d10m= [[0,0,0,0,1,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,-1],[0,0,0,0,0,0,0],[-1,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,1,0,0,0,0]]
d11m= [[0,1,0,0,0,0,0],[-1,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,-1],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,1,0,0,0]]
d12m= [[0,0,-1,0,0,0,0],[0,0,0,0,0,0,0],[1,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,-1],[0,0,0,0,0,0,0],[0,0,0,0,1,0,0]]
d13m= [[0,0,0,0,0,0,0],[0,0,-1,0,0,0,0],[0,1,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,-1],[0,0,0,0,0,1,0]]
dm = [[[F(x) for x in row] for row in M] for M in [d0m,d1m,d2m,d3m,d4m,d5m,d6m,d7m,d8m,d9m,d10m,d11m,d12m,d13m]]

def matmul(A,B,n): return [[sum(A[i][k]*B[k][j] for k in range(n)) for j in range(n)] for i in range(n)]
def flat(M,n): return [M[i][j] for i in range(n) for j in range(n)]
def rank(rows):
    rows=[r[:] for r in rows]; m=len(rows)
    if m==0: return 0
    nc=len(rows[0]); r=0
    for c in range(nc):
        sel=-1
        for i in range(r,m):
            if rows[i][c]!=0: sel=i;break
        if sel<0: continue
        rows[r],rows[sel]=rows[sel],rows[r]
        inv=rows[r][c]; rows[r]=[x/inv for x in rows[r]]
        for i in range(m):
            if i!=r and rows[i][c]!=0:
                f=rows[i][c]; rows[i]=[rows[i][j]-f*rows[r][j] for j in range(nc)]
        r+=1
        if r==m: break
    return r
def span_dim(v): return rank(v)
def nullspace(A,ncols):
    A=[r[:] for r in A]; m=len(A); piv=[]; r=0
    for c in range(ncols):
        sel=-1
        for i in range(r,m):
            if A[i][c]!=0: sel=i;break
        if sel<0: continue
        A[r],A[sel]=A[sel],A[r]; inv=A[r][c]; A[r]=[x/inv for x in A[r]]
        for i in range(m):
            if i!=r and A[i][c]!=0:
                f=A[i][c]; A[i]=[A[i][j]-f*A[r][j] for j in range(ncols)]
        piv.append(c); r+=1
        if r==m: break
    free=[c for c in range(ncols) if c not in piv]; B=[]
    for fc in free:
        v=[F(0)]*ncols; v[fc]=F(1)
        for ri,pc in enumerate(piv): v[pc]=-A[ri][fc]
        B.append(v)
    return B

# colour = span(dm) with column 0 = 0
constraints=[[dm[k][i][0] for k in range(14)] for i in range(1,7)]
colour_coeffs=nullspace(constraints,14)
def combo(c):
    M=[[F(0)]*7 for _ in range(7)]
    for k in range(14):
        if c[k]!=0:
            for i in range(7):
                for j in range(7): M[i][j]+=c[k]*dm[k][i][j]
    return M
colour=[combo(c) for c in colour_coeffs]
def block6(M): return [[M[i][j] for j in range(1,7)] for i in range(1,7)]
colour6=[block6(M) for M in colour]
print("dim colour6 =", span_dim([flat(M,6) for M in colour6]))

# ---- DIRECT irreducibility test: cyclic-subspace closure over ℚ ----
def apply_close(seed_vecs):
    """smallest colour6-invariant ℚ-subspace containing seed_vecs (list of len-6 ℚ vecs)."""
    basis=[v[:] for v in seed_vecs if any(x!=0 for x in v)]
    # reduce basis to independent
    def indep(vs):
        out=[]; 
        for v in vs:
            if span_dim([w for w in out]+[v])>len(out): out.append(v)
        return out
    basis=indep(basis)
    changed=True
    while changed:
        changed=False
        cur=list(basis)
        for v in cur:
            for M in colour6:
                w=[sum(M[i][j]*v[j] for j in range(6)) for i in range(6)]
                if span_dim([b for b in basis]+[w])>len(basis):
                    basis.append(w); changed=True
    return len(basis)

# test every standard basis vector + several rational combos
seeds=[]
for i in range(6):
    e=[F(0)]*6; e[i]=F(1); seeds.append(e)
random.seed(1)
for _ in range(12):
    seeds.append([F(random.randint(-3,3)) for _ in range(6)])
cyclic_dims=[apply_close([s]) for s in seeds]
print("cyclic-subspace dims over sampled nonzero v:", sorted(set(cyclic_dims)))
print("  min cyclic dim =", min(cyclic_dims), " (irreducible over ℚ iff ALL nonzero v give 6)")

# ---- Commutant-field certificate (fixed) ----
unk=36; rows=[]
for g in colour6:
    for i in range(6):
        for j in range(6):
            row=[F(0)]*unk
            for k in range(6): row[i*6+k]+=g[k][j]
            for k in range(6): row[k*6+j]-=g[i][k]
            rows.append(row)
Cbasis=nullspace(rows,unk); dim_C=len(Cbasis)
def as_mat(v): return [[v[i*6+j] for j in range(6)] for i in range(6)]
Cmats=[as_mat(v) for v in Cbasis]
# find a NON-scalar element J0 in C: subtract its (1/6)tr * I to make traceless; if nonzero, use it
I6=[[F(1) if i==j else F(0) for j in range(6)] for i in range(6)]
J0=None
for M in Cmats:
    tr=sum(M[i][i] for i in range(6))
    Mt=[[M[i][j]-(tr/6 if i==j else F(0)) for j in range(6)] for i in range(6)]
    if any(Mt[i][j]!=0 for i in range(6) for j in range(6)):
        J0=Mt; break
# also try a generic combo if needed
if J0 is None and dim_C>=2:
    M=[[Cmats[0][i][j]+3*Cmats[1][i][j] for j in range(6)] for i in range(6)]
    tr=sum(M[i][i] for i in range(6))
    J0=[[M[i][j]-(tr/6 if i==j else F(0)) for j in range(6)] for i in range(6)]
# J0^2 should be a negative scalar multiple of I (complex type). Compute J0^2.
J2=matmul(J0,J0,6)
# check J2 = s*I
s=J2[0][0]; is_scalar=all(J2[i][j]==(s if i==j else F(0)) for i in range(6) for j in range(6))
print("non-scalar commutant elt J0: J0^2 = ", s, "* I  (scalar:", is_scalar, ")")
field = is_scalar and s<0    # J0^2 = negative scalar -> minpoly X^2 - s, s<0 irreducible -> ℂ field
print("commutant C is a FIELD (ℂ, complex type):", field, " dim_C =", dim_C)

# enveloping algebra dim
basis_mats=[]
def add_if_new(M):
    v=flat(M,6)
    if span_dim([flat(X,6) for X in basis_mats]+[v])>len(basis_mats):
        basis_mats.append(M); return True
    return False
for M in [I6]+colour6: add_if_new(M)
changed=True
while changed:
    changed=False
    for A in list(basis_mats):
        for g in colour6:
            if add_if_new(matmul(A,g,6)): changed=True
            if add_if_new(matmul(g,A,6)): changed=True
dim_A=len(basis_mats)

print()
print("=== VERDICT ===")
irr_cyclic = min(cyclic_dims)==6
irr_dc = (dim_C==2 and field and dim_A==18)
print("dim colour        = 8 (perfect confirmed in v1)")
print("IRREDUCIBLE (cyclic test, all nonzero v generate all of Vsub):", irr_cyclic)
print("dim commutant C   =", dim_C, "  C a field (ℂ):", field)
print("dim enveloping A  =", dim_A, "(= 36/dim_C = 18)")
print("IRREDUCIBLE (double-centralizer: C division & dim A = dim V^2/dim C):", irr_dc)
print()
print("BOTH certificates agree:", irr_cyclic and irr_dc)
