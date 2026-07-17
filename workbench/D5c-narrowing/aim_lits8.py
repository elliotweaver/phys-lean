from fractions import Fraction as F
# clean reduced rationals for production Lean literals
lcz_lo = F(157079632,10**8)
lcz_hi = F(157079634,10**8)
print("leastCosZero_lo:", lcz_lo, "num/den")
print("leastCosZero_hi:", lcz_hi)
cutPi_lo = 2*lcz_lo
cutPi_hi = 2*lcz_hi
print("cutPi_lo = 2*lcz_lo =", cutPi_lo, " (as 157079632*2/1e8 =", F(2*157079632,10**8), ")")
print("cutPi_hi = 2*lcz_hi =", cutPi_hi)
# For the bracket theorem I want literals that linarith can relate to 2*leastCosZero.
# leastCosZero_lo literal in Lean is 157079632/100000000; cutPi_lo=2*that=314159264/100000000.
# reduce:
print("cutPi_lo literal 314159264/100000000 reduced:", F(314159264,10**8))
print("cutPi_hi literal 314159268/100000000 reduced:", F(314159268,10**8), "= 78539817/25000000?", F(314159268,10**8)==F(78539817,25000000))
# 1/cutPi endpoints
inv_lo = 1/cutPi_hi  # = 25000000/78539817
inv_hi = 1/cutPi_lo  # = 1/(314159264/1e8) = 1e8/314159264 = 100000000/314159264 = 6250000/19634954
print("inv_lo = 1/cutPi_hi =", inv_lo)
print("inv_hi = 1/cutPi_lo =", inv_hi, "= 100000000/314159264 reduced")
print("   100000000/314159264 =", F(100000000,314159264))
# main bracket
d=F(16,3); cl_lo=F(815406110,10**8); cl_hi=F(815406115,10**8)
lo = F(190,3)+d/3*cl_lo*inv_lo
hi = F(190,3)+d/3*cl_hi*inv_hi
print("main lo =", lo)
print("main hi =", hi)
dlo = 74+d/2*cl_lo*inv_lo
dhi = 74+d/2*cl_hi*inv_hi
print("dressed lo =", dlo)
print("dressed hi =", dhi)
