from fractions import Fraction as F
import mpmath as mp, math
mp.mp.dps = 90
def fnum(fr, n=25): return mp.nstr(mp.mpf(fr.numerator)/fr.denominator, n)

m01_lo = F(3477472837103, 10**9)
m01_hi = F(3477472837106, 10**9)
clo_true = mp.log(mp.mpf(m01_lo.numerator)/m01_lo.denominator)
chi_true = mp.log(mp.mpf(m01_hi.numerator)/m01_hi.denominator)

def partialExp(L, N):
    s = F(0)
    for k in range(N):
        s += L**k / math.factorial(k)
    return s
def expRemBound(L,N):
    return L**N/F(math.factorial(N)) * 1/(1 - L/F(N+1))

# expRemBound magnitude at L~8.154
for N in [27,30,33,36,40,44]:
    erb = expRemBound(F(8154,1000), N)
    # translate to cutLog-gap: gap ~ expRemBound / exp(L) = expRemBound/m01
    gap = mp.mpf(erb.numerator)/erb.denominator / mp.mpf('3477.47')
    print(f"N={N}: expRemBound(8.154)~{float(mp.mpf(erb.numerator)/erb.denominator):.3e}  cutLog-gap~{float(gap):.3e}")
print()

for N in [27, 30, 33, 36, 40]:
    def certif_lower(la): return partialExp(la,N)+expRemBound(la,N) <= m01_lo
    def certif_upper(lb): return m01_hi <= partialExp(lb,N)
    base = int(mp.floor(clo_true*10**10))
    la_best=None
    for d in range(0, 5000):
        la = F(base - d, 10**10)
        if certif_lower(la): la_best = la; break
    baseu = int(mp.ceil(chi_true*10**10))
    lb_best=None
    for d in range(0,5000):
        lb = F(baseu + d, 10**10)
        if certif_upper(lb): lb_best = lb; break
    if la_best and lb_best:
        width = float(lb_best - la_best)
        gl = float(clo_true - mp.mpf(la_best.numerator)/la_best.denominator)
        gh = float(mp.mpf(lb_best.numerator)/lb_best.denominator - chi_true)
        print(f"N={N}: la={fnum(la_best,18)} lb={fnum(lb_best,18)}  width={width:.3e}  gap_lo={gl:.2e} gap_hi={gh:.2e}")
    else:
        print(f"N={N}: la={la_best} lb={lb_best}")
