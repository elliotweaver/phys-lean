from fractions import Fraction as F
import mpmath as mp
mp.mp.dps = 50
pi = mp.pi; kappa = 1/(3*pi)
confbundle = mp.e**(-8*pi/3)      # Lambda/v
confRung = 8*pi/3                  # ln(v/Lambda)

print("=== (E) the light-edge rung DEPENDS on the top-at-anchor POWER ===")
print("banked  huc : (Mu/Mlam)^2 = 1/confBundle = v/Lambda  -> downConfBundle carries +8pi/3")
print("   cutLog(1/confBundle)          =", mp.nstr(-mp.log(confbundle),10), " = 8pi/3 =", mp.nstr(confRung,10))
print("alt     huc2: (Mu/Mlam)^2 = (1/confBundle)^2 = (v/Lambda)^2 -> carries +16pi/3")
print("   cutLog((1/confBundle)^2)      =", mp.nstr(-2*mp.log(confbundle),10), " = 16pi/3 =", mp.nstr(2*confRung,10))
print()
print("So the light rung is 8pi/3 (banked) vs 16pi/3 (if Mu=v literal top-at-anchor).")
print("gem banked (active 5/3): kappa*(5/3)*(8pi/3)  =", mp.nstr(kappa*F(5,3)*confRung,10), " = 40/27 =", float(F(40,27)))
print("gem alt    (active 5/3): kappa*(5/3)*(16pi/3) =", mp.nstr(kappa*F(5,3)*2*confRung,10), " = 80/27 =", float(F(80,27)))
print()
print("=== census-subset: light census is part of the coloured slice the confBand carries ===")
print("chargeTraceDepth 16/3 = freezeoutStaircase 10/3 (coloured) + leptonCensus 2 (singlet)")
print("censusActiveLightSpan 5/3 <= coloured 10/3 <= full 16/3 (light census IS part of confBand's 16/3)")
print()
print("=== direction (NO-FIT witness) ===")
print("the active gem = +40/27 > 0. Removing it (double-count fix) DECREASES the summand,")
print("moving the endpoint DOWN (further below measured). A double-count REMOVAL does NOT")
print("reach measured. A power-DOUBLING (16pi/3) would move UP — but must be forced ab-initio,")
print("NEVER chosen because it moves toward 137.036.")
