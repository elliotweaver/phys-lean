from fractions import Fraction as F
from math import factorial

def partialExp(y, N): return sum(y**i / F(factorial(i)) for i in range(N))
def expRemBound(y, N): return (y**N / F(factorial(N))) / (1 - y/(N+1))

# CORRECT clean mass0 bracket (Rung1's): [5661726012625402/1e15, 5661726012625422/1e15]
mass0_lo = F(5661726012625402, 10**15)
mass0_hi = F(5661726012625422, 10**15)
vb0_lo = F(17337287949546, 10**13); vb0_hi = F(17337287949547, 10**13)
print("L_b0 target [%s, %s]" % (vb0_lo, vb0_hi))
for N in range(18,26):
    if partialExp(vb0_lo,N)+expRemBound(vb0_lo,N) <= mass0_lo:
        print("  lo cert N=%d ok"%N); break
for N in range(18,26):
    if mass0_hi <= partialExp(vb0_hi,N):
        print("  hi cert N=%d ok"%N); break
# ref ln mass0 = 1.7337287949546308 -> in [..546, ..547]? 1.7337287949546308 in [1.7337287949546, 1.7337287949547] YES
print()

# clean mass2 bracket. b2 from NB11 s6 wp/wr. Need CORRECT floors.
wp_lo=F(689719085816627,5*10**14); wp_hi=F(689719085816629,5*10**14)
wr_lo=F(269931005964161,5*10**14); wr_hi=F(269931005964169,5*10**14)
b2_lo = 1-(wp_hi-wr_lo)/2   # min b2
b2_hi = 1-(wp_lo-wr_hi)/2
mass2_lo_sq = b2_lo*b2_lo
mass2_hi_sq = b2_hi*b2_hi
import math
# clean OUTWARD: lo=floor, hi=ceil at 15 dp
mass2_lo = F(math.floor(float(mass2_lo_sq)*10**15), 10**15)
mass2_hi = F(math.ceil(float(mass2_hi_sq)*10**15), 10**15)
# ensure mass2_lo <= mass2_lo_sq and mass2_hi_sq <= mass2_hi
assert mass2_lo <= mass2_lo_sq, (float(mass2_lo), float(mass2_lo_sq))
assert mass2_hi_sq <= mass2_hi
print("mass2 clean [%s, %s]" % (mass2_lo, mass2_hi))
print("  floats [%.16f, %.16f]" % (float(mass2_lo), float(mass2_hi)))
inv2_lo = 1/mass2_hi; inv2_hi = 1/mass2_lo
ub2_lo=F(10887237252236,10**13); ub2_hi=F(10887237252237,10**13)
# ref cutLog(1/mass2)=1.08872372522362 in [1.0887237252236, 1.0887237252237] YES
for N in range(15,24):
    if partialExp(ub2_lo,N)+expRemBound(ub2_lo,N) <= inv2_lo:
        print("  L_b2 lo(u_lo) cert N=%d ok"%N); break
for N in range(15,24):
    if inv2_hi <= partialExp(ub2_hi,N):
        print("  L_b2 hi(u_hi) cert N=%d ok"%N); break
print("  => cutLog mass2 in [%s, %s]" % (-ub2_hi, -ub2_lo))
print()

# mbR from q. q^2=1/2. Need q bracket with q_lo^2<=1/2<=q_hi^2 AND clean.
q_lo=F(707106781186547,10**15); q_hi=F(707106781186548,10**15)
assert q_lo*q_lo <= F(1,2) <= q_hi*q_hi
mbR_lo=(1-q_hi)**2/(3*(1+q_hi)); mbR_hi=(1-q_lo)**2/(3*(1+q_lo))
# for the cutLog we feed CLEAN rational 1/mbR endpoints. inv_mb in [1/mbR_hi, 1/mbR_lo]
inv_mb_lo=1/mbR_hi; inv_mb_hi=1/mbR_lo
umb_lo=F(40893066400067,10**13); umb_hi=F(40893066400068,10**13)
# ref cutLog(1/mbR)=4.08930664000671 in [4.0893066400067, 4.0893066400068] YES
for N in range(24,38):
    if partialExp(umb_lo,N)+expRemBound(umb_lo,N) <= inv_mb_lo:
        print("  L_mb lo(u_lo) cert N=%d ok"%N); break
for N in range(24,38):
    if inv_mb_hi <= partialExp(umb_hi,N):
        print("  L_mb hi(u_hi) cert N=%d ok"%N); break
print("  1/mbR in [%.12f, %.12f]" % (float(inv_mb_lo), float(inv_mb_hi)))
print("  => cutLog mbR in [%s, %s]" % (-umb_hi, -umb_lo))
print("  mbR_lo=%s mbR_hi=%s (need clean rationals for div)"%(mbR_lo, mbR_hi))
