from fractions import Fraction as F
from math import factorial, log, sqrt, pi

def pCos(x,N):
    return sum(F((-1)**i)*x**(2*i)/F(factorial(2*i)) for i in range(N))
def cRem(x,N):
    return (x**(2*N)/F(factorial(2*N)))*(1/(1-x*x/F((2*N+1)*(2*N+2))))

x=F(2,9)
print("=== cutCos(2/9) via cutCos_bracket instrument at various N ===")
for N in [3,4,5]:
    ps=pCos(x,N); rm=cRem(x,N)
    # need x^2 < (2N+1)(2N+2): 4/81 < ... always true
    lo=ps-rm; hi=ps+rm
    print(f"N={N}: partialCos={float(ps):.12f} rem={float(rm):.3e} -> p in [{float(lo):.12f},{float(hi):.12f}] width={float(hi-lo):.3e}")

# Use N=4: p bracket
N=4
ps=pCos(x,N); rm=cRem(x,N)
pLo_raw=ps-rm; pHi_raw=ps+rm
print("\nN=4 raw p bracket:",float(pLo_raw),float(pHi_raw))
# clean 9-decimal
pLo=F(975410084,10**9)   # 0.975410084
pHi=F(975410086,10**9)   # 0.975410086
print("pLo<=raw?",pLo<=pLo_raw," pHi>=raw?",pHi>=pHi_raw," true p=0.975410085389"," width",float(pHi-pLo))

wLo=F(141421356,10**8); wHi=F(141421357,10**8)
c_lo=3-3*pHi*pHi; c_hi=3-3*pLo*pLo
print("3-3p^2 in [%.12f,%.12f] sqrt [%.10f,%.10f]"%(float(c_lo),float(c_hi),sqrt(float(c_lo)),sqrt(float(c_hi))))
# r bracket: rLo^2<=c_lo, rHi^2>=c_hi ; true r=0.381740089
rLo=F(381740087,10**9); rHi=F(381740092,10**9)
print("rLo^2<=c_lo?",rLo*rLo<=c_lo," rHi^2>=c_hi?",rHi*rHi>=c_hi," r width",float(rHi-rLo))

wp_lo=wLo*pLo; wp_hi=wHi*pHi
wr_lo=wLo*rLo; wr_hi=wHi*rHi
print("wp exact [%.11f,%.11f] w=%.2e"%(float(wp_lo),float(wp_hi),float(wp_hi-wp_lo)))
print("wr exact [%.11f,%.11f] w=%.2e"%(float(wr_lo),float(wr_hi),float(wr_hi-wr_lo)))
# clean product brackets (8 dec)
WP_LO=F(137943816,10**8); WP_HI=F(137943834,10**8)
WR_LO=F(53986157,10**8);  WR_HI=F(53986165,10**8)
print("WP_LO<=wp_lo?",WP_LO<=wp_lo,"WP_HI>=wp_hi?",WP_HI>=wp_hi)
print("WR_LO<=wr_lo?",WR_LO<=wr_lo,"WR_HI>=wr_hi?",WR_HI>=wr_hi)

b0_lo=1+WP_LO; b0_hi=1+WP_HI
b1_lo=1-(WP_HI+WR_HI)/2; b1_hi=1-(WP_LO+WR_LO)/2
print("b0 [%.9f,%.9f] b1 [%.9f,%.9f] b1w=%.2e"%(float(b0_lo),float(b0_hi),float(b1_lo),float(b1_hi),float(b1_hi-b1_lo)))
B0_LO=F(237943816,10**8); B0_HI=F(237943834,10**8)
B1_LO=F(4034989,10**8);   B1_HI=F(40350055,10**9)
print("B0_LO<=b0_lo?",B0_LO<=b0_lo,"B0_HI>=b0_hi?",B0_HI>=b0_hi)
print("B1_LO<=b1_lo?",B1_LO<=b1_lo,float(b1_lo)," B1_HI>=b1_hi?",B1_HI>=b1_hi,float(b1_hi))

m0_lo=B0_LO*B0_LO; m0_hi=B0_HI*B0_HI
m1_lo=B1_LO*B1_LO; m1_hi=B1_HI*B1_HI
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
print("m01 [%.6f,%.6f] width %.6f  (was 4.34; %.0fx tighter)"%(float(m01_lo),float(m01_hi),float(m01_hi-m01_lo),4.34/float(m01_hi-m01_lo)))
print("true m01=3477.4728  ln=%.9f"%log(3477.4728371))
