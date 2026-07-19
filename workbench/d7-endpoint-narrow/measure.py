"""
W9 MEASURE-FIRST for D7 endpoint narrowing node 4.

Endpoint normal form (bare, banked recomposedEndpoint_cInner):
  recomposedEndpoint = 2425/18 + kappaLeading * cInner
  cInner = 2*L_m01 + (7/3)*L_mb + (11/3)*L_b0 - (5/3)*L_b2
with kappaLeading = (1/cutPi)/3.

Current banked sharp brackets (D7NarrowingRung1):
  L_m01 = cutLog(mass0/mass1) in [815406111272/1e11, 815406111273/1e11]   width 1e-11
  L_mb  = cutLog mbRatioDerived in [-40893067/1e7, -40893066/1e7]          width 1e-7
  L_b0  = cutLog(bMass 0)=cutLog mass0 in [17337287/1e7, 17337288/1e7]     width 1e-7
  L_b2  = cutLog(bMass 2)=cutLog mass2 in [-10887238/1e7, -10887236/1e7]   width 2e-7
  kappa in [(1250000000/3926990817)/3, (50000000000/157079632679)/3]

Measure: for each input, the endpoint-width contribution = |coeff| * kappa * width.
And rank. Then compute the endpoint width and confirm ~3e-7 => ~9 digits.
"""
from fractions import Fraction as F

# kappa bracket (from D7CompositionAttestation.kappa_bracket)
klo = F(1250000000, 3926990817) / 3
khi = F(50000000000, 157079632679) / 3
kappa_mid = (klo + khi) / 2
kappa_w = khi - klo
print("kappa lo  =", float(klo))
print("kappa hi  =", float(khi))
print("kappa mid =", float(kappa_mid))
print("kappa width=", float(kappa_w))
print()

# input brackets (lo, hi)
inputs = {
    "L_m01": (F(815406111272,10**11), F(815406111273,10**11), F(2)),      # coeff 2
    "L_mb":  (F(-40893067,10**7),      F(-40893066,10**7),     F(7,3)),   # coeff 7/3
    "L_b0":  (F(17337287,10**7),       F(17337288,10**7),      F(11,3)),  # coeff 11/3
    "L_b2":  (F(-10887238,10**7),      F(-10887236,10**7),     F(-5,3)),  # coeff -5/3
}

print("PER-INPUT WIDTH CONTRIBUTION TO ENDPOINT (|coeff|*kappa_hi*input_width):")
contribs = {}
for name,(lo,hi,coeff) in inputs.items():
    w = hi - lo
    c = abs(coeff) * khi * w
    contribs[name] = c
    print(f"  {name:6s} coeff={str(coeff):6s} width={float(w):.2e}  contrib={float(c):.3e}")
print()

# also the kappa contribution: d(endpoint)/d(kappa)*kappa_width = cInner_mid * kappa_width
# cInner at midpoints:
cInner_mid = sum(coeff*(lo+hi)/2 for _,(lo,hi,coeff) in inputs.items())
print("cInner (mid) =", float(cInner_mid))
kappa_contrib = abs(cInner_mid) * kappa_w
print(f"  kappa  contrib={float(kappa_contrib):.3e}  (from kappa width {float(kappa_w):.2e})")
print()

total = sum(contribs.values()) + kappa_contrib
print("SUM of contributions (endpoint width estimate) =", float(total))
print()

# rank
ranked = sorted(list(contribs.items()) + [("kappa", kappa_contrib)], key=lambda x: -x[1])
print("RANKED (dominant first):")
for name,c in ranked:
    print(f"  {name:6s} {float(c):.3e}")
print()

# Now the actual assembled endpoint bracket, exact interval arithmetic:
def endpoint_bracket():
    # endpoint = 2425/18 + kappa*(2 L_m01 + 7/3 L_mb + 11/3 L_b0 - 5/3 L_b2)
    # inner combination range:
    lo_terms = []
    hi_terms = []
    # 2*L_m01: coeff +2
    for name,(lo,hi,coeff) in inputs.items():
        if coeff > 0:
            lo_terms.append(coeff*lo); hi_terms.append(coeff*hi)
        else:
            lo_terms.append(coeff*hi); hi_terms.append(coeff*lo)
    inner_lo = sum(lo_terms); inner_hi = sum(hi_terms)
    # kappa positive, inner positive: endpoint_lo = base + klo*inner_lo, endpoint_hi = base+khi*inner_hi
    base = F(2425,18)
    e_lo = base + klo*inner_lo
    e_hi = base + khi*inner_hi
    return inner_lo, inner_hi, e_lo, e_hi

il, ih, elo, ehi = endpoint_bracket()
print("inner combination in [%.9f, %.9f] width %.3e" % (float(il), float(ih), float(ih-il)))
print("endpoint bracket [%.10f, %.10f]" % (float(elo), float(ehi)))
print("endpoint width = %.3e => sig digits ~ %.1f" % (float(ehi-elo), -__import__('math').log10(float(ehi-elo)/float(elo))))
