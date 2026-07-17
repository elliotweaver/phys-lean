from fractions import Fraction as F
from mpmath import mp, mpf, log, factorial, exp as mexp
mp.dps = 80
import math

# ---- ACHIEVABLE m01 (exact from banked b0/b1 sharp) ----
b0lo = F(237943816,10**8); b0hi = F(237943819,10**8)
b1lo = F(4034989,10**8);   b1hi = F(4034992,10**8)
m01_lo_exact = (b0lo*b0lo) / (b1hi*b1hi)   # tightest provable lower  (mass0_lo/mass1_hi)
m01_hi_exact = (b0hi*b0hi) / (b1lo*b1lo)   # tightest provable upper  (mass0_hi/mass1_lo)
print("m01 achievable: [%.9f, %.9f] width %.3e" % (float(m01_lo_exact), float(m01_hi_exact), float(m01_hi_exact-m01_lo_exact)))

# Provable rational endpoints: lower <= m01_lo_exact, upper >= m01_hi_exact.
# 5-dp grid:
lo5 = F(math.floor(float(m01_lo_exact)*10**5), 10**5)   # largest 5dp <= exact lower? floor gives <= 
hi5 = F(math.ceil (float(m01_hi_exact)*10**5), 10**5)
print("5-dp m01: lower =", float(lo5), "(<=exact_lo?", lo5<=m01_lo_exact, ")  upper =", float(hi5), "(>=exact_hi?", hi5>=m01_hi_exact, ")")
print("   as F:", lo5, hi5, " width", float(hi5-lo5))

m01_lo, m01_hi = lo5, hi5   # the m01 bracket we will certify

# ---- cutLog over this m01 bracket: true values ----
cl_true_lo = log(mpf(float(m01_lo)))   # cutLog is increasing; lo of cutLog at m01_lo
cl_true_hi = log(mpf(float(m01_hi)))
print("\ncutLog(m01) TRUE range: [%.10f, %.10f] intrinsic width %.3e" % (float(cl_true_lo), float(cl_true_hi), float(cl_true_hi-cl_true_lo)))

# The reading mechanism:
#  LOWER cutLog theorem: choose rational cl_lo with  partialExp(cl_lo, N) + expRemBound(cl_lo,N) <= m01_lo
#     => exp(cl_lo) certified <= m01_lo  => cl_lo <= ln(m01_lo) = cutLog(m01_lo) <= cutLog(m01)
#  UPPER cutLog theorem: choose rational cl_hi with  m01_hi <= partialExp(cl_hi, N)
#     => m01_hi <= exp(cl_hi) certified => cutLog(m01) <= cutLog(m01_hi) <= cl_hi
# partialExp(x,N) = sum_{k<N} x^k/k!  ; expRemBound(x,N) = x^N/N! * 1/(1 - x/(N+1))  (geometric tail)

def partialExp(x, N):
    s = mpf(0)
    term = mpf(1)
    for k in range(N):
        s += term
        term *= x/(k+1)
    return s
def expRemBound(x, N):
    # x^N/N! * 1/(1-x/(N+1))
    return (x**N/factorial(N)) * (1/(1 - x/(N+1)))

# We want the LARGEST rational cl_lo (5 or 7 dp) s.t. partialExp+rem <= m01_lo, at index N.
# and the SMALLEST rational cl_hi s.t. m01_hi <= partialExp(cl_hi,N).
target_lo = mpf(float(m01_lo))
target_hi = mpf(float(m01_hi))

for N in [23,24,26,27,28,29,30]:
    # search cl_lo on 8-dp grid near 8.15406
    # lower: largest c with partialExp(c,N)+rem(c,N) <= target_lo
    best_lo = None
    for i in range(81540550, 81540720):
        c = mpf(i)/mpf('1e7')
        if partialExp(c,N)+expRemBound(c,N) <= target_lo:
            best_lo = i
        else:
            break
    # upper: smallest c with target_hi <= partialExp(c,N)
    best_hi = None
    for i in range(81540720, 81540550, -1):
        c = mpf(i)/mpf('1e7')
        if target_hi <= partialExp(c,N):
            best_hi = i
        else:
            break
    lo_s = ("%d/1e7=%.7f"%(best_lo, best_lo/1e7)) if best_lo else "none"
    hi_s = ("%d/1e7=%.7f"%(best_hi, best_hi/1e7)) if best_hi else "none"
    w = (best_hi-best_lo)/1e7 if (best_lo and best_hi) else None
    print("N=%2d  cl_lo=%s  cl_hi=%s  width=%s" % (N, lo_s, hi_s, ("%.3e"%w) if w else "NA"))
