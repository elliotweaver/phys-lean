"""
Decide the grid: does ext8 (1e13) suffice for BOTH endpoints, or is the dressed kappa-floored?
And would ext9 (1e14) land both >=15?  Compute 1e14 grid constants too.
"""
from fractions import Fraction as F
from mpmath import mp, mpf, pi, cos, log, sqrt
mp.dps = 90
def to_mpf(fr): return mpf(fr.numerator)/mpf(fr.denominator)

# reconstructed edge logs / L_m01 (from lock_ext8)
Lm01 = (F(815406111272599,10**14), F(815406111272603,10**14))
Lb0  = (F(173372879495463,10**14), F(21671609936933,12500000000000))
Lb2  = (F(-108872372522363,10**14), F(-54436186261181,50000000000000))
Lmb  = (F(-12779083250021,3125000000000), F(-408930664000671,10**14))
base = F(2425,18)

def combo(coeffs):
    lo=hi=F(0)
    for c,(a,b) in zip(coeffs,[Lm01,Lmb,Lb0,Lb2]):
        if c>0: lo+=c*a; hi+=c*b
        else:   lo+=c*b; hi+=c*a
    return lo,hi

def endpoint(inv_lo, inv_hi, coeffs, val):
    klo,khi = inv_lo/3, inv_hi/3
    clo,chi = combo(coeffs)
    elo = base+klo*clo; ehi = base+khi*chi
    w = ehi-elo
    sig = -mp.log10(float(w)/val)
    return elo,ehi,w,sig

# grids
grids = {}
for gp in [13,14]:
    g=mpf(10)**gp
    fl=int(mp.floor(pi/2*g)); ce=fl+1
    inv_lo=F(1,1)/(F(2*ce,10**gp)); inv_hi=F(1,1)/(F(2*fl,10**gp))
    grids[gp]=(fl,ce,inv_lo,inv_hi)
    print(f"grid 1e{gp}: floor={fl} ceil={ce}  floor%4={fl%4}")
    print(f"   1/cutPi in [{inv_lo}, {inv_hi}] width {float(inv_hi-inv_lo):.3e}")
print()

for gp in [13,14]:
    fl,ce,inv_lo,inv_hi = grids[gp]
    print(f"=== kappa grid 1e{gp} + edge logs 1e14 ===")
    for nm,coeffs,val in [("BARE",(F(2),F(7,3),F(11,3),F(-5,3)),136.307),
                          ("DRESSED",(F(3),F(7,2),F(11,2),F(-5,2)),137.0997)]:
        elo,ehi,w,sig = endpoint(inv_lo,inv_hi,coeffs,val)
        print(f"  {nm}: [{float(elo):.15f}, {float(ehi):.15f}] w={float(w):.3e} ~{float(sig):.2f} sig  {'OK' if sig>=15 else 'SHORT'}")
    print()

# 1e14 grid: the near-pi/8 quarter arg + split index check
print("=== 1e14 grid instrument design ===")
g14=mpf(10)**14
fl14=int(mp.floor(pi/2*g14)); ce14=fl14+1
print("floor14=",fl14," div4?",fl14%4==0, " ceil14=",ce14)
yLmax14 = F(fl14//4 if fl14%4==0 else fl14, 4*10**14 if fl14%4 else 10**14)
if fl14%4==0:
    yLmax14 = F(fl14//4, 10**14)
print("yLmax14 =", yLmax14, "=", mp.nstr(to_mpf(yLmax14),18), " pi/8=",mp.nstr(pi/8,18))
print("  yLmax14 - (785398163397/2e12) =", mp.nstr(to_mpf(yLmax14)-to_mpf(F(785398163397,2*10**12)),4))
cospi8=cos(pi/8)
# choose C just above cos(pi/8), check < cos(yLmax14)
cyL = cos(to_mpf(yLmax14))
print("  cos(yLmax14)=",mp.nstr(cyL,20)," cos(pi/8)=",mp.nstr(cospi8,20)," window=",mp.nstr(cyL-cospi8,4))
# upper yU
yU14 = F(ce14, 4*10**14)
print("yU14=",yU14,"=",mp.nstr(to_mpf(yU14),18))
cyU=cos(to_mpf(yU14))
print("  cos(yU14)=",mp.nstr(cyU,20)," window(cospi8-cyU)=",mp.nstr(cospi8-cyU,4))
