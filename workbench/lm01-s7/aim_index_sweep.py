from fractions import Fraction as F
import mpmath as mp, math
mp.mp.dps = 120

# s7 m01 bracket
m01_lo = F(347747283710459, 10**11)
m01_hi = F(17387364185523, 5*10**9)

def partialExp(q, N):
    s = F(0)
    for i in range(N):
        s += q**i / F(math.factorial(i))
    return s
def expRemBound(q, N):
    return (q**N / F(math.factorial(N))) * (1 - q / F(N+1))**(-1)

Lval = mp.log(mp.mpf(m01_lo.numerator)/m01_lo.denominator)

# Show achievable cutLog bracket width for a RANGE of N; also show the digit-length of the
# largest factorial (proxy for norm_num cost).
print("Lval ~", mp.nstr(Lval, 25))
print("m01 width induces cutLog window ~", mp.nstr((mp.mpf(m01_hi.numerator)/m01_hi.denominator - mp.mpf(m01_lo.numerator)/m01_lo.denominator)/(mp.mpf(m01_lo.numerator)/m01_lo.denominator),5))
print()
for N in [32, 34, 36, 38, 40]:
    Ga = 10**14
    # lower a: partialExp(a,N)+rem <= m01_lo, a as large as possible
    a = F(int(mp.floor(Lval*Ga)), Ga)
    t=0
    while partialExp(a,N) + expRemBound(a,N) > m01_lo and t<300: a -= F(1,Ga); t+=1
    t=0
    while partialExp(a+F(1,Ga),N) + expRemBound(a+F(1,Ga),N) <= m01_lo and t<300: a += F(1,Ga); t+=1
    lo_ok = (partialExp(a,N)+expRemBound(a,N) <= m01_lo) and (a < N+1)
    # upper b: m01_hi <= partialExp(b,N)
    b = F(int(mp.ceil(Lval*Ga)), Ga)
    t=0
    while m01_hi > partialExp(b,N) and t<300: b += F(1,Ga); t+=1
    t=0
    while m01_hi <= partialExp(b-F(1,Ga),N) and t<300: b -= F(1,Ga); t+=1
    hi_ok = (m01_hi <= partialExp(b,N))
    w = b-a
    print(f"N={N}: width={mp.nstr(mp.mpf(w.numerator)/w.denominator,4)}  lo_ok={lo_ok} hi_ok={hi_ok}  a<b={a<b}")
    print(f"      a={a.numerator}/{a.denominator}")
    print(f"      b={b.numerator}/{b.denominator}")
    print(f"      max factorial digits (N!): {len(str(math.factorial(N)))}")
print()
print("banked s6: N=36, cutLog width 1e-11 (m01 width 3e-6). max factorial digits N=36:", len(str(math.factorial(36))))
