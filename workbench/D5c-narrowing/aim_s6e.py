from fractions import Fraction as F
import mpmath as mp, math
mp.mp.dps = 90
def fnum(fr, n=25): return mp.nstr(mp.mpf(fr.numerator)/fr.denominator, n)

# chosen m01 rational bracket on 1e9 grid, enclosing [3477.472837103937, 3477.472837105402]
m01_lo = F(3477472837103, 10**9)   # 3477.472837103
m01_hi = F(3477472837106, 10**9)   # 3477.472837106
print("m01_lo=",fnum(m01_lo)," <= true_lo:", m01_lo <= F(34774728371039,10**10))
print("m01_hi=",fnum(m01_hi)," >= true_hi:", m01_hi >= F(34774728371055,10**10))
print("cutLog(m01_lo) true =", mp.nstr(mp.log(mp.mpf(m01_lo.numerator)/m01_lo.denominator),20))
print("cutLog(m01_hi) true =", mp.nstr(mp.log(mp.mpf(m01_hi.numerator)/m01_hi.denominator),20))
print()

# exp instrument
def partialExp(L, N):  # sum_{k=0}^{N-1} ... actually banked: sum_{k=0}^{N} ? check convention
    # In Lean cutLog_ge_certified uses partialExp L N + expRemBound L N <= z
    # partialExp L N = sum_{k in range N} L^k/k!   (range N -> k=0..N-1)
    s = F(0)
    for k in range(N):
        s += L**k / math.factorial(k)
    return s
def expRemBound(L,N):
    # expRemBound L N = L^N/N! * 1/(1 - L/(N+1))   (needs L<N+1)
    return L**N/F(math.factorial(N)) * 1/(1 - L/F(N+1))

# We want largest la with partialExp(la,N)+expRemBound(la,N) <= m01_lo  -> la <= cutLog(m01_lo)
# and smallest lb with m01_hi <= partialExp(lb,N)  -> cutLog(m01_hi) <= lb
# Test index N for both. Target cutLog ~ 8.1540611127
target = mp.log(mp.mpf('3477.472837104'))
print("target cutLog ~", mp.nstr(target,20))
print()
for N in [27, 30, 33, 36, 40]:
    # For lower: find how tight la can be. Given a candidate la, check partialExp(la,N)+expRemBound(la,N) <= m01_lo
    # We'll binary search la on fine grid.
    # cutLog(m01_lo) true:
    clo_true = mp.log(mp.mpf(m01_lo.numerator)/m01_lo.denominator)
    chi_true = mp.log(mp.mpf(m01_hi.numerator)/m01_hi.denominator)
    # try la at 1e-k grid: the gap between certifiable la and true cutLog(m01_lo) is governed by expRemBound
    # Evaluate at la = floor(clo_true*1e9)/1e9 candidate
    def certif_lower(la):
        return partialExp(la,N)+expRemBound(la,N) <= m01_lo
    def certif_upper(lb):
        return m01_hi <= partialExp(lb,N)
    # search largest la on 1e10 grid <= clo_true that certifies
    base = int(mp.floor(clo_true*10**10))
    la_best=None
    for d in range(0, 200):
        la = F(base - d, 10**10)
        if certif_lower(la):
            la_best = la; break
    baseu = int(mp.ceil(chi_true*10**10))
    lb_best=None
    for d in range(0,200):
        lb = F(baseu + d, 10**10)
        if certif_upper(lb):
            lb_best = lb; break
    if la_best and lb_best:
        width = float(lb_best - la_best)
        print(f"N={N}: la={fnum(la_best,18)} lb={fnum(lb_best,18)}  cutLog width={width:.3e}   gap_lo={float(clo_true-la_best):.2e} gap_hi={float(lb_best-chi_true):.2e}")
    else:
        print(f"N={N}: la={la_best} lb={lb_best} (not found in 200 steps)")
