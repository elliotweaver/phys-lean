from fractions import Fraction as F
import mpmath as mp, math
mp.mp.dps = 90
def fnum(fr, n=25): return mp.nstr(mp.mpf(fr.numerator)/fr.denominator, n)

m01_lo = F(3477472837103, 10**9)
m01_hi = F(3477472837106, 10**9)
clo_true = mp.log(mp.mpf(m01_lo.numerator)/m01_lo.denominator)
chi_true = mp.log(mp.mpf(m01_hi.numerator)/m01_hi.denominator)
print("cutLog(m01_lo) true =", mp.nstr(clo_true,20))
print("cutLog(m01_hi) true =", mp.nstr(chi_true,20))

def partialExp(L, N):
    s = F(0)
    for k in range(N): s += L**k / math.factorial(k)
    return s
def expRemBound(L,N):
    return L**N/F(math.factorial(N)) * 1/(1 - L/F(N+1))

# Use 1e11 grid for la/lb, N=36
for N in [36, 40]:
    G = 10**11
    def certif_lower(la): return partialExp(la,N)+expRemBound(la,N) <= m01_lo
    def certif_upper(lb): return m01_hi <= partialExp(lb,N)
    base = int(mp.floor(clo_true*G))
    la_best=None
    for d in range(0, 20000):
        la = F(base - d, G)
        if certif_lower(la): la_best = la; break
    baseu = int(mp.ceil(chi_true*G))
    lb_best=None
    for d in range(0,20000):
        lb = F(baseu + d, G)
        if certif_upper(lb): lb_best = lb; break
    if la_best and lb_best:
        width = float(lb_best - la_best)
        gl = float(clo_true - mp.mpf(la_best.numerator)/la_best.denominator)
        gh = float(mp.mpf(lb_best.numerator)/lb_best.denominator - chi_true)
        print(f"N={N} (1e11 grid): la={fnum(la_best,20)} lb={fnum(lb_best,20)}  width={width:.3e}  gap_lo={gl:.2e} gap_hi={gh:.2e}")
