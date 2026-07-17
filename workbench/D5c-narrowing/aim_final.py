from fractions import Fraction as F
from mpmath import mp, mpf, factorial, log, pi as mpi, cos as mcos
import mpmath, math
mp.dps = 100

# ============ CANDIDATE ENDPOINTS (SAFE margins) ============
# --- 1/cutPi: leastCosZero bracket ---
# LOWER positivity x_thr via double angle: Y=78539814/1e8, L=70710679/1e8
#   margins: cert_lb(Y)-L ~7.5e-9, 2L^2-1 ~2.49e-8  => x_thr = 157079628/1e8
# UPPER sign: keep 157079635/1e8 (banked, margin ~1.04e-8) OR push to 157079634 (margin 4e-10, needs fine rationals)
def partialCos6(x): return 1 - x**2/2 + x**4/24 - x**6/720 + x**8/40320 - x**10/mpf(3628800)
def cosRemBound6(x): return x**12/mpf(479001600)*(1/(1 - x**2/mpf(182)))

Y=mpf(78539814)/mpf('1e8'); L=mpf(70710679)/mpf('1e8')
print("LOWER: Y=78539814/1e8 cert-L=%.3e  2L^2-1=%.3e  x_thr=157079628/1e8"%(
    float(partialCos6(Y)-cosRemBound6(Y)-L), float(2*L*L-1)))
# UPPER 634 fine-rational check:
x634=mpf(157079634)/mpf('1e8'); pc=partialCos6(x634); rem=cosRemBound6(x634)
print("UPPER 634: partialCos6=%.6e rem=%.6e"%(float(pc),float(rem)))
# need R>=rem, P<=|pc|, R<P. Try R=47757/1e11, P=4778/1e10:
R=F(47757,10**11); P=F(4778,10**10)
print("  R=47757/1e11=%.5e >= rem? %s ; P=4778/1e10=%.4e <= |pc|? %s ; R<P? %s"%(
    float(R), rem<=float(R), float(P), float(pc)<=-float(P), R<P))

# choose leastCosZero bracket options:
for (lznum_lo,lznum_hi) in [(157079628,157079635),(157079628,157079634)]:
    lz_lo=F(lznum_lo,10**8); lz_hi=F(lznum_hi,10**8)
    cutpi_lo=2*lz_lo; cutpi_hi=2*lz_hi
    # 1/cutPi bracket: [1/cutpi_hi, 1/cutpi_lo] as rational endpoints (choose <= / >=)
    # inv lower = 1/cutpi_hi ; upper = 1/cutpi_lo. Provable: inv>=1/cutpi_hi needs cutpi<=cutpi_hi. inv<=1/cutpi_lo needs cutpi>=cutpi_lo.
    invlo = F(1,1)/cutpi_hi   # = 1/(2*lz_hi)
    invhi = F(1,1)/cutpi_lo
    print("\nleastCosZero [%d,%d]/1e8 -> cutPi [%s,%s] -> 1/cutPi [%s, %s] (w %.3e)"%(
        lznum_lo,lznum_hi,float(cutpi_lo),float(cutpi_hi), invlo, invhi, float(invhi-invlo)))
    # clean numeral form for 1/cutPi endpoints:
    # 1/cutpi_hi = 1/(2*lz_hi) = 1/(2*lznum_hi/1e8) = 1e8/(2*lznum_hi) = 5e7/lznum_hi
    print("   1/cutPi_lo = 50000000/%d ; 1/cutPi_hi = 50000000/%d"%(lznum_hi,lznum_lo))

# --- cutLog over split@5 m01 = [3477.472814, 3477.472923] ---
m01_lo=F(3477472814,10**6); m01_hi=F(3477472923,10**6)
tlo=mpf(3477472814)/mpf('1e6'); thi=mpf(3477472923)/mpf('1e6')
def partialExp(x,N):
    s=mpf(0); term=mpf(1)
    for k in range(N):
        s+=term; term*=x/(k+1)
    return s
def expRemBound(x,N): return (x**N/factorial(N))*(1/(1-x/(N+1)))
print("\n=== cutLog readings over split@5 m01 [%.6f,%.6f] ==="%(float(m01_lo),float(m01_hi)))
for (Nlo,Nhi) in [(26,29),(27,30),(28,31)]:
    # lower cl: largest i (1e8) with partialExp+rem<=tlo at Nlo
    clo=None
    for i in range(815406090,815406130):
        c=mpf(i)/mpf('1e8')
        if partialExp(c,Nlo)+expRemBound(c,Nlo)<=tlo: clo=i
        else: break
    chi=None
    for i in range(815406160,815406100,-1):
        c=mpf(i)/mpf('1e8')
        if thi<=partialExp(c,Nhi): chi=i
        else: break
    if clo and chi:
        print("  idx(%d/%d): cutLog [%d/1e8, %d/1e8] width %.3e"%(Nlo,Nhi,clo,chi,(chi-clo)/1e8))

# ============ ASSEMBLED WIDTH for a chosen combo ============
print("\n=== ASSEMBLED (190/3 + 16/9*cutLog*(1/cutPi)) ===")
d=F(16,3)
def assemble(la,lb,pa,pb):
    lo=F(190,3)+d/3*la*pa
    hi=F(190,3)+d/3*lb*pb
    return lo,hi
# combo A: cutLog idx27/30 [815406110,815406130], leastCosZero[628,635]
combos={
 "A cutLog[815406110,815406130] lz[628,635]": (F(815406110,10**8),F(815406130,10**8),F(50000000,157079635),F(50000000,157079628)),
 "B cutLog[815406110,815406119] lz[628,634]": (F(815406110,10**8),F(815406119,10**8),F(50000000,157079634),F(50000000,157079628)),
}
parent_w=F(4802931662,70685829)-F(19211728054,282743343)
print("parent width = %.3e"%float(parent_w))
for name,(la,lb,pa,pb) in combos.items():
    lo,hi=assemble(la,lb,pa,pb)
    print("%s\n   -> [%s, %s]\n      width %.3e  (parent/this = %.1fx)"%(name,lo,hi,float(hi-lo),float(parent_w/(hi-lo))))
