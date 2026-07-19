from fractions import Fraction as F
from math import factorial
def pE(y,N): return sum(y**i/F(factorial(i)) for i in range(N))
def rem(y,N): return (y**N/F(factorial(N)))/(1-y/(N+1))

wp_lo=F(689719085816627,5*10**14); wp_hi=F(689719085816629,5*10**14)
wr_lo=F(269931005964161,5*10**14); wr_hi=F(269931005964169,5*10**14)
b2_lo_exact = 1-(wp_hi-wr_lo)/2   # 0.580211920147532
b2_hi_exact = 1-(wp_lo-wr_hi)/2   # 0.580211920147542
# choose clean /1e14 b2 bracket safely OUTSIDE:
b2L = F(58021192014752, 10**14)   # 0.58021192014752 <= exact_lo
b2H = F(58021192014755, 10**14)   # 0.58021192014755 >= exact_hi
print("b2L<=exact_lo:", b2L<=b2_lo_exact, "  b2H>=exact_hi:", b2H>=b2_hi_exact)
# mass2 clean /1e14 (not 1e15) for cleaner numbers
m2L = F(33664587228127, 10**14)  # 0.33664587228127
m2H = F(33664587228130, 10**14)  # 0.33664587228130
print("b2L^2=%.16f m2L=%.16f  b2L^2>=m2L:%s"%(float(b2L*b2L), float(m2L), b2L*b2L>=m2L))
print("b2H^2=%.16f m2H=%.16f  b2H^2<=m2H:%s"%(float(b2H*b2H), float(m2H), b2H*b2H<=m2H))
inv2_lo=1/m2H; inv2_hi=1/m2L
print("1/mass2 [%.13f, %.13f]"%(float(inv2_lo),float(inv2_hi)))
u_lo=F(10887237252236,10**13); u_hi=F(10887237252237,10**13)
lo_ok=hi_ok=None
for N in range(14,24):
    if pE(u_lo,N)+rem(u_lo,N) <= inv2_lo: lo_ok=N; break
for N in range(14,24):
    if inv2_hi <= pE(u_hi,N): hi_ok=N; break
print("L_b2 lo cert N=",lo_ok," hi cert N=",hi_ok)
print("=> cutLog mass2 in [-10887237252237/1e13, -10887237252236/1e13]")
