"""Compute the TIGHTEST valid production endpoint numerals directly from the cores."""
from fractions import Fraction as F
from mpmath import mp, mpf, floor, ceil, log10
mp.dps=100
def to_mpf(fr): return mpf(fr.numerator)/mpf(fr.denominator)
inv_lo=F(5000000000000,15707963267949); inv_hi=F(50000000000000,157079632679489)
klo,khi=inv_lo/3,inv_hi/3
Lm01=(F(815406111272599,10**14),F(815406111272603,10**14))
Lb0 =(F(173372879495463,10**14),F(173372879495464,10**14))
Lb2 =(F(-108872372522363,10**14),F(-108872372522362,10**14))
Lmb =(F(-408930664000672,10**14),F(-408930664000671,10**14))
base=F(2425,18)
def combo(coeffs):
    lo=hi=F(0)
    for c,(a,b) in zip(coeffs,[Lm01,Lmb,Lb0,Lb2]):
        if c>0: lo+=c*a; hi+=c*b
        else:   lo+=c*b; hi+=c*a
    return lo,hi
NUM=10**14; CG=10**13
for nm,coeffs,r3lo,r3hi,cmp in [
  ("BARE",(F(2),F(7,3),F(11,3),F(-5,3)),F(1363071881405515,10**13),F(1363071881405528,10**13),"<137"),
  ("DRESSED",(F(3),F(7,2),F(11,2),F(-5,2)),F(1370996710997162,10**13),F(1370996710997180,10**13),">137"),
]:
    clo,chi=combo(coeffs)
    # inner production bracket at 1e13
    CLO=F(int(floor(to_mpf(clo)*CG)),CG); CHI=F(int(ceil(to_mpf(chi)*CG)),CG)
    assert CLO<=clo and chi<=CHI
    # endpoint production: ELO = floor((base+klo*CLO)*NUM)/NUM, EHI = ceil((base+khi*CHI)*NUM)/NUM
    lo_val=base+klo*CLO; hi_val=base+khi*CHI
    ELO=F(int(floor(to_mpf(lo_val)*NUM)),NUM); EHI=F(int(ceil(to_mpf(hi_val)*NUM)),NUM)
    # verify cores
    core_lo = klo*CLO >= ELO-base
    core_hi = khi*CHI <= EHI-base
    w=EHI-ELO; sig=-log10(float(w)/136.307)
    print(f"=== {nm} ===")
    print(f"  CLO={CLO.numerator}/{CLO.denominator}  CHI={CHI.numerator}/{CHI.denominator}")
    print(f"  ELO={ELO.numerator}/{ELO.denominator}  EHI={EHI.numerator}/{EHI.denominator}")
    print(f"     = [{float(ELO):.14f}, {float(EHI):.14f}]  w={float(w):.2e}  ~{float(sig):.2f} sig {'OK' if sig>=15 else 'SHORT'}")
    print(f"  core_lo? {core_lo}   core_hi? {core_hi}")
    print(f"  nested Rung3? {ELO>=r3lo and EHI<=r3hi}   {cmp}? {(EHI<137) if cmp=='<137' else (ELO>137)}   strict? {ELO<EHI}")
    # width narrower than Rung3?
    r3w = r3hi-r3lo
    print(f"  narrower than Rung3 width ({float(r3w):.2e})? {w < r3w}")
    print()
