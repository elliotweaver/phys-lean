from fractions import Fraction as F
import math

# ---- cos instrument majorant polys (using cosRemBound <= term*2 factor) ----
# split@N LOWER positivity poly in x:  partialCos(x,N) - x^{2N}/(2N)! * 2
# split@4: 1 - x^2/2 + x^4/24 - x^6/720 - x^8/20160   (2*8!=20160? 8!=40320, /2 =>20160) OK
# split@5: 1 - x^2/2 + x^4/24 - x^6/720 + x^8/40320 - x^10/1814400  (10!=3628800,/2=1814400)
def p4(x):
    return 1 - x**2/2 + x**4/24 - x**6/720 - x**8/20160
def p5(x):
    return 1 - x**2/2 + x**4/24 - x**6/720 + x**8/40320 - x**10/1814400

# UPPER sign (cutCos(x)<0): partialCos(x,N)+cosRemBound(x,N) < 0
# cosRemBound(x,N) = (x^{2N}/(2N)!) * (1 - x^2/((2N+1)(2N+2)))^{-1}
def partialCos(x,N):
    s=F(0)
    for i in range(N):
        s += F((-1)**i) * F(x)**(2*i) / math.factorial(2*i)
    return s
def cosRem(x,N):
    x=F(x)
    num = x**(2*N)/math.factorial(2*N)
    fac = 1 - x**2/((2*N+1)*(2*N+2))
    return num / fac
def upper_neg(x,N):
    x=F(x)
    return partialCos(x,N)+cosRem(x,N) < 0, float(partialCos(x,N)+cosRem(x,N))

PI2 = math.pi/2
print(f"pi/2 = {PI2:.7f}")

print("\n=== split@4 LOWER: largest z_lo with p4(z_lo^2)>0 ===")
for num in range(1565,1572):
    zl=F(num,1000); t=zl**2
    ok = p4(t)>0
    print(f"  z_lo={zl}={float(zl):.4f}: p4={float(p4(t)):+.7f} {'OK' if ok else 'FAIL'}")

print("\n=== split@5 LOWER: largest z_lo with p5(z_lo^2)>0 ===")
for num in [1566,1567,1568,1569,1570,15705,15707,15708]:
    den = 1000 if num<10000 else 10000
    zl=F(num,den); t=zl**2
    ok=p5(t)>0
    print(f"  z_lo={zl}={float(zl):.5f}: p5={float(p5(t)):+.9f} {'OK' if ok else 'FAIL'}")

print("\n=== split@4 UPPER: smallest z_hi with cutCos(z_hi)<0 ===")
for num in range(1571,1581):
    zh=F(num,1000)
    ok,val=upper_neg(zh,4)
    print(f"  z_hi={zh}={float(zh):.4f}: partialCos+rem={val:+.7f} {'OK(<0)' if ok else 'FAIL'}")

print("\n=== split@5 UPPER: smallest z_hi with cutCos(z_hi)<0 ===")
for num in [15709,15710,15712,15715,1572,1573]:
    den=10000 if num>10000 else 1000
    zh=F(num,den)
    ok,val=upper_neg(zh,5)
    print(f"  z_hi={zh}={float(zh):.5f}: partialCos+rem={val:+.9f} {'OK(<0)' if ok else 'FAIL'}")

# ---- assembled width for candidate brackets ----
d=F(16,3)
D5n2_lo,D5n2_hi=F(48290,711),F(159646,2349)   # D5-next-2 bracket
la,lb=F(163,20),F(8157,1000)                   # cutLog [8.150,8.157] (m01 floor)
def assembled(zl,zh):
    pa,pb=F(1)/(2*zh),F(1)/(2*zl)              # 1/cutPi in [1/(2 z_hi), 1/(2 z_lo)]
    lo=F(190,3)+(d/3)*la*pa
    hi=F(190,3)+(d/3)*lb*pb
    return pa,pb,lo,hi,hi-lo
print("\n=== candidate assembled brackets ===")
cands=[
    ("split@4 both, z_lo=157/100? (check), z_hi=157/100? no"),
]
for label,zl,zh in [
    ("D5-next-2 (split@4)", F(783,500), F(79,50)),
    ("split@4 tighter z_hi=1573/1000", F(783,500), F(1573,1000)),
    ("split@4 z_lo=1567/1000,z_hi=1573/1000", F(1567,1000), F(1573,1000)),
    ("split@5 z_lo=157/100,z_hi=1572/1000", F(157,100), F(1572,1000)),
    ("split@5 z_lo=157/100,z_hi=15710/10000", F(157,100), F(15710,10000)),
    ("split@5 z_lo=15707/10000,z_hi=15710/10000", F(15707,10000), F(15710,10000)),
]:
    pa,pb,lo,hi,w=assembled(zl,zh)
    nested = D5n2_lo<=lo and hi<=D5n2_hi
    ratio = float(D5n2_hi-D5n2_lo)/float(w)
    print(f"\n{label}")
    print(f"  z_lo={zl}({float(zl):.5f}) z_hi={zh}({float(zh):.5f})")
    print(f"  1/cutPi in [{pa},{pb}]=[{float(pa):.6f},{float(pb):.6f}]  cutPi in [{2*zl},{2*zh}]")
    print(f"  1/a(0) in [{float(lo):.6f},{float(hi):.6f}] width {float(w):.7f}  {ratio:.2f}x narrower than D5n2  nested={nested}")
    print(f"  exact lo={lo}  hi={hi}")

print("\n=== D5-next-2 width for reference ===")
print(f"  width = {float(D5n2_hi-D5n2_lo):.7f} = {D5n2_hi-D5n2_lo}")
