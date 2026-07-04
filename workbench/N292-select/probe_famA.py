import numpy as np
from fractions import Fraction as F
exec(open('workbench/N292-select/probe_ops.py').read().split('# innerMul(slotA u1)')[0])
famA=innerMul(sB(I8[0]),sC(I8[0]))
famAsAu1=op_apply(famA, sA(u1))
showslot(famAsAu1,'famA(slotA u1)')
b=comm(famA, Lmul(sA(u1)))
print('[famA, Lmul(slotA u1)] == Lmul(famA(slotA u1))?', np.max(np.abs(b - Lmul(famAsAu1))))
print('famA(slotA u1) zero?', np.max(np.abs(famAsAu1))<1e-9)
# THE KEY: is the mixed leibniz [D, Lmul C] = Lmul(D C) TRUE for D=famA (a derivation) on ALL C?
import numpy as np2
bad=0
for B in fullbasis[:30]:
    lhs=comm(famA, Lmul(B)); rhs=Lmul(op_apply(famA,B))
    if np.max(np.abs(lhs-rhs))>1e-9: bad+=1
print('famA mixed-leibniz failures over 30 C:',bad,'(0 => famA IS a full-op jb-derivation)')
# and for kAB?
kAB=innerMul(sA(u1),sB(I8[0])); bad2=0
for B in fullbasis[:30]:
    lhs=comm(kAB, Lmul(B)); rhs=Lmul(op_apply(kAB,B))
    if np.max(np.abs(lhs-rhs))>1e-9: bad2+=1
print('kAB mixed-leibniz failures over 30 C:',bad2,'(if >0 => kAB NOT full-op derivation)')
