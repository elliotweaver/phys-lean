from fractions import Fraction as F
import mpmath as mp
mp.mp.dps=60
ymax=F(15707963267,40000000000)
y=mp.mpf(ymax.numerator)/ymax.denominator
# partialCos6(y) = 1 - y^2/2 + y^4/24 - y^6/720 + y^8/40320 - y^10/3628800
def pc6(y): return 1 - y**2/2 + y**4/24 - y**6/720 + y**8/40320 - y**10/3628800
rem = 1.01*(y**12/479001600)
Cs = {'184775906503/2e11':F(184775906503,200000000000),
      '1847759065023/2e12':F(1847759065023,2000000000000),
      '92387953251/1e11':F(92387953251,10**11),
      '923879532513/1e12':F(923879532513,10**12)}
for name,C in Cs.items():
    Cv=mp.mpf(C.numerator)/C.denominator
    margin = pc6(y) - rem - Cv
    # also the double-double-angle final closure fin = 2*(2C^2-1)^2-1
    u=2*C*C-1; fin=2*u*u-1
    print("C=%-22s certmargin(pc6-rem-C)=%s  finalclosure=%s >0? %s  C>cos(pi/8)margin=%s" % (
        name, mp.nstr(margin,6), mp.nstr(mp.mpf(fin.numerator)/fin.denominator,6), fin>0,
        mp.nstr(Cv-mp.cos(mp.pi/8),6)))
print()
print("pc6(ymax)=",mp.nstr(pc6(y),25))
print("rem      =",mp.nstr(rem,10))
print("pc6-rem  =",mp.nstr(pc6(y)-rem,25))
print("cos(ymax)=",mp.nstr(mp.cos(y),25))
