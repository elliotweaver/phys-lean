from fractions import Fraction as F
hi = F(6041,10**6)*F(5340,10**7)*F(3197,10**8)
lo = F(6037,10**6)*F(5329,10**7)*F(3190,10**8)
print('rounded-chain lo =', float(lo), ' ok(1026/1e13):', F(1026,10**13)<=lo)
print('rounded-chain hi =', float(hi), ' ok(1031):', hi<=F(1031,10**13), ' ok(1032):', hi<=F(1032,10**13))
print('quark: lo=1026/2=513, hi=1032/2=516')
print('71^2 <= 513/1e13?', F(71,10**7)**2 <= F(513,10**13))
print('516/1e13 <= 72^2?', F(516,10**13) <= F(72,10**7)**2)
