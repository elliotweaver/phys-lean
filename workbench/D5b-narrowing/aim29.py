from fractions import Fraction as F
from math import factorial, log
import math
def pExp(q,N): return sum(q**i/F(factorial(i)) for i in range(N))
def eRem(q,N): return (q**N/F(factorial(N)))*(1/(1-q/F(N+1)))
def clean_lo(v,d):
    r=F(math.floor(float(v)*10**d),10**d)
    while r>v: r-=F(1,10**d)
    return r
def clean_hi(v,d):
    r=F(math.ceil(float(v)*10**d),10**d)
    while r<v: r+=F(1,10**d)
    return r

pLo=F(975410084,10**9); pHi=F(975410086,10**9)
rLo=F(381740084,10**9); rHi=F(381740101,10**9)
wLo=F(141421356,10**8); wHi=F(141421357,10**8)
wp_lo=wLo*pLo; wp_hi=wHi*pHi
wr_lo=wLo*rLo; wr_hi=wHi*rHi
WP_LO=clean_lo(wp_lo,8); WP_HI=clean_hi(wp_hi,8)
WR_LO=clean_lo(wr_lo,8); WR_HI=clean_hi(wr_hi,8)
print("WP_LO=%s (=%d/1e8) WP_HI=%s"%(WP_LO,WP_LO.numerator*(10**8//WP_LO.denominator) if WP_LO.denominator<=10**8 else -1,WP_HI))
print("  WP_LO=%d/1e8 WP_HI=%d/1e8"%(round(float(WP_LO)*1e8),round(float(WP_HI)*1e8)))
print("  WR_LO=%d/1e8 WR_HI=%d/1e8"%(round(float(WR_LO)*1e8),round(float(WR_HI)*1e8)))
b0_lo=1+WP_LO; b0_hi=1+WP_HI
b1_lo=1-(WP_HI+WR_HI)/2; b1_hi=1-(WP_LO+WR_LO)/2
B0_LO=clean_lo(b0_lo,8); B0_HI=clean_hi(b0_hi,8)
B1_LO=clean_lo(b1_lo,8); B1_HI=clean_hi(b1_hi,8)
print("  B0_LO=%d/1e8 B0_HI=%d/1e8"%(round(float(B0_LO)*1e8),round(float(B0_HI)*1e8)))
print("  B1_LO=%d/1e8 B1_HI=%d/1e8"%(round(float(B1_LO)*1e8),round(float(B1_HI)*1e8)))
m0_lo=B0_LO*B0_LO; m0_hi=B0_HI*B0_HI
m1_lo=B1_LO*B1_LO; m1_hi=B1_HI*B1_HI
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
print("m01 achievable [%.6f,%.6f]"%(float(m01_lo),float(m01_hi)))
# M01 window matching exp idx<=22, containing achievable
M01_LO=clean_lo(m01_lo,2); M01_HI=clean_hi(m01_hi,2)
print("M01 [%s,%s]=[%.2f,%.2f]"%(M01_LO,M01_HI,float(M01_LO),float(M01_HI)))
lnLo=log(float(M01_LO)); lnHi=log(float(M01_HI))
CL_LO=F(math.floor(lnLo*10**5),10**5)
CLN=next(n for n in range(15,23) if pExp(CL_LO,n)+eRem(CL_LO,n)<=M01_LO)
CHN=None
for k in range(0,40):
    c=F(math.ceil(lnHi*10**5)+k,10**5)
    N=next((n for n in range(15,23) if M01_HI<=pExp(c,n)), None)
    if N is not None: CL_HI=c; CHN=N; break
print("cutLog [%s,%s]=[%.5f,%.5f] idx %d/%d"%(CL_LO,CL_HI,float(CL_LO),float(CL_HI),CLN,CHN))
# print as x/1e5
print("  CL_LO=%d/100000 CL_HI=%d/100000"%(round(float(CL_LO)*1e5),round(float(CL_HI)*1e5)))

# assemble
zlo=15707952; zhi=15707970; DEN=10**7
ip_lo=F(DEN,2*zhi); ip_hi=F(DEN,2*zlo)
d=F(16,3)
lo=F(190,3)+d/3*CL_LO*ip_lo
hi=F(190,3)+d/3*CL_HI*ip_hi
par_lo=F(9606370,141381); par_hi=F(9605390,141363)
print("\nASSEMBLED lo=%s hi=%s"%(lo,hi))
print("  ~[%.7f,%.7f] width=%.3e (%.1fx tighter)"%(float(lo),float(hi),float(hi-lo),0.00172/float(hi-lo)))
print("  nested lo>=par_lo:%s hi<=par_hi:%s strict:%s"%(lo>=par_lo,hi<=par_hi,lo<hi))
dlo=F(74)+d/2*CL_LO*ip_lo; dhi=F(74)+d/2*CL_HI*ip_hi
print("DRESSED lo=%s hi=%s"%(dlo,dhi))
print("1/cutPi ip_lo=%s ip_hi=%s"%(ip_lo,ip_hi))
print("cutPi [%s,%s] leastZero [%s,%s]"%(F(2*zlo,DEN),F(2*zhi,DEN),F(zlo,DEN),F(zhi,DEN)))
