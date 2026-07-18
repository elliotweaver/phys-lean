import mpmath as mp
mp.mp.dps=50
pi=mp.pi
q=mp.cos(pi/4)
mbRatio=(1-q)**2/(3*(1+q))          # (Md/Mu)^2
confBundle=mp.e**(-8*pi/3)          # Lambda/v
kappa=1/(3*pi)                      # kappaLeading
# N340 mass shape
pB=mp.cos(mp.mpf(2)/9); wB=mp.sqrt(2); rB=mp.sqrt(3-3*pB*pB)
b0=1+wB*pB; b2=1-wB*(pB-rB)/2
mass0=b0**2; mass2=b2**2
downConfBundle=mbRatio/confBundle
rb=mbRatio*(mass0/mass2)
rc=1/mbRatio
rl=downConfBundle*mass2
print("EDGES:")
print("  mbRatio    =", mbRatio, " (<1 ->", mbRatio<1, ")")
print("  confBundle =", confBundle)
print("  mass0      =", mass0, "  mass2 =", mass2)
print("  rb =", rb, "  cutLog rb =", mp.log(rb))
print("  rc =", rc, "  cutLog rc =", mp.log(rc))
print("  rl =", rl, "  cutLog rl =", mp.log(rl))
print()
# freeze-out per-band screening: kappa*census*cutLog(edge)
fb = kappa*(mp.mpf(11)/3)*mp.log(rb)
fc = kappa*(mp.mpf(10)/3)*mp.log(rc)
fl = kappa*2*mp.log(rl)
print("FREEZE-OUT per band (kappa*census*log):")
print("  bottom (11/3):", fb)
print("  charm  (10/3):", fc)
print("  light  (2)   :", fl)
print("  SUM S_fz     :", fb+fc+fl)
print()
# the composition pieces
num_lo = mp.mpf(12007329939722)/176714586765
num_hi = mp.mpf(32019546505738)/471238898037
invAlphaZero = (num_lo+num_hi)/2
invAlphaEM = invAlphaZero + 70
ts = invAlphaZero - 42                        # totalScreening
T = ts/(mp.mpf(16)/3)                          # totalScreeningWith 1
s = mp.mpf(1)/8
anti = s*T
print("PIECES:")
print("  invAlphaZero(completeBandList) =", invAlphaZero)
print("  invAlphaEM (=+70)              =", invAlphaEM)
print("  totalScreeningWith 1 (T)       =", T)
print("  anti-screening s*T (s=1/8)     =", anti)
print("  freeze-out S_fz                =", fb+fc+fl)
print()
print("COMPOSITIONS:")
print("  bare recombined invAlphaEM               =", invAlphaEM)
print("  invAlphaEM - anti                        =", invAlphaEM - anti)
print("  invAlphaEM - anti + freezeout (LEADING)  =", invAlphaEM - anti + (fb+fc+fl))
print("  invAlphaEM - anti - freezeout            =", invAlphaEM - anti - (fb+fc+fl))
print()
print("  measured 1/alpha(0) ~ 137.035999206 (orientation only)")
print("  gaps to measured:")
m=mp.mpf('137.035999206')
print("    bare               :", invAlphaEM - m)
print("    -anti              :", invAlphaEM - anti - m)
print("    -anti+fz (leading) :", invAlphaEM - anti + (fb+fc+fl) - m)
print("    -anti-fz           :", invAlphaEM - anti - (fb+fc+fl) - m)
