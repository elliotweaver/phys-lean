from fractions import Fraction as F
import math
# Use clean factor f = 103/100 (=1.03). Valid if (1-x^2/132)^-1 <= 1.03, i.e. 1-x^2/132 >= 100/103,
# i.e. x^2/132 <= 3/103, i.e. x^2 <= 396/103 = 3.844. Always true here (x^2~2.47). Good, f=103/100 valid.
# poly_103 = 1 -x²/2 +x⁴/24 -x⁶/720 +x⁸/40320 - (103/100)*x^10/3628800
def poly103(x2):
    return 1 - x2/2 + x2**2/24 - x2**3/720 + x2**4/40320 - F(103,100)*x2**5/F(3628800)
lo,hi=15700000,15707963
while hi-lo>1:
    mid=(lo+hi)//2
    if poly103(F(mid*mid,10**14))>0: lo=mid
    else: hi=mid
print("f=1.03 split@5 LOWER reach z_lo=",lo,"=",lo/1e7)
for zc in [lo,lo-30,15707850,15707800,15707750]:
    print("z_lo=%d poly103=%.3e"%(zc,float(poly103(F(zc*zc,10**14)))))
# check f=103/100 validity: need (1-x^2/132)^-1 <= 103/100 for x^2<=B
# equiv 100 <= 103*(1-B/132) i.e. 100 <= 103 - 103B/132 i.e. 103B/132 <= 3 i.e. B <= 396/103=3.8447
print("f=1.03 valid up to x^2 <=",float(F(396,103)))
# assembled with z_lo=15707850 (margin 1e-5), z_hi=15707970 (split@6 upper)
CL_LO=F(815405,10**5); CL_HI=F(815411,10**5); d=F(16,3); DEN=10**7
par_lo=F(9606370,141381); par_hi=F(9605390,141363)
for zlo in [15707850,15707900,15707920]:
    zhi=15707970
    ip_lo=F(DEN,2*zhi); ip_hi=F(DEN,2*zlo)
    lo_a=F(190,3)+d/3*CL_LO*ip_lo; hi_a=F(190,3)+d/3*CL_HI*ip_hi
    print("zlo=%d: assembled ~[%.7f,%.7f] width=%.3e (%.1fx) nested %s/%s"%(zlo,float(lo_a),float(hi_a),float(hi_a-lo_a),0.00172/float(hi_a-lo_a),lo_a>=par_lo,hi_a<=par_hi))
