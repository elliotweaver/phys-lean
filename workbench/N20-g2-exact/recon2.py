#!/usr/bin/env python3
"""
N20 recon part 2: characterize the IMAGE of  D ↦ (De1,De2,De4) ∈ Im³ over Der (14-dim).
Find the 7 linear constraints (= null space of the 14×21 image matrix) and the echelon
structure: which 14 coords are FREE (pivot columns ⟹ the injective read-off) and which
7 are DEPENDENT (expressed via the constraints). Then verify each constraint is a single
Leibniz instance D(ea·eb)=Dea·eb+ea·Deb so it can be proved in Lean from the banked law.
"""
from fractions import Fraction as F
import pickle, os

# ---- rebuild exact model ----
def dbl_mul(z,w): return (z[0]*w[0]-z[1]*w[1], z[0]*w[1]+z[1]*w[0])
def dbl_star(z): return (z[0],-z[1])
def dbl_add(z,w): return (z[0]+w[0],z[1]+w[1])
def dbl_neg(z): return (-z[0],-z[1])
def make_CD(mul,star,add,neg,zero):
    def cd_mul(z,w):
        zr,zi=z; wr,wi=w
        return (add(mul(zr,wr),neg(mul(star(wi),zi))), add(mul(wi,zr),mul(zi,star(wr))))
    def cd_star(z): return (star(z[0]),neg(z[1]))
    def cd_add(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
    def cd_neg(z): return (neg(z[0]),neg(z[1]))
    return cd_mul,cd_star,cd_add,cd_neg,(zero,zero)
DBL_ZERO=(F(0),F(0))
h_mul,h_star,h_add,h_neg,h_zero=make_CD(dbl_mul,dbl_star,dbl_add,dbl_neg,DBL_ZERO)
o_mul,o_star,o_add,o_neg,o_zero=make_CD(h_mul,h_star,h_add,h_neg,h_zero)
def o_from_vec(v):
    def dbl(b): return (v[b],v[b+1])
    def h(b): return (dbl(b),dbl(b+2))
    return (h(0),h(4))
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
C=[[o_to_vec(o_mul(E[i],E[j])) for j in range(8)] for i in range(8)]

# ---- load the 14 nullbasis derivations (each as 8x8 matrix M[q][p]: De_p = sum_q M[q][p] e_q) ----
pkl=os.path.join(os.path.dirname(__file__),"..","N16-g2-dimension","nullbasis.pkl")
with open(pkl,"rb") as f:
    nb=pickle.load(f)
mats=nb['mats']   # 14 matrices, each 8x8 of strings, M[q][p] = coeff of e_q in D e_p
print("nullbasis: ", len(mats), "matrices 8x8")

def Dmat(M):  # convert string 8x8 -> Fraction 8x8 M[q][p]
    return [[F(M[q][p]) for p in range(8)] for q in range(8)]

# evaluation: for derivation D (matrix M), De_p = column p of M = [M[q][p]]_q
# The 21-vector = (De1[1..7], De2[1..7], De4[1..7])  (drop coord 0, the real part, = 0)
gens=[1,2,4]
def ev21(M):
    out=[]
    for p in gens:
        for q in range(1,8):  # imaginary coords 1..7
            out.append(M[q][p])
    return out  # length 21

A=[ev21(Dmat(M)) for M in mats]  # 14 x 21
# verify real coords (q=0) of De_p are 0 for the generators (trace-free sanity)
for M in mats:
    MM=Dmat(M)
    for p in gens:
        assert MM[0][p]==0, "real coord nonzero?!"

# rank of A and its row-reduction
def rref(M):
    M=[row[:] for row in M]
    rows=len(M); cols=len(M[0]); piv=[]; r=0
    for c in range(cols):
        sel=None
        for i in range(r,rows):
            if M[i][c]!=0: sel=i;break
        if sel is None: continue
        M[r],M[sel]=M[sel],M[r]
        inv=F(1)/M[r][c]; M[r]=[x*inv for x in M[r]]
        for i in range(rows):
            if i!=r and M[i][c]!=0:
                f=M[i][c]; M[i]=[a-f*b for a,b in zip(M[i],M[r])]
        piv.append(c); r+=1
        if r==rows: break
    return M,piv
R,piv=rref(A)
print(f"\nimage matrix A is 14x21, rank={len(piv)} (expect 14)")
print("PIVOT columns (the 14 FREE coords that determine D):", piv)
coordname=lambda j: f"D e{gens[j//7]}[e{(j%7)+1}]"
print(" pivot coords:", [coordname(j) for j in piv])
dep=[j for j in range(21) if j not in piv]
print("DEPENDENT columns (7):", dep, "->", [coordname(j) for j in dep])

# constraints = null space of A (w in Q^21 with A w = 0): right null space
def nullspace(M):
    R,piv=rref(M)
    cols=len(M[0]); pivset=set(piv); free=[c for c in range(cols) if c not in pivset]
    basis=[]
    for fcol in free:
        w=[F(0)]*cols; w[fcol]=F(1)
        for i,pc in enumerate(piv):
            w[pc]=-R[i][fcol]
        basis.append(w)
    return basis
cons=nullspace(A)
print(f"\n#constraints (dim of image^perp) = {len(cons)} (expect 7)")
for idx,w in enumerate(cons):
    terms=[(j,w[j]) for j in range(21) if w[j]!=0]
    s=" + ".join(f"({c})·{coordname(j)}" for j,c in terms)
    print(f"  C{idx}: 0 = {s}")
