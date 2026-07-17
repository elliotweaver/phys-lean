from fractions import Fraction as F
from mpmath import mp, mpf, log, factorial
mp.dps = 60

# ---- (a) The ACHIEVABLE m01 from the banked b0/b1 sharp brackets ----
# b0 in [237943816/1e8, 237943819/1e8], b1 in [4034989/1e8, 4034992/1e8]
# mass0 = b0^2, mass1 = b1^2, m01 = mass0/mass1
b0lo = F(237943816,10**8); b0hi = F(237943819,10**8)
b1lo = F(4034989,10**8);   b1hi = F(4034992,10**8)
mass0_lo = b0lo*b0lo; mass0_hi = b0hi*b0hi
mass1_lo = b1lo*b1lo; mass1_hi = b1hi*b1hi
m01_lo_exact = mass0_lo / mass1_hi   # tightest provable lower
m01_hi_exact = mass0_hi / mass1_lo   # tightest provable upper
print("=== ACHIEVABLE m01 (exact from b0/b1 sharp) ===")
print("m01_lo_exact =", float(m01_lo_exact))
print("m01_hi_exact =", float(m01_hi_exact))
print("width =", float(m01_hi_exact - m01_lo_exact))
# parent used [3477470/1000, 3477477/1000] = [3477.470, 3477.477]
print("parent m01 bracket: [3477.470, 3477.477] width 0.007")

# tightest rational endpoints INSIDE the achievable (must be >= m01_lo_exact for lower, <= m01_hi_exact for upper)
# choose 4-decimal grid: lower = ceil(m01_lo_exact*1e4)/1e4, upper = floor(m01_hi_exact*1e4)/1e4
import math
lo4 = math.ceil(m01_lo_exact*10000)/10000
hi4 = math.floor(m01_hi_exact*10000)/10000
print("4-dp rational m01: lower =", lo4, " upper =", hi4)
# as fractions
m01_lo_new = F(round(lo4*10000),10000)
m01_hi_new = F(round(hi4*10000),10000)
print("  m01_lo_new =", m01_lo_new, "=", float(m01_lo_new))
print("  m01_hi_new =", m01_hi_new, "=", float(m01_hi_new))
# sanity: these must bracket the true m01
m01_true = mpf(float(m01_lo_exact+m01_hi_exact))/2
print("  m01 midpoint approx =", float(m01_true))
print("  lower <= m01_lo_exact?", m01_lo_new >= m01_lo_exact, " (need lower endpoint >= exact lower to be provable via nlinarith)")
print("  upper >= m01_hi_exact?", m01_hi_new <= m01_hi_exact)
# NOTE: for the m01 LOWER theorem we need  m01_lo_new <= mass0/mass1  i.e.  m01_lo_new <= m01_lo_exact
# for the m01 UPPER theorem we need m01_hi_new >= m01_hi_exact
print("  PROVABLE lower (m01_lo_new <= m01_lo_exact)?", m01_lo_new <= m01_lo_exact)
print("  PROVABLE upper (m01_hi_new >= m01_hi_exact)?", m01_hi_new >= m01_hi_exact)
