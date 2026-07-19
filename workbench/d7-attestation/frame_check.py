import mpmath as mp
mp.mp.dps = 30
pi = mp.pi
kap = 1/(3*pi)
L_m01 = mp.mpf('8.15406111272')
L_mb  = mp.mpf('-4.08930665')
L_b0  = mp.mpf('1.73372875')
L_b2  = mp.mpf('-1.0887237')

def bandScreen(c, L): return kap*c*L
leptonTailScreen = bandScreen(2, L_m01)
run_part = kap*((mp.mpf(7)/3)*L_mb + (mp.mpf(11)/3)*L_b0 - (mp.mpf(5)/3)*L_b2)
freezeout = mp.mpf(16)/9 + run_part
recomposed = mp.mpf(7179)/54 + leptonTailScreen + freezeout
print("FRAME A: recomposedEndpoint (7179/54 confinement waypoint) =", recomposed)
print("FRAME B: DepthTwoBandVaryingRunning invAlphaHigh+... uses 190/3 =", mp.mpf(190)/3,
      "  (a DIFFERENT normalization of 1/alpha assembly)")
print("  => the two frames are NOT the same object; 190/3=63.33 vs 7179/54=132.94")
print()
print("LowTailFoldForcedWeight.conservingEndpoint = 190/3 + 3/2*bandScreen(2, m0/m1) =",
      mp.mpf(190)/3 + mp.mpf('1.5')*leptonTailScreen)
print("   (this is the banked fold-forced depth-2 result in FRAME B; = 65.9, NOT a 1/alpha candidate)")
print()
print("=== ALL fold-forced-uniform (3/2) dressings of FRAME A running subsets ===")
print("dress NOTHING (bare recomposed):     ", recomposed)
print("dress lepton only:                   ", mp.mpf(7179)/54 + mp.mpf('1.5')*leptonTailScreen + freezeout)
print("dress lepton + fz running (not 16/9):", mp.mpf(7179)/54 + mp.mpf('1.5')*leptonTailScreen + mp.mpf(16)/9 + mp.mpf('1.5')*run_part)
print("dress lepton + WHOLE freezeout:      ", mp.mpf(7179)/54 + mp.mpf('1.5')*leptonTailScreen + mp.mpf('1.5')*freezeout)
print()
print("Manager target window [137.007, 137.055]:")
print("  none of the fold-forced UNIFORM subsets land inside it (137.099, 137.172, 137.989)")
print("  landing inside REQUIRES a per-term-varying (tuned) split = the fit LowTailFoldForcedWeight forbade")
