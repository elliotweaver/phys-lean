from fractions import Fraction as F
# Banked ABSOLUTE facts (Z1 via decide; N253; N342/X6):
B_charge = -6          # traceForm7 chargeOp chargeOp   (trace(A.A) form, concrete)
B_iso    = -16         # traceForm7 (imRep DI)(imRep DI)
chargeDepth = F(16,3)  # Tr(Q^2)  matter charge census (X6)
isoDepth    = F(2)     # Tr(T3^2) matter isospin census (N342)

# N253 convention-free ratio: 8*B_charge = 3*B_iso ?
print("N253 ratio 8*B_charge == 3*B_iso :", 8*B_charge == 3*B_iso, "  (",8*B_charge,"=",3*B_iso,")")
print("  B_charge/B_iso =", F(B_charge,B_iso), "  ; isoDepth/chargeDepth =", isoDepth/chargeDepth)
print("  => gather charge:iso ratio == matter iso:charge ratio (=3/8) :",
      F(B_charge,B_iso) == isoDepth/chargeDepth)
print()
# The CROSS-CHANNEL INVARIANT:  |B_charge|*chargeDepth  vs  |B_iso|*isoDepth
K1 = abs(B_charge)*chargeDepth
K2 = abs(B_iso)*isoDepth
print("|B_charge|*chargeDepth =", K1)
print("|B_iso|*isoDepth       =", K2)
print("CHANNEL-INDEPENDENT product K :", K1 == K2, " K =", K1)
print()
# Consequence: sin^2 = isoDepth/chargeDepth = |B_charge|/|B_iso|
print("sin^2thetaW = isoDepth/chargeDepth =", isoDepth/chargeDepth,
      " = |B_charge|/|B_iso| =", F(abs(B_charge),abs(B_iso)))
print()
# Does ANY convention anchored to matter give an INTERIOR s (0<s<2)?
print("--- anchor conventions ---")
# anchor charge channel: scale lambda so lambda*|B_charge| = chargeDepth
lam_c = chargeDepth/abs(B_charge)
print("anchor CHARGE: lambda =", lam_c, " gather iso in matter units s =", lam_c*abs(B_iso),
      " interior:", 0 < lam_c*abs(B_iso) < 2)
# anchor iso channel: scale so lambda*|B_iso| = isoDepth
lam_i = isoDepth/abs(B_iso)
print("anchor ISO   : lambda =", lam_i, " gather iso in matter units s =", lam_i*abs(B_iso),
      " (=isoDepth boundary)  interior:", 0 < lam_i*abs(B_iso) < 2)
print()
print("Neither matter-anchored convention yields an INTERIOR s.")
print("Only the RATIO 3:8 is convention-free; the ABSOLUTE fund-7 normalization")
print("relative to the matter sector is NOT banked -> s not uniquely forced.")
