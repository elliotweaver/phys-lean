import numpy as np
from fractions import Fraction as F
exec(open('workbench/N292-select/probe_ops.py').read().split('# innerMul(slotA u1)')[0])
# kAB(slotC 1) = jb(slotA u1)(jb(slotB 1)(slotC 1)) - jb(slotB 1)(jb(slotA u1)(slotC 1))
s1=jb(sB(I8[0]),sC(I8[0])); showslot(s1,'jb(slotB1)(slotC1)')  # = slotA 1
s2=jb(sA(u1),s1); showslot(s2,'jb(slotA u1)(slotA 1)')
s3=jb(sA(u1),sC(I8[0])); showslot(s3,'jb(slotA u1)(slotC 1)')  # = slotB u1
s4=jb(sB(I8[0]),s3); showslot(s4,'jb(slotB 1)(slotB u1)')
print('kAB(slotC1)=s2-s4:', np.max(np.abs(s2-s4)))
# jb(slotA u1)(slotA 1): same slot A. jb_slotA1_slotA(a): jb(slotA 1)(slotA a)=Dg(2reQ a,2reQ a,0)? check
sAA=jb(sA(I8[0]),sA(u1)); showslot(sAA,'jb(slotA 1)(slotA u1)')  # reQ u1=0 => 0
