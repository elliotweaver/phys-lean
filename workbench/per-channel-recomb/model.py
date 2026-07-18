import mpmath as mp
mp.mp.dps = 40
pi = mp.pi
kappa = 1/(3*pi)

def bs(c, L): return kappa*c*L

# High bands (exact way-points): census 16/3 through top+conf
# bandScreen(16/3, top) = 448/27 ; 42 + 448/27 = 1582/27 (EW way-point)
# bandScreen(16/3, conf) = 128/27 ; 1582/27 + 128/27 = 190/3 (conf way-point)
ew_wp = mp.mpf(1582)/27
conf_wp = mp.mpf(190)/3
print("EW way-point 1582/27  =", float(ew_wp))
print("conf way-point 190/3  =", float(conf_wp))
print("recombined EM at Lambda (190/3 + 70) =", float(conf_wp + 70))
print()

# Lepton tail edge log: L_lep = cutLog(mass0/mass1), banked bracket ~ 8.153
L_lep = mp.mpf('8.1534')

# ADDITIVE frame: run FULL census 16/3 to lepton edges
add = conf_wp + 70 + bs(mp.mpf(16)/3, L_lep)
print("ADDITIVE frame (census 16/3 to lepton edges):", float(add), " [+70 recombined]")

# CENSUS-CONSERVING removal (no re-supply): only leptonic census 2 to lepton edges
cons = conf_wp + 70 + bs(2, L_lep)
print("census-conserving removal (census 2 to lepton edges):", float(cons))
print()

# THEORY-NATIVE: coloured content (10/3) freezes out at QUARK edges, not lepton edges.
# The banked freezeout_summand_dissolved (ComposedFreezeoutDissolved) at pinned edges:
#   = 16/9 + kappa*[(7/3)L_mb + (11/3)L_b0 - (5/3)L_b2]
# with banked brackets: L_mb=cutLog(mbRatioDerived) in [-41/10,-4]; L_b0=cutLog mass0 in [17/10,18/10];
#   L_b2=cutLog mass2 in [-12/10,-1].
# Representative mids:
L_mb = mp.mpf(-4.5)   # charm edge log ~ -(4..4.1) => mbRatioDerived; use mid -4.5
L_b0 = mp.mpf(1.75)
L_b2 = mp.mpf(-1.1)
fz_summand = mp.mpf(16)/9 + kappa*((mp.mpf(7)/3)*L_mb + (mp.mpf(11)/3)*L_b0 - (mp.mpf(5)/3)*L_b2)
print("banked freezeout_summand_dissolved (coloured @ quark edges) ~", float(fz_summand))
print()

# COMPOSED census-conserving + coloured-at-quark-edges:
#   high bands (way-points) + leptonic tail (census 2) + freeze-out staircase (coloured @ quark edges)
composed = conf_wp + 70 + bs(2, L_lep) + fz_summand
print("COMPOSED (way-points + leptonic tail + coloured freeze-out @ quark edges):", float(composed))
print()
print("measured 1/alpha(0) ~ 137.035999 [REMOVABLE PROSE, never a fit target]")
print()
print("So the composed endpoint = 190/3+70 + kappa*2*L_lep + [16/9 + kappa*((7/3)L_mb+(11/3)L_b0-(5/3)L_b2)]")
print("  = 133.333 + %.4f + %.4f" % (float(bs(2,L_lep)), float(fz_summand)))
