"""D5-next-10: lift 1/cutPi onto the 1e10-grid. Measure-first (W9).
LOWER bound: double-double-angle near-pi/8 at y < N10lo/4e10. Need y_max < pi/8, a threshold
C with cos(pi/8) < C < cos(y_max), and 2*(2C^2-1)^2-1 > 0 <=> C>cos(pi/8).
UPPER sign: cutCos(N10hi/1e10) < 0, needs cosRemBound(N10hi/1e10, N) < |cos|.
"""
import mpmath as mp
from fractions import Fraction as F
mp.mp.dps = 80
pi = mp.pi
cpi8 = mp.cos(pi/8)
E10 = 10**10

def show(name, fr):
    print("%-26s = %s/%s  (~%s)" % (name, fr.numerator, fr.denominator,
          mp.nstr(mp.mpf(fr.numerator)/fr.denominator, 32)))

def fmp(fr):
    return mp.mpf(fr.numerator)/fr.denominator

print("pi/2*1e10 =", mp.nstr(pi/2*E10, 25), " floor=15707963267, ceil=15707963268")
print("pi/8      =", mp.nstr(pi/8, 32))
print("cos(pi/8) =", mp.nstr(cpi8, 32))
print()

def cosRemBound(xf, N):
    x = fmp(xf)
    return (x**(2*N)/mp.factorial(2*N))*(1/(1 - x**2/((2*N+1)*(2*N+2))))

# ---- LOWER: near-pi/8 at 1e10 lower tick 15707963267 ----
print("### LOWER-tick candidate 15707963267 ###")
N10lo = 15707963267
ymax = F(N10lo, 4*E10)              # y < ymax
print("ymax = %d/4e10 = %s" % (N10lo, mp.nstr(fmp(ymax),25)))
print("  ymax < pi/8 ?", fmp(ymax) < pi/8, " gap(pi/8 - ymax) =", mp.nstr(pi/8-fmp(ymax),6))
ymax2 = ymax*ymax
print("  ymax^2 =", mp.nstr(fmp(ymax2),25))
cym = mp.cos(fmp(ymax))
print("  cos(ymax) =", mp.nstr(cym,32), " window (cos ymax - cos pi/8) =", mp.nstr(cym-cpi8,6))

# hy2 bound B: clean rational slightly ABOVE ymax^2.  ymax^2 ~ 0.15421274... need B > ymax^2.
# Try B = 1542127450/1e10 (0.154212745)
for Bcand in [F(1542127450,10**10), F(154212745,10**9), F(1542127449,10**10)]:
    ok = Bcand > ymax2
    print("  B(hy2) cand %s/%s = %s  >= ymax^2 ? %s  gap %s" % (Bcand.numerator,Bcand.denominator,
          mp.nstr(fmp(Bcand),20), ok, mp.nstr(fmp(Bcand-ymax2),6) if ok else "NEG"))
print()

# threshold C: cos(pi/8) < C < cos(ymax).  window is thin (~9e-12). find a clean rational in it.
print("  --- threshold C in (cos pi/8, cos ymax) ---")
# 1e9 used C = 92387953255/1e11 = 0.92387953255. cos(pi/8)=0.923879532511.., cos(ymax_1e10) bigger.
for Ccand in [F(92387953255,10**11), F(923879532515,10**12), F(9238795325115,10**13),
              F(92387953252,10**11)]:
    Cv = fmp(Ccand)
    gt = Cv > cpi8
    lt = Cv < cym
    print("  C=%s/%s=%s  >cos pi/8? %s (margin %s)  <cos ymax? %s (certmargin %s)" % (
        Ccand.numerator, Ccand.denominator, mp.nstr(Cv,22), gt, mp.nstr(Cv-cpi8,6), lt, mp.nstr(cym-Cv,6)))
    if gt and lt:
        u = 2*Ccand*Ccand - 1
        fin = 2*u*u - 1
        print("       -> u=2C^2-1=%s  final 2u^2-1 = %s  >0 ? %s" % (
            mp.nstr(fmp(u),20), mp.nstr(fmp(fin),8), fin>0))
print()

# ---- UPPER sign at 1e10 ceiling 15707963268 ----
print("### UPPER sign 15707963268/1e10 ###")
N10hi = 15707963268
xhi = F(N10hi, E10)
chi = mp.cos(fmp(xhi))
print("cos(xhi) =", mp.nstr(chi,8), "  (xhi - pi/2 = %s)" % mp.nstr(fmp(xhi)-pi/2,6))
for N in [8,9,10]:
    rem = cosRemBound(xhi, N)
    print("  N=%d cosRemBound = %s   %s" % (N, mp.nstr(rem,6), "OK < |cos|" if rem < abs(chi) else "TOO BIG"))
    x = fmp(xhi)
    pcN = sum(((-1)**i)*x**(2*i)/mp.factorial(2*i) for i in range(N))
    print("       partialCos(xhi,%d) ~ %s   pc+rem ~ %s  (<0 ?)" % (N, mp.nstr(pcN,12), mp.nstr(pcN+rem,10)))
print()

# ---- CUTPI + 1/CUTPI 1e10 brackets ----
print("### CUTPI + 1/CUTPI 1e10 brackets ###")
# leastCosZero in [15707963267/1e10, 15707963268/1e10]
# cutPi = 2*leastCosZero
lo_pi = F(2*N10lo, E10); hi_pi = F(2*N10hi, E10)
show("cutPi_lo (2*floor)", lo_pi); show("cutPi_hi (2*ceil)", hi_pi)
inv_lo = F(1)/hi_pi; inv_hi = F(1)/lo_pi
show("1/cutPi lo (=1/cutPi_hi)", inv_lo)
show("1/cutPi hi (=1/cutPi_lo)", inv_hi)
print("1/cutPi width ~", mp.nstr(fmp(inv_hi-inv_lo),6))
print("true 1/pi =", mp.nstr(1/pi,25))
