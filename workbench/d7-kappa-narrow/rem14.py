from fractions import Fraction as F
from math import factorial
y = F(15707963267949, 40000000000000)
D7=(2*7+1)*(2*7+2)
inv = 1/(1 - y**2/D7)
rem7 = (y**14/factorial(14))*inv
print('rem7 (split@7 upper) exact =', float(rem7))
for k in range(1,40):
    for e in [20,19,18]:
        b = F(k, 10**e)
        if rem7 <= b:
            print(f'  use {k}/1e{e} = {float(b)} (margin {float(b-rem7):.2e})'); break
    else: continue
    break
D6=(2*6+1)*(2*6+2)
inv6=1/(1-y**2/D6)
rem6=(y**12/factorial(12))*inv6
print('rem6 (split@6 lower) exact =', float(rem6))
for k in range(1,40):
    for e in [17,16,15]:
        b=F(k,10**e)
        if rem6<=b:
            print(f'  use {k}/1e{e} = {float(b)} (margin {float(b-rem6):.2e})'); break
    else: continue
    break
