from fractions import Fraction as F
from mpmath import mp, mpf, factorial, pi as mpi, cos as mcos
import mpmath, math
mp.dps = 80

halfpi = mpi/2
qpi = mpi/4
print("pi/2*1e8 =", mpmath.nstr(halfpi*mpf('1e8'),12))
print("pi/4*1e7 =", mpmath.nstr(qpi*mpf('1e7'),12))
print("1/sqrt2  =", mpmath.nstr(1/mpmath.sqrt(2),16))

def partialCos6(x): return 1 - x**2/2 + x**4/24 - x**6/720 + x**8/40320 - x**10/mpf(3628800)
def cosRemBound6(x): return x**12/mpf(479001600)*(1/(1 - x**2/mpf(182)))

# ---- LOWER: near-pi/4 lemma at threshold Y (1e7 grid). Need cutCos(Y) > L, L>1/sqrt2, and
#      certified lower = partialCos6(Y)-rem6(Y) > L. Then x-threshold = 2Y (=> /1e8 numeral 2*Y_num*10).
print("\n-- LOWER near-pi/4 ticks (Y on 1e7 grid), find max L (1e7 grid) with cert_lb(Y)>L and 2L^2-1>0 --")
for Ynum in [7853981, 7853982, 7853983, 7853984, 7853985]:
    Y=mpf(Ynum)/mpf('1e7')
    cert=partialCos6(Y)-cosRemBound6(Y)
    cosY=mcos(Y)
    # max L on 1e7 grid strictly below cert and > 1/sqrt2:
    Lnum=math.floor(float(cert)*1e7)
    L=mpf(Lnum)/mpf('1e7')
    twoLL=2*L*L-1
    xthr = 2*Ynum   # 2Y on 1e7 grid = (2*Ynum)/1e7 ; as /1e8 = (2*Ynum*10)/1e8 = 2*Ynum/1e7
    xthr_1e8 = 2*Ynum*10   # 2Y expressed over 1e8 grid: 2*(Ynum/1e7)=2*Ynum/1e7 = 20*Ynum/1e8
    print("Y=%d/1e7 (pi/4-Y=%.2e)  cert_lb=%.10f  cos=%.10f  L=%d/1e7  2L^2-1=%.3e %s  x_thr=%d/1e8 (pi/2-x=%.2e)"%(
        Ynum, float(qpi-Y), float(cert), float(cosY), Lnum, float(twoLL), "OK" if twoLL>0 else "NEG",
        xthr_1e8, float(halfpi - mpf(xthr_1e8)/mpf('1e8'))))

# ---- UPPER: split@6 sign at candidate x (1e8 grid) nearer pi/2 ----
print("\n-- UPPER split@6 neg sign ticks (x on 1e8 grid) --")
for xnum in [157079635, 157079634, 157079633, 157079636]:
    x=mpf(xnum)/mpf('1e8')
    pc=partialCos6(x); rem=cosRemBound6(x); s=pc+rem
    print("x=%d/1e8 (x-pi/2=%.2e)  partialCos6=%.3e  rem=%.3e  sum=%.3e %s"%(
        xnum, float(x-halfpi), float(pc), float(rem), float(s), "NEG(ok)" if s<0 else "POS(fail)"))
