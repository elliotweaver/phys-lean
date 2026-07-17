import math
pi = math.pi
kappa = 1.0/(3*pi)   # kappaLeading = 1/(3 cutPi)
print('kappa =', kappa)

partial = 67.9475880261  # D5-next-12 pinned partial tower (completeBandList)
print('partial tower (completeBandList) =', partial)
print('  190/3 =', 190/3, '  lepton tail screening =', partial - 190/3)

def fz(rb, rc, rl):
    return kappa*(11/3*math.log(rb) + 10/3*math.log(rc) + 2*math.log(rl))

for label, rb, rc, rl in [('bcs-ish', 3.29, 13.7, 1.5), ('wide', 5.0, 20.0, 5.0), ('modest', 3.0, 3.0, 3.0)]:
    s = fz(rb, rc, rl)
    print(f'{label}: freeze-out summand = {s:.4f}  -> composed = {partial+s:.4f}')

measured = 137.035999
gap = measured - partial
print('measured 1/alpha(0) =', measured, ' gap partial->measured =', gap)
need = gap/kappa
tot_depth = 11/3+10/3+2
print('needed depth-weighted logsum =', need, ' => uniform log r =', need/tot_depth, ' => r =', math.exp(need/tot_depth))

# The confinement->EW rung structure: Lambda/M = exp(-12 pi), v/M = exp(-28pi/3), Lambda/v=exp(-8pi/3)
print('--- scale tower rungs ---')
print('Lambda/M = exp(-12pi) =', math.exp(-12*pi))
print('v/M = exp(-28pi/3) =', math.exp(-28*pi/3))
print('Lambda/v = exp(-8pi/3) =', math.exp(-8*pi/3))
