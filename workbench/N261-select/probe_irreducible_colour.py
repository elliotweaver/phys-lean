#!/usr/bin/env python3
"""
N261 MEASURE-FIRST probe (exact ℚ, no floats).

Goal: confirm BEFORE any Lean that the derived colour representation on the
charged matter Vsub (the 6-dim charged complement, coords 1..6 in imBasis) is
IRREDUCIBLE, and that colour is PERFECT (self-blindness one level up:
[colour,colour] = colour, no abelian/character residue).

Data: the 14 integer g2 generator matrices dm[0..13] in imBasis coords
(imBasis 0 = u1; coords 1..6 = Vsub = span{e2..e7}), copied byte-for-byte from
Phys/Algebra/TowerGatherIrreducible27.lean.

colour := { M in span(dm) : M(u1) = 0 } = { M : column 0 of M is zero }.
(These are skew, so col0=0 <=> row0=0 <=> M preserves Vsub=coords{1..6}.)

Certificates produced:
 (1) dim colour = 8.
 (2) colour is PERFECT: span([colour,colour]) = colour (dim 8).
 (3) colour restricted to the 6-block acts IRREDUCIBLY on ℚ^6, via the
     double-centralizer certificate:
        dim commutant C = 2 AND C is a field (contains J with J^2=-I,
        no nontrivial idempotent)  AND  dim enveloping algebra A = 18 = 36/2.
     dim C = 2 (division) + dim A = 36/dim C  ==>  V irreducible (Jacobson).
"""
from fractions import Fraction as F

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
dm = [d0m,d1m,d2m,d3m,d4m,d5m,d6m,d7m,d8m,d9m,d10m,d11m,d12m,d13m]
dm = [[[F(x) for x in row] for row in M] for M in dm]

N = 7
def matmul(A,B,n):
    return [[sum(A[i][k]*B[k][j] for k in range(n)) for j in range(n)] for i in range(n)]
def matsub(A,B,n):
    return [[A[i][j]-B[i][j] for j in range(n)] for i in range(n)]
def flat(M,n):
    return [M[i][j] for i in range(n) for j in range(n)]

def rank(rows):
    """rank over ℚ of a list of vectors (lists of Fraction)."""
    rows = [r[:] for r in rows]
    piv = 0
    m = len(rows)
    if m == 0: return 0
    ncol = len(rows[0])
    r = 0
    for c in range(ncol):
        # find pivot
        sel = -1
        for i in range(r, m):
            if rows[i][c] != 0:
                sel = i; break
        if sel < 0: continue
        rows[r], rows[sel] = rows[sel], rows[r]
        inv = rows[r][c]
        rows[r] = [x/inv for x in rows[r]]
        for i in range(m):
            if i != r and rows[i][c] != 0:
                f = rows[i][c]
                rows[i] = [rows[i][j]-f*rows[r][j] for j in range(ncol)]
        r += 1
        if r == m: break
    return r

def span_dim(vecs):
    return rank(vecs)

# ---- (1) colour = { M in span(dm) : column 0 = 0 } ----
# param: M = sum_k c_k dm[k].  column0(M)[i] = sum_k c_k dm[k][i][0], i=1..6 (i=0 auto 0).
# Solve for c in ℚ^14 with these 6 constraints. Nullspace = colour coeffs.
def nullspace(A, ncols):
    """return basis of nullspace of A (rows=constraints) over ℚ, vectors length ncols."""
    A = [r[:] for r in A]
    m = len(A)
    pivcols = []
    r = 0
    for c in range(ncols):
        sel = -1
        for i in range(r,m):
            if A[i][c] != 0:
                sel = i; break
        if sel < 0: continue
        A[r],A[sel]=A[sel],A[r]
        inv=A[r][c]; A[r]=[x/inv for x in A[r]]
        for i in range(m):
            if i!=r and A[i][c]!=0:
                f=A[i][c]; A[i]=[A[i][j]-f*A[r][j] for j in range(ncols)]
        pivcols.append(c); r+=1
        if r==m: break
    free=[c for c in range(ncols) if c not in pivcols]
    basis=[]
    for fc in free:
        v=[F(0)]*ncols; v[fc]=F(1)
        for ri,pc in enumerate(pivcols):
            v[pc]=-A[ri][fc]
        basis.append(v)
    return basis

# constraint matrix: 6 rows (i=1..6), 14 cols (k)
constraints=[[dm[k][i][0] for k in range(14)] for i in range(1,7)]
colour_coeffs = nullspace(constraints, 14)
print("dim colour (nullspace) =", len(colour_coeffs))

def combo(coeffs):
    M=[[F(0)]*7 for _ in range(7)]
    for k in range(14):
        if coeffs[k]!=0:
            for i in range(7):
                for j in range(7):
                    M[i][j]+=coeffs[k]*dm[k][i][j]
    return M

colour = [combo(c) for c in colour_coeffs]
dim_colour = span_dim([flat(M,7) for M in colour])
print("dim colour (as matrices) =", dim_colour)

# verify each colour matrix kills column 0 and row 0 (skew) -> preserves Vsub
ok_col0 = all(colour[t][i][0]==0 for t in range(len(colour)) for i in range(7))
ok_row0 = all(colour[t][0][j]==0 for t in range(len(colour)) for j in range(7))
print("colour kills col0:", ok_col0, " row0:", ok_row0)

# ---- (2) PERFECTNESS: span([colour,colour]) = colour ----
brackets=[]
for a in range(len(colour)):
    for b in range(a+1,len(colour)):
        AB=matmul(colour[a],colour[b],7)
        BA=matmul(colour[b],colour[a],7)
        brackets.append(flat(matsub(AB,BA,7),7))
dim_brackets = span_dim(brackets)
# also confirm brackets ⊆ colour: combined span still 8
combined = span_dim([flat(M,7) for M in colour] + brackets)
print("dim span[colour,colour] =", dim_brackets, " (perfect iff =", dim_colour, ")")
print("dim (colour + [colour,colour]) =", combined, " (brackets ⊆ colour iff = dim colour)")
print("PERFECT:", dim_brackets==dim_colour and combined==dim_colour)

# ---- (3) IRREDUCIBILITY on Vsub (coords 1..6), double-centralizer certificate ----
# restrict each colour matrix to the 6x6 block rows/cols 1..6
def block6(M):
    return [[M[i][j] for j in range(1,7)] for i in range(1,7)]
colour6 = [block6(M) for M in colour]

# enveloping algebra A: close {I, colour6} under products & linear span within 6x6=36 dim
I6=[[F(1) if i==j else F(0) for j in range(6)] for i in range(6)]
def mm(A,B): return matmul(A,B,6)
gens = [I6]+colour6
# iterative closure
algebra = [flat(I6,6)]
frontier = [I6]+colour6
# build a growing basis
basis_mats=[]
def add_if_new(M):
    global basis_mats
    v=flat(M,6)
    test=[flat(X,6) for X in basis_mats]+[v]
    if span_dim(test)>len(basis_mats):
        basis_mats.append(M)
        return True
    return False
for M in [I6]+colour6:
    add_if_new(M)
changed=True
while changed:
    changed=False
    cur=list(basis_mats)
    for A in cur:
        for g in colour6:
            if add_if_new(mm(A,g)):
                changed=True
            if add_if_new(mm(g,A)):
                changed=True
dim_A = len(basis_mats)
print("dim enveloping algebra A on Vsub =", dim_A)

# commutant C = {X 6x6 : X*g = g*X for all colour6}
# linear conditions: for each generator g, X g - g X = 0 (36 eqns each), X has 36 unknowns
unknowns=36
rows=[]
for g in colour6:
    # (Xg-gX)[i][j] as linear form in X[p][q] (index p*6+q)
    for i in range(6):
        for j in range(6):
            row=[F(0)]*unknowns
            # (Xg)[i][j] = sum_k X[i][k] g[k][j]
            for k in range(6):
                row[i*6+k]+=g[k][j]
            # (gX)[i][j] = sum_k g[i][k] X[k][j]
            for k in range(6):
                row[k*6+j]-=g[i][k]
            rows.append(row)
Cbasis=nullspace(rows, unknowns)
dim_C=len(Cbasis)
print("dim commutant C on Vsub =", dim_C)

# check C is a field (division, complex type): find nontrivial element, check its square = scalar*I,
# and no nontrivial idempotent. For dim 2 = <I, J>: pick the non-identity basis element mod I.
def as_mat(v):
    return [[v[i*6+j] for j in range(6)] for i in range(6)]
Cmats=[as_mat(v) for v in Cbasis]
# express: does C contain a nontrivial idempotent E (E^2=E, E != 0, I)?  reducible iff yes.
# For dim_C=2 field ℂ: elements a*I+b*J, J^2=-I. idempotent => a^2 - b^2 ... = a etc -> only 0,I.
# We test: is there X in C with X^2 = X and X != 0,I ? Search over the 2-dim space is hard exactly;
# instead certify field: find J in C with J^2 = -I (then C ⊇ ℝ[J]=ℂ, and dim_C=2 => C=ℂ field).
found_J=None
# J should be the charge complex structure; try to solve for a*C0+b*C1 with square = -I among basis.
# Simplify: if dim_C==2, take basis {B0,B1}; solve (xB0+yB1)^2 = -I.
if dim_C==2:
    B0,B1=Cmats[0],Cmats[1]
    # We just verify existence numerically-exactly by trying to find the J that N242 says exists:
    # Actually test all of: is there a combination squaring to -I? Set up: (xB0+yB1)^2+I=0.
    # This is quadratic; brute a small rational search is unreliable. Instead: compute min poly route.
    # Cheaper certificate of "field": C has NO zero divisors <=> for the 2-dim algebra, the
    # multiplication has no nontrivial idempotent. Test by checking the algebra ℝ[t]/(minpoly)
    # We compute the matrix of "multiply by B1" in basis {B0,B1} within C, get its char poly;
    # C is a field iff that char poly is irreducible over ℚ.
    # mult-by-B1: B1*B0 and B1*B1 expressed in basis {B0,B1}.
    def express(M):
        # solve coefficients in basis {B0,B1}
        A=[[flat(B0,6)[i], flat(B1,6)[i]] for i in range(36)]
        rhs=flat(M,6)
        # least/exact solve overdetermined consistent system
        # build augmented, gaussian
        aug=[A[i][:]+[rhs[i]] for i in range(36)]
        # reduce
        r=0
        for c in range(2):
            sel=-1
            for ii in range(r,36):
                if aug[ii][c]!=0: sel=ii;break
            if sel<0: continue
            aug[r],aug[sel]=aug[sel],aug[r]
            inv=aug[r][c];aug[r]=[x/inv for x in aug[r]]
            for ii in range(36):
                if ii!=r and aug[ii][c]!=0:
                    f=aug[ii][c];aug[ii]=[aug[ii][j]-f*aug[r][j] for j in range(3)]
            r+=1
        x=aug[0][2] if len(aug)>0 else F(0)
        y=aug[1][2] if len(aug)>1 else F(0)
        return x,y
    m00=express(mm(B1,B0))
    m01=express(mm(B1,B1))
    # matrix of mult-by-B1: columns are images of B0,B1
    a,c_=m00  # B1*B0 = a B0 + c B1
    b,d_=m01  # B1*B1 = b B0 + d B1
    # char poly of [[a,b],[c_,d_]]: t^2-(a+d_)t+(a*d_-b*c_)
    tr=a+d_; det=a*d_-b*c_
    disc=tr*tr-4*det
    print("commutant mult-op: tr=",tr," det=",det," disc=",disc)
    # irreducible over ℚ iff disc is not a perfect square of a rational
    def is_sq(q):
        if q<0: return False
        from math import isqrt
        num,den=q.numerator,q.denominator
        rn=isqrt(num); rd=isqrt(den)
        return rn*rn==num and rd*rd==den
    field = disc<0 or (not is_sq(disc))
    print("commutant is a FIELD (division, disc not a rational square):", field)
else:
    field=False
    print("dim_C != 2 -> not the expected ℂ; irreducibility certificate differs")

irr = (dim_C==2 and field and dim_A==36//dim_C)
print()
print("=== VERDICT ===")
print("dim colour        =", dim_colour, "(want 8)")
print("colour PERFECT    =", (dim_brackets==dim_colour and combined==dim_colour))
print("dim commutant C   =", dim_C, "(want 2 = ℂ)")
print("commutant a field =", field)
print("dim enveloping A  =", dim_A, "(want 18 = 36/2)")
print("DOUBLE-CENTRALIZER IRREDUCIBILITY (dim C=2 field & dim A=36/dim C):", irr)
