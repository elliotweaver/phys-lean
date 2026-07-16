from fractions import Fraction as F
import math
x=F(79,50)
p4 = 1 - x**2/2 + x**4/24 - x**6/720
print('partialCos4(79/50) =', p4, '=', float(p4))
rem4 = (x**8/F(math.factorial(8)))/(1 - x**2/F(90))
print('cosRemBound4(79/50) =', float(rem4), 'exact', rem4)
print('p4+rem4 =', float(p4+rem4), '(want <0)  exact', p4+rem4)
print()
zl=F(157,100); t=zl**2
print('zl=157/100, t=zl^2=',t,float(t))
Q5 = 1 - t/2 + t**2/24 - t**3/720 + t**4/40320 - 2*t**5/F(math.factorial(10))
print('Q5(t) with <=2 majorant =', float(Q5))
poly = 1 - t/2 + t**2/24 - t**3/720 + t**4/40320 - t**5/F(1814400)
print('poly (partialCos5 - x10/1814400) =', float(poly))
print('  2/10! = 2/3628800 = 1/1814400')
print()
a=F(163,20)
pe16=sum((a**i/F(math.factorial(i)) for i in range(16)),F(0))
rem16=(a**16/F(math.factorial(16)))/(1-a/F(17))
print('a=163/20 N16: partialExp16+rem16 =',float(pe16+rem16),'<= m01_lo',float(F(10**9,288575)),'?',(pe16+rem16)<=F(10**9,288575))
b=F(8157,1000)
pe20=sum((b**i/F(math.factorial(i)) for i in range(20)),F(0))
print('b=8157/1000 N20: m01_hi',float(F(10**9,286902)),'<= partialExp20',float(pe20),'?',F(10**9,286902)<=pe20)
print()
# also check zh=79/50 upper split@4 validity: x^2 < (2*4+1)(2*4+2)=9*10=90
print('79/50 ^2 =',float(x**2),'< 90 ok', x**2<90)
# exact bracket final
d=F(16,3); la,lb=F(163,20),F(8157,1000); pa,pb=F(25,79),F(50,157)
lo=190/F(3)+(d/3)*la*pa; hi=190/F(3)+(d/3)*lb*pb
print('final bracket: lo=',lo,'=',float(lo),' hi=',hi,'=',float(hi),' width',float(hi-lo))
# dressed
dlo=74+(d/2)*la*pa; dhi=74+(d/2)*lb*pb
print('dressed: lo=',dlo,'=',float(dlo),' hi=',dhi,'=',float(dhi))
