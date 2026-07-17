from fractions import Fraction as F
pLo=F(975410084,10**9); pHi=F(975410086,10**9)
rLo=F(381740084,10**9); rHi=F(381740101,10**9)
wLo=F(141421356,10**8); wHi=F(141421357,10**8)
wp_lo=wLo*pLo; wp_hi=wHi*pHi
wr_lo=wLo*rLo; wr_hi=wHi*rHi
print("wp exact [%.12f,%.12f]"%(float(wp_lo),float(wp_hi)))
print("wr exact [%.12f,%.12f]"%(float(wr_lo),float(wr_hi)))
# probe uses:
WP_LO=F(137943817,10**8); WP_HI=F(137943819,10**8)
WR_LO=F(53986155,10**8); WR_HI=F(53986165,10**8)
print("WP_LO<=wp_lo?",WP_LO<=wp_lo," WP_HI>=wp_hi?",WP_HI>=wp_hi)
print("WR_LO<=wr_lo?",WR_LO<=wr_lo," WR_HI>=wr_hi?",WR_HI>=wr_hi)
# amplitudes from these
b0_lo=1+WP_LO; b0_hi=1+WP_HI
b1_lo=1-(WP_HI+WR_HI)/2; b1_hi=1-(WP_LO+WR_LO)/2
print("b0 [%.9f,%.9f]"%(float(b0_lo),float(b0_hi)))
print("b1 [%.9f,%.9f]"%(float(b1_lo),float(b1_hi)))
B0_LO=F(237943817,10**8); B0_HI=F(237943819,10**8)
B1_LO=F(4034989,10**8); B1_HI=F(4035011,10**8)
print("B0_LO<=b0_lo?",B0_LO<=b0_lo," B0_HI>=b0_hi?",B0_HI>=b0_hi)
print("B1_LO<=b1_lo?",B1_LO<=b1_lo," B1_HI>=b1_hi?",B1_HI>=b1_hi)
# masses & m01
m0_lo=B0_LO*B0_LO; m0_hi=B0_HI*B0_HI
m1_lo=B1_LO*B1_LO; m1_hi=B1_HI*B1_HI
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
print("m01 [%.6f,%.6f]"%(float(m01_lo),float(m01_hi)))
M01_LO=F(86936,25); M01_HI=F(86937,25)  # 3477.44,3477.48
print("M01_LO<=m01_lo?",M01_LO<=m01_lo,float(M01_LO)," M01_HI>=m01_hi?",M01_HI>=m01_hi,float(M01_HI))
