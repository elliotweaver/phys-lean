from fractions import Fraction as F
from math import factorial, log, sqrt, pi
import math
DEN=10**7
def pExp(q,N): return sum(q**i/F(factorial(i)) for i in range(N))
def eRem(q,N): return (q**N/F(factorial(N)))*(1/(1-q/F(N+1)))
def pCos(x,N): return sum(F((-1)**i)*x**(2*i)/F(factorial(2*i)) for i in range(N))
def cRem(x,N): return (x**(2*N)/F(factorial(2*N)))*(1/(1-x*x/F((2*N+1)*(2*N+2))))

print("========== FINAL LOCKED DESIGN ==========\n")
# ---- FRONT 1: cutCos(2/9) split@4 ----
x=F(2,9)
pc4=pCos(x,4)  # 23326781/23914845
cr4_exact=cRem(x,4)  # 2/13552276941? verify
print("partialCos(2/9,4)=",pc4)
print("cosRemBound(2/9,4)=",cr4_exact,"=",float(cr4_exact))
pLo_raw=pc4-cr4_exact; pHi_raw=pc4+cr4_exact
pLo=F(975410084,10**9); pHi=F(975410086,10**9)
assert pLo<=pLo_raw and pHi>=pHi_raw
print("p bracket [%s,%s] contains raw? OK"%(pLo,pHi))

wLo=F(141421356,10**8); wHi=F(141421357,10**8)
assert wLo*wLo<=2<=wHi*wHi
c_lo=3-3*pHi*pHi; c_hi=3-3*pLo*pLo
# r 9-dec
rLo=F(381740084,10**9)
while rLo*rLo>c_lo: rLo-=F(1,10**9)
rHi=F(381740101,10**9)
while rHi*rHi<c_hi: rHi+=F(1,10**9)
assert rLo*rLo<=c_lo and rHi*rHi>=c_hi
print("r bracket [%s,%s]  rLo^2<=c_lo,rHi^2>=c_hi OK"%(rLo,rHi))

wp_lo=wLo*pLo; wp_hi=wHi*pHi
wr_lo=wLo*rLo; wr_hi=wHi*rHi
def clean_lo(v,d):
    r=F(math.floor(float(v)*10**d),10**d)
    while r>v: r-=F(1,10**d)
    return r
def clean_hi(v,d):
    r=F(math.ceil(float(v)*10**d),10**d)
    while r<v: r+=F(1,10**d)
    return r
WP_LO=clean_lo(wp_lo,8); WP_HI=clean_hi(wp_hi,8)
WR_LO=clean_lo(wr_lo,8); WR_HI=clean_hi(wr_hi,8)
print("WP [%s,%s] WR [%s,%s]"%(WP_LO,WP_HI,WR_LO,WR_HI))
b0_lo=1+WP_LO; b0_hi=1+WP_HI
b1_lo=1-(WP_HI+WR_HI)/2; b1_hi=1-(WP_LO+WR_LO)/2
B0_LO=clean_lo(b0_lo,8); B0_HI=clean_hi(b0_hi,8)
B1_LO=clean_lo(b1_lo,8); B1_HI=clean_hi(b1_hi,8)
print("B0 [%s,%s] B1 [%s,%s]"%(B0_LO,B0_HI,B1_LO,B1_HI))
m0_lo=B0_LO*B0_LO; m0_hi=B0_HI*B0_HI
m1_lo=B1_LO*B1_LO; m1_hi=B1_HI*B1_HI
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
print("m01 achievable [%.6f,%.6f]"%(float(m01_lo),float(m01_hi)))
M01_LO=clean_lo(m01_lo,2); M01_HI=clean_hi(m01_hi,2)
print("M01 clean [%s,%s]=[%.2f,%.2f]"%(M01_LO,M01_HI,float(M01_LO),float(M01_HI)))
# cutLog with SAFE index (<=22). CL_LO<=ln(M01_LO), CL_HI>=ln(M01_HI)
lnLo=log(float(M01_LO)); lnHi=log(float(M01_HI))
# choose 5-dec endpoints so index<=22
CL_LO=F(math.floor(lnLo*10**5),10**5)
CLN=next(n for n in range(15,23) if pExp(CL_LO,n)+eRem(CL_LO,n)<=M01_LO)
# CL_HI: increase until index<=22
CHN=None
for k in range(0,40):
    c=F(math.ceil(lnHi*10**5)+k,10**5)
    N=next((n for n in range(15,23) if M01_HI<=pExp(c,n)), None)
    if N is not None: CL_HI=c; CHN=N; break
print("cutLog [%s,%s]=[%.5f,%.5f] idxLO=%d idxHI=%d width=%.2e"%(CL_LO,CL_HI,float(CL_LO),float(CL_HI),CLN,CHN,float(CL_HI-CL_LO)))

# ---- FRONT 2: 1/cutPi split@5 lower + split@6 upper ----
# split@5 lower reach z_lo=15707952 (uses <=2 factor -> x^10/1814400 poly)
zlo=15707952; zhi=15707970
# verify: split@5 lower positivity poly at zlo (deg-10, factor<=2)
xx=F(zlo,DEN)
poly=1 - xx**2/2 + xx**4/24 - xx**6/720 + xx**8/40320 - xx**10/F(1814400)
print("\nsplit@5 lower poly at z_lo=%d: %.3e >0? %s"%(zlo,float(poly),poly>0))
# split@6 upper: partialCos6(zhi)+cosRemBound6(zhi)<0
xh=F(zhi,DEN)
p6=pCos(xh,6); r6=cRem(xh,6)
print("split@6 upper at z_hi=%d: partialCos6=%.3e cosRem6=%.3e sum=%.3e <0? %s"%(zhi,float(p6),float(r6),float(p6+r6),(p6+r6)<0))
ip_lo=F(DEN,2*zhi); ip_hi=F(DEN,2*zlo)
print("1/cutPi [%s,%s] width=%.2e"%(ip_lo,ip_hi,float(ip_hi-ip_lo)))
print("cutPi [%s,%s]"%(F(2*zlo,DEN),F(2*zhi,DEN)))
print("leastZero in [%s,%s]"%(F(zlo,DEN),F(zhi,DEN)))

# ---- ASSEMBLED ----
d=F(16,3)
lo=F(190,3)+d/3*CL_LO*ip_lo
hi=F(190,3)+d/3*CL_HI*ip_hi
par_lo=F(9606370,141381); par_hi=F(9605390,141363)
print("\nassembled lo=%s ~%.7f"%(lo,float(lo)))
print("assembled hi=%s ~%.7f"%(hi,float(hi)))
print("width=%.3e (parent 0.00172; %.1fx tighter)"%(float(hi-lo),0.00172/float(hi-lo)))
print("nested? lo>=par_lo:%s hi<=par_hi:%s"%(lo>=par_lo,hi<=par_hi))
print("strict? lo<hi:%s"%(lo<hi))
dlo=F(74)+d/2*CL_LO*ip_lo; dhi=F(74)+d/2*CL_HI*ip_hi
print("dressed lo=%s ~%.6f"%(dlo,float(dlo)))
print("dressed hi=%s ~%.6f"%(dhi,float(dhi)))
# width tooth: hi-lo < parent width
print("width_lt tooth: (%s) < (%s)? %s"%(hi-lo, par_hi-par_lo, (hi-lo)<(par_hi-par_lo)))
