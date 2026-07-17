from fractions import Fraction as F
import mpmath as mp, math
mp.mp.dps = 60
def fn(fr,n=22): return mp.nstr(mp.mpf(fr.numerator)/fr.denominator,n)

def partialExp(L, N):
    s = F(0)
    for k in range(N): s += L**k / math.factorial(k)
    return s
def expRemBound(L,N):
    return L**N/F(math.factorial(N)) * 1/(1 - L/F(N+1))

m01_lo = F(3477472837103, 10**9)
m01_hi = F(3477472837106, 10**9)
clo = F(815406111272, 10**11)   # cutLog lower target
chi = F(815406111273, 10**11)   # cutLog upper target
N = 36

# Lower certification: partialExp(clo,N)+expRemBound(clo,N) <= m01_lo  => clo <= cutLog(m01_lo) <= cutLog(m01)
lhs_lower = partialExp(clo,N) + expRemBound(clo,N)
print("LOWER: partialExp(clo,36)+expRemBound(clo,36) <= m01_lo :", lhs_lower <= m01_lo)
print("   lhs =", fn(lhs_lower,20), "  m01_lo =", fn(m01_lo,20), " slack =", float(m01_lo - lhs_lower))

# Upper certification: m01_hi <= partialExp(chi,N)  => cutLog(m01) <= cutLog(m01_hi) <= chi
rhs_upper = partialExp(chi,N)
print("UPPER: m01_hi <= partialExp(chi,36) :", m01_hi <= rhs_upper)
print("   m01_hi =", fn(m01_hi,20), "  partialExp =", fn(rhs_upper,20), " slack =", float(rhs_upper - m01_hi))
print()

# Now the assembled endpoints
pinv_lo = F(1250000000,3926990817)
pinv_hi = F(5000000000,15707963267)
d = F(16,3)
lo = F(190,3) + (d/3)*clo*pinv_lo
hi = F(190,3) + (d/3)*chi*pinv_hi
print("assembled lo =", lo, "=", fn(lo,25))
print("assembled hi =", hi, "=", fn(hi,25))
print("width =", float(mp.mpf((hi-lo).numerator)/(hi-lo).denominator))
# dressed: 74 + (d/2)*cutLog*(1/cutPi)
dlo = F(74) + (d/2)*clo*pinv_lo
dhi = F(74) + (d/2)*chi*pinv_hi
print("dressed lo =", dlo, "=", fn(dlo,25))
print("dressed hi =", dhi, "=", fn(dhi,25))
print()
# nesting check vs parent [2401465987690/35342917353, 9605863954190/141371669403]
plo = F(2401465987690,35342917353); phi = F(9605863954190,141371669403)
print("parent lo=",fn(plo,25)," parent hi=",fn(phi,25))
print("nested lower (plo <= lo):", plo <= lo, "   nested upper (hi <= phi):", hi <= phi)
print("strictly narrower:", (hi-lo) < (phi-plo))
print("gt waypoint 190/3 < lo:", F(190,3) < lo)
