"""
Which associators of the entry units {e1,e5,e7} (and conjugates) produce e4?
Find the cleanest associator equal (up to scalar) to defect[0][1] = -4 e4.
Also: confirm the GENERAL one-cause claim: defect vanishes for the witness IFF
the entries associate (we test by checking quaternion sub-witness gave 0).
"""
import itertools
from fast import omul,oadd,osub,oneg,ostar,oz,ois0,E,assoc

def smul(s,x): return [s*v for v in x]
units={'e1':E[1],'e5':E[5],'e7':E[7]}
print("associators landing on e4 (index 4):")
names=list(units)
for a,b,c in itertools.product(names,repeat=3):
    v=assoc(units[a],units[b],units[c])
    if v[4]!=0 and all(v[k]==0 for k in range(8) if k!=4):
        print(f"  [{a},{b},{c}] = {v[4]} e4")

# also which single associator equals defect = -4 e4 ? answer multiples
target=[0,0,0,0,-4,0,0,0]
print("\nassociators (any direction) of {e1,e5,e7}:")
for a,b,c in itertools.product(names,repeat=3):
    v=assoc(units[a],units[b],units[c])
    if not ois0(v):
        nz=[(k,v[k]) for k in range(8) if v[k]!=0]
        print(f"  [{a},{b},{c}] -> {nz}")
