from fractions import Fraction as F
import math

# tighter log brackets
Lm01_lo = F(815406111272, 10**11); Lm01_hi = F(815406111273, 10**11)
Lmb_lo = F(-4089306640008, 10**12); Lmb_hi = F(-4089306640006, 10**12)
Lb0_lo = F(1733728794954, 10**12); Lb0_hi = F(1733728794955, 10**12)
Lb2_lo = F(-1088723725224, 10**12); Lb2_hi = F(-1088723725223, 10**12)
k_lo = F(1250000000, 3926990817)/3
k_hi = F(50000000000, 157079632679)/3

def C_of(a,b,c,d): return 2*a + F(7,3)*b + F(11,3)*c - F(5,3)*d
# C min: min Lm01, min Lmb, min Lb0, max Lb2
C_min = C_of(Lm01_lo, Lmb_lo, Lb0_lo, Lb2_hi)
C_max = C_of(Lm01_hi, Lmb_hi, Lb0_hi, Lb2_lo)
print("C_min =", float(C_min), " C_max =", float(C_max))
# clean inner-combination bracket at 1e9 grid (C ~ 14.9379518556)
clo = math.floor(C_min*10**9); chi = math.ceil(C_max*10**9)
print("C clean @1e9: [", clo, "/1e9,", chi, "/1e9]")
print(" check C_min >=", clo,"/1e9 ?", C_min >= F(clo,10**9))
print(" check C_max <=", chi,"/1e9 ?", C_max <= F(chi,10**9))
Ccl = F(clo,10**9); Cch = F(chi,10**9)

# endpoint = 2425/18 + k*C ; C>0
ep_lo = F(2425,18) + k_lo*Ccl
ep_hi = F(2425,18) + k_hi*Cch
print("ep_lo =", float(ep_lo), " ep_hi =", float(ep_hi))
# clean endpoint bracket at 1e10
elo = math.floor(ep_lo*10**10); ehi = math.ceil(ep_hi*10**10)
print("endpoint clean @1e10: [", elo, "/1e10,", ehi, "/1e10]")
print(" check ep_lo >=", elo,"/1e10 ?", ep_lo >= F(elo,10**10))
print(" check ep_hi <=", ehi,"/1e10 ?", ep_hi <= F(ehi,10**10))
print(" width:", ehi-elo, "e-10")
print(" <137 ?", F(ehi,10**10) < 137)
# The abstract core needs: 2425/18 + k_lo*Ccl >= elo/1e10 AND 2425/18 + k_hi*Cch <= ehi/1e10
print()
print("core LOWER: 2425/18 + k_lo*(", clo, "/1e9) >= ", elo, "/1e10 ?")
print("   value diff:", float((F(2425,18)+k_lo*Ccl) - F(elo,10**10)))
print("core UPPER: 2425/18 + k_hi*(", chi, "/1e9) <= ", ehi, "/1e10 ?")
print("   value diff:", float(F(ehi,10**10) - (F(2425,18)+k_hi*Cch)))
# The h2 norm_num facts in the core:
print()
print("h2_lo: k_lo*Ccl >= elo/1e10 - 2425/18 =", float(F(elo,10**10)-F(2425,18)))
print("   k_lo*Ccl =", float(k_lo*Ccl))
print("h2_hi: k_hi*Cch <= ehi/1e10 - 2425/18 =", float(F(ehi,10**10)-F(2425,18)))
print("   k_hi*Cch =", float(k_hi*Cch))
