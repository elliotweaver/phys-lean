"""
EXACT-ARITHMETIC LOCK for the ext7 (1e12-grid) 1/cutPi instrument.
Validates every inequality the Lean proof will assert, in exact Fraction arithmetic.
mpmath only used to CHOOSE constants (not in any asserted inequality — those are pure ℚ).
"""
from fractions import Fraction as F
from mpmath import mp, mpf, pi, cos
from math import factorial
mp.dps = 90

g12 = mpf(10)**12
floor12 = int(mp.floor(pi/2*g12))   # 1570796326794
ceil12 = floor12+1                  # 1570796326795
print("floor12 =", floor12, " ceil12 =", ceil12)

# ---------- LOWER positivity: cutCos(x)>0 for x < xL, xL = floor12/1e12 ----------
# y = x/4 < yLmax = floor12/(4e12). Need cutCos y > C, C > cos(pi/8) (closure>0).
xL_num, xL_den = floor12, 10**12
yLmax = F(floor12, 4*10**12)     # xL/4
print("\n=== LOWER ===")
print("yLmax =", yLmax, "=", mp.nstr(mpf(yLmax.numerator)/yLmax.denominator,16))
# C threshold (13-digit)
C = F(9238795325113, 10**13)
Cf = mpf(C.numerator)/C.denominator
print("C =", C, " cos(pi/8) =", mp.nstr(cos(pi/8),18), " C>cos(pi/8)?", Cf > cos(pi/8))
closure_C = 2*(2*Cf*Cf-1)**2-1
print("closure 2(2C^2-1)^2-1 =", mp.nstr(closure_C,6), " >0?", closure_C>0)
# exact closure as fraction
closure_C_F = 2*(2*C*C-1)**2-1
print("closure exact =", mp.nstr(mpf(closure_C_F.numerator)/closure_C_F.denominator,6), " >0?", closure_C_F>0)

# split@6 certificate: need partialCos-lower(y,6) > C for all y in [0,yLmax]
# certified lower = 1 - y^2/2 + y^4/24 - y^6/720 + y^8/40320 - y^10/3628800 - (101/100)*(y^12/479001600)
# worst case at y=yLmax (cos decreasing). Verify exact:
def series_lower(y, remfac=F(101,100)):
    return (1 - y**2/2 + y**4/24 - y**6/720 + y**8/40320 - y**10/3628800
            - remfac*(y**12/479001600))
sl = series_lower(yLmax)
print("series_lower(yLmax,6) =", mp.nstr(mpf(sl.numerator)/sl.denominator,18))
print("  > C ?", sl > C, " margin =", mp.nstr(mpf((sl-C).numerator)/(sl-C).denominator,4))
# hinv check: (1 - y^2/((2*6+1)(2*6+2)))^-1 <= 101/100 at yLmax
D6 = (2*6+1)*(2*6+2)  # 182
den = 1 - yLmax**2/D6
print("den =", mp.nstr(mpf(den.numerator)/den.denominator,10), " inv<=101/100?", 1/den <= F(101,100))
# tight square bound B = (floor12/(4e12))^2
Bsq = yLmax*yLmax
print("Bsq =", Bsq, " as decimal", mp.nstr(mpf(Bsq.numerator)/Bsq.denominator,20))
# closure intermediate for the two-stage nlinarith:
# u = 2C^2 - 1 (lower bound for 2c^2-1), need u>0 and 2u^2-1>0
uC = 2*C*C - 1
print("uC = 2C^2-1 =", mp.nstr(mpf(uC.numerator)/uC.denominator,18), " >0?", uC>0)
final = 2*uC*uC - 1
print("2uC^2-1 =", mp.nstr(mpf(final.numerator)/final.denominator,6), " >0?", final>0)

# ---------- UPPER negativity (route b, DDA): cutCos(xU)<0, xU=ceil12/1e12 ----------
# v = cutCos(yU), yU = xU/4. Need v <= R with R <= cos(pi/8) (closure(R)<=0) and v>=Llo>1/sqrt2.
print("\n=== UPPER (DDA negativity) ===")
yU = F(ceil12, 4*10**12)
print("yU =", yU, "=", mp.nstr(mpf(yU.numerator)/yU.denominator,16), " > pi/8?", mpf(yU.numerator)/yU.denominator > pi/8)
R = F(923879532511277, 10**15)
Rf = mpf(R.numerator)/R.denominator
print("R =", R, " R<=cos(pi/8)?", Rf <= cos(pi/8), " (cos(pi/8)=",mp.nstr(cos(pi/8),18),")")
closure_R_F = 2*(2*R*R-1)**2-1
print("closure(R) 2(2R^2-1)^2-1 =", mp.nstr(mpf(closure_R_F.numerator)/closure_R_F.denominator,6), " <0?", closure_R_F<0)
# certify v <= R via cutCos_bracket upper at split@7: v <= partialCos(yU,7)+cosRemBound(yU,7)
def partialCos_F(y, N):
    return sum(F((-1)**i) * y**(2*i)/factorial(2*i) for i in range(N))
def cosRemBound_upper_F(y, N, remfac=F(101,100)):
    # cosRemBound = y^(2N)/(2N)! * (1 - y^2/((2N+1)(2N+2)))^-1 ; bound by remfac form
    return remfac*(y**(2*N)/factorial(2*N))
pc7 = partialCos_F(yU, 7)
# actual cosRemBound at split7 for yU (small): compute exact inv factor
D7 = (2*7+1)*(2*7+2)
invfac7 = 1/(1 - yU**2/D7)
rem7_exact = (yU**(2*7)/factorial(2*7))*invfac7
cert_up = pc7 + rem7_exact
print("partialCos(yU,7) =", mp.nstr(mpf(pc7.numerator)/pc7.denominator,20))
print("cert_upper(yU,7) = partialCos+rem =", mp.nstr(mpf(cert_up.numerator)/cert_up.denominator,20))
print("  <= R ?", cert_up <= R, " margin =", mp.nstr(mpf((R-cert_up).numerator)/(R-cert_up).denominator,4))
print("  invfac7 <= 101/100?", invfac7 <= F(101,100))
# lower Llo for v: v >= 9/10 (easy)
Llo = F(9,10)
# certified lower at split@6 for yU
sl_yU = series_lower(yU)
print("series_lower(yU,6) =", mp.nstr(mpf(sl_yU.numerator)/sl_yU.denominator,18), " >= 9/10?", sl_yU >= Llo)
# with v>=9/10: 2v^2-1 >= 2*(81/100)-1 = 62/100 > 0
print("2*(9/10)^2-1 =", F(2)*Llo*Llo-1)
# u=2v^2-1 in [0, 2R^2-1]; u^2 <= (2R^2-1)^2; 2u^2-1 <= closure(R) < 0
uR = 2*R*R-1
print("uR=2R^2-1 =", mp.nstr(mpf(uR.numerator)/uR.denominator,18), " >0?", uR>0)

# ---------- cutPi + 1/cutPi ext7 brackets ----------
print("\n=== cutPi / 1/cutPi ext7 ===")
lcz_lo = F(floor12,10**12); lcz_hi = F(ceil12,10**12)
cutPi_lo = 2*lcz_lo; cutPi_hi = 2*lcz_hi
print("cutPi_lo =", cutPi_lo, "=", 2*floor12,"/1e12")
print("cutPi_hi =", cutPi_hi, "=", 2*ceil12,"/1e12")
inv_lo = F(1,1)/cutPi_hi   # = 1/cutPi_hi
inv_hi = F(1,1)/cutPi_lo
print("1/cutPi_lo (=1/cutPi_hi) =", inv_lo, " = ", mp.nstr(mpf(inv_lo.numerator)/inv_lo.denominator,18))
print("1/cutPi_hi (=1/cutPi_lo) =", inv_hi, " = ", mp.nstr(mpf(inv_hi.numerator)/inv_hi.denominator,18))
# reduce
print("cutPi_lo reduced:", cutPi_lo.numerator, "/", cutPi_lo.denominator)
print("cutPi_hi reduced:", cutPi_hi.numerator, "/", cutPi_hi.denominator)
print("inv_lo reduced:", inv_lo.numerator, "/", inv_lo.denominator)
print("inv_hi reduced:", inv_hi.numerator, "/", inv_hi.denominator)
# nested inside ext6 [1250000000/3926990817, 50000000000/157079632679]?
e6lo = F(1250000000,3926990817); e6hi = F(50000000000,157079632679)
print("nested in ext6?  lo:", inv_lo >= e6lo, " hi:", inv_hi <= e6hi)
print("width ext7 =", mp.nstr(mpf((inv_hi-inv_lo).numerator)/(inv_hi-inv_lo).denominator,4))
