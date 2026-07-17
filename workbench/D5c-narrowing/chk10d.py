from fractions import Fraction as F
import mpmath as mp
mp.mp.dps=50

# 1e10 1/cutPi bracket
new_ilo = F(1250000000,3926990817)
new_ihi = F(5000000000,15707963267)
# parent (D5-next-9) 1/cutPi bracket
par_ilo = F(500000000,1570796327)
par_ihi = F(250000000,785398163)
print("=== 1/cutPi nesting inside parent ===")
print("new_ilo >= par_ilo ?", new_ilo >= par_ilo)
print("new_ihi <= par_ihi ?", new_ihi <= par_ihi)
print("strict new_ilo < new_ihi ?", new_ilo < new_ihi)
print("width ~", mp.nstr(mp.mpf((new_ihi-new_ilo).numerator)/(new_ihi-new_ilo).denominator,6))

# cutPi bracket
new_plo=F(15707963267,5000000000); new_phi=F(3926990817,1250000000)
print()
print("=== cutPi ===")
print("cutPi_lo=15707963267/5000000000 = 2*15707963267/1e10 ?", new_plo==F(2*15707963267,10**10))
print("cutPi_hi=3926990817/1250000000 = 2*15707963268/1e10 ?", new_phi==F(2*15707963268,10**10))
# 1/cutPi = [1/cutPi_hi, 1/cutPi_lo]
print("1/cutPi_hi =", F(1)/new_phi, " == new_ilo?", F(1)/new_phi==new_ilo)
print("1/cutPi_lo =", F(1)/new_plo, " == new_ihi?", F(1)/new_plo==new_ihi)

# assembled bracket vs parent
print()
print("=== assembled 1/alpha(0) ===")
new_lo=F(2401465987690,35342917353); new_hi=F(9605863954190,141371669403)
par_lo=F(960586395190,14137166943); par_hi=F(480293197510,7068583467)
print("new_lo >= par_lo (nested)?", new_lo>=par_lo)
print("new_hi <= par_hi (nested)?", new_hi<=par_hi)
print("strict new_lo<new_hi?", new_lo<new_hi)
print("width_lt (new < par)?", (new_hi-new_lo)<(par_hi-par_lo))
print("above 190/3?", new_lo>F(190,3))

# verify assembled endpoint arithmetic: 190/3 + 16/9*cutLog*inv
d3=F(16,9)
la=F(815406110,10**8); lb=F(815406115,10**8)
comp_lo=F(190,3)+d3*la*new_ilo
comp_hi=F(190,3)+d3*lb*new_ihi
print("comp_lo == new_lo?", comp_lo==new_lo, comp_lo)
print("comp_hi == new_hi?", comp_hi==new_hi, comp_hi)

# dressed
print()
print("=== dressed ===")
d2=F(8,3)
dlo=F(74)+d2*la*new_ilo; dhi=F(74)+d2*lb*new_ihi
print("dressed_lo =", dlo)
print("dressed_hi =", dhi)
new_dlo=F(953332572374,11780972451); new_dhi=F(3813330291274,47123889801)
print("dlo==953332572374/11780972451?", dlo==new_dlo)
print("dhi==3813330291274/47123889801?", dhi==new_dhi)
par_dlo=F(381333028994,4712388981); par_dhi=F(190666514486,2356194489)
print("dressed nested lo?", new_dlo>=par_dlo, " hi?", new_dhi<=par_dhi, " strict?", new_dlo<new_dhi)
