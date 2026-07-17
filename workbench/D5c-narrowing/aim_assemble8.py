import mpmath as mp
from fractions import Fraction as F
mp.mp.dps = 60
pi = mp.pi
E8 = mp.mpf(10) ** 8

# leastCosZero bracket after the push
lcz_lo = F(157079632, 10**8)   # new lower (double-double-angle ceiling = floor(pi/2*1e8))
lcz_hi = F(157079634, 10**8)   # upper (parent's cutCos_157079634_neg, reused)
print("leastCosZero in [%s, %s]  width=%.3e" % (lcz_lo, lcz_hi, float(lcz_hi-lcz_lo)))

# cutPi = 2*leastCosZero
cutPi_lo = 2*lcz_lo   # = 314159264/1e8
cutPi_hi = 2*lcz_hi   # = 314159268/1e8 = 78539817/25000000
print("cutPi_lo = %s = %s" % (cutPi_lo, 2*lcz_lo))
print("cutPi_hi = %s" % (cutPi_hi))
print("  cutPi_lo reduced:", cutPi_lo, "=", float(cutPi_lo))
print("  cutPi_hi reduced:", cutPi_hi, "=", float(cutPi_hi))

# 1/cutPi bracket: [1/cutPi_hi, 1/cutPi_lo]
inv_lo = 1/cutPi_hi
inv_hi = 1/cutPi_lo
print("1/cutPi in [%s, %s]" % (inv_lo, inv_hi))
print("   = [%.15f, %.15f]  width=%.3e" % (float(inv_lo), float(inv_hi), float(inv_hi-inv_lo)))
print("   parent 1/cutPi width ~2.8e-8; check narrowing")
# parent bracket
p_lo = F(25000000,78539817); p_hi = F(2500000,7853981)
print("   parent [%.15f, %.15f] width=%.3e" % (float(p_lo), float(p_hi), float(p_hi-p_lo)))
print("   nested? lo: %s<=%s (%s); hi: %s<=%s (%s)" % (p_lo, inv_lo, p_lo<=inv_lo, inv_hi, p_hi, inv_hi<=p_hi))
print()

# assembled 1/alpha(0): 190/3 + (16/9)*cutLog*(1/cutPi)  [d=16/3, coeff d/3 = 16/9]
# cutLog in [815406110/1e8, 815406115/1e8] (banked from parent, reused)
cl_lo = F(815406110,10**8); cl_hi = F(815406115,10**8)
d3 = F(16,9)  # d/3 with d=16/3
lo = F(190,3) + d3*cl_lo*inv_lo
hi = F(190,3) + d3*cl_hi*inv_hi
print("assembled 1/alpha(0) new:")
print("  lo = 190/3 + 16/9 * %s * %s = %s = %.12f" % (cl_lo, inv_lo, lo, float(lo)))
print("  hi = 190/3 + 16/9 * %s * %s = %s = %.12f" % (cl_hi, inv_hi, hi, float(hi)))
print("  width = %.4e" % float(hi-lo))
# parent width
plo = F(48029320130,706858353); phi = F(4802931616,70685829)
print("  parent [%.12f,%.12f] width=%.4e" % (float(plo),float(phi),float(phi-plo)))
print("  narrowing factor = %.2fx" % (float(phi-plo)/float(hi-lo)))
print("  nested? lo: %s<=new_lo? %s ; new_hi<=%s? %s" % (float(plo), plo<=lo, float(phi), hi<=phi))
