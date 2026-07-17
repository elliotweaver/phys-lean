from fractions import Fraction as F
from math import factorial, log, pi

# ============ FRONT 1: sharper p,w,r,b,mass,m01,cutLog ============
head=F(19199,19683); tail=F(56,334512585)
pLo_raw=head-tail; pHi_raw=head+tail

# p bracket (from banked cutCos(2/9) bounds; must contain raw):
pLo=F(97541008,10**8)   # 0.97541008
pHi=F(97541043,10**8)   # 0.97541043
assert pLo<=pLo_raw<=pHi_raw<=pHi, (float(pLo),float(pLo_raw),float(pHi_raw),float(pHi))

# sqrt2 bracket (w*w=2):
wLo=F(141421356,10**8)  # 1.41421356
wHi=F(141421357,10**8)  # 1.41421357
assert wLo*wLo<=2<=wHi*wHi

# r = sqrt(3-3p^2): r^2 = 3-3p^2. c in [c_lo,c_hi]:
c_lo=3-3*pHi*pHi; c_hi=3-3*pLo*pLo
rLo=F(38173740,10**8)   # 0.3817374
rHi=F(38174020,10**8)   # 0.3817402
assert rLo*rLo<=c_lo, (float(rLo*rLo),float(c_lo))
assert rHi*rHi>=c_hi, (float(rHi*rHi),float(c_hi))

# products
wp_lo=wLo*pLo; wp_hi=wHi*pHi
wr_lo=wLo*rLo; wr_hi=wHi*rHi
print("wp exact in [%s, %s]"%(float(wp_lo),float(wp_hi)))
print("wr exact in [%s, %s]"%(float(wr_lo),float(wr_hi)))
# clean rational product brackets (wp_lo' <= wp_lo etc): choose so le_trans works
WP_LO=F(13794381,10**7)  # 1.3794381 <= wp_lo?
WP_HI=F(13794387,10**7)  # 1.3794387 >= wp_hi?
print("WP_LO<=wp_lo?",WP_LO<=wp_lo," WP_HI>=wp_hi?",WP_HI>=wp_hi)
WR_LO=F(5398617,10**7)   # 0.5398617 <= wr_lo?
WR_HI=F(5398624,10**7)   # 0.5398624 >= wr_hi?
print("WR_LO<=wr_lo?",WR_LO<=wr_lo," WR_HI>=wr_hi?",WR_HI>=wr_hi)

# amplitudes b0=1+wp; b1=1-(wp+wr)/2; b2=1-(wp-wr)/2
# Use clean product brackets for propagation:
b0_lo=1+WP_LO; b0_hi=1+WP_HI
b1_lo=1-(WP_HI+WR_HI)/2; b1_hi=1-(WP_LO+WR_LO)/2
b2_lo=1-(WP_HI-WR_LO)/2; b2_hi=1-(WP_LO-WR_HI)/2
print("b0 in [%s,%s]"%(float(b0_lo),float(b0_hi)))
print("b1 in [%s,%s]"%(float(b1_lo),float(b1_hi)))
print("b2 in [%s,%s]"%(float(b2_lo),float(b2_hi)))
# clean amplitude brackets
B0_LO=F(23794381,10**7); B0_HI=F(23794387,10**7)
print("B0_LO<=b0_lo?",B0_LO<=b0_lo," B0_HI>=b0_hi?",B0_HI>=b0_hi)
B1_LO=F(40349,10**6); B1_HI=F(403501,10**7)   # 0.040349 , 0.0403501
print("B1_LO<=b1_lo?",B1_LO<=b1_lo, float(b1_lo)," B1_HI>=b1_hi?",B1_HI>=b1_hi, float(b1_hi))

# masses m0=b0^2, m1=b1^2
m0_lo=B0_LO*B0_LO; m0_hi=B0_HI*B0_HI
m1_lo=B1_LO*B1_LO; m1_hi=B1_HI*B1_HI
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
print("m01 in [%.5f, %.5f] width %.5f"%(float(m01_lo),float(m01_hi),float(m01_hi-m01_lo)))
# clean m01 bracket
M01_LO=F(347741,100)    # 3477.41
M01_HI=F(347755,100)    # 3477.55
print("M01_LO<=m01_lo?",M01_LO<=m01_lo," M01_HI>=m01_hi?",M01_HI>=m01_hi)
print("ln(M01_LO)=%.7f ln(M01_HI)=%.7f"%(log(float(M01_LO)),log(float(M01_HI))))
# cutLog bracket: clLo<=ln(M01_LO), clHi>=ln(M01_HI)
CL_LO=F(8154036,10**6)  # 8.154036
CL_HI=F(8154086,10**6)  # 8.154086
print("CL_LO<=ln(M01_LO)?",float(CL_LO)<=log(float(M01_LO))," CL_HI>=ln(M01_HI)?",float(CL_HI)>=log(float(M01_HI)))
print("cutLog bracket [%.6f,%.6f] width %.6f"%(float(CL_LO),float(CL_HI),float(CL_HI-CL_LO)))
