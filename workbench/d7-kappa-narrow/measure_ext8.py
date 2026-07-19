"""
W9 MEASURE for ext8: rank endpoint residual contributions with the 1e13-grid kappa,
to decide the deepening set (does kappa stay dominant? which edge logs become co-dominant?).
"""
from fractions import Fraction as F
import math

# ext8 kappa bracket (from design_lcz13.py)
inv_ext8 = (F(5000000000000,15707963267949), F(1250000000000,3926990816987))
klo, khi = inv_ext8[0]/3, inv_ext8[1]/3
kmid = (klo+khi)/2
kw = khi-klo

# inputs (lo, hi) — banked N580/s7 widths
inputs = {
    "L_m01_s7": (F(815406111272599,10**14), F(815406111272603,10**14), F(2)),   # width 4e-14
    "L_mb":  (F(-40893066400068,10**13), F(-40893066400067,10**13), F(7,3)),    # width 1e-13
    "L_b0":  (F(17337287949546,10**13),  F(17337287949547,10**13),  F(11,3)),   # width 1e-13
    "L_b2":  (F(-10887237252238,10**13), F(-10887237252235,10**13), F(-5,3)),   # width 3e-13
}

print("kappa ext8: kmid=%.6e  kwidth=%.4e" % (float(kmid), float(kw)))
# cInner
cInner_lo = cInner_hi = F(0)
for name,(lo,hi,c) in inputs.items():
    if c>0: cInner_lo += c*lo; cInner_hi += c*hi
    else:   cInner_lo += c*hi; cInner_hi += c*lo
cInner_mid = (cInner_lo+cInner_hi)/2
print("cInner ~ %.10f" % float(cInner_mid))
print()
print("=== ENDPOINT WIDTH CONTRIBUTIONS (bare) with ext8 kappa ===")
# kappa contribution = |cInner| * kwidth
kappa_contrib = abs(cInner_mid)*kw
print("  kappa      %.4e   (was ~1.0e-12 at ext7)" % float(kappa_contrib))
contribs = {}
for name,(lo,hi,c) in inputs.items():
    w = hi-lo
    contribs[name] = abs(c)*khi*w
for n,v in sorted(contribs.items(), key=lambda x:-x[1]):
    print("  %-10s %.4e" % (n, float(v)))
total = float(kappa_contrib) + sum(float(v) for v in contribs.values())
print("  ---- TOTAL bare width = %.4e => ~%.2f sig digits" % (total, -math.log10(total/136.307)))
print()

# Now: what if we ALSO deepen edge logs one rung (widths /100 say, or specific)?
# The banked edge logs are at ~1e-13 width. One deeper rung of the exp instrument ~ /100 or more.
print("=== SCENARIOS for deepening set (target width < 1.4e-13 for 15 sig digits) ===")
def endpoint_width(edge_scale, lm01_key, lm01_w=None):
    kc = float(abs(cInner_mid)*kw)
    tot = kc
    parts = {"kappa": kc}
    for name,(lo,hi,c) in inputs.items():
        w = float(hi-lo)
        if name=="L_m01_s7" and lm01_w is not None:
            w = lm01_w
        elif name.startswith("L_") and name!="L_m01_s7":
            w = w*edge_scale
        parts[name]=abs(float(c))*float(khi)*w
        tot += parts[name]
    return tot, parts

for label, escale in [("edge logs AS-IS (1e-13)",1.0),
                      ("edge logs /10",0.1),
                      ("edge logs /100 (one deeper rung)",0.01)]:
    tot,parts = endpoint_width(escale, "L_m01_s7")
    sig = -math.log10(tot/136.307)
    print(f"  {label:40s} total={tot:.3e}  ~{sig:.2f} sig digits  {'>=15 OK' if sig>=15 else '<15'}")
    for n,v in sorted(parts.items(),key=lambda x:-x[1]):
        print(f"      {n:10s} {v:.3e}")
