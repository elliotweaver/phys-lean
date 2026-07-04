"""
N293 — verify the FINAL pure-ℚ matrix identities in the exact form the Lean closure produces.
kAB=adE(u1M P_AB), P_AB = qA*pB - pB*qA.
⁅adE(u1M P_AB),adE(u1M P_BC)⁆ = adE(u1M P_AB * u1M P_BC - u1M P_BC * u1M P_AB)
  = adE(-ocRM(P_AB*P_BC) - (-ocRM(P_BC*P_AB)))  [u1M_mul]
  = adE(ocRM(P_BC*P_AB) - ocRM(P_AB*P_BC))
  = adE(ocRM(P_BC*P_AB - P_AB*P_BC))   [ocRM_sub]
famB = adE(ocRM(pC*pA - pA*pC)).
So need: P_BC*P_AB - P_AB*P_BC == pC*pA - pA*pC   (pure ℚ 3x3).
Cyclic for the other two.
"""
from fractions import Fraction as F
def MM(P,Q): return [[sum(P[i][k]*Q[k][j] for k in range(3)) for j in range(3)] for i in range(3)]
def SUB(P,Q): return [[P[i][j]-Q[i][j] for j in range(3)] for i in range(3)]
def NEG(P): return [[-P[i][j] for j in range(3)] for i in range(3)]
def eq(P,Q): return all(P[i][j]==Q[i][j] for i in range(3) for j in range(3))
f=F
qA=[[f(0),f(1),f(0)],[f(-1),f(0),f(0)],[f(0),f(0),f(0)]]
qB=[[f(0),f(0),f(1)],[f(0),f(0),f(0)],[f(-1),f(0),f(0)]]
qC=[[f(0),f(0),f(0)],[f(0),f(0),f(1)],[f(0),f(-1),f(0)]]
pA=[[f(0),f(1),f(0)],[f(1),f(0),f(0)],[f(0),f(0),f(0)]]
pB=[[f(0),f(0),f(1)],[f(0),f(0),f(0)],[f(1),f(0),f(0)]]
pC=[[f(0),f(0),f(0)],[f(0),f(0),f(1)],[f(0),f(1),f(0)]]
P_AB=SUB(MM(qA,pB),MM(pB,qA))
P_BC=SUB(MM(qB,pC),MM(pC,qB))
P_CA=SUB(MM(qC,pA),MM(pA,qC))
# closure ⁅kAB,kBC⁆=famB: need P_BC*P_AB - P_AB*P_BC == pC*pA-pA*pC
lhs1=SUB(MM(P_BC,P_AB),MM(P_AB,P_BC)); famB_src=SUB(MM(pC,pA),MM(pA,pC))
print("⁅kAB,kBC⁆: P_BC*P_AB - P_AB*P_BC == pC*pA-pA*pC ?", eq(lhs1,famB_src))
# ⁅kBC,kCA⁆=famC: P_CA*P_BC - P_BC*P_CA == pA*pB-pB*pA
lhs2=SUB(MM(P_CA,P_BC),MM(P_BC,P_CA)); famC_src=SUB(MM(pA,pB),MM(pB,pA))
print("⁅kBC,kCA⁆: P_CA*P_BC - P_BC*P_CA == pA*pB-pB*pA ?", eq(lhs2,famC_src))
# ⁅kCA,kAB⁆=-famA: P_AB*P_CA - P_CA*P_AB == -(pB*pC-pC*pB)
lhs3=SUB(MM(P_AB,P_CA),MM(P_CA,P_AB)); famA_src=SUB(MM(pB,pC),MM(pC,pB))
print("⁅kCA,kAB⁆: P_AB*P_CA - P_CA*P_AB == -(pB*pC-pC*pB) ?", eq(lhs3,NEG(famA_src)))
print("\nP_AB =",P_AB)
print("P_BC =",P_BC)
print("P_CA =",P_CA)
