from fractions import Fraction as F
from math import factorial, log, sqrt, pi
import math

def pExp(q,N): return sum(q**i/F(factorial(i)) for i in range(N))
def eRem(q,N): return (q**N/F(factorial(N)))*(1/(1-q/F(N+1)))
def pCos(x,N): return sum(F((-1)**i)*x**(2*i)/F(factorial(2*i)) for i in range(N))
def cRem(x,N): return (x**(2*N)/F(factorial(2*N)))*(1/(1-x*x/F((2*N+1)*(2*N+2))))

def floor_to(v, dec):   # largest k/10^dec <= v
    return F(math.floor(v*10**dec), 10**dec)
def ceil_to(v, dec):
    return F(math.ceil(v*10**dec), 10**dec)

x=F(2,9)
pc4=pCos(x,4); cr4=cRem(x,4)
pLo_raw=pc4-cr4; pHi_raw=pc4+cr4
# p clean at 9 dec
pLo=floor_to(pLo_raw,9); pHi=ceil_to(pHi_raw,9)
assert pLo<=pLo_raw<=pHi_raw<=pHi
wLo=F(141421356,10**8); wHi=F(141421357,10**8)
c_lo=3-3*pHi*pHi; c_hi=3-3*pLo*pLo
# r at 9 dec: rLo^2<=c_lo, rHi^2>=c_hi
rLo=floor_to(math.sqrt(float(c_lo)),9)
while rLo*rLo>c_lo: rLo-=F(1,10**9)
rHi=ceil_to(math.sqrt(float(c_hi)),9)
while rHi*rHi<c_hi: rHi+=F(1,10**9)
assert rLo*rLo<=c_lo and rHi*rHi>=c_hi
wp_lo=wLo*pLo; wp_hi=wHi*pHi
wr_lo=wLo*rLo; wr_hi=wHi*rHi
# clean products at 8 dec
WP_LO=floor_to(float(wp_lo),8)
while WP_LO>wp_lo: WP_LO-=F(1,10**8)
WP_HI=ceil_to(float(wp_hi),8)
while WP_HI<wp_hi: WP_HI+=F(1,10**8)
WR_LO=floor_to(float(wr_lo),8)
while WR_LO>wr_lo: WR_LO-=F(1,10**8)
WR_HI=ceil_to(float(wr_hi),8)
while WR_HI<wr_hi: WR_HI+=F(1,10**8)
assert WP_LO<=wp_lo<=wp_hi<=WP_HI
assert WR_LO<=wr_lo<=wr_hi<=WR_HI
b0_lo=1+WP_LO; b0_hi=1+WP_HI
b1_lo=1-(WP_HI+WR_HI)/2; b1_hi=1-(WP_LO+WR_LO)/2
B0_LO=floor_to(float(b0_lo),8)
while B0_LO>b0_lo: B0_LO-=F(1,10**8)
B0_HI=ceil_to(float(b0_hi),8)
while B0_HI<b0_hi: B0_HI+=F(1,10**8)
B1_LO=floor_to(float(b1_lo),8)
while B1_LO>b1_lo: B1_LO-=F(1,10**8)
B1_HI=ceil_to(float(b1_hi),8)
while B1_HI<b1_hi: B1_HI+=F(1,10**8)
assert B0_LO<=b0_lo<=b0_hi<=B0_HI
assert B1_LO<=b1_lo<=b1_hi<=B1_HI
m0_lo=B0_LO*B0_LO; m0_hi=B0_HI*B0_HI
m1_lo=B1_LO*B1_LO; m1_hi=B1_HI*B1_HI
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
# clean m01 at 2 dec
M01_LO=floor_to(float(m01_lo),2)
while M01_LO>m01_lo: M01_LO-=F(1,100)
M01_HI=ceil_to(float(m01_hi),2)
while M01_HI<m01_hi: M01_HI+=F(1,100)
assert M01_LO<=m01_lo<=m01_hi<=M01_HI
# cutLog at 6 dec: CL_LO<=ln(M01_LO), CL_HI>=ln(M01_HI)
CL_LO=floor_to(math.log(float(M01_LO)),6)
CL_HI=ceil_to(math.log(float(M01_HI)),6)
# certified exp indices
CLN=next(N for N in range(17,26) if pExp(CL_LO,N)+eRem(CL_LO,N)<=M01_LO)
CHN=next(N for N in range(17,26) if M01_HI<=pExp(CL_HI,N))

zlo=F(1570790,10**6); zhi=F(1570810,10**6)
ip_lo=F(500000,1570810); ip_hi=F(500000,1570790)
d=F(16,3)
lo=F(190,3)+d/3*CL_LO*ip_lo
hi=F(190,3)+d/3*CL_HI*ip_hi
dlo=F(74)+d/2*CL_LO*ip_lo; dhi=F(74)+d/2*CL_HI*ip_hi
par_lo=F(9606370,141381); par_hi=F(9605390,141363)

print("=== FINAL LOCKED CONSTANTS ===")
print("pLo =",pLo," pHi =",pHi,"  (raw [%.12f,%.12f])"%(float(pLo_raw),float(pHi_raw)))
print("rLo =",rLo," rHi =",rHi)
print("WP_LO=",WP_LO," WP_HI=",WP_HI)
print("WR_LO=",WR_LO," WR_HI=",WR_HI)
print("B0_LO=",B0_LO," B0_HI=",B0_HI)
print("B1_LO=",B1_LO," B1_HI=",B1_HI)
print("M01_LO=",M01_LO," M01_HI=",M01_HI," m01 width",float(M01_HI-M01_LO))
print("CL_LO=",CL_LO," CL_HI=",CL_HI," idxLO=",CLN," idxHI=",CHN," cutLog width",float(CL_HI-CL_LO))
print("ip_lo=",ip_lo," ip_hi=",ip_hi)
print("assembled lo=",lo,"~%.7f"%float(lo))
print("assembled hi=",hi,"~%.7f"%float(hi))
print("width=%.3e (parent 0.00172; %.1fx tighter)"%(float(hi-lo),0.00172/float(hi-lo)))
print("nested? lo>=par_lo:%s hi<=par_hi:%s"%(lo>=par_lo,hi<=par_hi))
print("dressed lo=",dlo," hi=",dhi)
# verify partialCos(2/9,4) as rational for the head norm_num
print("\npartialCos(2/9,4) =",pc4)
print("cosRemBound(2/9,4) =",cr4)
print("z_lo^2 =",zlo*zlo,"=",float(zlo*zlo))
