from fractions import Fraction as F
s12lo=F(481,100000); s12hi=F(482,100000)
s23lo=F(561,10000);  s23hi=F(562,10000)
s13lo=F(287,1000000);s13hi=F(288,1000000)
# g(x)=x(1-x): increasing on (0,1/2)
def g(x): return x*(1-x)
# h(x)=x(1-x)^2: increasing on (0,1/3)
def h(x): return x*(1-x)**2
g12lo,g12hi=g(s12lo),g(s12hi)
g23lo,g23hi=g(s23lo),g(s23hi)
h13lo,h13hi=h(s13lo),h(s13hi)
print("g12 [",float(g12lo),float(g12hi),"]")
print("g23 [",float(g23lo),float(g23hi),"]")
print("h13 [",float(h13lo),float(h13hi),"]")
# choose clean rational brackets each containing the band
def clean(lo,hi,label):
    import math
    print(label,"lo>=",float(lo),"hi<=",float(hi))
cg12=(F(4786,10**6),F(4797,10**6)); print("g12 clean",float(cg12[0]),float(cg12[1]),cg12[0]<=g12lo, g12hi<=cg12[1])
cg23=(F(5295,10**5),F(5305,10**5)); print("g23 clean",float(cg23[0]),float(cg23[1]),cg23[0]<=g23lo, g23hi<=cg23[1])
ch13=(F(2868,10**7),F(2879,10**7)); print("h13 clean",float(ch13[0]),float(ch13[1]),ch13[0]<=h13lo, h13hi<=ch13[1])
# product bracket from clean factor brackets
jlo=cg12[0]*cg23[0]*ch13[0]; jhi=cg12[1]*cg23[1]*ch13[1]
print("jMixSq from clean factors [",float(jlo),float(jhi),"]")
# a clean enclosing rational bracket for jMixSq
cj=(F(72,10**9),F(74,10**9)); print("jMixSq clean",float(cj[0]),float(cj[1]),cj[0]<=jlo, jhi<=cj[1])
# J = cutSqrt(jMixSq): need c*c <= jMixSq_lo and jMixSq_hi <= b*b
c=F(268,10**6); b=F(272,10**6)
print("J bracket [",float(c),float(b),"] : c^2=",float(c*c)," <= jlo?",c*c<=jlo,"  b^2=",float(b*b)," >= jhi?",jhi<=b*b)
c2=F(269,10**6); b2=F(271,10**6)
print("J tighter [",float(c2),float(b2),"] : c^2<=jlo?",c2*c2<=cj[0]," b^2>=jhi?",cj[1]<=b2*b2)
