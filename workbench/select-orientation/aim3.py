from fractions import Fraction as F

# R2 recombined census-conserving COMPLETE endpoint (leading-kappa, undressed):
#   r2CompleteEndpoint = 7179/54 + bandScreen leptonCensus (mass0/mass1)
#                      = 7179/54 + kappa*2*cutLog(mass0/mass1),  kappa = 1/(3 cutPi)
# banked: recomposed_conf_waypoint = 7179/54 (recombined 112 + s=1/8 anti-screen + full-census conf band)
#         leptonCensus = 2 ; cutLog(mass0/mass1) in [1,9] (banked cutLog_content_lo/hi); 1/cutPi in [5/17,5/14]

invcutpi_lo, invcutpi_hi = F(5,17), F(5,14)
kap_lo, kap_hi = invcutpi_lo/3, invcutpi_hi/3
conf_wp = F(7179,54)

# loose banked log bracket [1,9]
log_lo, log_hi = F(1), F(9)
ep_lo = conf_wp + 2*kap_lo*log_lo
ep_hi = conf_wp + 2*kap_hi*log_hi
print("LOOSE bracket (banked log [1,9]): [%.4f, %.4f]  width %.4f" % (float(ep_lo), float(ep_hi), float(ep_hi-ep_lo)))

# reconciliation check: census partition 16/3 = 10/3 (staircase, decoupled below conf) + 2 (leptons)
print("census partition: 16/3 =", F(16,3), " ; 10/3 + 2 =", F(10,3)+2, " match:", F(16,3)==F(10,3)+2)

# clean-form check: (3/2)-dressed variant gives 3*kappa*cutLog = cutLog/cutPi
print("leading-kappa: 2*kappa =", "2/(3cutPi)")
print("recomposed conf way-point identity: 190/3 + 70 - 7/18 =", F(190,3)+70-F(7,18), "== 7179/54 =", F(7179,54))

# orientation (m0/m1 ~ tau/e ~ 3477, cutLog ~ 8.155):
import math
log_orient = F(8155,1000)
ep_orient_lo = conf_wp + 2*kap_lo*log_orient
ep_orient_hi = conf_wp + 2*kap_hi*log_orient
print("ORIENTATION (cutLog~8.155): [%.4f, %.4f]" % (float(ep_orient_lo), float(ep_orient_hi)))
print("measured 1/alpha(0) ~ 137.036 (removable prose)")
print("=> census-conserving leading-kappa endpoint UNDERSHOOTS measured by ~%.2f (removal frame corrects additive overshoot DOWN)" % (137.036 - float((ep_orient_lo+ep_orient_hi)/2)))
