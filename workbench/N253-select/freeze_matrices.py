#!/usr/bin/env python3
"""Freeze the exact integer 7x7 matrices Cmat (chargeOp) and Imat (imRep DI) in the
qI convention (row i = output coord e_{i+1}, col j = input coord e_{j+1}), and the
three trace products, so PREREG records exact expected integers."""
# From probe_joint (qI convention: A[out_row][in_col]):
Cmat=[
 [0,0,0,0,0,0,0],
 [0,0,-1,0,0,0,0],
 [0,1,0,0,0,0,0],
 [0,0,0,0,-1,0,0],
 [0,0,0,1,0,0,0],
 [0,0,0,0,0,0,1],
 [0,0,0,0,0,-1,0],
]
Imat=[
 [0,0,0,0,0,0,0],
 [0,0,-2,0,0,0,0],
 [0,2,0,0,0,0,0],
 [0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0],
 [0,0,0,0,0,0,-2],
 [0,0,0,0,0,2,0],
]
def mul(A,B): return [[sum(A[i][k]*B[k][j] for k in range(7)) for j in range(7)] for i in range(7)]
def tr(A): return sum(A[i][i] for i in range(7))
print("tr7(Cmat*Cmat) = B(chargeOp,chargeOp) =", tr(mul(Cmat,Cmat)), " (expect -6)")
print("tr7(Imat*Imat) = B(imRep DI, imRep DI) =", tr(mul(Imat,Imat)), " (expect -16)")
print("tr7(Cmat*Imat) = B(chargeOp, imRep DI) =", tr(mul(Cmat,Imat)), " (expect 0)")
print("ratio check: 8*(-6) =", 8*tr(mul(Cmat,Cmat)), " 3*(-16) =", 3*tr(mul(Imat,Imat)), " equal?", 8*tr(mul(Cmat,Cmat))==3*tr(mul(Imat,Imat)))
# Also DJ, DK matrices for the full orthogonality (imRep DJ, imRep DK) -- from probe: TJ, TK
