import math
partial_num = 67.9475880261
measured = 137.035999084
kappa = 1/(3*math.pi)
print("kappa = 1/(3pi) =", kappa)
print("partial tower endpoint 1/a(0) =", partial_num)
print("measured 1/a(0)               =", measured)
print("GAP                           =", measured - partial_num)
print("2 x partial                   =", 2*partial_num, " vs measured", measured)
print()
print("freeze-out bound = kappa*9*log(R):")
for R in [10, 1e2, 1e5, 1e8, 1e31]:
    print(f"  R={R:.0e}: bound = {kappa*9*math.log(R):.3f}")
print()
need_logR = (measured-partial_num)/(kappa*9)
print("To close gap via freeze-out ALONE, need log R =", need_logR, "-> R = e^that ~ 1e", need_logR/math.log(10))
