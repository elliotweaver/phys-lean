from fractions import Fraction as F
import mpmath as mp, math
mp.mp.dps = 120
def s(fr, n=25): return mp.nstr(mp.mpf(fr.numerator)/fr.denominator, n)

x = F(2, 9)
def partialCos(x, N):
    t=F(0)
    for i in range(N): t += F((-1)**i)*x**(2*i)/F(math.factorial(2*i))
    return t
def cosRemBound(x, N):
    return (x**(2*N)/F(math.factorial(2*N))) * (1 - x**2/F((2*N+1)*(2*N+2)))**(-1)
def partialExp(q, N):
    t=F(0)
    for i in range(N): t += q**i/F(math.factorial(i))
    return t
def expRemBound(q, N):
    return (q**N/F(math.factorial(N))) * (1 - q/F(N+1))**(-1)

print("############ s7 EXACT LITERAL LOCK-DOWN + VERIFICATION ############\n")

# (A) partialCos@7
pc7 = partialCos(x,7)
print(f"partialCos(2/9,7) = {pc7.numerator} / {pc7.denominator}")
crem7 = cosRemBound(x,7)
print(f"cosRemBound(2/9,7) ~ {s(crem7,6)}")
# clean bound: crem7 ~ 8.2e-21. Use 9/1e21? Check tightest simple bound.
crem_bnd = F(9, 10**21)
print(f"cosRemBound bound 9/1e21 >= crem7: {crem_bnd >= crem7}")

# (B) pB bracket on grid
# pB_lo = pc7 - crem_bnd rounded down; pB_hi = pc7 + crem_bnd rounded up (grid 5e17 style like banked s6 used /250000000000000)
# Banked s6 used /1e15 grid with 15-digit num. Go /1e18: 18-digit.
G=10**18
pB_lo = F(int(mp.floor((pc7 - crem_bnd)*G)), G)
pB_hi = F(int(mp.ceil ((pc7 + crem_bnd)*G)), G)
print(f"pB_lo = {pB_lo.numerator} / {pB_lo.denominator}")
print(f"pB_hi = {pB_hi.numerator} / {pB_hi.denominator}")
# verify: pB_lo <= partialCos@7 - crem_bnd  AND  partialCos@7 + crem_bnd <= pB_hi
print(f"  chk pB_lo <= pc7 - crem_bnd: {pB_lo <= pc7 - crem_bnd}")
print(f"  chk pc7 + crem_bnd <= pB_hi: {pc7 + crem_bnd <= pB_hi}")
print()

# (C) wB sqrt2 @ 1e18
w_true = mp.sqrt(2)
wB_lo = F(int(mp.floor(w_true*G)), G); wB_hi = F(int(mp.ceil(w_true*G)), G)
while wB_lo*wB_lo>2: wB_lo -= F(1,G)
while wB_hi*wB_hi<2: wB_hi += F(1,G)
print(f"wB_lo = {wB_lo.numerator} / {wB_lo.denominator}  (wB_lo^2<=2: {wB_lo*wB_lo<=2})")
print(f"wB_hi = {wB_hi.numerator} / {wB_hi.denominator}  (wB_hi^2>=2: {wB_hi*wB_hi>=2})")
print()

# (D) rB: rr=3-3pB^2
rr_lo = 3 - 3*pB_hi*pB_hi   # <= rr
rr_hi = 3 - 3*pB_lo*pB_lo   # >= rr
r_true = mp.sqrt(3-3*mp.cos(mp.mpf(2)/9)**2)
rB_lo = F(int(mp.floor(r_true*G))-2, G); rB_hi = F(int(mp.ceil(r_true*G))+2, G)
while rB_lo*rB_lo>rr_lo: rB_lo -= F(1,G)
while rB_hi*rB_hi<rr_hi: rB_hi += F(1,G)
print(f"rB_lo = {rB_lo.numerator} / {rB_lo.denominator}  (rB_lo^2<=rr_lo: {rB_lo*rB_lo<=rr_lo})")
print(f"rB_hi = {rB_hi.numerator} / {rB_hi.denominator}  (rB_hi^2>=rr_hi: {rB_hi*rB_hi>=rr_hi})")
print()

# (E) products
def flo(v): return F(int(mp.floor(mp.mpf(v.numerator)/v.denominator*G)), G)
def fhi(v): return F(int(mp.ceil (mp.mpf(v.numerator)/v.denominator*G)), G)
wp_lo=flo(wB_lo*pB_lo); wp_hi=fhi(wB_hi*pB_hi)
wr_lo=flo(wB_lo*rB_lo); wr_hi=fhi(wB_hi*rB_hi)
print(f"wp_lo = {wp_lo.numerator} / {wp_lo.denominator}  (<= wB_lo*pB_lo: {wp_lo<=wB_lo*pB_lo})")
print(f"wp_hi = {wp_hi.numerator} / {wp_hi.denominator}  (>= wB_hi*pB_hi: {wp_hi>=wB_hi*pB_hi})")
print(f"wr_lo = {wr_lo.numerator} / {wr_lo.denominator}  (<= wB_lo*rB_lo: {wr_lo<=wB_lo*rB_lo})")
print(f"wr_hi = {wr_hi.numerator} / {wr_hi.denominator}  (>= wB_hi*rB_hi: {wr_hi>=wB_hi*rB_hi})")
print()

# (F) amplitudes
b0_lo = 1 + wp_lo; b0_hi = 1 + wp_hi
b1_lo = 1 - (wp_hi+wr_hi)/2; b1_hi = 1 - (wp_lo+wr_lo)/2
print(f"b0_lo = {b0_lo.numerator} / {b0_lo.denominator}")
print(f"b0_hi = {b0_hi.numerator} / {b0_hi.denominator}")
print(f"b1_lo = {b1_lo.numerator} / {b1_lo.denominator}  (>0: {b1_lo>0})")
print(f"b1_hi = {b1_hi.numerator} / {b1_hi.denominator}")
print()

# (G) masses
mass0_lo=b0_lo*b0_lo; mass0_hi=b0_hi*b0_hi
mass1_lo=b1_lo*b1_lo; mass1_hi=b1_hi*b1_hi

# (H) m01 on 1e11 grid
Gm=10**11
m01_lo_real = mass0_lo/mass1_hi; m01_hi_real = mass0_hi/mass1_lo
m01_lo = F(int(mp.floor(mp.mpf(m01_lo_real.numerator)/m01_lo_real.denominator*Gm)), Gm)
m01_hi = F(int(mp.ceil (mp.mpf(m01_hi_real.numerator)/m01_hi_real.denominator*Gm)), Gm)
print(f"m01_lo = {m01_lo.numerator} / {m01_lo.denominator}  ~ {s(m01_lo)}")
print(f"m01_hi = {m01_hi.numerator} / {m01_hi.denominator}  ~ {s(m01_hi)}")
print(f"  lower lemma m01_lo*mass1_hi <= mass0_lo: {m01_lo*mass1_hi <= mass0_lo}")
print(f"  upper lemma mass0_hi <= m01_hi*mass1_lo: {mass0_hi <= m01_hi*mass1_lo}")
print(f"  m01 width: {s(m01_hi-m01_lo,4)}  strict lo<hi: {m01_lo<m01_hi}")
print()

# (I) cutLog via N=38 exp cert
N=38
cl_lo = F(815406111272599, 10**14)   # a
cl_hi = F(815406111272603, 10**14)   # b  (from sweep N=38)
# lower: partialExp(cl_lo,N)+rem <= m01_lo  AND cl_lo < N+1
print(f"cutLog N={N}:")
print(f"  a=cl_lo = {cl_lo.numerator}/{cl_lo.denominator}")
print(f"  chk cl_lo < N+1: {cl_lo < N+1}")
print(f"  chk partialExp(a,N)+rem <= m01_lo: {partialExp(cl_lo,N)+expRemBound(cl_lo,N) <= m01_lo}")
print(f"  b=cl_hi = {cl_hi.numerator}/{cl_hi.denominator}")
print(f"  chk m01_hi <= partialExp(b,N): {m01_hi <= partialExp(cl_hi,N)}")
print(f"  cutLog bracket [a,b] width: {s(cl_hi-cl_lo,4)}  strict a<b: {cl_lo<cl_hi}")
print(f"  NESTED in banked s6 [815406111272/1e11, 815406111273/1e11]:")
print(f"    815406111272/1e11 <= a: {F(815406111272,10**11) <= cl_lo}")
print(f"    b <= 815406111273/1e11: {cl_hi <= F(815406111273,10**11)}")
