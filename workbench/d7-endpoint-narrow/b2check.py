from fractions import Fraction as F
wp_lo=F(689719085816627,5*10**14); wp_hi=F(689719085816629,5*10**14)
wr_lo=F(269931005964161,5*10**14); wr_hi=F(269931005964169,5*10**14)
b2_lo_exact = 1-(wp_hi-wr_lo)/2
b2_hi_exact = 1-(wp_lo-wr_hi)/2
b2L=F(58021192014753,10**14); b2H=F(58021192014754,10**14)
print('b2_lo_exact', float(b2_lo_exact), ' my b2L=', float(b2L), ' b2L<=exact?', b2L<=b2_lo_exact)
print('b2_hi_exact', float(b2_hi_exact), ' my b2H=', float(b2H), ' b2H>=exact?', b2H>=b2_hi_exact)
m2L=F(168322936140643,5*10**14); m2H=F(168322936140649,5*10**14)
print('b2L^2 >= mass2_lo?', b2L*b2L >= m2L, ' (', float(b2L*b2L),' vs ',float(m2L),')')
print('b2H^2 <= mass2_hi?', b2H*b2H <= m2H, ' (', float(b2H*b2H),' vs ',float(m2H),')')
# also cross-check the cutLog cert bounds for L_b2 use inv2 lo/hi from m2H/m2L
inv2_lo=1/m2H; inv2_hi=1/m2L
from math import factorial
def pE(y,N): return sum(y**i/F(factorial(i)) for i in range(N))
def rem(y,N): return (y**N/F(factorial(N)))/(1-y/(N+1))
u_lo=F(10887237252236,10**13); u_hi=F(10887237252237,10**13)
print('L_b2 lo cert N=15:', pE(u_lo,15)+rem(u_lo,15) <= inv2_lo)
print('L_b2 hi cert N=17:', inv2_hi <= pE(u_hi,17))
