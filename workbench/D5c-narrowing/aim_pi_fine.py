from fractions import Fraction as F
from mpmath import mp, mpf, pi as mpi, cos as mcos
import mpmath, math
mp.dps = 90

halfpi = mpi/2; qpi = mpi/4
invsqrt2 = 1/mpmath.sqrt(2)
print("pi/4 =", mpmath.nstr(qpi,20), " 1/sqrt2 =", mpmath.nstr(invsqrt2,20))

def partialCos6(x): return 1 - x**2/2 + x**4/24 - x**6/720 + x**8/40320 - x**10/mpf(3628800)
def cosRemBound6(x): return x**12/mpf(479001600)*(1/(1 - x**2/mpf(182)))

# LOWER via double angle: choose Y on 1e8 grid < pi/4. Need rational L with
#   1/2 < L^2  (so 2L^2-1>0) AND L <= cert_lb(Y)=partialCos6(Y)-rem6(Y).
# x_thr = 2Y (1e8 grid: x_thr_num = 2*Y_num).  Want x_thr as close to pi/2*1e8=157079632.68 as possible.
print("\n-- finer LOWER: Y on 1e8 grid, L on 1e9 grid --")
best=None
for Ynum in range(78539810, 78539817):   # up to floor(pi/4*1e8)=78539816
    Y=mpf(Ynum)/mpf('1e8')
    cert=partialCos6(Y)-cosRemBound6(Y)
    # largest L on 1e9 grid with L<=cert and L^2>1/2:
    Lnum=math.floor(float(cert)*1e9)
    L=mpf(Lnum)/mpf('1e9')
    twoLL=2*L*L-1
    LLhalf = L*L-mpf('0.5')
    xthr=2*Ynum
    ok = (twoLL>0) and (L<=cert)
    print("Y=%d/1e8 (pi/4-Y=%.2e) cert=%.12f L=%d/1e9 L^2-1/2=%.3e %s x_thr=%d/1e8 (pi/2-x=%.2e)"%(
        Ynum,float(qpi-Y),float(cert),Lnum,float(LLhalf),"OK" if ok else "NO",xthr,float(halfpi-mpf(xthr)/mpf('1e8'))))
    if ok and (best is None or xthr>best[0]):
        best=(xthr,Ynum,Lnum,float(LLhalf))
print("\nBEST lower: x_thr=%d/1e8, Y=%d/1e8, L=%d/1e9, L^2-1/2=%.3e"%best)

# Also try L on 1e8 grid (norm_num friendlier)
print("\n-- LOWER with L on 1e8 grid (coarser but simpler numerals) --")
for Ynum in range(78539812, 78539817):
    Y=mpf(Ynum)/mpf('1e8')
    cert=partialCos6(Y)-cosRemBound6(Y)
    Lnum=math.floor(float(cert)*1e8)
    L=mpf(Lnum)/mpf('1e8')
    twoLL=2*L*L-1; xthr=2*Ynum
    print("Y=%d/1e8 cert=%.11f L=%d/1e8 2L^2-1=%.3e %s x_thr=%d/1e8"%(
        Ynum,float(cert),Lnum,float(twoLL),"OK" if twoLL>0 else "NO",xthr))
