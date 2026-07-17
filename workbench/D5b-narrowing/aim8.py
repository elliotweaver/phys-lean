from fractions import Fraction as F
import math

# cos partial sum & remainder majorant (cosRemBound x N <= x^{2N}/(2N)! * 2)
def partialCos(x,N):
    x=F(x); s=F(0)
    for i in range(N):
        s += F((-1)**i) * x**(2*i) / math.factorial(2*i)
    return s
def cosRemMaj(x,N):
    # the majorant used in production: x^{2N}/(2N)! * 2
    x=F(x)
    return x**(2*N)*2/math.factorial(2*N)
def cosRemExact(x,N):
    x=F(x)
    return x**(2*N)/math.factorial(2*N) / (1 - x**2/((2*N+1)*(2*N+2)))

# LOWER positivity poly (production style): partialCos(x,N) - x^{2N}/(2N)!*2 > 0  for x in [0,z_lo)
def lowerPoly(x,N):
    return partialCos(x,N) - cosRemMaj(x,N)
# UPPER sign at a single point: partialCos(x,N) + cosRemExact(x,N) < 0
def upperVal(x,N):
    return partialCos(x,N)+cosRemExact(x,N)

PI2 = math.pi/2
print(f"pi/2 = {PI2:.9f}\n")

# The lower positivity must hold for ALL x<z_lo; worst case is x=z_lo (poly decreasing near pi/2).
# So certify lowerPoly(z_lo,N)>0 (nlinarith will need this to hold with slack across [0,z_lo)).
for N in [4,5,6,7]:
    print(f"=== split@{N} LOWER positivity: largest z_lo with lowerPoly(z_lo,{N})>0 ===")
    best=None
    for milli in range(1560,15720):
        zl=F(milli,10000) if milli>2000 else F(milli,1000)
    # scan fine grid near pi/2
    for zl in [F(v,10000) for v in range(15600,15709)]:
        v=lowerPoly(zl,N)
        if v>0: best=zl
    # report a few around the ceiling
    print(f"   ceiling z_lo ~ {best}={float(best):.5f}  (pi/2-{float(PI2-best):.6f})")
    for zl in [best-F(2,10000),best,best+F(1,10000)]:
        print(f"     z_lo={zl}={float(zl):.5f}: lowerPoly={float(lowerPoly(zl,N)):+.9f}")
    print()

print("=== UPPER sign: smallest z_hi with upperVal(z_hi,N)<0 ===")
for N in [4,5,6,7]:
    best=None
    for zh in [F(v,10000) for v in range(15709,15900)]:
        if upperVal(zh,N)<0:
            best=zh; break
    print(f"   split@{N}: smallest z_hi ~ {best}={float(best):.5f} (pi/2+{float(best-PI2):.6f}), val={float(upperVal(best,N)):+.9f}")

# assembled width for chosen brackets
d=F(16,3); la,lb=F(163,20),F(8157,1000)
D5n2_lo,D5n2_hi=F(48290,711),F(159646,2349)
def assembled(zl,zh):
    pa,pb=F(1)/(2*zh),F(1)/(2*zl)
    lo=F(190,3)+(d/3)*la*pa; hi=F(190,3)+(d/3)*lb*pb
    return pa,pb,lo,hi,hi-lo
print("\n=== assembled width candidates ===")
for label,zl,zh in [
    ("split@5 z_lo=15705/1e4,z_hi=15711/1e4", F(15705,10000), F(15711,10000)),
    ("split@6 z_lo=157075/1e5,z_hi=157085/1e5", F(157075,100000), F(157085,100000)),
]:
    pa,pb,lo,hi,w=assembled(zl,zh)
    r=float(D5n2_hi-D5n2_lo)/float(w)
    print(f"{label}: 1/cutPi in [{float(pa):.6f},{float(pb):.6f}] width {float(w):.8f}  {r:.1f}x  nested={D5n2_lo<=lo and hi<=D5n2_hi}")
