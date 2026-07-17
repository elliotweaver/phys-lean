from fractions import Fraction as F
import mpmath as mp
mp.mp.dps=60
def fn(fr,n=25): return mp.nstr(mp.mpf(fr.numerator)/fr.denominator,n)

# cutPi bracket 1e11 grid:
# lower leastCosZero = 157079632679/1e11 -> cutPi lower = 2*157079632679/1e11 = 314159265358/1e11 = 157079632679/5e10
# upper leastCosZero = 15707963268/1e10 (unchanged) -> cutPi upper = 3926990817/1250000000 (unchanged)
cutPi_lo = F(157079632679, 5*10**10)
cutPi_hi = F(3926990817, 1250000000)
print("cutPi_lo =", cutPi_lo.numerator,"/",cutPi_lo.denominator, "=", fn(cutPi_lo))
print("cutPi_hi =", cutPi_hi.numerator,"/",cutPi_hi.denominator, "=", fn(cutPi_hi))
# 1/cutPi bracket:
pinv_lo = 1/cutPi_hi   # = 1250000000/3926990817  (unchanged from parent)
pinv_hi = 1/cutPi_lo   # = 5e10/157079632679
print("1/cutPi lo =", pinv_lo.numerator,"/",pinv_lo.denominator, "=", fn(pinv_lo))
print("1/cutPi hi =", pinv_hi.numerator,"/",pinv_hi.denominator, "=", fn(pinv_hi))
print("1/cutPi width =", float(mp.mpf((pinv_hi-pinv_lo).numerator)/(pinv_hi-pinv_lo).denominator))
# parent 1/cutPi: [1250000000/3926990817, 5000000000/15707963267]
p_pinv_lo=F(1250000000,3926990817); p_pinv_hi=F(5000000000,15707963267)
print()
print("parent 1/cutPi width =", float(mp.mpf((p_pinv_hi-p_pinv_lo).numerator)/(p_pinv_hi-p_pinv_lo).denominator))
print("1/cutPi nested lo: p_pinv_lo <= pinv_lo:", p_pinv_lo<=pinv_lo, " (equal:",p_pinv_lo==pinv_lo,")")
print("1/cutPi nested hi: pinv_hi <= p_pinv_hi:", pinv_hi<=p_pinv_hi)
print("1/cutPi strict lo<hi:", pinv_lo<pinv_hi)
print()

# reuse parent's split@6 cutLog verbatim
clo = F(815406111272, 10**11)
chi = F(815406111273, 10**11)
d = F(16,3)
# assembled = 190/3 + (d/3)*cutLog*(1/cutPi)
lo = F(190,3) + (d/3)*clo*pinv_lo
hi = F(190,3) + (d/3)*chi*pinv_hi
print("ASSEMBLED endpoints:")
print("  lo =", lo.numerator,"/",lo.denominator, "=", fn(lo))
print("  hi =", hi.numerator,"/",hi.denominator, "=", fn(hi))
print("  width =", float(mp.mpf((hi-lo).numerator)/(hi-lo).denominator))
# dressed = 74 + (d/2)*cutLog*(1/cutPi)
dlo = F(74) + (d/2)*clo*pinv_lo
dhi = F(74) + (d/2)*chi*pinv_hi
print("DRESSED endpoints:")
print("  dlo =", dlo.numerator,"/",dlo.denominator, "=", fn(dlo))
print("  dhi =", dhi.numerator,"/",dhi.denominator, "=", fn(dhi))
print()
# parent assembled: [12007329939722/176714586765, 16009773252014/235619449005]
plo=F(12007329939722,176714586765); phi=F(16009773252014,235619449005)
print("parent assembled width =", float(mp.mpf((phi-plo).numerator)/(phi-plo).denominator))
print("nested: plo<=lo:", plo<=lo, " hi<=phi:", hi<=phi)
print("width_lt: (hi-lo) < (phi-plo):", (hi-lo) < (phi-plo))
print("strict: lo<hi:", lo<hi)
print("gt waypoint: 190/3 < lo:", F(190,3) < lo)
print()
# harith identity checks (Lean uses chargeTraceDepth/3 with d=16/3)
print("check harith lower ==:", lo == F(190,3) + (F(16,3)/3)*clo*pinv_lo)
print("check harith upper ==:", hi == F(190,3) + (F(16,3)/3)*chi*pinv_hi)
print("check dressed lower ==:", dlo == F(74) + (F(16,3)/2)*clo*pinv_lo)
print("check dressed upper ==:", dhi == F(74) + (F(16,3)/2)*chi*pinv_hi)
# target: measured precision ~2e-10 relative. value ~67.9476. abs target ~ 67.9476*2e-10 ~1.36e-8
print()
val = float(mp.mpf(lo.numerator)/lo.denominator)
print("derived value ~", val, " (nowhere near 137.036)")
print("assembled abs width vs measured abs (~1.36e-8):", float(mp.mpf((hi-lo).numerator)/(hi-lo).denominator))
