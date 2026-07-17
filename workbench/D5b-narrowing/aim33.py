from fractions import Fraction as F
import math
# Option S5: split@5 lower z_lo=15707704, split@6 upper z_hi=15707970
# Option S6: split@6 lower with x^2<2.46734 -> z_lo = floor(sqrt(2.46734)*1e7)
z_s5=15707704
z_s6=int(math.isqrt(246734*10**8))  # sqrt(2.46734)*1e7 = sqrt(246734/1e5)*1e7 = sqrt(246734*1e9)/... 
# 2.46734 = 246734/100000 ; x < sqrt(2.46734) ; z_lo/1e7 < sqrt(2.46734) -> z_lo < sqrt(2.46734)*1e7
z_s6 = int(math.sqrt(2.46734)*1e7)
print("split@6 lower z_lo (x^2<2.46734):", z_s6, "=",z_s6/1e7)
zhi=15707970
CL_LO=F(815405,10**5); CL_HI=F(815411,10**5)
d=F(16,3); DEN=10**7
par_lo=F(9606370,141381); par_hi=F(9605390,141363)
for tag,zlo in [("S5",z_s5),("S6@2.46734",z_s6)]:
    ip_lo=F(DEN,2*zhi); ip_hi=F(DEN,2*zlo)
    lo=F(190,3)+d/3*CL_LO*ip_lo
    hi=F(190,3)+d/3*CL_HI*ip_hi
    print("%s: zlo=%d 1/cutPi width=%.2e  assembled ~[%.7f,%.7f] width=%.3e (%.1fx) nested %s/%s"%(
        tag,zlo,float(ip_hi-ip_lo),float(lo),float(hi),float(hi-lo),0.00172/float(hi-lo),lo>=par_lo,hi<=par_hi))
# What if I make z_hi tighter via split@6 upper reaching 15707964? check earlier: 15707964 needs rem tighter.
# Actually split@6 upper smallest z_hi from aim14 was 15707964. Let me check assembled with zhi=15707964.
for zhi2 in [15707970,15707966,15707964]:
    zlo=z_s6
    ip_lo=F(DEN,2*zhi2); ip_hi=F(DEN,2*zlo)
    lo=F(190,3)+d/3*CL_LO*ip_lo
    hi=F(190,3)+d/3*CL_HI*ip_hi
    print("zhi=%d: assembled width=%.3e (%.1fx)"%(zhi2,float(hi-lo),0.00172/float(hi-lo)))
