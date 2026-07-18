import mpmath as mp
mp.mp.dps=40
pi=mp.pi
# banked objects
q=mp.cos(pi/4)                      # cutCos(pi/4)=1/sqrt2
mbRatio=(1-q)**2/(3*(1+q))         # up/down leg (Md/Mu)^2
confBundle=mp.e**(-8*pi/3)         # Lambda/v
kappa=1/(3*pi)                     # kappaLeading = 1/(3 cutPi)

# N340 mass shape
pB=mp.cos(mp.mpf(2)/9)
wB=mp.sqrt(2)
rB=mp.sqrt(3-3*pB*pB)
b0=1+wB*pB
b2=1-wB*(pB-rB)/2
mass0=b0**2
mass2=b2**2

# edges (pinned)
downConfBundle=mbRatio/confBundle
edgeBottom=mbRatio*(mass0/mass2)
edgeCharm=1/mbRatio
edgeLight=downConfBundle*mass2

# direct freeze-out summand
S_direct = kappa*(mp.mpf(11)/3)*mp.log(edgeBottom) + kappa*(mp.mpf(10)/3)*mp.log(edgeCharm) + kappa*2*mp.log(edgeLight)

# dissolved closed form.
# cutLog(edgeBottom)  = L_mb + L_b0 - L_b2
# cutLog(edgeCharm)   = -L_mb
# cutLog(edgeLight)   = L_mb + (8pi/3) + L_b2     [since log(downConfBundle)=L_mb - log(confBundle)=L_mb+8pi/3]
# S = k*(11/3)(L_mb+L_b0-L_b2) + k*(10/3)(-L_mb) + k*2*(L_mb+8pi/3+L_b2)
#   = k*[ (11/3-10/3+2)L_mb + (11/3)L_b0 + (-11/3+2)L_b2 + 2*8pi/3 ]
#   = k*[ (7/3)L_mb + (11/3)L_b0 - (5/3)L_b2 + 16pi/3 ]
L_mb=mp.log(mbRatio); L_b0=mp.log(mass0); L_b2=mp.log(mass2)
S_diss = kappa*((mp.mpf(7)/3)*L_mb + (mp.mpf(11)/3)*L_b0 - (mp.mpf(5)/3)*L_b2 + 16*pi/3)
rational_piece = kappa*16*pi/3

print("mbRatio (Md/Mu)^2     =", mbRatio)
print("confBundle Lambda/v   =", confBundle)
print("downConfBundle (Md/Ml)^2 =", downConfBundle)
print("mass0 =", mass0, " mass2 =", mass2)
print("edgeBottom rb =", edgeBottom)
print("edgeCharm  rc =", edgeCharm)
print("edgeLight  rl =", edgeLight)
print()
print("S_direct  =", S_direct)
print("S_diss    =", S_diss)
print("match?    =", mp.almosteq(S_direct,S_diss, rel_eps=mp.mpf(10)**-30))
print("kappa*16pi/3 (should be 16/9) =", rational_piece, " 16/9=", mp.mpf(16)/9)
print()
print("coeff L_mb = 7/(9pi) =", kappa*mp.mpf(7)/3)
print("coeff L_b0 = 11/(9pi)=", kappa*mp.mpf(11)/3)
print("coeff L_b2 = -5/(9pi)=", -kappa*mp.mpf(5)/3)
print()
num_lo = mp.mpf(12007329939722)/176714586765
num_hi = mp.mpf(32019546505738)/471238898037
print("D7 numeral bracket lo =", num_lo, " hi =", num_hi)
print("full composed (a) = numeral + S =", num_lo + S_direct, " to ", num_hi + S_direct)
print()
# Is edgeBottom, edgeCharm, edgeLight actually all > 1 (the freeze-out screening constraint)?
print("rb>1?", edgeBottom>1, " rc>1?", edgeCharm>1, " rl>1?", edgeLight>1)
print("rb =", edgeBottom, " rc =", edgeCharm, " rl =", edgeLight)
