import mpmath as mp
mp.mp.dps = 40
pi = mp.pi

# ---- banked derived constants ----
kappa = 1/(3*pi)                      # X1  κ = 1/(3π)
# censuses
isoDepth = mp.mpf(2)                  # Tr(T3^2)
hyperDepth = mp.mpf(10)/3             # Tr(Y^2)
chargeDepth = mp.mpf(16)/3            # Tr(Q^2) = 2 + 10/3
# ceilings
ceil_iso = mp.mpf(42)                 # 1/alpha*  (octonion)
ceil_hyp = mp.mpf(70)                 # (5/3)*42  GUT hypercharge
# M-skeleton edge logs (banked exact): log(topBandRatio)=28pi/3, log(confBandRatio)=8pi/3
L_top = 28*pi/3
L_conf = 8*pi/3
# gather self-census (Z1): projectedS s=1/8 anti-screening magnitude; gatherIsoSpinCensus=4
s = mp.mpf(1)/8
gatherIso = mp.mpf(4)

# lepton tail ratio mass0/mass1 (banked bracket ~ 1e9/288575 .. 1e9/286902)
# D7 numeral: invAlphaZero(completeBandList)=67.9475880261...  = 190/3 + kappa*(16/3)*log(mass0/mass1)
# solve for the effective lepton log:
D7 = mp.mpf('67.9475880261')
wp_conf = mp.mpf(190)/3
lep_screen = D7 - wp_conf             # kappa*(16/3)*log(m0/m1)
L_lep = lep_screen/(kappa*chargeDepth)
print("=== banked anchors ===")
print("kappa            =", kappa)
print("wp top 1582/27   =", mp.mpf(1582)/27, " check 42+kappa*16/3*L_top =", 42+kappa*chargeDepth*L_top)
print("wp conf 190/3    =", wp_conf, " check 1582/27+kappa*16/3*L_conf =", mp.mpf(1582)/27+kappa*chargeDepth*L_conf)
print("D7 charge tower  =", D7, "  lep_screen =", lep_screen, " L_lep =", L_lep)
print("m0/m1 =", mp.e**L_lep)

# ---- current ADDITIVE +70 frame ----
add = D7 + 70
print("\n=== current additive +70 frame ===")
print("invAlphaEM = D7 + 70 =", add, "  (measured 137.036, overshoot", add-mp.mpf('137.035999'),")")

# ---- overshoot at the two way-points under +70 ----
ew_recomb = mp.mpf(1582)/27 + 70
conf_recomb = wp_conf + 70
print("\n=== recombined readings at edges (+70) ===")
print("EW edge  1582/27+70 =", ew_recomb, " (measured 1/a(MZ)~127.955, overshoot", ew_recomb-mp.mpf('127.955'),")")
print("conf edge 190/3+70  =", conf_recomb)

# ---- the overshoots ----
print("\n=== overshoot analysis ===")
os_ew = ew_recomb - mp.mpf('127.955')
os_read = add - mp.mpf('137.035999')
print("overshoot EW  =", os_ew)
print("overshoot read=", os_read)
print("diff          =", os_read-os_ew)
