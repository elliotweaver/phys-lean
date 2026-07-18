from fractions import Fraction as F

# Banked amplitude brackets over derived R Cut (GenerationMassRatiosNumeric)
b0_lo, b0_hi = F(237943, 100000), F(237944, 100000)
b1_lo, b1_hi = F(4034, 100000), F(40365, 1000000)
b2_lo, b2_hi = F(5802, 10000), F(58022, 100000)
sur = F(2, 3)
deficit = 1 - sur  # 1/3


def edge_bounds(Alo, Ahi, Blo, Bhi):
    # edgeCross = A*B*(1-sur), A,B>0 -> [Alo*Blo*def, Ahi*Bhi*def]
    cross_lo = Alo * Blo * deficit
    cross_hi = Ahi * Bhi * deficit
    # edgeNu = A^2+B^2
    Nu_lo = Alo**2 + Blo**2
    Nu_hi = Ahi**2 + Bhi**2
    # edgeNd = A^2+(sur*B)^2
    Nd_lo = Alo**2 + (sur * Blo)**2
    Nd_hi = Ahi**2 + (sur * Bhi)**2
    den_lo = Nu_lo * Nd_lo
    den_hi = Nu_hi * Nd_hi
    # mix2_lo = cross_lo^2 / den_hi ; mix2_hi = cross_hi^2 / den_lo
    m2_lo = cross_lo**2 / den_hi
    m2_hi = cross_hi**2 / den_lo
    return m2_lo, m2_hi, cross_lo, cross_hi, Nu_lo, Nu_hi, Nd_lo, Nd_hi


def check(name, m2_lo, m2_hi, chosen_lo, chosen_hi):
    ok_lo = chosen_lo <= m2_lo
    ok_hi = m2_hi <= chosen_hi
    print("%-14s provable m2 in [%.10g, %.10g]" % (name, float(m2_lo), float(m2_hi)))
    print("               chosen  [%.10g, %.10g]  lo_ok=%s hi_ok=%s width=%.3g" % (
        float(chosen_lo), float(chosen_hi), ok_lo, ok_hi, float(chosen_hi - chosen_lo)))
    assert ok_lo and ok_hi, "BRACKET FAILS for " + name
    return chosen_lo, chosen_hi


print("=== 1-3 edge (b0,b1): leading b0, dressed b1 ===")
m2l, m2h, cl, ch, nul, nuh, ndl, ndh = edge_bounds(b0_lo, b0_hi, b1_lo, b1_hi)
print("  cross_lo=%s cross_hi=%s" % (cl, ch))
lo13, hi13 = check("mix2_13", m2l, m2h, F(3191, 100000000), F(3197, 100000000))
print()

print("=== 2-3 edge (b2,b1): leading b2, dressed b1 ===")
m2l, m2h, cl, ch, nul, nuh, ndl, ndh = edge_bounds(b2_lo, b2_hi, b1_lo, b1_hi)
print("  cross_lo=%s cross_hi=%s" % (cl, ch))
lo23, hi23 = check("mix2_23", m2l, m2h, F(5332, 10000000), F(5342, 10000000))
print()

# banked leading (C2): cabMix2 in [60740/1e7, 60770/1e7]
lo12, hi12 = F(60740, 10000000), F(60770, 10000000)
print("=== leading (b0,b2) banked cabMix2 in [%.7f, %.7f] ===" % (float(lo12), float(hi12)))
print()

print("=== HIERARCHY ORDER (disjoint brackets) ===")
print("mix2_12 > mix2_23 :  lo12=%.8f  >  hi23=%.8f  -> %s" % (float(lo12), float(hi23), lo12 > hi23))
print("mix2_23 > mix2_13 :  lo23=%.8f  >  hi13=%.8f  -> %s" % (float(lo23), float(hi13), lo23 > hi13))
assert lo12 > hi23 and lo23 > hi13, "ORDERING NOT DISJOINT"
print("ORDER: mix2_12 > mix2_23 > mix2_13  DISJOINT & PROVABLE by linarith")
print()

# structural monotonicity WHY: edgeMix2 is scale-invariant = g(ratio t=B/A), strictly increasing in t
# monotone difference reduces to (t2^2 - t1^2)(1 - sur^2 t1^2 t2^2) > 0
print("=== STRUCTURAL WHY: scale-invariance + monotone in amplitude ratio ===")
t12 = b2_lo / b0_hi  # >= worst-case ratio for 1-2 (lower bound of b2/b0)
# amplitude ratios (midpoints for display)
b0m, b1m, b2m = (b0_lo+b0_hi)/2, (b1_lo+b1_hi)/2, (b2_lo+b2_hi)/2
print("t_12 = b2/b0 = %.6f" % float(b2m/b0m))
print("t_23 = b1/b2 = %.6f" % float(b1m/b2m))
print("t_13 = b1/b0 = %.6f" % float(b1m/b0m))
print("ratio order t_12 > t_23 > t_13 forced by amplitude order b0 > b2 > b1:")
print("  t_12 > t_13  <=> b2 > b1 (share denom b0):  b2_lo=%.5f > b1_hi=%.5f -> %s" % (
    float(b2_lo), float(b1_hi), b2_lo > b1_hi))
print("  t_23 > t_13  <=> b0 > b2 (share numer b1):  b0_lo=%.5f > b2_hi=%.5f -> %s" % (
    float(b0_lo), float(b2_hi), b0_lo > b2_hi))
print("  t_12 > t_23  <=> b2^2 > b0*b1:  b2^2_lo=%.5f > (b0*b1)_hi=%.5f -> %s" % (
    float(b2_lo**2), float(b0_hi*b1_hi), b2_lo**2 > b0_hi*b1_hi))
print()
print("monotone factor (1 - sur^2 t1^2 t2^2) > 0 for all t in (0,1): sur=2/3 -> always positive")
print("ALL CHECKS PASS")
