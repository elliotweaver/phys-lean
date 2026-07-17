from fractions import Fraction as F
d=F(16,3)
def asm(clL,clH,ipL,ipH):
    return F(190,3)+(d/3)*clL*ipL, F(190,3)+(d/3)*clH*ipH
plo=F(800488690,11780973); phi=F(80048852,1178097)   # parent D5-next-5 assembled
pw=float(phi-plo)
print("parent assembled width =", pw)

# cutLog new: [81540604/1e7, 81540623/1e7] (N=27)
clL=F(81540604,10**7); clH=F(81540623,10**7)

# Scenario A: keep parent 1/cutPi
ipL_p=F(10000000,31415928); ipH_p=F(1000000,3141592)
loA,hiA=asm(clL,clH,ipL_p,ipH_p)
print("\nA (new cutLog + parent 1/cutPi): width=%.3e improv=%.2f nested? %s,%s"%(float(hiA-loA),pw/float(hiA-loA),plo<=loA,hiA<=phi))

# Scenario B: push BOTH 1/cutPi endpoints via double-angle
# cutPi in [31415924/1e7, 31415927/1e7]  => 1/cutPi in [10000000/31415927, 10000000/31415924]
ipL_b=F(10000000,31415927); ipH_b=F(10000000,31415924)
loB,hiB=asm(clL,clH,ipL_b,ipH_b)
print("B (new cutLog + double 1/cutPi): width=%.3e improv=%.2f nested vs parent? %s,%s"%(float(hiB-loB),pw/float(hiB-loB),plo<=loB,hiB<=phi))
print("   1/cutPi_B width=%.3e (parent 8.1e-8)"%float(ipH_b-ipL_b))
print("   loB=%s=%.10f  hiB=%s=%.10f"%(loB,float(loB),hiB,float(hiB)))
print("   loB simplified:", loB.numerator,"/",loB.denominator)
print("   hiB simplified:", hiB.numerator,"/",hiB.denominator)

# dressed at w=1/3: 74 + (d/2)*cl*ip
def asmd(clL,clH,ipL,ipH):
    return F(74)+(d/2)*clL*ipL, F(74)+(d/2)*clH*ipH
dloB,dhiB=asmd(clL,clH,ipL_b,ipH_b)
print("   dressed loB=%s=%.8f hiB=%s=%.8f"%(dloB,float(dloB),dhiB,float(dhiB)))

# contribution split for B
ipM=(ipL_b+ipH_b)/2; clM=(clL+clH)/2
print("   contrib cutLog=%.3e  1/cutPi=%.3e"%(float((d/3)*ipM*(clH-clL)), float((d/3)*clM*(ipH_b-ipL_b))))

# nesting teeth values (parent bracket for width_lt tooth)
print("\nteeth: parent width numerals for width_lt: phi-plo where plo=800488690/11780973, phi=80048852/1178097")
