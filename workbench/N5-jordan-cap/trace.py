"""
Trace the minimal n=4 witness defect to an octonion ASSOCIATOR.
Witness: X[1][2]=e1, X[1][3]=e7 (Hermitian); Y[0][2]=e5 (Hermitian).
Defect D[0][1] = -4 e4, D[1][0] = 4 e4.
The three octonion units in play: e5 (Y), e1, e7 (X), and their conjugates.
"""
import itertools
from fast import omul,oadd,osub,oneg,ostar,oz,ois0,E,assoc

units=[1,5,7]
print("relevant associators (should explain e4):")
for a,b,c in itertools.permutations([1,5,7]):
    print(f"  [e{a},e{b},e{c}] =", [v for v in assoc(E[a],E[b],E[c])])
# also with conjugates: star(e_p)=-e_p for imaginary
print("\ncheck e5*e1, then *e7 paths:")
print("  (e5 e1) e7 =", omul(omul(E[5],E[1]),E[7]))
print("  e5 (e1 e7) =", omul(E[5],omul(E[1],E[7])))
print("  assoc(e5,e1,e7)=", assoc(E[5],E[1],E[7]))
# defect entry/2:
print("\nDefect was 4 e4 = 2 * (2 e4); associators give +-2 e_k.")
