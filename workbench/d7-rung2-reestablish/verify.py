from mpmath import mp, mpf, log, pi
mp.dps = 45
# banked derived numerals (s6 grids)
m0_lo = mpf('5661726012625402')/mpf('1e15'); m0_hi = mpf('5661726012625422')/mpf('1e15')
b2_lo = mpf('580211920147532')/mpf('1e15'); b2_hi = mpf('580211920147542')/mpf('1e15')
m2_lo = b2_lo**2; m2_hi = b2_hi**2
q_lo = mpf('7071067811865')/mpf('1e13'); q_hi = mpf('7071067811866')/mpf('1e13')
mb_lo = (1-q_hi)**2/(3*(1+q_hi)); mb_hi = (1-q_lo)**2/(3*(1+q_lo))
print('L_b0 = cutLog mass0:', log(m0_lo), log(m0_hi))
print('  reverted bracket:', mpf('1733728794954')/mpf('1e12'), mpf('1733728794955')/mpf('1e12'))
print('L_b2 = cutLog mass2:', log(m2_lo), log(m2_hi))
print('  reverted bracket:', mpf('-1088723725224')/mpf('1e12'), mpf('-1088723725223')/mpf('1e12'))
print('L_mb = cutLog mbRatio:', log(mb_lo), log(mb_hi))
print('  reverted bracket:', mpf('-4089306640008')/mpf('1e12'), mpf('-4089306640006')/mpf('1e12'))
Lm01 = mpf('815406111272')/mpf('1e11')
invpi_lo = mpf('1250000000')/mpf('3926990817'); invpi_hi = mpf('50000000000')/mpf('157079632679')
k_lo = invpi_lo/3; k_hi = invpi_hi/3
print('1/pi bracket width:', invpi_hi-invpi_lo, ' true 1/pi:', 1/pi)

def endpoint(k, Lm01, Lmb, Lb0, Lb2):
    return mpf('2425')/18 + k*(2*Lm01+(mpf(7)/3)*Lmb+(mpf(11)/3)*Lb0-(mpf(5)/3)*Lb2)

Lb0 = log(m0_lo); Lb2 = log(m2_lo); Lmb = log(mb_lo)
print('endpoint central:', endpoint((k_lo+k_hi)/2, Lm01, Lmb, Lb0, Lb2))
print('reverted endpoint bracket:', mpf('1363071881405')/mpf('1e10'), mpf('1363071881406')/mpf('1e10'))
C_inner = 2*Lm01+(mpf(7)/3)*Lmb+(mpf(11)/3)*Lb0-(mpf(5)/3)*Lb2
print('C_inner =', C_inner)
print('kappa endpoint-width contribution (C*dk):', C_inner*(k_hi-k_lo))
print('L_m01 endpoint-width contribution (2k*1e-11):', 2*((k_lo+k_hi)/2)*mpf('1e-11'))
print('edge-log endpoint-width contrib at 1e-12 (~(11/3)k*1e-12):', (mpf(11)/3)*((k_lo+k_hi)/2)*mpf('1e-12'))
