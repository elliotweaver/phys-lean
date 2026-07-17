from mpmath import mp, mpf
mp.dps = 60
# NEW brackets this node:
# leastCosZero in [15707960/1e7, 15707964/1e7]
# cutPi = 2*leastCosZero in [3141592/1e6, 31415928/1e7]
piL = mpf(3141592)/mpf('1e6'); piH = mpf(31415928)/mpf('1e7')
# 1/cutPi in [1/piH, 1/piL] = [10000000/31415928, 1000000/3141592]
ipL = mpf(10000000)/31415928; ipH = mpf(1000000)/3141592
# cutLog in [81540600/1e7, 81540630/1e7]  (upper uses N=26 -> 8.1540630)
clL = mpf(81540600)/mpf('1e7'); clH = mpf(81540630)/mpf('1e7')
d = mpf(16)/3
# assembled: 190/3 + (d/3)*cutLog*(1/cutPi)
lo = mpf(190)/3 + (d/3)*clL*ipL
hi = mpf(190)/3 + (d/3)*clH*ipH
print('=== NEW ASSEMBLED (both fronts sharpened) ===')
print('lo (rational) =', mp.nstr(lo,20))
print('hi (rational) =', mp.nstr(hi,20))
print('width =', mp.nstr(hi-lo,4))
# express lo,hi as exact fractions:
from fractions import Fraction
def frac(x): return x  # mpf already exact rational-ish
# Get exact fractions using python Fraction for the rational arithmetic
F = Fraction
pi_lo_f = F(3141592,1000000); pi_hi_f = F(31415928,10000000)
ip_lo_f = F(10000000,31415928); ip_hi_f = F(1000000,3141592)
cl_lo_f = F(81540600,10000000); cl_hi_f = F(81540630,10000000)
D=F(16,3)
lo_f = F(190,3) + (D/3)*cl_lo_f*ip_lo_f
hi_f = F(190,3) + (D/3)*cl_hi_f*ip_hi_f
print()
print('lo exact fraction =', lo_f.numerator,'/',lo_f.denominator, '=', float(lo_f))
print('hi exact fraction =', hi_f.numerator,'/',hi_f.denominator, '=', float(hi_f))
print('width =', float(hi_f-lo_f))
# dressed at w=1/3: 74 + (d/2)*cutLog*(1/cutPi)
dlo_f = F(74) + (D/2)*cl_lo_f*ip_lo_f
dhi_f = F(74) + (D/2)*cl_hi_f*ip_hi_f
print()
print('dressed lo =', dlo_f.numerator,'/',dlo_f.denominator, '=', float(dlo_f))
print('dressed hi =', dhi_f.numerator,'/',dhi_f.denominator, '=', float(dhi_f))
print()
# parent bracket for nesting/width teeth
plo_f=F(960586690,14137173); phi_f=F(1921144130,28273869)
print('parent width =', float(phi_f-plo_f), ' new width =', float(hi_f-lo_f), ' improvement=', float((phi_f-plo_f)/(hi_f-lo_f)))
print('nested? parent_lo<=new_lo:', plo_f<=lo_f, ' new_hi<=parent_hi:', hi_f<=phi_f)
print()
# 1/cutPi exact fractions for teeth
print('1/cutPi bracket: 10000000/31415928 <= 1/cutPi <= 1000000/3141592')
print('  = [%.12f, %.12f], width %.3e' % (float(ip_lo_f), float(ip_hi_f), float(ip_hi_f-ip_lo_f)))
print('  parent 1/cutPi: [500000/1570797,1000000/3141541] width', float(F(1000000,3141541)-F(500000,1570797)))
print('  nested? 500000/1570797 <= 10000000/31415928:', F(500000,1570797)<=ip_lo_f, ' 1000000/3141592<=1000000/3141541:', ip_hi_f<=F(1000000,3141541))
# cutLog nesting vs parent [815405/1e5, 815411/1e5]
print()
print('cutLog new [81540600/1e7, 81540630/1e7] = [%.7f,%.7f] width %.3e'%(float(cl_lo_f),float(cl_hi_f),float(cl_hi_f-cl_lo_f)))
print('  parent cutLog [815405/1e5,815411/1e5]=[8.15405,8.15411]; nested? 8.15405<=8.1540600:',F(815405,100000)<=cl_lo_f,' 8.1540630<=8.15411:',cl_hi_f<=F(815411,100000))
