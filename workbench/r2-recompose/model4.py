import mpmath as mp
mp.mp.dps = 40
pi = mp.pi
kappa = 1/(3*pi)
L_top=28*pi/3; L_conf=8*pi/3
# lepton tail log (banked mass0/mass1)
L_lep = mp.mpf('8.154061112580743509671544826723377757635')
def bs(c,L): return kappa*c*L
iso=mp.mpf(2); hyp=mp.mpf(10)/3; chg=mp.mpf(16)/3; s=mp.mpf(1)/8

print("WAY-POINTS (must reproduce, SAME pipeline):")
print("  bare charge tower @v :", 42+bs(chg,L_top), "= 1582/27 =", mp.mpf(1582)/27)
print("  bare charge tower @Λ :", 42+bs(chg,L_top)+bs(chg,L_conf), "= 190/3 =", mp.mpf(190)/3)
print()

# recomposed frame: two channels each run 42->read, recombine 1/aem = 1/a2 + 1/aY,
# decoupling = the coloured content REMOVED below Λ.
# iso census across bands, hyper census across bands; but below edges content decouples.
# Model the em census stepping (R-ratio plateaus are the DERIVED removals):
# above v: full charge 16/3 (both channels). recombined = iso_tower + hyper_tower.
# Recombined reading = 112 + bs(16/3, L) since censuses add (Q=T3+Y).
print("RECOMBINED (two channel, censuses add to 16/3):")
ew_r = 112 + bs(chg,L_top)
conf_r = ew_r + bs(chg,L_conf)
print("  @v :", ew_r, " (=1582/27+70)")
print("  @Λ :", conf_r, " (=190/3+70)")
print()

# DECOUPLING BELOW Λ AS REMOVAL:
# The confined (coloured) content is removed. Below Λ only leptons (census 3) + the
# ISOSPIN channel decoupled (W/Z massive) => the isospin census (2) also removed below v.
# So below Λ running census = charge(16/3) - coloured - isospin-decoupled.
# The banked freeze-out plateaus 11/3,10/3,2 are the REMOVALS (coloured content leaving).
print("DECOUPLING AS REMOVAL below Λ (measured 137.036 removable prose):")
# leptonic-only below Λ:
print("  leptonic census 3 below Λ:", conf_r + bs(3,L_lep))
# full charge below Λ (=additive frame, WRONG):
print("  full 16/3 below Λ (additive):", conf_r + bs(chg,L_lep))
# The RECOMBINED read with iso decoupled below v (iso census 2 removed from below-v span):
# below v = conf band + lepton tail
belowv = conf_r + bs(chg,L_conf)*0  # placeholder
val_isodec = ew_r + bs(chg-iso,L_conf) + bs(chg-iso,L_lep)  # remove iso(2) below v
print("  iso(2) decoupled below v:", val_isodec)
# remove iso below v AND coloured below Λ (only leptons 3 below Λ):
val2 = ew_r + bs(chg-iso,L_conf) + bs(3,L_lep)
print("  iso decoupled below v + leptonic below Λ:", val2)
# The s=1/8 gather self-census anti-screening as running content of iso, removed below v:
val3 = conf_r + bs(chg,L_lep) - bs(s, L_conf+L_lep)
print("  additive - s antiscreen below v:", val3)

print("\n(measured 1/α(0)=137.035999, 1/α(MZ)=127.955 -- REMOVABLE PROSE, never a fit target)")
