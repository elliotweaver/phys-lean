from fractions import Fraction as F
d=F(16,3)
parent_lo=F(19211728054,282743343); parent_hi=F(4802931662,70685829)
parent_w=parent_hi-parent_lo
la=F(815406110,10**8); lb=F(815406115,10**8)   # cutLog split@5

# leastCosZero lower = parent's banked 157079620 ; upper options
for (lzlo,lzhi,tag) in [(157079620,157079635,"parent-lower + banked-upper 635"),
                        (157079620,157079634,"parent-lower + pushed-upper 634")]:
    pa=F(50000000,lzhi); pb=F(50000000,lzlo)   # 1/cutPi lo=1/(2 lzhi)=5e7/lzhi ; hi=5e7/lzlo
    lo=F(190,3)+d/3*la*pa; hi=F(190,3)+d/3*lb*pb
    w=hi-lo
    nested = lo>=parent_lo and hi<=parent_hi
    dlo=F(74,1)+d/2*la*pa; dhi=F(74,1)+d/2*lb*pb
    print("[%s]"%tag)
    print("  1/cutPi lo=50000000/%d  hi=50000000/%d"%(lzhi,lzlo))
    print("  1/a(0) [%s, %s]"%(lo,hi))
    print("     = [%.10f, %.10f] w %.4e (%.2fx narrower) nested=%s"%(float(lo),float(hi),float(w),float(parent_w/w),nested))
    print("  dressed [%s, %s]"%(dlo,dhi))
    print()
