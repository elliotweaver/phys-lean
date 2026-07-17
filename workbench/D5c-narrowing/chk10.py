from fractions import Fraction as F
import mpmath as mp
mp.mp.dps=60
ymax=F(15707963267,40000000000)
ymax2=ymax*ymax
print('ymax  =', ymax, '=', mp.nstr(mp.mpf(ymax.numerator)/ymax.denominator,25))
print('ymax^2=', ymax2, '=', mp.nstr(mp.mpf(ymax2.numerator)/ymax2.denominator,25))
for B in [F(1542125688,10**10), F(15421256875,10**11), F(154212568749,10**12)]:
    print('B=%s/%s=%s > ymax^2? %s gap %s' % (B.numerator,B.denominator,mp.nstr(mp.mpf(B.numerator)/B.denominator,20), B>ymax2, mp.nstr(mp.mpf((B-ymax2).numerator)/(B-ymax2).denominator,6)))
print('1-B/182 =', mp.nstr(1-0.1542125688/182,14), ' >= 100/101=', mp.nstr(100/101,14), '?', (1-0.1542125688/182)>=100/101)
C=F(184775906503,200000000000)
print('C=',C,'=',mp.nstr(mp.mpf(C.numerator)/C.denominator,22))
u=2*C*C-1
print('u=2C^2-1=',u,'=',mp.nstr(mp.mpf(u.numerator)/u.denominator,22))
usq=u*u
print('u^2=',usq,'=',mp.nstr(mp.mpf(usq.numerator)/usq.denominator,22))
fin=2*usq-1
print('final 2u^2-1=',fin,'=',mp.nstr(mp.mpf(fin.numerator)/fin.denominator,10),'>0?',fin>0)
# C^2 as literal for hu step
Csq=C*C
print('C^2 =', Csq, '=', mp.nstr(mp.mpf(Csq.numerator)/Csq.denominator,22))
