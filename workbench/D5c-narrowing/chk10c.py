from fractions import Fraction as F
import mpmath as mp
mp.mp.dps=80
x=F(15707963268,10**10)
xv=mp.mpf(x.numerator)/x.denominator
# partialCos_eight = sum_{i<8} (-1)^i x^{2i}/(2i)!  (exact via Fraction)
def fact(n):
    r=1
    for k in range(2,n+1): r*=k
    return r
pc8 = sum((F(-1)**i * x**(2*i))/fact(2*i) for i in range(8))
print("partialCos_eight(x) =", mp.nstr(mp.mpf(pc8.numerator)/pc8.denominator, 12))
# cosRemBound(x,8) = (x^16/16!)*(1/(1-x^2/(17*18)))
rem = (xv**16/mp.factorial(16))*(1/(1-xv**2/(17*18)))
print("cosRemBound(x,8) =", mp.nstr(rem,12))
print("pc8+rem =", mp.nstr(mp.mpf(pc8.numerator)/pc8.denominator + rem, 12))
# clean bounds: hpc  pc8 <= P (P slightly above pc8, negative)  ; hrem rem <= R
# want P + R < 0.
print()
print("pc8 as float:", mp.nstr(mp.mpf(pc8.numerator)/pc8.denominator,15))
# pick P = ceil to -702/1e13? pc8 ~ -7.0237e-11
for P in [F(-702,10**13), F(-7023,10**14), F(-70236,10**15)]:
    print("P=%s/%s=%s  >= pc8? %s" % (P.numerator,P.denominator,mp.nstr(mp.mpf(P.numerator)/P.denominator,12), P>=pc8))
print()
for R in [F(662,10**13), F(6620,10**14), F(6619,10**14)]:
    print("R=%s/%s=%s  >= rem? %s" % (R.numerator,R.denominator,mp.nstr(mp.mpf(R.numerator)/R.denominator,12), mp.mpf(R.numerator)/R.denominator>=rem))
# choose P=-702/1e13, R=662/1e13 -> sum=-40/1e13 <0
print()
print("P+R for (-702/1e13, 662/1e13) =", F(-702,10**13)+F(662,10**13), "=", mp.nstr(mp.mpf((F(-702,10**13)+F(662,10**13)).numerator)/(F(-702,10**13)+F(662,10**13)).denominator,6))
