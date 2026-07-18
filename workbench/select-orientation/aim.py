from fractions import Fraction as F

invcutpi_lo, invcutpi_hi = F(5,17), F(5,14)
kap_lo, kap_hi = invcutpi_lo/3, invcutpi_hi/3

lep_log_lo, lep_log_hi = F(1), F(6,5)
lep_census = F(2)
lep_lo = kap_lo*lep_census*lep_log_lo
lep_hi = kap_hi*lep_census*lep_log_hi
print("kappa bracket:", float(kap_lo), float(kap_hi))
print("census-conserving lepton-tail screen bracket:", float(lep_lo), float(lep_hi))

conf_wp = F(7179,54)
print("recomposed conf way-point 7179/54 =", float(conf_wp))

fz_lo, fz_hi = F(6,5), F(2)
endpoint_lo = conf_wp + fz_lo + lep_lo
endpoint_hi = conf_wp + fz_hi + lep_hi
print("census-conserving COMPLETE endpoint (orientation) ~ [%.3f, %.3f]" % (float(endpoint_lo), float(endpoint_hi)))
print("measured 1/alpha(0) ~ 137.036 (removable prose)")
