from mpmath import mp, mpf, cos, pi, sqrt
mp.dps = 50
def partialCos6(x):
    return 1 - x**2/2 + x**4/24 - x**6/720 + x**8/40320 - x**10/3628800
def remBound6(x):
    return x**12/mpf(479001600) * (1/(1 - x**2/182))
invs2 = 1/sqrt(2)
print('true pi/2*1e7 =', float(pi/2*mpf('1e7')))
print('1/sqrt2 =', mp.nstr(invs2, 15))
# For lower bound: choose zlo (leastCosZero >= zlo/1e7). y=zlo/2e7. Need cutCos(y)>L, L^2>1/2, polyLow(y)>L.
# margin1 = L^2 - 1/2 (for double-angle positivity). margin2 = polyLow(y) - L (for the nlinarith).
print()
print('zlo      y^2_num(<)   L        L^2-0.5     polyLow-L    (both need >0, comfortable)')
for zlo in [15707900, 15707920, 15707940, 15707950, 15707955, 15707960]:
    y = mpf(zlo)/mpf('2e7')
    y2 = y*y
    # y2 bound as rational num over 1e7? use ceil to next integer of y2*1e7
    y2num = int(mp.floor(y2*mpf('1e7'))) + 1
    pc = partialCos6(y); rb = remBound6(y)
    polyLow = pc - rb*mpf('1.01')
    # choose L = floor(polyLow*1e7) but must have L^2>0.5 -> L> invs2*1e7=7071067.81
    Lnum = int(mp.floor(polyLow*mpf('1e7')))
    L = mpf(Lnum)/mpf('1e7')
    print(f'{zlo}  {y2num}  {Lnum}  {float(L*L-mpf(1)/2):+.3e}  {float(polyLow-L):+.3e}')
print()
# UPPER: cutCos(zhi/1e7)<0 via partialCos6+rem<0. find smallest zhi.
print('zhi      partialCos6+rem (<0 needed)')
for zhi in [15707963, 15707964, 15707965, 15707966]:
    x = mpf(zhi)/mpf('1e7')
    val = partialCos6(x)+remBound6(x)
    print(f'{zhi}  {float(val):+.3e}  neg?{bool(val<0)}')
