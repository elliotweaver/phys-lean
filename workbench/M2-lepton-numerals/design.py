import mpmath as mp
mp.mp.dps=60
pi=mp.pi
z=pi/3
E=mp.e**z
print('pi/3      =', mp.nstr(z,20))
print('cutExp(pi/3)=', mp.nstr(E,20))
ew=mp.e**(-28*pi/3)
print('ewClosureRatio e^(-28pi/3)=', mp.nstr(ew,25))
cpi8=mp.cos(pi/8)
c23=mp.cos(mp.mpf(2)/3)
surv=mp.mpf(2)/3
S=ew*cpi8*surv*c23
print('cos(pi/8) =', mp.nstr(cpi8,20))
print('cos(2/3)  =', mp.nstr(c23,20))
print('massScale =', mp.nstr(S,25))
m0=mp.mpf('237943')/100000; m0=m0*m0
m1=(mp.mpf('4034')/100000 + mp.mpf('40365')/1000000)/2; m1sq=m1*m1
m2=mp.mpf('580215')/1000000; m2sq=m2*m2
print('mass0 ~',mp.nstr(m0,12),' mass1 ~',mp.nstr(m1sq,12),' mass2 ~',mp.nstr(m2sq,12))
print('absMass0 (tau, M_oct) =', mp.nstr(S*m0,12))
print('absMass1 (e,   M_oct) =', mp.nstr(S*m1sq,12))
print('absMass2 (mu,  M_oct) =', mp.nstr(S*m2sq,12))
print('E^28 =', mp.nstr(E**28,20))
print('1/E^28=', mp.nstr(1/E**28,25))
# ratios cross-check
print('m2/m1 =', mp.nstr(m2sq/m1sq,10), ' (muon/electron ~206.77)')
print('m0/m1 =', mp.nstr(m0/m1sq,10), ' (tau/electron ~3477)')
