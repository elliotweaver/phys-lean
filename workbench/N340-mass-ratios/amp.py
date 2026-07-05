from fractions import Fraction as F
Plo=F(975410,10**6); Phi=F(975411,10**6)
rlo=F(381732,10**6); rhi=F(381742,10**6)
wlo=F(1414213,10**6); whi=F(1414214,10**6)
a0lo = 1 + wlo*Plo; a0hi = 1 + whi*Phi
a1lo = 1 - whi*(Phi+rhi)/2; a1hi = 1 - wlo*(Plo+rlo)/2
a2lo = 1 - whi*(Phi-rlo)/2; a2hi = 1 - wlo*(Plo-rhi)/2
print("a0 in [",float(a0lo),",",float(a0hi),"]")
print("a1 in [",float(a1lo),",",float(a1hi),"]  both>0?", a1lo>0, a1hi>0)
print("a2 in [",float(a2lo),",",float(a2hi),"]  both>0?", a2lo>0, a2hi>0)
m0lo,m0hi=a0lo**2,a0hi**2
m1lo,m1hi=a1lo**2,a1hi**2
m2lo,m2hi=a2lo**2,a2hi**2
print("m0 in [",float(m0lo),",",float(m0hi),"]")
print("m1 in [",float(m1lo),",",float(m1hi),"]")
print("m2 in [",float(m2lo),",",float(m2hi),"]")
print("m1/m2 in [", float(m1lo/m2hi),",", float(m1hi/m2lo),"]")
print("m2/m0 in [", float(m2lo/m0hi),",", float(m2hi/m0lo),"]")
print("R1>=0.00483 ?", m1lo/m2hi >= F(483,100000), " <=0.00485 ?", m1hi/m2lo <= F(485,100000))
print("R2>=0.0594 ?", m2lo/m0hi >= F(594,10000), " <=0.0595 ?", m2hi/m0lo <= F(595,10000))
print("a1lo^2 >= 0.00483*a2hi^2 ?", m1lo >= F(483,100000)*m2hi)
print("a1hi^2 <= 0.00485*a2lo^2 ?", m1hi <= F(485,100000)*m2lo)
print("a2lo^2 >= 0.0594*a0hi^2 ?", m2lo >= F(594,10000)*m0hi)
print("a2hi^2 <= 0.0595*a0lo^2 ?", m2hi <= F(595,10000)*m0lo)
for nm,v in [("a0lo",a0lo),("a0hi",a0hi),("a1lo",a1lo),("a1hi",a1hi),("a2lo",a2lo),("a2hi",a2hi)]:
    print(f"  {nm} = {float(v):.10f}")
