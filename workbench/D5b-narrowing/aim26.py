from fractions import Fraction as F
from math import factorial, log, sqrt, pi
import math
def pExp(q,N): return sum(q**i/F(factorial(i)) for i in range(N))
def eRem(q,N): return (q**N/F(factorial(N)))*(1/(1-q/F(N+1)))

q=F(8154,1000)  # ~8.154
e_true=math.exp(8.154)
print("e^8.154 =",e_true)
print("=== exp instrument at q=8.154: bracket [pExp, pExp+eRem] ===")
for N in range(18,26):
    ps=pExp(q,N); rm=eRem(q,N)
    print("N=%2d: pExp=%.5f pExp+rem=%.5f eRem=%.3e (gap-to-e=%.3e)"%(N,float(ps),float(ps+rm),float(rm),e_true-float(ps)))

# So cutLog width achievable ~ eRem at chosen N (converted via /e ~ /3477).
# The m01 width sets a FLOOR too. Balance: choose m01 window & index so both ~equal.
# Try: m01 window [3477.0,3478.0] (looser, from split@3 cutCos? no). 
# Actually: the achievable cutLog width at index N ~ 2*eRem/e. Let's tabulate:
print("\n=== cutLog width floor from exp instrument (2*eRem/e) ===")
for N in range(18,26):
    rm=eRem(q,N)
    print("N=%2d: cutLog-width-floor ~ %.2e"%(N,2*float(rm)/e_true))
# And m01 relative width at split@4 cutCos(2/9): m01 [3477.44,3477.48] rel=1.15e-5
print("\nm01 rel-width at split@4 cutCos(2/9): 1.15e-5 -> cutLog width floor from m01 ~1.15e-5")
print("=> to MATCH, need exp index ~21-22 (floor ~1e-5). At index 20 floor ~4e-5 (m01 not binding).")
