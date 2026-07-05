from fractions import Fraction as F
# rounded product brackets (proven cheap by le_trans)
WPlo=F(137943,10**5); WPhi=F(137944,10**5)
WRlo=F(53984,10**5); WRhi=F(53987,10**5)
# amplitude brackets from rounded products (exact linear combos)
b1lo=1-(WPhi+WRhi)/2; b1hi=1-(WPlo+WRlo)/2
b2lo=1-(WPhi-WRlo)/2; b2hi=1-(WPlo-WRhi)/2
a0lo=1+WPlo; a0hi=1+WPhi
print("exact from rounded products:")
print(" b1 [",float(b1lo),",",float(b1hi),"]")
print(" b2 [",float(b2lo),",",float(b2hi),"]")
print(" a0 [",float(a0lo),",",float(a0hi),"]")
# clean square brackets (outer)
b1lo_s=F(4034,10**5); b1hi_s=F(40365,10**6)
b2lo_s=F(58020,10**5); b2hi_s=F(58022,10**5)
a0lo_s=F(237943,10**5); a0hi_s=F(237944,10**5)
checks=[
 ("b1lo_s<=b1lo",b1lo_s<=b1lo),("b1hi_s>=b1hi",b1hi_s>=b1hi),
 ("b2lo_s<=b2lo",b2lo_s<=b2lo),("b2hi_s>=b2hi",b2hi_s>=b2hi),
 ("a0lo_s<=a0lo",a0lo_s<=a0lo),("a0hi_s>=a0hi",a0hi_s>=a0hi),
 ("R1lo",b1lo_s**2>=F(483,100000)*b2hi_s**2),
 ("R1hi",b1hi_s**2<=F(485,100000)*b2lo_s**2),
 ("R2lo",b2lo_s**2>=F(594,10000)*a0hi_s**2),
 ("R2hi",b2hi_s**2<=F(595,10000)*a0lo_s**2),
]
for n,v in checks: print(f"  {n}: {v}")
print("ALL:", all(v for _,v in checks))
print("\nLean square-bracket constants:")
for n,v in [("b1lo",b1lo_s),("b1hi",b1hi_s),("b2lo",b2lo_s),("b2hi",b2hi_s),("a0lo",a0lo_s),("a0hi",a0hi_s)]:
    print(f"  {n} = {v} = {float(v)}")
