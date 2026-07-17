from fractions import Fraction as F
import math
# FINAL LOCKED (nlinarith-safe): 
#  FRONT 1: cutCos(2/9) split@4, cutLog [815405/1e5, 815411/1e5] idx 21/22
#  FRONT 2: split@5 lower TIGHT factor (f=103/100) z_lo=15707705 (x^2<246732/1e5)
#           split@6 upper z_hi=15707970
zlo=15707705; zhi=15707970; DEN=10**7
# verify (zlo/1e7)^2 <= 246732/100000
assert F(zlo*zlo,10**14) <= F(246732,100000)
CL_LO=F(815405,10**5); CL_HI=F(815411,10**5); d=F(16,3)
par_lo=F(9606370,141381); par_hi=F(9605390,141363)
ip_lo=F(DEN,2*zhi); ip_hi=F(DEN,2*zlo)
lo=F(190,3)+d/3*CL_LO*ip_lo; hi=F(190,3)+d/3*CL_HI*ip_hi
dlo=F(74)+d/2*CL_LO*ip_lo; dhi=F(74)+d/2*CL_HI*ip_hi
print("=== FINAL LOCKED CONSTANTS ===")
print("cutPi_lo (2*zlo/DEN) =", F(2*zlo,DEN), "cutPi_hi =", F(2*zhi,DEN))
print("leastZero_lo =", F(zlo,DEN), " leastZero_hi =", F(zhi,DEN))
print("ip_lo =", ip_lo, " ip_hi =", ip_hi)
print("CL_LO =", CL_LO, " CL_HI =", CL_HI)
print("assembled lo =", lo, " hi =", hi)
print("  ~[%.7f,%.7f] width=%.3e (%.1fx tighter than parent)"%(float(lo),float(hi),float(hi-lo),0.00172/float(hi-lo)))
print("  nested lo>=par_lo:%s hi<=par_hi:%s strict:%s width_lt:%s"%(lo>=par_lo,hi<=par_hi,lo<hi,(hi-lo)<(par_hi-par_lo)))
print("dressed lo =", dlo, " hi =", dhi)
# nested checks for teeth
print("\nnested cos: par(split5-3) [15707/5000,15709/5000], mine cutPi:")
print("  15707/5000 <= cutPi_lo?", F(15707,5000)<=F(2*zlo,DEN), "  cutPi_hi <= 15709/5000?", F(2*zhi,DEN)<=F(15709,5000))
print("nested 1/cutPi: par [5000/15709,5000/15707], mine [ip_lo,ip_hi]:")
print("  5000/15709 <= ip_lo?", F(5000,15709)<=ip_lo, "  ip_hi <= 5000/15707?", ip_hi<=F(5000,15707))
print("nested cutLog: par [8153/1000,8155/1000], mine [CL_LO,CL_HI]:")
print("  8153/1000 <= CL_LO?", F(8153,1000)<=CL_LO, "  CL_HI <= 8155/1000?", CL_HI<=F(8155,1000))
print("strict ip:", ip_lo<ip_hi, " strict CL:", CL_LO<CL_HI)
print("190/3 < lo?", F(190,3)<lo)
# hx2 clean bound
print("\nhx2 bound: x^2 < 246732/100000 ; (zlo/1e7)^2 =",float(F(zlo*zlo,10**14)))
# partialCos(2/9,4) value
print("partialCos(2/9,4) = 23326781/23914845")
