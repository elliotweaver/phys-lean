from fractions import Fraction as F

# deep edge logs (~1e-12)
Lb0_lo = F(1733728794954, 10**12); Lb0_hi = F(1733728794955, 10**12)
Lb2_lo = F(-1088723725224, 10**12); Lb2_hi = F(-1088723725223, 10**12)
Lmb_lo = F(-4089306640008, 10**12); Lmb_hi = F(-4089306640006, 10**12)
Lm_lo = F(815406111272, 10**11); Lm_hi = F(815406111273, 10**11)

# DRESSED inner combo: 3L + (7/2)Lmb + (11/2)Lb0 - (5/2)Lb2
Clo = 3*Lm_lo + F(7,2)*Lmb_lo + F(11,2)*Lb0_lo - F(5,2)*Lb2_hi
Chi = 3*Lm_hi + F(7,2)*Lmb_hi + F(11,2)*Lb0_hi - F(5,2)*Lb2_lo

# proposed inner-combo bracket
combo_lo = F(224069277834, 10**10)
combo_hi = F(224069277835, 10**10)
print("combo_lo <= Clo:", combo_lo <= Clo, " margin", float(Clo-combo_lo))
print("Chi <= combo_hi:", Chi <= combo_hi, " margin", float(combo_hi-Chi))

klo = F(1250000000, 3926990817) / 3
khi = F(50000000000, 157079632679) / 3
base = F(2425,18)
ep_lo = F(1370996710997, 10**10)
ep_hi = F(1370996710998, 10**10)
# h2 lower: klo*combo_lo >= ep_lo - base
print("klo*combo_lo >= ep_lo-base:", klo*combo_lo >= ep_lo-base, float(klo*combo_lo-(ep_lo-base)))
# h2 upper: khi*combo_hi <= ep_hi - base
print("khi*combo_hi <= ep_hi-base:", khi*combo_hi <= ep_hi-base, float((ep_hi-base)-khi*combo_hi))
# strict two-sided
print("ep_lo < ep_hi:", ep_lo < ep_hi)
print("combo_lo < combo_hi:", combo_lo < combo_hi)
# nested in banked [137.0984,137.1006]
print("nested:", F(1370984,10**4) <= ep_lo and ep_hi <= F(1371006,10**4))
