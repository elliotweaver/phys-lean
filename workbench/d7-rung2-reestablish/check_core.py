from mpmath import mp, mpf
mp.dps = 40
# Rung1 sharp log windows (rationals)
# L = cutLog(mass0/mass1) in [815406111272/1e11, 815406111273/1e11]
# Lmb in [-40893067/1e7, -40893066/1e7]
# Lb0 in [17337287/1e7, 17337288/1e7]
# Lb2 in [-10887238/1e7, -10887236/1e7]
Llo=mpf('815406111272')/mpf('1e11'); Lhi=mpf('815406111273')/mpf('1e11')
Lmblo=mpf('-40893067')/mpf('1e7'); Lmbhi=mpf('-40893066')/mpf('1e7')
Lb0lo=mpf('17337287')/mpf('1e7'); Lb0hi=mpf('17337288')/mpf('1e7')
Lb2lo=mpf('-10887238')/mpf('1e7'); Lb2hi=mpf('-10887236')/mpf('1e7')
# inner combo C = 3L + (7/2)Lmb + (11/2)Lb0 - (5/2)Lb2
# lower: min over each term. coeff signs: 3L(+ so Llo), (7/2)Lmb (+coeff, Lmb negative-> use Lmblo for min), (11/2)Lb0(+ Lb0lo), -(5/2)Lb2 (Lb2 negative, -*neg=+, to minimize the whole use max Lb2 => -(5/2)*Lb2hi)
C_lo = 3*Llo + mpf(7)/2*Lmblo + mpf(11)/2*Lb0lo - mpf(5)/2*Lb2hi
C_hi = 3*Lhi + mpf(7)/2*Lmbhi + mpf(11)/2*Lb0hi - mpf(5)/2*Lb2lo
print('C_inner_scaled lo =', C_lo)
print('C_inner_scaled hi =', C_hi)
print('my hardcoded combo bracket: [224069/1e4, 224070/1e4] =', mpf('224069')/mpf('1e4'), mpf('224070')/mpf('1e4'))
print('  check C_lo >= 224069/1e4 ?', C_lo >= mpf('224069')/mpf('1e4'))
print('  check C_hi <= 224070/1e4 ?', C_hi <= mpf('224070')/mpf('1e4'))
print()
klo=(mpf('1250000000')/mpf('3926990817'))/3; khi=(mpf('50000000000')/mpf('157079632679'))/3
base=mpf('2425')/18
# endpoint lower = base + klo*C_lo ; upper = base + khi*C_hi (C positive, k positive)
ep_lo = base + klo*C_lo
ep_hi = base + khi*C_hi
print('endpoint lo (base+klo*C_lo) =', ep_lo)
print('endpoint hi (base+khi*C_hi) =', ep_hi)
print('my hardcoded endpoint bracket: [1370984/1e4, 1371006/1e4] =', mpf('1370984')/mpf('1e4'), mpf('1371006')/mpf('1e4'))
print('  check ep_lo >= 137.0984 ?', ep_lo >= mpf('1370984')/mpf('1e4'))
print('  check ep_hi <= 137.1006 ?', ep_hi <= mpf('1371006')/mpf('1e4'))
print()
# also verify the nlinarith-friendly forms h2:
print('klo*(224069/1e4) =', klo*mpf('224069')/mpf('1e4'), ' need >= 1370984/1e4 - 2425/18 =', mpf('1370984')/mpf('1e4')-base)
print('khi*(224070/1e4) =', khi*mpf('224070')/mpf('1e4'), ' need <= 1371006/1e4 - 2425/18 =', mpf('1371006')/mpf('1e4')-base)
