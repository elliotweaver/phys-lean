from fractions import Fraction as F
import math

def partialCos(x,N):
    x=F(x); s=F(0)
    for i in range(N):
        s += F((-1)**i) * x**(2*i) / math.factorial(2*i)
    return s
def cosRemExact(x,N):
    x=F(x)
    return x**(2*N)/math.factorial(2*N) / (1 - x**2/((2*N+1)*(2*N+2)))

# (a) UPPER split@4 z_hi=15709/10000
zh=F(15709,10000)
pc=partialCos(zh,4); cr=cosRemExact(zh,4)
print("=== (a) UPPER split@4 z_hi=15709/10000 ===")
print(f"  partialCos(zh,4) = {pc} = {float(pc):.9f}")
print(f"  cosRemBound(zh,4) = {float(cr):.9f}")
print(f"  sum = {float(pc+cr):+.9f}  (<0 ? {pc+cr<0})")

# (b) LOWER split@4 z_lo=15679/10000: need poly>0 for x^2<zlo^2
zlo=F(15679,10000); t=zlo**2
print("\n=== (b) LOWER split@4 z_lo=15679/10000 ===")
print(f"  zlo^2 = {t} = {float(t):.9f}")
poly4 = lambda tt: 1 - tt/2 + tt**2/24 - tt**3/720 - tt**4/20160
print(f"  poly4(zlo^2) = {float(poly4(t)):+.9f}  (>0 ? {poly4(t)>0})")

# (c) LOWER split@5 z_lo=15707/10000
zlo5=F(15707,10000); t5=zlo5**2
poly5 = lambda tt: 1 - tt/2 + tt**2/24 - tt**3/720 + tt**4/40320 - tt**5/1814400
print("\n=== (c) LOWER split@5 z_lo=15707/10000 ===")
print(f"  zlo^2 = {t5} = {float(t5):.9f}")
print(f"  poly5(zlo^2) = {float(poly5(t5)):+.9f}  (>0 ? {poly5(t5)>0})")
# also a slightly safer z_lo for split@5
for v in [15705,15706,15707]:
    z=F(v,10000); tt=z**2
    print(f"    z_lo={z}: poly5={float(poly5(tt)):+.9f} {'OK' if poly5(tt)>0 else 'FAIL'}")

# (c') UPPER split@5 z_hi=15709/10000 (in case we want both at split@5)
print("\n=== (c') UPPER split@5 z_hi=15709/10000 ===")
pc5=partialCos(zh,5); cr5=cosRemExact(zh,5)
print(f"  sum = {float(pc5+cr5):+.9f} (<0 ? {pc5+cr5<0})")

# partialCos_five closed form check
print("\n=== partialCos_five(x) = 1 - x^2/2 + x^4/24 - x^6/720 + x^8/40320 ===")

# assembled brackets for the candidate plans
d=F(16,3); la,lb=F(163,20),F(8157,1000)
D5n2_lo,D5n2_hi=F(48290,711),F(159646,2349)
def assembled(zl,zh):
    pa,pb=F(1)/(2*zh),F(1)/(2*zl)
    lo=F(190,3)+(d/3)*la*pa; hi=F(190,3)+(d/3)*lb*pb
    return pa,pb,lo,hi,hi-lo
print("\n=== assembled brackets ===")
for label,zl,zh in [
    ("PLAN-A split@4 both: z_lo=15679/1e4, z_hi=15709/1e4", F(15679,10000), F(15709,10000)),
    ("PLAN-B split@5 lo + split@4 hi: z_lo=15707/1e4, z_hi=15709/1e4", F(15707,10000), F(15709,10000)),
    ("PLAN-B' split@5 lo=15705, hi=15709", F(15705,10000), F(15709,10000)),
]:
    pa,pb,lo,hi,w=assembled(zl,zh)
    r=float(D5n2_hi-D5n2_lo)/float(w)
    print(f"\n{label}")
    print(f"  1/cutPi in [{pa},{pb}] = [{float(pa):.7f},{float(pb):.7f}] width {float(pb-pa):.7f}")
    print(f"  cutPi in [{2*zl},{2*zh}]")
    print(f"  1/a(0) in [{float(lo):.7f},{float(hi):.7f}] width {float(w):.8f}  {r:.1f}x narrower  nested={D5n2_lo<=lo and hi<=D5n2_hi}")
    print(f"  exact lo={lo}  hi={hi}")
    # dressed
    dlo=F(74)+(d/2)*la*pa; dhi=F(74)+(d/2)*lb*pb
    print(f"  dressed [{dlo},{dhi}] = [{float(dlo):.6f},{float(dhi):.6f}]")
