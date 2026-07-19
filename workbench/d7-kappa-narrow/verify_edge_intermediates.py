"""Verify every intermediate rational bound the Rung4 Lean proof asserts, in exact Fraction arithmetic."""
from fractions import Fraction as F
from math import factorial
from mpmath import mp, mpf, log
mp.dps=100
def to_mpf(fr): return mpf(fr.numerator)/mpf(fr.denominator)
ok=True
def check(name, cond):
    global ok
    print(("  OK  " if cond else " FAIL ")+name)
    ok = ok and cond

# ---- s7 amplitude brackets (banked in Rung3) ----
b0_lo=F(2379438171633255409,10**18); b0_hi=F(2379438171633255413,10**18)
wp_lo=F(1379438171633255409,10**18); wp_hi=F(1379438171633255413,10**18)
wr_lo=F(539862011928329837,10**18);  wr_hi=F(134965502982082463,250*10**15)

print("=== mass0 s7 intermediate (cutLog_b0_ext8) ===")
# hm0lo: 5661726012625409/1e15 <= b0_lo^2  (nlinarith from mul_le_mul b0_lo b0_lo)
check("5661726012625409/1e15 <= b0_lo^2", F(5661726012625409,10**15) <= b0_lo*b0_lo)
# hm0hi: b0_hi^2 <= 5661726012625410/1e15
check("b0_hi^2 <= 5661726012625410/1e15", b0_hi*b0_hi <= F(5661726012625410,10**15))
# exp cert lower idx20: partialExp(a,20)+rem(a,20) <= 5661726012625409/1e15, a=173372879495463/1e14
def partialExp(a,N): a=to_mpf(a); return sum(a**i/factorial(i) for i in range(N))
def expRem(a,N): a=to_mpf(a); return (a**N/factorial(N))/(1-a/(N+1))
a=F(173372879495463,10**14)
check("cert_lo b0 idx20", partialExp(a,20)+expRem(a,20) <= to_mpf(F(5661726012625409,10**15)))
# exp cert upper idx21: 5661726012625410/1e15 <= partialExp(a_hi,21), a_hi=173372879495464/1e14
ah=F(173372879495464,10**14)
check("cert_hi b0 idx21", to_mpf(F(5661726012625410,10**15)) <= partialExp(ah,21))
print()

print("=== mass2 s7 intermediate (cutLog_b2_ext8) ===")
# hb2lo: 5802119201475371/1e16 <= b2 = 1-(wp_hi-wr_lo)/2
b2 = 1-(wp_hi-wr_lo)/2
check("5802119201475371/1e16 <= b2_lo(1-(wp_hi-wr_lo)/2)", F(5802119201475371,10**16) <= b2)
b2h = 1-(wp_lo-wr_hi)/2
check("b2_hi(1-(wp_lo-wr_hi)/2) <= 5802119201475372/1e16", b2h <= F(5802119201475372,10**16))
# mass2 lo/hi
check("3366458722812921/1e16 <= (5802119201475371/1e16)^2", F(3366458722812921,10**16) <= F(5802119201475371,10**16)**2)
check("(5802119201475372/1e16)^2 <= 3366458722812922/1e16", F(5802119201475372,10**16)**2 <= F(3366458722812922,10**16))
# invMass2: 1e16/3366458722812922 <= 1/mass2 <= 1e16/3366458722812921 -- reciprocal monotone, need mass2 in [lo,hi]
# cert for cutLog(1/mass2): idx16 lower a=108872372522362/1e14, src=1e16/3366458722812922
a2=F(108872372522362,10**14); src2lo=F(10**16,3366458722812922)
check("cert_lo b2^-1 idx16", partialExp(a2,16)+expRem(a2,16) <= to_mpf(src2lo))
a2h=F(108872372522363,10**14); src2hi=F(10**16,3366458722812921)
check("cert_hi b2^-1 idx17", to_mpf(src2hi) <= partialExp(a2h,17))
print()

print("=== mbRatio intermediate (cutLog_mb_ext8) ===")
q_lo=F(707106781186547,10**15); q_hi=F(707106781186548,10**15)
check("q_lo^2 <= 1/2 (for q_ext8_lo via q_sq)", q_lo*q_lo <= F(1,2))
check("1/2 <= q_hi^2 (for q_ext8_hi via q_sq)", F(1,2) <= q_hi*q_hi)
# mbRatio bounds: (1-q)^2/(3(1+q)) decreasing; lo uses q_hi, hi uses q_lo
mb_lo = (1-q_hi)**2/(3*(1+q_hi)); mb_hi=(1-q_lo)**2/(3*(1+q_lo))
check("16750843898055717/1e18 <= mb(q_hi)", F(16750843898055717,10**18) <= mb_lo)
check("mb(q_lo) <= 16750843898055843/1e18", mb_hi <= F(16750843898055843,10**18))
a3=F(408930664000671,10**14); src3lo=F(10**18,16750843898055843)
check("cert_lo mb^-1 idx28", partialExp(a3,28)+expRem(a3,28) <= to_mpf(src3lo))
a3h=F(408930664000672,10**14); src3hi=F(10**18,16750843898055717)
check("cert_hi mb^-1 idx29", to_mpf(src3hi) <= partialExp(a3h,29))
print()

print("ALL OK?" , ok)
