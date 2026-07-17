from fractions import Fraction as F
zlo=15707947
print("z_lo^2 = %d/1e14 = %.10f"%(zlo*zlo, zlo*zlo/1e14))
import math
B=F(math.ceil(zlo*zlo/1e14*10**7),10**7)
print("clean B=%s=%.10f"%(B,float(B)))
def poly6(x2):
    from math import factorial
    return 1 - x2/2 + x2**2/24 - x2**3/720 + x2**4/40320 - x2**5/3628800 - x2**6/F(factorial(12)//2)
print("poly6(z_lo^2)=%.3e poly6(B)=%.3e"%(float(poly6(F(zlo*zlo,10**14))),float(poly6(B))))
print("x^2 < (2*6+1)(2*6+2) = 13*14 = 182 ? z_lo^2=%.4f yes"%(zlo*zlo/1e14))
