"""Verify the pure-ℚ matrix so(3) identity that closes ⁅famC,famA⁆=famB after collapse.
famC=innerMul(ocRM pA)(ocRM pB) → adE(ocRM(pA*pB-pB*pA))
famA=innerMul(ocRM pB)(ocRM pC) → adE(ocRM(pB*pC-pC*pB))
famB=innerMul(ocRM pC)(ocRM pA) → adE(ocRM(pC*pA-pA*pC))
⁅famC,famA⁆ = adE(ocRM( KC*KA - KA*KC )), KC=pA*pB-pB*pA, KA=pB*pC-pC*pB
closure ⟺  KC*KA - KA*KC = pC*pA - pA*pC   (pure ℚ 3x3)
"""
from fractions import Fraction as F
import numpy as np
pA=np.array([[0,1,0],[1,0,0],[0,0,0]],dtype=object)
pB=np.array([[0,0,1],[0,0,0],[1,0,0]],dtype=object)
pC=np.array([[0,0,0],[0,0,1],[0,1,0]],dtype=object)
def comm(P,Q): return P@Q - Q@P
KC=comm(pA,pB); KA=comm(pB,pC); KB=comm(pC,pA)
print("KC = pA*pB-pB*pA =\n",KC)
print("KA = pB*pC-pC*pB =\n",KA)
print("KB = pC*pA-pA*pC =\n",KB)
lhs = KC@KA - KA@KC
print("KC*KA - KA*KC =\n", lhs)
print("== KB (pC*pA-pA*pC)?", np.array_equal(lhs, KB))
# also cyclic:
print("\ncyclic:")
print("KA*KB-KB*KA == KC?", np.array_equal(KA@KB-KB@KA, comm(pA,pB)))
print("KB*KC-KC*KB == KA?", np.array_equal(KB@KC-KC@KB, comm(pB,pC)))
