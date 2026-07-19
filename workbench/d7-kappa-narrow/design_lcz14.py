"""
EXACT-ARITHMETIC design + lock for the 1e14-grid leastCosZero instrument (the measure-forced grid).
Emits every constant the Lean proof needs, validates every asserted inequality in exact ℚ.
"""
from fractions import Fraction as F
from mpmath import mp, mpf, pi, cos, sqrt, factorial as mfact
mp.dps = 100
def to_mpf(fr): return mpf(fr.numerator)/mpf(fr.denominator)

g = 10**14
floor14 = int(mp.floor(pi/2*mpf(g)))   # 157079632679489
ceil14 = floor14+1
print("floor14 =", floor14, " ceil14 =", ceil14, " floor%4 =", floor14%4)
cospi8 = cos(pi/8)
print("cos(pi/8) =", mp.nstr(cospi8, 24))
print()

def partialCos_F(y, N):
    return sum(F((-1)**i) * y**(2*i)/F(int(factorial_int(2*i))) for i in range(N))
from math import factorial as factorial_int

# ---------- LOWER positivity: cutCos(x)>0 for x < floor14/1e14 ----------
# y = x/4 < yLmax = floor14/(4e14). Need series_lower(yLmax,7) > C, C > cos(pi/8) (closure>0).
print("=== LOWER (floor14): DDA positivity, split@7 ===")
yLmax = F(floor14, 4*g)
yLf = to_mpf(yLmax)
print("yLmax =", yLmax, "reduced:", yLmax.numerator, "/", yLmax.denominator)
print("       =", mp.nstr(yLf,20), " cos(yLmax) =", mp.nstr(cos(yLf),24))
print("window cos(yLmax)-cos(pi/8) =", mp.nstr(cos(yLf)-cospi8,4))
# choose C 15-digit just above cos(pi/8), below cos(yLmax)
C = F(923879532511287, 10**15)
Cf = to_mpf(C)
print("C =", C, " C>cos(pi/8)?", Cf>cospi8, " C<cos(yLmax)?", Cf<cos(yLf))
closure_C = 2*(2*C*C-1)**2-1
print("closure(C)=2(2C^2-1)^2-1 >0?", closure_C>0, " (", mp.nstr(to_mpf(closure_C),6), ")")
uC = 2*C*C-1
print("uC=2C^2-1 >0?", uC>0, "  2uC^2-1>0?", (2*uC*uC-1)>0)
# split@7 series_lower(yLmax) with remainder factor. Check hinv factor <= 101/100
D7=(2*7+1)*(2*7+2)  # 210
den7 = 1 - yLmax**2/D7
print("hinv factor (1 - yLmax^2/210)^-1 <= 101/100?", 1/den7 <= F(101,100), "  actual:", mp.nstr(to_mpf(1/den7),12))
def series_lower7(y, remfac=F(101,100)):
    return (1 - y**2/2 + y**4/24 - y**6/720 + y**8/40320 - y**10/3628800 + y**12/479001600
            - remfac*(y**14/factorial_int(14)))
sl = series_lower7(yLmax)
print("series_lower7(yLmax) > C?", sl > C, "  margin:", mp.nstr(to_mpf(sl-C),4))
# also need Bsq = yLmax^2 bound value
Bsq = yLmax*yLmax
print("Bsq = yLmax^2 =", Bsq.numerator, "/", Bsq.denominator)
print("Bsq <= ?  choose upper B14 s.t. yLmax^2 < B14. yLmax^2 decimal:", mp.nstr(to_mpf(Bsq),24))
# cutCos_gt_pi8_14 threshold bound for y: y < yLmax i.e. y < floor14/(4e14)
print()

# ---------- UPPER negativity (DDA): cutCos(ceil14/1e14)<0 ----------
# v = cutCos(yU), yU = ceil14/(4e14). Need v <= R, R <= cos(pi/8) (closure<=0), v>=9/10.
print("=== UPPER (ceil14): DDA negativity, v=cutCos(ceil14/4e14), split@7 ===")
yU = F(ceil14, 4*g)
yUf = to_mpf(yU)
print("yU =", yU, "reduced:", yU.numerator, "/", yU.denominator, " =", mp.nstr(yUf,20), " >pi/8?", yUf>pi/8)
cos_yU = cos(yUf)
print("v ~ cos(yU) =", mp.nstr(cos_yU,24), "  cos(pi/8)=",mp.nstr(cospi8,24))
print("window cos(pi/8)-cos(yU) =", mp.nstr(cospi8-cos_yU,4))
# choose R 16-digit just below cos(pi/8), above cert_upper(yU)
R = F(9238795325112867, 10**16)
Rf = to_mpf(R)
print("R =", R, " R<=cos(pi/8)?", Rf<=cospi8, " R>cos(yU)?", Rf>cos_yU)
closure_R = 2*(2*R*R-1)**2-1
print("closure(R)=2(2R^2-1)^2-1 <0?", closure_R<0, " (", mp.nstr(to_mpf(closure_R),6), ")")
# split@7 upper cert for v: partialCos(yU,7)+cosRemBound(yU,7) <= R
D7=(2*7+1)*(2*7+2)
invfac7 = 1/(1 - yU**2/D7)
rem7 = (yU**(14)/factorial_int(14))*invfac7
pc7 = partialCos_F(yU, 7)
cert_up = pc7 + rem7
print("cert_upper(yU,7)=partialCos+rem <= R?", cert_up <= R, " margin:", mp.nstr(to_mpf(R-cert_up),4))
print("  invfac7 <= 101/100?", invfac7 <= F(101,100))
# v lower 9/10 via split@6
def series_lower6(y, remfac=F(101,100)):
    return (1 - y**2/2 + y**4/24 - y**6/720 + y**8/40320 - y**10/3628800
            - remfac*(y**12/factorial_int(12)))
print("series_lower6(yU) >= 9/10?", series_lower6(yU) >= F(9,10))
# closure intermediate for the two-stage nlinarith
uR = 2*R*R-1
print("uR=2R^2-1 >0?", uR>0, "  2uR^2-1 <=? closure(R):", to_mpf(2*uR*uR-1)<0)
# the intermediate 2v*v-1 upper: <= 2R^2-1; numeric value of (2R^2-1)^2 as fraction bound
u_bound = 2*R*R-1
print("2R^2-1 =", u_bound.numerator, "/", u_bound.denominator, " decimal", mp.nstr(to_mpf(u_bound),20))
print()

# ---------- cutPi + 1/cutPi 1e14 brackets ----------
print("=== cutPi / 1/cutPi 1e14 ===")
lcz_lo=F(floor14,g); lcz_hi=F(ceil14,g)
cutPi_lo=2*lcz_lo; cutPi_hi=2*lcz_hi
print("cutPi_lo=2*floor14/1e14 =", cutPi_lo.numerator,"/",cutPi_lo.denominator)
print("cutPi_hi=2*ceil14/1e14  =", cutPi_hi.numerator,"/",cutPi_hi.denominator)
inv_lo=F(1,1)/cutPi_hi; inv_hi=F(1,1)/cutPi_lo
print("1/cutPi in [", inv_lo.numerator,"/",inv_lo.denominator,",", inv_hi.numerator,"/",inv_hi.denominator,"]")
print("   = [", mp.nstr(to_mpf(inv_lo),20),",",mp.nstr(to_mpf(inv_hi),20),"] width", mp.nstr(to_mpf(inv_hi-inv_lo),4))
# nested in ext7 [100000000000/314159265359, 250000000000/785398163397]
e7lo=F(100000000000,314159265359); e7hi=F(250000000000,785398163397)
print("nested in ext7? lo>=e7lo?", inv_lo>=e7lo, " hi<=e7hi?", inv_hi<=e7hi)
print("true 1/pi inside?", float(inv_lo)<float(1/pi)<float(inv_hi))
