from fractions import Fraction as F
import mpmath as mp
from math import factorial
mp.mp.dps = 40
x = mp.mpf(2) / 3
print('cos(2/3) =', mp.cos(x))

def term(n):
    return F((-1)**n) * F(2, 3)**(2*n) / F(factorial(2*n))

S = F(0)
for n in range(8):
    S += term(n)
    print(f'S_{n} = {float(S):.12f}   |a_{n}|={float(abs(term(n))):.4e}')

# Alternating-series: partial sum of an alternating decreasing series brackets the limit.
# For cos series a_n = (-1)^n |a_n| with |a_n| eventually decreasing, the truncation after
# term K-1 has error bounded by |a_K|. cos(2/3) lies between consecutive partial sums.
for K in range(2, 6):
    Sk = sum(term(n) for n in range(K))
    aK = abs(term(K))
    print(f'K={K}: S_{{<K}}={Sk} = {float(Sk):.12f}  |a_K|={float(aK):.4e}  bracket=[{float(Sk-aK):.10f},{float(Sk+aK):.10f}]')

# geometric tail bound alternative (like cos2_tail_termbound): ratio r_n=|a_{n+1}|/|a_n| = x^2/((2n+1)(2n+2))
# for x=2/3, x^2=4/9. At n>=K, ratio <= (4/9)/((2K+1)(2K+2)).
print()
head3 = term(0) + term(1) + term(2)
print('head3 (K=3) =', head3, '=', float(head3))
a3 = abs(term(3))
print('|a_3| =', a3, '=', float(a3))
# ratio from n=3: (4/9)/(7*8)=4/504=1/126
tb = a3 / (1 - F(1, 126))
print('geo tailbound(K=3, rho=1/126) =', tb, '=', float(tb))
print('K=3 two-sided: [', float(head3 - tb), ',', float(head3 + tb), ']')
