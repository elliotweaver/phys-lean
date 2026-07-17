from fractions import Fraction as F
import mpmath as mp
mp.mp.dps = 60
def fn(fr,n=22): return mp.nstr(mp.mpf(fr.numerator)/fr.denominator,n)

# assembled endpoint = 190/3 + (16/9)*cutLog*(1/cutPi)
# banked 1/cutPi (reuse verbatim): [1250000000/3926990817, 5000000000/15707963267]
pinv_lo = F(1250000000,3926990817)
pinv_hi = F(5000000000,15707963267)
d = F(16,3)  # chargeTraceDepth
# endpoint coefficient uses d/3 = 16/9 for invAlphaZero
# candidate cutLog brackets
cands = {
 "split5 (parent)": (F(815406110,10**8), F(815406115,10**8)),
 "N=33 1e10 width1e-10": (F(81540611127,10**10), F(81540611128,10**10)),
 "N=36 1e11 width1e-11": (F(815406111272,10**11), F(815406111273,10**11)),
}
for name,(clo,chi) in cands.items():
    lo = F(190,3) + (d/3)*clo*pinv_lo
    hi = F(190,3) + (d/3)*chi*pinv_hi
    w = float(mp.mpf((hi-lo).numerator)/(hi-lo).denominator)
    # contributions
    c_log = float((d/3)*(chi-clo)*pinv_lo)
    c_pi  = float((d/3)*chi*(pinv_hi-pinv_lo))
    print(f"{name}: assembled width={w:.4e}  (cutLog contrib {c_log:.3e}, 1/cutPi contrib {c_pi:.3e})")
print()
print("parent assembled width = 2.86e-8")
print("current 1/cutPi contribution ~2.94e-10 (the floor a sharper cutLog exposes)")
