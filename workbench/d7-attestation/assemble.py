from mpmath import mp, mpf, pi
from fractions import Fraction as F
mp.dps = 60

# Sharpened input brackets (rationals) to be certified in Lean:
L_lo  = F(815406111272, 10**11); L_hi  = F(815406111273, 10**11)      # cutLog(m01), NB11 (banked)
Lmb_lo= F(-40893067, 10**7);     Lmb_hi= F(-40893066, 10**7)          # cutLog(mbRatio) = -cutLog(1/mb)
Lb0_lo= F(17337287, 10**7);      Lb0_hi= F(17337288, 10**7)           # cutLog(mass0)
Lb2_lo= F(-10887238, 10**7);     Lb2_hi= F(-10887236, 10**7)          # cutLog(mass2)
k_lo  = F(1250000000, 3926990817)/3
k_hi  = F(50000000000, 157079632679)/3

# Combo C = 2L + (7/3)Lmb + (11/3)Lb0 - (5/3)Lb2  (all coefficients act on signed logs)
# C_min: L_lo, Lmb_lo, Lb0_lo, Lb2 that MINIMIZES -(5/3)Lb2  -> -(5/3)*Lb2 minimized when Lb2 largest (Lb2_hi)
C_min = 2*L_lo + F(7,3)*Lmb_lo + F(11,3)*Lb0_lo - F(5,3)*Lb2_hi
# C_max: L_hi, Lmb_hi, Lb0_hi, Lb2 smallest (Lb2_lo) maximizes -(5/3)Lb2
C_max = 2*L_hi + F(7,3)*Lmb_hi + F(11,3)*Lb0_hi - F(5,3)*Lb2_lo
print("C_min =", float(C_min), " C_max =", float(C_max), " (both >0:", C_min>0, C_max>0, ")")

base = F(2425,18)
# endpoint = base + k*C, k>0, C>0 => min at k_lo*C_min, max at k_hi*C_max
ep_lo = base + k_lo*C_min
ep_hi = base + k_hi*C_max
print("endpoint exact-rational lo =", mp.mpf(ep_lo.numerator)/ep_lo.denominator)
print("endpoint exact-rational hi =", mp.mpf(ep_hi.numerator)/ep_hi.denominator)
print("width =", float(ep_hi-ep_lo))

# choose clean decimal outer bracket
import math
lo_f = float(mp.mpf(ep_lo.numerator)/ep_lo.denominator)
hi_f = float(mp.mpf(ep_hi.numerator)/ep_hi.denominator)
print("\nfloat lo", repr(lo_f), "hi", repr(hi_f))
# pick rational lo' <= ep_lo and hi' >= ep_hi with clean denominators
# lo ~136.3071..., hi ~136.3072...
for scale in [10**7, 10**8, 10**9]:
    lo_r = F(int(math.floor(lo_f*scale)), scale)
    hi_r = F(int(math.ceil(hi_f*scale)), scale)
    ok = lo_r <= ep_lo and ep_hi <= hi_r
    print(f"scale {scale}: [{float(lo_r)}, {float(hi_r)}] valid={ok} width={float(hi_r-lo_r)}")
print("\n< 137 ?", ep_hi < 137)
