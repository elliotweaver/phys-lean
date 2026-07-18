from fractions import Fraction as F

# banked E-bracket for cutExp(pi/3)
Elo = F(284965, 100000)
Ehi = F(284966, 100000)

Elo36 = Elo ** 36
Ehi36 = Ehi ** 36

# chosen certified bracket for confinementScaleRatio = 1/E^36
lo = F(42408, 10 ** 21)
hi = F(42414, 10 ** 21)

# Lower bracket needs: lo * Ehi^36 <= 1   (then lo <= 1/Ehi^36 <= 1/E^36)
lhs_lo = lo * Ehi36
print('lo*Ehi^36 <= 1 ?', lhs_lo <= 1, ' value=', float(lhs_lo))

# Upper bracket needs: 1 <= hi * Elo^36  (then 1/E^36 <= 1/Elo^36 <= hi)
rhs_hi = hi * Elo36
print('1 <= hi*Elo^36 ?', 1 <= rhs_hi, ' value=', float(rhs_hi))

print('width lo<hi ?', lo < hi)
print('bracket ~', float(lo), float(hi))

# ratio checks (exact closed-form identities, no bracket needed):
#  confBundle = Lambda/v = cutExp(-8pi/3);  topBandRatio=M/v=cutExp(28pi/3)
#  confinementScaleRatio = Lambda/M = cutExp(-12pi)
#  M/Lambda = 1/confinementScaleRatio = cutExp(12pi)
#  v/Lambda = 1/confBundle = cutExp(8pi/3)
#  128/27 band: bandScreen chargeTraceDepth confBandRatio = 128/27 (already banked)
# The seed asks v/Lambda and M/Lambda ratios reproduced + 128/27 re-emerging free.
