#!/usr/bin/env python3
"""N257 — extract the 7 crossOp structure matrices Km[i] in the qI convention and verify
   tr7(mul7 Km[i] Km[j]) = -6·δ_ij  (the integer-matrix identity the Lean `decide` will close),
   AND gForm(imBasis i, imBasis j) = δ_ij."""
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
ImO=list(range(1,8))
def reQ(z): return o_to_vec(z)[0]
def gForm(x,y): return reQ(o_mul(x,o_star(y)))
def octCrossO(a,b): return o_add(o_mul(a,b), o_from_vec([gForm(a,b)]+[F(0)]*7))
# imBasis = ![u1=e1, e2, e3, e4, e5, e6, e7]  (the coordinate imaginary units)
imBasis=[basis(i) for i in range(1,8)]
def mat(op):
    A=[[0]*7 for _ in range(7)]
    for jc,j in enumerate(ImO):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(ImO): A[ic][jc]=int(out[i])
    return A
Km=[mat(lambda x,a=imBasis[i]: octCrossO(a,x)) for i in range(7)]
def mul7(A,B): return [[sum(A[r][t]*B[t][c] for t in range(7)) for c in range(7)] for r in range(7)]
def tr7(A): return sum(A[i][i] for i in range(7))

print("=== tr7(mul7 Km[i] Km[j]) Gram (should be -6·I) ===")
allok=True
for i in range(7):
    row=[tr7(mul7(Km[i],Km[j])) for j in range(7)]
    print("  ",row)
    for j in range(7):
        want=-6 if i==j else 0
        if row[j]!=want: allok=False
print("  tr7(mul7 Km[i] Km[j]) == -6·δ_ij for all i,j:",allok)

print("\n=== gForm(imBasis i)(imBasis j) Gram (should be I) ===")
gok=True
for i in range(7):
    row=[int(gForm(imBasis[i],imBasis[j])) for j in range(7)]
    for j in range(7):
        want=1 if i==j else 0
        if row[j]!=want: gok=False
print("  gForm(imBasis i)(imBasis j) == δ_ij for all i,j:",gok)

# Dump the 7 matrices in Lean M7 (Matrix (Fin 7)(Fin 7) ℤ) !![...] format
print("\n=== Lean M7 literals (Km 0 .. Km 6) ===")
for i in range(7):
    rows=" ; ".join(", ".join(str(Km[i][r][c]) for c in range(7)) for r in range(7))
    print(f"-- Km {i}:  !![{rows}]")
# also verify Km[0] equals the banked Cmat (crossOp u1 = chargeOp = qI Cmat)? print Km0
print("\nKm[0] (=chargeOp structure matrix, should match banked Cmat):")
for r in Km[0]: print("  ",r)
