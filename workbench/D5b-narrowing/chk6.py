from fractions import Fraction as F
from math import factorial
def pCos(x,N): return sum(F((-1)**i)*x**(2*i)/F(factorial(2*i)) for i in range(N))
def cRem(x,N): return (x**(2*N)/F(factorial(2*N)))*(1/(1-x*x/F((2*N+1)*(2*N+2))))
x=F(15707970,10**7)
p6=pCos(x,6); r6=cRem(x,6)
print('partialCos6 exact =',float(p6))
print('cosRemBound6 exact =',float(r6),'=',r6)
print('p6+r6 =',float(p6+r6),'<0?',(p6+r6)<0)
print('need rem < -p6 =',float(-p6))
print('cosRemBound6 < 478/1e9?', r6 < F(478,10**9))
print('cosRemBound6 < 48/1e8?', r6 < F(48,10**8))
print('cosRemBound6 < 5/1e7?', r6 < F(5,10**7))
# also the partialCos6 exact value as rational for norm_num sign check
print('partialCos6 as fraction numerator/denominator sign:', p6<0)
