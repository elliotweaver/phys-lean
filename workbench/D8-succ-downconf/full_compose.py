import mpmath as mp
mp.mp.dps=50
pi=mp.pi

# ---- banked derived constants ----
q=mp.cos(pi/4)
mbRatio=(1-q)**2/(3*(1+q))          # (Md/Mu)^2
confBundle=mp.e**(-8*pi/3)          # Lambda/v
kappa=1/(3*pi)                      # kappaLeading

# N340 mass shape
pB=mp.cos(mp.mpf(2)/9); wB=mp.sqrt(2); rB=mp.sqrt(3-3*pB*pB)
b0=1+wB*pB; b2=1-wB*(pB-rB)/2
mass0=b0**2; mass2=b2**2

# pinned edges
downConfBundle=mbRatio/confBundle
rb=mbRatio*(mass0/mass2)
rc=1/mbRatio
rl=downConfBundle*mass2

# ---- the freeze-out summand (D8 track) ----
S_fz = kappa*(mp.mpf(11)/3)*mp.log(rb) + kappa*(mp.mpf(10)/3)*mp.log(rc) + kappa*2*mp.log(rl)
print("freeze-out summand S_fz          =", S_fz)

# dissolved closed form: 16/9 + kappa*[(7/3)Lmb + (11/3)Lb0 - (5/3)Lb2]
Lmb=mp.log(mbRatio); Lb0=mp.log(mass0); Lb2=mp.log(mass2)
S_fz_diss = mp.mpf(16)/9 + kappa*((mp.mpf(7)/3)*Lmb + (mp.mpf(11)/3)*Lb0 - (mp.mpf(5)/3)*Lb2)
print("freeze-out summand dissolved     =", S_fz_diss, " match:", mp.almosteq(S_fz,S_fz_diss,rel_eps=mp.mpf(10)**-40))
print()

# ---- the D7 numeral: invAlphaZero(completeBandList chargeTraceDepth) = 42 + totalScreening ----
num_lo = mp.mpf(12007329939722)/176714586765
num_hi = mp.mpf(32019546505738)/471238898037
print("D7 numeral invAlphaZero(completeBandList) bracket:")
print("   lo =", num_lo)
print("   hi =", num_hi)
print("   width =", num_hi-num_lo)
S_bare = (num_lo+num_hi)/2 - 42
print("   => totalScreening S ~", S_bare)
print()

# ---- track (a): the D8 composed = numeral + freeze-out ----
comp_a_lo = num_lo + S_fz
comp_a_hi = num_hi + S_fz
print("TRACK (a) D8 composed = invAlphaZero(completeFreezeoutList) = numeral + S_fz:")
print("   lo =", comp_a_lo, "  hi =", comp_a_hi)
print()

# ---- track (b): the D2c/D2d dressed = dressedInvAlphaEMJoin(w=1/3, s=1/8, j=1, completeBandList) ----
# = 112 + ((16/3 - 1/8)*totalScreeningWith 1)/(1-1/3) + joinContent(=0)
# totalScreeningWith 1 (completeBandList) = totalScreening / chargeTraceDepth = S/(16/3)
w=mp.mpf(1)/3; s=mp.mpf(1)/8
tsw_lo = (num_lo-42)/(mp.mpf(16)/3)
tsw_hi = (num_hi-42)/(mp.mpf(16)/3)
dressed_lo = 112 + ((mp.mpf(16)/3 - s)*tsw_lo)/(1-w)
dressed_hi = 112 + ((mp.mpf(16)/3 - s)*tsw_hi)/(1-w)
print("TRACK (b) dressedInvAlphaEMJoin(1/3,1/8,1,completeBandList):")
print("   lo =", dressed_lo, "  hi =", dressed_hi)
print()

# ---- Is the FULL composed = dressed + freeze-out summand? ----
full_lo = dressed_lo + S_fz
full_hi = dressed_hi + S_fz
print("dressed + freeze-out:")
print("   lo =", full_lo, "  hi =", full_hi)
print()
print("measured 1/alpha(0) ~ 137.035999 (orientation only)")
