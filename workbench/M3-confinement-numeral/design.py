from mpmath import mp, mpf, exp, pi
mp.dps = 60

# banked E-bracket for cutExp(pi/3)  (M2 cutExp_pi3_bracket)
Elo = mpf('284965') / mpf('100000')
Ehi = mpf('284966') / mpf('100000')
print('Elo,Ehi =', Elo, Ehi)

# confinementScaleRatio = cutExp(-12*pi) = 1 / cutExp(pi/3)^36   (12*pi = 36*(pi/3))
Plo = Elo ** 36
Phi = Ehi ** 36
print('Elo^36 =', Plo)
print('Ehi^36 =', Phi)
clo_max = 1 / Phi   # any valid lower rational must be <= 1/Ehi^36
chi_min = 1 / Plo   # any valid upper rational must be >= 1/Elo^36
print('1/Ehi^36 (clo upper limit) =', mp.nstr(clo_max, 30))
print('1/Elo^36 (chi lower limit) =', mp.nstr(chi_min, 30))

true = exp(-12 * pi)
print('true cutExp(-12pi) =', mp.nstr(true, 30))
print('rel width limits   =', mp.nstr((chi_min - clo_max) / clo_max, 6))

# ratios: v/Lambda = exp(8pi/3), M/Lambda = exp(12pi)
print('exp(8pi/3) v/Lambda =', mp.nstr(exp(8 * pi / 3), 30))
print('exp(12pi)  M/Lambda =', mp.nstr(exp(12 * pi), 30))
