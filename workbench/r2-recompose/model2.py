import mpmath as mp
mp.mp.dps = 40
pi = mp.pi
kappa = 1/(3*pi)
# ---- edges (banked exact logs) ----
L_top  = 28*pi/3     # octonion(42) -> electroweak(v)
L_conf = 8*pi/3      # electroweak(v) -> confinement(Lambda)
# lepton tail log from D7 anchor (banked bracket)
D7 = mp.mpf('67.9475880261'); wp_conf = mp.mpf(190)/3; chargeDepth = mp.mpf(16)/3
L_lep = (D7 - wp_conf)/(kappa*chargeDepth)   # ~8.154

isoDepth = mp.mpf(2); hyperDepth = mp.mpf(10)/3
s = mp.mpf(1)/8   # projectedS anti-screening (gather self-census, one depth)

def screen(c, L): return kappa*c*L

print("=== KEY QUESTION: what does 'decoupling = removal' give below each M-edge? ===\n")

# The frame: two channels run 42->read with net census; recombine 1/aem = 1/a2 + 1/aY.
# Above confinement: full charge census 16/3 (way-points preserved).
# Below confinement (lepton tail): colored content decoupled.

# Way-point reproduction check (SAME pipeline, high bands full census):
ew  = 42 + 70 + screen(chargeDepth, L_top)          # recombined at v
conf= ew + screen(chargeDepth, L_conf)              # recombined at Lambda
print("recombined EW  (should=1582/27+70=128.5926):", ew, "  match:", abs(ew-(mp.mpf(1582)/27+70))<mp.mpf('1e-30'))
print("recombined conf(should=190/3 +70=133.3333):", conf)
print("  [these are ABOVE all decoupling edges -> full census -> way-points FREE. ADJUDICATOR ok]\n")

# --- additive frame (current, wrong): full 16/3 on lepton tail + freeze-out ADDED ---
add = conf + screen(chargeDepth, L_lep)
print("ADDITIVE read (full 16/3 lepton tail)          :", add, " (overshoot +", add-mp.mpf('137.036'),")")

# --- anti-screening as running content of isospin channel (netIsoDepth=2-s across whole descent) ---
# net em census = chargeDepth - s = 16/3 - 1/8 on EVERY band iso runs. But iso decouples below v!
# So the s-reduction only applies where the isospin channel is active = ABOVE v (top band).
print("\n=== isospin gather self-census is RUNNING content, but ISOSPIN DECOUPLES below v (W/Z massive) ===")
# Above v: em census reduced by s (iso active). Below v: iso decoupled, only photon (em) runs.
ew_anti = 42 + 70 + screen(chargeDepth - s, L_top)   # s reduces only top band (iso active above v)
print("recombined EW with iso self-census on top band :", ew_anti, " (removed", ew-ew_anti,"= kappa*s*L_top)")
# but way-point 1582/27 uses full 16/3... so the s-reduction MOVES the EW way-point? check:
print("  -> if s reduces top band, EW reading =", ew_anti, "!=", ew, " => would MOVE way-point (BAD)")

# If instead s applies to WHOLE descent (bolt-on style): removes kappa*s*(L_top+L_conf+L_lep)
Sig = L_top+L_conf+L_lep
anti_whole = add - screen(s, Sig)
print("bolt-on/whole-descent anti-screen read         :", anti_whole, " (=137.339, +", anti_whole-mp.mpf('137.036'),")")

print("\n=== decoupling below confinement: census drops from 16/3 to leptonic ===")
for c_lep in [mp.mpf(3), mp.mpf(4), mp.mpf(16)/3, mp.mpf(11)/3, mp.mpf(10)/3, mp.mpf(2)]:
    r = conf + screen(c_lep, L_lep)
    print(f"  lepton-tail census {str(mp.nstr(c_lep,5)):>7}: read = {mp.nstr(r,10)}  (vs measured 137.036)")

print("\n=== what census below conf would land at 137.036? (DIAGNOSTIC, not a fit target) ===")
c_needed = (mp.mpf('137.036') - conf)/(kappa*L_lep)
print("  c_needed =", c_needed, " -> not a clean derived number => needs stepwise threshold decoupling")
