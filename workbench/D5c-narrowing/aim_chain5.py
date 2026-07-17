from fractions import Fraction as F
from mpmath import mp, mpf, factorial, log, sqrt as msqrt
import mpmath, math
mp.dps = 120

# ===== split@5 pB bracket (rational) =====
# partialCos5(2/9) = 13226284829/13559717115 ; rem5 <= R5 (rational upper).
pc5 = F(13226284829, 13559717115)
x = mpf(2)/9
def cosRemBound(x,N): return x**(2*N)/factorial(2*N) * (1/(1 - x**2/((2*N+1)*(2*N+2))))
rem5 = cosRemBound(x,5)
print("partialCos5(2/9) =", float(pc5))
print("rem5 ~", mpmath.nstr(rem5,6))
# pick R5 = 1/1e13 = 1e-13 (rem5 ~ 8.1e-14 < 1e-13)
R5 = F(1,10**13)
print("rem5 < 1e-13 ?", rem5 < 1e-13)
# pB in [pc5 - R5, pc5 + R5]. Round to clean 1e-10 grid endpoints just outside:
pB_lo_exact = pc5 - R5
pB_hi_exact = pc5 + R5
# choose rational endpoints on 1e10 grid: lower = floor, upper = ceil
plo = F(math.floor(float(pB_lo_exact)*10**10), 10**10)
phi = F(math.ceil (float(pB_hi_exact)*10**10), 10**10)
print("pB bracket [%s, %s] width %.2e"%(float(plo),float(phi), float(phi-plo)))
print("  plo <= pB_lo_exact?", plo <= pB_lo_exact, "  phi >= pB_hi_exact?", phi >= pB_hi_exact)

# ===== wB = sqrt2 bracket to 12 digits =====
# choose wlo, whi on 1e12 grid with wlo^2<=2<=whi^2
w_true = msqrt(mpf(2))
wlo = F(math.floor(float(w_true)*10**12),10**12)
whi = F(math.ceil (float(w_true)*10**12),10**12)
print("\nwB bracket [%s, %s] width %.2e"%(float(wlo),float(whi),float(whi-wlo)))
print("  wlo^2<=2?", wlo*wlo<=2, "  whi^2>=2?", whi*whi>=2)

# ===== rB: r^2 = 3-3p^2. r in [sqrt(3-3phi^2), sqrt(3-3plo^2)] =====
r_lo_exact = msqrt(3 - 3*mpf(float(phi))**2)   # lower endpoint (from p upper)
r_hi_exact = msqrt(3 - 3*mpf(float(plo))**2)   # upper endpoint (from p lower)
print("\nr exact range [%s, %s] width %.2e"%(mpmath.nstr(r_lo_exact,15),mpmath.nstr(r_hi_exact,15),float(r_hi_exact-r_lo_exact)))
rlo = F(math.floor(float(r_lo_exact)*10**11),10**11)
rhi = F(math.ceil (float(r_hi_exact)*10**11),10**11)
print("rB bracket [%s, %s] width %.2e"%(float(rlo),float(rhi),float(rhi-rlo)))
# certification: rlo^2 <= 3-3phi^2  (so rlo <= r), rhi^2 >= 3-3plo^2 (so rhi >= r)
print("  rlo^2 <= 3-3phi^2 ?", rlo*rlo <= 3-3*phi*phi)
print("  rhi^2 >= 3-3plo^2 ?", rhi*rhi >= 3-3*plo*plo)

# ===== products, amplitudes =====
wp_lo = wlo*plo; wp_hi = whi*phi
wr_lo = wlo*rlo; wr_hi = whi*rhi
b0_lo = 1 + wp_lo; b0_hi = 1 + wp_hi
b1_lo = 1 - (wp_hi + wr_hi)/2
b1_hi = 1 - (wp_lo + wr_lo)/2
print("\nwp [%.10f,%.10f] w %.2e"%(float(wp_lo),float(wp_hi),float(wp_hi-wp_lo)))
print("wr [%.10f,%.10f] w %.2e"%(float(wr_lo),float(wr_hi),float(wr_hi-wr_lo)))
print("b0 [%.11f,%.11f] w %.2e"%(float(b0_lo),float(b0_hi),float(b0_hi-b0_lo)))
print("b1 [%.11f,%.11f] w %.2e"%(float(b1_lo),float(b1_hi),float(b1_hi-b1_lo)))

# ===== masses, m01 =====
mass0_lo = b0_lo*b0_lo; mass0_hi = b0_hi*b0_hi
mass1_lo = b1_lo*b1_lo; mass1_hi = b1_hi*b1_hi
m01_lo = mass0_lo/mass1_hi
m01_hi = mass0_hi/mass1_lo
print("\nm01 achievable [%.9f, %.9f]  width %.3e"%(float(m01_lo),float(m01_hi),float(m01_hi-m01_lo)))
print("   (current banked m01 width 5.4e-3)")

# ===== round m01 to a certifiable rational bracket & get cutLog width =====
for dp in [5,6,7]:
    lo = F(math.floor(float(m01_lo)*10**dp),10**dp)
    hi = F(math.ceil (float(m01_hi)*10**dp),10**dp)
    print("m01 %d-dp bracket [%s, %s] width %.3e  (lo<=exact %s, hi>=exact %s)"%(dp,float(lo),float(hi),float(hi-lo), lo<=m01_lo, hi>=m01_hi))
    cl_lo = log(mpf(float(lo))); cl_hi = log(mpf(float(hi)))
    print("     -> cutLog true range [%.10f,%.10f] width %.3e"%(float(cl_lo),float(cl_hi),float(cl_hi-cl_lo)))
