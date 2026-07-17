from fractions import Fraction as F
from mpmath import mp, mpf
mp.dps = 60

d = F(16,3)
# NEW cutLog bracket
clL = F(81540605,10**7); clH = F(81540621,10**7)
# 1/cutPi options
# parent (D5-next-5): [10000000/31415928, 1000000/3141592]
ipL_p = F(10000000,31415928); ipH_p = F(1000000,3141592)

def assembled(clL,clH,ipL,ipH):
    lo = F(190,3) + (d/3)*clL*ipL
    hi = F(190,3) + (d/3)*clH*ipH
    return lo,hi

lo,hi = assembled(clL,clH,ipL_p,ipH_p)
print("=== NEW cutLog + parent 1/cutPi ===")
print("assembled width =", float(hi-lo))
# contribution split: hold one residual at midpoint
ipM = (ipL_p+ipH_p)/2; clM=(clL+clH)/2
w_from_cutLog = (d/3)*ipM*(clH-clL)
w_from_invPi  = (d/3)*clM*(ipH_p-ipL_p)
print("  cutLog contributes ~", float(w_from_cutLog))
print("  1/cutPi contributes ~", float(w_from_invPi))

# parent assembled: [800488690/11780973, 80048852/1178097]
plo=F(800488690,11780973); phi=F(80048852,1178097)
print("  parent width =", float(phi-plo), " improvement=", float((phi-plo)/(hi-lo)))
print("  nested? plo<=lo:", plo<=lo, " hi<=phi:", hi<=phi)

# exact fraction endpoints of new assembled
print("\n  new lo exact =", lo, "=", float(lo))
print("  new hi exact =", hi, "=", float(hi))

# Now try ALSO pushing 1/cutPi via finer double-angle grid.
# Upper: cutCos(c)<0 for smallest c>pi/2 on 1e8 grid => c=157079633/1e8
# Lower: cutCos positive up to x<X via double-angle needs cutCos(y)>1/sqrt2 for y<X/2.
# True pi/2 = 1.5707963267948966; pi/4=0.7853981633974483; 1/sqrt2=0.70710678118654752
# parent x_lo=15707960/1e7=1.5707960 (y<0.7853980). Push to finer 1e8: x_lo=157079625/1e8=1.57079625?
import mpmath
pi2 = mpmath.pi/2; pi4=mpmath.pi/4; invs2=1/mpmath.sqrt(2)
print("\n  pi/2 =", mpmath.nstr(pi2,12), " pi/4=",mpmath.nstr(pi4,12), " 1/sqrt2=",mpmath.nstr(invs2,12))
# check double-angle threshold: need L with L^2>1/2 and cutCos(y)>L for y<X/2.
# For x_lo candidate, y_max=x_lo/2. cutCos(y_max) must exceed some L>1/sqrt2 with 2L^2-1>0 giving cutCos(x_lo)>0.
for xnum,scale in [(157079620,10**8),(157079625,10**8),(157079630,10**8),(15707962,10**7),(15707963,10**7)]:
    x = mpf(xnum)/mpf(scale)
    y = x/2
    cy = mpmath.cos(y)
    cx = mpmath.cos(x)
    # need an L (rational) with 1/sqrt2 < L < cy and 2L^2-1>0 => automatically if L>1/sqrt2
    Lmargin = float(cy - invs2)
    print("  x_lo=%d/%d=%.8f  y=%.8f cutCos(y)=%.9f (margin over 1/sqrt2=%.2e)  cutCos(x)=%.2e" % (xnum,scale,float(x),float(y),float(cy),Lmargin,float(cx)))
# upper c candidates
for cnum,scale in [(157079633,10**8),(157079634,10**8),(15707964,10**7)]:
    c=mpf(cnum)/mpf(scale); cc=mpmath.cos(c)
    print("  x_hi=%d/%d=%.8f cutCos=%.2e (%s)"%(cnum,scale,float(c),float(cc),"neg OK" if cc<0 else "POS - too small"))
