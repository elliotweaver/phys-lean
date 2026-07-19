from fractions import Fraction as F
from math import factorial
def pE(y,N): return sum(y**i/F(factorial(i)) for i in range(N))
def rem(y,N): return (y**N/F(factorial(N)))/(1-y/(N+1))

b2L = F(58021192014752, 10**14); b2H = F(58021192014755, 10**14)
b2Lsq = b2L*b2L; b2Hsq = b2H*b2H
print("b2L^2 = %.18f" % float(b2Lsq))
print("b2H^2 = %.18f" % float(b2Hsq))
# mass2 clean /1e15 OUTWARD:
m2L = F(336645872281271, 10**15)  # below b2L^2 (0.336645872281272..)
m2H = F(336645872281307, 10**15)  # above b2H^2 (0.336645872281306..)
print("m2L=%.16f <= b2L^2? %s"%(float(m2L), m2L<=b2Lsq))
print("m2H=%.16f >= b2H^2? %s"%(float(m2H), m2H>=b2Hsq))
inv2_lo=1/m2H; inv2_hi=1/m2L
print("1/mass2 [%.14f, %.14f]  width %.2e"%(float(inv2_lo),float(inv2_hi), float(inv2_hi-inv2_lo)))
# cutLog(1/mass2) ref 1.08872372522362129; target [10887237252236/1e13, 10887237252237/1e13]
u_lo=F(10887237252236,10**13); u_hi=F(10887237252237,10**13)
for N in range(14,24):
    v=pE(u_lo,N)+rem(u_lo,N)
    if v <= inv2_lo: print("L_b2 lo cert N=%d ok (%.15f<=%.15f)"%(N,float(v),float(inv2_lo))); break
for N in range(14,24):
    if inv2_hi <= pE(u_hi,N): print("L_b2 hi cert N=%d ok"%N); break
print("mass2 bracket [%s, %s]" % (m2L, m2H))
