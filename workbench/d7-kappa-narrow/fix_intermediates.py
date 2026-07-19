from fractions import Fraction as F
from math import factorial
from mpmath import mp, mpf
mp.dps=100
def to_mpf(fr): return mpf(fr.numerator)/mpf(fr.denominator)
wp_lo=F(1379438171633255409,10**18); wp_hi=F(1379438171633255413,10**18)
wr_lo=F(539862011928329837,10**18);  wr_hi=F(134965502982082463,250*10**15)
# b2 = 1 - (wp - wr)/2, decreasing in wp, increasing in wr
b2_lo_exact = 1-(wp_hi-wr_lo)/2
b2_hi_exact = 1-(wp_lo-wr_hi)/2
print("b2_lo_exact =", float(b2_lo_exact), b2_lo_exact)
print("b2_hi_exact =", float(b2_hi_exact), b2_hi_exact)
# choose b2 bracket at 1e16 grid enclosing [b2_lo_exact, b2_hi_exact]
from mpmath import floor as mfloor, ceil as mceil
b2lo14 = F(int(mfloor(to_mpf(b2_lo_exact)*10**16)),10**16)
b2hi14 = F(int(mceil(to_mpf(b2_hi_exact)*10**16)),10**16)
print("b2 bracket 1e16: [%d, %d]/1e16" % (b2lo14.numerator*10**16//b2lo14.denominator if False else int(b2lo14*10**16), int(b2hi14*10**16)))
print("  b2lo14 <= b2_lo_exact?", b2lo14 <= b2_lo_exact, "  b2_hi_exact <= b2hi14?", b2_hi_exact <= b2hi14)
# mass2 = b2^2 bracket
m2lo = b2lo14*b2lo14; m2hi = b2hi14*b2hi14
print("mass2 in [%s, %s]" % (float(m2lo), float(m2hi)))
m2lo16 = F(int(mfloor(to_mpf(m2lo)*10**16)),10**16)
m2hi16 = F(int(mceil(to_mpf(m2hi)*10**16)),10**16)
print("mass2 bracket 1e16: [%d, %d]/1e16" % (int(m2lo16*10**16), int(m2hi16*10**16)))
print("  m2lo16<=b2lo14^2?", m2lo16<=b2lo14*b2lo14, "  b2hi14^2<=m2hi16?", b2hi14*b2hi14<=m2hi16)
print()

# mb^-1 idx: find the right index for cert_lo
def partialExp(a,N): a=to_mpf(a); return sum(a**i/factorial(i) for i in range(N))
def expRem(a,N): a=to_mpf(a); return (a**N/factorial(N))/(1-a/(N+1))
a3=F(408930664000671,10**14); src3lo=F(10**18,16750843898055843)
print("mb^-1 lower a=", float(a3), " src=", float(src3lo))
for N in range(26,40):
    lhs = partialExp(a3,N)+expRem(a3,N)
    print(f"  idx{N}: partialExp+rem={mp.nstr(lhs,20)}  <= src? {lhs <= to_mpf(src3lo)}  (need src={mp.nstr(to_mpf(src3lo),20)})")
    if lhs <= to_mpf(src3lo): break
# also cert_hi index for src3hi
a3h=F(408930664000672,10**14); src3hi=F(10**18,16750843898055717)
print("mb^-1 upper a=", float(a3h), " src=", float(src3hi))
for N in range(26,40):
    lhs = partialExp(a3h,N)
    if to_mpf(src3hi) <= lhs:
        print(f"  cert_hi idx{N}: OK  (partialExp={mp.nstr(lhs,20)} >= src={mp.nstr(to_mpf(src3hi),20)})"); break
