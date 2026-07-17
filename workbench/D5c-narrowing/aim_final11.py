from fractions import Fraction as F
import mpmath as mp
mp.mp.dps=60
def fn(fr,n=25): return mp.nstr(mp.mpf(fr.numerator)/fr.denominator,n)
# reuse parent's 1/cutPi verbatim
pinv_lo = F(1250000000,3926990817)
pinv_hi = F(5000000000,15707963267)
d = F(16,3)
clo = F(815406111272, 10**11)
chi = F(815406111273, 10**11)
# assembled = 190/3 + (d/3)*cutLog*(1/cutPi)
lo = F(190,3) + (d/3)*clo*pinv_lo
hi = F(190,3) + (d/3)*chi*pinv_hi
print("ASSEMBLED endpoints (reduced fractions):")
print("  lo =", lo.numerator,"/",lo.denominator, "=", fn(lo))
print("  hi =", hi.numerator,"/",hi.denominator, "=", fn(hi))
# dressed = 74 + (d/2)*cutLog*(1/cutPi)
dlo = F(74) + (d/2)*clo*pinv_lo
dhi = F(74) + (d/2)*chi*pinv_hi
print("DRESSED endpoints (reduced fractions):")
print("  dlo =", dlo.numerator,"/",dlo.denominator, "=", fn(dlo))
print("  dhi =", dhi.numerator,"/",dhi.denominator, "=", fn(dhi))
print()
# parent brackets for nesting/width teeth
plo=F(2401465987690,35342917353); phi=F(9605863954190,141371669403)
print("parent inv lo/hi:", plo.numerator,"/",plo.denominator, ";", phi.numerator,"/",phi.denominator)
print("nested: plo<=lo:", plo<=lo, " hi<=phi:", hi<=phi)
print("width_lt: (hi-lo) < (phi-plo):", (hi-lo) < (phi-plo))
print("strict: lo<hi:", lo<hi)
print("gt waypoint: 190/3 < lo:", F(190,3) < lo)
print("assembled width:", float(mp.mpf((hi-lo).numerator)/(hi-lo).denominator))
print()
# the exact arithmetic identities Lean must prove via chargeTraceDepth_eq (d=16/3):
# lower harith: lo <= 190/3 + (16/3)/3 * clo * pinv_lo
print("check harith lower ==:", lo == F(190,3) + (F(16,3)/3)*clo*pinv_lo)
print("check harith upper ==:", hi == F(190,3) + (F(16,3)/3)*chi*pinv_hi)
print("check dressed lower ==:", dlo == F(74) + (F(16,3)/2)*clo*pinv_lo)
print("check dressed upper ==:", dhi == F(74) + (F(16,3)/2)*chi*pinv_hi)
# cutLog nested inside parent's split@5 [815406110/1e8, 815406115/1e8]
print()
print("cutLog nested: 815406110/1e8 <= clo:", F(815406110,10**8) <= clo, " chi <= 815406115/1e8:", chi <= F(815406115,10**8))
print("cutLog strict: clo<chi:", clo<chi)
