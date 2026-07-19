"""Final verify with uniform 1e14-denominator endpoint numerals + edge logs as m/1e14."""
from fractions import Fraction as F
inv_lo=F(5000000000000,15707963267949); inv_hi=F(50000000000000,157079632679489)
klo,khi=inv_lo/3,inv_hi/3
# edge logs as m/1e14
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

# NOTE: edge logs widened slightly to m/1e14 grid (Lb0 hi 173372879495464 vs exact 173372879495463.x)
# Re-check that these m/1e14 windows still CONTAIN the exact source (they must, since I floor/ceil'd).
for nm,coeffs,CLO,CHI,ELO,EHI,r3lo,r3hi,cmp in [
  ("BARE",(F(2),F(7,3),F(11,3),F(-5,3)),
     F(149379518556425,10**13),F(149379518556429,10**13),
     F(13630718814055172,10**14),F(13630718814055178,10**14),
     F(1363071881405515,10**13),F(1363071881405528,10**13),"<137"),
  ("DRESSED",(F(3),F(7,2),F(11,2),F(-5,2)),
     F(224069277834638,10**13),F(224069277834644,10**13),
     F(13709967109971648,10**14),F(13709967109971656,10**14),
     F(1370996710997162,10**13),F(1370996710997180,10**13),">137"),
]:
    clo,chi=combo(coeffs)
    print(f"=== {nm} ===")
    print(f"  exact combo [{float(clo):.14f},{float(chi):.14f}]  width {float(chi-clo):.2e}")
    print(f"  CLO<=combo_min? {CLO<=clo}   combo_max<=CHI? {chi<=CHI}   (CLO={float(CLO):.13f} CHI={float(CHI):.13f})")
    # cores: klo*CLO >= ELO-base ; khi*CHI <= EHI-base
    print(f"  core_lo klo*CLO>=ELO-base? {klo*CLO>=ELO-base}")
    print(f"  core_hi khi*CHI<=EHI-base? {khi*CHI<=EHI-base}")
    e_lo=base+klo*clo; e_hi=base+khi*chi
    print(f"  exact endpoint [{float(e_lo):.15f},{float(e_hi):.15f}]")
    print(f"  ELO<=e_lo? {ELO<=e_lo}   e_hi<=EHI? {e_hi<=EHI}   PROD [{float(ELO):.14f},{float(EHI):.14f}] w={float(EHI-ELO):.2e}")
    import mpmath as mpm
    sig=-mpm.log10(float(EHI-ELO)/136.307)
    print(f"  ~{float(sig):.2f} sig  {'OK>=15' if sig>=15 else 'SHORT'}")
    print(f"  nested Rung3? {ELO>=r3lo and EHI<=r3hi}   {cmp}? {(EHI<137) if cmp=='<137' else (ELO>137)}")
    print(f"  strict two-sided? {ELO<EHI}")
    print()
