"""
W9 DESIGN + COST for the 1e12-grid leastCosZero instrument (ext7).
LOWER: double-double-angle positivity, cutCos(x)>0 for x<floor12/1e12 (y=x/4 near pi/8).
UPPER: two routes to certify cutCos(ceil12/1e12)<0:
  (a) direct split@N bracket at x~1.57
  (b) double-double-angle NEGATIVITY: cutCos(x)<0 <=> cutCos(x/4)<R (R~cos(pi/8)), split@7 near pi/8.
"""
from fractions import Fraction as F
from mpmath import mp, mpf, pi, cos, sin, sqrt, factorial, floor
mp.dps = 80

g12 = mpf(10)**12
pi2 = pi/2
floor12 = int(mp.floor(pi2*g12))
ceil12 = floor12 + 1
print("floor12 =", floor12, "(pi/2*1e12 =", mp.nstr(pi2*g12,18), ")")
print("ceil12  =", ceil12)
xL = mpf(floor12)/g12   # lower tick
xU = mpf(ceil12)/g12    # upper tick
print("xL =", mp.nstr(xL,16), " pi/2-xL =", mp.nstr(pi2-xL,4))
print("xU =", mp.nstr(xU,16), " xU-pi/2 =", mp.nstr(xU-pi2,4))
print()

def cosRemBound(x, N):
    x = mpf(x)
    term = x**(2*N)/factorial(2*N)
    fac = 1/(1 - x**2/((2*N+1)*(2*N+2)))
    return term*fac

def partialCos(x, N):
    x = mpf(x)
    return sum((-1)**i * x**(2*i)/factorial(2*i) for i in range(N))

# ============ LOWER: double-double-angle positivity for cutCos(x)>0, x<xL ============
print("=== LOWER (floor12): DDA positivity, y=x/4 near pi/8 ===")
yLmax = xL/4
print("yLmax = xL/4 =", mp.nstr(yLmax,16), " pi/8 =", mp.nstr(pi/8,16), " pi/8-yLmax =", mp.nstr(pi/8-yLmax,4))
cos_yLmax = cos(yLmax)
print("cos(yLmax) =", mp.nstr(cos_yLmax,20))
# need C < cos(yLmax) AND 2(2C^2-1)^2-1 > 0 (i.e. C > cos(pi/8))
cospi8 = cos(pi/8)
print("cos(pi/8) =", mp.nstr(cospi8,20))
# choose C = 13-digit-ish rational strictly between cos(pi/8) and cos(yLmax)
# margin:
print("window (cos(yLmax) - cos(pi/8)) =", mp.nstr(cos_yLmax - cospi8,4))
# pick C rational
for denpow in [13,14,15]:
    Cnum = int(mp.floor(cospi8 * mpf(10)**denpow)) + 1  # just above cos(pi/8)
    C = F(Cnum, 10**denpow)
    okA = mpf(C.numerator)/mpf(C.denominator) < cos_yLmax  # C < cos(yLmax)
    okB = 2*(2*mpf(C.numerator)/mpf(C.denominator)**1*(mpf(C.numerator)/mpf(C.denominator))-1)**2-1  # placeholder
    Cf = mpf(C.numerator)/mpf(C.denominator)
    closure = 2*(2*Cf*Cf-1)**2-1
    print(f"  denpow={denpow}: C={C} ({mp.nstr(Cf,18)}) C<cos(yLmax)? {Cf<cos_yLmax}  closure 2(2C^2-1)^2-1={mp.nstr(closure,4)} (>0? {closure>0})")
print()
# cosRemBound for LOWER cert at split@6, y near pi/8 (~0.3927)
print("cosRemBound(yLmax, 6) =", mp.nstr(cosRemBound(yLmax,6),4), " (window ~", mp.nstr(cos_yLmax-cospi8,4),")")
print("cosRemBound(yLmax, 7) =", mp.nstr(cosRemBound(yLmax,7),4))
print()

# ============ UPPER route (a): direct split@N at xU~1.57 ============
print("=== UPPER (ceil12) route (a): direct split@N at xU~1.57 ===")
cos_xU = cos(xU)
print("cos(xU) =", mp.nstr(cos_xU,4), " |cos(xU)| =", mp.nstr(abs(cos_xU),4))
for N in [8,9,10,11]:
    rem = cosRemBound(xU, N)
    pc = partialCos(xU, N)
    cert_upper = pc + rem   # certified upper bound for cutCos
    print(f"  N={N}: partialCos={mp.nstr(pc,6)} cosRemBound={mp.nstr(rem,4)} cert_upper(=pc+rem)={mp.nstr(cert_upper,6)} (<0? {cert_upper<0})")
print()

# ============ UPPER route (b): DDA negativity cutCos(xU)<0 <=> cutCos(xU/4)<R ============
print("=== UPPER (ceil12) route (b): DDA negativity, v=cutCos(xU/4)<R near pi/8 ===")
yU = xU/4
print("yU = xU/4 =", mp.nstr(yU,16), " pi/8 =", mp.nstr(pi/8,16), " yU-pi/8 =", mp.nstr(yU-pi/8,4))
cos_yU = cos(yU)
print("v = cutCos(xU/4) ~ cos(yU) =", mp.nstr(cos_yU,20))
print("cos(pi/8) =", mp.nstr(cospi8,20))
print("need R: cos(yU) < R <= cos(pi/8). window (cos(pi/8)-cos(yU)) =", mp.nstr(cospi8-cos_yU,4))
# choose R rational in (cos(yU), cos(pi/8)]
for denpow in [13,14,15,16]:
    Rnum = int(mp.floor(cos_yU * mpf(10)**denpow)) + 1
    R = F(Rnum,10**denpow)
    Rf = mpf(R.numerator)/mpf(R.denominator)
    okhi = Rf <= cospi8            # R <= cos(pi/8) => 2(2R^2-1)^2-1 <= 0
    oklo = Rf > cos_yU             # R > cutCos(yU) so bracket can certify
    closure = 2*(2*Rf*Rf-1)**2-1
    print(f"  denpow={denpow}: R={R} ({mp.nstr(Rf,18)}) R>cos(yU)? {oklo} R<=cos(pi/8)? {okhi} closure 2(2R^2-1)^2-1={mp.nstr(closure,4)} (<=0? {closure<=0})")
# split needed for cutCos(yU)<R: cert upper = partialCos@N(yU)+rem@N(yU) < R
print()
for N in [6,7,8]:
    rem = cosRemBound(yU,N); pc = partialCos(yU,N)
    print(f"  N={N} @yU~0.39: partialCos={mp.nstr(pc,18)} rem={mp.nstr(rem,4)} cert_upper={mp.nstr(pc+rem,18)}")
# also need v>1/sqrt2 (for 2v^2-1>0): v~0.9238 > 0.7071 trivially. and closure monotone needs 2v^2-1>0.
print("2*cos(yU)^2-1 =", mp.nstr(2*cos_yU*cos_yU-1,6), " (>0 => cos(xU/2)>0, fine; 1/sqrt2=",mp.nstr(1/sqrt(2),6),")")
