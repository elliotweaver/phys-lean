from fractions import Fraction as F
import math
def costerm(x,n):
    return F((-1)**n) * F(x)**(2*n) / F(math.factorial(2*n))
terms=[costerm(2,n) for n in range(14)]
print('cutCos 2 partials:', [round(float(sum(terms[:k])),5) for k in range(1,9)])
tail2=sum(abs(costerm(2,n)) for n in range(2,40))
print('sum_{n>=2}|a_n| =', float(tail2), ' => 1-2+tail=', float(1-2+tail2))
for n in range(2,8):
    dec = F(2)**(2*(n+1))/math.factorial(2*(n+1)) < F(2)**(2*n)/math.factorial(2*n)
    print(f'  a_{n}=2^{2*n}/{2*n}! = {float(F(2)**(2*n)/math.factorial(2*n)):.5f}, a_{n+1}<a_n:', dec)
a2=F(2)**4/math.factorial(4); a3=F(2)**6/math.factorial(6)
print('a2=',a2,'=',float(a2),' a3=',a3,'=',float(a3))
print('B(bracket n>=2, alternating decreasing) <= a2 =', float(a2))
print(' so cutCos2 <= 1-2+2/3 =', float(1-2+a2), '< 0? YES')
# Even simpler: can we do it with FEWER terms via a geometric tail bound from n=2?
# ratio a_{n+1}/a_n for n>=2 is 2^2/((2n+1)(2n+2)) <= 4/(5*6)=2/15 for n>=2. geo tail:
a2v=F(2)**4/math.factorial(4)
geo = a2v * F(1)/(1-F(2,15))
print('geo bound tail_{n>=2} <= a2/(1-2/15) =', float(geo), '=> 1-2+geo=', float(1-2+geo))
