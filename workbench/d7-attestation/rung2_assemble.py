from mpmath import mp, mpf, log, sqrt
mp.dps = 90
D = lambda p: mpf(10)**p

# tighter inputs (verified brackets)
Lm01_lo = mpf(815406111272)/D(11); Lm01_hi = mpf(815406111273)/D(11)        # 1e-11
Lmb_lo  = mpf(-4089306640008)/D(12); Lmb_hi = mpf(-4089306640006)/D(12)      # 2e-12
Lb0_lo  = mpf(1733728794954)/D(12); Lb0_hi = mpf(1733728794955)/D(12)        # 1e-12
Lb2_lo  = mpf(-1088723725224)/D(12); Lb2_hi = mpf(-1088723725223)/D(12)      # 1e-12
k_lo = (mpf(1250000000)/mpf(3926990817))/3
k_hi = (mpf(50000000000)/mpf(157079632679))/3

# C = 2*L_m01 + (7/3)*Lmb + (11/3)*Lb0 - (5/3)*Lb2 ; all coeffs>0 except -Lb2 (Lb2<0 so -Lb2>0)
def C_of(Lm01,Lmb,Lb0,Lb2):
    return 2*Lm01 + mpf(7)/3*Lmb + mpf(11)/3*Lb0 - mpf(5)/3*Lb2
# C increases with Lm01, Lmb, Lb0, and decreases with Lb2 (coeff -5/3)
C_lo = C_of(Lm01_lo, Lmb_lo, Lb0_lo, Lb2_hi)   # min: smallest Lm01,Lmb,Lb0; largest Lb2
C_hi = C_of(Lm01_hi, Lmb_hi, Lb0_hi, Lb2_lo)
print("C in [", mp.nstr(C_lo,20), ",", mp.nstr(C_hi,20), "] width", mp.nstr(C_hi-C_lo,4))
# endpoint = 2425/18 + k*C ; C>0, so min = 2425/18 + k_lo*C_lo, max = 2425/18 + k_hi*C_hi
ep_lo = mpf(2425)/18 + k_lo*C_lo
ep_hi = mpf(2425)/18 + k_hi*C_hi
print("endpoint in [", mp.nstr(ep_lo,22), ",", mp.nstr(ep_hi,22), "]")
print("endpoint width =", mp.nstr(ep_hi-ep_lo,5))
print("true endpoint ~=", mp.nstr((ep_lo+ep_hi)/2,20))

# choose clean bracketing rationals at 1e10 grid (width ~1.3e-11 -> use 1e10 denom, few units)
from mpmath import floor, ceil
lo_num = int(floor(ep_lo*D(10)))
hi_num = int(ceil(ep_hi*D(10)))
print("bracket @1e10: [", lo_num,"/1e10,", hi_num,"/1e10] width", hi_num-lo_num,"e-10")
print("  =", mp.nstr(mpf(lo_num)/D(10),20), "..", mp.nstr(mpf(hi_num)/D(10),20))
# how many sig digits? endpoint ~136.30718814, width (hi-lo)/1e10
w = (hi_num-lo_num)/D(10)
import math
print("  sig digits ~", mp.nstr(mp.log10(mpf('136.307')/w),4))
print()
print("<137 check:", (mpf(hi_num)/D(10)) < 137)

# Also compute at 1e9 grid for robustness (a slightly looser but clean bracket)
lo9 = int(floor(ep_lo*D(9))); hi9 = int(ceil(ep_hi*D(9)))
print("bracket @1e9: [", lo9,"/1e9,", hi9,"/1e9] width", hi9-lo9,"e-9")
