import mpmath as mp
mp.mp.dps = 30
pi = mp.pi
kap = 1/(3*pi)
L_m01 = mp.mpf('8.15406111272')
L_mb  = mp.mpf('-4.08930665')
L_b0  = mp.mpf('1.73372875')
L_b2  = mp.mpf('-1.0887237')

# recomposedEndpoint normal form = 2425/18 + kap*C  (banked D7CompositionAttestation)
base = mp.mpf(2425)/18
C = 2*L_m01 + (mp.mpf(7)/3)*L_mb + (mp.mpf(11)/3)*L_b0 - (mp.mpf(5)/3)*L_b2
kapC = kap*C
recomposed = base + kapC
print("2425/18 =", base)
print("kap*C (screening term) =", kapC)
print("recomposedEndpoint =", recomposed, "(matches banked 136.307)")
print()
# v2 frame: fold-forced depth SERIES on kap*C, weight w=depthWeight=1/3
w = mp.mpf(1)/3
print("=== v2 frame: fold-forced depth series dressing of kap*C at w=1/3 ===")
# partial-sum ADDED ratios (w + w^2 + ... up to depth d)
def added(dmax):  # depth 2..dmax => powers 1..(dmax-1)
    return sum(w**k for k in range(1, dmax))
for (label, ratio) in [("depth2 (w)", w),
                        ("depth2+3 (4/9)", w+w**2),
                        ("depth2+3+4 (13/27)", w+w**2+w**3),
                        ("all-orders cap (1/2)", w/(1-w))]:
    val = recomposed + ratio*kapC
    print(f"  {label:24s}: +{float(ratio*kapC):.4f} -> {mp.nstr(val,10)}")
print()
print("measured 1/alpha(0) = 137.035999 [REMOVABLE PROSE] sits between depth2+3 and depth2+3+4")
print()
print("*** THE HONEST FOLD-FORCED ALL-ORDERS CLOSED FORM = 137.10 (the convergent series summed).")
print("    Landing INTERIOR (137.036) requires TRUNCATING the convergent series at a hand-picked")
print("    depth, OR band-varying weights. The fold gives NO reason to truncate a convergent")
print("    geometric series; band-varying = the fit LowTailFoldForcedWeight (3643441) proved forbidden.")
print("    => v2 frame gives the SAME honest answer as the subset frame: fold-forced = ~137.10;")
print("       interior 137.036 is reachable ONLY by tuning.")
