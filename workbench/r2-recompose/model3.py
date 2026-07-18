import mpmath as mp
mp.mp.dps = 40
pi = mp.pi
kappa = 1/(3*pi)   # = 1/(3π); note bandScreen = kappa*census*log(ratio) = census/(3π)*log

# The recombined two-channel ceiling: 42 + 70 = 112, sin2=3/8.
# Above confinement: full charge census 16/3. Way-points:
#   at v (top band):  112 + kappa*(16/3)*(28pi/3) = 112 + 448/27  = 1582/27 + 70 = 128.5926
#   at Λ (conf band): +kappa*(16/3)*(8pi/3) = +128/27           = 190/3  + 70 = 133.3333
ceil = mp.mpf(112)
def bandscreen(c, L): return kappa*c*L
L_top=28*pi/3; L_conf=8*pi/3
ew = ceil + bandscreen(mp.mpf(16)/3, L_top)
conf = ew + bandscreen(mp.mpf(16)/3, L_conf)
print("recombined at v   =", ew, "  (=1582/27+70)")
print("recombined at Λ   =", conf, "  (=190/3 +70)")

# ====== DECOUPLING BELOW Λ: quarks CONFINE (removed), only leptons run ======
# The confined quark content is REMOVED (not added). Below Λ the census is the leptonic em census.
# Charged leptons e,μ,τ: em census ΣQ² = 3 (Q=1 each, no colour).
# The lepton tail spans Λ down through the three lepton masses.
# banked: cutLog(mass0/mass1) ~ 8.154 (m0/m1, the extreme lepton ratio in D7's tower)

# But decoupling is STEPWISE: each lepton decouples at its mass. Standard leptonic Δ(1/α):
#   Δ = (2/3π) Σ_l ln(Λ/m_l)   [each charged lepton, Q²=1]
#     = kappa * Σ_l ln(Λ/m_l)  ... wait kappa=1/3π so (2/3π)=2*kappa; hmm sign/factor
# Actually bandScreen uses kappa*census*log; for census=1 per lepton over its own band.
# Let me just check: what leptonic census over L_lep=8.154 reproduces 137.036 - 133.333 = 3.703?
L_lep = mp.mpf('8.154061112580743509671544826723377757635')
c_land = (mp.mpf('137.035999') - conf)/(kappa*L_lep)
print("\nbelow Λ: need census", c_land, "over L_lep=8.154 to reach 137.036")
print("  candidates: leptonic ΣQ²=3 ->", conf+bandscreen(3,L_lep))
print("              charge 16/3   ->", conf+bandscreen(mp.mpf(16)/3,L_lep), "(=137.9476, the additive over)")
print("              hyper 10/3    ->", conf+bandscreen(mp.mpf(10)/3,L_lep))
print("              4             ->", conf+bandscreen(4,L_lep))

# ====== Alternative: leptons keep the RECOMBINED census but with decoupling of the ISOSPIN ======
# Below v, isospin decoupled: the surviving em census on the whole descent below v is REDUCED.
# net em census below v = chargeDepth - (isospin em contribution)?
# Q=T3+Y, below v photon couples Q. Iso decoupling doesn't remove Q-charge.
# Try: the full tower 137.9476 MINUS the gather self-census anti-screening (s=1/8) removal
# applied as decoupling of the isospin self-census below v:
Sig_below_v = L_conf + L_lep   # isospin active only above v; below v its self-census removed... 
# actually gather self-census RUNS with iso; iso active 42->v only:
antiscreen_topband = kappa*(mp.mpf(1)/8)*L_top     # s on the band where iso is active (above v)
print("\n=== gather self-census (anti-screen) as running content of iso, active 42->v only ===")
print("  removed from top band:", antiscreen_topband)
print("  BUT this would move the EW way-point 1582/27! (adjudicator FAIL)")

# The way-points REQUIRE full 16/3 on top+conf bands. So iso self-census can't reduce those.
# => the s=1/8 anti-screening must live BELOW Λ (where way-points are already passed).
print("\n=== s-anti-screen placed BELOW the conf way-point (way-points preserved) ===")
for Lspan,label in [(L_lep,"lepton tail only"),(L_conf+L_lep,"conf+lepton")]:
    val = conf + bandscreen(mp.mpf(16)/3,L_lep) - kappa*(mp.mpf(1)/8)*Lspan
    print(f"  additive 137.9476 - s-antiscreen over {label}: {mp.nstr(val,12)}")
