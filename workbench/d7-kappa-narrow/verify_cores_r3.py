from fractions import Fraction as F

# ext7 kappa bounds
inv_lo = F(100000000000, 314159265359)
inv_hi = F(250000000000, 785398163397)
klo = inv_lo/3
khi = inv_hi/3

# s7 L_m01 + deepened edge logs (lo, hi)
L    = (F(815406111272599,10**14), F(815406111272603,10**14))
Lmb  = (F(-40893066400068,10**13), F(-40893066400067,10**13))
Lb0  = (F(17337287949546,10**13),  F(17337287949547,10**13))
Lb2  = (F(-10887237252238,10**13), F(-10887237252235,10**13))

base = F(2425,18)

def combo_bounds(cL,cLmb,cLb0,cLb2):
    lo = hi = F(0)
    for c,(a,b) in [(cL,L),(cLmb,Lmb),(cLb0,Lb0),(cLb2,Lb2)]:
        if c>0: lo += c*a; hi += c*b
        else:   lo += c*b; hi += c*a
    return lo,hi

for name, coeffs, INNER, ENDP in [
    ("BARE",   (F(2),F(7,3),F(11,3),F(-5,3)),
        (F(149379518556421,10**13), F(149379518556434,10**13)),
        (F(1363071881405515,10**13), F(1363071881405528,10**13))),
    ("DRESSED",(F(3),F(7,2),F(11,2),F(-5,2)),
        (F(224069277834632,10**13), F(224069277834650,10**13)),
        (F(1370996710997162,10**13), F(1370996710997180,10**13))),
]:
    clo,chi = combo_bounds(*coeffs)
    ILO,IHI = INNER
    ELO,EHI = ENDP
    print(f"=== {name} ===")
    print(f"  hcombo_lo  ILO<=combo_min: {ILO<=clo}   (ILO={float(ILO):.13f} combo_min={float(clo):.13f})")
    print(f"  hcombo_hi  combo_max<=IHI: {chi<=IHI}   (IHI={float(IHI):.13f} combo_max={float(chi):.13f})")
    lhs = klo*ILO; rhs = ELO - base
    print(f"  core_lo    klo*ILO>=ELO-base: {lhs>=rhs}   (klo*ILO={float(lhs):.15f}  ELO-base={float(rhs):.15f})")
    lhs2 = khi*IHI; rhs2 = EHI - base
    print(f"  core_hi    khi*IHI<=EHI-base: {lhs2<=rhs2}   (khi*IHI={float(lhs2):.15f}  EHI-base={float(rhs2):.15f})")
    if name=="BARE":
        print(f"  nested N580: ELO>=136.3071881405? {ELO>=F(1363071881405,10**10)}  EHI<=136.3071881406? {EHI<=F(1363071881406,10**10)}")
        print(f"  <137: {EHI<137}")
        print(f"  narrower than N580 (width): {float(EHI-ELO):.3e} vs 1e-10")
    else:
        print(f"  nested N580: ELO>=137.0996710997? {ELO>=F(1370996710997,10**10)}  EHI<=137.0996710998? {EHI<=F(1370996710998,10**10)}")
        print(f"  >137: {ELO>137}")
        print(f"  narrower than N580 (width): {float(EHI-ELO):.3e} vs 1e-10")
    print()

# cutPi ext7 bracket sanity: cutPi = 2*leastCosZero, leastCosZero in [1570796326794/1e12, 1570796326795/1e12]
lcz_lo = F(1570796326794,10**12)
lcz_hi = F(1570796326795,10**12)
cutpi_lo = 2*lcz_lo   # = 785398163397/25e10 ? check
cutpi_hi = 2*lcz_hi
print("cutPi_lo=2*lcz_lo =", cutpi_lo, "=?", F(785398163397,25*10**10), cutpi_lo==F(785398163397,25*10**10))
print("cutPi_hi=2*lcz_hi =", cutpi_hi, "=?", F(314159265359,10**11), cutpi_hi==F(314159265359,10**11))
# inv cutPi: [1/cutpi_hi, 1/cutpi_lo]
print("1/cutpi_hi =", 1/cutpi_hi, "=?", F(100000000000,314159265359), (1/cutpi_hi)==F(100000000000,314159265359))
print("1/cutpi_lo =", 1/cutpi_lo, "=?", F(250000000000,785398163397), (1/cutpi_lo)==F(250000000000,785398163397))
print("inv_cutPi width:", float(F(250000000000,785398163397)-F(100000000000,314159265359)))
# nested inside ext6 [1250000000/3926990817, 50000000000/157079632679]
e6lo=F(1250000000,3926990817); e6hi=F(50000000000,157079632679)
print("nested in ext6: lo>=e6lo?", F(100000000000,314159265359)>=e6lo, " hi<=e6hi?", F(250000000000,785398163397)<=e6hi)
