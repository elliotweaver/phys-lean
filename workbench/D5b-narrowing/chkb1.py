from fractions import Fraction as F
WP_LO=F(137943816,10**8); WP_HI=F(137943818,10**8)
WR_LO=F(53986200,10**8); WR_HI=F(53986203,10**8)
b1_lo=1-(WP_HI+WR_HI)/2; b1_hi=1-(WP_LO+WR_LO)/2
print('b1_lo=%.9f b1_hi=%.9f'%(float(b1_lo),float(b1_hi)))
print('B1_LO=4034989/1e8=%.9f <= b1_lo? %s'%(4034989/1e8, F(4034989,10**8)<=b1_lo))
print('B1_HI=4034992/1e8=%.9f >= b1_hi? %s'%(4034992/1e8, F(4034992,10**8)>=b1_hi))
b0_lo=1+WP_LO; b0_hi=1+WP_HI
print('b0_lo=%.9f b0_hi=%.9f'%(float(b0_lo),float(b0_hi)))
print('B0_LO<=b0_lo?%s B0_HI>=b0_hi?%s'%(F(237943816,10**8)<=b0_lo,F(237943819,10**8)>=b0_hi))
# masses
B0_LO=F(237943816,10**8);B0_HI=F(237943819,10**8);B1_LO=F(4034989,10**8);B1_HI=F(4034992,10**8)
m0_lo=B0_LO*B0_LO;m0_hi=B0_HI*B0_HI;m1_lo=B1_LO*B1_LO;m1_hi=B1_HI*B1_HI
m01_lo=m0_lo/m1_hi;m01_hi=m0_hi/m1_lo
print('m01 [%.6f,%.6f]'%(float(m01_lo),float(m01_hi)))
print('M01_LO=3477.44<=?%s M01_HI=3477.48>=?%s'%(F(347744,100)<=m01_lo,F(86937,25)>=m01_hi))
