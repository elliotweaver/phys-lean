from fractions import Fraction as F
from math import factorial, pi

def partialCos(x, N):
    s = F(0)
    for i in range(N):
        s += F((-1)**i) * x**(2*i) / factorial(2*i)
    return s

def cosRemBound(x, N):
    base = x**(2*N)/F(factorial(2*N))
    denom = 1 - x*x/F((2*N+1)*(2*N+2))
    return base/denom

# For each split index N (lower positivity), find largest z_lo (in units of 1e-7) that certifies 0<ps-rem
print("pi/2 =", pi/2, "= 15707963.27/1e7")
for N in [5,6,7,8]:
    best=None
    for num in range(15706000,15707963,1):  # scan up to just below pi/2
        x=F(num,10**7)
        # need x^2 < (2N+1)(2N+2)
        lo = partialCos(x,N) - cosRemBound(x,N)
        if lo>0:
            best=num
        else:
            if best is not None and num>best+3:
                break
    print(f"split@{N} LOWER: largest certified z_lo = {best}/1e7 = {best/1e7 if best else None}  (margin to pi/2 = {(pi/2 - best/1e7) if best else None:.2e})")

print()
# For each split index N (upper sign), find smallest z_hi that certifies ps+rem<0
for N in [4,5,6,7]:
    best=None
    for num in range(15709000,15707963,-1):
        x=F(num,10**7)
        up = partialCos(x,N)+cosRemBound(x,N)
        if up<0:
            best=num
        else:
            if best is not None and num<best-3:
                break
    print(f"split@{N} UPPER: smallest certified z_hi = {best}/1e7 = {best/1e7 if best else None}  (margin above pi/2 = {(best/1e7 - pi/2) if best else None:.2e})")
