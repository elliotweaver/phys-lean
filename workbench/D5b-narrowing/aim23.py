from fractions import Fraction as F
from math import factorial, log, sqrt, pi
import math

def pCos(x,N): return sum(F((-1)**i)*x**(2*i)/F(factorial(2*i)) for i in range(N))
def cRem(x,N): return (x**(2*N)/F(factorial(2*N)))*(1/(1-x*x/F((2*N+1)*(2*N+2))))
DEN=10**7
print("pi/2 = %.10f = %d/1e7"%(pi/2, round(pi/2*DEN)))

# reach reminders (aim14): split@5 LOWER z_lo<=15707953 ; split@4 UPPER z_hi>=15708470;
#   split@6 LOWER z_lo<=15707953 ; split@6 UPPER z_hi>=15707964 ; split@7 LOWER z_lo<=15707962
def lowpos(num,N):
    x=F(num,DEN); return (pCos(x,N)-cRem(x,N))>0
def upneg(num,N):
    x=F(num,DEN); return (pCos(x,N)+cRem(x,N))<0

# Option A: split@5 lower (z_lo=15707950), split@4 upper (z_hi=15708470) -- cheap, degree-10 poly known-OK
zloA=15707950; zhiA=15708470
print("A: low@5(%d)=%s up@4(%d)=%s"%(zloA,lowpos(zloA,5),zhiA,upneg(zhiA,4)))
# Option B: split@5 lower (15707950), split@6 upper (15707970) -- tighter, needs degree-? upper via partialCos6 sign
zloB=15707950; zhiB=15707970
print("B: low@5(%d)=%s up@6(%d)=%s"%(zloB,lowpos(zloB,5),zhiB,upneg(zhiB,6)))
# Option C: split@7 lower (15707960), split@6 upper (15707970) -- tightest but deg-14 lower poly (W9 risk)
zloC=15707960; zhiC=15707970
print("C: low@7(%d)=%s up@6(%d)=%s"%(zloC,lowpos(zloC,7),zhiC,upneg(zhiC,6)))

def ipwidth(zlo,zhi):
    ip_lo=F(DEN,2*zhi); ip_hi=F(DEN,2*zlo)  # 1/cutPi=1/(2*leastZero); leastZero in [zlo,zhi]/1e7
    return ip_lo,ip_hi,float(ip_hi-ip_lo)
for tag,zlo,zhi in [("A",zloA,zhiA),("B",zloB,zhiB),("C",zloC,zhiC)]:
    il,ih,w=ipwidth(zlo,zhi)
    print("  %s 1/cutPi=[%s,%s] width=%.2e"%(tag,il,ih,w))

# For the UPPER split@6 sign, the partialCos6(x)+rem must be <0. partialCos6 itself is negative there.
# The 'upneg' at split@6 requires partialCos(x,6) computable; sign proof: partialCos6<0 AND rem small.
# Check partialCos(zhiB,6) exact sign and value:
x=F(zhiB,DEN)
print("partialCos(zhiB,6)=%.3e  cRem6=%.3e  sum=%.3e"%(float(pCos(x,6)),float(cRem(x,6)),float(pCos(x,6)+cRem(x,6))))
# And the degree-10 lower poly at zloB (split@5 positivity, the nlinarith target):
x=F(zloB,DEN)
poly=1 - x**2/2 + x**4/24 - x**6/720 + x**8/40320 - x**10/F(1814400)
print("split@5 lower poly at zloB=%.6e (need >0, and it's the deg-10 nlinarith)"%float(poly))
print("zloB^2=%.10f  (need < (2*5+1)(2*5+2)=132 for bracket validity: yes)"%float(x*x))
