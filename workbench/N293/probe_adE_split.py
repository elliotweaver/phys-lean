"""
N293 — two candidate CLEAN routes for the mixed-Leibniz crux:
(A) Is kAB = adE(K_AB) for some matrix K (like N289 collapse)? If so the whole closure
    collapses to matrix commutators (nuclear where possible).
(B) Herm/anti-Herm split: does the mixed-Leibniz d(A,B,C,X)=0 hold separately on Herm X
    (via innerMul_leibniz_herm) and anti-Herm X (needs its own reason)?
"""
from fractions import Fraction as F
import sys
sys.path.insert(0,'/Users/elliotweaver/phys-lean/workbench/N293')
from probe_route import (E,one,u1,O0,oadd,osub,omul,ostar,oneg,M0,mmul,madd,msub,jb,
    slot,sA,sB,sC,DIM,m2v,op_cols,comm_cols,Lmul,innerMul,cols_eq,cols_zero,cols_scale,
    cols_sub,innerMul_apply,mat_eq,mat_zero,flat,basisM,apply_cols,unflat)

def adE_apply(K,X): return msub(mmul(K,X),mmul(X,K))
def adE_cols(K): return op_cols(lambda X: adE_apply(K,X))
def mconj(M):  # conjugate transpose
    return [[ostar(M[j][i]) for j in range(3)] for i in range(3)]
def is_herm(M): return mat_eq(mconj(M),M)

# (A) is kAB = adE(K) for K = comm of slots?
kAB=innerMul(sA(u1),sB(one))
KAB=msub(mmul(sA(u1),sB(one)), mmul(sB(one),sA(u1)))
print("(A) kAB == adE(slotA u1 * slotB 1 - slotB 1 * slotA 1)?", cols_eq(kAB, adE_cols(KAB)))
# try anti-commutator style / other K
KAB2=madd(mmul(sA(u1),sB(one)), mmul(sB(one),sA(u1)))
print("    kAB == adE(anticomm)?", cols_eq(kAB, adE_cols(KAB2)))
# brute: solve for K such that adE(K)=kAB? adE is linear in K; check if kAB in image of adE.
# Simpler: adE(K)(I-ish)... skip. Instead test the family (central) ones are adE (known) and coset not.

# (B) Herm/anti-Herm split of the mixed-Leibniz for C=slotC 1 and C=slotB u1
def herm_part(X): return [[ oadd(X[i][j], ostar(X[j][i])) for j in range(3)] for i in range(3)]  # 2*Xh
def anti_part(X): return [[ osub(X[i][j], ostar(X[j][i])) for j in range(3)] for i in range(3)]  # 2*Xa
# d(A,B,C,X) = innerMul A B (jb C X) - jb (innerMul A B C) X - jb C (innerMul A B X)
def defect(A,B,C,X):
    D_jbCX=innerMul_apply(A,B, jb(C,X))
    DC=innerMul_apply(A,B,C)
    DX=innerMul_apply(A,B,X)
    return msub(msub(D_jbCX, jb(DC,X)), jb(C,DX))
import random
random.seed(1)
def randmat():
    M=M0()
    for i in range(3):
        for j in range(3):
            M[i][j]=unflat([F(random.randint(-3,3)) for _ in range(8)])
    return M
for (Cn,C) in [("slotC 1",sC(one)),("slotB u1",sB(u1))]:
    okh=oka=True
    for _ in range(20):
        X=randmat()
        Xh=herm_part(X)  # =2*Xh, Hermitian
        Xa=anti_part(X)  # =2*Xa, anti-Hermitian
        if not mat_zero(defect(sA(u1),sB(one),C,Xh)): okh=False
        if not mat_zero(defect(sA(u1),sB(one),C,Xa)): oka=False
    print(f"(B) C={Cn}: defect==0 on Herm X? {okh}   on anti-Herm X? {oka}")
    print(f"     is herm_part Hermitian? {is_herm(herm_part(randmat()))}  anti-part anti-Herm? {mat_eq(mconj(anti_part(randmat())), [[oneg(anti_part(randmat())[i][j]) for j in range(3)] for i in range(3)]) if False else 'skip'}")

# Confirm innerMul_leibniz_herm covers the Herm case: for C,X Hermitian, defect==0 (that's the banked lemma)
print("\n(B') sanity: defect(slotA u1,slotB 1, slotC 1, Herm)==0 matches innerMul_leibniz_herm scope")
