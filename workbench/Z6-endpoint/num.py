import math
lo = 1e9/288575; hi = 1e9/286902
print('mass0/mass1 bracket:', lo, hi)
for r in (lo, hi):
    val = 190/3 + (1/(3*math.pi))*(16/3)*math.log(r)
    print('  full-census (d=16/3) reading at ratio', round(r,1), '->', round(val,3))
# lepton-only census: leptons are colour-singlet; the low-energy tail census is NOT the full 16/3.
# Explore a few census values just to see scale
for d in (16/3, 2, 8/3, 4):
    v_lo = 190/3 + (1/(3*math.pi))*d*math.log(lo)
    v_hi = 190/3 + (1/(3*math.pi))*d*math.log(hi)
    print(f'  d={d:.3f}: [{v_lo:.3f}, {v_hi:.3f}]')
print('measured 1/alpha(0) ~ 137.036 ; 190/3 =', 190/3)
