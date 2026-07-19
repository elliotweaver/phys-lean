from fractions import Fraction as F
import mpmath as mp, math
mp.mp.dps = 120

# s7 m01 bracket (banked target from aim_s7.py)
m01_lo = F(347747283710459, 10**11)   # 3477.47283710459
m01_hi = F(17387364185523, 5*10**9)   # 3477.4728371046

def partialExp(q, N):
    s = F(0)
    for i in range(N):
        s += q**i / F(math.factorial(i))
    return s

def expRemBound(q, N):
    # (q^N / N!) * (1 - q/(N+1))^-1   (requires q < N+1)
    return (q**N / F(math.factorial(N))) * (1 - q / F(N+1))**(-1)

# cutLog value
Lval = mp.log(mp.mpf(m01_lo.numerator)/m01_lo.denominator)
print("cutLog(m01_lo) ~", mp.nstr(Lval, 30))
print("cutLog(m01_hi) ~", mp.nstr(mp.log(mp.mpf(m01_hi.numerator)/m01_hi.denominator), 30))
print()

# For lower: find largest rational a (on grid Ga) s.t. partialExp(a,N)+expRemBound(a,N) <= m01_lo
# For upper: find smallest rational b (on grid Ga) s.t. m01_hi <= partialExp(b,N)
# Try a range of N to see where the remainder stops limiting.
for N in [40, 42, 44, 46, 48, 50]:
    Ga = 10**14
    # guess a near Lval, need it a bit below
    a_guess = F(int(mp.floor(Lval*Ga)), Ga)
    # lower: increase a while cond holds
    a = a_guess
    # First back off to make sure it holds
    tries = 0
    while partialExp(a,N) + expRemBound(a,N) > m01_lo and tries < 200:
        a -= F(1, Ga); tries += 1
    # now push up
    tries=0
    while partialExp(a + F(1,Ga), N) + expRemBound(a + F(1,Ga), N) <= m01_lo and tries < 200:
        a += F(1, Ga); tries += 1
    lo_ok = (partialExp(a,N) + expRemBound(a,N) <= m01_lo) and (a < N+1)

    # upper: b near Lval, need m01_hi <= partialExp(b,N)
    b = F(int(mp.ceil(Lval*Ga)), Ga)
    tries=0
    while m01_hi > partialExp(b,N) and tries < 200:
        b += F(1, Ga); tries += 1
    tries=0
    while m01_hi <= partialExp(b - F(1,Ga), N) and tries < 200:
        b -= F(1, Ga); tries += 1
    hi_ok = (m01_hi <= partialExp(b,N))

    width = b - a
    print(f"N={N}: a={a.numerator}/{a.denominator} ({mp.nstr(mp.mpf(a.numerator)/a.denominator,18)}), lo_ok={lo_ok}")
    print(f"       b={b.numerator}/{b.denominator} ({mp.nstr(mp.mpf(b.numerator)/b.denominator,18)}), hi_ok={hi_ok}")
    print(f"       cutLog bracket width = {mp.nstr(mp.mpf(width.numerator)/width.denominator,5)}  (a<=cutLog<=b, a<b: {a<b})")
    print()
