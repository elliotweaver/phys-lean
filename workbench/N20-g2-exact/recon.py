#!/usr/bin/env python3
"""
N20 reconnaissance (NOT the deliverable). Re-verify (W6) dim_ℚ Der(O ℚ) = 14 on the
EXACT-RATIONAL faithful model, then test the UPPER-BOUND determination route:

  Is the linear map  D ↦ (D e1, D e2, D e4)  INJECTIVE on Der(O ℚ)?
  (i.e. is the only derivation killing the 3 multiplicative generators e1,e2,e4 the
   zero derivation?)  If yes ⟹ dim Der ≤ dim(Im)^3 = 21, and we can push the cut.

Also: enumerate the generation e3=e1e2, e5=e1e4, e6=e2e4, e7=(e1e2)e4 (with signs) so
the Lean determination lemma can be written from the BANKED Leibniz law alone.

Everything EXACT (Fraction). Product/star EXACTLY mirror the banked Lean Cayley–Dickson.
"""
from fractions import Fraction as F
from itertools import product

# ---------- base: Dbl ℚ (2-dim) ----------
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

# octonion <-> 8 coords, index = oct_im*4 + h_im*2 + dbl_im
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
ONE=E[0]

def fmt(vec):
    nz=[(k,c) for k,c in enumerate(vec) if c!=0]
    if not nz: return "0"
    return "+".join(f"{c}e{k}" for k,c in nz).replace("+-","-")

# structure constants
C=[[o_to_vec(o_mul(E[i],E[j])) for j in range(8)] for i in range(8)]
print("=== generation: products of e1,e2,e4 ===")
for (i,j) in [(1,2),(1,4),(2,4),(3,4),(2,3),(1,3)]:
    print(f"  e{i}*e{j} = {fmt(C[i][j])}")
# e3 = e1 e2 ? e5 = e1 e4 ? e6 = e2 e4 ? e7 = ?
print("  e1*e2 =", fmt(C[1][2]), " | e1*e4 =", fmt(C[1][4]), " | e2*e4 =", fmt(C[2][4]))
print("  (e1*e2)*e4 =", fmt(o_to_vec(o_mul(o_mul(E[1],E[2]),E[4]))))

# ---------- the full Leibniz linear system on D (8x8 = 64 unknowns) ----------
# D acts coordinate-wise: D e_p = sum_q M[q][p] e_q  (M is 8x8). Unknown vector = M flattened.
# Leibniz: D(e_a e_b) = D e_a · e_b + e_a · D e_b  for all a,b in 0..7  -> 8 coord eqns each.
# Build rows over the 64 unknowns indexed u(q,p)=q*8+p meaning coeff of e_q in D e_p.
import itertools
def leibniz_rows():
    rows=[]
    for a in range(8):
        for b in range(8):
            lhs=C[a][b]  # e_a e_b = sum_k lhs[k] e_k
            # D(lhs) = sum_k lhs[k] D e_k = sum_k lhs[k] sum_q M[q][k] e_q
            # RHS = (D e_a) e_b + e_a (D e_b)
            #     = sum_q M[q][a] e_q e_b + sum_q M[q][b] e_a e_q
            for out in range(8):  # coordinate 'out'
                row=[F(0)]*64
                # LHS coeff of e_out: sum_k lhs[k] * M[out][k]
                for k in range(8):
                    if lhs[k]!=0:
                        row[out*8+k]+=lhs[k]
                # RHS: subtract
                for q in range(8):
                    # M[q][a] * (e_q e_b)[out]
                    coeff=C[q][b][out]
                    if coeff!=0: row[q*8+a]-=coeff
                    # M[q][b] * (e_a e_q)[out]
                    coeff2=C[a][q][out]
                    if coeff2!=0: row[q*8+b]-=coeff2
                if any(x!=0 for x in row):
                    rows.append(row)
    return rows

def rref_rank_kernel(rows, ncols):
    M=[r[:] for r in rows]
    pivots=[]
    r=0
    for c in range(ncols):
        piv=None
        for i in range(r,len(M)):
            if M[i][c]!=0: piv=i; break
        if piv is None: continue
        M[r],M[piv]=M[piv],M[r]
        inv=F(1)/M[r][c]
        M[r]=[x*inv for x in M[r]]
        for i in range(len(M)):
            if i!=r and M[i][c]!=0:
                f=M[i][c]
                M[i]=[a-f*b for a,b in zip(M[i],M[r])]
        pivots.append(c); r+=1
        if r==len(M): break
    rank=len(pivots)
    nullity=ncols-rank
    return rank, nullity, pivots, M[:rank]

rows=leibniz_rows()
rank,nullity,pivots,_=rref_rank_kernel(rows,64)
print(f"\n=== W6 RE-VERIFY: Leibniz system rank={rank}, nullity={nullity} (expect 50 / 14) ===")
print("  dim_ℚ Der(O ℚ) =", nullity)

# ---------- determination test: add D e1=De2=De4=0 constraints, recompute nullity ----------
# constraint D e_p = 0 means M[q][p]=0 for all q (8 rows each).
def det_rows(gens):
    extra=[]
    for p in gens:
        for q in range(8):
            row=[F(0)]*64; row[q*8+p]=F(1); extra.append(row)
    return extra

for gens in ([1,2,4],[1,2],[1,4],[1,2,4,3]):
    allrows=rows+det_rows(gens)
    rk,nl,_,_=rref_rank_kernel(allrows,64)
    print(f"  Der ∩ {{D e_g = 0 : g in {gens}}}: nullity={nl}  (0 ⟹ injective on those gens)")

print("\n  ⟹ if nullity=0 for gens=[1,2,4]: D↦(De1,De2,De4) is INJECTIVE ⟹ dim Der ≤ 3·7=21")
