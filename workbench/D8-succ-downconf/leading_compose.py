import mpmath as mp
mp.mp.dps=60
pi=mp.pi
q=mp.cos(pi/4)
mbRatio=(1-q)**2/(3*(1+q))
confBundle=mp.e**(-8*pi/3)
kappa=1/(3*pi)
# N340 mass shape
pB=mp.cos(mp.mpf(2)/9); wB=mp.sqrt(2); rB=mp.sqrt(3-3*pB*pB)
b0=1+wB*pB; b2=1-wB*(pB-rB)/2
mass0=b0**2; mass2=b2**2
Lmb=mp.log(mbRatio); Lb0=mp.log(mass0); Lb2=mp.log(mass2)
# freeze-out dissolved
S_fz = mp.mpf(16)/9 + kappa*((mp.mpf(7)/3)*Lmb + (mp.mpf(11)/3)*Lb0 - (mp.mpf(5)/3)*Lb2)
print('freezeout S_fz =', S_fz)
# banked D7 partial bracket for invAlphaZero(completeBandList chargeTraceDepth)
num_lo = mp.mpf(12007329939722)/176714586765
num_hi = mp.mpf(32019546505738)/471238898037
invAlphaEM_lo = num_lo + 70
invAlphaEM_hi = num_hi + 70
print('invAlphaEM bracket:', invAlphaEM_lo, invAlphaEM_hi, ' width', invAlphaEM_hi-invAlphaEM_lo)
# totalScreeningWith 1 = totalScreening/chargeTraceDepth, chargeTraceDepth=16/3
ts_lo = num_lo - 42
ts_hi = num_hi - 42
chg = mp.mpf(16)/3
T_lo = ts_lo/chg; T_hi = ts_hi/chg
projectedS = mp.mpf(1)/8
anti_lo = projectedS*T_lo; anti_hi = projectedS*T_hi
print('anti-screening term (s*T):', anti_lo, anti_hi)
# leading-k composed = invAlphaEM - s*T + freezeout
comp_lo = invAlphaEM_lo - anti_hi + S_fz
comp_hi = invAlphaEM_hi - anti_lo + S_fz
print('COMPOSED LEADING-K:', comp_lo, comp_hi, ' width', comp_hi-comp_lo)
print('center ~', (comp_lo+comp_hi)/2)
print('measured 1/alpha(0) ~ 137.035999206 (orientation only)')
