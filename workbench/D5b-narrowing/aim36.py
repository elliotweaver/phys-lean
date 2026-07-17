from fractions import Fraction as F
import math
# x^2<2.46732 -> largest z_lo with (z_lo/1e7)^2 < 2.46732
# z_lo < sqrt(2.46732)*1e7
zlo = int(math.floor(math.sqrt(2.46732)*1e7))
# verify (zlo/1e7)^2 < 2.46732
while F(zlo*zlo,10**14) >= F(246732,100000): zlo-=1
print('z_lo for x^2<2.46732:',zlo, '=',zlo/1e7)
print('  (zlo/1e7)^2 =', float(F(zlo*zlo,10**14)), '< 2.46732?', F(zlo*zlo,10**14)<F(246732,100000))
# Also need hx2 provable from x<zlo/1e7: need (zlo/1e7)^2 <= 2.46732. Yes.
CL_LO=F(815405,10**5); CL_HI=F(815411,10**5); d=F(16,3); DEN=10**7
par_lo=F(9606370,141381); par_hi=F(9605390,141363)
zhi=15707970
ip_lo=F(DEN,2*zhi); ip_hi=F(DEN,2*zlo)
lo=F(190,3)+d/3*CL_LO*ip_lo; hi=F(190,3)+d/3*CL_HI*ip_hi
print('1/cutPi [%s,%s] width=%.2e'%(ip_lo,ip_hi,float(ip_hi-ip_lo)))
print('cutPi [%s,%s]'%(F(2*zlo,DEN),F(2*zhi,DEN)))
print('leastZero [%s,%s]'%(F(zlo,DEN),F(zhi,DEN)))
print('assembled lo=%s hi=%s'%(lo,hi))
print('  ~[%.7f,%.7f] width=%.3e (%.1fx tighter) nested %s/%s strict %s'%(float(lo),float(hi),float(hi-lo),0.00172/float(hi-lo),lo>=par_lo,hi<=par_hi,lo<hi))
print('  width_lt parent? %s'%((hi-lo)<(par_hi-par_lo)))
dlo=F(74)+d/2*CL_LO*ip_lo; dhi=F(74)+d/2*CL_HI*ip_hi
print('dressed lo=%s hi=%s'%(dlo,dhi))
# The hx2 clean bound: use 246732/100000 (need (zlo/1e7)^2 <= this, and nlinarith from x<zlo/1e7)
# Actually nlinarith hx2 : x^2 < 246732/100000 from hx: x<zlo/1e7 requires (zlo/1e7)^2 <= 246732/100000. Check:
print('need (zlo/1e7)^2 <= 246732/100000:', F(zlo*zlo,10**14) <= F(246732,100000))
