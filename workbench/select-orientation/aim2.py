from fractions import Fraction as F

# Banked brackets
invcutpi_lo, invcutpi_hi = F(5,17), F(5,14)         # 1/cutPi (InvCutPiBracket)
kap_lo, kap_hi = invcutpi_lo/3, invcutpi_hi/3       # kappa = 1/(3 cutPi)

# Banked edge-log brackets (FreezeoutEdgeNumerals) = cutLog(edge):
bE_lo, bE_hi = F(-7,5), F(-1)     # bottomEdgeLog = cutLog(edgeBottom)
cE_lo, cE_hi = F(4), F(41,10)     # charmEdgeLog  = cutLog(edgeCharm)
lE_lo, lE_hi = F(14,5), F(7,2)    # lightEdgeLog  = cutLog(edgeLight)

# freeze-out combination C = (11/3)*bottomEdgeLog + (10/3)*charmEdgeLog + 2*lightEdgeLog ; all coefs > 0
C_lo = F(11,3)*bE_lo + F(10,3)*cE_lo + 2*lE_lo
C_hi = F(11,3)*bE_hi + F(10,3)*cE_hi + 2*lE_hi
print("freeze-out log-combo C in [%.4f, %.4f]" % (float(C_lo), float(C_hi)))

# freeze-out screening = kappa * C ; C>0 so use kap_lo*C_lo .. kap_hi*C_hi
fz_lo = kap_lo * C_lo
fz_hi = kap_hi * C_hi
print("freeze-out screening bracket [%.4f, %.4f]" % (float(fz_lo), float(fz_hi)))

# census-conserving lepton tail: bandScreen 2 (m0/m1) = kappa*2*cutLog(m0/m1)
# cutLog(m0/m1): banked >=1, <=9; realistic m0/m1 ~ 3478 (tau/e)?? NO -- mass0/mass1 is the FORCED flavor ratio.
# From AssembledBracket: 3 <= mass0/mass1 <= 1e9/286902 ~ 3485. cutLog in [cutLog 3, cutLog 3485].
# But banked cutLog_content_hi says cutLog(m0/m1) <= 9. And >=1. Use the banked loose bracket.
import math
# orientation only (not used in proof): if m0/m1 ~ 3478 (tau/e), cutLog ~ 8.15
lep_log_lo, lep_log_hi = F(1), F(9)   # banked cutLog_content_lo / cutLog_content_hi
lep_lo = kap_lo*2*lep_log_lo
lep_hi = kap_hi*2*lep_log_hi
print("lepton-tail screening bracket [%.4f, %.4f]" % (float(lep_lo), float(lep_hi)))

conf_wp = F(7179,54)
print("recombined conf way-point 7179/54 = %.5f" % float(conf_wp))

ep_lo = conf_wp + fz_lo + lep_lo
ep_hi = conf_wp + fz_hi + lep_hi
print("R2 census-conserving recombined COMPLETE endpoint bracket:")
print("   [%.4f, %.4f]" % (float(ep_lo), float(ep_hi)))
print("width = %.4f" % float(ep_hi-ep_lo))
print("measured 1/alpha(0) ~ 137.036 (removable orientation prose)")

# tighter lepton log if m0/m1 ~ 3478:
lep_log = F(815,100)  # ~8.15
lep_mid = (kap_lo+kap_hi)/2*2*lep_log
print("--- orientation w/ m0/m1~3478 (cutLog~8.15): lepton screen ~ %.3f" % float(lep_mid))
print("--- orientation endpoint center ~ %.3f" % float(conf_wp + (fz_lo+fz_hi)/2 + lep_mid))
