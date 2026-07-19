from fractions import Fraction as F
import math

klo = F(1250000000, 3926990817) / 3
khi = F(50000000000, 157079632679) / 3

Lm01_lo = F(815406111272, 10**11); Lm01_hi = F(815406111273, 10**11)
Lb0_lo  = F(17337287949546, 10**13); Lb0_hi  = F(17337287949547, 10**13)
Lb2_lo  = F(-10887237252237, 10**13); Lb2_hi = F(-10887237252236, 10**13)
Lmb_lo  = F(-40893066400068, 10**13); Lmb_hi = F(-40893066400067, 10**13)

# BARE inner: 2 L_m01 + 7/3 Lmb + 11/3 Lb0 - 5/3 Lb2
inner_lo = 2*Lm01_lo + F(7,3)*Lmb_lo + F(11,3)*Lb0_lo - F(5,3)*Lb2_hi
inner_hi = 2*Lm01_hi + F(7,3)*Lmb_hi + F(11,3)*Lb0_hi - F(5,3)*Lb2_lo
print("BARE inner tight [%.15f, %.15f] w=%.2e" % (float(inner_lo), float(inner_hi), float(inner_hi-inner_lo)))
inner_L = F(149379518556, 10**10); inner_H = F(149379518557, 10**10)
assert inner_L <= inner_lo and inner_hi <= inner_H
base = F(2425,18)
E_LO = F(1363071881405, 10**10)  # 136.3071881405
E_HI = F(1363071881406, 10**10)  # 136.3071881406
# core h2 conditions
print("  BARE h2-lo:", klo*inner_L >= E_LO-base, " h2-hi:", khi*inner_H <= E_HI-base)
print("  endpoint propagated [%.13f, %.13f]"%(float(base+klo*inner_L), float(base+khi*inner_H)))
print("  E [%.10f, %.10f] w=%.1e nested-strict:"%(float(E_LO),float(E_HI),float(E_HI-E_LO)), F(1363071880,10**7)<E_LO, E_HI<F(1363071883,10**7), " <137:", E_HI<137)

# DRESSED inner: 3 L_m01 + 7/2 Lmb + 11/2 Lb0 - 5/2 Lb2
innerd_lo = 3*Lm01_lo + F(7,2)*Lmb_lo + F(11,2)*Lb0_lo - F(5,2)*Lb2_hi
innerd_hi = 3*Lm01_hi + F(7,2)*Lmb_hi + F(11,2)*Lb0_hi - F(5,2)*Lb2_lo
print()
print("DRESSED inner tight [%.14f, %.14f]" % (float(innerd_lo), float(innerd_hi)))
innerd_L = F(224069277834, 10**10); innerd_H = F(224069277835, 10**10)
assert innerd_L <= innerd_lo and innerd_hi <= innerd_H, (float(innerd_L),float(innerd_lo),float(innerd_hi),float(innerd_H))
ED_LO = F(1370996710997, 10**10); ED_HI = F(1370996710998, 10**10)
print("  DRESSED h2-lo:", klo*innerd_L >= ED_LO-base, " h2-hi:", khi*innerd_H <= ED_HI-base)
print("  dressed propagated [%.13f, %.13f]"%(float(base+klo*innerd_L), float(base+khi*innerd_H)))
print("  ED [%.10f, %.10f] nested-strict:"%(float(ED_LO),float(ED_HI)), F(1370984,10**4)<ED_LO, ED_HI<F(1371006,10**4), " >137:", ED_LO>137)
print()
print("BARE inner core bracket target: [14937951855.6/1e9? ] use inner_L=%s inner_H=%s"%(inner_L,inner_H))
print("DRESSED inner core: innerd_L=%s innerd_H=%s"%(innerd_L,innerd_H))
