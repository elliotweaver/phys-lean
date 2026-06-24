#!/usr/bin/env python3
"""
Generate the Lean structure-constant theorems for N21 from the EXACT computation.
Emits theorem bodies to stdout. The RHS is the proved bracket table.
"""
from fractions import Fraction as F

# --- exact octonion product + the 14 matrices (same as structure_constants.py) ---
def dbl_mul(z, w): return (z[0]*w[0] - z[1]*w[1], z[0]*w[1] + z[1]*w[0])
def dbl_star(z):   return (z[0], -z[1])
def dbl_add(z, w): return (z[0]+w[0], z[1]+w[1])
def dbl_neg(z):    return (-z[0], -z[1])
DBL_ZERO = (F(0), F(0))
def make_CD(mul, star, add, neg, zero):
    def cd_mul(z, w):
        zr, zi = z; wr, wi = w
        return (add(mul(zr, wr), neg(mul(star(wi), zi))),
                add(mul(wi, zr), mul(zi, star(wr))))
    return cd_mul
h_mul = make_CD(dbl_mul, dbl_star, dbl_add, dbl_neg, DBL_ZERO)
def h_star(z): return (dbl_star(z[0]), dbl_neg(z[1]))
def h_add(z, w): return (dbl_add(z[0], w[0]), dbl_add(z[1], w[1]))
def h_neg(z): return (dbl_neg(z[0]), dbl_neg(z[1]))
o_mul = make_CD(h_mul, h_star, h_add, h_neg, (DBL_ZERO, DBL_ZERO))

DMAPS = {
 0:{2:(5,-1),3:(4,1),4:(3,-1),5:(2,1)}, 1:{2:(4,-1),3:(5,-1),4:(2,1),5:(3,1)},
 2:{2:(3,1),3:(2,-1),4:(5,-1),5:(4,1)}, 3:{1:(6,-1),3:(4,-1),4:(3,1),6:(1,1)},
 4:{1:(5,1),2:(6,-1),5:(1,-1),6:(2,1)}, 5:{1:(4,1),3:(6,-1),4:(1,-1),6:(3,1)},
 6:{1:(3,-1),3:(1,1),4:(6,-1),6:(4,1)}, 7:{1:(2,-1),2:(1,1),5:(6,-1),6:(5,1)},
 8:{1:(7,-1),2:(4,1),4:(2,-1),7:(1,1)}, 9:{1:(4,-1),2:(7,-1),4:(1,1),7:(2,1)},
 10:{1:(5,1),3:(7,-1),5:(1,-1),7:(3,1)}, 11:{1:(2,1),2:(1,-1),4:(7,-1),7:(4,1)},
 12:{1:(3,-1),3:(1,1),5:(7,-1),7:(5,1)}, 13:{2:(3,-1),3:(2,1),6:(7,-1),7:(6,1)},
}
def to_matrix(spec):
    M = [[F(0)]*8 for _ in range(8)]
    for row,(col,coeff) in spec.items(): M[row][col]=F(coeff)
    return M
D=[to_matrix(DMAPS[k]) for k in range(14)]
def matmul(A,B): return [[sum(A[i][k]*B[k][j] for k in range(8)) for j in range(8)] for i in range(8)]
def bracket(A,B): return [[matmul(A,B)[i][j]-matmul(B,A)[i][j] for j in range(8)] for i in range(8)]
def flat(M): return [M[i][j] for i in range(8) for j in range(8)]
BC=[flat(D[k]) for k in range(14)]
def solve(target):
    rows=[[BC[k][c] for k in range(14)]+[target[c]] for c in range(64)]
    r=0; piv=[]
    for c in range(14):
        p=None
        for i in range(r,64):
            if rows[i][c]!=0: p=i;break
        if p is None: continue
        rows[r],rows[p]=rows[p],rows[r]
        pv=rows[r][c]; rows[r]=[x/pv for x in rows[r]]
        for i in range(64):
            if i!=r and rows[i][c]!=0:
                f=rows[i][c]; rows[i]=[a-f*b for a,b in zip(rows[i],rows[r])]
        piv.append(c); r+=1
    c=[F(0)]*14
    for idx,col in enumerate(piv): c[col]=rows[idx][14]
    return c

def fmt_coeff(c):
    return str(c.numerator) if c.denominator==1 else f"{c.numerator}/{c.denominator}"

def rhs_lean(terms):
    if not terms: return "0"
    parts=[]
    for k,c in terms:
        if c==1: parts.append(f"D{k}E")
        elif c==-1: parts.append(f"-D{k}E")
        else: parts.append(f"(({fmt_coeff(c)} : ℚ)) • D{k}E")
    s=parts[0]
    for p in parts[1:]:
        s += f" + {p}" if not p.startswith("-") else f" + ({p})"
    return s

SIMP = ("LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,\n"
        "      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,\n"
        "      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,\n"
        "      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,\n"
        "      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,\n"
        "      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,\n"
        "      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im")

for i in range(14):
    for j in range(i+1,14):
        terms=[(k,c) for k,c in enumerate(solve(flat(bracket(D[i],D[j])))) if c!=0]
        rhs=rhs_lean(terms)
        name=f"br_{i}_{j}"
        # LHS shown form: DiE * DjE - DjE * DiE
        print(f"/-- Structure constant: ⁅D{i}E, D{j}E⁆ = {rhs}. -/")
        print(f"theorem {name} : ⁅D{i}E, D{j}E⁆ = {rhs} := by")
        print(f"  show D{i}E * D{j}E - D{j}E * D{i}E = {rhs}")
        print(f"  ext z <;>")
        print(f"    simp only [{SIMP}] <;> ring")
        print()
