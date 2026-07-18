import mpmath as mp
mp.mp.dps=40
pi=mp.pi
q=mp.cos(pi/4)
mbRatio=(1-q)**2/(3*(1+q))
confBundle=mp.e**(-8*pi/3)
kappa=1/(3*pi)
pB=mp.cos(mp.mpf(2)/9); wB=mp.sqrt(2); rB=mp.sqrt(3-3*pB*pB)
b0=1+wB*pB; b2=1-wB*(pB-rB)/2
mass0=b0**2; mass2=b2**2
downConfBundle=mbRatio/confBundle
rb=mbRatio*(mass0/mass2); rc=1/mbRatio; rl=downConfBundle*mass2
Lb=mp.log(rb); Lc=mp.log(rc); Ll=mp.log(rl)

# plateau-census weights (what the freeze-out uses)
wb_p, wc_p, wl_p = mp.mpf(11)/3, mp.mpf(10)/3, mp.mpf(2)
Sfz_plateau = kappa*(wb_p*Lb + wc_p*Lc + wl_p*Ll)

# Jacobi eight-square r8(n) = 16 * sigma_3*(n)  where sigma_3*(n) = sum_{d|n} (-1)^(n+d) d^3
def sigma3star(n):
    s=0
    for d in range(1,n+1):
        if n % d == 0:
            s += ((-1)**(n+d)) * d**3
    return s
def r8(n): return 16*sigma3star(n)

print("Jacobi eight-square r8(n) for n=0..8:")
print("  r8(0)=1 (convention), ", [r8(n) for n in range(1,9)])
print("  floor r8(1) =", r8(1), " (D2e floorOccupancy_eq_sixteen = 16, matches)")
print()

# The parent claims 'Born-weight modulation' would REPLACE the plateau censuses (11/3,10/3,2)
# with per-level Born occupancies. But that is a category leap - the census weights are
# generation/charge counts (rationals 11/3 etc), the r8(n) are integer lattice degeneracies (16,112,...).
# There is NO derived map identifying them. Show what any positive reweighting does to the magnitude:
print("MAGNITUDE INVARIANT (the marquee): for ANY nonneg weights the freeze-out is BOUNDED by kappa*(sum w)*max cutLog:")
R = max(rb,rc,rl,mp.mpf(1)+mp.mpf('1e-9'))  # rb<1 actually; the bound in Lean assumes edges>1
print("  edges: rb=",float(rb)," rc=",float(rc)," rl=",float(rl))
print("  NOTE rb<1 so cutLog rb<0 (bottom SUBTRACTS). Bound theorem assumes edges>1; here mixed signs.")
print()
print("  plateau-census freeze-out  S_fz =", float(Sfz_plateau))
print("  |per-band| magnitudes:", float(kappa*wb_p*abs(Lb)), float(kappa*wc_p*abs(Lc)), float(kappa*wl_p*abs(Ll)))
print()
# If one (wrongly) used r8-type integer weights scaled to census total 9, magnitude still O(kappa*9*log):
# demonstrate the invariant: total-census-9 conserving reweight keeps the same ceiling
for (wb,wc,wl,label) in [(wb_p,wc_p,wl_p,"plateau 11/3,10/3,2 (sum 9)"),
                          (mp.mpf(3),mp.mpf(3),mp.mpf(3),"equal 3,3,3 (sum 9)"),
                          (mp.mpf(5),mp.mpf(3),mp.mpf(1),"skew 5,3,1 (sum 9)")]:
    S = kappa*(wb*Lb+wc*Lc+wl*Ll)
    print(f"  reweight {label}: S_fz = {float(S):+.5f}")
print()
print("=> ANY census-9-conserving reweighting stays O(1); the freeze-out CANNOT be the ~137-scale")
print("   missing bulk. The parent named 'Born-weight modulation of the freeze-out' as the ONE")
print("   missing summand, but banked FreezeoutComposition.composed_bounded ALREADY proved the")
print("   freeze-out (under ANY census weighting) is bounded by kappa*9*cutLog R. Mis-selection.")
