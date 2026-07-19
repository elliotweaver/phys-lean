from fractions import Fraction as F
from math import factorial
def pE(y,N): return sum(y**i/F(factorial(i)) for i in range(N))
def rem(y,N): return (y**N/F(factorial(N)))/(1-y/(N+1))
def cutExp_approx(y,N): return pE(y,N)+rem(y,N)

m2L = F(336645872281271, 10**15); m2H = F(336645872281307, 10**15)
inv2_lo=1/m2H; inv2_hi=1/m2L
print("inv2_lo=%.15f inv2_hi=%.15f"%(float(inv2_lo),float(inv2_hi)))
# We need u_lo with exp(u_lo) <= inv2_lo, i.e. u_lo <= ln(inv2_lo)
import mpmath as mp; mp.mp.dps=40
print("ln(inv2_lo)=", mp.nstr(mp.log(mp.mpf(inv2_lo.numerator)/inv2_lo.denominator),20))
print("ln(inv2_hi)=", mp.nstr(mp.log(mp.mpf(inv2_hi.numerator)/inv2_hi.denominator),20))
# so cutLog(1/mass2) in [1.088723725223604, 1.088723725223721]  width 1.17e-13
# target bracket must SANDWICH: u_lo <= 1.088723725223604, u_hi>=1.088723725223721
# 10887237252236/1e13 = 1.0887237252236 <= 1.088723725223604 YES
# 10887237252237/1e13 = 1.0887237252237 >= 1.088723725223721 YES
u_lo=F(10887237252236,10**13); u_hi=F(10887237252237,10**13)
for N in range(14,30):
    v=cutExp_approx(u_lo,N)
    if v <= inv2_lo:
        print("lo cert N=%d: cutExp_approx=%.16f <= inv2_lo=%.16f"%(N,float(v),float(inv2_lo))); break
else:
    print("NO lo N found up to 30; cutExp_approx(u_lo,29)=%.16f vs inv2_lo=%.16f"%(float(cutExp_approx(u_lo,29)),float(inv2_lo)))
    print("  exp(u_lo) exact ~", mp.nstr(mp.e**(mp.mpf(u_lo.numerator)/u_lo.denominator),18))
