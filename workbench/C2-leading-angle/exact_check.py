from fractions import Fraction as F

# banked exact rational brackets
b0lo=F(237943,100000); b0hi=F(237944,100000)
b2lo=F(5802,10000);    b2hi=F(58022,100000)
s=F(2,3)

# cross = b0*b2*(1-s) = b0*b2/3
cross_lo = b0lo*b2lo*(1-s)   # min since all positive
cross_hi = b0hi*b2hi*(1-s)
cross2_lo = cross_lo*cross_lo
cross2_hi = cross_hi*cross_hi
# nu = b0^2+b2^2
nu_lo = b0lo*b0lo + b2lo*b2lo
nu_hi = b0hi*b0hi + b2hi*b2hi
# nd = b0^2 + s^2 b2^2  (s^2=4/9)
nd_lo = b0lo*b0lo + s*s*b2lo*b2lo
nd_hi = b0hi*b0hi + s*s*b2hi*b2hi
den_lo = nu_lo*nd_lo
den_hi = nu_hi*nd_hi
frac_lo = cross2_lo/den_hi
frac_hi = cross2_hi/den_lo
print("frac_lo =", float(frac_lo), "=", frac_lo)
print("frac_hi =", float(frac_hi), "=", frac_hi)

# declared bracket
LO=F(607499,100000000); HI=F(607561,100000000)
print("LO=",float(LO)," frac_lo>=LO?", frac_lo>=LO)
print("HI=",float(HI)," frac_hi<=HI?", frac_hi<=HI)

# For nlinarith: I bracket fraction = cross2/den. I need:
#  fraction >= LO  <=>  cross2 >= LO*den  (den>0). With cross2>=cross2_lo and den<=den_hi: need cross2_lo >= LO*den_hi
print("\nlower proof: cross2_lo >= LO*den_hi ?", cross2_lo >= LO*den_hi, " (",float(cross2_lo),">=",float(LO*den_hi),")")
#  fraction <= HI  <=>  cross2 <= HI*den. With cross2<=cross2_hi and den>=den_lo: need cross2_hi <= HI*den_lo
print("upper proof: cross2_hi <= HI*den_lo ?", cross2_hi <= HI*den_lo, " (",float(cross2_hi),"<=",float(HI*den_lo),")")

# also give intermediate bracket numerals for cross, nu, nd, den to bank as lemmas
print("\n--- intermediate numeral brackets ---")
print("cross in [%s, %s] ~ [%f,%f]"%(cross_lo,cross_hi,float(cross_lo),float(cross_hi)))
print("cross2 in ~ [%f,%f]"%(float(cross2_lo),float(cross2_hi)))
print("nu in ~ [%f,%f]"%(float(nu_lo),float(nu_hi)))
print("nd in ~ [%f,%f]"%(float(nd_lo),float(nd_hi)))
print("den in ~ [%f,%f]"%(float(den_lo),float(den_hi)))

# clean cross bracket for a lemma: cross = b0*b2/3
print("\ncross=b0*b2/3; propose [15339/1e5, 15341/1e5]? true=%f"%float((b0lo+b0hi)/2*(b2lo+b2hi)/2/3))
print(" cross_lo=%f cross_hi=%f"%(float(cross_lo),float(cross_hi)))
# 0.15339? cross ~0.46019/3? no: cross=b0*b2*(1/3), b0*b2~1.3806, /3=0.46019. 
print(" NOTE cross ~0.4602 (b0*b2*(1/3))")
