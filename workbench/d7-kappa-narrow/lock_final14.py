"""
FINAL LOCK for D7 Narrowing Rung 4 = the 1e14-grid kappa + deepened edge logs (grid 1e14) + s7 L_m01.
Produces every production constant the Lean module asserts, validates in exact ℚ, and picks the
outward-rounded production endpoint brackets that both cross 15 sig digits and nest inside Rung3.
"""
from fractions import Fraction as F
from mpmath import mp, mpf, pi, cos, log, exp, sqrt, factorial as mfact
from math import factorial
mp.dps = 100
def to_mpf(fr): return mpf(fr.numerator)/mpf(fr.denominator)
def partialExp(a, N):
    a=mpf(a); return sum(a**i/mfact(i) for i in range(N))
def expRemBound(a, N):
    a=mpf(a); return (a**N/mfact(N))/(1-a/(N+1))

# ---------- (A) 1e14 kappa ----------
inv_lo = F(5000000000000,15707963267949)
inv_hi = F(50000000000000,157079632679489)
klo, khi = inv_lo/3, inv_hi/3
print("=== (A) kappa 1e14 ===")
print("1/cutPi in [%s, %s] width %.3e" % (inv_lo, inv_hi, float(inv_hi-inv_lo)))
print("nested ext7?", inv_lo>=F(100000000000,314159265359), inv_hi<=F(250000000000,785398163397))
print()

# ---------- (B) s7 source brackets ----------
b0_lo=F(2379438171633255409,10**18); b0_hi=F(2379438171633255413,10**18)
mass0_lo=b0_lo*b0_lo; mass0_hi=b0_hi*b0_hi
wp_lo=F(1379438171633255409,10**18); wp_hi=F(1379438171633255413,10**18)
wr_lo=F(539862011928329837,10**18);  wr_hi=F(134965502982082463,250*10**15)
b2_lo=1-(wp_hi-wr_lo)/2; b2_hi=1-(wp_lo-wr_hi)/2
mass2_lo=b2_lo*b2_lo; mass2_hi=b2_hi*b2_hi
q_true=1/sqrt(mpf(2)); qg=10**18; q_flo=int(mp.floor(q_true*qg))
q_lo=F(q_flo,qg); q_hi=F(q_flo+1,qg)
mb_lo=(1-q_hi)**2/(3*(1+q_hi)); mb_hi=(1-q_lo)**2/(3*(1+q_lo))
print("=== (B) s7 sources ===")
print("mass0 in [%.18f,%.18f]" % (float(mass0_lo),float(mass0_hi)))
print("mass2 in [%.18f,%.18f]" % (float(mass2_lo),float(mass2_hi)))
print("mbRatio in [%.20f,%.20f]" % (float(mb_lo),float(mb_hi)))
print("  q_lo^2<=1/2<=q_hi^2?", q_lo*q_lo<=F(1,2), F(1,2)<=q_hi*q_hi)
print()

# ---------- (C) deepened edge logs at grid 1e14 ----------
G=10**14
def logbr(src_lo, src_hi, name, idxlo, idxhi):
    a_lo=F(int(mp.floor(log(to_mpf(src_lo))*G)),G)
    a_hi=F(int(mp.ceil (log(to_mpf(src_hi))*G)),G)
    cert_lo = partialExp(to_mpf(a_lo),idxlo)+expRemBound(to_mpf(a_lo),idxlo) <= to_mpf(src_lo)
    cert_hi = to_mpf(src_hi) <= partialExp(to_mpf(a_hi),idxhi)
    print(f"  {name}: [{a_lo}, {a_hi}] w={float(a_hi-a_lo):.2e}  cert_lo(idx{idxlo}):{cert_lo}  cert_hi(idx{idxhi}):{cert_hi}")
    return a_lo,a_hi,cert_lo,cert_hi
print("=== (C) edge logs grid 1e14 ===")
Lb0_lo,Lb0_hi,c1,c2 = logbr(mass0_lo,mass0_hi,"L_b0",20,21)
inv_m2_lo=F(1,1)/mass2_hi; inv_m2_hi=F(1,1)/mass2_lo
Lb2i_lo,Lb2i_hi,c3,c4 = logbr(inv_m2_lo,inv_m2_hi,"L_b2^-1",16,17)
Lb2_lo,Lb2_hi=-Lb2i_hi,-Lb2i_lo
inv_mb_lo=F(1,1)/mb_hi; inv_mb_hi=F(1,1)/mb_lo
Lmbi_lo,Lmbi_hi,c5,c6 = logbr(inv_mb_lo,inv_mb_hi,"L_mb^-1",28,29)
Lmb_lo,Lmb_hi=-Lmbi_hi,-Lmbi_lo
print(f"  => L_b2 in [{Lb2_lo}, {Lb2_hi}]")
print(f"  => L_mb in [{Lmb_lo}, {Lmb_hi}]")
print("  ALL cert ok?", all([c1,c2,c3,c4,c5,c6]))
Lm01_lo=F(815406111272599,10**14); Lm01_hi=F(815406111272603,10**14)
print()

# ---------- (D) assemble, pick production brackets ----------
base=F(2425,18)
def combo(cL,cLmb,cLb0,cLb2):
    lo=hi=F(0)
    for c,(a,b) in [(cL,(Lm01_lo,Lm01_hi)),(cLmb,(Lmb_lo,Lmb_hi)),(cLb0,(Lb0_lo,Lb0_hi)),(cLb2,(Lb2_lo,Lb2_hi))]:
        if c>0: lo+=c*a; hi+=c*b
        else:   lo+=c*b; hi+=c*a
    return lo,hi
print("=== (D) assembled endpoints + PRODUCTION brackets (grid 1e13 for numerals) ===")
NUM=10**14   # production bracket denominator (14 places, preserves the tight exact widths)
for nm,coeffs,inner_target in [("BARE",(F(2),F(7,3),F(11,3),F(-5,3)),None),
                               ("DRESSED",(F(3),F(7,2),F(11,2),F(-5,2)),None)]:
    clo,chi=combo(*coeffs)
    e_lo=base+klo*clo; e_hi=base+khi*chi
    # production endpoint bracket: floor(e_lo*NUM)/NUM, ceil(e_hi*NUM)/NUM
    E_LO=F(int(mp.floor(to_mpf(e_lo)*NUM)),NUM)
    E_HI=F(int(mp.ceil (to_mpf(e_hi)*NUM)),NUM)
    # production inner bracket: floor(clo*NUM)/NUM, ceil(chi*NUM)/NUM
    C_LO=F(int(mp.floor(to_mpf(clo)*NUM)),NUM)
    C_HI=F(int(mp.ceil (to_mpf(chi)*NUM)),NUM)
    w=E_HI-E_LO
    sig=-mp.log10(float(w)/136.307)
    print(f"{nm}:")
    print(f"  inner exact [{float(clo):.14f}, {float(chi):.14f}]  PROD [{C_LO}, {C_HI}] = [{float(C_LO):.13f},{float(C_HI):.13f}]")
    print(f"  endpoint exact [{float(e_lo):.15f}, {float(e_hi):.15f}]")
    print(f"  PROD endpoint [{E_LO}, {E_HI}] = [{float(E_LO):.13f}, {float(E_HI):.13f}] w={float(w):.3e} ~{float(sig):.2f} sig {'OK' if sig>=15 else 'SHORT'}")
    # core check: klo*C_LO >= E_LO - base  AND  khi*C_HI <= E_HI - base
    print(f"  core_lo klo*C_LO>=E_LO-base? {klo*C_LO >= E_LO-base}   core_hi khi*C_HI<=E_HI-base? {khi*C_HI <= E_HI-base}")
    # combo containment: C_LO<=clo, chi<=C_HI
    print(f"  C_LO<=combo_min? {C_LO<=clo}   combo_max<=C_HI? {chi<=C_HI}")
    # nested in Rung3
    if nm=="BARE":
        r3lo,r3hi=F(1363071881405515,10**13),F(1363071881405528,10**13)
        print(f"  nested Rung3? {E_LO>=r3lo and E_HI<=r3hi}  <137? {E_HI<137}")
    else:
        r3lo,r3hi=F(1370996710997162,10**13),F(1370996710997180,10**13)
        print(f"  nested Rung3? {E_LO>=r3lo and E_HI<=r3hi}  >137? {E_LO>137}")
    print()
