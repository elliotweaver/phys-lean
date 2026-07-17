from fractions import Fraction as F
import math
y=F(78539814,10**8)
sq=y*y
print('y^2 exact =', float(sq), '=', sq)
Bnum=math.ceil(float(sq)*1e8)
print('ceil B (1e8) =', Bnum,'/1e8 =', Bnum/1e8, ' >= sq?', F(Bnum,10**8)>=sq)
# The parent used a 1e7-grid bound 6168502/1e7 for y<7853981/1e7 (=0.7853981).
# Here y ~ 0.78539814. Need a bound just above sq. Use 1e8 grid.
print('margin B - sq =', float(F(Bnum,10**8)-sq))
# Also verify (Bnum/1e8) still lets the poly close with L=70710679/1e8:
# 2*L^2 - 1 must be > 0 (double angle). L=0.70710679
L=F(70710679,10**8)
print('2L^2-1 =', float(2*L*L-1))
