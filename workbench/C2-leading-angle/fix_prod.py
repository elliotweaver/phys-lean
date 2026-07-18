from fractions import Fraction as F
b0lo=F(237943,100000); b0hi=F(237944,100000)
b2lo=F(5802,10000);    b2hi=F(58022,100000)
plo=b0lo*b2lo; phi=b0hi*b2hi
print("b0*b2 lo (b0lo*b2lo) =", float(plo), plo)
print("b0*b2 hi (b0hi*b2hi) =", float(phi), phi)
# choose safe rational bracket for b0*b2
LO=F(138054,100000); HI=F(138062,100000)
print("LO=138054/1e5=%f  <= plo? %s"%(float(LO), LO<=plo))
print("HI=138062/1e5=%f  >= phi? %s"%(float(HI), HI>=phi))
# cabCross = b0*b2/3
print("cabCross lo = plo/3 =", float(plo/3), " ; 46018/1e5=",float(F(46018,100000)), " ok?", F(46018,100000)<=plo/3)
print("cabCross hi = phi/3 =", float(phi/3), " ; 46020/1e5=",float(F(46020,100000)), " ok?", F(46020,100000)>=phi/3)
# with LO/HI product bracket -> cabCross in [LO/3, HI/3]
print("LO/3=",float(LO/3)," 46018/1e5=",float(F(46018,100000)), " 46018<=LO/3?", F(46018,100000)<=LO/3)
print("HI/3=",float(HI/3)," 46020/1e5=",float(F(46020,100000)), " 46020>=HI/3?", F(46020,100000)>=HI/3)
