import math
from fractions import Fraction as F

def a(x,n):  # |term| = x^{2n}/(2n)!
    return x**(2*n)/math.factorial(2*n)

def head(x,m):  # sum_{i<m} (-1)^i x^{2i}/(2i)!  (m terms, indices 0..m-1)
    s=F(0)
    for i in range(m):
        s+= F((-1)**i)*x**(2*i)/F(math.factorial(2*i))
    return s

# UPPER bound on cutCos: split@m, |tail_{n>=m}| <= a(x,m)/(1 - ratio), ratio=x^2/((2m+1)(2m+2))
def upper(x,m):
    first=a(x,m); ratio=x**2/((2*m+1)*(2*m+2))
    if ratio>=1: return None
    geo=first/(1-ratio)
    return head(x,m)+F(geo).limit_denominator(10**9)

print("=== find cleanest z_hi with cutCos(z_hi) certifiably < 0 (split@m upper) ===")
for zh in [F(8,5),F(33,20),F(53,32),F(17,10),F(7,4)]:
    x=float(zh)
    row=[f"z_hi={zh}={x:.4f} cos={math.cos(x):.5f}"]
    for m in [2,3,4,5]:
        first=a(x,m); ratio=x**2/((2*m+1)*(2*m+2))
        geo=first/(1-ratio) if ratio<1 else float('inf')
        u=float(head(x,m))+geo
        row.append(f"m{m}:{u:+.4f}")
    print(" ".join(row))

print()
print("=== LOWER bound: cutCos>0 on [0,z_lo). tool cutCos x >= head(m_even)?  ===")
# For lower bound need cutCos x > 0 for all x in [0,z_lo). 
# Leibniz lower: with last included term index odd (m even, indices 0..m-1 last odd), P_m <= S.
# So cutCos x >= head(m) with m even? No: P_m<=S means head(m)<=cutCos. last idx=m-1 odd => m even.
# head(2): indices 0,1 last idx1 odd => head(2)=1-x^2/2 <= cutCos x.  LOWER bound = 1-x^2/2.
# Need 1-x^2/2>0 for x<z_lo, i.e worst at x->z_lo: 1-z_lo^2/2>0 => z_lo<sqrt2=1.41421
for zl in [F(7,5),F(141,100),F(283,200),F(1414,1000)]:
    x=float(zl)
    print(f"z_lo={zl}={x:.5f}: 1-z_lo^2/2 = {float(1-zl**2/2):+.6f}  (cos({x:.4f})={math.cos(x):.5f})")

print()
print("=== resulting brackets ===")
for (zl,zh) in [(F(7,5),F(17,10)), (F(141,100),F(33,20)), (F(7,5),F(8,5))]:
    lo_pi=1/(2*float(zh)); hi_pi=1/(2*float(zl))
    print(f"leastCosZero in [{zl},{zh}] => 1/cutPi in [{F(1,2)/zh},{F(1,2)/zl}] = [{lo_pi:.5f},{hi_pi:.5f}] width {hi_pi-lo_pi:.5f} (actual {1/math.pi:.5f})")
