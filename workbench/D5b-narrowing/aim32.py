from fractions import Fraction as F
# split@6 lower positivity poly (<=2 factor): degree-12
# poly6(x) = 1 - x²/2 + x⁴/24 - x⁶/720 + x⁸/40320 - x¹⁰/3628800 + x¹²/(2*12!)? 
# NO: split@6 partialCos has terms up to x^10 (index 0..5), remainder from index 6 ~ x^12/12! * factor.
# cutCos_bracket at N=6: partialCos x 6 - cosRemBound x 6 <= cutCos x
# partialCos x 6 = 1 - x²/2 + x⁴/24 - x⁶/720 + x⁸/40320 - x¹⁰/3628800  (6 terms, i=0..5)
# cosRemBound x 6 = x^12/12! * (1-x²/(13*14))^-1 <= x^12/12! * 2  (if factor<=2)
# poly = partialCos6 - x^12/12!*2 = 1 - x²/2 + x⁴/24 - x⁶/720 + x⁸/40320 - x¹⁰/3628800 - x^12/239500800
def poly6(x2):  # <=2 factor: x^12/12! *2 = x^12/239500800
    from math import factorial
    return 1 - x2/2 + x2**2/24 - x2**3/720 + x2**4/40320 - x2**5/3628800 - x2**6/F(factorial(12)//2)
# largest z_lo where poly6>0
lo,hi=15700000,15707963
while hi-lo>1:
    mid=(lo+hi)//2
    x2=F(mid*mid,10**14)
    if poly6(x2)>0: lo=mid
    else: hi=mid
print("split@6 (<=2) LOWER largest z_lo=",lo,"=",lo/1e7)
print("poly6 at 15707960:",float(poly6(F(15707960**2,10**14))))
print("poly6 at 15707950:",float(poly6(F(15707950**2,10**14))))
print("poly6 at 15707940:",float(poly6(F(15707940**2,10**14))))
# So split@6 lower reaches further. Choose z_lo just below reach.
zlo=lo-2
zhi=15707970
DEN=10**7
ip_lo=F(DEN,2*zhi); ip_hi=F(DEN,2*zlo)
print("chosen z_lo=%d z_hi=%d 1/cutPi width=%.2e"%(zlo,zhi,float(ip_hi-ip_lo)))
CL_LO=F(815405,10**5); CL_HI=F(815411,10**5)
d=F(16,3)
lo_a=F(190,3)+d/3*CL_LO*ip_lo
hi_a=F(190,3)+d/3*CL_HI*ip_hi
par_lo=F(9606370,141381); par_hi=F(9605390,141363)
print("assembled ~[%.7f,%.7f] width=%.3e (%.1fx tighter) nested %s/%s"%(float(lo_a),float(hi_a),float(hi_a-lo_a),0.00172/float(hi_a-lo_a),lo_a>=par_lo,hi_a<=par_hi))
