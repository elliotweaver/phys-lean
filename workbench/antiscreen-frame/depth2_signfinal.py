from fractions import Fraction as F
import math
# Scratch AIMING ONLY (seed-permitted). No production content. Values are the banked
# certified/exact numbers (removable orientation prose). Purpose: determine the SIGN of the
# band-varying (way-point-consistent) census-in-census SECOND-DEPTH running content and confirm
# it cannot supply the dominant negative summand that would bring 138.97 -> 137.036.

# --- banked certified endpoints ---
iaz_complete = 67.9475880261            # invAlphaZero(completeBandList) banked TheNumeral (certified 12-digit)
iaz_conf     = 190/3                     # invAlphaZero(derivedBandList) = 190/3  (confinement way-point, Z4, EXACT)
iaz_ew       = 1582/27                   # invAlphaZero([top band]) = 1582/27     (electroweak way-point, X6, EXACT)
weld         = 70                        # +70 hypercharge weld (EXACT)
measured0    = 137.035999084             # measured 1/alpha(0)      (removable prose)
measuredMZ   = 127.951                   # measured 1/alpha(M_Z)    (removable prose)

# --- the composition (all banked) ---
invAlphaEM_bare = iaz_complete + weld
d = F(16,3); s = F(1,8); w = F(1,3)
totalScreening_charge = iaz_complete - 42
T = totalScreening_charge/float(d)
antiscreen = float(s)*T
freezeout  = 1.6324                       # banked ComposedFreezeoutDissolved 16/9 + k[...]
leadingCarrier = invAlphaEM_bare - antiscreen + freezeout

print("=== WAY-POINT CROSS-CHECK (fold structure vs measured, both scales) ===")
print(" EW way-point : invAlphaEM = 1582/27 + 70 = %.3f   vs measured 1/a(M_Z) = %.3f   (overshoot %+.3f)" %
      (iaz_ew+weld, measuredMZ, iaz_ew+weld-measuredMZ))
print(" 0-mom bare   : invAlphaEM = iaz_complete + 70 = %.3f   vs measured 1/a(0) = %.3f   (overshoot %+.3f)" %
      (invAlphaEM_bare, measured0, invAlphaEM_bare-measured0))
print(" 0-mom -antiscreen (bare - s*T) = %.3f  (overshoot %+.3f, %.2f%%)  <-- BEST agreement" %
      (invAlphaEM_bare-antiscreen, invAlphaEM_bare-antiscreen-measured0, 100*(invAlphaEM_bare-antiscreen-measured0)/measured0))
print(" 0-mom +freezeout (leadingCarrier) = %.3f  (overshoot %+.3f, %.2f%%) <-- freeze-out WORSENS" %
      (leadingCarrier, leadingCarrier-measured0, 100*(leadingCarrier-measured0)/measured0))
print()

print("=== THE DEPTH-2 RUNNING CONTENT, BAND-VARYING, WAY-POINT-CONSISTENT ===")
# Way-point-consistent => dress ONLY the sub-leading bands below the confinement way-point
# (the lepton tail + quark freeze-out), NOT the top/conf way-point bands (DressingSeamResolved).
subleading_screen = (iaz_complete - iaz_conf) + freezeout   # lepton tail screen + quark freeze-out screen
depth2_running = float(w) * subleading_screen               # census-in-census 2nd depth = w * (sub-leading screening)
print(" sub-leading screening (lepton tail + quark freeze-out) = %.4f  (POSITIVE)" % subleading_screen)
print(" depth-2 running content = w * sub-leading screening = (1/3)*%.4f = %+.4f  (POSITIVE -> moves UP)" %
      (subleading_screen, depth2_running))
print(" composed with depth-2 : leadingCarrier + depth2 = %.3f  (overshoot %+.3f) -- FURTHER from measured" %
      (leadingCarrier+depth2_running, leadingCarrier+depth2_running-measured0))
print()
print("=== SIGN/BOUND OBSTRUCTION (theorem-backable) ===")
print(" (i)  every band's 2nd-depth content = w_band * bandScreen_band ; w_band>0 (Born pos), bandScreen>0 (screening) => POSITIVE")
print(" (ii) the ONLY negative sense is anti-screening; its 2nd-depth content is bounded by first-depth s*T = %.4f << 1.94" % antiscreen)
print(" (iii) census-in-census D=k0/(1-w) is an ENHANCEMENT (x1.5 at w=1/3), NOT a suppression -- no trunk suppression mechanism")
print()
print("CONCLUSION: the band-varying depth-2 running content is POSITIVE (~%+.2f); it does NOT close the -1.94 gap," % depth2_running)
print("it WORSENS it. Combined with banked refutations (freeze-out bounded, dressing way-point-excluded, s undressed),")
print("EVERY enumerated census/band/depth/freeze-out summand is proven POSITIVE or BOUNDED -- none supplies the -1.94.")
print("The composition reaches BEST agreement (137.34, +0.22%) at bare-antiscreen WITHOUT the freeze-out;")
print("every added sub-leading screening summand moves it AWAY. => the framing (a banked summand's LAYER/SIGN,")
print("most visibly the freeze-out's additive placement) is the suspect (ONE LAW), which is owner-reserved ledger territory.")
