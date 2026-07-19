"""Emit the exact Lean production constants for Rung4 (1e14 grid)."""
from fractions import Fraction as F
from mpmath import mp, mpf, floor, ceil
mp.dps=100
def to_mpf(fr): return mpf(fr.numerator)/mpf(fr.denominator)

inv_lo=F(5000000000000,15707963267949); inv_hi=F(50000000000000,157079632679489)
klo,khi=inv_lo/3,inv_hi/3
Lm01=(F(815406111272599,10**14),F(815406111272603,10**14))
Lb0 =(F(173372879495463,10**14),F(21671609936933,12500000000000))
Lb2 =(F(-108872372522363,10**14),F(-54436186261181,50000000000000))
Lmb =(F(-12779083250021,3125000000000),F(-408930664000671,10**14))
base=F(2425,18)

def combo(coeffs):
    lo=hi=F(0)
    for c,(a,b) in zip(coeffs,[Lm01,Lmb,Lb0,Lb2]):
        if c>0: lo+=c*a; hi+=c*b
        else:   lo+=c*b; hi+=c*a
    return lo,hi

NUM=10**14
D14=10**14
print("### edge log windows (as written in Lean, /1e14 form) ###")
print("Lm01: 815406111272599/100000000000000 .. 815406111272603/100000000000000")
print("Lb0 : 17337287949546300/1e16? -> use", Lb0[0].numerator,"/",Lb0[0].denominator, "..", Lb0[1].numerator,"/",Lb0[1].denominator)
print("Lb2 :", Lb2[0].numerator,"/",Lb2[0].denominator,"..",Lb2[1].numerator,"/",Lb2[1].denominator)
print("Lmb :", Lmb[0].numerator,"/",Lmb[0].denominator,"..",Lmb[1].numerator,"/",Lmb[1].denominator)
print()
# rewrite edge logs to common 1e14 denom for clean Lean literals
def as1e14(fr):
    # fr = n/d ; want m/1e14 with same value: m = n*1e14/d must be integer
    m = fr * 10**14
    assert m.denominator==1, (fr, m)
    return int(m)
print("### edge logs as m/1e14 integer numerators ###")
print("Lb0 :", as1e14(Lb0[0]), "..", as1e14(Lb0[1]))
print("Lb2 :", as1e14(Lb2[0]), "..", as1e14(Lb2[1]))
print("Lmb :", as1e14(Lmb[0]), "..", as1e14(Lmb[1]))
print("Lm01:", as1e14(Lm01[0]), "..", as1e14(Lm01[1]))
print()

for nm,coeffs in [("BARE",(F(2),F(7,3),F(11,3),F(-5,3))),("DRESSED",(F(3),F(7,2),F(11,2),F(-5,2)))]:
    clo,chi=combo(coeffs)
    # inner combination bracket: choose rational bounds at 1e13 grid enclosing exact combo
    CG=10**13
    C_LO=F(int(floor(to_mpf(clo)*CG)),CG)
    C_HI=F(int(ceil (to_mpf(chi)*CG)),CG)
    e_lo=base+klo*C_LO; e_hi=base+khi*C_HI
    E_LO=F(int(floor(to_mpf(e_lo)*NUM)),NUM)
    E_HI=F(int(ceil (to_mpf(e_hi)*NUM)),NUM)
    w=E_HI-E_LO
    sig=-mp.log10(float(w)/136.307)
    print(f"### {nm} ###")
    print(f"  hcombo bracket (1e13): [{C_LO.numerator}/{C_LO.denominator}, {C_HI.numerator}/{C_HI.denominator}]")
    print(f"     C_LO<=combo_min? {C_LO<=clo}  combo_max<=C_HI? {chi<=C_HI}")
    print(f"  ENDPOINT bracket (1e14): [{E_LO.numerator}/{E_LO.denominator}, {E_HI.numerator}/{E_HI.denominator}]")
    print(f"     = [{float(E_LO):.14f}, {float(E_HI):.14f}] w={float(w):.2e} ~{float(sig):.2f} sig")
    print(f"     core_lo klo*C_LO>=E_LO-base? {klo*C_LO>=E_LO-base}")
    print(f"     core_hi khi*C_HI<=E_HI-base? {khi*C_HI<=E_HI-base}")
    if nm=="BARE":
        print(f"     nested Rung3 [1363071881405515/1e13,1363071881405528/1e13]? {E_LO>=F(1363071881405515,10**13) and E_HI<=F(1363071881405528,10**13)}")
        print(f"     <137? {E_HI<137}")
    else:
        print(f"     nested Rung3 [1370996710997162/1e13,1370996710997180/1e13]? {E_LO>=F(1370996710997162,10**13) and E_HI<=F(1370996710997180,10**13)}")
        print(f"     >137? {E_LO>137}")
    print()
# cutPi 1e14 bracket
print("### cutPi 1e14 ###")
print("cutPi in [157079632679489/50000000000000, 15707963267949/5000000000000]")
print("1/cutPi in [5000000000000/15707963267949, 50000000000000/157079632679489]")
print("leastCosZero in [157079632679489/1e14, 157079632679490/1e14] i.e. floor=157079632679489 ceil=157079632679490")
