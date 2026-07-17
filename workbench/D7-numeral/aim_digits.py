from fractions import Fraction as F
import decimal
lo=F(12007329939722,176714586765)
hi=F(32019546505738,471238898037)
print('lo=',float(lo))
print('hi=',float(hi))
print('width=',float(hi-lo))
decimal.getcontext().prec=40
dl=decimal.Decimal(lo.numerator)/decimal.Decimal(lo.denominator)
dh=decimal.Decimal(hi.numerator)/decimal.Decimal(hi.denominator)
print('lo=',dl)
print('hi=',dh)
sl=str(dl); sh=str(dh)
common=''
for a,b in zip(sl,sh):
    if a==b: common+=a
    else: break
print('common prefix=',common)
# measured 1/alpha(0) = 137.035999... rel unc ~1.6e-10; but derived endpoint ~67.9476 (a partial-tower reading)
print('measured 1/alpha(0) approx 137.035999177; derived endpoint approx', float((lo+hi)/2))
print('half-137.036=',137.035999177/2)
