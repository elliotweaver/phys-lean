from fractions import Fraction as F
from mpmath import mp, mpf, factorial
import mpmath
mp.dps = 80
# Extended gt_invSqrt2: y < 7853981/1e7. Need hy2 bound: y^2 < B.
Ymax=F(7853981,10**7)
print("Ymax^2 =", Ymax*Ymax, "=", float(Ymax*Ymax))
# choose B = smallest 1e7-scale rational > Ymax^2
import math
B=math.ceil(float(Ymax*Ymax)*1e7)/1e7
print("hy2 bound B =", B, " as F:", F(round(B*1e7),10**7))
# check B > Ymax^2
print("  B > Ymax^2?", F(round(B*1e7),10**7) > Ymax*Ymax)

# cutCos_15707962... no, cutCos_pos for x<15707962/1e7. Upper neg at 157079635/1e8.
# split@6 partialCos+rem at 157079635/1e8:
def partialCos6(x): return 1 - x**2/2 + x**4/24 - x**6/720 + x**8/40320 - x**10/mpf(3628800)
def cosRemBound6(x): return x**12/mpf(479001600)*(1/(1-x**2/mpf(182)))
xu=mpf(157079635)/mpf(10**8)
print("\nUPPER x=157079635/1e8: partialCos6+rem =", mpmath.nstr(partialCos6(xu)+cosRemBound6(xu),6))
# for the neg lemma: need partialCos6(x) <= -C and rem <= C' with -C+C'<0. Find rem bound and pc bound.
remu=cosRemBound6(xu)
pcu=partialCos6(xu)
print("  cosRemBound6 =", mpmath.nstr(remu,6), " partialCos6 =", mpmath.nstr(pcu,6))
# rem <= ? use loose upper e.g. 479/1e9
print("  rem < 479/1e9?", remu < F(479,10**9), " (479/1e9=%.3e)"%(479/1e9))
# pc <= ? need pcu <= -D with D> (rem bound). pcu ~ -1.04e-8-479e-9? let me get pcu numeric
print("  partialCos6 <= -530/1e9?", pcu <= F(-530,10**9))

# LOWER: cert_lb(cutCos Y) at Y=Ymax must exceed L=7071068/1e7
L=F(7071068,10**7)
certY=partialCos6(mpf(float(Ymax)))-cosRemBound6(mpf(float(Ymax)))
print("\nLOWER cert at Ymax: partialCos6-rem =", mpmath.nstr(certY,10), " L=",float(L)," margin=",mpmath.nstr(certY-float(L),4))
print("  2L^2-1 =", float(2*L*L-1))
# final double-angle: cutCos(x)=2 cutCos(x/2)^2 -1 > 2L^2-1 >0
