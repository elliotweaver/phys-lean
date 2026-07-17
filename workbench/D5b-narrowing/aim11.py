from fractions import Fraction as F
import math

print("=== ASSEMBLED WIDTH SENSITIVITY (what actually limits 1/a(0)) ===")
# 1/a = 190/3 + (16/9)*cutLog*(1/cutPi)
cutLog=8.154061; invpi=1/(2*math.pi/2)  # =1/pi? no: 1/cutPi, cutPi=pi
invpi=1/math.pi
dcl_contrib = (16/9)*invpi     # per unit cutLog width
dip_contrib = (16/9)*cutLog    # per unit 1/cutPi width
print("d(1/a)/d(cutLog) =", dcl_contrib, " ; d(1/a)/d(1/cutPi) =", dip_contrib)
print("current cutLog width 0.002 -> contrib", dcl_contrib*0.002)
print("current 1/cutPi width 4e-5 -> contrib", dip_contrib*4e-5)
print("=> after front1 (cutLog~3e-5) the 1/cutPi contrib dominates; MUST tighten 1/cutPi too")
print()

print("=== FRONT 1: sharper p,w,r,b,mass,m01,cutLog ===")
head=F(19199,19683); tail=F(56,334512585)
pLo_raw=head-tail; pHi_raw=head+tail
pLo=F(97541008,10**8); pHi=F(97541043,10**8)
assert pLo<=pLo_raw and pHi>=pHi_raw
wLo=F(141421356,10**8); wHi=F(141421357,10**8)
assert wLo*wLo<=2<=wHi*wHi
c_lo=3-3*pHi*pHi; c_hi=3-3*pLo*pLo
# choose rLo,rHi: rLo^2<=c_lo, rHi^2>=c_hi
# c_lo ~0.14572348 -> sqrt ~0.38173745 ; c_hi~0.14572553 -> sqrt~0.38174013
rLo=F(38173740,10**8); rHi=F(38174020,10**8)
print("rLo^2<=c_lo?",rLo*rLo<=c_lo," rHi^2>=c_hi?",rHi*rHi>=c_hi," r width",float(rHi-rLo))
wp_lo=wLo*pLo; wp_hi=wHi*pHi
wr_lo=wLo*rLo; wr_hi=wHi*rHi
b0_lo=1+wp_lo; b0_hi=1+wp_hi
b1_lo=1-(wp_hi+wr_hi)/2; b1_hi=1-(wp_lo+wr_lo)/2
m0_lo=b0_lo*b0_lo; m0_hi=b0_hi*b0_hi
m1_lo=b1_lo*b1_lo; m1_hi=b1_hi*b1_hi
m01_lo=m0_lo/m1_hi; m01_hi=m0_hi/m1_lo
print("m01 in [%.6f, %.6f] width %.6f" % (float(m01_lo),float(m01_hi),float(m01_hi-m01_lo)))
# clean rational m01 bracket: m01Lo <= m01_lo (as rational), m01Hi>=m01_hi
# true m01=3477.4728; m01_lo~3477.42, m01_hi~3477.53
m01Lo=F(347742,100)   # 3477.42
m01Hi=F(3477543,1000) # 3477.543
print("m01Lo<=m01_lo?",m01Lo<=m01_lo," m01Hi>=m01_hi?",m01Hi>=m01_hi)
print("m01 clean bracket [%.4f,%.4f] width %.4f"%(float(m01Lo),float(m01Hi),float(m01Hi-m01Lo)))
# cutLog of these:
print("ln(m01Lo)=",math.log(float(m01Lo))," ln(m01Hi)=",math.log(float(m01Hi)))
# choose cutLog rational bracket clLo<=ln(m01Lo), clHi>=ln(m01Hi)
clLo=F(8154041,10**6)  # 8.154041
clHi=F(8154083,10**6)  # 8.154083
print("clLo<=ln(m01Lo)?",float(clLo)<=math.log(float(m01Lo))," clHi>=ln(m01Hi)?",float(clHi)>=math.log(float(m01Hi)))
print("cutLog clean bracket [%.6f,%.6f] width %.6f"%(float(clLo),float(clHi),float(clHi-clLo)))
