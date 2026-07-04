import numpy as np
from fractions import Fraction as F
exec(open('workbench/N292-select/probe_ops.py').read().split('# innerMul(slotA u1)')[0])
kAB=innerMul(sA(u1),sB(I8[0])); kBC=innerMul(sB(u1),sC(I8[0])); kCA=innerMul(sC(u1),sA(I8[0]))
# generation-slot actions (the theory-native content: how the family-breaking moves generations)
print("=== kAB actions on real-unit slots (generation-moving, family-visible) ===")
for nm,M in [("slotA 1",sA(I8[0])),("slotB 1",sB(I8[0])),("slotC 1",sC(I8[0]))]:
    showslot(op_apply(kAB,M),f"kAB({nm})")
print("=== kBC ===")
for nm,M in [("slotA 1",sA(I8[0])),("slotB 1",sB(I8[0])),("slotC 1",sC(I8[0]))]:
    showslot(op_apply(kBC,M),f"kBC({nm})")
# Also confirm kAB moves the diagonal (already in N291) and the u1-dressed slots
print("=== kAB on diagonal ===")
for nm,M in [("Dg(1,0,0)",np.array([[I8[0],0*I8[0],0*I8[0]],[0*I8[0],0*I8[0],0*I8[0]],[0*I8[0],0*I8[0],0*I8[0]]]).transpose(0,1,2) if False else None)]:
    pass
def Dg(a,b,c):
    M=np.zeros((3,3,8)); M[0,0]=a*I8[0]; M[1,1]=b*I8[0]; M[2,2]=c*I8[0]; return M
showslot(op_apply(kAB,Dg(0,0,1)),"kAB(Dg 0 0 1)")
showslot(op_apply(kAB,Dg(0,1,0)),"kAB(Dg 0 1 0)")
