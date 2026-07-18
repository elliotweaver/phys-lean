import mpmath as mp
from fractions import Fraction as F
mp.mp.dps=100
pi=mp.pi

def show(name,fr):
    print(f"{name} = {fr}  ~ {mp.nstr(mp.mpf(fr.numerator)/fr.denominator,18)}")

# ---- cutPi bracket (banked cutPi_bracket_ext2) ----
piLo=F(31415924,10**7); piHi=F(78539817,25000000)
print("cutPi in", float(piLo), float(piHi), " true", mp.nstr(pi,15))
# cutPi/3 bracket
plo=piLo/3; phi=piHi/3
print("cutPi/3 in [%.9f, %.9f] true %.9f"%(float(plo),float(phi),float(pi/3)))
# choose clean rational enclosing for the ARGUMENT to feed partialExp: need a<=cutPi/3<=b, a,b>0.
aArg=F(1047197,10**6); bArg=F(1047198,10**6)
assert aArg<=plo and phi<=bArg, (float(aArg),float(plo),float(phi),float(bArg))
print("arg bracket aArg<=cutPi/3<=bArg:", float(aArg), float(bArg))

# ---- partialExp / expRemBound over Q ----
def partialExp(q,N):
    s=F(0)
    import math
    for i in range(N):
        s+= q**i / math.factorial(i)
    return s
def expRemBound(q,N):
    import math
    return (q**N / math.factorial(N)) * (1/(1 - q/(N+1)))

N=12
peLo=partialExp(aArg,N)              # <= cutExp(aArg) <= cutExp(cutPi/3)
peHi=partialExp(bArg,N)+expRemBound(bArg,N)  # >= cutExp(bArg) >= cutExp(cutPi/3)
print("partialExp(aArg,%d) ~"%N, mp.nstr(mp.mpf(peLo.numerator)/peLo.denominator,18))
print("partialExp(bArg,%d)+rem ~"%N, mp.nstr(mp.mpf(peHi.numerator)/peHi.denominator,18))
print("true cutExp(pi/3) =", mp.nstr(mp.e**(pi/3),18))
# clean rational E bracket
Elo=F(284965,10**5); Ehi=F(284966,10**5)
print("Elo<=partialExp(aArg,N)?", Elo<=peLo, "  partialExp(bArg,N)+rem<=Ehi?", peHi<=Ehi)
print("Elo,Ehi=",float(Elo),float(Ehi))
assert Elo<=peLo and peHi<=Ehi

# ---- ewClosureRatio = (E^28)^{-1},  E in [Elo,Ehi] ----
trueEw=mp.e**(-28*pi/3)
print("true ew =", mp.nstr(trueEw,20))
# ewlo <= 1/Ehi^28  <=> ewlo*Ehi^28 <= 1 ; 1/Elo^28 <= ewhi <=> 1 <= ewhi*Elo^28
ewlo=F(184405,10**18); ewhi=F(184445,10**18)
print("ewlo*Ehi^28<=1?", ewlo*(Ehi**28) <= 1, "  1<=ewhi*Elo^28?", 1 <= ewhi*(Elo**28))
print("ewlo,ewhi=", mp.nstr(mp.mpf(ewlo.numerator)/ewlo.denominator,12), mp.nstr(mp.mpf(ewhi.numerator)/ewhi.denominator,12))
assert ewlo*(Ehi**28) <= 1 and 1 <= ewhi*(Elo**28)

# ---- cutCos(pi/8) bracket ----
# cos(pi/4) in [c4lo,c4hi] from cos(pi/4)^2=1/2, cos>0
c4lo=F(7071,10**4); c4hi=F(707107,10**6)
print("c4lo^2<=1/2<=c4hi^2?", c4lo*c4lo<=F(1,2)<=c4hi*c4hi)
# cos(pi/8)^2 = (1+cos(pi/4))/2 in [(1+c4lo)/2,(1+c4hi)/2]
s8lo=(1+c4lo)/2; s8hi=(1+c4hi)/2
# cos(pi/8) in [c8lo,c8hi]: c8lo^2<=s8lo and s8hi<=c8hi^2
c8lo=F(92387,10**5); c8hi=F(92388,10**5)
print("c8lo^2<=s8lo?", c8lo*c8lo<=s8lo, " s8hi<=c8hi^2?", s8hi<=c8hi*c8hi)
print("cos(pi/8) true", mp.nstr(mp.cos(pi/8),15), " bracket", float(c8lo), float(c8hi))
assert c4lo*c4lo<=F(1,2)<=c4hi*c4hi
assert c8lo*c8lo<=s8lo and s8hi<=c8hi*c8hi

# ---- cutCos(2/3) bracket (banked cutCos_two_thirds_bounds) ----
c23lo=F(191,243)-F(56,455625); c23hi=F(191,243)+F(56,455625)
print("cos(2/3) bracket", mp.nstr(mp.mpf(c23lo.numerator)/c23lo.denominator,12), mp.nstr(mp.mpf(c23hi.numerator)/c23hi.denominator,12), " true", mp.nstr(mp.cos(mp.mpf(2)/3),12))
surv=F(2,3)

# ---- massScale bracket = ew * c8 * surv * c23 ----
Slo=ewlo*c8lo*surv*c23lo; Shi=ewhi*c8hi*surv*c23hi
trueS=trueEw*mp.cos(pi/8)*mp.mpf(2)/3*mp.cos(mp.mpf(2)/3)
print("massScale in [%s, %s] true %s"%(mp.nstr(mp.mpf(Slo.numerator)/Slo.denominator,14),
      mp.nstr(mp.mpf(Shi.numerator)/Shi.denominator,14), mp.nstr(trueS,14)))
assert float(Slo) < float(trueS) < float(Shi)

# ---- mass_k brackets (banked N340) ----
m0lo=F(237943,10**5)**2; m0hi=F(237944,10**5)**2
m1lo=F(4034,10**5)**2;   m1hi=F(40365,10**6)**2
m2lo=F(5802,10**4)**2;   m2hi=F(58022,10**5)**2
for nm,lo,hi,tv in [("mass0",m0lo,m0hi,(mp.mpf('2.379435'))**2),
                    ("mass1",m1lo,m1hi,None),("mass2",m2lo,m2hi,None)]:
    print(nm,"in [%s,%s]"%(mp.nstr(mp.mpf(lo.numerator)/lo.denominator,12),mp.nstr(mp.mpf(hi.numerator)/hi.denominator,12)))

# ---- absMass_k = massScale * mass_k  ->  [Slo*mklo, Shi*mkhi] ----
for k,(mlo,mhi) in enumerate([(m0lo,m0hi),(m1lo,m1hi),(m2lo,m2hi)]):
    lo=Slo*mlo; hi=Shi*mhi
    print("absMass%d in [%s, %s]  relwidth ~ %.2e"%(k,
        mp.nstr(mp.mpf(lo.numerator)/lo.denominator,12),
        mp.nstr(mp.mpf(hi.numerator)/hi.denominator,12),
        float((hi-lo)/lo)))
print("ALL ASSERTIONS PASSED")
