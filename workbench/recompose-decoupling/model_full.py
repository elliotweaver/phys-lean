import mpmath as mp
mp.mp.dps = 50
pi = mp.pi
kappa = 1/(3*pi)
def bs(c,L): return kappa*c*L
L_top = 28*pi/3    # cutLog(topBandRatio)
L_conf = 8*pi/3    # cutLog(confBandRatio)
# lepton tail log (banked bracket for mass0/mass1: [1e9/288575, 1e9/286902])
# cutLog of that ratio, from banked cutLog_lo_s6/hi_s6 ~ 8.15406111127...
L_lep = mp.mpf('8.15406111272')/1  # placeholder mid
chg = mp.mpf(16)/3

# ---- THE RECOMPOSED CENSUS-CONSERVING ENDPOINT (owner architecture) ----
# recombined EW way-point (both channels, top band): 112 + bandScreen(16/3, top) = 1582/27 + 70
ew = mp.mpf(1582)/27 + 70
# conf band (v->Λ, full charge census both active): + bandScreen(16/3, conf) => 190/3 + 70
conf = mp.mpf(190)/3 + 70
print("recombined EW way-point 1582/27+70 =", ew)
print("recombined conf way-point 190/3+70 =", conf, " (= ew + 128/27)")

# freeze-out tail (decoupling-as-removal: censuses step DOWN 11/3,10/3,2 through quark thresholds)
# edge ratios rb,rc,rl banked as brackets. Use representative mid values from banked numerals.
# rb ~ downConfBundle-ish, rc, rl. For DIRECTION check use rough values.
# The freeze-out screens UP (positive). Bounded by kappa*9*cutLog R.
# lepton tail: census leptonCensus = 2 (census-conserving)
lep = bs(2, L_lep)
print("\nlepton-tail screening bandScreen(2, m0/m1) =", lep)

# Representative freeze-out (edges are ratios >1; rough magnitudes):
# Use small illustrative logs since freeze-out is bounded/log-small
for (rb,rc,rl,label) in [(mp.e**0.5, mp.e**0.5, mp.e**0.5,"logs=0.5 each"),
                          (mp.e**1.0, mp.e**1.0, mp.e**1.0,"logs=1.0 each"),
                          (mp.e**1.5, mp.e**1.2, mp.e**0.8,"varied")]:
    fz = bs(mp.mpf(11)/3, mp.log(rb)) + bs(mp.mpf(10)/3, mp.log(rc)) + bs(2, mp.log(rl))
    endpoint = conf + fz + lep
    print(f"  freeze-out {label}: fz={float(fz):.4f}  endpoint(conf+fz+lep)={float(endpoint):.4f}")

print("\nadditive recombined endpoint (banked) = 137.9476 (OVERSHOOT +0.91)")
print("census-conserving high-bands+lepton (no freezeout) =", float(conf+lep), "(UNDERSHOOT)")
print("=> freeze-out screens UP from undershoot toward measured 137.036 (ONE-LAW-correct direction)")
print("\nmeasured 1/alpha(0)=137.035999 [REMOVABLE PROSE]")
print("freeze-out edge ratios rb,rc,rl banked only ~6 sig digits (quark mass R-descent) => 15-digit numeral RNYF")
