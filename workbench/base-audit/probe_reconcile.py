from fractions import Fraction as F
import mpmath as mp
mp.mp.dps = 50
pi = mp.pi; kappa = 1/(3*pi)

# shape numerals
q = 1/mp.sqrt(2); p = mp.cos(mp.mpf(2)/9); w = mp.sqrt(2); r = mp.sqrt(3-3*p**2)
b0=1+w*p; b1=1-w*(p+r)/2; b2=1-w*(p-r)/2
mass0=b0**2; mass1=b1**2; mass2=b2**2
mbRatio=(1-q)**2/(3*(1+q))
L_mb=mp.log(mbRatio); L_b0=mp.log(mass0); L_b2=mp.log(mass2); L_m01=mp.log(mass0/mass1)
confRung = 8*pi/3

print("=== (1) BASE decomposition ===")
print("2425/18 = 7179/54 + 16/9 :", F(2425,18)==F(7179,54)+F(16,9))
print("7179/54 = 6923/54 + 128/27:", F(7179,54)==F(6923,54)+F(128,27))
print()

print("=== (2) confBand LOCKED by way-point ===")
print("confBand = kappa*(16/3)*confRung = 128/27 :", mp.nstr(kappa*F(16,3)*confRung,16), "vs", float(F(128,27)))
print("  -> census 16/3 is the way-point-forced FULL census; changing it breaks 7179/54 (banked adjudicator).")
print()

print("=== (3) gem = light-edge screening of the SAME confinement rung ===")
# cutLog(downConfBundle*bMass2) = L_mb + confRung + L_b2   (confRung = cutLog confBandRatio)
lhs = mp.log((mbRatio/mp.exp(-confRung))*mass2)
rhs = L_mb + confRung + L_b2
print("cutLog(downConfBundle*bMass2) =", mp.nstr(lhs,16))
print("L_mb + confRung + L_b2        =", mp.nstr(rhs,16), " identity holds:", mp.nstr(abs(lhs-rhs),3))
print("gem(banked census 2)   = kappa*2*confRung   = 16/9  :", mp.nstr(kappa*2*confRung,16), "vs", float(F(16,9)))
print("gem(active census 5/3) = kappa*(5/3)*confRung = 40/27:", mp.nstr(kappa*F(5,3)*confRung,16), "vs", float(F(40,27)))
print()

print("=== (4) the base's gem census IS the N574 light-band census ===")
print("banked gem uses census 2   = censusLightBand = bandCensus[u,d,s] (PLATEAU)")
print("N574   gem uses census 5/3 = bandCensus[u,d]  (ACTIVE-SPAN, s decoupled below m_s)")
print("base drop 16/9 -> 40/27 =", F(16,9)-F(40,27), "= 8/27 =", float(F(8,27)))
print()

print("=== (5) DIRECTION: correcting toward active-span moves DOWN (both C and base) ===")
def dressed(wb,wc,wl):
    # E_dressed = 6923/54 + confBand(128/27, LOCKED) + gem(kappa*wl*confRung) 
    #            + (3/2)*kappa*[2*L_m01 + (wb-wc+wl)*L_mb + wb*L_b0 + (-wb+wl)*L_b2]
    gem = kappa*wl*confRung
    logpart = 2*L_m01 + (wb-wc+wl)*L_mb + wb*L_b0 + (-wb+wl)*L_b2
    return float(F(6923,54)) + float(F(128,27)) + gem + float(F(3,2))*kappa*logpart
banked = dressed(F(11,3),F(10,3),F(2))
n574   = dressed(F(10,3),F(2),F(5,3))
measured = mp.mpf('137.035999')
print("banked plateau  :", mp.nstr(banked,16), " delta=", mp.nstr(banked-measured,4), "(ABOVE)")
print("N574 active-span:", mp.nstr(n574,16), " delta=", mp.nstr(n574-measured,4), "(BELOW)")
print("banked - n574   =", mp.nstr(banked-n574,6), "> 0  (active-span strictly below banked)")
print()
print("=> measured is BRACKETED between the two conventions; neither single convention hits it.")
print("=> landing exact requires MIXING conventions per-edge = a FIT (forbidden).")
