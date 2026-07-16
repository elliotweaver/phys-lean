from fractions import Fraction as F
d=F(16,3)
# residuals
la,lb=F(163,20),F(8157,1000)        # cutLog [8.15, 8.157]
# leastCosZero in [783/500, 79/50] -> cutPi in [1566/500=783/250, 158/50=79/25]
# 1/cutPi in [1/(2*79/50), 1/(2*783/500)] = [25/79, 250/783]
zl,zh=F(783,500),F(79,50)
cutPi_lo, cutPi_hi = 2*zl, 2*zh
print("cutPi in [",cutPi_lo,",",cutPi_hi,"] = [",float(cutPi_lo),",",float(cutPi_hi),"]")
pa,pb = F(1)/cutPi_hi, F(1)/cutPi_lo
print("1/cutPi in [",pa,",",pb,"] = [",float(pa),",",float(pb),"]")
# nested in D5-next's [5/16,1/3]?
print("nested in [5/16,1/3]?", F(5,16)<=pa, pb<=F(1,3))
print("cutLog nested in [8,41/5]?", F(8)<=la, lb<=F(41,5))
# assembled bare
lo=190/F(3)+(d/3)*la*pa; hi=190/F(3)+(d/3)*lb*pb
print("\nBARE: 190/3 + (16/9)*(163/20)*(25/79) <= 1/a(0) <= 190/3 + (16/9)*(8157/1000)*(250/783)")
print("  lo=",lo,"=",float(lo))
print("  hi=",hi,"=",float(hi))
print("  width",hi-lo,"=",float(hi-lo))
# D5-next bracket
D5n_lo,D5n_hi=F(610,9),F(9206,135)
print("  nested in D5-next[610/9,9206/135]?", D5n_lo<=lo, hi<=D5n_hi)
print("  D5-next width", D5n_hi-D5n_lo,"=",float(D5n_hi-D5n_lo))
print("  narrower?", (hi-lo)<(D5n_hi-D5n_lo), " ratio",float((D5n_hi-D5n_lo)/(hi-lo)))
# dressed at w=1/3
dlo=74+(d/2)*la*pa; dhi=74+(d/2)*lb*pb
print("\nDRESSED: 74 + (8/3)*(163/20)*(25/79) <= . <= 74 + (8/3)*(8157/1000)*(250/783)")
print("  lo=",dlo,"=",float(dlo))
print("  hi=",dhi,"=",float(dhi))
# arithmetic simplification checks for the lean 'harith' steps
print("\n=== harith targets ===")
print("(d/3)*la*pa exact =", (d/3)*la*pa, "; 190/3+that =", 190/F(3)+(d/3)*la*pa)
print("(d/3)*lb*pb exact =", (d/3)*lb*pb, "; 190/3+that =", 190/F(3)+(d/3)*lb*pb)
print("(d/2)*la*pa exact =", (d/2)*la*pa, "; 74+that =", 74+(d/2)*la*pa)
print("(d/2)*lb*pb exact =", (d/2)*lb*pb, "; 74+that =", 74+(d/2)*lb*pb)
