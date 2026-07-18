import mpmath as mp
from fractions import Fraction as F
mp.mp.dps=80
pi=mp.pi
# massScale bracket endpoints (as in production)
Slo=F(184405,10**18)*F(92387,10**5)*F(2,3)*(F(191,243)-F(56,455625))
Shi=F(184445,10**18)*F(92388,10**5)*F(2,3)*(F(191,243)+F(56,455625))
# mass_k brackets (N340)
mk=[(F(237943,10**5)**2,F(237944,10**5)**2),
    (F(4034,10**5)**2,F(40365,10**6)**2),
    (F(5802,10**4)**2,F(58022,10**5)**2)]
trueS=(mp.e**(-28*pi/3))*mp.cos(pi/8)*(mp.mpf(2)/3)*mp.cos(mp.mpf(2)/3)
truem=[(mp.mpf('2.379435'))**2, None, None]
names=['absMass0 (tau)','absMass1 (electron)','absMass2 (muon)']
# For each k choose CLEAN decimal rationals enclosing Slo*mklo (below) and Shi*mkhi (above)
def rat(fr): return mp.mpf(fr.numerator)/fr.denominator
print('Slo=',rat(Slo),'Shi=',rat(Shi))
brackets=[]
for k,(mlo,mhi) in enumerate(mk):
    lo=Slo*mlo; hi=Shi*mhi
    print(f'{names[k]}: [{mp.nstr(rat(lo),16)}, {mp.nstr(rat(hi),16)}]')
    brackets.append((lo,hi))
# clean rational choices (decimal literals /10^n) that enclose:
# absMass0 ~ [5.0535e-13, 5.0564e-13] -> choose 50535/1e17 lo, 50564/1e17 hi
# absMass1 ~ [1.4525e-16, 1.4552e-16] -> 14525/1e20 lo, 14552/1e20 hi
# absMass2 ~ [3.0047e-14, 3.0066e-14] -> 30047/1e18 lo, 30066/1e18 hi
cand=[(F(50535,10**17),F(50565,10**17)),
      (F(14525,10**20),F(14552,10**20)),
      (F(30047,10**18),F(30066,10**18))]
for k,((lo,hi),(clo,chi)) in enumerate(zip(brackets,cand)):
    ok_lo = clo <= lo   # clean lo <= Slo*mklo  (so clean lo <= absMass_k)
    ok_hi = hi <= chi   # Shi*mkhi <= clean hi
    print(f'{names[k]}: clean [{rat(clo)},{rat(chi)}] enclosing? lo_ok={ok_lo} hi_ok={ok_hi}')
    assert ok_lo and ok_hi
# ordering teeth from brackets: absMass1_hi < absMass2_lo and absMass2_hi < absMass0_lo
print('order check via clean: aM1_hi < aM2_lo?', cand[1][1] < cand[2][0])
print('order check via clean: aM2_hi < aM0_lo?', cand[2][1] < cand[0][0])
print('ALL ABSMASS ASSERTIONS PASSED')
