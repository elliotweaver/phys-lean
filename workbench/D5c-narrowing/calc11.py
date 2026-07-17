from fractions import Fraction as F
from mpmath import mp, mpf, factorial
import mpmath
mp.dps = 80

# split@6 partialCos and cosRemBound (EXACT, matching the Lean defs)
# partialCos x 6 = 1 - x^2/2 + x^4/24 - x^6/720 + x^8/40320 - x^10/3628800
# cosRemBound x 6 = x^12/12! * (1 - x^2/((13)(14)))^{-1}   [12!=479001600, 13*14=182]
def partialCos6(x):
    return 1 - x**2/2 + x**4/24 - x**6/720 + x**8/40320 - x**10/mpf(3628800)
def cosRemBound6(x):
    return x**12/mpf(479001600) * (1/(1 - x**2/mpf(182)))

pi2 = mpmath.pi/2
print("pi/2 =", mpmath.nstr(pi2,14), " *1e8 =", mpmath.nstr(pi2*10**8,14))

# ---- UPPER endpoint: smallest x (1e8 grid) with partialCos6(x)+cosRemBound6(x) < 0  (=> cutCos x < 0) ----
print("\n=== UPPER (cutCos x < 0 via bracket .2) ===")
for xn in range(157079633, 157079645):
    x = mpf(xn)/mpf(10**8)
    val = partialCos6(x)+cosRemBound6(x)
    print("  x=%d/1e8=%.8f  partialCos6+rem = %.3e  %s"%(xn,float(x),float(val),"OK <0" if val<0 else "not yet"))

# ---- LOWER endpoint via double-angle: cutCos(x)>0 for x<X needs cutCos(Y)>L, Y=X/2, L^2>1/2 ----
# The gt_invSqrt2 lemma proves cutCos y > L for 0<=y<Ymax using bracket .1: cutCos y >= partialCos6(y) - cosRemBound6(y)
# So certified lower bound at y=Ymax is  partialCos6(Ymax) - cosRemBound6(Ymax).  Need L < that.
# Then cutCos(x)=2 cutCos(x/2)^2 -1 > 2L^2-1 >0 needs L^2>1/2.
print("\n=== LOWER (double-angle): pick L=7071068/1e7 (L^2-1/2>0). max X where partialCos6(X/2)-rem > L ===")
L = F(7071068,10**7)
print("  L =", float(L), " L^2-1/2 =", float(L*L-F(1,2)))
for xn in [157079620,157079625,157079628,157079630,157079632]:
    X = mpf(xn)/mpf(10**8); Y = X/2
    cert = partialCos6(Y) - cosRemBound6(Y)   # certified lower bound of cutCos(Y)
    margin = float(cert - float(L))
    dbl = 2*float(L)**2 - 1
    print("  X=%d/1e8=%.8f Y=%.8f  cert_lb(cutCos Y)=%.9f  margin over L=%.2e  (2L^2-1=%.2e)"%(xn,float(X),float(Y),float(cert),margin,dbl))

# Try a slightly larger L to push X further while keeping margin
print("\n  -- alt L values --")
for Lnum in [7071068,7071069,7071070]:
    Lc=F(Lnum,10**7); l2=float(Lc*Lc-F(1,2))
    # max X where cert_lb(cutCos(X/2)) > Lc
    best=None
    for xn in range(157079615,157079633):
        X=mpf(xn)/mpf(10**8); Y=X/2
        if partialCos6(Y)-cosRemBound6(Y) > float(Lc):
            best=xn
        else:
            break
    print("  L=%d/1e7 (2L^2-1=%.2e): max X=%s/1e8 (=%.8f)"%(Lnum,l2,best,best/1e8 if best else 0))
