from fractions import Fraction as F
wlo=F(1414213,10**6); whi=F(1414214,10**6)
plo=F(975410,10**6); phi=F(975411,10**6)
rlo=F(381732,10**6); rhi=F(381742,10**6)
# tight products
WPlo=wlo*plo; WPhi=whi*phi
WRlo=wlo*rlo; WRhi=whi*rhi
print("w*p tight [",float(WPlo),",",float(WPhi),"]")
print("w*r tight [",float(WRlo),",",float(WRhi),"]")
# choose ROUNDED product brackets (outer) that le_trans can prove:
# WPlo>=1.37943 -> use 137943/100000 ; WPhi<=1.37944 -> 137944/100000
WPlo_s=F(137943,10**5); WPhi_s=F(137944,10**5)
WRlo_s=F(53984,10**5); WRhi_s=F(53987,10**5)
print("WPlo_s<=WPlo?",WPlo_s<=WPlo," WPhi_s>=WPhi?",WPhi_s>=WPhi)
print("WRlo_s<=WRlo?",WRlo_s<=WRlo," WRhi_s>=WRhi?",WRhi_s>=WRhi)
# amplitude brackets from ROUNDED products
b1lo=1-(WPhi_s+WRhi_s)/2   # 1 - (w*p+w*r)/2 lower
b1hi=1-(WPlo_s+WRlo_s)/2
b2lo=1-(WPhi_s-WRlo_s)/2
b2hi=1-(WPlo_s-WRhi_s)/2
a0lo=1+WPlo_s
a0hi=1+WPhi_s
print("b1 [",float(b1lo),",",float(b1hi),"]")
print("b2 [",float(b2lo),",",float(b2hi),"]")
print("a0 [",float(a0lo),",",float(a0hi),"]")
# round amplitude brackets to clean decimals for square step
b1lo_s=F(4034,10**5); b1hi_s=F(4036,10**5)   # 0.04034..0.04036
b2lo_s=F(58020,10**5); b2hi_s=F(58022,10**5)
a0lo_s=F(237943,10**5); a0hi_s=F(237944,10**5)
ok=[]
ok.append(("b1lo_s<=b1lo",b1lo_s<=b1lo));ok.append(("b1hi_s>=b1hi",b1hi_s>=b1hi))
ok.append(("b2lo_s<=b2lo",b2lo_s<=b2lo));ok.append(("b2hi_s>=b2hi",b2hi_s>=b2hi))
ok.append(("a0lo_s<=a0lo",a0lo_s<=a0lo));ok.append(("a0hi_s>=a0hi",a0hi_s>=a0hi))
# ratio checks
ok.append(("R1lo b1lo_s^2>=0.00483 b2hi_s^2", b1lo_s**2>=F(483,100000)*b2hi_s**2))
ok.append(("R1hi b1hi_s^2<=0.00485 b2lo_s^2", b1hi_s**2<=F(485,100000)*b2lo_s**2))
ok.append(("R2lo b2lo_s^2>=0.0594 a0hi_s^2", b2lo_s**2>=F(594,10000)*a0hi_s**2))
ok.append(("R2hi b2hi_s^2<=0.0595 a0lo_s^2", b2hi_s**2<=F(595,10000)*a0lo_s**2))
for n,v in ok: print(f"  {n}: {v}")
print("all:", all(v for _,v in ok))
print("\nLean constants:")
for n,v in [("WPlo",WPlo_s),("WPhi",WPhi_s),("WRlo",WRlo_s),("WRhi",WRhi_s),
            ("b1lo",b1lo_s),("b1hi",b1hi_s),("b2lo",b2lo_s),("b2hi",b2hi_s),("a0lo",a0lo_s),("a0hi",a0hi_s)]:
    print(f"  {n} = {v}")
