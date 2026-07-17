import math
kappa = 1/(3*math.pi)          # kappaLeading (X6)
w = 1/3                         # depthWeight (D3)
chargeDepth = 16/3              # chargeTraceDepth (X6)
invAlphaZero = 67.9475880261    # banked D7 numeral (undressed), 12-digit
totalScreening = invAlphaZero - 42
T = totalScreening / chargeDepth  # totalScreeningWith 1
print('kappaLeading      =', kappa)
print('totalScreening    =', totalScreening)
print('T (screen unit)   =', T)
print()
print('D2b bare invAlphaEM (undressed) =', invAlphaZero + 70)
def dressed(s): return 112 + ((chargeDepth - s)*T)/(1-w)
print('D2c dressed invAlphaEM  s=0        =', dressed(0))
print('D2c dressed invAlphaEM  s=2 (iso)  =', dressed(2))
print('  -> s-swing over (0,2)            =', dressed(0)-dressed(2), '(DOMINANT residual)')
print()
def join(j): return kappa*3*math.log(j)/(1-w)
for j in [1.01,1.1,2,10,100]:
    print(f'  joinContent(j={j:<6}) = {join(j):.4f}')
print()
def freeze(r): return kappa*(11/3*math.log(r)+10/3*math.log(r)+2*math.log(r))
for r in [2,10,100,1000]:
    print(f'  freezeout(all={r:<5}) = {freeze(r):.4f}  (bound kappa*9*logR={kappa*9*math.log(r):.4f})')
print()
print('=== WIDTH ANALYSIS for >=15 sig digit bracket ===')
print('Need width < ~1e-13. s-residual ALONE swings value by ~', round(dressed(0)-dressed(2),2))
print('Value floats ~', round(dressed(2),2), '..', round(dressed(0),2), '+ join + freezeout (all O(1-10) open)')
