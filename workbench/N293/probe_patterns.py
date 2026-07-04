"""
N293 — pin the exact u1M/ocRM patterns for slotA u1 and the K matrices.
slotA u1 should = u1M pA (since slotA u1 has u1 at (0,1) and star u1=-u1 at (1,0)).
Check: is slotA u1 = u1M pA where pA=!![0,1,0;1,0,0;0,0,0]? star(ocR 1 * u1)=star u1=-u1; u1M pA (1,0)=ocR 1*u1=u1. But slotA u1 (1,0)=star u1=-u1. MISMATCH sign.
So slotA u1 = u1M of an ANTISYMMETRIC pattern? Let's determine.
Then KAB = slotA u1 * slotB 1 - slotB 1 * slotA u1 = u1M(?)*ocRM(pB)-ocRM(pB)*u1M(?).
Determine KAB as u1M of a rational pattern, and the matrix identity [KAB,KBC]=KfB.
"""
from fractions import Fraction as F
import sys
sys.path.insert(0,'/Users/elliotweaver/phys-lean/workbench/N293')
from probe_route import (E,one,u1,O0,oadd,osub,omul,ostar,oneg,M0,mmul,madd,msub,jb,
    slot,sA,sB,sC,flat,unflat)
def mcomm(A,B): return msub(mmul(A,B),mmul(B,A))
def u1M(P):
    M=M0()
    for i in range(3):
        for j in range(3):
            M[i][j]=omul(unflat([P[i][j] if k==0 else F(0) for k in range(8)]), u1)
    return M
def ocRM(P):
    M=M0()
    for i in range(3):
        for j in range(3): M[i][j]=unflat([P[i][j] if k==0 else F(0) for k in range(8)])
    return M
def mat_eq(A,B): return all(flat(A[i][j])==flat(B[i][j]) for i in range(3) for j in range(3))
def as_u1M(K):  # extract rational pattern P s.t. K=u1M P (assumes each entry = p*u1)
    P=[[None]*3 for _ in range(3)]
    ok=True
    for i in range(3):
        for j in range(3):
            v=flat(K[i][j])
            # v should be [0,p,0,0,0,0,0,0] (p*u1)
            if all(x==0 for x in v): P[i][j]=F(0)
            elif v[1]!=0 and all(v[k]==0 for k in range(8) if k!=1): P[i][j]=v[1]
            else: ok=False; P[i][j]=None
    return P,ok
# patterns from N289
pA=[[F(0),F(1),F(0)],[F(1),F(0),F(0)],[F(0),F(0),F(0)]]
pB=[[F(0),F(0),F(1)],[F(0),F(0),F(0)],[F(1),F(0),F(0)]]
pC=[[F(0),F(0),F(0)],[F(0),F(0),F(1)],[F(0),F(1),F(0)]]

# slotA u1 pattern
PsAu1,ok=as_u1M(sA(u1)); print("slotA u1 = u1M of", PsAu1, "ok",ok)
PsBu1,_=as_u1M(sB(u1)); print("slotB u1 = u1M of", PsBu1)
PsCu1,_=as_u1M(sC(u1)); print("slotC u1 = u1M of", PsCu1)
# so slotA u1 = u1M(qA) with qA antisymmetric. Note star u1=-u1.
qA=PsAu1; qB=PsBu1; qC=PsCu1

# KAB = slotA u1 * slotB 1 - slotB 1 * slotA u1. slotB 1 = ocRM pB.
KAB=mcomm(sA(u1),sB(one)); PKAB,ok=as_u1M(KAB); print("\nKAB pattern (u1M)",PKAB,"ok",ok)
KBC=mcomm(sB(u1),sC(one)); PKBC,ok=as_u1M(KBC); print("KBC pattern",PKBC,"ok",ok)
KCA=mcomm(sC(u1),sA(one)); PKCA,ok=as_u1M(KCA); print("KCA pattern",PKCA,"ok",ok)
# famB source: KfB = slotC 1 * slotA 1 - slotA 1 * slotC 1 = ocRM(pC*pA-pA*pC)
def matmulQ(P,Q): return [[sum(P[i][k]*Q[k][j] for k in range(3)) for j in range(3)] for i in range(3)]
def matsubQ(P,Q): return [[P[i][j]-Q[i][j] for j in range(3)] for i in range(3)]
KfB=mcomm(sC(one),sA(one))
# is KfB = ocRM(pC*pA-pA*pC)?
print("\nKfB == ocRM(pC*pA - pA*pC)?", mat_eq(KfB, ocRM(matsubQ(matmulQ(pC,pA),matmulQ(pA,pC)))))

# THE KEY matrix identity in u1M/ocRM land: u1M(qA-ish)... actually KAB=u1M(PKAB). 
# [KAB,KBC] = KAB*KBC - KBC*KAB. Since both u1M, and u1*u1=-1, product lands in ocRM (real).
# Verify: KAB*KBC (matrix over O) - what pattern? Should be ocRM(-(PKAB*PKBC)) since u1M P*u1M Q entrywise=... 
# Actually (u1M P * u1M Q)_ij = sum_k (P_ik u1)(Q_kj u1) = sum_k P_ik Q_kj (u1*u1)= -sum P_ik Q_kj = -(P*Q)_ij real.
# So u1M P * u1M Q = ocRM(-(P*Q)) = -ocRM(P*Q).  => [KAB,KBC]=u1MP*u1MQ-u1MQ*u1MP=-ocRM(PKAB*PKBC)+ocRM(PKBC*PKAB)=ocRM(PKBC*PKAB-PKAB*PKBC)
prodL=ocRM([[-sum(PKAB[i][k]*PKBC[k][j] for k in range(3)) for j in range(3)] for i in range(3)])
print("\nKAB*KBC == ocRM(-(PKAB*PKBC))?", mat_eq(mmul(KAB,KBC), prodL))
# [KAB,KBC] == KfB ?
comm_mat=mcomm(KAB,KBC)
print("[KAB,KBC] == KfB (=famB source)?", mat_eq(comm_mat,KfB))
# as ocRM pattern:
def as_ocRM(K):
    P=[[None]*3 for _ in range(3)]; ok=True
    for i in range(3):
        for j in range(3):
            v=flat(K[i][j])
            if all(x==0 for x in v): P[i][j]=F(0)
            elif all(v[k]==0 for k in range(8) if k!=0): P[i][j]=v[0]
            else: ok=False
    return P,ok
Pcomm,ok=as_ocRM(comm_mat); print("[KAB,KBC] ocRM pattern",Pcomm,"ok",ok)
PfB,_=as_ocRM(KfB); print("KfB ocRM pattern",PfB)
