import mpmath as mp
mp.mp.dps = 40
pi = mp.pi
kappa = 1/(3*pi)
def bs(c, L): return kappa*c*L

# The DIRECTION check: census-conserving coloured slice (freeze-out staircase, at QUARK edges)
# vs additive coloured slice (bandScreen 10/3 at lepton edge mass0/mass1).
L_lep = mp.mpf('8.1534')
additive_coloured = bs(mp.mpf(10)/3, L_lep)
print("additive coloured slice bandScreen(10/3, m0/m1) =", float(additive_coloured))

# census-conserving coloured = freeze-out staircase dissolved summand:
def fz(L_mb, L_b0, L_b2):
    return mp.mpf(16)/9 + kappa*((mp.mpf(7)/3)*L_mb + (mp.mpf(11)/3)*L_b0 - (mp.mpf(5)/3)*L_b2)
# banked brackets for edge logs
# L_mb in [-41/10, -4], L_b0 in [17/10,18/10], L_b2 in [-12/10,-1]
# max of fz over box (fz increasing in L_mb, L_b0; decreasing in L_b2):
fz_max = fz(-4, mp.mpf(18)/10, -mp.mpf(12)/10)
fz_min = fz(-mp.mpf(41)/10, mp.mpf(17)/10, -1)
print("freeze-out staircase summand bracket: [%.4f, %.4f]" % (float(fz_min), float(fz_max)))
print("additive coloured slice:", float(additive_coloured))
print()
print("Is census-conserving coloured (freeze-out) < additive coloured? ", float(fz_max) < float(additive_coloured))
print("  fz_max=%.4f < additive=%.4f : margin %.4f" % (float(fz_max), float(additive_coloured), float(additive_coloured - fz_max)))
print()
# So: recomposedEndpoint (census-conserving) < additive-to-lepton variant, by (additive_coloured - fz).
# Both share: 7179/54 + leptonTailScreen(census 2). Difference = coloured slice.
# additive-to-lepton variant = 7179/54 + bandScreen 2 L_lep + bandScreen (10/3) L_lep
#                            = 7179/54 + bandScreen (16/3) L_lep  (full charge to lepton edges)
# census-conserving        = 7179/54 + bandScreen 2 L_lep + fz
# So direction reduces to: fz < bandScreen (10/3) L_lep, i.e. the freeze-out staircase (coloured at quark
# edges) screens LESS than the coloured census run all the way to the lepton edges.
print("This is FORCED: quark edges heavier => smaller logs => less screening than coloured-to-lepton-edges.")
print("fz_max <= 16/9 + kappa*((7/3)*(-4) + (11/3)*(18/10) - (5/3)*(-12/10)) =", float(fz_max))
print("additive_coloured >= kappa*(10/3)*8 (L_lep>8) =", float(bs(mp.mpf(10)/3, 8)))
print("clean separation: fz_max=%.4f < %.4f=kappa*(10/3)*8" % (float(fz_max), float(bs(mp.mpf(10)/3,8))))
