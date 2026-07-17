from fractions import Fraction as F
d=F(16,3)
# FINAL design:
# m01 in [34774707/10000, 34774761/10000]
# cutLog in [81540604/1e7 (N=24), 81540623/1e7 (N=27)]
# leastCosZero in [157079620/1e8, 157079635/1e8]
#   -> cutPi in [31415924/1e7, 31415927/1e7]
#   -> 1/cutPi in [10000000/31415927, 10000000/31415924]
clL=F(81540604,10**7); clH=F(81540623,10**7)
ipL=F(10000000,31415927); ipH=F(10000000,31415924)
piL=F(31415924,10**7); piH=F(31415927,10**7)
print("cutPi bracket [%s,%s]=[%.8f,%.8f]"%(piL,piH,float(piL),float(piH)))
print("1/cutPi bracket [%s,%s]=[%.10f,%.10f] width %.2e"%(ipL,ipH,float(ipL),float(ipH),float(ipH-ipL)))
# verify 1/piH <= ipL and ipH <= 1/piL? Actually 1/cutPi bounds: lower = 1/piH, upper=1/piL
print("  check ipL == 1/piH?", ipL == F(1,1)/piH, "  ipH == 1/piL?", ipH==F(1,1)/piL)

lo=F(190,3)+(d/3)*clL*ipL
hi=F(190,3)+(d/3)*clH*ipH
print("\nASSEMBLED: [%s, %s]"%(lo,hi))
print("  = [%.10f, %.10f] width %.3e"%(float(lo),float(hi),float(hi-lo)))
plo=F(800488690,11780973); phi=F(80048852,1178097)
print("  parent width=%.3e improv=%.2f nested? plo<=lo:%s hi<=phi:%s"%(float(phi-plo),float(phi-plo)/float(hi-lo),plo<=lo,hi<=phi))

dlo=F(74)+(d/2)*clL*ipL
dhi=F(74)+(d/2)*clH*ipH
print("\nDRESSED: [%s, %s] = [%.8f,%.8f]"%(dlo,dhi,float(dlo),float(dhi)))

# strict check
print("\nstrict lo<hi:", lo<hi)
# width_lt tooth: hi-lo < phi-plo
print("width_lt: (hi-lo) < (phi-plo):", (hi-lo)<(phi-plo))

# for the assembled harith bounds, we need rationals la,lb such that
#  la <= 190/3 + (d/3)*clL*ipL  (la = our lo)  -- exact equality, so la=lo works with norm_num
# print exact endpoint expressions used in endpoint_assembled_bracket
print("\n190/3 + (16/9)*clL*ipL =", F(190,3)+(d/3)*clL*ipL, "(this IS lo, exact)")
print("190/3 + (16/9)*clH*ipH =", F(190,3)+(d/3)*clH*ipH, "(this IS hi, exact)")

# residual/cutLog nesting vs parent for teeth
print("\n1/cutPi nested in parent [10000000/31415928, 1000000/3141592]?")
print("  10000000/31415928 <= ipL:", F(10000000,31415928)<=ipL, "  ipH <= 1000000/3141592:", ipH<=F(1000000,3141592))
print("cutLog nested in parent [81540600/1e7, 81540630/1e7]?")
print("  81540600/1e7 <= clL:", F(81540600,10**7)<=clL, "  clH <= 81540630/1e7:", clH<=F(81540630,10**7))
