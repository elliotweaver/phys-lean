from fractions import Fraction as F
import mpmath as mp
mp.mp.dps = 50

pi = mp.pi
kappa = 1/(3*pi)

# shape numerals
q = 1/mp.sqrt(2)
p = mp.cos(mp.mpf(2)/9)
w = mp.sqrt(2)
r = mp.sqrt(3 - 3*p**2)
b0 = 1 + w*p; b1 = 1 - w*(p+r)/2; b2 = 1 - w*(p-r)/2
mass0 = b0**2; mass1 = b1**2; mass2 = b2**2
mbRatio = (1-q)**2 / (3*(1+q))
L_mb = mp.log(mbRatio); L_b0 = mp.log(mass0); L_b2 = mp.log(mass2)
L_m01 = mp.log(mass0/mass1)
confRung = 8*pi/3
measured = mp.mpf('137.035999084')

# The dressed endpoint normal form (D7DepthTwoComposed):
#   E_dressed = base_rational + (3/2)*kappa*[ 2*L_m01 + Cmb*L_mb + Cb0*L_b0 - Cb2*L_b2 ]
# where the LOG coefficients come from the per-edge freeze-out weights (wb,wc,wl) plus lepton (2).
#
# freeze-out summand (undressed) = gem + kappa*[ (wb-wc+wl)*L_mb + wb*L_b0 + (-wb+wl)*L_b2 ]
#   gem = kappa*wl*(8pi/3) [pi cancels -> wl*8/9]
# lepton tail (undressed) = kappa*2*L_m01
# base_rational (undressed) = 7179/54 + gem
#
# Dressed: the LOG parts get *3/2; the rational base (7179/54) stays; gem is pi-cancelled rational
#   -> gem also stays undressed (it's rational, part of base 2425/18).
# So E_dressed = 7179/54 + gem + (3/2)*kappa*[ 2*L_m01 + (wb-wc+wl)*L_mb + wb*L_b0 + (-wb+wl)*L_b2 ]

def endpoint_dressed(wb, wc, wl, confcensus=F(16,3)):
    # confcensus screens the conf band (Λ,v) at rung 8pi/3 inside 7179/54
    # 7179/54 = 6923/54 + kappa*confcensus*(8pi/3).  Default 16/3 -> 128/27.
    base_top = F(6923,54)
    confband = kappa*confcensus*confRung
    gem = kappa*wl*confRung
    logpart = 2*L_m01 + (wb-wc+wl)*L_mb + wb*L_b0 + (-wb+wl)*L_b2
    return float(base_top) + confband + gem + (F(3,2))*kappa*logpart

# --- scenarios ---
print("measured ~", measured)
print()
banked = endpoint_dressed(F(11,3), F(10,3), F(2))
print("BANKED     (wb,wc,wl)=(11/3,10/3,2):    ", mp.nstr(banked,18), " delta=", mp.nstr(banked-measured,5))
n574 = endpoint_dressed(F(10,3), F(2), F(5,3))
print("N574       (wb,wc,wl)=(10/3,2,5/3):     ", mp.nstr(n574,18), " delta=", mp.nstr(n574-measured,5))
print()

# --- the confinement-rung double count: remove the gem's 8pi/3 double screening ---
# Under N574, confband=16/3, gem uses wl=5/3 on 8pi/3. If the 8pi/3 in the light edge is
# the SAME rung as confband, subtract wl from confcensus so the rung is screened ONCE by
# (16/3) not (16/3 + 5/3):
print("=== confinement-rung single-count tests (remove double screen of 8pi/3) ===")
# Option A: confband census reduced by wl (the light edge already screens 8pi/3 with wl)
# net rung census = 16/3, achieved by confband=16/3-5/3=11/3 + gem(wl=5/3) ... same total. no change.
# The real question: should the rung be screened by 16/3 TOTAL (confband alone) with NO gem,
# or by the staircase-active census?
n574_nogem = endpoint_dressed(F(10,3), F(2), F(5,3), confcensus=F(16,3)) - kappa*F(5,3)*confRung
print("N574 minus gem (light edge carries no 8pi/3):", mp.nstr(n574_nogem,18), " delta=", mp.nstr(n574_nogem-measured,5))
print()

# --- proper threshold staircase for the CONF band (v->Λ) replacing flat 16/3 ---
# Instead of 16/3 across all (Λ,v), use active census per sub-band:
#   (m_b,v): 16/3 ; (m_c,m_b): 10/3 ; (m_s,m_c): 2 ; (Λ,m_s): 5/3
# but that needs the sub-band log-widths (scale ratios), not available cleanly.
# Report the census-weighted average vs flat 16/3:
print("=== is 16/3-flat-across-(Λ,v) the over-count? ===")
print("confband flat 16/3 -> 128/27 =", mp.nstr(kappa*F(16,3)*confRung,15))
print("If proper staircase, the conf band average census < 16/3, so confband < 128/27,")
print("=> 7179/54 too HIGH => endpoint too HIGH. That's the SAME sign as banked (+0.064).")
print("=> correcting BOTH C (down 0.65) and conf-band (down) moves further BELOW. NOT compensating.")
