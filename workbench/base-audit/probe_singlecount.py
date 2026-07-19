from fractions import Fraction as F
import mpmath as mp
mp.mp.dps = 50
pi = mp.pi; kappa = 1/(3*pi)
q = 1/mp.sqrt(2); p = mp.cos(mp.mpf(2)/9); w = mp.sqrt(2); r = mp.sqrt(3-3*p**2)
b0=1+w*p; b1=1-w*(p+r)/2; b2=1-w*(p-r)/2
mass0=b0**2; mass1=b1**2; mass2=b2**2
mbRatio=(1-q)**2/(3*(1+q))
L_mb=mp.log(mbRatio); L_b0=mp.log(mass0); L_b2=mp.log(mass2); L_m01=mp.log(mass0/mass1)
confRung = 8*pi/3
measured = mp.mpf('137.035999084')

# ------------------------------------------------------------------
# BANKED structure (dressed), decomposed to isolate the confinement rung:
#   E = 6923/54 + [confBand: k*(16/3)*confRung]  +  [gem: k*wl*confRung]
#       + (3/2)*k*[2*L_m01 + (wb-wc+wl)*L_mb + wb*L_b0 + (-wb+wl)*L_b2]
# where the gem's confRung = the light edge's confBundle^-1 factor.
# So the confinement rung confRung is screened by census (16/3) [confBand] + wl [gem].
# ------------------------------------------------------------------
def E(wb,wc,wl, confcensus, dress=F(3,2)):
    confBand = kappa*confcensus*confRung
    gem      = kappa*wl*confRung
    logpart  = 2*L_m01 + (wb-wc+wl)*L_mb + wb*L_b0 + (-wb+wl)*L_b2
    return float(F(6923,54)) + confBand + gem + float(dress)*kappa*logpart

print("measured ~", measured); print()
print("BANKED (plateau C, confBand 16/3):", mp.nstr(E(F(11,3),F(10,3),F(2),F(16,3)),16), " d=", mp.nstr(E(F(11,3),F(10,3),F(2),F(16,3))-measured,4))
print("N574   (active C, confBand 16/3): ", mp.nstr(E(F(10,3),F(2),F(5,3),F(16,3)),16), " d=", mp.nstr(E(F(10,3),F(2),F(5,3),F(16,3))-measured,4))
print()
print("=== SINGLE-COUNT: confinement rung carried ONCE ===")
print("Reading: the flat confBand double-counts the rung already carried by the light gem.")
print("The census-conserving descent carries the rung by (singlet that survives whole span)")
print("plus coloured only in active sub-bands. Test dropping the redundant confBand census.")
print()
# scenario S1: confBand census reduced to the SINGLET 2 (the part surviving to Λ);
#   coloured 10/3 lives only in the staircase logs, gem uses wl.
print("S1 confBand->singlet 2, plateau C:", mp.nstr(E(F(11,3),F(10,3),F(2),F(2)),16), " d=", mp.nstr(E(F(11,3),F(10,3),F(2),F(2))-measured,4))
print("S1 confBand->singlet 2, active  C:", mp.nstr(E(F(10,3),F(2),F(5,3),F(2)),16), " d=", mp.nstr(E(F(10,3),F(2),F(5,3),F(2))-measured,4))
print()
# scenario S2: remove gem entirely (light edge has no confBundle^-1 factor), confBand full 16/3
def E2(wb,wc,wl, confcensus):
    confBand = kappa*confcensus*confRung
    # light edge WITHOUT the 8pi/3: rl_phys = mbRatio*mass2, cutLog = L_mb + L_b2 (no +confRung)
    logpart  = 2*L_m01 + (wb-wc+wl)*L_mb + wb*L_b0 + (-wb+wl)*L_b2
    return float(F(6923,54)) + confBand + float(F(3,2))*kappa*logpart
print("S2 no-gem (light edge = mbRatio*mass2), plateau C:", mp.nstr(E2(F(11,3),F(10,3),F(2),F(16,3)),16), " d=", mp.nstr(E2(F(11,3),F(10,3),F(2),F(16,3))-measured,4))
print("S2 no-gem, active C:", mp.nstr(E2(F(10,3),F(2),F(5,3),F(16,3)),16), " d=", mp.nstr(E2(F(10,3),F(2),F(5,3),F(16,3))-measured,4))
