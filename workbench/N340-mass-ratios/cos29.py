from fractions import Fraction as F
from math import factorial
x=F(2,9)
def costerm(n): return F((-1)**n)*x**(2*n)/factorial(2*n)
# head at index 3: sum i<3
head3=sum(costerm(n) for n in range(3))
print("head3 =",head3)  # 1 - (2/9)^2/2 + (2/9)^4/24
print(" = 1 - 2/81 + 2/(81*81*... )")
# term0=1, term1 = -x^2/2 = -(4/81)/2=-2/81, term2 = x^4/24=(16/6561)/24=2/19683
print(" verify:",1 - F(2,81) + F(2,19683), head3)
# tail termbound: |cosTermC(x)(n+3)| <= (base)*(ratio)^n, base=|term3|, ratio<=1/1134
base=abs(costerm(3)); print("base=|term3|=",base," = x^6/6! =",x**6/factorial(6))
# ratio derivation: term(n+3+1)/term(n+3) magnitude = x^2/((2(n+3)+1)(2(n+3)+2)) = x^2/((2n+7)(2n+8))
# max at n=0: x^2/(7*8)= (4/81)/56 = 4/(81*56)=4/4536=1/1134
print("ratio n=0 =",x**2/F(7*8))
# geo sum bound = base/(1-1/1134) = base*1134/1133
geo=base*F(1134,1133); print("geo bound =",geo)
lo=head3-geo; hi=head3+geo
print("bounds: [",lo,",",hi,"]")
print("floats: [",float(lo),",",float(hi),"]")
print("bracket 975410/1e6 <= .. <= 975411/1e6:")
print("  lo>=975410/1e6?",lo>=F(975410,10**6))
print("  hi<=975411/1e6?",hi<=F(975411,10**6))
# non-vacuity: 0 < cos(2/9)  (obviously, ~0.975)
# costume: pin to 2 decimals: 97/100 <= cos(2/9) < 98/100
print("97/100<=lo?",F(97,100)<=lo," hi<98/100?",hi<F(98,100))
