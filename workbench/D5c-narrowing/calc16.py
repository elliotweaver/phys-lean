from fractions import Fraction as F
from mpmath import mp, mpf
import mpmath
mp.dps = 80
def partialCos6(x): return 1 - x**2/2 + x**4/24 - x**6/720 + x**8/40320 - x**10/mpf(3628800)
def cosRemBound6(x): return x**12/mpf(479001600)*(1/(1-x**2/mpf(182)))
xu=mpf(157079635)/mpf(10**8)
remu=cosRemBound6(xu); pcu=partialCos6(xu)
print("UPPER x=157079635/1e8:")
print("  cosRemBound6 =", mpmath.nstr(remu,8))
print("  partialCos6  =", mpmath.nstr(pcu,8))
print("  sum          =", mpmath.nstr(pcu+remu,6))
# neg lemma design: rem <= R (rational upper), pc <= -P (rational upper on the negative), with R-P<0
# choose R = 478/1e9 = 4.78e-7 ; check remu <= R
R=478e-9; P=488e-9
print("  rem <= 478/1e9=%.3e ? %s"%(R, float(remu)<=R))
print("  partialCos6 <= -488/1e9=%.3e ? %s"%(-P, float(pcu)<=-P))
print("  -P + R =", -P+R, "(need <0)", -P+R<0)
# parent used rem<=478/1e9 and pc<=-530/1e9 at 15707964/1e7. At 157079635/1e8 pc is only -4.88e-7 so -530e-9 fails.
# Need P s.t. pcu<=-P and R-P<0 with R>=remu. remu=4.7756e-7. Pick R=4776/1e10=4.776e-7, P=4879/1e10=4.879e-7? check pcu<=-4.879e-7
for Rn,Pn in [(4776,4879),(478,488),(47756,48797)]:
    Rf=F(Rn,10**(len(str(Rn))+6)) # messy; just use decimals
# Use cleaner: R=239/5e8=4.78e-7, P=61/125e6? let me just pick R=478/1e9, P=487/1e9
R2=F(478,10**9); P2=F(487,10**9)
print("\n  R=478/1e9, P=487/1e9: remu<=R? %s  pcu<=-P? %s  R-P<0? %s"%(float(remu)<=float(R2), float(pcu)<=-float(P2), (R2-P2)<0))
