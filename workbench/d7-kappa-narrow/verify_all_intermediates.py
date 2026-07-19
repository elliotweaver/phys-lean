from fractions import Fraction as F
from math import factorial
from mpmath import mp, mpf
mp.dps=100
def to_mpf(fr): return mpf(fr.numerator)/mpf(fr.denominator)
def pe(a,N): a=to_mpf(a); return sum(a**i/factorial(i) for i in range(N))
def rem(a,N): a=to_mpf(a); return (a**N/factorial(N))/(1-a/(N+1))
ok=True
def ck(n,c):
    global ok; print(("  OK  " if c else " FAIL ")+n); ok=ok and c

b0_lo=F(2379438171633255409,10**18); b0_hi=F(2379438171633255413,10**18)
wp_lo=F(1379438171633255409,10**18); wp_hi=F(1379438171633255413,10**18)
wr_lo=F(539862011928329837,10**18);  wr_hi=F(134965502982082463,250*10**15)

print("== mass0 / L_b0 idx 20/21 ==")
ck("5661726012625409/1e15<=b0_lo^2", F(5661726012625409,10**15)<=b0_lo*b0_lo)
ck("b0_hi^2<=5661726012625410/1e15", b0_hi*b0_hi<=F(5661726012625410,10**15))
ck("cert_lo b0 idx20", pe(F(173372879495463,10**14),20)+rem(F(173372879495463,10**14),20)<=to_mpf(F(5661726012625409,10**15)))
ck("cert_hi b0 idx21", to_mpf(F(5661726012625410,10**15))<=pe(F(173372879495464,10**14),21))

print("== mass2 / L_b2 idx 15/17 ==")
b2lo=1-(wp_hi-wr_lo)/2; b2hi=1-(wp_lo-wr_hi)/2
ck("5802119201475372/1e16<=b2lo", F(5802119201475372,10**16)<=b2lo)
ck("b2hi<=5802119201475373/1e16", b2hi<=F(5802119201475373,10**16))
ck("3366458722812920/1e16<=(5802119201475372/1e16)^2", F(3366458722812920,10**16)<=F(5802119201475372,10**16)**2)
ck("(5802119201475373/1e16)^2<=3366458722812923/1e16", F(5802119201475373,10**16)**2<=F(3366458722812923,10**16))
src2lo=F(10**16,3366458722812923); src2hi=F(10**16,3366458722812920)
ck("cert_lo b2^-1 idx15", pe(F(108872372522362,10**14),15)+rem(F(108872372522362,10**14),15)<=to_mpf(src2lo))
ck("cert_hi b2^-1 idx17", to_mpf(src2hi)<=pe(F(108872372522363,10**14),17))

print("== mbRatio / L_mb idx 26/29 ==")
q_lo=F(707106781186547,10**15); q_hi=F(707106781186548,10**15)
ck("q_lo^2<=1/2", q_lo*q_lo<=F(1,2)); ck("1/2<=q_hi^2", F(1,2)<=q_hi*q_hi)
mb_lo=(1-q_hi)**2/(3*(1+q_hi)); mb_hi=(1-q_lo)**2/(3*(1+q_lo))
ck("16750843898055717/1e18<=mb(q_hi)", F(16750843898055717,10**18)<=mb_lo)
ck("mb(q_lo)<=16750843898055843/1e18", mb_hi<=F(16750843898055843,10**18))
src3lo=F(10**18,16750843898055843); src3hi=F(10**18,16750843898055717)
ck("cert_lo mb^-1 idx26", pe(F(408930664000670,10**14),26)+rem(F(408930664000670,10**14),26)<=to_mpf(src3lo))
ck("cert_hi mb^-1 idx29", to_mpf(src3hi)<=pe(F(408930664000672,10**14),29))

print("== mass0 s7 (b0_lo_s7 etc) exact banked ==")
ck("b0_lo_s7^2 => 5661726012625409 floor ok", F(5661726012625409,10**15)<=b0_lo*b0_lo)

print("\nALL OK?", ok)
