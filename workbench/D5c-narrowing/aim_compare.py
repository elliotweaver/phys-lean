from fractions import Fraction as F
d=F(16,3)
parent_lo=F(19211728054,282743343); parent_hi=F(4802931662,70685829)
parent_w=parent_hi-parent_lo
print("parent width %.4e"%float(parent_w))

# cutLog split@5 [815406110, 815406115]/1e8
la=F(815406110,10**8); lb=F(815406115,10**8)

configs = {
  "keep parent lz [620,635] (1/cutPi banked)": (F(10000000,31415927), F(10000000,31415924)),
  "push lz [628,635]": (F(50000000,157079635), F(50000000,157079628)),
  "push lz [624,635] (safer margin)": (F(50000000,157079635), F(50000000,157079624)),
  "push lz [626,635]": (F(50000000,157079635), F(50000000,157079626)),
}
for name,(pa,pb) in configs.items():
    lo=F(190,3)+d/3*la*pa; hi=F(190,3)+d/3*lb*pb
    w=hi-lo
    nested = lo>=parent_lo and hi<=parent_hi
    print("\n[%s]"%name)
    print("  1/a(0) [%s, %s]"%(lo,hi))
    print("     w %.4e (%.1fx narrower) nested=%s"%(float(w),float(parent_w/w),nested))
