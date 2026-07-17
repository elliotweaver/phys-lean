from mpmath import mp, mpf, cos, pi
mp.dps = 40
def partialCos6(x):
    return 1 - x**2/2 + x**4/24 - x**6/720 + x**8/40320 - x**10/3628800
def remBound6(x):
    return x**12/mpf(479001600) * (1/(1 - x**2/182))
print('true pi/2 * 1e7 =', pi/2*mpf('1e7'))
for zi in [15707964, 15707965, 15707963]:
    x = mpf(zi)/mpf('1e7')
    pc = partialCos6(x); rb = remBound6(x)
    print(f'z={zi}: partialCos6={float(pc):.3e}  +rem upper={float(pc+rb):.3e}  cos={float(cos(x)):.3e}  neg? {bool(pc+rb<0)}')
print('--- lower via double angle: y near pi/4 ---')
print('pi/4 =', float(pi/4))
for zlo in [15707950, 15707958, 15707960, 15707940]:
    y = mpf(zlo)/mpf('2e7')
    cy = cos(y)
    pc = partialCos6(y); rb = remBound6(y)
    low = pc - rb*mpf('1.01')
    # need low^2 > 1/2 i.e. low > 1/sqrt2 ; then 2*low^2-1>0
    print(f'zlo={zlo}: y={float(y):.8f} cos(y)={float(cy):.10f} polyLow={float(low):.12f} low^2-0.5={float(low*low-mpf(1)/2):.3e}')
print('1/sqrt2 =', float(1/mp.sqrt(2)))
# L needs L^2 > 1/2. L=7071073/1e7 -> L^2:
for Lc in [7071068, 7071070, 7071073, 7071075]:
    L=mpf(Lc)/mpf('1e7')
    print(f'L={Lc}: L^2-0.5 = {float(L*L-mpf(1)/2):.3e}  (need >0)')
