from fractions import Fraction as F
import math
Y2 = F(15707963, 40000000)
sq = Y2 * Y2
print('Y2   =', float(Y2))
print('Y2^2 =', float(sq), '=', sq)
for d in [1000000, 10000000, 100000000]:
    n = math.ceil(float(sq) * d) + 1
    b = F(n, d)
    print('bound %d/%d = %.10f  (>= sq? %s)  slack=%.3e' % (n, d, float(b), b >= sq, float(b - sq)))
# also cos(pi/8)^2 region check: need hpoly threshold C2 clear
