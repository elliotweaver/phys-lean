from fractions import Fraction as F
# split@5 lower with TIGHTER factor f. cosRemBound x 5 = (x^10/10!)*(1-x^2/132)^-1.
# If x^2 < B, then (1-x^2/132)^-1 <= (1-B/132)^-1 = f. 
# poly_f = 1 -x²/2 +x⁴/24 -x⁶/720 +x⁸/40320 - f*x^10/3628800
# with f = 132/(132-B). Find largest z_lo where poly_f(z_lo^2)>0.
def polyf(x2, B):
    f = F(132,1)/(132-B)  # upper bound on factor for x^2<=B
    return 1 - x2/2 + x2**2/24 - x2**3/720 + x2**4/40320 - f*x2**5/F(3628800)
# For each candidate z_lo, B=z_lo^2, check poly with f from B
import math
lo,hi=15700000,15707963
while hi-lo>1:
    mid=(lo+hi)//2
    x2=F(mid*mid,10**14)
    B=x2
    if polyf(x2,B)>0: lo=mid
    else: hi=mid
print("split@5 (tight factor) LOWER largest z_lo=",lo,"=",lo/1e7," (vs <=2 factor: 15707706)")
# But nlinarith margin! The poly needs margin. Test with margin -- back off.
for zc in [lo, lo-30, lo-60, 15707850, 15707800]:
    x2=F(zc*zc,10**14)
    B=x2
    print("z_lo=%d polyf=%.3e"%(zc,float(polyf(x2,B))))
