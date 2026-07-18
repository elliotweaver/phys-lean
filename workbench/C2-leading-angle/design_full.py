from fractions import Fraction as F

# banked brackets over Cut
b0lo=F(237943,100000); b0hi=F(237944,100000)     # b0 = 1+w*p
b2lo=F(5802,10000);    b2hi=F(58022,100000)       # b2 = 1 - w(p-r)/2
s=F(2,3)   # survivalCut

# dsub = s*b2  (survival-dressed down sub-leading amplitude)
dsub_lo=s*b2lo; dsub_hi=s*b2hi
print("dsub=s*b2 in [%s,%s] ~[%f,%f]"%(dsub_lo,dsub_hi,float(dsub_lo),float(dsub_hi)))

# cross = b2*b0 - b0*dsub = b0*b2*(1-s) = b0*b2/3  (all positive, increasing in b0,b2)
cross_lo=b0lo*b2lo*(1-s); cross_hi=b0hi*b2hi*(1-s)
print("cross=b0*b2/3 in ~[%f,%f]"%(float(cross_lo),float(cross_hi)))
# pick clean cross bracket
crLO=F(46018,100000); crHI=F(46020,100000)
print("  cross bracket [46018/1e5,46020/1e5]: lo ok?%s hi ok?%s"%(cross_lo>=crLO, cross_hi<=crHI))
cross2_lo=crLO*crLO; cross2_hi=crHI*crHI
# actually for cabMix2 lower/upper I need cross^2 brackets from cross brackets (cross>0)
print("  cross^2 from bracket ~[%f,%f]"%(float(crLO*crLO),float(crHI*crHI)))

# nu = b0^2 + b2^2
nu_lo=b0lo*b0lo+b2lo*b2lo; nu_hi=b0hi*b0hi+b2hi*b2hi
print("nu in ~[%f,%f]"%(float(nu_lo),float(nu_hi)))
nuLO=F(599831,100000); nuHI=F(599840,100000)
print("  nu bracket [599831/1e5,599840/1e5]: lo ok?%s hi ok?%s"%(nu_lo>=nuLO,nu_hi<=nuHI))

# nd = b0^2 + dsub^2 = b0^2 + s^2 b2^2 = b0^2 + (4/9)b2^2
nd_lo=b0lo*b0lo+s*s*b2lo*b2lo; nd_hi=b0hi*b0hi+s*s*b2hi*b2hi
print("nd in ~[%f,%f]"%(float(nd_lo),float(nd_hi)))
ndLO=F(581130,100000); ndHI=F(581136,100000)
print("  nd bracket [581130/1e5,581136/1e5]: lo ok?%s hi ok?%s"%(nd_lo>=ndLO,nd_hi<=ndHI))

# cabMix2 = cross^2/(nu*nd). 
# lower: cross^2 >= crLO^2, den=nu*nd <= nuHI*ndHI -> cabMix2 >= crLO^2/(nuHI*ndHI)
# upper: cross^2 <= crHI^2, den >= nuLO*ndLO -> cabMix2 <= crHI^2/(nuLO*ndLO)
cm_lo = (crLO*crLO)/(nuHI*ndHI)
cm_hi = (crHI*crHI)/(nuLO*ndLO)
print("\ncabMix2 from safe brackets in ~[%f,%f]"%(float(cm_lo),float(cm_hi)))
# declare
CMLO=F(60740,10000000); CMHI=F(60770,10000000)   # [0.006074, 0.006077]
print("DECLARE cabMix2 in [60740/1e7,60770/1e7]=[%f,%f]"%(float(CMLO),float(CMHI)))
print("  lo ok? cm_lo>=CMLO: %s   hi ok? cm_hi<=CMHI: %s"%(cm_lo>=CMLO, cm_hi<=CMHI))

# For nlinarith closing:
# lower: cabMix2 >= CMLO  <=> cross^2 >= CMLO*nu*nd. Provide cross>=crLO(>0), nu<=nuHI, nd<=ndHI, all pos.
#   cross^2>=crLO^2 ; nu*nd<=nuHI*ndHI ; need crLO^2 >= CMLO*nuHI*ndHI
print("\n  lower closes? crLO^2 >= CMLO*nuHI*ndHI :", (crLO*crLO) >= CMLO*nuHI*ndHI, float(crLO*crLO), float(CMLO*nuHI*ndHI))
#   upper: crHI^2 <= CMHI*nuLO*ndLO
print("  upper closes? crHI^2 <= CMHI*nuLO*ndLO :", (crHI*crHI) <= CMHI*nuLO*ndLO, float(crHI*crHI), float(CMHI*nuLO*ndLO))

# |Vmix| bracket via sqrt: sin in [sqrt(CMLO), sqrt(CMHI)]
import math
print("\n|Vmix| ~ %f (derived leading-order Cabibbo); measured sinTheta_C~0.2252 (prose)"%math.sqrt(float(cm_lo)))

# aligned = b0^2 + s*b2^2 = b0^2 + (2/3)b2^2
aln_lo=b0lo*b0lo+s*b2lo*b2lo; aln_hi=b0hi*b0hi+s*b2hi*b2hi
print("aligned in ~[%f,%f]"%(float(aln_lo),float(aln_hi)))

# unitarity tooth exact: cross^2 + aligned^2 = nu*nd  (Brahmagupta-Fibonacci with u=(b0,b2),d=(b0,s b2))
# check symbolic identity at a numeric point
import mpmath as mp
mp.mp.dps=40
b0=mp.mpf('2.37943817163'); b2=mp.mpf('0.580211920148'); S=mp.mpf(2)/3
cr=b2*b0-b0*(S*b2); al=b0*b0+b2*(S*b2); nu=b0*b0+b2*b2; nd=b0*b0+(S*b2)**2
print("\nBrahmagupta check: cross^2+aligned^2 - nu*nd =", mp.nstr(cr*cr+al*al-nu*nd,6), "(=0 exact)")
print("cabMix2+cabAln2 =", mp.nstr((cr*cr+al*al)/(nu*nd),18))
