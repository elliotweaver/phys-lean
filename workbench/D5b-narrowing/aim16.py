from fractions import Fraction as F
from math import factorial, log, sqrt

head=F(19199,19683); tail=F(56,334512585)
pLo_raw=head-tail; pHi_raw=head+tail
pLo=F(97541008,10**8); pHi=F(97541043,10**8)
assert pLo<=pLo_raw<=pHi_raw<=pHi
wLo=F(141421356,10**8); wHi=F(141421357,10**8)
assert wLo*wLo<=2<=wHi*wHi

c_lo=3-3*pHi*pHi; c_hi=3-3*pLo*pLo
print("c_lo=%.10f sqrt=%.9f ; c_hi=%.10f sqrt=%.9f"%(float(c_lo),sqrt(float(c_lo)),float(c_hi),sqrt(float(c_hi))))
# tightest 8-dec r: rLo^2<=c_lo -> rLo<=0.381737447 -> rLo=0.38173744; rHi^2>=c_hi -> rHi>=0.381740131 -> rHi=0.38174014
rLo=F(38173744,10**8); rHi=F(38174014,10**8)
print("rLo^2<=c_lo?",rLo*rLo<=c_lo," rHi^2>=c_hi?",rHi*rHi>=c_hi," r width",float(rHi-rLo))

wp_lo=wLo*pLo; wp_hi=wHi*pHi
wr_lo=wLo*rLo; wr_hi=wHi*rHi
print("wp exact [%.10f,%.10f]"%(float(wp_lo),float(wp_hi)))
print("wr exact [%.10f,%.10f]"%(float(wr_lo),float(wr_hi)))

# clean product brackets (7 dec)
WP_LO=F(13794381,10**7); WP_HI=F(13794387,10**7)
WR_LO=F(5398617,10**7); WR_HI=F(5398624,10**7)
print("WP_LO<=wp_lo?",WP_LO<=wp_lo," WP_HI>=wp_hi?",WP_HI>=wp_hi)
print("WR_LO<=wr_lo?",WR_LO<=wr_lo,float(wr_lo)," WR_HI>=wr_hi?",WR_HI>=wr_hi,float(wr_hi))

b0_lo=1+WP_LO; b0_hi=1+WP_HI
b1_lo=1-(WP_HI+WR_HI)/2; b1_hi=1-(WP_LO+WR_LO)/2
print("b0 [%.8f,%.8f]"%(float(b0_lo),float(b0_hi)))
print("b1 [%.8f,%.8f]"%(float(b1_lo),float(b1_hi)))
B0_LO=F(23794381,10**7); B0_HI=F(23794387,10**7)
B1_LO=F(40349,10**6); B1_HI=F(4035005,10**8)  # 0.040349, 0.04035005
print("B0_LO<=b0_lo?",B0_LO<=b0_lo," B0_HI>=b0_hi?",B0_HI>=b0_hi)
print("B1_LO<=b1_lo?",B1_LO<=b1_lo," B1_HI>=b1_hi?",B1_HI>=b1_hi,float(b1_hi))

m0_lo=B0_LO*B0_LO; m0_hi=B0_HI*B0_HI
m1_lo=B1_LO*B1_LO; m1_hi=B1_HI*B1_HI
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
print("m01 [%.5f,%.5f] width %.5f"%(float(m01_lo),float(m01_hi),float(m01_hi-m01_lo)))
M01_LO=F(347742,100); M01_HI=F(347762,100)   # 3477.42, 3477.62
print("M01_LO<=m01_lo?",M01_LO<=m01_lo," M01_HI>=m01_hi?",M01_HI>=m01_hi)
print("ln(M01_LO)=%.7f ln(M01_HI)=%.7f"%(log(float(M01_LO)),log(float(M01_HI))))
CL_LO=F(8154041,10**6); CL_HI=F(8154082,10**6)  # 8.154041, 8.154082
print("CL_LO<=lnLo?",float(CL_LO)<=log(float(M01_LO))," CL_HI>=lnHi?",float(CL_HI)>=log(float(M01_HI)))
print("cutLog [%.6f,%.6f] width %.6f"%(float(CL_LO),float(CL_HI),float(CL_HI-CL_LO)))

# ============ CERTIFIED EXP INDEX for cutLog endpoints ============
def partialExp(q,N):
    return sum(q**i/F(factorial(i)) for i in range(N))
def expRemBound(q,N):
    return (q**N/F(factorial(N)))*(1/(1-q/F(N+1)))
# LOWER cutLog: need partialExp(CL_LO,N)+expRemBound(CL_LO,N) <= M01_LO
for N in [17,18,19,20]:
    val=partialExp(CL_LO,N)+expRemBound(CL_LO,N)
    print(f"  cutLog_LO N={N}: pExp+rem={float(val):.4f} <= M01_LO={float(M01_LO):.4f}? {val<=M01_LO}")
# UPPER cutLog: need M01_HI <= partialExp(CL_HI,N)
for N in [18,19,20,21]:
    val=partialExp(CL_HI,N)
    print(f"  cutLog_HI N={N}: M01_HI={float(M01_HI):.4f} <= pExp={float(val):.4f}? {M01_HI<=val}")
