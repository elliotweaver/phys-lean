import mpmath as mp
mp.mp.dps = 40
pi = mp.pi
kappa = 1/(3*pi)

partial = mp.mpf('67.9475880261')  # D5-next-12 pinned partial tower (completeBandList)
# high-band screening (rational grammar rungs): 576/27
print('high-band screening 576/27 =', mp.mpf(576)/27, '(EXACT rational)')
print('  42 + 576/27 = 190/3 =', mp.mpf(190)/3)
print('lepton tail screening (partial - 190/3) =', partial - mp.mpf(190)/3)

# freeze-out summand: kappa*(11/3 log rb + 10/3 log rc + 2 log rl)
def fz(rb, rc, rl):
    return kappa*(mp.mpf(11)/3*mp.log(rb) + mp.mpf(10)/3*mp.log(rc) + 2*mp.log(rl))

print('--- freeze-out summand for O(1-100) edge ratios ---')
for rb, rc, rl in [(3.29,13.7,1.5),(5,20,5),(10,10,10),(100,100,100)]:
    print(f'  rb={rb} rc={rc} rl={rl}: summand={float(fz(rb,rc,rl)):.4f}')

# to close the ~68 gap to 137: uniform r needed
gap = mp.mpf('137.035999') - partial
need = gap/kappa
tot = mp.mpf(11)/3+mp.mpf(10)/3+2
print('to reach measured 137.036: uniform edge ratio r =', float(mp.e**(need/tot)))
print()
# grammar rungs: high band ratios are cutExp(28pi/3), cutExp(8pi/3) -> logs 28pi/3, 8pi/3
print('high-band ratio logs (grammar rungs): 28pi/3 =', float(28*pi/3), ' 8pi/3 =', float(8*pi/3))
print('  kappa*(16/3)*(28pi/3+8pi/3) = kappa*(16/3)*12pi =', float(kappa*(mp.mpf(16)/3)*12*pi), '= 576/27 =', float(mp.mpf(576)/27))
