import numpy as np
from fractions import Fraction as F
exec(open('workbench/N292-select/probe_ops.py').read().split('# innerMul(slotA u1)')[0])
# kAB(slotB 1) intermediates
s1=jb(sB(I8[0]),sB(I8[0])); showslot(s1,'jb(slotB 1)(slotB 1)')  # Dg 2 0 2
s2=jb(sA(u1),s1); showslot(s2,'jb(slotA u1)(Dg 2 0 2)')
s3=jb(sA(u1),sB(I8[0])); showslot(s3,'jb(slotA u1)(slotB 1)')  # slotC(star u1)
s4=jb(sB(I8[0]),s3); showslot(s4,'jb(slotB 1)(slotC(star u1))')
print('kAB(slotB 1)=s2-s4:'); showslot(s2-s4,'  result')
# so what is star u1?
print('star u1 =', ostar(u1)[:3])  # should be -u1 => [0,-1,0]
