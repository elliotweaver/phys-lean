from fractions import Fraction as F
import math
# split@4 LOWER poly in t: 1 - t/2 + t^2/24 - t^3/720 - t^4/20160  (>0 needed for t<zl^2)
def poly4(t):
    return 1 - t/2 + t**2/24 - t**3/720 - t**4/20160
# find max zl at split@4 (poly4(zl^2)>0)
print("=== split@4 LOWER: max z_lo ===")
for zl in [F(156,100),F(1565,1000),F(1566,1000),F(1567,1000),F(157,100)]:
    t=zl**2
    print(f"  z_lo={zl}={float(zl):.4f}: poly4({float(t):.4f})={float(poly4(t)):.6f}  {'OK' if poly4(t)>0 else 'FAIL'}")
# split@4 UPPER already: z_hi=79/50=1.58 works
print("\n=== bracket options (all split@4) ===")
d=F(16,3)
D5n_lo,D5n_hi=F(610,9),F(9206,135)
la,lb=F(163,20),F(8157,1000)  # cutLog [8.15, 8.157]
def brk(zl,zh):
    pa,pb=F(1)/(2*zh),F(1)/(2*zl)  # 1/cutPi in [1/(2zh),1/(2zl)]
    lo=190/F(3)+(d/3)*la*pa; hi=190/F(3)+(d/3)*lb*pb
    return pa,pb,lo,hi
for zl,zh in [(F(1565,1000),F(79,50)),(F(1566,1000),F(79,50)),(F(313,200),F(79,50))]:
    pa,pb,lo,hi=brk(zl,zh)
    w=hi-lo
    print(f"z_lo={zl}({float(zl):.4f}) z_hi={zh}: 1/cutPi in [{pa},{pb}]=[{float(pa):.5f},{float(pb):.5f}]")
    print(f"   bracket [{float(lo):.6f},{float(hi):.6f}] width {float(w):.6f}  ({float(D5n_hi-D5n_lo)/float(w):.1f}x)  nested={D5n_lo<=lo and hi<=D5n_hi}")
    print(f"   exact lo={lo} hi={hi}")
# for reference split@5 option
print("\n=== split@5 option (z_lo=157/100) for comparison ===")
pa,pb=F(25,79),F(50,157); lo=190/F(3)+(d/3)*la*pa; hi=190/F(3)+(d/3)*lb*pb
print(f"   [{float(lo):.6f},{float(hi):.6f}] width {float(hi-lo):.6f}")
