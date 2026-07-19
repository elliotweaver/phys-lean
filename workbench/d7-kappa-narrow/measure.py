"""
W9 MEASURE-FIRST for D7 endpoint narrowing NODE 5 (kappa=1/cutPi rung).

Endpoint bare normal form (banked recomposedEndpoint_cInner):
  recomposedEndpoint = 2425/18 + kappaLeading * cInner
  cInner = 2*L_m01 + (7/3)*L_mb + (11/3)*L_b0 - (5/3)*L_b2
with kappaLeading = (1/cutPi)/3.

After N580: edge logs deepened to ~1e-13. Now confirm kappa is the dominant residual
and compute the 1e12-grid sharpening.
"""
from fractions import Fraction as F
from mpmath import mp, mpf, pi, cos
mp.dps = 60

# ---- N580 banked deepened inputs (lo, hi, coeff) ----
inputs = {
    # L_m01: currently banked NB11 s6 width 1e-11 (coeff 2). PRESERVED Lm01GridS7 => width 4e-14.
    "L_m01_s6": (F(815406111272,10**11), F(815406111273,10**11), F(2)),
    "L_m01_s7": (F(815406111272599,10**14), F(815406111272603,10**14), F(2)),
    "L_mb":  (F(-40893066400068,10**13), F(-40893066400067,10**13), F(7,3)),
    "L_b0":  (F(17337287949546,10**13),  F(17337287949547,10**13),  F(11,3)),
    "L_b2":  (F(-10887237252238,10**13), F(-10887237252235,10**13), F(-5,3)),
}

# ---- kappa brackets: ext6 (banked) and ext7 (1e12 grid, to build) ----
# ext6: 1/cutPi in [1250000000/3926990817, 50000000000/157079632679]
inv_ext6 = (F(1250000000,3926990817), F(50000000000,157079632679))

# ext7: 1e12 grid. leastCosZero in [floor, ceil] of true pi/2*1e12
pi2 = pi/2
g12 = mpf(10)**12
print("pi/2 * 1e12 =", mp.nstr(pi2*g12, 20))
floor12 = int(mp.floor(pi2*g12))   # leastCosZero lower * 1e12
ceil12  = floor12 + 1              # leastCosZero upper * 1e12
print("floor12 =", floor12, " ceil12 =", ceil12)
lcz_lo = F(floor12, 10**12)
lcz_hi = F(ceil12, 10**12)
print("leastCosZero ext7 in [%s, %s]" % (lcz_lo, lcz_hi))
print("  width =", float(lcz_hi-lcz_lo))
# cutPi = 2*leastCosZero
cutPi_lo = 2*lcz_lo
cutPi_hi = 2*lcz_hi
print("cutPi ext7 in [%s, %s]  (=[%s,%s])" % (cutPi_lo, cutPi_hi, mp.nstr(float(cutPi_lo),16), mp.nstr(float(cutPi_hi),16)))
# 1/cutPi in [1/cutPi_hi, 1/cutPi_lo]
inv_ext7 = (1/cutPi_hi, 1/cutPi_lo)
print("1/cutPi ext7 in [%s, %s]" % (inv_ext7[0], inv_ext7[1]))
print("  width ext7 =", float(inv_ext7[1]-inv_ext7[0]))
print("  width ext6 =", float(inv_ext6[1]-inv_ext6[0]))
print("  true 1/pi  =", mp.nstr(1/pi, 20))
# sanity: true 1/pi inside ext7?
print("  inside ext7?", float(inv_ext7[0]) < float(1/pi) < float(inv_ext7[1]))
print()

# kappaLeading = (1/cutPi)/3
def kappa_from_inv(inv):
    return (inv[0]/3, inv[1]/3)

# ---- endpoint width contribution per input: |coeff|*kappa_mid*width ----
def endpoint_width(kappa, l_m01_key):
    klo, khi = kappa
    kmid = (klo+khi)/2
    kw = khi-klo
    # inner combination cInner
    keys = [l_m01_key, "L_mb", "L_b0", "L_b2"]
    contribs = {}
    cInner_lo = cInner_hi = F(0)
    for name in keys:
        lo,hi,coeff = inputs[name]
        w = hi-lo
        contribs[name] = abs(coeff)*khi*w
        if coeff > 0:
            cInner_lo += coeff*lo; cInner_hi += coeff*hi
        else:
            cInner_lo += coeff*hi; cInner_hi += coeff*lo
    cInner_mid = (cInner_lo+cInner_hi)/2
    kappa_contrib = abs(cInner_mid)*kw
    total = sum(contribs.values()) + kappa_contrib
    return contribs, kappa_contrib, cInner_lo, cInner_hi, total, kmid

print("=== SCENARIO A: kappa ext6 (banked), L_m01 s6 (banked) — the N580 state ===")
c,kc,cil,cih,tot,kmid = endpoint_width(kappa_from_inv(inv_ext6), "L_m01_s6")
for n,v in sorted(c.items(),key=lambda x:-x[1]): print("  %-8s %.3e"%(n,float(v)))
print("  kappa    %.3e"%float(kc))
print("  TOTAL endpoint width = %.3e => ~%.1f sig digits"%(float(tot), -__import__('math').log10(float(tot)/136.3)))
print()

print("=== SCENARIO B: kappa ext7 (1e12), L_m01 s6 (banked) ===")
c,kc,cil,cih,tot,kmid = endpoint_width(kappa_from_inv(inv_ext7), "L_m01_s6")
for n,v in sorted(c.items(),key=lambda x:-x[1]): print("  %-8s %.3e"%(n,float(v)))
print("  kappa    %.3e"%float(kc))
print("  TOTAL endpoint width = %.3e => ~%.1f sig digits"%(float(tot), -__import__('math').log10(float(tot)/136.3)))
print()

print("=== SCENARIO C: kappa ext7 (1e12) + L_m01 s7 (PRESERVED, width 4e-14) ===")
c,kc,cil,cih,tot,kmid = endpoint_width(kappa_from_inv(inv_ext7), "L_m01_s7")
for n,v in sorted(c.items(),key=lambda x:-x[1]): print("  %-8s %.3e"%(n,float(v)))
print("  kappa    %.3e"%float(kc))
print("  TOTAL endpoint width = %.3e => ~%.1f sig digits"%(float(tot), -__import__('math').log10(float(tot)/136.3)))
print()

# ---- assemble the actual endpoint bracket for scenario C ----
def assemble(kappa, l_m01_key, coeffs):
    """coeffs = (cL, cLmb, cLb0, cLb2) for the inner. bare: (2,7/3,11/3,-5/3)"""
    klo, khi = kappa
    keys = [l_m01_key, "L_mb", "L_b0", "L_b2"]
    cs = coeffs
    inner_lo = inner_hi = F(0)
    for name,coeff in zip(keys, cs):
        lo,hi,_ = inputs[name]
        if coeff > 0:
            inner_lo += coeff*lo; inner_hi += coeff*hi
        else:
            inner_lo += coeff*hi; inner_hi += coeff*lo
    base = F(2425,18)
    # endpoint = base + kappa*inner, kappa>0, inner>0
    e_lo = base + klo*inner_lo
    e_hi = base + khi*inner_hi
    return inner_lo, inner_hi, e_lo, e_hi

print("=== ASSEMBLED BARE ENDPOINT (scenario C: ext7 kappa + s7 L_m01) ===")
il,ih,elo,ehi = assemble(kappa_from_inv(inv_ext7), "L_m01_s7", (F(2),F(7,3),F(11,3),F(-5,3)))
print("inner in [%.12f, %.12f] width %.3e"%(float(il),float(ih),float(ih-il)))
print("endpoint in [%.13f, %.13f]"%(float(elo),float(ehi)))
print("width %.3e"%float(ehi-elo))
print("N580 banked bracket [136.3071881405, 136.3071881406]")
print("nested inside N580?", 136.3071881405 <= float(elo) and float(ehi) <= 136.3071881406)
print()
print("=== ASSEMBLED DRESSED ENDPOINT (coeffs 3, 7/2, 11/2, -5/2) ===")
il,ih,elo,ehi = assemble(kappa_from_inv(inv_ext7), "L_m01_s7", (F(3),F(7,2),F(11,2),F(-5,2)))
print("inner in [%.12f, %.12f] width %.3e"%(float(il),float(ih),float(ih-il)))
print("endpoint in [%.13f, %.13f]"%(float(elo),float(ehi)))
print("width %.3e"%float(ehi-elo))
print("N580 dressed [137.0996710997, 137.0996710998]")
