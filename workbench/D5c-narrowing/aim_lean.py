from fractions import Fraction as F
from mpmath import mp, mpf, factorial, log
import mpmath, math
mp.dps = 120

# ===== split@5 endpoints (all certified in aim_endpoints) =====
plo=F(9754100853,10**10); phi=F(9754100854,10**10)     # pB
wlo=F(1414213562373,10**12); whi=F(1414213562374,10**12) # wB
rlo=F(38174008945,10**11); rhi=F(38174009023,10**11)     # rB

# products: choose clean 1e9-grid rationals bounding wB*pB and wB*rB via mul_le_mul
wp_prod_lo=wlo*plo; wp_prod_hi=whi*phi
wr_prod_lo=wlo*rlo; wr_prod_hi=whi*rhi
print("wB*pB in [%.12f, %.12f]"%(float(wp_prod_lo),float(wp_prod_hi)))
print("wB*rB in [%.12f, %.12f]"%(float(wr_prod_lo),float(wr_prod_hi)))
# clean endpoints (1e9 grid): wp_lo=floor, wp_hi=ceil
wp_lo=F(math.floor(float(wp_prod_lo)*1e9),10**9); wp_hi=F(math.ceil(float(wp_prod_hi)*1e9),10**9)
wr_lo=F(math.floor(float(wr_prod_lo)*1e9),10**9); wr_hi=F(math.ceil(float(wr_prod_hi)*1e9),10**9)
print("wp bracket [%s,%s]  (lo<=prod_lo? %s  hi>=prod_hi? %s)"%(wp_lo,wp_hi, wp_lo<=wp_prod_lo, wp_hi>=wp_prod_hi))
print("wr bracket [%s,%s]  (lo<=prod_lo? %s  hi>=prod_hi? %s)"%(wr_lo,wr_hi, wr_lo<=wr_prod_lo, wr_hi>=wr_prod_hi))

# b0=1+wp ; b1=1-(wp+wr)/2
b0_lo=1+wp_lo; b0_hi=1+wp_hi
b1_lo=1-(wp_hi+wr_hi)/2; b1_hi=1-(wp_lo+wr_lo)/2
print("\nb0 [%s,%s]"%(b0_lo,b0_hi))
print("b1 [%s,%s] (exact width %.3e)"%(b1_lo,b1_hi,float(b1_hi-b1_lo)))

# mass = square ; m01
m0_lo=b0_lo*b0_lo; m0_hi=b0_hi*b0_hi
m1_lo=b1_lo*b1_lo; m1_hi=b1_hi*b1_hi
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
print("\nm01 exact [%.9f, %.9f] width %.3e"%(float(m01_lo),float(m01_hi),float(m01_hi-m01_lo)))
# 6-dp provable bracket
lo6=F(math.floor(float(m01_lo)*1e6),10**6); hi6=F(math.ceil(float(m01_hi)*1e6),10**6)
print("m01 6dp [%s=%.6f, %s=%.6f] (lo<=exact %s, hi>=exact %s)"%(lo6,float(lo6),hi6,float(hi6),lo6<=m01_lo,hi6>=m01_hi))

# cutLog reads (exp instrument) over m01 6dp
tlo=mpf(lo6.numerator)/mpf(lo6.denominator); thi=mpf(hi6.numerator)/mpf(hi6.denominator)
def partialExp(x,N):
    s=mpf(0); term=mpf(1)
    for k in range(N):
        s+=term; term*=x/(k+1)
    return s
def expRemBound(x,N): return (x**N/factorial(N))*(1/(1-x/(N+1)))
print("\ncutLog true range [%.10f, %.10f]"%(float(log(tlo)),float(log(thi))))
for (Nlo,Nhi) in [(27,30),(28,31),(29,32)]:
    clo=None
    for i in range(815406090,815406140):
        c=mpf(i)/mpf('1e8')
        if partialExp(c,Nlo)+expRemBound(c,Nlo)<=tlo: clo=i
        else: break
    chi=None
    for i in range(815406170,815406100,-1):
        c=mpf(i)/mpf('1e8')
        if thi<=partialExp(c,Nhi): chi=i
        else: break
    print("  idx(%d/%d): cutLog [%d/1e8, %d/1e8] width %.3e"%(Nlo,Nhi,clo,chi,(chi-clo)/1e8))
