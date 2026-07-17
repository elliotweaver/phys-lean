from fractions import Fraction as F
import math, mpmath as mp
mp.mp.dps=60
x=F(2,9)
def partialCos(x,N):
    s=F(0)
    for k in range(N): s+=F((-1)**k)*x**(2*k)/math.factorial(2*k)
    return s
pc6=partialCos(x,6)
print("partialCos(2/9) 6 =", pc6.numerator,"/",pc6.denominator)
# cosRemBound(2/9) 6 = x^12/12! * 1/(1 - x^2/(13*14))
rem6 = x**12/F(math.factorial(12)) * 1/(1 - x**2/F(13*14))
print("cosRemBound(2/9) 6 exact =", rem6.numerator,"/",rem6.denominator, "=", float(rem6))
# choose a clean rational upper bound for cosRemBound: rem6 < 4/1e17
print("rem6 < 1/1e16?", rem6 < F(1,10**16))
print("rem6 < 4/1e17?", rem6 < F(4,10**17))
print("rem6 < 31/1e18?", rem6 < F(31,10**18))
# For pB_lo lemma we need partialCos6 - rem_bound >= pB_lo = 975410085389447/1e15
pB_lo = F(975410085389447,10**15)
pB_hi = F(975410085389448,10**15)
rb = F(4,10**17)   # rem bound to use
print("partialCos6 - rb >= pB_lo:", pc6 - rb >= pB_lo)
print("partialCos6 + rb <= pB_hi:", pc6 + rb <= pB_hi)
