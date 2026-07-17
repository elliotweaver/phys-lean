from fractions import Fraction as F
import math

# banked mass brackets (squared rational endpoints) from GenerationMassRatiosNumeric
mass0_lo = F(237943,100000)*F(237943,100000)
mass0_hi = F(237944,100000)*F(237944,100000)
mass1_lo = F(4034,100000)*F(4034,100000)
mass1_hi = F(40365,1000000)*F(40365,1000000)
mass2_lo = F(5802,10000)*F(5802,10000)
mass2_hi = F(58022,100000)*F(58022,100000)

print("mass0 in", (float(mass0_lo),float(mass0_hi)))
print("mass1 in", (float(mass1_lo),float(mass1_hi)))
print("mass2 in", (float(mass2_lo),float(mass2_hi)))

# ---- DIRECT m01 = mass0/mass1 bracket (tighter than the mass2-detour massRatio route) ----
m01_lo_true = mass0_lo/mass1_hi   # mass0>=lo, mass1<=hi
m01_hi_true = mass0_hi/mass1_lo
print(f"\nDIRECT m01 = mass0/mass1 in [{float(m01_lo_true):.5f}, {float(m01_hi_true):.5f}] width {float(m01_hi_true-m01_lo_true):.4f}")
print(f"  exact m01_lo_true = {m01_lo_true}")
print(f"  exact m01_hi_true = {m01_hi_true}")

# current banked m01 for reference
cur_lo, cur_hi = F(1000000000,288575), F(1000000000,286902)
print(f"CURRENT banked m01 in [{float(cur_lo):.5f},{float(cur_hi):.5f}] width {float(cur_hi-cur_lo):.4f}")

# pick clean rational endpoints just OUTSIDE the true direct bracket so interval-div nlinarith closes
# m01_lo <= m01_lo_true, m01_hi >= m01_hi_true
m01_lo = F(34747,10)   # 3474.7
m01_hi = F(34791,10)   # 3479.1
print(f"\nCHOSEN m01 bracket [{m01_lo}={float(m01_lo)}, {m01_hi}={float(m01_hi)}]")
print(f"  m01_lo <= true_lo ? {m01_lo <= m01_lo_true}   (slack {float(m01_lo_true-m01_lo):.4f})")
print(f"  m01_hi >= true_hi ? {m01_hi >= m01_hi_true}   (slack {float(m01_hi-m01_hi_true):.4f})")

# cutLog range for chosen m01
print(f"\ncutLog(m01) true range ~ [{math.log(float(m01_lo_true)):.6f}, {math.log(float(m01_hi_true)):.6f}]")
print(f"cutLog of chosen endpoints ~ [ln({float(m01_lo)})={math.log(float(m01_lo)):.6f}, ln({float(m01_hi)})={math.log(float(m01_hi)):.6f}]")

# choose cutLog rational bracket endpoints:
#   cutLog_lo <= cutLog(m01):  need partialExp(cutLog_lo,N)+expRemBound(cutLog_lo,N) <= m01_lo  (cutLog_ge_certified with c=m01_lo)
#   cutLog_hi >= cutLog(m01):  need m01_hi <= partialExp(cutLog_hi,N)  (cutLog_le_certified with c=m01_hi)
# cutLog(m01) in ~[8.1535, 8.1549]. Pick cutLog_lo=8153/1000=8.153, cutLog_hi=8155/1000=8.155
cl_lo = F(8153,1000); cl_hi = F(8155,1000)
print(f"\nCHOSEN cutLog bracket [{cl_lo}={float(cl_lo)}, {cl_hi}={float(cl_hi)}] width {float(cl_hi-cl_lo)}")
print(f"  need e^{float(cl_lo)} <= m01_lo={float(m01_lo)}:  e^cl_lo={math.exp(float(cl_lo)):.4f}  {'OK' if math.exp(float(cl_lo))<=float(m01_lo) else 'FAIL'}")
print(f"  need e^{float(cl_hi)} >= m01_hi={float(m01_hi)}:  e^cl_hi={math.exp(float(cl_hi)):.4f}  {'OK' if math.exp(float(cl_hi))>=float(m01_hi) else 'FAIL'}")

# exp partial-sum certified-index requirement
def partialExp(q,N):
    q=F(q); s=F(0)
    for i in range(N):
        s += q**i/math.factorial(i)
    return s
def expRemBound(q,N):
    # expRemBound q N = q^N/N! * (1/(1-q/(N+1)))  (geometric tail) -- check actual def
    q=F(q)
    return q**N/math.factorial(N) / (1 - q/(N+1))

print("\n=== exp certified-index checks ===")
# LOWER: partialExp(cl_lo,N)+expRemBound(cl_lo,N) <= m01_lo, with cl_lo < N+1
for N in [16,17,18,19,20,21,22]:
    if float(cl_lo) < N+1:
        val = partialExp(cl_lo,N)+expRemBound(cl_lo,N)
        ok = val <= m01_lo
        print(f"  LOWER N={N}: partialExp+rem(cl_lo)={float(val):.4f}  <= m01_lo={float(m01_lo)} ? {ok}")
        if ok: break
# UPPER: m01_hi <= partialExp(cl_hi,N)
for N in [16,17,18,19,20,21,22,23,24]:
    val = partialExp(cl_hi,N)
    ok = m01_hi <= val
    print(f"  UPPER N={N}: partialExp(cl_hi)={float(val):.4f}  >= m01_hi={float(m01_hi)} ? {ok}")
    if ok: break
