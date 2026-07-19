from mpmath import mp, mpf
mp.dps = 50
# CURRENT banked instrument windows
invpi_lo = mpf('1250000000') / mpf('3926990817')
invpi_hi = mpf('50000000000') / mpf('157079632679')
print('1/cutPi ext6 window width =', invpi_hi - invpi_lo)
klo = invpi_lo / 3
khi = invpi_hi / 3
print('kappa window width =', khi - klo)
# deep edge logs (reverted Rung2, re-establishable, ~1e-12):
Lb0_lo = mpf('1733728794954') / mpf('1e12'); Lb0_hi = mpf('1733728794955') / mpf('1e12')
Lb2_lo = mpf('-1088723725224') / mpf('1e12'); Lb2_hi = mpf('-1088723725223') / mpf('1e12')
Lmb_lo = mpf('-4089306640008') / mpf('1e12'); Lmb_hi = mpf('-4089306640006') / mpf('1e12')
# L_m01 s6 (NB11, ~1e-11):
Lm_lo = mpf('815406111272') / mpf('1e11'); Lm_hi = mpf('815406111273') / mpf('1e11')
# DRESSED coeffs: 3*L_m01 + (7/2)Lmb + (11/2)Lb0 - (5/2)Lb2
Clo = 3 * Lm_lo + mpf(7) / 2 * Lmb_lo + mpf(11) / 2 * Lb0_lo - mpf(5) / 2 * Lb2_hi
Chi = 3 * Lm_hi + mpf(7) / 2 * Lmb_hi + mpf(11) / 2 * Lb0_hi - mpf(5) / 2 * Lb2_lo
print('C_dressed inner combo lo =', Clo)
print('C_dressed inner combo hi =', Chi)
print('C_dressed combo width =', Chi - Clo)
base = mpf('2425') / 18
ep_lo = base + klo * Clo
ep_hi = base + khi * Chi
print('DRESSED endpoint lo =', ep_lo)
print('DRESSED endpoint hi =', ep_hi)
print('DRESSED endpoint width =', ep_hi - ep_lo)
print()
Ctyp = (Clo + Chi) / 2
ktyp = (klo + khi) / 2
print('kappa contribution to width ~ (khi-klo)*Ctyp =', (khi - klo) * Ctyp)
print('C-combo contribution ~ ktyp*(Chi-Clo) =', ktyp * (Chi - Clo))
print('  L_m01 piece: 3*(Lm_hi-Lm_lo)*ktyp =', 3 * (Lm_hi - Lm_lo) * ktyp)
print('  Lmb piece: (7/2)*(Lmb_hi-Lmb_lo)*ktyp =', mpf(7) / 2 * (Lmb_hi - Lmb_lo) * ktyp)
print('  Lb0 piece: (11/2)*(Lb0_hi-Lb0_lo)*ktyp =', mpf(11) / 2 * (Lb0_hi - Lb0_lo) * ktyp)
print('  Lb2 piece: (5/2)*(Lb2_hi-Lb2_lo)*ktyp =', mpf(5) / 2 * (Lb2_hi - Lb2_lo) * ktyp)
