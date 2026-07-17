from fractions import Fraction as F
import math

mass0_lo = F(237943,100000)**2
mass0_hi = F(237944,100000)**2
mass1_lo = F(4034,100000)**2
mass1_hi = F(40365,1000000)**2

m01_lo_true = mass0_lo/mass1_hi
m01_hi_true = mass0_hi/mass1_lo
print(f"DIRECT m01 true [{float(m01_lo_true):.6f}, {float(m01_hi_true):.6f}]")

# clean rational OUTER bracket
m01_lo = F(34748,10)   # 3474.8  <= 3474.849
m01_hi = F(34792,10)   # 3479.2  >= 3479.187
print(f"m01_lo={m01_lo}={float(m01_lo)}  <= true_lo? {m01_lo<=m01_lo_true} slack {float(m01_lo_true-m01_lo):.5f}")
print(f"m01_hi={m01_hi}={float(m01_hi)}  >= true_hi? {m01_hi>=m01_hi_true} slack {float(m01_hi-m01_hi_true):.5f}")

# cutLog bracket
cl_lo=F(8153,1000); cl_hi=F(8155,1000)
print(f"\ncutLog true [{math.log(float(m01_lo_true)):.6f},{math.log(float(m01_hi_true)):.6f}]")
print(f"cutLog bracket [{cl_lo}={float(cl_lo)}, {cl_hi}={float(cl_hi)}] width {cl_hi-cl_lo}={float(cl_hi-cl_lo)}")
print(f"  e^cl_lo={math.exp(float(cl_lo)):.4f} <= m01_lo={float(m01_lo)}? {math.exp(float(cl_lo))<=float(m01_lo)}")
print(f"  e^cl_hi={math.exp(float(cl_hi)):.4f} >= m01_hi={float(m01_hi)}? {math.exp(float(cl_hi))>=float(m01_hi)}")

def partialExp(q,N):
    q=F(q); s=F(0)
    for i in range(N): s += q**i/math.factorial(i)
    return s
def expRemBound(q,N):
    q=F(q); return q**N/math.factorial(N)/(1-q/(N+1))

print("\n=== exp indices ===")
for N in [17,18]:
    v=partialExp(cl_lo,N)+expRemBound(cl_lo,N)
    print(f"  LOWER N={N} (cl_lo<{N+1}? {float(cl_lo)<N+1}): pE+rem={float(v):.5f} <= {float(m01_lo)}? {v<=m01_lo}")
for N in [20,21]:
    v=partialExp(cl_hi,N)
    print(f"  UPPER N={N}: pE={float(v):.5f} >= {float(m01_hi)}? {m01_hi<=v}")

# ===== assembled width: split@5 1/cutPi + sharpened cutLog =====
d=F(16,3)
D5n2_lo,D5n2_hi=F(48290,711),F(159646,2349)
# 1/cutPi from split@5: cutPi in [2*z_lo, 2*z_hi], z_lo=15707/1e4, z_hi=15709/1e4
zl,zh=F(15707,10000),F(15709,10000)
pa,pb=F(1)/(2*zh),F(1)/(2*zl)     # 1/cutPi in [pa,pb]
la,lb=cl_lo,cl_hi
lo=F(190,3)+(d/3)*la*pa
hi=F(190,3)+(d/3)*lb*pb
w=hi-lo
print(f"\n=== PLAN-C: split@5 1/cutPi + direct-sharpened cutLog ===")
print(f"  cutPi in [{2*zl},{2*zh}]  1/cutPi in [{pa},{pb}]=[{float(pa):.7f},{float(pb):.7f}] width {float(pb-pa):.2e}")
print(f"  cutLog in [{la},{lb}]=[{float(la)},{float(lb)}] width {float(lb-la)}")
print(f"  1/a(0) in [{float(lo):.7f},{float(hi):.7f}] width {float(w):.8f}")
print(f"  {float(D5n2_hi-D5n2_lo)/float(w):.1f}x narrower than D5-next-2  nested? {D5n2_lo<=lo and hi<=D5n2_hi}")
print(f"  exact lo={lo}")
print(f"  exact hi={hi}")
dlo=F(74)+(d/2)*la*pa; dhi=F(74)+(d/2)*lb*pb
print(f"  dressed [{dlo},{dhi}]=[{float(dlo):.6f},{float(dhi):.6f}]")
print(f"  dressed exact lo={dlo} hi={dhi}")

# also PLAN-B (split@5 1/cutPi, keep OLD cutLog [163/20,8157/1000]) for comparison
la2,lb2=F(163,20),F(8157,1000)
lo2=F(190,3)+(d/3)*la2*pa; hi2=F(190,3)+(d/3)*lb2*pb
print(f"\nPLAN-B (split@5 + OLD cutLog): width {float(hi2-lo2):.8f}  {float(D5n2_hi-D5n2_lo)/float(hi2-lo2):.1f}x")
