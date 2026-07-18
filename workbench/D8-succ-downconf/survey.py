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
# mass1
b1=1-wB*(pB+rB)/2; mass1=b1**2

downConfBundle=mbRatio/confBundle
rb=mbRatio*(mass0/mass2)
rc=1/mbRatio
rl=downConfBundle*mass2

# --- the banked D7 numeral: invAlphaZero(completeBandList chargeTraceDepth)=42 + totalScreening(completeBandList) ---
num_mid = mp.mpf('67.947588026181328791025888070443788598521351133226')  # ~ from bracket
S_completeBandList = num_mid - 42   # totalScreening over the high+lepton bands (charge census)
print("totalScreening(completeBandList) =", S_completeBandList)

# freeze-out summand (charge-census-weighted? no -- the freeze-out bands carry plateau censuses 11/3,10/3,2)
S_fz = kappa*(mp.mpf(11)/3)*mp.log(rb) + kappa*(mp.mpf(10)/3)*mp.log(rc) + kappa*2*mp.log(rl)
print("S_fz (freeze-out summand, plateau censuses) =", S_fz)
print()

# ===== candidate composed objects =====
print("=== CANDIDATES vs measured 137.035999084 ===")

# (a) single-channel bare tower invAlphaZero(completeFreezeoutList) = 42 + S_completeBandList + S_fz
a = 42 + S_completeBandList + S_fz
print("(a) invAlphaZero(completeFreezeoutList) = 42+S_band+S_fz     =", a)

# (b) recombined charge tower invAlphaEM = 112 + totalScreeningWith chargeTraceDepth (bands)
#     over completeBandList: 112 + S_completeBandList (since census already charge)
b = 112 + S_completeBandList
print("(b) invAlphaEM(completeBandList) = 112 + S_band              =", b)

# (b') recombined + freeze-out: 112 + S_band + S_fz
bp = 112 + S_completeBandList + S_fz
print("(b') 112 + S_band + S_fz                                     =", bp)

# (c) dressed D2c/D2d over completeBandList: 112 + (16/3 - 1/8)*totalScreeningWith 1 /(1-1/3)
w=mp.mpf(1)/3; s=mp.mpf(1)/8
tsw = S_completeBandList/(mp.mpf(16)/3)   # totalScreeningWith 1 = S_band/chargeTraceDepth
c = 112 + ((mp.mpf(16)/3 - s)*tsw)/(1-w)
print("(c) dressedInvAlphaEMJoin(1/3,1/8,1,completeBandList)        =", c)

# (c') dressed + freeze-out summand
cp = c + S_fz
print("(c') dressed + S_fz                                         =", cp)

# (d) single-channel dressed: 42 + (16/3 - 1/8)*tsw/(1-1/3) ... isospin only
d = 42 + ((mp.mpf(16)/3 - s)*tsw)/(1-w)
print("(d) 42 + dressed iso screening                              =", d)
dp = d + S_fz
print("(d') d + S_fz                                               =", dp)
print()
print("measured 1/alpha(0) = 137.035999084 (orientation only)")
