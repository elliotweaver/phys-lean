from mpmath import mp, mpf
from fractions import Fraction as F
mp.dps = 60

L_lo  = F(815406111272, 10**11); L_hi  = F(815406111273, 10**11)
Lmb_lo= F(-40893067, 10**7);     Lmb_hi= F(-40893066, 10**7)
Lb0_lo= F(17337287, 10**7);      Lb0_hi= F(17337288, 10**7)
Lb2_lo= F(-10887238, 10**7);     Lb2_hi= F(-10887236, 10**7)
k_lo  = F(1250000000, 3926990817)/3
k_hi  = F(50000000000, 157079632679)/3

C_min = 2*L_lo + F(7,3)*Lmb_lo + F(11,3)*Lb0_lo - F(5,3)*Lb2_hi
C_max = 2*L_hi + F(7,3)*Lmb_hi + F(11,3)*Lb0_hi - F(5,3)*Lb2_lo
print("C_min exact =", C_min, "=", float(C_min))
print("C_max exact =", C_max, "=", float(C_max))

# Clean C bounds
Cb_lo = F(14937951, 10**6)   # 14.937951
Cb_hi = F(14937953, 10**6)   # 14.937953
print("Cb_lo<=C_min:", Cb_lo<=C_min, "  C_max<=Cb_hi:", C_max<=Cb_hi)

base=F(2425,18)
ep_lo = base + k_lo*Cb_lo
ep_hi = base + k_hi*Cb_hi
print("ep_lo =", float(ep_lo), " ep_hi =", float(ep_hi), " width", float(ep_hi-ep_lo))

# outer rational bracket, clean scale 1e8
import math
lo_f=float(ep_lo); hi_f=float(ep_hi)
for scale in [10**7,10**8]:
    lo_r=F(math.floor(float(mp.mpf(ep_lo.numerator)/ep_lo.denominator)*scale),scale)
    hi_r=F(math.ceil(float(mp.mpf(ep_hi.numerator)/ep_hi.denominator)*scale),scale)
    print(f"scale {scale}: [{float(lo_r)},{float(hi_r)}] lo_r<=ep_lo:{lo_r<=ep_lo} ep_hi<=hi_r:{ep_hi<=hi_r} width {float(hi_r-lo_r)}")

# The k*C arithmetic bounds needed by norm_num in the abstract core:
# lower: k_lo * Cb_lo >= (ep_lo - base)
# upper: k_hi * Cb_hi <= (ep_hi - base)
print("\nk_lo*Cb_lo =", float(k_lo*Cb_lo))
print("k_hi*Cb_hi =", float(k_hi*Cb_hi))
# choose output bracket ol, oh:
ol=F(1363071880,10**7)   # 136.3071880
oh=F(1363071882,10**7)   # 136.3071882
print("ol<=ep_lo:", ol<=ep_lo, " ep_hi<=oh:", ep_hi<=oh)
print("(ol-base) <= k_lo*Cb_lo:", (ol-base) <= k_lo*Cb_lo)
print("k_hi*Cb_hi <= (oh-base):", k_hi*Cb_hi <= (oh-base))
print("oh < 137:", oh<137)
print("\nFINAL: [",float(ol),",",float(oh),"] width",float(oh-ol),"= ~9 sig digits 136.307188")
