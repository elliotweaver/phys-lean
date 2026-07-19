"""
W9 DESIGN + COST + MEASURE for the 1e13-grid leastCosZero instrument (ext8).
Same double-double-angle lever as ext7, one grid deeper.
LOWER: DDA positivity, cutCos(x)>0 for x<floor13/1e13 (y=x/4 near pi/8).
UPPER: DDA negativity, cutCos(ceil13/1e13)<0 via v=cutCos(ceil13/4e13)<R (R~cos(pi/8)).
"""
from fractions import Fraction as F
from mpmath import mp, mpf, pi, cos, sin, sqrt, factorial, floor
mp.dps = 90

g13 = mpf(10)**13
pi2 = pi/2
floor13 = int(mp.floor(pi2*g13))
ceil13 = floor13 + 1
print("pi/2 * 1e13 =", mp.nstr(pi2*g13, 22))
print("floor13 =", floor13, " ceil13 =", ceil13)
xL = mpf(floor13)/g13
xU = mpf(ceil13)/g13
print("xL =", mp.nstr(xL,18), " pi/2-xL =", mp.nstr(pi2-xL,4))
print("xU =", mp.nstr(xU,18), " xU-pi/2 =", mp.nstr(xU-pi2,4))
print()

def cosRemBound(x, N):
    x = mpf(x)
    term = x**(2*N)/factorial(2*N)
    fac = 1/(1 - x**2/((2*N+1)*(2*N+2)))
    return term*fac
def partialCos(x, N):
    x = mpf(x)
    return sum((-1)**i * x**(2*i)/factorial(2*i) for i in range(N))
def partialCos_F(y, N):
    return sum(F((-1)**i) * y**(2*i)/F(int(factorial(2*i))) for i in range(N))

cospi8 = cos(pi/8)
print("cos(pi/8) =", mp.nstr(cospi8, 22))
print()

# ============ LOWER: floor13, y=x/4 near pi/8, yLmax = floor13/(4e13) ============
print("=== LOWER (floor13): DDA positivity ===")
assert floor13 % 4 == 0, ("floor13 not div by 4", floor13 % 4)
yLmax_num = floor13 // 4
print("yLmax = floor13/4 / 1e13 =", yLmax_num, "/ 1e13")
yLmax = F(yLmax_num, 10**13)
yLf = mpf(yLmax.numerator)/yLmax.denominator
cos_yLmax = cos(yLf)
print("yLmax =", mp.nstr(yLf,18), " pi/8 =", mp.nstr(pi/8,18), " pi/8-yLmax =", mp.nstr(pi/8-yLf,4))
print("cos(yLmax) =", mp.nstr(cos_yLmax,22))
print("window (cos(yLmax) - cos(pi/8)) =", mp.nstr(cos_yLmax - cospi8,4))
# Choose C rational in (cos(pi/8), cos(yLmax)), just above cos(pi/8)
for denpow in [14,15,16]:
    Cnum = int(mp.floor(cospi8 * mpf(10)**denpow)) + 1
    C = F(Cnum, 10**denpow)
    Cf = mpf(C.numerator)/mpf(C.denominator)
    closure = 2*(2*Cf*Cf-1)**2-1
    okA = Cf < cos_yLmax
    okB = Cf > cospi8
    print(f"  denpow={denpow}: C={C} ({mp.nstr(Cf,20)}) C>cos(pi/8)? {okB}  C<cos(yLmax)? {okA}  closure>0? {closure>0} ({mp.nstr(closure,4)})")
# split index needed for the LOWER cert (series_lower(yLmax,N) > C)
print("\n  -- split index for LOWER cert (need series_lower(yLmax,N) > C):")
for N in [6,7,8]:
    rem = cosRemBound(yLf, N)
    pc = partialCos(yLf, N)
    print(f"    N={N}: cosRemBound(yLmax,N)={mp.nstr(rem,4)}  partialCos-rem={mp.nstr(pc-rem,20)}")
print()

# ============ UPPER: ceil13, v=cutCos(ceil13/4e13) near pi/8 ============
print("=== UPPER (ceil13): DDA negativity, yU=ceil13/4e13 ===")
yU = F(ceil13, 4*10**13)
yUf = mpf(yU.numerator)/yU.denominator
cos_yU = cos(yUf)
print("yU = ceil13/4/1e13 =", yU, "=", mp.nstr(yUf,18))
print("yU - pi/8 =", mp.nstr(yUf-pi/8,4), " (yU>pi/8? {})".format(yUf>pi/8))
print("v ~ cos(yU) =", mp.nstr(cos_yU,22))
print("cos(pi/8) =", mp.nstr(cospi8,22))
print("window (cos(pi/8)-cos(yU)) =", mp.nstr(cospi8-cos_yU,4))
# Choose R rational in (series_upper(yU,N), cos(pi/8)], just below cos(pi/8)
for denpow in [15,16,17]:
    Rnum = int(mp.floor(cospi8 * mpf(10)**denpow))   # just below cos(pi/8)
    R = F(Rnum,10**denpow)
    Rf = mpf(R.numerator)/mpf(R.denominator)
    closure = 2*(2*Rf*Rf-1)**2-1
    okhi = Rf <= cospi8
    oklo = Rf > cos_yU
    print(f"  denpow={denpow}: R={R} ({mp.nstr(Rf,20)}) R>cos(yU)? {oklo}  R<=cos(pi/8)? {okhi}  closure<=0? {closure<=0} ({mp.nstr(closure,4)})")
# split index for UPPER cert (series_upper(yU,N) <= R)
print("\n  -- split index for UPPER cert (need partialCos(yU,N)+rem <= R):")
for N in [6,7,8]:
    rem = cosRemBound(yUf,N)
    pc = partialCos(yUf,N)
    print(f"    N={N}: partialCos={mp.nstr(pc,22)}  rem={mp.nstr(rem,4)}  cert_upper={mp.nstr(pc+rem,22)}")
print()

# ============ cutPi / 1/cutPi ext8 brackets ============
print("=== cutPi / 1/cutPi ext8 ===")
lcz_lo = F(floor13,10**13); lcz_hi = F(ceil13,10**13)
cutPi_lo = 2*lcz_lo; cutPi_hi = 2*lcz_hi
print("cutPi_lo = 2*floor13/1e13 =", cutPi_lo, "( =", 2*floor13, "/1e13 )")
print("cutPi_hi = 2*ceil13/1e13  =", cutPi_hi, "( =", 2*ceil13, "/1e13 )")
inv_lo = F(1,1)/cutPi_hi
inv_hi = F(1,1)/cutPi_lo
print("1/cutPi_lo (= 1/cutPi_hi) =", inv_lo, "=", mp.nstr(mpf(inv_lo.numerator)/inv_lo.denominator,20))
print("1/cutPi_hi (= 1/cutPi_lo) =", inv_hi, "=", mp.nstr(mpf(inv_hi.numerator)/inv_hi.denominator,20))
print("width ext8 =", mp.nstr(mpf((inv_hi-inv_lo).numerator)/(inv_hi-inv_lo).denominator,4))
# nested inside ext7 [100000000000/314159265359, 250000000000/785398163397]?
e7lo = F(100000000000,314159265359); e7hi = F(250000000000,785398163397)
print("width ext7 =", mp.nstr(mpf((e7hi-e7lo).numerator)/(e7hi-e7lo).denominator,4))
print("nested in ext7? lo>=e7lo?", inv_lo >= e7lo, " hi<=e7hi?", inv_hi <= e7hi)
print("true 1/pi =", mp.nstr(1/pi,22), " inside ext8?", float(inv_lo)<float(1/pi)<float(inv_hi))
