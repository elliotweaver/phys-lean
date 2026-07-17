from fractions import Fraction as F

# dressed: 74 + (d/2)*cutLog*(1/cutPi), d=16/3 => d/2 = 8/3
cl_lo = F(815406110,10**8); cl_hi = F(815406115,10**8)
inv_lo = F(25000000,78539817); inv_hi = F(3125000,9817477)
d2 = F(8,3)
dlo = 74 + d2*cl_lo*inv_lo
dhi = 74 + d2*cl_hi*inv_hi
print("dressed lo =", dlo, "=", float(dlo))
print("dressed hi =", dhi, "=", float(dhi))
print("dressed width =", float(dhi-dlo))
# parent dressed
pdlo = F(19066651594,235619451); pdhi = F(1906665005,23561943)
print("parent dressed [%.12f,%.12f]" % (float(pdlo),float(pdhi)))
print("nested? %s , %s" % (pdlo<=dlo, dhi<=pdhi))
print()
# main bracket endpoints
lo = F(48029320130,706858353)
hi = F(12007329895,176714586)
print("main lo =", lo, "=", float(lo))
print("main hi =", hi, "=", float(hi))
print("strict two-sided?", lo<hi)
# width lt vs parent
new_w = hi - lo
par_lo = F(48029320130,706858353); par_hi = F(4802931616,70685829)
par_w = par_hi - par_lo
print("new width  =", float(new_w))
print("par width  =", float(par_w))
print("new_w < par_w?", new_w < par_w)
# nested
print("nested lower: par_lo <= lo?", par_lo<=lo, "(equal:", par_lo==lo, ")")
print("nested upper: hi <= par_hi?", hi<=par_hi)
print("gt waypoint 190/3 < lo?", F(190,3) < lo)
print()
# verify the arithmetic identity endpoint_assembled gives for the harith norm_num steps:
# lower: 190/3 + (16/3)/3 * cl_lo * inv_lo   with chargeTraceDepth=16/3
d = F(16,3)
lhs_lo = F(190,3) + d/3 * cl_lo * inv_lo
print("check lo identity:", lhs_lo, "==", lo, lhs_lo==lo)
lhs_hi = F(190,3) + d/3 * cl_hi * inv_hi
print("check hi identity:", lhs_hi, "==", hi, lhs_hi==hi)
# dressed identity d/2
dlo_id = 74 + d/2 * cl_lo * inv_lo
dhi_id = 74 + d/2 * cl_hi * inv_hi
print("check dressed lo:", dlo_id==dlo, "  hi:", dhi_id==dhi)
