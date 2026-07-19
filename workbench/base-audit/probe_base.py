from fractions import Fraction as F
import mpmath as mp
mp.mp.dps = 40

# ============================================================
# BASE DECOMPOSITION AUDIT (t_377d8ce1)
# ============================================================
# recomposedEndpoint = 7179/54 + leptonTailScreen + freezeoutStaircaseSummand
# base 2425/18 = 7179/54 + 16/9   (16/9 is the "gem" inside freezeoutStaircaseSummand)
# 7179/54 = 6923/54 + 128/27      (128/27 = confBand = kappa*(16/3)*ln(v/L))
# 6923/54 = 112 + 875/54          (top band, recomposed census 125/24)

print("=== base rational decomposition ===")
print("2425/18          =", float(F(2425,18)), "=", F(2425,18))
print("7179/54 + 16/9   =", F(7179,54)+F(16,9), "=", float(F(7179,54)+F(16,9)))
print("6923/54 + 128/27 =", F(6923,54)+F(128,27), "=", float(F(6923,54)+F(128,27)))
print("7179/54          =", float(F(7179,54)))
print("6923/54          =", float(F(6923,54)), " = 112 + 875/54 =", float(112+F(875,54)))
print()

# ---- confBand = kappa*(16/3)*ln(v/L), full census 16/3 across (L,v) ----
# ln(v/L) = 8pi/3  (confBandRatio = cutExp(8pi/3)), kappa = 1/(3pi)
kappa = 1/(3*mp.pi)
lnvL = 8*mp.pi/3
confBand = kappa * F(16,3) * lnvL
print("confBand kappa*(16/3)*(8pi/3) =", mp.nstr(confBand, 20), " (should be 128/27 =", float(F(128,27)), ")")
print("  128/27 exact =", float(F(128,27)))
print()

# ---- gem = kappa*2*(8pi/3) = 16/9 ----
gem = kappa * 2 * lnvL
print("gem kappa*2*(8pi/3) =", mp.nstr(gem,20), " (16/9 =", float(F(16,9)), ")")
print()

print("KEY STRUCTURAL OBSERVATION:")
print("  confBand uses census 16/3 across ln(v/L) = 8pi/3   -> 128/27")
print("  gem      uses census 2   across the SAME 8pi/3     -> 16/9")
print("  BOTH screen the confinement rung 8pi/3 = ln(v/L).")
print("  confBand: 16/3 * 8pi/3.  gem: 2 * 8pi/3.")
print("  So the confinement rung ln(v/L) is screened by 16/3 (confBand) PLUS 2 (gem)")
print("  = 16/3 + 2 = 22/3 total census on the SAME rung ln(v/L).")
print()
print("  Is that a DOUBLE COUNT?  The light-band gem's 8pi/3 IS the SAME rung as confBand's ln(v/L).")
print("  confBand already screens the full 16/3 across (L,v). The gem adds ANOTHER 2*(8pi/3).")
