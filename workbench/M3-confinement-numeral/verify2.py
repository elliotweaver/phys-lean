from fractions import Fraction as F

Elo = F(284965, 100000)
Ehi = F(284966, 100000)

# ---- confinementScaleRatio = 1/E^36  ->  chosen [42408/1e21, 42414/1e21]
Elo36 = Elo ** 36
Ehi36 = Ehi ** 36
clo = F(42408, 10 ** 21)
chi = F(42414, 10 ** 21)
print('CONF Lambda/M:')
print('  lo*Ehi^36 <= 1 ?', clo * Ehi36 <= 1, float(clo * Ehi36))
print('  1 <= hi*Elo^36 ?', 1 <= chi * Elo36, float(chi * Elo36))
print('  bracket', float(clo), float(chi))

# ---- v/Lambda = confBandRatio = cutExp(8pi/3) = E^8 -> bracket
Elo8 = Elo ** 8
Ehi8 = Ehi ** 8
print('\nv/Lambda = E^8:')
print('  Elo^8 =', float(Elo8), ' Ehi^8 =', float(Ehi8))
# choose [4347, 4350]?  need vlo <= Elo^8 and Ehi^8 <= vhi
vlo = F(4347)
vhi = F(4350)
print('  vlo <= Elo^8 ?', vlo <= Elo8, '  Ehi^8 <= vhi ?', Ehi8 <= vhi)

# ---- M/Lambda = 1/confinementScaleRatio = E^36 -> bracket
print('\nM/Lambda = E^36:')
print('  Elo^36 =', float(Elo36), ' Ehi^36 =', float(Ehi36))
# choose [23577/1e-... ] i.e. [2.3577e16, 2.3581e16]
mlo = F(23577, 1) * 10 ** 12   # 2.3577e16
mhi = F(23581, 1) * 10 ** 12   # 2.3581e16
print('  mlo <= Elo^36 ?', mlo <= Elo36, '  Ehi^36 <= mhi ?', Ehi36 <= mhi)
print('  mlo,mhi', float(mlo), float(mhi))
