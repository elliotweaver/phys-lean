from fractions import Fraction as F

# Banked, foundations-only facts:
#   endpoint(f) = 2425/18 + f * S,  S = kappaLeading*C_inner (low-tail loop-running term at depth-1)
base = F(2425, 18)
bare = F(136307188, 1000000)          # DEF-A no-dressing (f=1)  owner: -0.729 from measured
allorders = F(1370996710997, 10**10)  # DEF-B all-orders 3/2 (f=3/2) owner: +0.064 from measured

S = bare - base
print("base 2425/18         =", float(base))
print("S (screening at f=1) =", float(S))
print("base + 3/2*S         =", float(base + F(3,2)*S), " (banked all-orders endpoint ~137.0997)")

w = F(1,3)
S1=F(1); S2=1+w; S3=1+w+w**2; S4=1+w+w**2+w**3; Sinf=1/(1-w)
print()
print("Geometric partial sums at fold-forced w=1/3:")
for n,v in [("S1 depth1",S1),("S2 depth2",S2),("S3 depth3",S3),("S4 depth4",S4),("Sinf all-orders",Sinf)]:
    print("  %-16s = %-8s = %.6f" % (n, str(v), float(v)))

measured = F(137036,1000)
f_meas = (measured - base)/S
print()
print("Effective factor reproducing MEASURED 137.036: f =", f_meas, "=", "%.6f"%float(f_meas))
print("  S3 < f_meas < S4 ?  %.4f < %.6f < %.4f  -> %s" % (float(S3), float(f_meas), float(S4), (S3<f_meas<S4)))
print("  forced all-orders 3/2 inside window (S3,S4)? ->", (S3<Sinf<S4))
print("  3/2 (%.6f) > S4 (%.6f)? -> %s  [is forced answer ABOVE the window?]" % (float(Sinf), float(S4), Sinf>S4))
