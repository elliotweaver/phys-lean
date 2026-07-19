import mpmath as mp
mp.mp.dps = 30
pi = mp.pi
kap = 1/(3*pi)

# banked sharpened edge logs (D7NarrowingRung1)
L_m01 = mp.mpf('8.15406111272')      # cutLog(mass0/mass1)
L_mb  = mp.mpf('-4.08930665')        # cutLog mbRatioDerived
L_b0  = mp.mpf('1.73372875')         # cutLog mass0 (bMass 0)
L_b2  = mp.mpf('-1.0887237')         # cutLog mass2 (bMass 2)

leptonCensus = 2
def bandScreen(c, L): return kap*c*L

leptonTailScreen = bandScreen(leptonCensus, L_m01)
freezeout = mp.mpf(16)/9 + kap*((mp.mpf(7)/3)*L_mb + (mp.mpf(11)/3)*L_b0 - (mp.mpf(5)/3)*L_b2)

recomposedEndpoint = mp.mpf(7179)/54 + leptonTailScreen + freezeout
print("kap =", kap)
print("7179/54 =", mp.mpf(7179)/54)
print("leptonTailScreen (undressed) =", leptonTailScreen)
print("freezeout summand =", freezeout)
print("recomposedEndpoint =", recomposedEndpoint, " (banked ~136.307)")
print("measured 1/alpha(0) = 137.035999  [REMOVABLE PROSE]")
print("gap =", mp.mpf('137.035999') - recomposedEndpoint)
print()
print("=== fold-FORCED uniform (3/2) dressing of various term-SUBSETS (subset choice = fit) ===")
a = mp.mpf(7179)/54 + mp.mpf('1.5')*leptonTailScreen + freezeout
print("dress lepton only:               ", a)
run_part = kap*((mp.mpf(7)/3)*L_mb + (mp.mpf(11)/3)*L_b0 - (mp.mpf(5)/3)*L_b2)
b = mp.mpf(7179)/54 + mp.mpf('1.5')*leptonTailScreen + mp.mpf(16)/9 + mp.mpf('1.5')*run_part
print("dress lepton + fz-running only:  ", b)
c = mp.mpf(7179)/54 + mp.mpf('1.5')*leptonTailScreen + mp.mpf('1.5')*freezeout
print("dress lepton + whole freezeout:  ", c)
print()
print("=> subsets land at 137.17 / ~137 / ~138. Which subset gets the 3/2 is a CHOICE = tuning.")
print("=> conservingEndpoint (LowTailFoldForcedWeight) = 190/3 + 3/2*leptonTailScreen =",
      mp.mpf(190)/3 + mp.mpf('1.5')*leptonTailScreen, "(different normalization, NOT the 1/alpha candidate)")
