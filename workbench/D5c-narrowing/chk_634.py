from fractions import Fraction as F
import math
# check y^2 bound for 78539812/1e8
y=F(78539812,10**8); sq=y*y
print("y=78539812/1e8, y^2 =", float(sq), " 61685021/1e8 >= sq?", F(61685021,10**8)>=sq, " margin", float(F(61685021,10**8)-sq))
# check upper 634 sign exact
from mpmath import mp, mpf
mp.dps=60
x=F(157079634,10**8)
pc = 1 - x**2/2 + x**4/24 - x**6/720 + x**8/40320 - x**10/F(3628800)
print("\npartialCos6(634) exact =", float(pc))
print("  <= -4778/1e10 =", float(F(-4778,10**10)), "?", pc <= F(-4778,10**10))
# rem bound: x^12/12! * 1/(1-x^2/182)
rem = x**12/F(math.factorial(12)) * (1/(1-x**2/182))
print("cosRemBound6(634) =", float(rem))
print("  <= 47757/1e11 =", float(F(47757,10**11)),"?", rem <= F(47757,10**11))
# final: -4778/1e10 + 47757/1e11 = ?
print("  -4778/1e10 + 47757/1e11 =", float(F(-4778,10**10)+F(47757,10**11)), " <0?", (F(-4778,10**10)+F(47757,10**11))<0)
