import mpmath as mp
mp.mp.dps = 30
pi = mp.pi
kappa = 1/(3*pi)
w = mp.mpf(1)/3   # DERIVED depth weight (D3 depthWeight_eq)

partial = mp.mpf('67.9475880261')   # D5-next-12 partial tower (completeBandList) = 190/3 + lepton tail
hi = mp.mpf(190)/3
print('partial (bare) =', partial, '  190/3 =', hi, '  lepton tail =', partial-hi)

# freeze-out summand: kappa*(11/3 log rb + 10/3 log rc + 2 log rl); censuses 11/3,10/3,2 sum=23/3
def fz(rb,rc,rl): return kappa*(mp.mpf(11)/3*mp.log(rb)+mp.mpf(10)/3*mp.log(rc)+2*mp.log(rl))

print('\n--- bare composed (partial + freeze-out) and DRESSED (x 3/2 of screening above 42) ---')
for rb,rc,rl in [(3.29,13.7,5),(10,10,10),(30,30,30),(100,100,100)]:
    s = fz(rb,rc,rl)
    bare = partial + s
    screening = bare - 42
    dressed = 42 + screening/(1-w)   # dressedInvAlphaZero at w=1/3
    print(f'  edges~{rb,rc,rl}: freeze-out={float(s):.3f}  bare={float(bare):.3f}  dressed={float(dressed):.3f}')

print('\nmeasured 1/alpha(0) ~ 137.036')
print('to reach 137 bare: need freeze-out summand =', float(137.036-partial), ' => uniform edge ~', float(mp.e**((137.036-partial)/kappa/(mp.mpf(23)/3))))
print('to reach 137 dressed: need screening =', float((137.036-42)*(1-w)), ' but bare screening (high+lep) only =', float(partial-42))
print('  so dressed of partial alone =', float(42+(partial-42)/(1-w)))
