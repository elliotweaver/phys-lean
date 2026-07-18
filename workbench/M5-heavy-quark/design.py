from fractions import Fraction as F

# q = cos(pi/4), q^2 = 1/2, banked bracket q in [7071/1e4, 707107/1e6] (M2 cutCos_quarter_bracket)
qlo = F(7071, 10000)
qhi = F(707107, 1000000)

# mbRatioDerived = (1-q)^2 / (3(1+q)), decreasing in q on (0,1)
def f(q):
    return (1 - q) ** 2 / (3 * (1 + q))

mb_hi = f(qlo)   # upper end at q smallest
mb_lo = f(qhi)   # lower end at q largest
print("mbRatioDerived in [%s, %s] = [%.10f, %.10f]" % (mb_lo, mb_hi, float(mb_lo), float(mb_hi)))

for name, LO, HI in [
    ("[167505/1e7,167522/1e7]", F(167505, 10**7), F(167522, 10**7)),
    ("[16750/1e6,16753/1e6]",   F(16750, 10**6),  F(16753, 10**6)),
]:
    print("  cand mb", name, "ok=", LO <= mb_lo and mb_hi <= HI)

# 1/mbRatioDerived (edgeCharm reciprocal, THEOREM-EXACT closed form)
inv_lo = 1 / mb_hi
inv_hi = 1 / mb_lo
print("1/mb in [%.8f, %.8f]" % (float(inv_lo), float(inv_hi)))
for name, LO, HI in [("[5969/100,5971/100]", F(5969, 100), F(5971, 100))]:
    print("  cand inv", name, "ok=", LO <= inv_lo and inv_hi <= HI)

# downConfBundle = mbRatioDerived / confBundle = mbRatioDerived * confBandRatio, confBandRatio in [4347,4350]
cbr_lo = F(4347)
cbr_hi = F(4350)
dcb_lo = mb_lo * cbr_lo
dcb_hi = mb_hi * cbr_hi
print("downConfBundle in [%.6f, %.6f]" % (float(dcb_lo), float(dcb_hi)))
for name, LO, HI in [
    ("[728/10,730/10]",   F(728, 10),  F(730, 10)),
    ("[7280/100,7288/100]", F(7280, 100), F(7288, 100)),
]:
    print("  cand dcb", name, "ok=", LO <= dcb_lo and dcb_hi <= HI)

# physical comparison (removable prose only)
print("--- removable-prose comparison (NOT a proof input) ---")
print("m_b/m_t PDG ~ 4.18/172.7 =", 4.18 / 172.7)
print("mbRatioDerived ~", float(mb_lo))
