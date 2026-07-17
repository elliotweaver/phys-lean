from fractions import Fraction as F
import mpmath as mp
mp.mp.dps = 60

# ---- split@6 read of cutCos(2/9) ----
x = F(2,9)
# partialCos(2/9) N = sum_{k=0}^{N-1} (-1)^k x^(2k)/(2k)!
import math
def partialCos(x, N):
    s = F(0)
    for k in range(N):
        s += F((-1)**k) * x**(2*k) / math.factorial(2*k)
    return s

pc5 = partialCos(x,5)
pc6 = partialCos(x,6)
print("partialCos(2/9) 5 =", pc5, "  (banked =", F(13226284829,13559717115), ")")
print("  match5:", pc5 == F(13226284829,13559717115))
print("partialCos(2/9) 6 =", pc6)

# cosRemBound(x,N) = x^(2N)/(2N)! * (1 - x^2/((2N+1)(2N+2)))^{-1}
def cosRemBound(x,N):
    return x**(2*N)/F(math.factorial(2*N)) * 1/(1 - x**2/F((2*N+1)*(2*N+2)))
rem6 = cosRemBound(x,6)
print("cosRemBound(2/9) 6 =", float(rem6), " (~", mp.nstr(mp.mpf(rem6.numerator)/rem6.denominator,3),")")

# true value
p_true = mp.cos(mp.mpf(2)/9)
print("cutCos(2/9) true =", mp.nstr(p_true, 30))

# split@6 pB bracket: [pc6 - rem6, pc6 + rem6]
pB_lo_exact = pc6 - rem6
pB_hi_exact = pc6 + rem6
print("pB split@6 exact lo =", mp.nstr(mp.mpf(pB_lo_exact.numerator)/pB_lo_exact.denominator,30))
print("pB split@6 exact hi =", mp.nstr(mp.mpf(pB_hi_exact.numerator)/pB_hi_exact.denominator,30))
print("pB split@6 width =", float(pB_hi_exact - pB_lo_exact))
print()
print("For comparison split@5 width:", float(2*cosRemBound(x,5)))
