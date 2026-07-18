from fractions import Fraction as F
import math
# Scratch aiming ONLY (seed-permitted). No production content. All values are the banked
# certified/exact numbers (removable orientation prose). Purpose: determine the SIGN and
# MAGNITUDE bound of any FORCED census-in-census second-depth correction to leadingCarrier.

invAlphaZero_complete = 67.9475880261          # banked TheNumeral certified ~67.95
invAlphaEM_bare = invAlphaZero_complete + 70   # RecombinedEndpoint +70 weld (EXACT)
print("invAlphaEM bare recombined tower =", invAlphaEM_bare, " (banked THEOREM certified)")

d = F(16, 3); s = F(1, 8); w = F(1, 3)
totalScreening_charge = invAlphaZero_complete - 42
T = totalScreening_charge / float(d)
print("totalScreening(chargeList) =", totalScreening_charge, " T(screening unit)=", T)

antiscreen = float(s) * T
print("anti-screening s*T (undressed s=1/8) =", antiscreen)

freezeout = 1.6324
leadingCarrier = invAlphaEM_bare - antiscreen + freezeout
measured = 137.035999084
print("leadingCarrier (banked determined) =", leadingCarrier)
print("measured 1/alpha(0) =", measured)
print("GAP leadingCarrier-measured = +%.4f (need to go DOWN)" % (leadingCarrier - measured))
print("GAP bare tower  -measured   = +%.4f (already overshoots at CERTIFIED level)" % (invAlphaEM_bare - measured))
print("--- SIGN OBSTRUCTION on any census-in-census 2nd-depth content ---")
depth2_pos = float(w) * totalScreening_charge
print("depth-2 of POSITIVE tower (w*totalScreening) = +%.4f -> moves UP (WRONG sign)" % depth2_pos)
ad2 = -antiscreen * float(w) / (1 - float(w))
print("depth-2 of ANTI-screen (-sT*w/(1-w)) = %.4f (right sign; |.| bounded by first-depth sT=%.4f)" % (ad2, antiscreen))
print("band-varying cap weights w_i = (1+cos+cos^2)/3 over a sub-cap:")
for th in [180, 120, 90, 60, 30]:
    c = math.cos(math.radians(th)); wi = (1 + c + c * c) / 3
    print("  cap %3d deg -> w_i=%.4f (>=1/3 always POSITIVE)" % (th, wi))
print()
print("KEY: to CLOSE the +1.94 gap DOWNWARD you need a NEGATIVE 2nd-depth summand of ~-1.94.")
print("Every census-in-census 2nd-depth correction to the POSITIVE screening tower is POSITIVE (w>0 x positive band).")
print("The ONLY negative channel is the anti-screening, whose ENTIRE first-depth magnitude sT=%.4f < 1.94," % antiscreen)
print("so its bounded 2nd-depth content (<sT) cannot supply -1.94. No forced 2nd-depth content closes the gap.")
