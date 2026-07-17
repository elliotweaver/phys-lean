from fractions import Fraction as F
from math import factorial, pi

def partialCos(x, N):
    s = F(0)
    for i in range(N):
        s += F((-1)**i) * x**(2*i) / factorial(2*i)
    return s

def cosRemBound(x, N):
    base = x**(2*N)/F(factorial(2*N))
    denom = 1 - x*x/F((2*N+1)*(2*N+2))
    return base/denom

DEN=10**7
piN = 15707963  # pi/2 ~ 1.5707963

# LOWER: largest num < piN s.t. partialCos(num/DEN,N)-cosRemBound>0. Bisect on num in [15700000,piN].
def lower_reach(N):
    lo, hi = 15700000, piN  # assume lower always pos, upper (piN) may be neg
    # find largest num with pos
    def ok(num):
        x=F(num,DEN)
        return (partialCos(x,N)-cosRemBound(x,N))>0
    if not ok(lo): return None
    while hi-lo>1:
        mid=(lo+hi)//2
        if ok(mid): lo=mid
        else: hi=mid
    return lo

# UPPER: smallest num > piN s.t. partialCos+cosRem<0. Bisect on num in [piN, 15710000].
def upper_reach(N):
    lo, hi = piN, 15710000
    def neg(num):
        x=F(num,DEN)
        return (partialCos(x,N)+cosRemBound(x,N))<0
    if not neg(hi): return None
    while hi-lo>1:
        mid=(lo+hi)//2
        if neg(mid): hi=mid
        else: lo=mid
    return hi

for N in [5,6,7]:
    r=lower_reach(N)
    print(f"split@{N} LOWER largest z_lo={r}/1e7={r/1e7 if r else None} margin_to_pi/2={(pi/2-r/1e7) if r else None:.3e}")
for N in [4,5,6]:
    r=upper_reach(N)
    print(f"split@{N} UPPER smallest z_hi={r}/1e7={r/1e7 if r else None} margin_above_pi/2={(r/1e7-pi/2) if r else None:.3e}")
