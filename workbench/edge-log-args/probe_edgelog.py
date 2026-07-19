from fractions import Fraction as F
import mpmath as mp
mp.mp.dps = 50
pi = mp.pi; kappa = 1/(3*pi)
q = 1/mp.sqrt(2); p = mp.cos(mp.mpf(2)/9); w = mp.sqrt(2); r = mp.sqrt(3-3*p**2)
b0=1+w*p; b1=1-w*(p+r)/2; b2=1-w*(p-r)/2
mass0=b0**2; mass1=b1**2; mass2=b2**2
mbRatio=(1-q)**2/(3*(1+q))
L_mb=mp.log(mbRatio); L_b0=mp.log(mass0); L_b2=mp.log(mass2)
confRung = 8*pi/3                       # = ln(v/Lambda)
measured = mp.mpf('137.035999084')

print("=== (1) edge ratio mbRatioDerived and its cutLog ===")
print("mbRatioDerived =", mp.nstr(mbRatio,10), "  L_mb =", mp.nstr(L_mb,10))
print()

print("=== (2) verify the three edge cutLog decompositions ===")
# rb = mbRatio*(mass0/mass2); cutLog = L_mb + L_b0 - L_b2
# rc = 1/mbRatio;             cutLog = -L_mb
# rl = downConfBundle*mass2 = mbRatio*(v/L)*mass2; cutLog = L_mb + 8pi/3 + L_b2
Lrb = L_mb + L_b0 - L_b2
Lrc = -L_mb
Lrl = L_mb + confRung + L_b2
print("cutLog rb = L_mb+L_b0-L_b2 =", mp.nstr(Lrb,10))
print("cutLog rc = -L_mb          =", mp.nstr(Lrc,10))
print("cutLog rl = L_mb+8pi/3+L_b2=", mp.nstr(Lrl,10))
print()

print("=== (3) THE 8pi/3 CENSUS TALLY ACROSS THE ASSEMBLY ===")
print("The confinement rung 8pi/3 = ln(v/Lambda) appears in:")
print(" (a) confBand: kappa*(16/3)*(8pi/3) = 128/27  [derivedBandList, FULL charge census 16/3]")
print("     value:", mp.nstr(kappa*F(16,3)*confRung,12), "  =128/27:", float(F(128,27)))
print(" (b) light gem inside freeze-out staircase:")
print("     kappa*census_light*(8pi/3), where census_light appears in cutLog(rl)=...+8pi/3")
for name,c in [("plateau 2",F(2)),("active 5/3",F(5,3))]:
    print("     census =", name, ": kappa*c*(8pi/3) =", mp.nstr(kappa*float(c)*confRung,12))
print()

print("=== THE CENSUS-CONSERVATION PARTITION (banked census_completeness_closure) ===")
print("chargeTraceDepth 16/3 = freezeoutStaircaseCensus 10/3 + leptonCensus 2")
print("Meaning: full charge 16/3 = coloured-that-freezes-out 10/3 + singlet-that-survives 2")
print()
print("KEY: in the region (Lambda, v) the confBand screens at FULL 16/3 over the WHOLE span.")
print("But quarks freeze out inside (Lambda,v): the coloured 10/3 is NOT active all the way to Lambda.")
print("The freeze-out staircase re-screens the quark thresholds INSIDE (Lambda,v).")
print()

# The endpoint (N574 active-span composed): base(uses leptonTail @ 16/3) + freeze-out staircase
# invAlphaZero(completeBandList d) = 190/3 + kappa*d*cutLog(mass0/mass1), d = chargeTraceDepth 16/3
# 190/3 = 42 + 448/27[top,16/3] + 128/27[conf,16/3]
Lm01 = mp.log(mass0/mass1)
def base_endpoint(d):
    return float(F(190,3)) + kappa*float(d)*Lm01
print("=== BASE ENDPOINT invAlphaZero(completeBandList d) = 190/3 + kappa*d*cutLog(mass0/mass1) ===")
print(" at d=16/3 (chargeTraceDepth, FULL):", mp.nstr(base_endpoint(F(16,3)),12))
print(" at d=2    (leptonCensus, singlet) :", mp.nstr(base_endpoint(F(2)),12))
print(" removal (coloured on lepton edge) :", mp.nstr(base_endpoint(F(16,3))-base_endpoint(F(2)),12))
print("   = kappa*(10/3)*cutLog(mass0/mass1) =", mp.nstr(kappa*F(10,3)*Lm01,12))
