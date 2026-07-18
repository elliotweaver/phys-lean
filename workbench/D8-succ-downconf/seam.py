import mpmath as mp
mp.mp.dps=50
pi=mp.pi
kappa=1/(3*pi)

# banked constants
q=mp.cos(pi/4)
mbRatio=(1-q)**2/(3*(1+q))
confBundle=mp.e**(-8*pi/3)
pB=mp.cos(mp.mpf(2)/9); wB=mp.sqrt(2); rB=mp.sqrt(3-3*pB*pB)
b0=1+wB*pB; b2=1-wB*(pB-rB)/2
mass0=b0**2; mass2=b2**2
downConfBundle=mbRatio/confBundle
rb=mbRatio*(mass0/mass2); rc=1/mbRatio; rl=downConfBundle*mass2

# banked D7 numeral pieces
num_mid = mp.mpf('67.947588026181328791025888070443788598521351133226')
S_band = num_mid - 42     # totalScreening(completeBandList) = charge-census screening
S_fz = kappa*(mp.mpf(11)/3)*mp.log(rb) + kappa*(mp.mpf(10)/3)*mp.log(rc) + kappa*2*mp.log(rl)

print("=== the recombination-layer seam, sharpened ===")
print("measured 1/alpha(0) ~ 137.035999084 (orientation only)")
print()
# bare recombined: 112 + S_band
print("112 + S_band              =", 112 + S_band, "   (diff from measured:", 112+S_band-mp.mpf('137.035999084'),")")
print("112 + S_band + S_fz       =", 112 + S_band + S_fz)
print()
# Is the +S_fz the missing piece to close 112+S_band to measured? No -- 112+S_band already ~137.95, +S_fz makes it worse
# The bare recombined OVERSHOOTS by ~0.91 already, and S_fz adds ~1.63 more.
# The dominant MISSING summand would need to be NEGATIVE ~ -0.91 - 1.63 = -2.54 (if freeze-out is included)
#                                      or          ~ -0.91          (if freeze-out excluded)
print("If composed = 112 + S_band + S_fz + X = measured:")
print("   X =", mp.mpf('137.035999084') - (112 + S_band + S_fz))
print("If composed = 112 + S_band + X = measured (freeze-out NOT part of this object):")
print("   X =", mp.mpf('137.035999084') - (112 + S_band))
print()
# The dressing layer: dressed = 112 + (16/3-1/8)/(16/3) * S_band /(1-1/3)
w=mp.mpf(1)/3; s=mp.mpf(1)/8
tsw = S_band/(mp.mpf(16)/3)
dressed = 112 + ((mp.mpf(16)/3 - s)*tsw)/(1-w)
print("dressed D2c/D2d           =", dressed)
print("dressing inflation factor (dressed-112)/(S_band) =", (dressed-112)/S_band)
print("   = (16/3-1/8)/(16/3)/(1-1/3) =", (mp.mpf(16)/3-s)/(mp.mpf(16)/3)/(1-w))
