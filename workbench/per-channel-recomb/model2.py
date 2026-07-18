import mpmath as mp
mp.mp.dps = 40
pi = mp.pi
kappa = 1/(3*pi)
def bs(c, L): return kappa*c*L

# BANKED recomposed way-points (RecomposedRunningEndpoint, EXACT rationals of Cut):
ew_recomp   = mp.mpf(6923)/54    # M -> v, iso census reduced by s=1/8 (recomposed_EW_waypoint)
conf_recomp = mp.mpf(7179)/54    # v -> Lambda, iso decoupled, full charge census screens conf band
print("recomposed EW way-point   6923/54 =", float(ew_recomp))
print("recomposed conf way-point 7179/54 =", float(conf_recomp))
print("  (additive conf way-point 190/3+70 = 133.3333; recompose lowers by 7/18 =", float(mp.mpf(7)/18), ")")
print()

# BANKED freeze-out summand DISSOLVED (ComposedFreezeoutDissolved), determined closed form:
#   16/9 + kappa*[(7/3)L_mb + (11/3)L_b0 - (5/3)L_b2]
# banked brackets: L_mb=cutLog mbRatioDerived in [-41/10,-4]; L_b0=cutLog mass0 in [17/10,18/10]; L_b2=cutLog mass2 in [-12/10,-1]
def fz(L_mb, L_b0, L_b2):
    return mp.mpf(16)/9 + kappa*((mp.mpf(7)/3)*L_mb + (mp.mpf(11)/3)*L_b0 - (mp.mpf(5)/3)*L_b2)
fz_lo = fz(-mp.mpf(41)/10, mp.mpf(17)/10, -1)         # roughly
fz_hi = fz(-4, mp.mpf(18)/10, -mp.mpf(12)/10)
print("freeze-out summand (dissolved, determined) bracket over banked edge-log brackets: [%.4f, %.4f]" % (float(min(fz_lo,fz_hi)), float(max(fz_lo,fz_hi))))
fz_mid = fz(-mp.mpf(4.05), mp.mpf(1.75), -mp.mpf(1.1))
print("  representative mid ~", float(fz_mid))
print()

# census-conserving lepton tail: bandScreen(leptonCensus=2, mass0/mass1), L_lep ~ 8.153
L_lep = mp.mpf('8.1534')
lep_tail = bs(2, L_lep)
print("census-conserving lepton tail bandScreen(2, m0/m1) ~", float(lep_tail))
print()

# THE RECOMPOSED CENSUS-CONSERVING ENDPOINT = 7179/54 + fz + lepton-tail
endpoint = conf_recomp + fz_mid + lep_tail
print("recomposed census-conserving endpoint ~", float(endpoint))
print()
print("measured 1/alpha(0) ~ 137.035999 [REMOVABLE PROSE, never a fit target]")
print("recomposed ADDITIVE endpoint (full charge to lepton edges) ~", float(conf_recomp + bs(mp.mpf(16)/3, L_lep)))
print()
print("Direction: census-conserving (coloured freezes out at quark edges, fz~1.5)")
print("           < additive (coloured runs to lepton edges, bandScreen(10/3,L_lep)~%.3f)" % float(bs(mp.mpf(10)/3, L_lep)))
