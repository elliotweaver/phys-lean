from fractions import Fraction as F
from math import factorial, pi

def partialCos(x, N):
    # sum_{i<N} (-1)^i x^(2i)/(2i)!
    s = F(0)
    for i in range(N):
        s += F((-1)**i) * x**(2*i) / factorial(2*i)
    return s

def cosRemBound(x, N):
    # (x^(2N)/(2N)!) * (1 - x^2/((2N+1)(2N+2)))^-1
    base = x**(2*N)/F(factorial(2*N))
    denom = 1 - x*x/F((2*N+1)*(2*N+2))
    return base/denom

# candidate endpoints near pi/2 = 1.5707963267948966
print("pi/2 =", pi/2)
cands_upper = ['15707970','15707967','15707966','15707965','1570797']  # /1e7 or /1e6
# Let's use /1e7 scale for finer
def test_upper(num, den):
    x = F(num, den)
    for N in [4,5,6]:
        ps = partialCos(x,N)
        # need x^2 < (2N+1)(2N+2)
        rem = cosRemBound(x,N)
        up = ps + rem   # cutCos <= up ; sign negative if up<0
        print(f"  UPPER x={float(x):.8f} N={N}: partialCos={float(ps):.3e} rem={float(rem):.3e} ps+rem={float(up):.3e}  NEG_certified={up<0}")

def test_lower(num, den):
    x = F(num, den)
    for N in [5,6,7]:
        ps = partialCos(x,N)
        rem = cosRemBound(x,N)
        lo = ps - rem   # cutCos >= lo ; sign positive if lo>0
        print(f"  LOWER x={float(x):.8f} N={N}: partialCos={float(ps):.3e} rem={float(rem):.3e} ps-rem={float(lo):.3e}  POS_certified={lo>0}")

print("=== UPPER sign (cutCos<0) candidates ===")
for num in [15707970,15707967,15707966]:
    test_upper(num,10**7)
print("=== LOWER positivity (cutCos>0 on [0,x)) candidates ===")
for num in [15707960,15707962,15707963]:
    test_lower(num,10**7)
