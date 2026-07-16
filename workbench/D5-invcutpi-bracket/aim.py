import math
from fractions import Fraction as F

print('pi/2 =', math.pi/2, ' 1/pi=', 1/math.pi)
print('sqrt2 =', math.sqrt(2))
# LOWER bound leastCosZero >= z_lo :  need cutCos > 0 on [0,z_lo).
# theory-native positivity tool: cutCos x >= 1 - x^2/2  (pairing tail from n>=2 is >=0 for |x|<=sqrt(? )).
# Actually the standard bound: for the alternating series with decreasing terms, partial sums bracket.
# 1 - x^2/2 > 0  <=>  x < sqrt2 = 1.4142. Take z_lo = 7/5 = 1.4.
print('1-(7/5)^2/2 =', 1-(7/5)**2/2, '(>0 so cos>0 on [0,7/5))')
# UPPER bound leastCosZero <= z_hi : need cutCos z_hi < 0.
# candidate z_hi = 8/5 = 1.6
x=F(8,5)
# head to index m (cos series sum_{i<m} (-1)^i x^{2i}/(2i)!)
def head(x,m):
    s=F(0)
    for i in range(m):
        s+= F((-1)**i)*x**(2*i)/math.factorial(2*i)
    return s
for m in [2,3,4]:
    print('head(8/5,',m,')=', float(head(x,m)), head(x,m))
# tail from n=m: first term |x^{2m}/(2m)!|, ratio x^2/((2m+1)(2m+2))
m=3
first = x**(2*m)/math.factorial(2*m)
ratio = x**2/((2*m+1)*(2*m+2))
print('first term(m=3)=', float(first), ' ratio=', float(ratio))
geomaj = first/(1-ratio)
print('geomaj tail(m=3) <=', float(geomaj))
# cos(8/5) <= head3 + geomaj  (upper) ; head3 already negative?
print('head3+geomaj =', float(head(x,3)+geomaj))
# Better: cutCos(8/5) <= head(2) + |tail from 2|? Let's do split at index 2:
# cos = 1 - x^2/2 + tail_{n>=2}; tail_{n>=2} <= first(n=2)/(1-ratio2)
m=2
first2=x**(2*m)/math.factorial(2*m); ratio2=x**2/((2*m+1)*(2*m+2))
geomaj2=first2/(1-ratio2)
print('split@2: 1-x^2/2 =', float(1-x**2/2), ' +geomaj2 =', float(geomaj2), ' upper=', float(1-x**2/2+geomaj2))
# We need cutCos(8/5) < 0. Use split at index where head is negative and tail majorant keeps it negative.
# head at index 2 = 1 - 1.28 = -0.28; tail from n>=2 is bounded by geomaj2. But tail could be positive (adds x^4/24>0).
# Proper: cos = head(3) + tail_{n>=3}; head(3)= 1-x^2/2+x^4/24; tail_{n>=3} in [-geomaj,+geomaj]. Need head(3)+geomaj<0.
print('head3 =', float(head(x,3)), ' +geomaj(m=3)=', float(head(x,3)+geomaj), ' (<0?)')
# So z_hi=8/5 works with split@3.
print()
print('=> leastCosZero in [7/5, 8/5]; cutPi=2*leastCosZero in [14/5, 16/5]')
print('=> 1/cutPi in [5/16, 5/14] =', [float(F(5,16)), float(F(5,14))], ' actual 1/pi=', 1/math.pi)
