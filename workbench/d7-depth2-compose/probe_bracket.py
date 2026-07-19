from fractions import Fraction as F

# Banked sharp edge-log brackets (D7NarrowingRung1, exact rationals, foundations-only)
# L_m01 = cutLog(mass0/mass1) in [815406111272/1e11, 815406111273/1e11]
Lm01_lo = F(815406111272,10**11); Lm01_hi = F(815406111273,10**11)
# L_mb = cutLog mbRatioDerived in [-40893067/1e7, -40893066/1e7]
Lmb_lo = F(-40893067,10**7); Lmb_hi = F(-40893066,10**7)
# L_b0 = cutLog mass0 in [17337287/1e7, 17337288/1e7]
Lb0_lo = F(17337287,10**7); Lb0_hi = F(17337288,10**7)
# L_b2 = cutLog mass2 in [-10887238/1e7, -10887236/1e7]
Lb2_lo = F(-10887238,10**7); Lb2_hi = F(-10887236,10**7)
# kappa bracket: k in [(1250000000/3926990817)/3, (50000000000/157079632679)/3]
k_lo = F(1250000000,3926990817)/3
k_hi = F(50000000000,157079632679)/3

base = F(2425,18)

def bracket(coefLm01):
    # inner = coefLm01*L_m01 + (7/3)L_mb + (11/3)L_b0 - (5/3)L_b2  (all terms positive-coefficient except -5/3*Lb2 where Lb2<0 so -5/3*Lb2>0)
    # inner_lo: minimize -> use lo of positive-contributions, and for -5/3*Lb2 (Lb2 negative) minimize means Lb2 at hi (closest to 0)
    # Let's just compute extremes carefully term by term.
    # term1 = coef * L_m01  (coef>0, L_m01>0) -> lo uses Lm01_lo, hi uses Lm01_hi
    # term2 = 7/3 * L_mb    (L_mb<0) -> lo uses Lmb_lo (more negative), hi uses Lmb_hi
    # term3 = 11/3 * L_b0   (L_b0>0) -> lo uses Lb0_lo, hi uses Lb0_hi
    # term4 = -5/3 * L_b2   (L_b2<0 so term4>0) -> lo uses Lb2_hi (Lb2 largest -> term4 smallest), hi uses Lb2_lo
    inner_lo = F(coefLm01)*Lm01_lo + F(7,3)*Lmb_lo + F(11,3)*Lb0_lo - F(5,3)*Lb2_hi
    inner_hi = F(coefLm01)*Lm01_hi + F(7,3)*Lmb_hi + F(11,3)*Lb0_hi - F(5,3)*Lb2_lo
    # endpoint = base + k*inner ; inner>0 so lo uses k_lo, hi uses k_hi
    ep_lo = base + k_lo*inner_lo
    ep_hi = base + k_hi*inner_hi
    return inner_lo, inner_hi, ep_lo, ep_hi

for coef,label in [(2,"current (leading lepton tail)"),(3,"depth-2 run (3/2 dress lepton -> coeff 3)")]:
    il,ih,el,eh = bracket(coef)
    print(f"--- coeff L_m01 = {coef}  [{label}] ---")
    print(f"  inner in [{float(il):.9f}, {float(ih):.9f}]  width {float(ih-il):.2e}")
    print(f"  endpoint in [{float(el):.12f}, {float(eh):.12f}]")
    print(f"  endpoint width = {float(eh-el):.3e}")
    print()
