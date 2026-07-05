from fractions import Fraction as F
# cutCos(2/9), split at index 3 (mirror N339)
x=F(2,9)
from math import factorial
def costerm(n): return F((-1)**n)*x**(2*n)/factorial(2*n)
head3=sum(costerm(n) for n in range(3))
print("head3 =",head3,"=",float(head3))
base=abs(costerm(3)); print("base |term3| =",base,"=",float(base))
# ratio: x^2/((2n+7)(2n+8)) <= (4/81)/56 = 1/1134 at n=0
ratio=x**2/F(7*8); print("ratio n=0 =",ratio,"=",float(ratio))
# geometric tail sum = base/(1-ratio) = base*1134/1133
tail = base*F(1134,1133); print("tail geo bound =",tail,"=",float(tail))
lo=head3-tail; hi=head3+tail
print("cos(2/9) in [",float(lo),",",float(hi),"]")
print("bracket [975410/1e6, 975411/1e6]:")
print("  lo >= 975410/1e6 ?", lo>=F(975410,10**6), " float", float(lo)>=0.975410)
print("  hi <= 975411/1e6 ?", hi<=F(975411,10**6), " float", float(hi)<=0.975411)
# exact tail value
print("exact tail frac:",tail)
# ---- w = sqrt2 bracket ----
print("\nsqrt2: 1.414213^2 =",float(F(1414213,10**6)**2)," 1.414214^2 =",float(F(1414214,10**6)**2))
print("  1414213^2 < 2e12 ?", 1414213**2 < 2*10**12, "  1414214^2 > 2e12 ?", 1414214**2 > 2*10**12)
# ---- r = sqrt(3-3p^2) bracket over p-box ----
import mpmath as mp; mp.mp.dps=40
rlo_true=mp.sqrt(3-3*mp.mpf('0.975411')**2); rhi_true=mp.sqrt(3-3*mp.mpf('0.975410')**2)
print("\nr true range [",mp.nstr(rlo_true,12),",",mp.nstr(rhi_true,12),"]")
# choose r bracket [381732/1e6, 381742/1e6]; verify provable: r^2=3-3p^2
# at p=Phi: r^2 = 3-3*0.975411^2 ; need (381732/1e6)^2 <= that <= (381742/1e6)^2? no—
# lower: r>=381732/1e6 iff r^2>=(381732/1e6)^2 AND ... need r^2 min over box >= (rlo)^2
r2min=3-3*F(975411,10**6)**2; r2max=3-3*F(975410,10**6)**2
print("r^2 in [",float(r2min),",",float(r2max),"]")
print("  (381732/1e6)^2 <= r2min ?", F(381732,10**6)**2 <= r2min)
print("  (381742/1e6)^2 >= r2max ?", F(381742,10**6)**2 >= r2max)
