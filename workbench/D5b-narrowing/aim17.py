from fractions import Fraction as F
from math import factorial, log, sqrt, pi

def pExp(q,N): return sum(q**i/F(factorial(i)) for i in range(N))
def eRem(q,N): return (q**N/F(factorial(N)))*(1/(1-q/F(N+1)))
def pCos(x,N):
    return sum(F((-1)**i)*x**(2*i)/F(factorial(2*i)) for i in range(N))
def cRem(x,N):
    return (x**(2*N)/F(factorial(2*N)))*(1/(1-x*x/F((2*N+1)*(2*N+2))))

print("############ FRONT 1: cutLog via sharper amplitudes ############")
head=F(19199,19683); tail=F(56,334512585)
pLo_raw=head-tail; pHi_raw=head+tail
pLo=F(97541008,10**8); pHi=F(97541043,10**8)
assert pLo<=pLo_raw and pHi>=pHi_raw
wLo=F(141421356,10**8); wHi=F(141421357,10**8)
assert wLo*wLo<=2 and wHi*wHi>=2

c_lo=3-3*pHi*pHi; c_hi=3-3*pLo*pLo
rLo=F(38173744,10**8); rHi=F(38174014,10**8)
assert rLo*rLo<=c_lo and rHi*rHi>=c_hi, ("R FAIL",float(rLo*rLo-c_lo),float(rHi*rHi-c_hi))

wp_lo=wLo*pLo; wp_hi=wHi*pHi
wr_lo=wLo*rLo; wr_hi=wHi*rHi
print("wp exact [%.10f,%.10f]  wr exact [%.10f,%.10f]"%(float(wp_lo),float(wp_hi),float(wr_lo),float(wr_hi)))

# clean product brackets (le_trans style): WP_LO<=wp_lo, WP_HI>=wp_hi, etc.
WP_LO=F(13794381,10**7); WP_HI=F(13794387,10**7)
WR_LO=F(5398582,10**7);  WR_HI=F(5398621,10**7)
assert WP_LO<=wp_lo and WP_HI>=wp_hi, "WP"
assert WR_LO<=wr_lo and WR_HI>=wr_hi, ("WR",float(WR_LO-wr_lo),float(WR_HI-wr_hi))

# amplitude clean brackets: b0=1+wp; b1=1-(wp+wr)/2
b0_lo=1+WP_LO; b0_hi=1+WP_HI
b1_lo=1-(WP_HI+WR_HI)/2; b1_hi=1-(WP_LO+WR_LO)/2
print("b0 exact-from-clean [%.8f,%.8f] b1 [%.8f,%.8f]"%(float(b0_lo),float(b0_hi),float(b1_lo),float(b1_hi)))
B0_LO=F(23794381,10**7); B0_HI=F(23794387,10**7)
B1_LO=F(403496,10**7);   B1_HI=F(4035185,10**8)
assert B0_LO<=b0_lo and B0_HI>=b0_hi, "B0"
assert B1_LO<=b1_lo and B1_HI>=b1_hi, ("B1",float(B1_LO-b1_lo),float(B1_HI-b1_hi))

# masses
m0_lo=B0_LO*B0_LO; m0_hi=B0_HI*B0_HI
m1_lo=B1_LO*B1_LO; m1_hi=B1_HI*B1_HI
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
print("m01 achievable [%.5f,%.5f] width %.5f"%(float(m01_lo),float(m01_hi),float(m01_hi-m01_lo)))
# clean m01 bracket
M01_LO=F(347714,100); M01_HI=F(347751,100)  # 3477.14, 3477.51
assert M01_LO<=m01_lo and M01_HI>=m01_hi, ("M01",float(M01_LO-m01_lo),float(M01_HI-m01_hi))
print("ln(M01_LO)=%.7f ln(M01_HI)=%.7f -> cutLog width ~%.2e"%(log(float(M01_LO)),log(float(M01_HI)),log(float(M01_HI))-log(float(M01_LO))))
# cutLog bracket
CL_LO=F(8154033,10**6); CL_HI=F(8154140,10**6)  # 8.154033, 8.154140
assert float(CL_LO)<=log(float(M01_LO)), ("CL_LO",float(CL_LO)-log(float(M01_LO)))
assert float(CL_HI)>=log(float(M01_HI)), ("CL_HI",float(CL_HI)-log(float(M01_HI)))
# certified exp indices
for N in [19,20,21]:
    v=pExp(CL_LO,N)+eRem(CL_LO,N)
    if v<=M01_LO: print(f"cutLog_LO N={N}: pExp+rem={float(v):.4f}<=M01_LO={float(M01_LO):.4f} OK"); CL_LO_N=N; break
for N in [20,21,22]:
    v=pExp(CL_HI,N)
    if M01_HI<=v: print(f"cutLog_HI N={N}: M01_HI={float(M01_HI):.4f}<=pExp={float(v):.4f} OK"); CL_HI_N=N; break
print("=> cutLog bracket [%.6f,%.6f] width %.6f  (was 0.002; %.0fx tighter)"%(float(CL_LO),float(CL_HI),float(CL_HI-CL_LO),0.002/float(CL_HI-CL_LO)))

print()
print("############ FRONT 2: 1/cutPi via tighter cos endpoints ############")
zlo=F(1570790,10**6); zhi=F(1570810,10**6)
print("pi/2=%.7f  z_lo=%.7f z_hi=%.7f"%(pi/2,float(zlo),float(zhi)))
# LOWER split@5 positivity: need pCos(zlo,5)-cRem(zlo,5)>0 (and for all x<zlo, but binding at zlo)
v5=pCos(zlo,5)-cRem(zlo,5)
print("LOWER split@5 at z_lo: pCos-rem=%.3e >0? %s"%(float(v5),v5>0))
# UPPER split@4 sign: need pCos(zhi,4)+cRem(zhi,4)<0
v4=pCos(zhi,4)+cRem(zhi,4)
print("UPPER split@4 at z_hi: pCos+rem=%.3e <0? %s"%(float(v4),v4<0))
# cutPi, 1/cutPi
cutPi_lo=2*zlo; cutPi_hi=2*zhi
ip_lo=1/cutPi_hi; ip_hi=1/cutPi_lo
print("cutPi in [%s,%s]"%(cutPi_lo,cutPi_hi))
print("1/cutPi in [500000/1570810, 500000/1570790] = [%.9f,%.9f] width %.2e"%(float(ip_lo),float(ip_hi),float(ip_hi-ip_lo)))
print("  (was 4e-5; %.0fx tighter)"%(4e-5/float(ip_hi-ip_lo)))
# x^2 bound for positivity nlinarith
print("z_lo^2 =",float(zlo*zlo)," (parent was 2.46709849)")

print()
print("############ ASSEMBLED 1/alpha(0) at d=16/3 ############")
d=F(16,3)
lo = F(190,3)+d/3*CL_LO*ip_lo
hi = F(190,3)+d/3*CL_HI*ip_hi
print("assembled lo=%s ~%.6f"%(lo, float(lo)))
print("assembled hi=%s ~%.6f"%(hi, float(hi)))
print("width=%.6e  (parent ~0.00172; %.1fx tighter)"%(float(hi-lo), 0.00172/float(hi-lo)))
# nested inside parent [9606370/141381, 9605390/141363]?
par_lo=F(9606370,141381); par_hi=F(9605390,141363)
print("nested inside parent? lo>=par_lo:%s hi<=par_hi:%s"%(lo>=par_lo, hi<=par_hi))
print("parent [%.6f,%.6f]"%(float(par_lo),float(par_hi)))
# dressed at w=1/3: 74+(d/2)*cl*ip
dlo=F(74)+d/2*CL_LO*ip_lo; dhi=F(74)+d/2*CL_HI*ip_hi
print("dressed lo=%s hi=%s"%(dlo,dhi))
