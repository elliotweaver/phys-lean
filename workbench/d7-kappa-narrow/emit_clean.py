from fractions import Fraction as F
from mpmath import mp, mpf, floor as mfloor, ceil as mceil, log10
mp.dps=100
def to_mpf(fr): return mpf(fr.numerator)/mpf(fr.denominator)
inv_lo=F(5000000000000,15707963267949); inv_hi=F(50000000000000,157079632679489)
klo,khi=inv_lo/3,inv_hi/3
Lm01=(F(815406111272599,10**14),F(815406111272603,10**14))
Lb0 =(F(173372879495463,10**14),F(173372879495464,10**14))
Lb2 =(F(-108872372522363,10**14),F(-108872372522362,10**14))
Lmb =(F(-408930664000672,10**14),F(-408930664000670,10**14))
base=F(2425,18)
def combo(coeffs):
    lo=hi=F(0)
    for c,(a,b) in zip(coeffs,[Lm01,Lmb,Lb0,Lb2]):
        if c>0: lo+=c*a; hi+=c*b
        else:   lo+=c*b; hi+=c*a
    return lo,hi
# Use inner bracket at 1e13, endpoint bracket at 1e14, ALL numerals over the SAME denom for cleanliness
for nm,coeffs in [("BARE",(F(2),F(7,3),F(11,3),F(-5,3))),("DRESSED",(F(3),F(7,2),F(11,2),F(-5,2)))]:
    clo,chi=combo(coeffs)
    CG=10**13
    CLO=F(int(mfloor(to_mpf(clo)*CG)),CG); CHI=F(int(mceil(to_mpf(chi)*CG)),CG)
    NUM=10**14
    lo_val=base+klo*CLO; hi_val=base+khi*CHI
    ELOn=int(mfloor(to_mpf(lo_val)*NUM)); EHIn=int(mceil(to_mpf(hi_val)*NUM))
    ELO=F(ELOn,NUM); EHI=F(EHIn,NUM)
    # normalize CLO/CHI numerators over 1e13
    print(f"### {nm} ###")
    print(f"  hcombo_lo CLO = {int(CLO*CG)}/10000000000000")
    print(f"  hcombo_hi CHI = {int(CHI*CG)}/10000000000000")
    print(f"  ENDPOINT lo = {ELOn}/100000000000000")
    print(f"  ENDPOINT hi = {EHIn}/100000000000000")
    print(f"  core_lo klo*CLO>=ELO-base? {klo*CLO>=ELO-base}")
    print(f"  core_hi khi*CHI<=EHI-base? {khi*CHI<=EHI-base}")
    print(f"  CLO<=combo_min? {CLO<=clo}  combo_max<=CHI? {chi<=CHI}")
    w=EHI-ELO; sig=-log10(float(w)/136.307)
    print(f"  [{float(ELO):.14f},{float(EHI):.14f}] w={float(w):.2e} ~{float(sig):.2f} sig")
    if nm=="BARE":
        print(f"  nested? {ELO>=F(1363071881405515,10**13) and EHI<=F(1363071881405528,10**13)}  <137? {EHI<137}")
    else:
        print(f"  nested? {ELO>=F(1370996710997162,10**13) and EHI<=F(1370996710997180,10**13)}  >137? {ELO>137}")
    print()
