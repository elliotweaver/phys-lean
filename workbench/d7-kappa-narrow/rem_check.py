from fractions import Fraction as F
from math import factorial
from mpmath import mp, mpf
mp.dps = 60

yU = F(314159265359, 800000000000)

def cosRemBound(y, N):
    D = (2*N+1)*(2*N+2)
    invfac = 1/(1 - y**2/D)
    return (y**(2*N)/factorial(2*N))*invfac

def partialCos(y, N):
    return sum(F((-1)**i)*y**(2*i)/factorial(2*i) for i in range(N))

# split 7 remainder (upper sign path)
rem7 = cosRemBound(yU, 7)
print("cosRemBound(yU,7) =", mp.nstr(mpf(rem7.numerator)/rem7.denominator, 6))
pc7 = partialCos(yU, 7)
print("partialCos(yU,7) =", mp.nstr(mpf(pc7.numerator)/pc7.denominator, 22))
R = F(923879532511277, 10**15)
# choose clean rational bound for rem7: e.g. 3/1e17 = 3e-17
for cand in [F(3,10**17), F(24,10**18), F(1,10**17)*F(24,10)]:
    print("  rem bound", cand, "=", mp.nstr(mpf(cand.numerator)/cand.denominator,4), ">= rem7?", cand>=rem7,
          " pc7+bound<=R?", pc7+cand <= R)

# split 6 remainder (lower bound path, v>=9/10)
rem6 = cosRemBound(yU, 6)
print("\ncosRemBound(yU,6) =", mp.nstr(mpf(rem6.numerator)/rem6.denominator,6))
pc6 = partialCos(yU, 6)
print("partialCos(yU,6) =", mp.nstr(mpf(pc6.numerator)/pc6.denominator,20))
# certified lower = pc6 - (101/100)*(yU^12/12!)
rembd6 = F(101,100)*(yU**12/factorial(12))
low6 = pc6 - rembd6
print("certified lower (pc6 - 101/100*yU^12/12!) =", mp.nstr(mpf(low6.numerator)/low6.denominator,20), ">= 9/10?", low6 >= F(9,10))
