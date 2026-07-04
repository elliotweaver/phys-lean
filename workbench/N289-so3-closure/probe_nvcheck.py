from fractions import Fraction as F
import numpy as np
pA=np.array([[0,1,0],[1,0,0],[0,0,0]],dtype=object)
pB=np.array([[0,0,1],[0,0,0],[1,0,0]],dtype=object)
pC=np.array([[0,0,0],[0,0,1],[0,1,0]],dtype=object)
Kb=pC@pA-pA@pC
# adE(Kb)(slotA1) = Kb*sA1 - sA1*Kb, sA1 = pA (as central matrix)
val=Kb@pA - pA@Kb
print('Kb = pC*pA - pA*pC =\n',Kb)
print('adE(Kb)(slotA1) = Kb*pA - pA*Kb =\n',val)
print('(1,2) entry =',val[1,2])
# also innerMul(sC1,sA1)(sA1) directly should equal this (the collapse) — trust the collapse lemma.
