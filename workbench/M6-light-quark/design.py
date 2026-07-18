from fractions import Fraction as F

# ============================================================================
# M6 — THE LIGHT QUARK SECTOR — bracket design
# ============================================================================
# Banked N340 amplitude brackets (from GenerationMassRatiosNumeric.lean §3):
b0lo = F(237943, 100000); b0hi = F(237944, 100000)
b1lo = F(4034, 100000);   b1hi = F(40365, 1000000)
b2lo = F(5802, 10000);    b2hi = F(58022, 100000)

# masses = amplitude^2 (Born square); N340 mass bracket endpoints:
m0lo = b0lo*b0lo; m0hi = b0hi*b0hi   # heaviest (k=0)
m1lo = b1lo*b1lo; m1hi = b1hi*b1hi   # lightest (k=1)
m2lo = b2lo*b2lo; m2hi = b2hi*b2hi   # middle   (k=2)

print("=== banked N340 mass brackets (bMass k = mass_k) ===")
print("mass0 (heaviest):", [float(m0lo), float(m0hi)], m0lo, m0hi)
print("mass1 (lightest):", [float(m1lo), float(m1hi)], m1lo, m1hi)
print("mass2 (middle)  :", [float(m2lo), float(m2hi)], m2lo, m2hi)

# M5/M3 downConfBundle bracket (the down/confinement relative-scale-squared):
dclo = F(7280, 100); dchi = F(7288, 100)
print("\n=== banked M5 downConfBundle = (Md/Mλ)² ∈", [float(dclo), float(dchi)], "===")

# ---------------------------------------------------------------------------
# THE LIGHT-BAND EDGE (banked edgeLight_pinned):
#   edgeLight Md (Mλ²) = downConfBundle · bMass 2
# This is the DERIVED value of the LIGHT-band freeze-out edge (m_s/Λ genre),
# with the confinement floor entering as a Born-square scale. It reads the
# STRANGE-sector mass relative to the confinement floor squared.
# ---------------------------------------------------------------------------
el_lo = dclo * m2lo
el_hi = dchi * m2hi
print("\n=== LIGHT-BAND EDGE  edgeLight = downConfBundle·mass2  (strange/conf, k=2) ===")
print("  ∈", [float(el_lo), float(el_hi)], "  ~", float((el_lo+el_hi)/2))
print("  exact:", el_lo, el_hi)

# The full down-family reads through the SAME downConfBundle scale, times the
# within-sector shape bMass k (light quark = down-type sector). The three
# down-family "mass relative to confinement floor" numerals:
print("\n=== down-family relative to confinement floor: downConfBundle·bMass k ===")
for name, mlo, mhi in [('down k=1 (lightest)', m1lo, m1hi),
                       ('strange k=2 (middle)', m2lo, m2hi),
                       ('bottom k=0 (heaviest)', m0lo, m0hi)]:
    lo = dclo*mlo; hi = dchi*mhi
    print(f"  {name:24s}: [{float(lo):.6f}, {float(hi):.6f}]")

# ---------------------------------------------------------------------------
# THE WITHIN-DOWN-SECTOR LIGHT RATIOS (banked N340 numerals, forced universal):
#   strange/bottom = mass2/mass0   (middle/heaviest, = massRatio_2_0 numeral)
#   down/strange   = mass1/mass2   (lightest/middle, = massRatio_1_2 numeral)
# These are the LIGHT-quark within-sector splittings — FORCED equal to the
# banked lepton descent (FreezeoutEdgeCrossSectorReduction line-independence).
# ---------------------------------------------------------------------------
print("\n=== within-down-sector LIGHT ratios (N340, line-independent) ===")
# mass1/mass2 ∈ [483/1e5, 485/1e5]
print("  down/strange  m1/m2 ∈ [483/1e5, 485/1e5] =", [float(F(483,100000)), float(F(485,100000))])
# mass2/mass0 ∈ [594/1e4, 595/1e4]
print("  strange/bottom m2/m0 ∈ [594/1e4, 595/1e4] =", [float(F(594,10000)), float(F(595,10000))])

# ---------------------------------------------------------------------------
# THE LIGHT-vs-HEAVY cross reading: how the light-band edge compares to the
# down/confinement offset. edgeLight = downConfBundle·mass2, and mass2<1, so
# edgeLight < downConfBundle. Also mass2 (~0.336) times ~72.8 ~ 24.5.
# Reciprocal: Λ/(strange-scale²) = 1/edgeLight.
# ---------------------------------------------------------------------------
inv_el_lo = 1/el_hi; inv_el_hi = 1/el_lo
print("\n=== reciprocal light-band edge 1/edgeLight (conf floor / strange²) ===")
print("  ∈", [float(inv_el_lo), float(inv_el_hi)])

# Rounded certified outer brackets (widen to clean rationals for Lean):
def outward(lo, hi, denom):
    import math
    lo_r = F(math.floor(lo*denom), denom)
    hi_r = F(math.ceil(hi*denom), denom)
    return lo_r, hi_r

print("\n=== CERTIFIED OUTER BRACKETS (widen outward to clean rationals) ===")
for name, lo, hi, denom in [
    ('edgeLight (strange/conf)', el_lo, el_hi, 100),
    ('1/edgeLight', inv_el_lo, inv_el_hi, 10000),
]:
    r_lo, r_hi = outward(lo, hi, denom)
    print(f"  {name:26s}: [{r_lo}, {r_hi}] = [{float(r_lo)}, {float(r_hi)}]  (tight [{float(lo):.6f},{float(hi):.6f}])")

# ---- VERIFY final outer brackets ----
print("\n=== VERIFY outer brackets ===")
dclo=F(7280,100); dchi=F(7288,100)
m2lo=F(5802,10000)**2; m2hi=F(58022,100000)**2
m1lo=F(4034,100000)**2; m1hi=F(40365,1000000)**2
elo=dclo*m2lo; ehi=dchi*m2hi
print('edgeLight[49/2,1227/50]:', F(49,2)<=elo, ehi<=F(1227,50), float(elo),float(ehi))
dlo=dclo*m1lo; dhi=dchi*m1hi
print('down[118/1000,119/1000]:', F(118,1000)<=dlo, dhi<=F(119,1000), float(dlo),float(dhi))
print('m2/m1[206,2071/10]:', F(206)<=F(100000,485), F(100000,483)<=F(2071,10))
print('1/edgeLight[407/1e4,409/1e4]:', F(407,10000)<=1/ehi, 1/elo<=F(409,10000))
print('edgeLight<downConf:', ehi<dclo, '  down<edgeLight:', dhi<elo)
