from fractions import Fraction as F
from mpmath import mp, mpf, factorial, log, sqrt as msqrt
import mpmath, math
mp.dps = 100

# ---- true values ----
p_true = mpmath.cos(mpf(2)/9)          # cutCos(2/9)
w_true = msqrt(mpf(2))                 # sqrt 2
r_true = msqrt(3 - 3*p_true**2)        # conic root
wp_true = w_true*p_true
wr_true = w_true*r_true
b0_true = 1 + wp_true
b1_true = 1 - (wp_true + wr_true)/2
mass0_true = b0_true**2
mass1_true = b1_true**2
m01_true = mass0_true/mass1_true
print("TRUE:")
print("  p =", mpmath.nstr(p_true,20))
print("  w =", mpmath.nstr(w_true,20))
print("  r =", mpmath.nstr(r_true,20))
print("  wp=", mpmath.nstr(wp_true,20))
print("  wr=", mpmath.nstr(wr_true,20))
print("  b0=", mpmath.nstr(b0_true,20))
print("  b1=", mpmath.nstr(b1_true,20))
print("  m01=", mpmath.nstr(m01_true,20))
print("  cutLog(m01)=", mpmath.nstr(log(m01_true),20))

# ---- partialCos(2/9) at split 4 and 5, remainder ----
def partialCos(x,N):
    s=mpf(0); term=mpf(1)
    for k in range(N):
        s += (-1)**k * x**(2*k)/factorial(2*k)
    return s
def cosRemBound(x,N):
    return x**(2*N)/factorial(2*N) * (1/(1 - x**2/((2*N+1)*(2*N+2))))
x=mpf(2)/9
for N in [4,5,6]:
    pc=partialCos(x,N); rem=cosRemBound(x,N)
    print("\nsplit@%d partialCos(2/9)=%s  rem=%s"%(N, mpmath.nstr(pc,25), mpmath.nstr(rem,6)))
    # exact partial sum as Fraction:
    sF=F(0)
    for k in range(N):
        sF += F((-1)**k, 1)*F(2,9)**(2*k)/F(math.factorial(2*k))
    print("   partialCos as F =", sF, " ~", float(sF))
