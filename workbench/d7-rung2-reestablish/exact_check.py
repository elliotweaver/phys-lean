from fractions import Fraction as F

# banked kappa window (1/cutPi ext6, /3)
klo = F(1250000000, 3926990817) / 3
khi = F(50000000000, 157079632679) / 3

# deep edge logs (reverted Rung2, ~1e-12)
Lb0_lo = F(1733728794954, 10**12); Lb0_hi = F(1733728794955, 10**12)
Lb2_lo = F(-1088723725224, 10**12); Lb2_hi = F(-1088723725223, 10**12)
Lmb_lo = F(-4089306640008, 10**12); Lmb_hi = F(-4089306640006, 10**12)
# L_m01 s6 (NB11 ~1e-11)
Lm_lo = F(815406111272, 10**11); Lm_hi = F(815406111273, 10**11)

# DRESSED inner combo: 3L + (7/2)Lmb + (11/2)Lb0 - (5/2)Lb2
Clo = 3*Lm_lo + F(7,2)*Lmb_lo + F(11,2)*Lb0_lo - F(5,2)*Lb2_hi
Chi = 3*Lm_hi + F(7,2)*Lmb_hi + F(11,2)*Lb0_hi - F(5,2)*Lb2_lo
print('Clo =', float(Clo))
print('Chi =', float(Chi))

# proposed certified inner-combo bracket
combo_lo = F(224069277834, 10**10)  # 22.4069277834
combo_hi = F(224069277835, 10**10)  # 22.4069277835
print('combo_lo <= Clo ?', combo_lo <= Clo, float(Clo-combo_lo))
print('Chi <= combo_hi ?', Chi <= combo_hi, float(combo_hi-Chi))

base = F(2425,18)
# endpoint bracket target
ep_lo_target = F(1370996710997, 10**10)  # 137.0996710997
ep_hi_target = F(1370996710998, 10**10)  # 137.0996710998

# core lower: k*C >= klo*combo_lo, need klo*combo_lo >= ep_lo_target - base
lhs_lo = klo*combo_lo
print('klo*combo_lo - (ep_lo_target-base) =', float(lhs_lo - (ep_lo_target-base)), '>=0?', lhs_lo >= ep_lo_target-base)
# core upper: k*C <= khi*combo_hi, need khi*combo_hi <= ep_hi_target - base
lhs_hi = khi*combo_hi
print('(ep_hi_target-base) - khi*combo_hi =', float((ep_hi_target-base) - lhs_hi), '>=0?', lhs_hi <= ep_hi_target-base)

print()
print('actual ep_lo = base+klo*Clo =', float(base+klo*Clo))
print('actual ep_hi = base+khi*Chi =', float(base+khi*Chi))
print('final bracket [137.0996710997, 137.0996710998], width 1e-10')
# check nesting inside current banked [137.0984,137.1006]
print('nested in [137.0984,137.1006]?', F(1370984,10**4) <= ep_lo_target and ep_hi_target <= F(1371006,10**4))
