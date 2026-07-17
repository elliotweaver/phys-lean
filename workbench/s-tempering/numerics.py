from fractions import Fraction as F
invAlphaZero_lo = F(12007329939722, 176714586765)
totalScreening = invAlphaZero_lo - 42
chargeTraceDepth = F(16,3)
T = totalScreening / chargeTraceDepth
print(f'invAlphaZero (D7 lower bound) = {float(invAlphaZero_lo):.6f}')
print(f'totalScreening = {float(totalScreening):.6f},  T = {float(T):.6f}')
print(f'coeff on s = T*3/2 = {float(T*F(3,2)):.6f} per unit s')
print()
print('dressedInvAlphaEM(1/3, s) = 112 + (16/3 - s)*T*3/2   (D2c only; +join +freezeout add on top):')
for s in [F(0), F(1), F(3,2), F(19,10), F(2)]:
    val = 112 + (chargeTraceDepth - s)*T*F(3,2)
    print(f'  s={str(s):>5}  netIso={float(F(2)-s):+.3f}  dressedInvAlphaEM={float(val):9.4f}')
print()
print('measured 1/alpha(0) ~ 137.036 (prose only, orientation)')
