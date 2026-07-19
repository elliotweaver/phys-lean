import math

q = math.cos(math.pi/4)          # = sqrt(2)/2
mbRatio = (1-q)**2 / (3*(1+q))   # mbRatioDerived closed form
b0 = 2.37943; b2 = 0.5802
mass0 = b0**2; mass2 = b2**2
Lmb = math.log(mbRatio); Lb0 = math.log(mass0); Lb2 = math.log(mass2)
kappa = 1/(3*math.pi)

def summand(gem, cmb, cb0, cb2):
    return gem + kappa*(cmb*Lmb + cb0*Lb0 + cb2*Lb2)

banked    = summand(16/9, 7/3, 11/3, -5/3)     # (11/3,10/3,2) on rb,rc,rl
corrected = summand(40/27, 3,   10/3, -5/3)    # (10/3, 2, 5/3) on rb,rc,rl
print("L_mb=%.6f  L_b0=%.6f  L_b2=%.6f  kappa=%.6f" % (Lmb,Lb0,Lb2,kappa))
print("banked freeze-out summand    ~ %.6f  (matches banked ~1.6324)" % banked)
print("corrected freeze-out summand ~ %.6f" % corrected)
print("shift (corrected-banked)     ~ %+.6f" % (corrected-banked))
print()
# Endpoint = 112 + dressed_recomb + freezeout_summand  (freeze-out enters UNDRESSED)
# banked dressed composed endpoint = 137.099671 (DEF-B).  The freeze-out summand enters additively,
# so the corrected endpoint = 137.099671 + (corrected-banked).
banked_endpoint = 137.099671
corrected_endpoint = banked_endpoint + (corrected - banked)
measured = 137.035999
print("banked composed endpoint        = %.6f  (measured %.6f, +%.6f)" % (banked_endpoint, measured, banked_endpoint-measured))
print("CORRECTED composed endpoint     ~ %.6f  (measured %.6f, %+.6f)" % (corrected_endpoint, measured, corrected_endpoint-measured))
