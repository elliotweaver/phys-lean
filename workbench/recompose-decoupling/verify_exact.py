from fractions import Fraction as F
# EXACT rational arithmetic (cutPi cancels in bandScreen at derived edge ratios)
# bandScreen(c, topBandRatio) = kappa*c*cutLog(top) = (1/(3pi))*c*(28pi/3) = c*28/9
# bandScreen(c, confBandRatio) = (1/(3pi))*c*(8pi/3) = c*8/9
def bs_top(c): return c*F(28,9)
def bs_conf(c): return c*F(8,9)

chg = F(16,3); s = F(1,8)
iso = F(2); hyp = F(10,3)

# additive recombined high-band way-points (s=0):
ew0 = 112 + bs_top(chg)          # 1582/27 + 70
conf0 = ew0 + bs_conf(chg)       # 190/3 + 70
print("recombined EW way-point (s=0)   =", ew0, "=", float(ew0), " check 1582/27+70 =", F(1582,27)+70)
print("recombined conf way-point (s=0) =", conf0, "=", float(conf0), " check 190/3+70 =", F(190,3)+70)

# the derived s=1/8 iso anti-screening on the TOP band only (iso decouples below EW):
shift = bs_top(s)                # bandScreen(1/8, top)
print("\nderived s=1/8 top-band shift bandScreen(1/8,top) =", shift, "= 7/18?", shift==F(7,18))

# recomposed way-points WITH s (iso census reduced 2->15/8 on top band):
ew_s = 112 + bs_top(chg - s)     # = ew0 - shift
conf_s = ew_s + bs_conf(chg)     # below EW: full charge census, no s (iso decoupled)
print("recomposed EW way-point (s=1/8)   =", ew_s, "=", float(ew_s), " check 6923/54 =", F(6923,54))
print("recomposed conf way-point (s=1/8) =", conf_s, "=", float(conf_s), " check 7179/54 =", F(7179,54))
print("EW shift ew0-ew_s =", ew0-ew_s, "= 7/18?", (ew0-ew_s)==F(7,18))

# check bandScreen(125/24, top) = 875/54 and 112+875/54=6923/54
print("\nbandScreen(125/24,top)=", bs_top(F(125,24)), "= 875/54?", bs_top(F(125,24))==F(875,54))
print("112 + 875/54 =", 112+F(875,54), "= 6923/54?", (112+F(875,54))==F(6923,54))
print("chg - s = 125/24?", (chg-s)==F(125,24))

# ONE-LAW direction: recomposed (with s) < additive overshoot
print("\nrecomposed conf way-point (s) =", float(conf_s), " < additive conf+70 =", float(conf0), "->", conf_s<conf0)
print("additive full-charge endpoint ~137.95 OVERSHOOT; recomposed high-bands undershoot + freezeout screens UP")
