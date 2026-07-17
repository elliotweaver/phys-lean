from fractions import Fraction as F
from math import factorial, log
import math
def pExp(q,N): return sum(q**i/F(factorial(i)) for i in range(N))
def eRem(q,N): return (q**N/F(factorial(N)))*(1/(1-q/F(N+1)))

# m01 achievable [3477.470772, 3477.476031]
# Choose M01 window [3477.44, 3477.48] (contains achievable, gives exp idx<=22)
M01_LO=F(347744,100); M01_HI=F(86937,25)  # 3477.44, 3477.48
assert M01_LO<=F(34774707,10**4) and M01_HI>=F(34774761,10**4)
lnLo=log(float(M01_LO)); lnHi=log(float(M01_HI))
print("M01 [%.2f,%.2f] ln [%.6f,%.6f]"%(float(M01_LO),float(M01_HI),lnLo,lnHi))
CL_LO=F(math.floor(lnLo*10**5),10**5)
CLN=next((n for n in range(15,23) if pExp(CL_LO,n)+eRem(CL_LO,n)<=M01_LO),None)
print("CL_LO=%s idx=%s"%(CL_LO,CLN))
CHN=None
for k in range(0,40):
    c=F(math.ceil(lnHi*10**5)+k,10**5)
    N=next((n for n in range(15,23) if M01_HI<=pExp(c,n)), None)
    if N is not None: CL_HI=c; CHN=N; break
print("CL_HI=%s idx=%s"%(CL_HI,CHN))
print("cutLog [%d/100000, %d/100000] width=%.2e"%(round(float(CL_LO)*1e5),round(float(CL_HI)*1e5),float(CL_HI-CL_LO)))

zlo=15707952; zhi=15707970; DEN=10**7
ip_lo=F(DEN,2*zhi); ip_hi=F(DEN,2*zlo)
d=F(16,3)
lo=F(190,3)+d/3*CL_LO*ip_lo
hi=F(190,3)+d/3*CL_HI*ip_hi
par_lo=F(9606370,141381); par_hi=F(9605390,141363)
print("\nASSEMBLED lo=%s hi=%s"%(lo,hi))
print("  ~[%.7f,%.7f] width=%.3e (%.1fx tighter)"%(float(lo),float(hi),float(hi-lo),0.00172/float(hi-lo)))
print("  nested lo>=par_lo:%s hi<=par_hi:%s strict:%s"%(lo>=par_lo,hi<=par_hi,lo<hi))
print("  width_lt parent? %s"%((hi-lo)<(par_hi-par_lo)))
dlo=F(74)+d/2*CL_LO*ip_lo; dhi=F(74)+d/2*CL_HI*ip_hi
print("DRESSED lo=%s hi=%s"%(dlo,dhi))
print("ip_lo=%s ip_hi=%s"%(ip_lo,ip_hi))
print("cutPi [%s,%s] leastZero [%s,%s]"%(F(2*zlo,DEN),F(2*zhi,DEN),F(zlo,DEN),F(zhi,DEN)))
# verify CL_LO<=lnLo, CL_HI>=lnHi (for cutLog_mono chain endpoints)
print("CL_LO<=lnLo?",float(CL_LO)<=lnLo," CL_HI>=lnHi?",float(CL_HI)>=lnHi)
# nested inside parent cutLog [8153/1000,8155/1000]?
print("cutLog nested in parent [8.153,8.155]? lo>=8.153:%s hi<=8.155:%s"%(float(CL_LO)>=8.153,float(CL_HI)<=8.155))
