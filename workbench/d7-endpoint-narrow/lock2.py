"""
Re-lock: inner core bracket at 10 decimals (nlinarith-provable from the 13-digit edge brackets),
then choose the endpoint production bracket to CONTAIN base+klo*inner_L .. base+khi*inner_H.
"""
from fractions import Fraction as F
import math

klo = F(1250000000, 3926990817) / 3
khi = F(50000000000, 157079632679) / 3

Lm01_lo = F(815406111272, 10**11); Lm01_hi = F(815406111273, 10**11)
Lb0_lo  = F(17337287949546, 10**13); Lb0_hi  = F(17337287949547, 10**13)
Lb2_lo  = F(-10887237252237, 10**13); Lb2_hi = F(-10887237252236, 10**13)
Lmb_lo  = F(-40893066400068, 10**13); Lmb_hi = F(-40893066400067, 10**13)

inner_lo = 2*Lm01_lo + F(7,3)*Lmb_lo + F(11,3)*Lb0_lo - F(5,3)*Lb2_hi
inner_hi = 2*Lm01_hi + F(7,3)*Lmb_hi + F(11,3)*Lb0_hi - F(5,3)*Lb2_lo
print("inner tight [%.15f, %.15f] width %.2e" % (float(inner_lo), float(inner_hi), float(inner_hi-inner_lo)))

# inner core bracket at 10 decimals
inner_L = F(149379518556, 10**10)   # 14.9379518556
inner_H = F(149379518557, 10**10)   # 14.9379518557
print("inner core [%s, %s] = [%.10f, %.10f]" % (inner_L, inner_H, float(inner_L), float(inner_H)))
print("  inner_L <= inner_lo:", inner_L <= inner_lo, "  inner_hi <= inner_H:", inner_hi <= inner_H)

base = F(2425,18)
e_lo = base + klo*inner_L
e_hi = base + khi*inner_H
print("propagated endpoint [%.14f, %.14f] width %.3e" % (float(e_lo), float(e_hi), float(e_hi-e_lo)))

# production endpoint bracket at 10 decimals to contain [e_lo, e_hi]
E_LO = F(math.floor(float(e_lo)*10**10), 10**10)
E_HI = F(math.ceil(float(e_hi)*10**10), 10**10)
print("production endpoint [%s, %s] = [%.10f, %.10f] width %.2e" % (E_LO, E_HI, float(E_LO), float(E_HI), float(E_HI-E_LO)))
print("  E_LO <= e_lo:", E_LO <= e_lo, "  e_hi <= E_HI:", e_hi <= E_HI)
print("  h2-lower: klo*inner_L >= E_LO-base :", klo*inner_L >= E_LO-base, " (%.15f >= %.15f)"%(float(klo*inner_L), float(E_LO-base)))
print("  h2-upper: khi*inner_H <= E_HI-base :", khi*inner_H <= E_HI-base, " (%.15f <= %.15f)"%(float(khi*inner_H), float(E_HI-base)))

BANK_LO=F(1363071880,10**7); BANK_HI=F(1363071883,10**7)
print("  nested strict in banked:", BANK_LO<E_LO, E_HI<BANK_HI, " <137:", E_HI<137)
print("  sig digits:", -math.log10(float(E_HI-E_LO)/float(E_LO)))
print()
# also check: is a 11-decimal bracket [136.30718814054,136.30718814056] achievable? 
# need klo*inner_L >= (that lo)-base ... it wasn't because inner_L at 10dp loses ~ klo*1e-10 ~1e-11.
# So 10-decimal endpoint bracket is the honest floor here (width 3e-10 -> 12 sig digits). Let's see exact.
print("Achievable endpoint bracket width:", float(E_HI-E_LO), "=> this is the certified rung.")

# DRESSED
inner_d_lo = 3*Lm01_lo + F(7,2)*Lmb_lo + F(11,2)*Lb0_lo - F(5,2)*Lb2_hi
inner_d_hi = 3*Lm01_hi + F(7,2)*Lmb_hi + F(11,2)*Lb0_hi - F(5,2)*Lb2_lo
print()
print("dressed inner tight [%.14f, %.14f]" % (float(inner_d_lo), float(inner_d_hi)))
innerd_L = F(math.floor(float(inner_d_lo)*10**10),10**10)
innerd_H = F(math.ceil(float(inner_d_hi)*10**10),10**10)
print("dressed inner core [%.10f, %.10f]" % (float(innerd_L), float(innerd_H)))
print("  innerd_L<=tight:", innerd_L<=inner_d_lo, " tight<=innerd_H:", inner_d_hi<=innerd_H)
ed_lo = base + klo*innerd_L
ed_hi = base + khi*innerd_H
ED_LO = F(math.floor(float(ed_lo)*10**10),10**10)
ED_HI = F(math.ceil(float(ed_hi)*10**10),10**10)
print("dressed production endpoint [%.10f, %.10f] width %.2e" % (float(ED_LO), float(ED_HI), float(ED_HI-ED_LO)))
print("  ED_LO<=ed_lo:", ED_LO<=ed_lo, " ed_hi<=ED_HI:", ed_hi<=ED_HI)
print("  h2-lower:", klo*innerd_L >= ED_LO-base, " h2-upper:", khi*innerd_H <= ED_HI-base)
print("  >137:", ED_LO>137, " dressed sig digits:", -math.log10(float(ED_HI-ED_LO)/float(ED_LO)))
# nested in banked dressed [137.0984,137.1006]
print("  nested in banked dressed [137.0984,137.1006]:", F(1370984,10**4)<ED_LO, ED_HI<F(1371006,10**4))
