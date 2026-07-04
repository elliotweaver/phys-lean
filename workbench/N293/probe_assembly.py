"""
N293 — pin the slotX u1 = u1M patterns and KAB = u1M patterns for the Lean assembly, and
verify the full closure via the adE route symbolically (already numerically confirmed).
Determine: slotA u1 = u1M qA with qA=!![0,1,0;-1,0,0;0,0,0], etc. And KAB=u1M PKAB.
Also: kAB = adE(KAB) where KAB = slotA u1 * slotB 1 - slotB 1 * slotA u1 (right-central collapse
gives kAB=innerMul(slotA u1)(ocRM pB)=adE(slotA u1*ocRM pB - ocRM pB*slotA u1)).
And KAB (as matrix) = u1M PKAB. Then adE_bracket_u1 needs KAB,KBC as u1M P,u1M Q.
So I must show slotA u1 * ocRM pB - ocRM pB * slotA u1 = u1M PKAB. Verify PKAB pattern.
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
        for j in range(3): M[i][j]=omul(unflat([P[i][j] if k==0 else F(0) for k in range(8)]),u1)
    return M
def ocRM(P):
    M=M0()
    for i in range(3):
        for j in range(3): M[i][j]=unflat([P[i][j] if k==0 else F(0) for k in range(8)])
    return M
def mat_eq(A,B): return all(flat(A[i][j])==flat(B[i][j]) for i in range(3) for j in range(3))
# patterns
qA=[[F(0),F(1),F(0)],[F(-1),F(0),F(0)],[F(0),F(0),F(0)]]   # slotA u1
qB=[[F(0),F(0),F(1)],[F(0),F(0),F(0)],[F(-1),F(0),F(0)]]   # slotB u1
qC=[[F(0),F(0),F(0)],[F(0),F(0),F(1)],[F(0),F(-1),F(0)]]   # slotC u1
pA=[[F(0),F(1),F(0)],[F(1),F(0),F(0)],[F(0),F(0),F(0)]]
pB=[[F(0),F(0),F(1)],[F(0),F(0),F(0)],[F(1),F(0),F(0)]]
pC=[[F(0),F(0),F(0)],[F(0),F(0),F(1)],[F(0),F(1),F(0)]]
print("slotA u1 == u1M qA?", mat_eq(sA(u1),u1M(qA)))
print("slotB u1 == u1M qB?", mat_eq(sB(u1),u1M(qB)))
print("slotC u1 == u1M qC?", mat_eq(sC(u1),u1M(qC)))
print("slotA 1 == ocRM pA?", mat_eq(sA(one),ocRM(pA)))
print("slotB 1 == ocRM pB?", mat_eq(sB(one),ocRM(pB)))
print("slotC 1 == ocRM pC?", mat_eq(sC(one),ocRM(pC)))
# KAB = slotA u1 * slotB 1 - slotB 1 * slotA u1 = u1M qA * ocRM pB - ocRM pB * u1M qA
# is this = u1M(PKAB)? PKAB from probe_patterns = !![0,0,0;0,0,-1;0,-1,0]
PKAB=[[F(0),F(0),F(0)],[F(0),F(0),F(-1)],[F(0),F(-1),F(0)]]
PKBC=[[F(0),F(1),F(0)],[F(1),F(0),F(0)],[F(0),F(0),F(0)]]
PKCA=[[F(0),F(0),F(-1)],[F(0),F(0),F(0)],[F(-1),F(0),F(0)]]
KAB=mcomm(sA(u1),sB(one)); print("\nKAB == u1M PKAB?", mat_eq(KAB,u1M(PKAB)))
KBC=mcomm(sB(u1),sC(one)); print("KBC == u1M PKBC?", mat_eq(KBC,u1M(PKBC)))
KCA=mcomm(sC(u1),sA(one)); print("KCA == u1M PKCA?", mat_eq(KCA,u1M(PKCA)))
# u1M PKAB * u1M PKBC - u1M PKBC * u1M PKAB = -ocRM(PKAB*PKBC) + ocRM(PKBC*PKAB) = ocRM(PKBC*PKAB - PKAB*PKBC)
def matmulQ(P,Q): return [[sum(P[i][k]*Q[k][j] for k in range(3)) for j in range(3)] for i in range(3)]
def matsubQ(P,Q): return [[P[i][j]-Q[i][j] for j in range(3)] for i in range(3)]
# famB = innerMul(slotC 1)(slotA 1) = adE(ocRM(pC*pA-pA*pC)) [N289 famB_eq_adE]
KfB_pat=matsubQ(matmulQ(pC,pA),matmulQ(pA,pC))
# [KAB,KBC] as ocRM: ocRM(PKBC*PKAB - PKAB*PKBC)
lhs_pat=matsubQ(matmulQ(PKBC,PKAB),matmulQ(PKAB,PKBC))
print("\n[KAB,KBC] pattern == famB source pattern (pC*pA-pA*pC)?", lhs_pat==KfB_pat)
print("  [KAB,KBC] pat =",lhs_pat)
print("  famB src  pat =",KfB_pat)
# Similarly cyclic
PfC=matsubQ(matmulQ(pA,pB),matmulQ(pB,pA))  # famC=innerMul(slotA1)(slotB1)=adE(ocRM(pA*pB-pB*pA))
lhsBC=matsubQ(matmulQ(PKCA,PKBC),matmulQ(PKBC,PKCA))
print("[KBC,KCA] pat == famC src (pA*pB-pB*pA)?", lhsBC==PfC)
PfA=matsubQ(matmulQ(pB,pC),matmulQ(pC,pB))   # famA=innerMul(slotB1)(slotC1)=adE(ocRM(pB*pC-pC*pB))
lhsCA=matsubQ(matmulQ(PKAB,PKCA),matmulQ(PKCA,PKAB))
negPfA=[[-PfA[i][j] for j in range(3)] for i in range(3)]
print("[KCA,KAB] pat == -famA src?", lhsCA==negPfA)
