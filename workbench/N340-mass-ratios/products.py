from fractions import Fraction as F
wlo=F(1414213,10**6); whi=F(1414214,10**6)
plo=F(975410,10**6); phi=F(975411,10**6)
rlo=F(381732,10**6); rhi=F(381742,10**6)
WPlo=wlo*plo; WPhi=whi*phi
WRlo=wlo*rlo; WRhi=whi*rhi
print("w*p in [",WPlo,",",WPhi,"]")
print("w*r in [",WRlo,",",WRhi,"]")
b1lo=1-(WPhi+WRhi)/2      # lower bound b1
b2hi=1-(WPlo-WRhi)/2      # upper bound b2
b2lo=1-(WPhi-WRlo)/2      # lower bound b2 (positivity)
a0lo=1+WPlo               # lower bound a0
a0hi=1+WPhi
print("b1lo=",float(b1lo)," b2hi=",float(b2hi)," b2lo=",float(b2lo))
print("a0lo=",float(a0lo)," a0hi=",float(a0hi))
# ratio R1 = m1/m2 = b1^2/b2^2 : lower 0.00483, upper 0.00485
print("R1 lower needs b1lo^2 >= 0.00483*b2hi^2:", b1lo**2 >= F(483,100000)*b2hi**2)
# upper R1: b1hi^2 <= 0.00485*b2lo^2. b1hi = 1-(WPlo+WRlo)/2
b1hi=1-(WPlo+WRlo)/2
print("b1hi=",float(b1hi))
print("R1 upper needs b1hi^2 <= 0.00485*b2lo^2:", b1hi**2 <= F(485,100000)*b2lo**2)
# ratio R2 = m2/m0 = b2^2/a0^2: lower 0.0594 upper 0.0595
print("R2 lower needs b2lo^2 >= 0.0594*a0hi^2:", b2lo**2 >= F(594,10000)*a0hi**2)
print("R2 upper needs b2hi^2 <= 0.0595*a0lo^2:", b2hi**2 <= F(595,10000)*a0lo**2)
# print exact fractions for Lean (as decimals over powers of 10 where clean)
print("\nFor Lean bracket constants (rational, exact):")
print("b1lo =",b1lo, "=", float(b1lo))
print("b1hi =",b1hi, "=", float(b1hi))
print("b2lo =",b2lo, "=", float(b2lo))
print("b2hi =",b2hi, "=", float(b2hi))
print("a0lo =",a0lo, "=", float(a0lo))
print("a0hi =",a0hi, "=", float(a0hi))
# choose simpler rounded brackets that still work
def dn(x,d): 
    from fractions import Fraction as F
    import math
    return x
# simple decimals:
b1lo_s=F(40347,10**6); b1hi_s=F(40357,10**6)
b2lo_s=F(5802,10**4); b2hi_s=F(58022,10**5)
a0lo_s=F(23794,10**4); a0hi_s=F(237944,10**5)
print("\nSimplified brackets check:")
print(" b1lo_s<=b1lo?",b1lo_s<=b1lo," b1hi_s>=b1hi?",b1hi_s>=b1hi)
print(" b2lo_s<=b2lo?",b2lo_s<=b2lo," b2hi_s>=b2hi?",b2hi_s>=b2hi)
print(" a0lo_s<=a0lo?",a0lo_s<=a0lo," a0hi_s>=a0hi?",a0hi_s>=a0hi)
print(" R1lo: b1lo_s^2>=0.00483*b2hi_s^2?", b1lo_s**2>=F(483,100000)*b2hi_s**2)
print(" R1hi: b1hi_s^2<=0.00485*b2lo_s^2?", b1hi_s**2<=F(485,100000)*b2lo_s**2)
print(" R2lo: b2lo_s^2>=0.0594*a0hi_s^2?", b2lo_s**2>=F(594,10000)*a0hi_s**2)
print(" R2hi: b2hi_s^2<=0.0595*a0lo_s^2?", b2hi_s**2<=F(595,10000)*a0lo_s**2)
