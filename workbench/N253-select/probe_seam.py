#!/usr/bin/env python3
"""
N253 SELECT probe — is the gather charge axis u1 the embedded weak-isospin unit,
and how does chargeOp = crossOp u1 relate to the weak-isospin su(2)?

Faithful exact-rational O ℚ = CD(CD(Dbl ℚ)), byte-for-byte the banked Lean product.
Reuses the N16 model construction inline.
"""
from fractions import Fraction as F

def dbl_mul(z,w): return (z[0]*w[0]-z[1]*w[1], z[0]*w[1]+z[1]*w[0])
def dbl_star(z): return (z[0],-z[1])
def dbl_add(z,w): return (z[0]+w[0], z[1]+w[1])
def dbl_neg(z): return (-z[0],-z[1])
DZ=(F(0),F(0))
def make_CD(mul,star,add,neg,zero):
    def cd_mul(z,w):
        zr,zi=z; wr,wi=w
        return (add(mul(zr,wr),neg(mul(star(wi),zi))), add(mul(wi,zr),mul(zi,star(wr))))
    def cd_star(z): return (star(z[0]),neg(z[1]))
    def cd_add(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
    def cd_neg(z): return (neg(z[0]),neg(z[1]))
    return cd_mul,cd_star,cd_add,cd_neg,(zero,zero)
h_mul,h_star,h_add,h_neg,h_zero=make_CD(dbl_mul,dbl_star,dbl_add,dbl_neg,DZ)
o_mul,o_star,o_add,o_neg,o_zero=make_CD(h_mul,h_star,h_add,h_neg,h_zero)

def o_from_vec(v):
    def dbl(b): return (v[b+0],v[b+1])
    def h(b): return (dbl(b+0),dbl(b+2))
    return (h(0),h(4))
def o_to_vec(z):
    v=[None]*8
    for oi in (0,1):
        H=z[oi]
        for hi in (0,1):
            D=H[hi]
            for di in (0,1): v[oi*4+hi*2+di]=D[di]
    return v
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return o_from_vec(v)
E=[basis(i) for i in range(8)]

# --- banked u1 = <<<0,1>,<0,0>>,<<0,0>,<0,0>>>  (Lean DerivationUpperBound.lean:66)
# octonion = (H_re, H_im); H=(Dbl_re,Dbl_im); Dbl=(q0,q1)
# u1 = ((( (0,1), (0,0) ), ( (0,0),(0,0) )))
u1 = (((F(0),F(1)),(F(0),F(0))), ((F(0),F(0)),(F(0),F(0))))
print("u1 coords:", o_to_vec(u1), " == e1?", o_to_vec(u1)==o_to_vec(E[1]))

# --- embedded weak-isospin units: hI,hJ,hK in H ℚ, embedded via iotaO: a -> <a,0>
# In H ℚ = CD(Dbl ℚ): hI = ι J = <J,0> = <(0,1),(0,0)>; hJ = <0,1>=<(0,0),(0,1)>? 
# From N184: hI=ιJ, hJ=e2(=κ1), hK=hI*hJ. Let's just embed the three imaginary H-units.
# H imaginary basis: (Dbl_im part) hI corresponds to Dbl-J in first slot, etc.
# iotaO(a in H) = <a, 0_H> as octonion.  So iotaO(hI) has octonion coords = e1.
def iotaO(a_H):  # a_H is an H element (pair of Dbl)
    return (a_H, h_zero)
def kappaO(b_H):
    return (h_zero, b_H)
hI = ((F(0),F(1)),(F(0),F(0)))   # <J,0> in H
hJ = ((F(0),F(0)),(F(1),F(0)))   # <0,1> in H = e2 of H
hK = h_mul(hI,hJ)
print("hI(H) as oct e-index via iotaO:", o_to_vec(iotaO(hI)))
print("hJ(H) as oct via iotaO:", o_to_vec(iotaO(hJ)))
print("hK(H) as oct via iotaO:", o_to_vec(iotaO(hK)))
print("u1 == iotaO(hI)?", o_to_vec(u1)==o_to_vec(iotaO(hI)))

# --- ImO basis: e1..e7
ImO_idx=list(range(1,8))

# gForm on ImO: gForm x y = (x * star y).re  (Born self-overlap real part), 
# for imaginary y star y=-y. octCross x y = x*y + gForm(x,y)*1. On ImO both imaginary.
def reQ(z): return o_to_vec(z)[0]
def gForm(x,y):
    return reQ(o_mul(x, o_star(y)))
def octCrossO(a,b):
    prod=o_mul(a,b)
    g=gForm(a,b)
    # + g * 1
    return o_add(prod, o_from_vec([g]+[F(0)]*7))
# chargeOp on ImO: x -> crossOp u1 x = octCrossO u1 x   (restricted to ImO)
def chargeOp(x): return octCrossO(u1,x)

print("\n=== chargeOp = crossOp u1 acting on e1..e7 (coords) ===")
M=[[F(0)]*7 for _ in range(7)]  # columns indexed by input e_j (j in 1..7), rows output e_i
for jc,j in enumerate(ImO_idx):
    out=o_to_vec(chargeOp(E[j]))
    print(f" chargeOp(e{j}) = {out}")
    for ic,i in enumerate(ImO_idx):
        M[ic][jc]=out[i]

# --- weak isospin su(2) generators: innerDeriv P (x)= P*x - x*P for P imaginary in O (embedded from H)
def innerDeriv(P, x): return o_add(o_mul(P,x), o_neg(o_mul(x,P)))
def adH_gen(P_oct):
    """matrix of innerDeriv P_oct on ImO"""
    A=[[F(0)]*7 for _ in range(7)]
    for jc,j in enumerate(ImO_idx):
        out=o_to_vec(innerDeriv(P_oct,E[j]))
        for ic,i in enumerate(ImO_idx):
            A[ic][jc]=out[i]
    return A
Pi=iotaO(hI); Pj=iotaO(hJ); Pk=iotaO(hK)
AI=adH_gen(Pi); AJ=adH_gen(Pj); AK=adH_gen(Pk)

def matmul(A,B):
    n=len(A);m=len(B[0]);k=len(B)
    return [[sum(A[r][t]*B[t][c] for t in range(k)) for c in range(m)] for r in range(n)]
def matsub(A,B): return [[A[r][c]-B[r][c] for c in range(len(A[0]))] for r in range(len(A))]
def commutator(A,B): return matsub(matmul(A,B),matmul(B,A))
def iszero(A): return all(all(x==0 for x in r) for r in A)
def eq(A,B): return iszero(matsub(A,B))

# chargeOp matrix
CM=M
print("\n=== does chargeOp commute with innerDeriv hI/hJ/hK (the weak su(2))? ===")
for name,A in [("adhI",AI),("adhJ",AJ),("adhK",AK)]:
    c=commutator(CM,A)
    print(f"  [chargeOp, {name}] == 0 ?", iszero(c))

# Is chargeOp itself proportional to one of the su(2) generators or in their span?
print("\n=== chargeOp vs 2*innerDeriv hI ? (is the charge op the isospin generator restricted?) ===")
twoAI=[[2*x for x in r] for r in AI]
print("  chargeOp == innerDeriv hI ?", eq(CM,AI))
print("  chargeOp == 2 innerDeriv hI ?", eq(CM,twoAI))
# chargeOp^2
CM2=matmul(CM,CM)
print("\n chargeOp^2 (should relate to -id on the 6-dim complement, 0 on singlet):")
for r in CM2: print("   ",r)
