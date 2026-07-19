"""
Lock the FINAL rational brackets for the production module + verify the
endpoint arithmetic-core inequalities with margin (mirroring endpoint_core_s1).
"""
from fractions import Fraction as F
import math

# kappa bracket (ext6)
klo = F(1250000000, 3926990817) / 3
khi = F(50000000000, 157079632679) / 3

# sharpened edge-log brackets (13-digit, node 4)
Lm01_lo = F(815406111272, 10**11); Lm01_hi = F(815406111273, 10**11)  # banked NB11 (unchanged)
Lb0_lo  = F(17337287949546, 10**13); Lb0_hi  = F(17337287949547, 10**13)
Lb2_lo  = F(-10887237252237, 10**13); Lb2_hi = F(-10887237252236, 10**13)
Lmb_lo  = F(-40893066400068, 10**13); Lmb_hi = F(-40893066400067, 10**13)

# inner = 2 L_m01 + 7/3 Lmb + 11/3 Lb0 - 5/3 Lb2   (bare coeffs)
inner_lo = 2*Lm01_lo + F(7,3)*Lmb_lo + F(11,3)*Lb0_lo - F(5,3)*Lb2_hi
inner_hi = 2*Lm01_hi + F(7,3)*Lmb_hi + F(11,3)*Lb0_hi - F(5,3)*Lb2_lo
print("inner exact in [%s, %s]" % (inner_lo, inner_hi))
print("  floats [%.15f, %.15f] width %.2e" % (float(inner_lo), float(inner_hi), float(inner_hi-inner_lo)))

# choose rational inner bracket with margin (round outward at 1e-9 for a safe nlinarith target)
inner_L = F(math.floor(float(inner_lo)*10**9), 10**9)   # 14937951855/1e9 = 14.937951855
inner_H = F(math.ceil(float(inner_hi)*10**9), 10**9)    # 14937951856/1e9
print("  chosen inner core bracket [%s, %s] = [%.9f, %.9f]" % (inner_L, inner_H, float(inner_L), float(inner_H)))
print("   inner_L <= inner_lo ?", inner_L <= inner_lo, "   inner_hi <= inner_H ?", inner_hi <= inner_H)

# endpoint = 2425/18 + k*inner ; k in [klo,khi], inner in [inner_L, inner_H] (>0)
base = F(2425,18)
e_lo_tight = base + klo*inner_lo
e_hi_tight = base + khi*inner_hi
print()
print("endpoint tight [%.14f, %.14f] width %.3e" % (float(e_lo_tight), float(e_hi_tight), float(e_hi_tight-e_lo_tight)))

# production endpoint bracket at 11 decimal places (13 sig digits):
# lo = 13630718814054/1e11 = 136.30718814054 ; hi = 13630718814056/1e11
E_LO = F(13630718814054, 10**11)
E_HI = F(13630718814056, 10**11)
print("production endpoint bracket [%s, %s] = [%.11f, %.11f]" % (E_LO, E_HI, float(E_LO), float(E_HI)))
# verify: base + klo*inner_L >= E_LO  and base + khi*inner_H <= E_HI
lhs_lo = base + klo*inner_L
lhs_hi = base + khi*inner_H
print("  base+klo*inner_L = %.14f  >= E_LO(%.11f)? %s" % (float(lhs_lo), float(E_LO), lhs_lo>=E_LO))
print("  base+khi*inner_H = %.14f  <= E_HI(%.11f)? %s" % (float(lhs_hi), float(E_HI), lhs_hi<=E_HI))
# margin check the h2 constants like the banked core:
print()
print("  klo*inner_L = %s" % (klo*inner_L))
print("  E_LO - base = %s (%.14f)" % (E_LO-base, float(E_LO-base)))
print("  need klo*inner_L >= E_LO-base :", klo*inner_L >= E_LO-base)
print("  khi*inner_H = %s" % (khi*inner_H))
print("  E_HI - base = %s (%.14f)" % (E_HI-base, float(E_HI-base)))
print("  need khi*inner_H <= E_HI-base :", khi*inner_H <= E_HI-base)

# nested strictly inside banked [136.307188, 136.3071883]?
BANK_LO=F(1363071880,10**7); BANK_HI=F(1363071883,10**7)
print()
print("nested in banked [%.7f,%.7f]?  BANK_LO<=E_LO: %s  E_HI<=BANK_HI: %s" % (float(BANK_LO),float(BANK_HI), BANK_LO<=E_LO, E_HI<=BANK_HI))
print("  strict:", BANK_LO<E_LO, E_HI<BANK_HI)
print("endpoint < 137 ?", E_HI < 137)

# Also DRESSED endpoint = 2425/18 + (3/2) k * inner  (dressed coeffs 3, 7/2, 11/2, -5/2)
inner_d_lo = 3*Lm01_lo + F(7,2)*Lmb_lo + F(11,2)*Lb0_lo - F(5,2)*Lb2_hi
inner_d_hi = 3*Lm01_hi + F(7,2)*Lmb_hi + F(11,2)*Lb0_hi - F(5,2)*Lb2_lo
ed_lo = base + klo*inner_d_lo
ed_hi = base + khi*inner_d_hi
print()
print("DRESSED endpoint tight [%.12f, %.12f] width %.3e" % (float(ed_lo), float(ed_hi), float(ed_hi-ed_lo)))
print("   ~ sig digits: %.1f" % (-math.log10(float(ed_hi-ed_lo)/float(ed_lo))))
