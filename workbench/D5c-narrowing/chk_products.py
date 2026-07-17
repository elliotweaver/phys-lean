from fractions import Fraction as F
import math
plo=F(9754100853,10**10); phi=F(4877050427,5*10**9)
wlo=F(1414213562373,10**12); whi=F(707106781187,5*10**11)
rlo=F(38174008945,10**11); rhi=F(38174009023,10**11)
print("phi =",float(phi)," whi =",float(whi))
# products exact
wp_lo=wlo*plo; wp_hi=whi*phi; wr_lo=wlo*rlo; wr_hi=whi*rhi
print("wB*pB exact [%.12f, %.12f]"%(float(wp_lo),float(wp_hi)))
print("wB*rB exact [%.12f, %.12f]"%(float(wr_lo),float(wr_hi)))
# choose product endpoints on 1e10 grid
wp_l=F(math.floor(float(wp_lo)*1e10),10**10); wp_h=F(math.ceil(float(wp_hi)*1e10),10**10)
wr_l=F(math.floor(float(wr_lo)*1e10),10**10); wr_h=F(math.ceil(float(wr_hi)*1e10),10**10)
print("wp endpoints [%s, %s] certs lo<= %s hi>= %s"%(wp_l,wp_h, wp_l<=wp_lo, wp_h>=wp_hi))
print("wr endpoints [%s, %s] certs lo<= %s hi>= %s"%(wr_l,wr_h, wr_l<=wr_lo, wr_h>=wr_hi))
# b0=1+wp b1=1-(wp+wr)/2
b0_l=1+wp_l; b0_h=1+wp_h
b1_l=1-(wp_h+wr_h)/2; b1_h=1-(wp_l+wr_l)/2
print("b0 [%s, %s]"%(b0_l,b0_h))
print("b1 [%s, %s]"%(b1_l,b1_h))
# masses
m0_l=b0_l*b0_l; m0_h=b0_h*b0_h; m1_l=b1_l*b1_l; m1_h=b1_h*b1_h
m01_l=m0_l/m1_h; m01_h=m0_h/m1_l
print("m01 exact [%.9f, %.9f] w %.3e"%(float(m01_l),float(m01_h),float(m01_h-m01_l)))
lo6=F(math.floor(float(m01_l)*1e6),10**6); hi6=F(math.ceil(float(m01_h)*1e6),10**6)
print("m01 6dp [%s=%.6f, %s=%.6f]"%(lo6,float(lo6),hi6,float(hi6)))
print("  as ints: lo6=%d/1e6 hi6=%d/1e6"%(round(float(lo6)*1e6), round(float(hi6)*1e6)))
