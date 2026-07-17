from fractions import Fraction as F
from math import factorial, log, sqrt
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

# p from split@4
pLo=F(975410084,10**9); pHi=F(975410086,10**9)
# SHARPEN wB=sqrt2: wB*wB=2. Use 9-digit. wLo^2<=2<=wHi^2
wLo=F(1414213562,10**9)
while wLo*wLo>2: wLo-=F(1,10**9)
wHi=F(1414213563,10**9)
while wHi*wHi<2: wHi+=F(1,10**9)
print("wB [%s,%s] wLo^2<=2?%s wHi^2>=2?%s width %.1e"%(wLo,wHi,wLo*wLo<=2,wHi*wHi>=2,float(wHi-wLo)))
# r from conic with sharper p
c_lo=3-3*pHi*pHi; c_hi=3-3*pLo*pLo
rLo=F(381740084,10**9)
while rLo*rLo>c_lo: rLo-=F(1,10**9)
rHi=F(381740101,10**9)
while rHi*rHi<c_hi: rHi+=F(1,10**9)
print("rB [%s,%s]"%(rLo,rHi))
# products (exact)
wp_lo=wLo*pLo; wp_hi=wHi*pHi
wr_lo=wLo*rLo; wr_hi=wHi*rHi
WP_LO=clean_lo(wp_lo,8); WP_HI=clean_hi(wp_hi,8)
WR_LO=clean_lo(wr_lo,8); WR_HI=clean_hi(wr_hi,8)
print("WP_LO=%d/1e8 WP_HI=%d/1e8"%(round(float(WP_LO)*1e8),round(float(WP_HI)*1e8)))
print("WR_LO=%d/1e8 WR_HI=%d/1e8"%(round(float(WR_LO)*1e8),round(float(WR_HI)*1e8)))
# verify WP_LO<=wp_lo etc (for le_trans first norm_num)
print("WP_LO<=wp_lo?",WP_LO<=wp_lo," WP_HI>=wp_hi?",WP_HI>=wp_hi)
print("WR_LO<=wr_lo?",WR_LO<=wr_lo," WR_HI>=wr_hi?",WR_HI>=wr_hi)
# amplitudes
b0_lo=1+WP_LO; b0_hi=1+WP_HI
b1_lo=1-(WP_HI+WR_HI)/2; b1_hi=1-(WP_LO+WR_LO)/2
B0_LO=clean_lo(b0_lo,8); B0_HI=clean_hi(b0_hi,8)
B1_LO=clean_lo(b1_lo,8); B1_HI=clean_hi(b1_hi,8)
print("B0_LO=%d/1e8 B0_HI=%d/1e8"%(round(float(B0_LO)*1e8),round(float(B0_HI)*1e8)))
print("B1_LO=%d/1e8 B1_HI=%d/1e8"%(round(float(B1_LO)*1e8),round(float(B1_HI)*1e8)))
# masses & m01
m0_lo=B0_LO*B0_LO; m0_hi=B0_HI*B0_HI
m1_lo=B1_LO*B1_LO; m1_hi=B1_HI*B1_HI
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
print("m01 achievable [%.6f,%.6f]"%(float(m01_lo),float(m01_hi)))
# M01 window [3477.44,3477.48] contains?
M01_LO=F(347744,100); M01_HI=F(86937,25)
print("M01[3477.44,3477.48] contains achievable? lo:%s hi:%s"%(M01_LO<=m01_lo,M01_HI>=m01_hi))
