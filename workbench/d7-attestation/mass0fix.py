from fractions import Fraction as F
# NB4 sharp: b0 in [237943816/1e8, 237943819/1e8], mass0=b0^2
lo=237943816; hi=237943819
lo2=lo*lo; hi2=hi*hi
print("237943816^2 =", lo2, " /1e16 =", F(lo2,10**16), "=", lo2/1e16)
print("237943819^2 =", hi2, " /1e16 =", hi2/1e16)
# I want clean rational c0lo <= lo2/1e16 and hi2/1e16 <= c0hi
# lo2/1e16 = 5.66172601262540... ; want c0lo=5661726012625402/1e15 = 56617260126254020/1e16
print("lo2 =", lo2, " compare 56617260126254020:", lo2, ">=", 56617260126254020, "?", lo2>=56617260126254020)
print("hi2 =", hi2, " compare 56617260126254220:", hi2, "<=", 56617260126254220, "?", hi2<=56617260126254220)
# so valid clean brackets on /1e16 grid:
import math
c0lo16 = lo2  # exact - but keep some clean digits: floor to nice
# choose c0lo = floor(lo2 / 100)*100 ... just use exact-safe rounded down
c0lo = (lo2//1)   # exact
print("exact mass0 lo (as /1e16):", F(lo2,10**16), "->", float(F(lo2,10**16)))
# For the exp cert we need mass0_lo as a clean-ish rational >= e^1.7337287. Let's keep /1e15 with 16-digit
# 5661726012625402/1e15 = 5.661726012625402 ; is lo2/1e16 >= that?
print("lo2/1e16 >= 5661726012625402/1e15?", F(lo2,10**16) >= F(5661726012625402,10**15))
print("hi2/1e16 <= 5661726012625423/1e15?", F(hi2,10**16) <= F(5661726012625423,10**15))
