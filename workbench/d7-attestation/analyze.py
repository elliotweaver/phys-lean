from mpmath import mp, mpf, cos, sqrt, log, pi
mp.dps = 60
p = cos(mpf(2)/9)
w = sqrt(2)
r = sqrt(3 - 3*p*p)
b0 = 1 + w*p
b1 = 1 - w*(p+r)/2
b2 = 1 - w*(p-r)/2
print("p  =", p)
print("w  =", w)
print("r  =", r)
print("b0 =", b0)
print("b1 =", b1)
print("b2 =", b2)
mass0 = b0*b0; mass1 = b1*b1; mass2 = b2*b2
print("mass0 =", mass0)
print("mass1 =", mass1)
print("mass2 =", mass2)
m01 = mass0/mass1
print("mass0/mass1 =", m01)
print("cutLog(m01) =", log(m01))
print("cutLog mass0 =", log(mass0))
print("cutLog mass2 =", log(mass2))
print("1/pi =", 1/pi)
print("kappa = (1/pi)/3 =", (1/pi)/3)
# current banked m01 bracket
lo = mpf(1000000000)/288575
hi = mpf(1000000000)/286902
print("banked m01 lo =", lo, " log:", log(lo))
print("banked m01 hi =", hi, " log:", log(hi))
print("banked m01 width =", hi-lo)
