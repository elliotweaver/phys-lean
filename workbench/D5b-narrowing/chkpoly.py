from fractions import Fraction as F
# We need hx2: x^2 < B (a clean rational >= z_lo^2, but small enough that the deg-10 poly stays >0).
# The nlinarith proves: poly(x) = 1 - x^2/2 + x^4/24 - x^6/720 + x^8/40320 - x^10/1814400 > 0
# using hx2 (x^2 < B). It works by bounding via B. Actually the parent nlinarith uses hx2 directly.
# The poly is decreasing in x on [0,pi/2). The positivity margin at z_lo:
zlo2 = F(15707952**2, 10**14)
print("z_lo^2 =", float(zlo2))
# clean bounds candidates
for B in [F(2467398,10**6), F(24673976,10**7), F(246739757,10**8)]:
    print("B=%s=%.10f >= z_lo^2? %s"%(B,float(B),B>=zlo2))
# The poly's actual zero (positivity limit): solve poly=0. It's near x^2 ~ 2.4674 (x~1.5708=pi/2).
# Since poly(x)>0 for x<pi/2 and =0 at... actually cos>0 up to pi/2 so poly>0 needs x<pi/2.
# But the poly is a truncation; its own sign flips a bit before/after. Let me check poly at sqrt(B):
import math
def poly(x2):  # in terms of x^2
    return 1 - x2/2 + x2**2/24 - x2**3/720 + x2**4/40320 - x2**5/1814400
for B in [F(2467398,10**6), F(24673976,10**7)]:
    print("poly at x^2=B=%s : %.3e  (>0 means bound B still safe)"%(B, float(poly(B))))
print("poly at z_lo^2: %.3e"%float(poly(zlo2)))
