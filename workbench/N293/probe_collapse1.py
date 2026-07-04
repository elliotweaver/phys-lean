"""
N293 — verify the ONE-CENTRAL collapse and the exact associativity needs.
By innerMul_antisymm, kAB = innerMul(slotA u1)(slotB 1) = -innerMul(slotB 1)(slotA u1).
slotB 1 = ocRM pB is CENTRAL. So test the LEFT-central collapse:
    innerMul (ocRM P) B = adE(ocRM P * B - B * ocRM P)   for arbitrary B.
And identify which ocR-associativity rewrites close it (mirror N289 collapse).
Also verify the whole closure works purely at adE/matrix level with these.
"""
from fractions import Fraction as F
import sys
sys.path.insert(0,'/Users/elliotweaver/phys-lean/workbench/N293')
from probe_route import (E,one,u1,O0,oadd,osub,omul,ostar,oneg,M0,mmul,madd,msub,jb,
    slot,sA,sB,sC,DIM,m2v,op_cols,comm_cols,Lmul,innerMul,cols_eq,cols_zero,cols_scale,
    cols_sub,innerMul_apply,mat_eq,mat_zero,flat,basisM,apply_cols,unflat)
import random
def adE_apply(K,X): return msub(mmul(K,X),mmul(X,K))
def adE_cols(K): return op_cols(lambda X: adE_apply(K,X))
def mcomm(A,B): return msub(mmul(A,B),mmul(B,A))
def ocRM(P):  # P is 3x3 rationals -> central matrix
    M=M0()
    for i in range(3):
        for j in range(3):
            M[i][j]=unflat([P[i][j] if k==0 else F(0) for k in range(8)])
    return M
pB=[[F(0),F(0),F(1)],[F(0),F(0),F(0)],[F(1),F(0),F(0)]]
pA=[[F(0),F(1),F(0)],[F(1),F(0),F(0)],[F(0),F(0),F(0)]]
pC=[[F(0),F(0),F(0)],[F(0),F(0),F(1)],[F(0),F(1),F(0)]]
random.seed(5)
def rand_mat():
    M=M0()
    for i in range(3):
        for j in range(3): M[i][j]=unflat([F(random.randint(-2,2)) for _ in range(8)])
    return M

# LEFT-central collapse: innerMul(ocRM P) B == adE(ocRM P*B - B*ocRM P) for arbitrary B?
print("LEFT-central collapse innerMul(ocRM P) B == adE(ocRM P*B - B*ocRM P):")
okL=True
for _ in range(15):
    B=rand_mat()
    if not cols_eq(innerMul(ocRM(pB),B), adE_cols(mcomm(ocRM(pB),B))): okL=False
print("  holds for arbitrary B?", okL)
# RIGHT-central collapse: innerMul A (ocRM Q) == adE(A*ocRM Q - ocRM Q*A) for arbitrary A?
print("RIGHT-central collapse innerMul A (ocRM Q):")
okR=True
for _ in range(15):
    A=rand_mat()
    if not cols_eq(innerMul(A,ocRM(pB)), adE_cols(mcomm(A,ocRM(pB)))): okR=False
print("  holds for arbitrary A?", okR)

# So kAB = innerMul(slotA u1)(slotB 1), slotB 1 = ocRM pB central (2nd arg) -> RIGHT-central collapse.
KAB=mcomm(sA(u1),ocRM(pB))
print("kAB == adE(slotA u1 * ocRM pB - ocRM pB * slotA u1)?", cols_eq(innerMul(sA(u1),ocRM(pB)), adE_cols(KAB)))
print("slotB 1 == ocRM pB?", mat_eq(sB(one),ocRM(pB)))

# Now the adE-Lie-hom for the u1-carrying K's: ⁅adE KAB, adE KBC⁆ = adE([KAB,KBC]).
# KAB,KBC entries in C-line. Verify + check associator-vanishing is the reason.
KBC=mcomm(sB(u1),ocRM(pC))
KfB=mcomm(ocRM(pC),ocRM(pA))  # famB source (both central)
print("⁅adE KAB, adE KBC⁆ == adE([KAB,KBC])?", cols_eq(comm_cols(adE_cols(KAB),adE_cols(KBC)), adE_cols(mcomm(KAB,KBC))))
print("[KAB,KBC] == KfB (matrix)?", mat_eq(mcomm(KAB,KBC), KfB))
print("adE(KfB) == famB?", cols_eq(adE_cols(KfB), innerMul(sC(one),sA(one))))
print("famB == innerMul(slotC 1)(slotA 1)?", cols_eq(innerMul(sC(one),sA(one)), innerMul(ocRM(pC),ocRM(pA))))
