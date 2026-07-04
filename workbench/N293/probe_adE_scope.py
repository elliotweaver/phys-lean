"""
N293 — decisive scope test for the adE route levers.
(1) Does innerMul A B = adE([A,B]) hold for ALL slot pairs (generic octonion entries)? all matrices?
(2) Does ⁅adE K1, adE K2⁆ = adE([K1,K2]) hold for the specific K's, and more generally?
Determine the exact Lean lemma scope.
"""
from fractions import Fraction as F
import sys, random
sys.path.insert(0,'/Users/elliotweaver/phys-lean/workbench/N293')
from probe_route import (E,one,u1,O0,oadd,osub,omul,ostar,oneg,M0,mmul,madd,msub,jb,
    slot,sA,sB,sC,DIM,m2v,op_cols,comm_cols,Lmul,innerMul,cols_eq,cols_zero,cols_scale,
    cols_sub,innerMul_apply,mat_eq,mat_zero,flat,basisM,apply_cols,unflat)

def adE_apply(K,X): return msub(mmul(K,X),mmul(X,K))
def adE_cols(K): return op_cols(lambda X: adE_apply(K,X))
def mcomm(A,B): return msub(mmul(A,B),mmul(B,A))
random.seed(3)
def rand_oct(): return unflat([F(random.randint(-2,2)) for _ in range(8)])
def rand_slot(which):
    c=rand_oct()
    return {'A':sA,'B':sB,'C':sC}[which](c)
def rand_mat():
    M=M0()
    for i in range(3):
        for j in range(3): M[i][j]=rand_oct()
    return M

print("(1a) innerMul A B == adE([A,B]) for RANDOM slot pairs (any entries):")
ok_ss=True
for _ in range(15):
    w1,w2=random.choice('ABC'),random.choice('ABC')
    A,B=rand_slot(w1),rand_slot(w2)
    if not cols_eq(innerMul(A,B), adE_cols(mcomm(A,B))): ok_ss=False; print("   FAIL",w1,w2)
print("   all random slot pairs hold?", ok_ss)

print("(1b) innerMul A B == adE([A,B]) for RANDOM FULL matrices:")
ok_ff=True
for _ in range(8):
    A,B=rand_mat(),rand_mat()
    if not cols_eq(innerMul(A,B), adE_cols(mcomm(A,B))): ok_ff=False
print("   random full-matrix pairs hold?", ok_ff, "(expect False — non-assoc breaks it)")

print("(1c) innerMul A B == adE([A,B]) for one Herm-slot + generic full B:")
ok_sf=True
for _ in range(8):
    A=rand_slot(random.choice('ABC')); B=rand_mat()
    if not cols_eq(innerMul(A,B), adE_cols(mcomm(A,B))): ok_sf=False
print("   slot × full hold?", ok_sf)

# (2) Lie-hom scope for adE on the K matrices (K = comm of slots)
print("\n(2a) ⁅adE K1, adE K2⁆ == adE([K1,K2]) for K=comm of RANDOM slot pairs:")
ok2=True
for _ in range(10):
    A1,B1=rand_slot(random.choice('ABC')),rand_slot(random.choice('ABC'))
    A2,B2=rand_slot(random.choice('ABC')),rand_slot(random.choice('ABC'))
    K1,K2=mcomm(A1,B1),mcomm(A2,B2)
    if not cols_eq(comm_cols(adE_cols(K1),adE_cols(K2)), adE_cols(mcomm(K1,K2))): ok2=False
print("   holds for random slot-comm K's?", ok2)

print("(2b) ⁅adE K1, adE K2⁆ == adE([K1,K2]) for RANDOM full K1,K2:")
ok2b=True
for _ in range(8):
    K1,K2=rand_mat(),rand_mat()
    if not cols_eq(comm_cols(adE_cols(K1),adE_cols(K2)), adE_cols(mcomm(K1,K2))): ok2b=False
print("   holds for random full K's?", ok2b, "(expect False)")

# What distinguishes the good K's? They are commutators of slots. Print their structure.
KAB=mcomm(sA(u1),sB(one)); KBC=mcomm(sB(u1),sC(one))
def structure(K,nm):
    nz=[(i,j,flat(K[i][j])) for i in range(3) for j in range(3) if any(x!=0 for x in flat(K[i][j]))]
    print(f"   {nm}: nonzero at {[(i,j) for i,j,_ in nz]}")
structure(KAB,"KAB")
structure(KBC,"KBC")
structure(mcomm(sC(one),sA(one)),"KfB")
