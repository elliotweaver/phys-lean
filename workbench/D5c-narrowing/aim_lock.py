from fractions import Fraction as F
d=F(16,3)
parent_lo=F(19211728054,282743343); parent_hi=F(4802931662,70685829)
parent_w=parent_hi-parent_lo
la=F(815406110,10**8); lb=F(815406115,10**8)
# leastCosZero [157079620, 157079634]/1e8  (lower banked, upper pushed to 634)
lzlo,lzhi = 157079620, 157079634
# cutPi = 2*leastCosZero -> [2*157079620/1e8, 2*157079634/1e8] = [31415924/1e7, 31415928/... ]
cutpi_lo = F(2*lzlo,10**8); cutpi_hi = F(2*lzhi,10**8)
print("cutPi [%s=%.8f, %s=%.8f]"%(cutpi_lo,float(cutpi_lo),cutpi_hi,float(cutpi_hi)))
# reduce cutPi endpoints to nice form
print("  cutPi_lo = %d/1e8 = "%(2*lzlo), F(2*lzlo,10**8))
print("  cutPi_hi = %d/1e8 = "%(2*lzhi), F(2*lzhi,10**8))
# 1/cutPi endpoints: lo = 1/cutpi_hi, hi=1/cutpi_lo
pa = F(1,1)/cutpi_hi; pb = F(1,1)/cutpi_lo
print("1/cutPi lo = 1/cutpi_hi =", pa, "= 5e7/%d"%lzhi, F(50000000,lzhi))
print("1/cutPi hi = 1/cutpi_lo =", pb, "= 5e7/%d"%lzlo, F(50000000,lzlo))
assert pa==F(50000000,lzhi) and pb==F(50000000,lzlo)
lo=F(190,3)+d/3*la*pa; hi=F(190,3)+d/3*lb*pb
w=hi-lo
print("\n1/a(0) [%s, %s]"%(lo,hi))
print("   = [%.10f, %.10f] w %.4e (%.2fx narrower)"%(float(lo),float(hi),float(w),float(parent_w/w)))
print("   nested? lo>=parent_lo %s ; hi<=parent_hi %s"%(lo>=parent_lo, hi<=parent_hi))
dlo=F(74,1)+d/2*la*pa; dhi=F(74,1)+d/2*lb*pb
print("dressed [%s, %s]"%(dlo,dhi))
# also print parent dressed for nested check
pd_lo=F(7626660626,94247781); pd_hi=F(1906665028,23561943)
print("dressed nested? dlo>=parent_dlo %s ; dhi<=parent_dhi %s"%(dlo>=pd_lo, dhi<=pd_hi))
# 1/cutPi width & nesting vs parent [10000000/31415927, 10000000/31415924]
print("\n1/cutPi [%s, %s] w %.3e"%(pa,pb,float(pb-pa)))
print("  nested in parent [10000000/31415927,10000000/31415924]? lo>= %s hi<= %s"%(
   pa>=F(10000000,31415927), pb<=F(10000000,31415924)))
# cutPi bracket nesting vs parent [31415924/1e7, 31415927/1e7]
print("cutPi nested in parent [31415924/1e7,31415927/1e7]? lo>= %s hi<= %s"%(
   cutpi_lo>=F(31415924,10**7), cutpi_hi<=F(31415927,10**7)))
# cutLog nesting vs parent [81540604/1e7, 81540623/1e7]
print("cutLog [815406110/1e8,815406115/1e8] nested in parent [81540604/1e7,81540623/1e7]? lo>= %s hi<= %s"%(
   la>=F(81540604,10**7), lb<=F(81540623,10**7)))
