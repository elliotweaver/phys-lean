from fractions import Fraction as F
from mpmath import mp, mpf, factorial
import mpmath
mp.dps = 80

b0lo = F(237943816,10**8); b0hi = F(237943819,10**8)
b1lo = F(4034989,10**8);   b1hi = F(4034992,10**8)
mass0_lo=b0lo*b0lo; mass0_hi=b0hi*b0hi; mass1_lo=b1lo*b1lo; mass1_hi=b1hi*b1hi
m01_lo_exact = mass0_lo/mass1_hi; m01_hi_exact = mass0_hi/mass1_lo
print("m01 exact: [%.9f, %.9f]"%(float(m01_lo_exact),float(m01_hi_exact)))

# robust 4-dp m01 endpoints
m01_lo = F(34774707,10000); m01_hi = F(34774761,10000)
print("m01 4dp: [%.4f,%.4f]  lower<=exact_lo? %s (margin %.2e)  upper>=exact_hi? %s (margin %.2e)"%(
    float(m01_lo),float(m01_hi), m01_lo<=m01_lo_exact, float(m01_lo_exact-m01_lo),
    m01_hi>=m01_hi_exact, float(m01_hi-m01_hi_exact)))
# nlinarith margins (product form): lower needs m01_lo*mass1_hi <= mass0_lo
print("  lower product margin: mass0_lo - m01_lo*mass1_hi =", float(mass0_lo - m01_lo*mass1_hi), "(need >0)")
print("  upper product margin: m01_hi*mass1_lo - mass0_hi =", float(m01_hi*mass1_lo - mass0_hi), "(need >0)")

def partialExp(x, N):
    s=mpf(0); term=mpf(1)
    for k in range(N):
        s+=term; term*=x/(k+1)
    return s
def expRemBound(x,N):
    return (x**N/factorial(N))*(1/(1-x/(N+1)))

target_lo=mpf(float(m01_lo)); target_hi=mpf(float(m01_hi))
print("\n=== cutLog readings over m01 [3477.4707, 3477.4761] ===")
for N in [24,26,27,28]:
    best_lo=None
    for i in range(81540560,81540720):
        c=mpf(i)/mpf('1e7')
        if partialExp(c,N)+expRemBound(c,N)<=target_lo: best_lo=i
        else: break
    best_hi=None
    for i in range(81540720,81540560,-1):
        c=mpf(i)/mpf('1e7')
        if target_hi<=partialExp(c,N): best_hi=i
        else: break
    # margins
    mlo = float(target_lo - (partialExp(mpf(best_lo)/mpf('1e7'),N)+expRemBound(mpf(best_lo)/mpf('1e7'),N))) if best_lo else None
    mhi = float(partialExp(mpf(best_hi)/mpf('1e7'),N) - target_hi) if best_hi else None
    print("N=%2d cl_lo=%s (margin %s) cl_hi=%s (margin %s) width=%s"%(
        N, best_lo, ("%.2e"%mlo) if mlo else "-", best_hi, ("%.2e"%mhi) if mhi else "-",
        ("%.3e"%((best_hi-best_lo)/1e7)) if (best_lo and best_hi) else "NA"))

# ---- ASSEMBLED with chosen cutLog + double-angle 1/cutPi ----
print("\n=== ASSEMBLED options ===")
d=F(16,3)
def assembled(clL,clH,ipL,ipH):
    return F(190,3)+(d/3)*clL*ipL, F(190,3)+(d/3)*clH*ipH
# 1/cutPi from double-angle: X_lo=157079620/1e8, x_hi=157079635/1e8
# cutPi=2*leastCosZero in [2*157079620/1e8, 2*157079635/1e8]=[314159240/1e8,314159270/1e8]=[31415924/1e7,31415927/1e7]
piL=F(31415924,10**7); piH=F(31415927,10**7)
ipL=F(1,1)/piH; ipH=F(1,1)/piL   # 1/cutPi in [1/piH, 1/piL]
print("cutPi in [%.8f,%.8f]  1/cutPi in [%s, %s]=[%.10f,%.10f] width %.2e"%(
    float(piL),float(piH), ipL, ipH, float(ipL),float(ipH),float(ipH-ipL)))
# simplify 1/cutPi fractions
print("  ipL=1e7/31415927=10000000/31415927  ipH=10000000/31415924")

# choose cutLog N=27: cl_lo, cl_hi
for (Ncl,clL,clH) in [(26,None,None)]:
    pass
