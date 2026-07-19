from fractions import Fraction as F
import mpmath as mp
mp.mp.dps = 50

# ============================================================
# FULL ENDPOINT RECONSTRUCTION FROM BANKED CLOSED FORMS
# ============================================================
pi = mp.pi
kappa = 1/(3*pi)

# --- shape numerals (N340) ---
q = 1/mp.sqrt(2)                      # q^2 = 1/2
p = mp.cos(mp.mpf(2)/9)               # pB = cutCos(2/9)
w = mp.sqrt(2)                        # wB = cutSqrt 2
r = mp.sqrt(3 - 3*p**2)               # rB = cutSqrt(3-3p^2)
b0 = 1 + w*p
b1 = 1 - w*(p+r)/2
b2 = 1 - w*(p-r)/2
mass0 = b0**2; mass1 = b1**2; mass2 = b2**2

# --- mbRatioDerived = (1-q)^2/(3(1+q)) ---
mbRatio = (1-q)**2 / (3*(1+q))

# --- logs ---
L_mb = mp.log(mbRatio)
L_b0 = mp.log(mass0)
L_b2 = mp.log(mass2)
L_m01 = mp.log(mass0/mass1)

# ============================================================
# freezeoutStaircaseSummand (banked)
#   = 16/9 + kappa*[(7/3)L_mb + (11/3)L_b0 - (5/3)L_b2]
# ============================================================
gem = mp.mpf(16)/9
staircase_banked = gem + kappa*(F(7,3)*L_mb + F(11,3)*L_b0 - F(5,3)*L_b2)

# leptonTailScreen = bandScreen leptonCensus(=2) (mass0/mass1) = kappa*2*L_m01
leptonTail = kappa*2*L_m01

# base
base = F(7179,54)
endpoint_bare = float(base) + leptonTail + staircase_banked

# dressed: the (3/2) dressing applies to C_inner = kappa*(3*L_m01... ) 
# Actually recomposedEndpointDressed = 2425/18 + (3/2)*kappa*C_inner
# where the full running C_inner is dressed. Let me reconstruct from D7DepthTwoComposed dressed normal form:
#   recomposedEndpointDressed = 2425/18 + kappa*(3*L_m01 + (7/2)L_mb + (11/2)L_b0 - (5/2)L_b2)
base2425 = F(2425,18)
endpoint_dressed = float(base2425) + kappa*(3*L_m01 + F(7,2)*L_mb + F(11,2)*L_b0 - F(5,2)*L_b2)

print("=== banked reconstruction ===")
print("L_mb   =", mp.nstr(L_mb, 15))
print("L_b0   =", mp.nstr(L_b0, 15))
print("L_b2   =", mp.nstr(L_b2, 15))
print("L_m01  =", mp.nstr(L_m01, 15))
print("kappa  =", mp.nstr(kappa, 15))
print()
print("gem 16/9                    =", mp.nstr(gem,15))
print("staircase_banked            =", mp.nstr(staircase_banked, 15))
print("leptonTail (kappa*2*L_m01)  =", mp.nstr(leptonTail, 15))
print("endpoint_bare (7179/54+...) =", mp.nstr(endpoint_bare, 18))
print("endpoint_dressed (2425/18)  =", mp.nstr(endpoint_dressed, 18))
print("  (banked D7DepthTwoComposed = 137.0997)")
print()

measured = mp.mpf('137.035999084')
print("measured 1/alpha(0) ~", measured)
print("dressed - measured  =", mp.nstr(endpoint_dressed - measured, 6))
print()

# ============================================================
# THE DOUBLE-COUNT AUDIT on the confinement rung 8pi/3
# ============================================================
# confBand (in 7179/54): kappa*(16/3)*ln(v/L), ln(v/L)=8pi/3  -> 128/27
# gem      (in summand):  kappa*2*(8pi/3)                     -> 16/9
# BUT the gem's 8pi/3 comes from cutLog(downConfBundle) = L_mb + 8pi/3
#   where the light edge rl = downConfBundle*bMass2, cutLog = L_mb + 8pi/3 + L_b2
# So the confinement rung 8pi/3 appears in BOTH confBand AND the light-edge log.
print("=== confinement-rung 8pi/3 double-count test ===")
confRung = 8*pi/3
print("confBand census 16/3 on 8pi/3 -> 128/27 =", mp.nstr(kappa*F(16,3)*confRung,15))
print("gem census 2 on 8pi/3         -> 16/9   =", mp.nstr(kappa*2*confRung,15))
print("total census on 8pi/3 rung: 16/3 + 2 = 22/3")
print()
print("If the light-band gem's 8pi/3 is the SAME physical rung as confBand's ln(v/L),")
print("the census on that rung is DOUBLE-COUNTED: 16/3 (confBand) + 2 (gem) = 22/3.")
print("The census-conserving descent should carry the rung ONCE.")
