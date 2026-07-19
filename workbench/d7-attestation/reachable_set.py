import mpmath as mp
mp.mp.dps = 30
pi = mp.pi
kap = 1/(3*pi)
L_m01 = mp.mpf('8.15406111272')
L_mb  = mp.mpf('-4.08930665')
L_b0  = mp.mpf('1.73372875')
L_b2  = mp.mpf('-1.0887237')
def bandScreen(c, L): return kap*c*L

base = mp.mpf(7179)/54                 # confinement waypoint (high band) -- undressed
lep  = bandScreen(2, L_m01)            # census-conserving lepton tail screen (low)
run  = kap*((mp.mpf(7)/3)*L_mb + (mp.mpf(11)/3)*L_b0 - (mp.mpf(5)/3)*L_b2)  # quark freeze-out running (low)
r16  = mp.mpf(16)/9                    # kappa*conf-rung, cutPi cancelled (rational)
recomposed = base + lep + run + r16
print("base(7179/54)=", base, " lep=", lep, " run=", run, " r16(16/9)=", r16)
print("recomposedEndpoint =", recomposed)
print()
# fold-FORCED weight is UNIFORM depthWeight=1/3 => dressing multiplies a screening term by 3/2 (adds 0.5*term)
terms = {'lep':lep, 'run':run, 'r16':r16}
lo, hi = mp.mpf('137.007'), mp.mpf('137.055')
print("=== every UNIFORM (3/2) dressing of a SUBSET of low-tail screening terms ===")
print("(base 7179/54 always undressed = high waypoint; fold forces the SAME 3/2 on any dressed term)")
import itertools
keys = list(terms)
hits = []
for r in range(len(keys)+1):
    for combo in itertools.combinations(keys, r):
        val = recomposed + sum(mp.mpf('0.5')*terms[k] for k in combo)
        inwin = lo <= val <= hi
        tag = "  <-- IN [137.007,137.055]" if inwin else ""
        if inwin: hits.append(combo)
        print(f"  dress {str(combo):30s}: {mp.nstr(val,10)}{tag}")
print()
print("subsets landing in [137.007,137.055]:", hits if hits else "NONE")
print()
print("=> The window falls in the GAP between 136.234 (dress run) and 137.099 (dress lep+run).")
print("=> Unreachable by any UNIFORM fold-forced dressing. Hitting it needs FRACTIONAL / per-term")
print("   dressing = a per-band-varying weight = the tuning LowTailFoldForcedWeight (3643441) proved")
print("   the fold KILLS ('per-band variation is a knob the fold KILLS; the only motive is a FIT').")
