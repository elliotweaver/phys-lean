from fractions import Fraction as F
from math import factorial, log, sqrt, pi

def pExp(q,N): return sum(q**i/F(factorial(i)) for i in range(N))
def eRem(q,N): return (q**N/F(factorial(N)))*(1/(1-q/F(N+1)))
def pCos(x,N): return sum(F((-1)**i)*x**(2*i)/F(factorial(2*i)) for i in range(N))
def cRem(x,N): return (x**(2*N)/F(factorial(2*N)))*(1/(1-x*x/F((2*N+1)*(2*N+2))))

print("############ FRONT 1 ############")
x=F(2,9)
# partialCos(2/9,4) exact:
pc4=pCos(x,4)
cr4=cRem(x,4)
print("partialCos(2/9,4)=",pc4,"=",float(pc4))
print("cosRemBound(2/9,4)=",cr4,"~",float(cr4))
pLo_raw=pc4-cr4; pHi_raw=pc4+cr4
# clean p bracket (9-dec), must contain raw:
pLo=F(975410084,10**9); pHi=F(975410086,10**9)
assert pLo<=pLo_raw and pHi>=pHi_raw
wLo=F(141421356,10**8); wHi=F(141421357,10**8)
assert wLo*wLo<=2 and wHi*wHi>=2
c_lo=3-3*pHi*pHi; c_hi=3-3*pLo*pLo
# r bracket
rLo=F(381740084,10**9); rHi=F(381740101,10**9)
assert rLo*rLo<=c_lo, ("rLo",float(rLo*rLo-c_lo))
assert rHi*rHi>=c_hi, ("rHi",float(rHi*rHi-c_hi))
wp_lo=wLo*pLo; wp_hi=wHi*pHi
wr_lo=wLo*rLo; wr_hi=wHi*rHi
# clean product brackets
WP_LO=F(137943816,10**8); WP_HI=F(137943834,10**8)
WR_LO=F(53986155,10**8);  WR_HI=F(53986168,10**8)
assert WP_LO<=wp_lo and WP_HI>=wp_hi, "WP"
assert WR_LO<=wr_lo and WR_HI>=wr_hi, ("WR",float(WR_LO-wr_lo),float(WR_HI-wr_hi))
b0_lo=1+WP_LO; b0_hi=1+WP_HI
b1_lo=1-(WP_HI+WR_HI)/2; b1_hi=1-(WP_LO+WR_LO)/2
B0_LO=F(237943816,10**8); B0_HI=F(237943834,10**8)
B1_LO=F(4034989,10**8);   B1_HI=F(4035011,10**8)
assert B0_LO<=b0_lo and B0_HI>=b0_hi, "B0"
assert B1_LO<=b1_lo and B1_HI>=b1_hi, ("B1",float(B1_LO-b1_lo),float(B1_HI-b1_hi))
m0_lo=B0_LO*B0_LO; m0_hi=B0_HI*B0_HI
m1_lo=B1_LO*B1_LO; m1_hi=B1_HI*B1_HI
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
print("m01 achievable [%.6f,%.6f] width %.6f"%(float(m01_lo),float(m01_hi),float(m01_hi-m01_lo)))
M01_LO=F(347744,100); M01_HI=F(347748,100)   # 3477.44, 3477.48
assert M01_LO<=m01_lo and M01_HI>=m01_hi, ("M01",float(M01_LO-m01_lo),float(M01_HI-m01_hi))
print("M01 clean [%.2f,%.2f] ln [%.7f,%.7f]"%(float(M01_LO),float(M01_HI),log(float(M01_LO)),log(float(M01_HI))))
CL_LO=F(8154055,10**6); CL_HI=F(8154068,10**6)  # 8.154055, 8.154068
assert float(CL_LO)<=log(float(M01_LO)), ("CL_LO",float(CL_LO)-log(float(M01_LO)))
assert float(CL_HI)>=log(float(M01_HI)), ("CL_HI",float(CL_HI)-log(float(M01_HI)))
# certified exp indices
CLN=None; CHN=None
for N in [19,20,21,22]:
    if pExp(CL_LO,N)+eRem(CL_LO,N)<=M01_LO: CLN=N; break
for N in [20,21,22,23]:
    if M01_HI<=pExp(CL_HI,N): CHN=N; break
print("cutLog [%.6f,%.6f] width %.6f  exp idx LO N=%s HI N=%s"%(float(CL_LO),float(CL_HI),float(CL_HI-CL_LO),CLN,CHN))
print("  (parent 0.002; %.0fx tighter)"%(0.002/float(CL_HI-CL_LO)))

print("\n############ FRONT 2 ############")
zlo=F(1570790,10**6); zhi=F(1570810,10**6)
v5=pCos(zlo,5)-cRem(zlo,5); v4=pCos(zhi,4)+cRem(zhi,4)
print("LOWER split@5 at z_lo pCos-rem=%.3e>0?%s ; UPPER split@4 at z_hi pCos+rem=%.3e<0?%s"%(float(v5),v5>0,float(v4),v4<0))
print("z_lo^2=%.10f  (need x^2<(2*5+1)(2*5+2)=132; and for positivity nlinarith bound)"%float(zlo*zlo))
ip_lo=F(500000,1570810); ip_hi=F(500000,1570790)
print("1/cutPi [%.9f,%.9f] width %.2e"%(float(ip_lo),float(ip_hi),float(ip_hi-ip_lo)))

print("\n############ ASSEMBLED at d=16/3 ############")
d=F(16,3)
lo=F(190,3)+d/3*CL_LO*ip_lo
hi=F(190,3)+d/3*CL_HI*ip_hi
print("assembled lo=%s ~%.7f"%(lo,float(lo)))
print("assembled hi=%s ~%.7f"%(hi,float(hi)))
print("width=%.3e  (parent ~0.00172; %.1fx tighter)"%(float(hi-lo),0.00172/float(hi-lo)))
par_lo=F(9606370,141381); par_hi=F(9605390,141363)
print("nested? lo>=par_lo:%s hi<=par_hi:%s"%(lo>=par_lo,hi<=par_hi))
print("parent [%.6f,%.6f] this [%.6f,%.6f]"%(float(par_lo),float(par_hi),float(lo),float(hi)))
dlo=F(74)+d/2*CL_LO*ip_lo; dhi=F(74)+d/2*CL_HI*ip_hi
print("dressed lo=%s hi=%s"%(dlo,dhi))
print("\nFINAL DESIGN CONSTANTS:")
print("pLo,pHi =",pLo,pHi)
print("rLo,rHi =",rLo,rHi)
print("WP_LO,WP_HI =",WP_LO,WP_HI,"; WR_LO,WR_HI =",WR_LO,WR_HI)
print("B0_LO,B0_HI =",B0_LO,B0_HI,"; B1_LO,B1_HI =",B1_LO,B1_HI)
print("M01_LO,M01_HI =",M01_LO,M01_HI)
print("CL_LO,CL_HI =",CL_LO,CL_HI," idx",CLN,CHN)
print("ip_lo,ip_hi =",ip_lo,ip_hi)
print("assembled lo,hi =",lo,hi)
print("dressed lo,hi =",dlo,dhi)
