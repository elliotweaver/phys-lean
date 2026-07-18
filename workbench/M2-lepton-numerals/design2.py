import mpmath as mp
from fractions import Fraction as F
mp.mp.dps=80
pi=mp.pi
E=mp.e**(pi/3)
print('E = cutExp(pi/3) =', mp.nstr(E,25))
# choose rational bracket for E (pi/3 in [1047197/1e6, 1047198/1e6]) -> exp bracket
# We'll get Elo,Ehi from partialExp/remBound at N. For design, use tight rationals around E.
Elo=F(284965,100000); Ehi=F(284966,100000)
print('Elo=',float(Elo),'Ehi=',float(Ehi),' true E=',mp.nstr(E,12))
print('Elo<E<Ehi?', float(Elo)<E<float(Ehi))
# ew = 1/E^28 ; bracket: 1/Ehi^28 <= ew <= 1/Elo^28
lo_ew = F(1,1)/(Ehi**28)
hi_ew = F(1,1)/(Elo**28)
print('1/Ehi^28 =', mp.nstr(mp.mpf(lo_ew.numerator)/lo_ew.denominator,20))
print('1/Elo^28 =', mp.nstr(mp.mpf(hi_ew.numerator)/hi_ew.denominator,20))
print('true ew  =', mp.nstr(mp.e**(-28*pi/3),20))
# So safe rational bracket for ew: [ewlo, ewhi] with ewlo <= 1/Ehi^28 and 1/Elo^28 <= ewhi
# pick ewlo = 18442/1e17, ewhi = 18443/1e17
ewlo=F(18442,10**17); ewhi=F(18443,10**17)
print('ewlo<=1/Ehi^28?', ewlo <= lo_ew, '  ; check ewlo*Ehi^28<=1:', ewlo*(Ehi**28) <= 1)
print('1/Elo^28<=ewhi?', hi_ew <= ewhi, '  ; check 1<=ewhi*Elo^28:', 1 <= ewhi*(Elo**28))
print('ewlo=',mp.nstr(mp.mpf(ewlo.numerator)/ewlo.denominator,20),' ewhi=',mp.nstr(mp.mpf(ewhi.numerator)/ewhi.denominator,20))
