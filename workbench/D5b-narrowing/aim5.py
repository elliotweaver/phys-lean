#!/usr/bin/env python3
from fractions import Fraction as F
import math
d=F(16,3)
def assemble(la,lb,pa,pb):
    return 190/F(3)+(d/3)*la*pa, 190/F(3)+(d/3)*lb*pb
D5n_lo,D5n_hi=F(610,9),F(9206,135)
print("D5-next [610/9,9206/135] width",float(D5n_hi-D5n_lo))
print("m01 floor: cutLog true range [8.1506,8.1564], irreducible width ~0.0058\n")

# 1/cutPi candidates (zl split@?, zh split@?)
pi_opts = {
 "A [50/159,10/31] zl=31/20@3,zh=159/100@4": (F(50,159),F(10,31)),
 "B [25/79,50/157] zl=157/100@5,zh=79/50@4": (F(25,79),F(50,157)),
}
# cutLog candidates
log_opts = {
 "L1 [8.14,8.17] N13/N16": (F(407,50),F(817,100)),
 "L2 [8.15,8.157] N16/N20": (F(163,20),F(8157,1000)),
}
print("=== all combos ===")
best=None
for lk,(la,lb) in log_opts.items():
    for pk,(pa,pb) in pi_opts.items():
        lo,hi=assemble(la,lb,pa,pb)
        w=hi-lo
        nested = D5n_lo<=lo and hi<=D5n_hi
        print(f"{lk} x {pk}:")
        print(f"   width {float(w):.6f}  nested={nested}  ({float(D5n_hi-D5n_lo)/float(w):.1f}x narrower)")
        print(f"   lo={lo}={float(lo):.6f}  hi={hi}={float(hi):.6f}")
# contribution split for the best combo (L1 x B and L2 x B)
print("\n=== width contribution split (which factor dominates) ===")
for lk,(la,lb) in log_opts.items():
    for pk,(pa,pb) in pi_opts.items():
        cl_mid=(la+lb)/2; pi_mid=(pa+pb)/2
        dlog=lb-la; dpi=pb-pa
        c_log=(d/3)*pi_mid*dlog; c_pi=(d/3)*cl_mid*dpi
        print(f"{lk} x {pk}: cutLog-contrib {float(c_log):.5f}  1/cutPi-contrib {float(c_pi):.5f}")
