from fractions import Fraction as F
import numpy as np
# Just double-check the entries so I can pick the closing tactic.
pA=np.array([[0,1,0],[1,0,0],[0,0,0]],dtype=object)
pB=np.array([[0,0,1],[0,0,0],[1,0,0]],dtype=object)
pC=np.array([[0,0,0],[0,0,1],[0,1,0]],dtype=object)
def comm(P,Q): return P@Q-Q@P
print("LHS_CA=", comm(comm(pA,pB),comm(pB,pC)))
print("RHS_CA=", comm(pC,pA))
